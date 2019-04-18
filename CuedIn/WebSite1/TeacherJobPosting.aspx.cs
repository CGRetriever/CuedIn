using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class TeacherJobPostings : System.Web.UI.Page
{

    public String jobTitle = "";
    public String jobDescription = "";
    public String jobType = "";
    public String jobLocation = "";
    public DateTime jobDeadline = DateTime.Today;
    public int numOfApplicants = 0;
    public String orgName = "";
    public String orgDescription = "";
    public String orgImage = "";

    protected void Page_Load(object sender, EventArgs e)
    {


        ((Label)Master.FindControl("lblMaster")).Text = "Job Cards";
        ((Label)Master.FindControl("lblMaster")).Attributes.Add("Style", "color: #fff; text-align:center; text-transform: uppercase; letter-spacing: 6px; font-size: 2.0em; margin: .67em");


    }







    protected void jobPostingTable_Load(object sender, EventArgs e)
    {
        //Session["schoolID"] = 12;

        if (!IsPostBack)
        {
            String s = " ";
            displayTable(sender, e, s);
        }




    }

    public void referralButton_Click(object sender, CommandEventArgs e)
    {
        int jobListingID = Convert.ToInt32(e.CommandArgument);
        String connectionString = System.Configuration.ConfigurationManager.ConnectionStrings["DBConnectionString"].ConnectionString;
        System.Data.SqlClient.SqlConnection sc = new System.Data.SqlClient.SqlConnection(connectionString);
        sc.Open();

        System.Data.SqlClient.SqlCommand pullJobInfo = new System.Data.SqlClient.SqlCommand();
        pullJobInfo.CommandText = "SELECT JobListing.JobTitle, JobListing.JobDescription, JobListing.JobType, JobListing.Location, JobListing.Deadline, Organization.OrganizationName FROM JobListing INNER JOIN Organization ON JobListing.OrganizationID = Organization.OrganizationEntityID WHERE JobListing.JobListingID = " + jobListingID;
        pullJobInfo.Connection = sc;

        System.Data.SqlClient.SqlDataReader reader = pullJobInfo.ExecuteReader();

        while (reader.Read())
        {
            String jobTitle = reader.GetString(0);
            String orgName = reader.GetString(5);
        }

        lblJobTitle.Text = jobTitle;
        lblOrgName.Text = orgName;

        //ClientScript.RegisterStartupScript(this.GetType(), "Pop", "openSendToModal();", true);

    }

    public void sendToButton_Click(object sender, EventArgs e)
    {
        List<int> studentIDList = new List<int>();
        for (int i = 0; i < gridviewRefer.Rows.Count; i++)
        {
            CheckBox check = (CheckBox)gridviewRefer.Rows[i].FindControl("studentCheck");


            ((Label)Master.FindControl("lblMaster")).Text = "Approved Jobs";


            if (check.Checked)
            {
                int studentID = Convert.ToInt32(gridviewRefer.DataKeys[i]["StudentEntityID"]);
                studentIDList.Add(studentID);
            }

        }
        String connectionString = System.Configuration.ConfigurationManager.ConnectionStrings["DBConnectionString"].ConnectionString;
        System.Data.SqlClient.SqlConnection sc = new System.Data.SqlClient.SqlConnection(connectionString);
        sc.Open();

        System.Data.SqlClient.SqlConnection EmailQuery = new System.Data.SqlClient.SqlConnection(connectionString);
        List<String> emailList = new List<String>();
        // Mail Button Query
        EmailQuery.Open();
        System.Data.SqlClient.SqlCommand query = new System.Data.SqlClient.SqlCommand();
        query.Connection = EmailQuery;

        foreach (var studentID in studentIDList)
        {
            query.CommandText = "SELECT UserEntity.EmailAddress FROM UserEntity INNER JOIN Student ON UserEntity.UserEntityID = Student.StudentEntityID WHERE Student.StudentEntityID=" + studentID;
            System.Data.SqlClient.SqlDataReader Result = query.ExecuteReader();

            while (Result.Read())
            {
                String email = Result.GetString(0);
                emailList.Add(email);

            }

        }
        EmailQuery.Close();



    }

    public void applyChanges_click(object sender, EventArgs e)
    {
        //Declare a list of interest group IDS going to be string for easy use
        List<String> interestGroupList = new List<String>();

        //Loop through the list box and if it selected then add it to a list
        foreach (ListItem i in InterestGroupDrop.Items)
        {
            if (i.Selected == true)
            {
                //add to the list
                interestGroupList.Add(i.Value.ToString());
            }
        }

        //if something was selected then lets loop through the array and make the conditional string
        String condititionalIf = "OpportunityInterestGroups.InterestGroupID = ";

        //if all are selected, there is no need to loop. we want to see everything. 
        if (interestGroupList.Count == InterestGroupDrop.Items.Count)
        {
            condititionalIf = " ";
        }

        else if (interestGroupList.Count == 0)
        {
            condititionalIf = " ";
        }

        //there is something in the list, and it isn't all selected
        else if (interestGroupList.Count != 0)
        {

            //loop through the list
            for (int interestID = 0; interestID <= interestGroupList.Count - 1; interestID++)
            {
                //if the list is not the last index of the list we can add an or clause
                if (interestID != interestGroupList.Count - 1)
                {
                    condititionalIf += interestGroupList[interestID] + " or OpportunityInterestGroups.InterestGroupID = ";
                }
                else
                {
                    //if it is the last element in the list we have to cut off the sql statement
                    condititionalIf += interestGroupList[interestID];

                }

            }

        }
        //this is our condition....


        displayTable(sender, e, condititionalIf);

    }


    private void displayTable(object sender, EventArgs e, String s)
    {
        //initial set up...Counter for the number of rows, and 
        int countTotalJobs = 0;
        String connectionString = System.Configuration.ConfigurationManager.ConnectionStrings["DBConnectionString"].ConnectionString;
        System.Data.SqlClient.SqlConnection sc = new System.Data.SqlClient.SqlConnection(connectionString);
        sc.Open();

        System.Data.SqlClient.SqlCommand countJobPostings = new System.Data.SqlClient.SqlCommand();



        //This indicates that all interest groups were selected/default!
        if (s.Equals(" "))
        {
            //default
            countJobPostings.CommandText = "SELECT count( SchoolApproval.OpportunityEntityID) FROM OpportunityEntity INNER JOIN SchoolApproval ON " +
                "OpportunityEntity.OpportunityEntityID = SchoolApproval.OpportunityEntityID where OpportunityEntity.OpportunityType = 'JOB' and schoolApproval.approvedflag = 'Y'" +
                " and SchoolApproval.SchoolEntityID = " + Session["schoolID"];


        }
        //This indicates that there were some interest groups that were selected in the drop down menu
        else
        {
            //have to utilize distinct due to the nature of data duplication with interest groups. Cannot have two cards that are exactly the same
            countJobPostings.CommandText = "SELECT COUNT(DISTINCT OpportunityEntity.OpportunityEntityID) AS Expr1 FROM OpportunityEntity INNER JOIN " +
                "OpportunityInterestGroups ON OpportunityEntity.OpportunityEntityID = OpportunityInterestGroups.OpportunityEntityID INNER JOIN  " +
                "InterestGroups ON OpportunityInterestGroups.InterestGroupID = InterestGroups.InterestGroupID INNER JOIN " +
                "SchoolApproval ON OpportunityEntity.OpportunityEntityID = SchoolApproval.OpportunityEntityID WHERE(OpportunityEntity.OpportunityType = 'JOB') " +
                "AND(SchoolApproval.SchoolEntityID = 12) AND(SchoolApproval.ApprovedFlag = 'Y') and (" + s + ")";

        }

        String test = s;

        countJobPostings.Connection = sc;
        System.Data.SqlClient.SqlDataReader reader = countJobPostings.ExecuteReader();




        while (reader.Read())
        {
            countTotalJobs = reader.GetInt32(0);
        }

        sc.Close();




        sc.Open();


        System.Data.SqlClient.SqlCommand pullJobInfo = new System.Data.SqlClient.SqlCommand();

        if (s.Equals(" "))
        {
            pullJobInfo.CommandText = "SELECT  Organization.OrganizationName, JobListing.JobTitle, JobListing.JobDescription," +
            " Organization.Image, Organization.ExternalLink, JobListing.Location, JobListing.Deadline, JobListing.NumOfApplicants, Organization.OrganizationDescription," +
            " JobListing.JobListingID FROM SchoolApproval INNER JOIN OpportunityEntity ON SchoolApproval.OpportunityEntityID = OpportunityEntity.OpportunityEntityID INNER JOIN JobListing" +
            " ON OpportunityEntity.OpportunityEntityID = JobListing.JobListingID INNER JOIN Organization ON JobListing.OrganizationID = Organization.OrganizationEntityID " +
            "where SchoolApproval.ApprovedFlag = 'Y' and OpportunityEntity.OpportunityType = 'JOB' and SchoolApproval.SchoolEntityID = " + Session["schoolID"];

        }
        else
        {
            pullJobInfo.CommandText = "SELECT distinct Organization.OrganizationName, JobListing.JobTitle, JobListing.JobDescription, Organization.Image, " +
                "Organization.ExternalLink, JobListing.Location, JobListing.Deadline, JobListing.NumOfApplicants, Organization.OrganizationDescription, " +
                "JobListing.JobListingID FROM " +
                "SchoolApproval INNER JOIN OpportunityEntity ON SchoolApproval.OpportunityEntityID = OpportunityEntity.OpportunityEntityID INNER JOIN JobListing ON " +
                "OpportunityEntity.OpportunityEntityID = JobListing.JobListingID INNER JOIN Organization ON JobListing.OrganizationID = Organization.OrganizationEntityID INNER JOIN " +
                " OpportunityInterestGroups ON OpportunityEntity.OpportunityEntityID = OpportunityInterestGroups.OpportunityEntityID WHERE(SchoolApproval.ApprovedFlag = 'Y') AND OpportunityEntity.OpportunityType = 'JOB' and " +
                "(SchoolApproval.SchoolEntityID = 12) and (" + s + ")";

        }



        pullJobInfo.Connection = sc;



        reader = pullJobInfo.ExecuteReader();

        {
            int[] jobListingID = new int[countTotalJobs];
            String[] orgNameArray = new String[countTotalJobs];
            String[] jobTitleArray = new String[countTotalJobs];
            String[] jobDescriptionArray = new String[countTotalJobs];
            String[] imageArray = new string[countTotalJobs];
            String[] linkArray = new string[countTotalJobs];
            String[] jobLocationArray = new string[countTotalJobs];
            int[] numOfApplicantsArray = new int[countTotalJobs];
            String[] organizationDescriptionArray = new string[countTotalJobs];
            DateTime[] deadlineArray = new DateTime[countTotalJobs];


            int x = 0;
            while (reader.Read())
            {

                orgNameArray[x] = reader.GetString(0);
                jobTitleArray[x] = reader.GetString(1);
                jobDescriptionArray[x] = reader.GetString(2);
                imageArray[x] = reader.GetString(3);
                linkArray[x] = reader.GetString(4);
                jobLocationArray[x] = reader.GetString(5);
                deadlineArray[x] = reader.GetDateTime(6);
                numOfApplicantsArray[x] = reader.GetInt32(7);
                organizationDescriptionArray[x] = reader.GetString(8);
                jobListingID[x] = reader.GetInt32(9);
                x++;

            }
            sc.Close();
            double doubleRows = countTotalJobs / 3.0;
            int numrows = (int)(Math.Ceiling(doubleRows));
            int numcells = 3;
            int count = 0;
            for (int j = 0; j < numrows; j++)
            {
                TableRow r = new TableRow();


                for (int i = 0; i < numcells; i++)
                {
                    if (count == countTotalJobs)
                    {
                        break;
                    }
                    TableCell c = new TableCell();

                    LinkButton referralLink = new LinkButton();
                    referralLink.ID = "referralLink" + count;

                    referralLink.CssClass = "far fa-paper-plane";

                    referralLink.CommandArgument += jobListingID[count];
                    referralLink.Command += new CommandEventHandler(this.referralButton_Click);

                    c.Controls.Add(new LiteralControl("<div class='image-flip' ontouchstart='this.classList.toggle('hover');'>"));
                    c.Controls.Add(new LiteralControl("<div class='mainflip'>"));
                    c.Controls.Add(new LiteralControl("<div class='frontside'>"));
                    c.Controls.Add(new LiteralControl("<div class='card'>"));
                    c.Controls.Add(new LiteralControl("<div class='card-body text-center'>"));
                    c.Controls.Add(new LiteralControl("<p><img class='img-fluid' src='" + imageArray[count] + "' alt='card image'></p>"));
                    c.Controls.Add(new LiteralControl("<h4 class='card-title'>" + orgNameArray[count] + "</h4>"));
                    c.Controls.Add(new LiteralControl("<p class='card-text'>" + jobTitleArray[count] + "</p>"));
                    c.Controls.Add(new LiteralControl("<a href='#' class='btn btn-primary btn-sm'><i class='fa fa-plus'></i></a>"));
                    c.Controls.Add(new LiteralControl("</div>"));
                    c.Controls.Add(new LiteralControl("</div>"));
                    c.Controls.Add(new LiteralControl("</div>"));

                    c.Controls.Add(new LiteralControl("<div class='backside'>"));
                    c.Controls.Add(new LiteralControl("<div class='card'>"));
                    c.Controls.Add(new LiteralControl("<div class='card-body text-center'>"));
                    c.Controls.Add(new LiteralControl("<h4 class='card-title'>" + orgNameArray[count] + "</h4>"));
                    c.Controls.Add(new LiteralControl("<p class='card-text'>" + jobTitleArray[count] + "</p>"));
                    c.Controls.Add(new LiteralControl("<p class='card-text'> Location: " + jobLocationArray[count] + "</p>"));
                    c.Controls.Add(new LiteralControl("<p class='card-text'>  Deadline: " + deadlineArray[count].ToString() + "</p>"));
                    c.Controls.Add(new LiteralControl("<p class='card-text'>  Number of Applicants: " + numOfApplicantsArray[count] + "</p>"));
                    c.Controls.Add(new LiteralControl("<ul class='list-inline'>"));
                    c.Controls.Add(new LiteralControl("<li class='list-inline-item'>"));
                    c.Controls.Add(new LiteralControl("<a class='social-icon text-xs-center' target='_blank' href='" + linkArray[count] + "'>"));
                    c.Controls.Add(new LiteralControl("<i class='fas fa-external-link-alt'></i>&nbsp;&nbsp;&nbsp;"));
                    //c.Controls.Add(referralLink);
                    c.Controls.Add(new LiteralControl("</a>"));
                    c.Controls.Add(new LiteralControl("</li>"));
                    c.Controls.Add(new LiteralControl("</ul>"));
                    c.Controls.Add(new LiteralControl("</div>"));
                    c.Controls.Add(new LiteralControl("</div>"));
                    c.Controls.Add(new LiteralControl("</div>"));
                    c.Controls.Add(new LiteralControl("</div>"));
                    c.Controls.Add(new LiteralControl("</div>"));

                    c.Style.Add("width", "33%");
                    r.Cells.Add(c);
                    count++;

                }
                jobPostingTable.Rows.Add(r);
            }


        }
    }
}





