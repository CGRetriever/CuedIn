using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class JobPostings : System.Web.UI.Page
{


    protected void Page_Load(object sender, EventArgs e)
    {
        Session["schoolID"] = 12;
        Session["userCounty"] = "Harrisonburg City Public Schools";



        ((Label)Master.FindControl("lblMaster")).Text = "Job Cards";
        ((Label)Master.FindControl("lblMaster")).Attributes.Add("Style", "color: #fff; text-align:center; text-transform: uppercase; letter-spacing: 6px; font-size: 2.0em; margin: .67em");



        if (!IsPostBack)
        {
            ViewState["queryOr"] = " ";
            String s = " ";
            displayTable(s);

        }

        else
        {


            applyChanges_click(sender, e);
            displayTable(ViewState["queryOr"].ToString());
        }




    }

    public void referralButton_Click(object sender, CommandEventArgs e)
    {

        int jobListingID = Convert.ToInt32(e.CommandArgument);

        ViewState["reffJobID"] = jobListingID;


        //interest Group list is going to the the associated interest groups of the selected job on refferal. 
        List<InterestGroup> interestGroupList = new List<InterestGroup>();
        //gets the list of jobs that were selected based upon the id selected
        interestGroupList = returnInterestList(jobListingID);

        //returns a conditional statement based on a list
        String s = conditionalIf(interestGroupList);

        displayModal(jobListingID, s, interestGroupList);


    }

    public void sendToButton_Click(object sender, EventArgs e)
    {
        //List<int> studentIDList = new List<int>();
        //for (int i = 0; i < gridviewRefer.Rows.Count; i++)
        //{
        //    CheckBox check = (CheckBox)gridviewRefer.Rows[i].FindControl("studentCheck");


        //    ((Label)Master.FindControl("lblMaster")).Text = "Approved Jobs";


        //    if (check.Checked)
        //    {
        //        int studentID = Convert.ToInt32(gridviewRefer.DataKeys[i]["StudentEntityID"]);
        //        studentIDList.Add(studentID);
        //    }

        //}
        //String connectionString = System.Configuration.ConfigurationManager.ConnectionStrings["DBConnectionString"].ConnectionString;
        //System.Data.SqlClient.SqlConnection sc = new System.Data.SqlClient.SqlConnection(connectionString);
        //sc.Open();

        //System.Data.SqlClient.SqlConnection EmailQuery = new System.Data.SqlClient.SqlConnection(connectionString);
        //List<String> emailList = new List<String>();
        //// Mail Button Query
        //EmailQuery.Open();
        //System.Data.SqlClient.SqlCommand query = new System.Data.SqlClient.SqlCommand();
        //query.Connection = EmailQuery;

        //foreach (var studentID in studentIDList)
        //{
        //    query.CommandText = "SELECT UserEntity.EmailAddress FROM UserEntity INNER JOIN Student ON UserEntity.UserEntityID = Student.StudentEntityID WHERE Student.StudentEntityID=" + studentID;
        //    System.Data.SqlClient.SqlDataReader Result = query.ExecuteReader();

        //    while (Result.Read())
        //    {
        //        String email = Result.GetString(0);
        //        emailList.Add(email);

        //    }

        //}
        //EmailQuery.Close();


    }

    public void applyChanges_click(object sender, EventArgs e)
    {


        //Declare a list of interest group IDS going to be string for easy use
        List<InterestGroup> interestGroupList = new List<InterestGroup>();

        //Loop through the list box and if it selected then add it to a list
        foreach (ListItem i in InterestGroupDrop.Items)
        {
            if (i.Selected == true)
            {
                //add to the list

                int interestGroupID = Convert.ToInt32(i.Value);
                String interestGroupName = i.Text;
                InterestGroup interestGroup = new InterestGroup(interestGroupID, interestGroupName);

                interestGroupList.Add(interestGroup);

            }


        }

        //if something was selected then lets loop through the array and make the conditional string


        ViewState["queryOr"] = conditionalIf(interestGroupList);

    }


    protected void displayTable(String s)
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
            pullJobInfo.CommandText = "SELECT DISTINCT Organization.OrganizationName, JobListing.JobTitle, JobListing.JobDescription, Organization.Image, Organization.ExternalLink, " +
                "JobListing.Location, JobListing.Deadline, JobListing.NumOfApplicants, " +
                "Organization.OrganizationDescription, JobListing.JobListingID FROM  SchoolApproval INNER JOIN " +
                "OpportunityEntity ON SchoolApproval.OpportunityEntityID = OpportunityEntity.OpportunityEntityID INNER JOIN " +
                "JobListing ON OpportunityEntity.OpportunityEntityID = JobListing.JobListingID INNER JOIN " +
                "Organization ON JobListing.OrganizationID = Organization.OrganizationEntityID INNER JOIN " +
                "OpportunityInterestGroups ON OpportunityEntity.OpportunityEntityID = OpportunityInterestGroups.OpportunityEntityID INNER JOIN " +
                "InterestGroups ON OpportunityInterestGroups.InterestGroupID = InterestGroups.InterestGroupID " +
                "WHERE(SchoolApproval.ApprovedFlag = 'Y') AND(OpportunityEntity.OpportunityType = 'JOB') AND(SchoolApproval.SchoolEntityID = 12) and (" + s + ")";

        }

        pullJobInfo.Connection = sc;

        reader = pullJobInfo.ExecuteReader();

        {

            //Make the list
            List<JobListing> jobs = new List<JobListing>();



            int jobListingID;
            String orgName;
            String jobTitle;
            String jobDescription;
            String image;
            String link;
            String jobLocation;
            int numOfApplicants;
            String organizationDescription;
            DateTime deadline;


            int x = 0;
            while (reader.Read())
            {

                orgName = reader.GetString(0);
                jobTitle = reader.GetString(1);
                jobDescription = reader.GetString(2);
                image = reader.GetString(3);
                link = reader.GetString(4);
                jobLocation = reader.GetString(5);
                deadline = reader.GetDateTime(6);
                numOfApplicants = reader.GetInt32(7);
                organizationDescription = reader.GetString(8);
                jobListingID = reader.GetInt32(9);
                x++;

                JobListing job = new JobListing(jobTitle, jobDescription, jobLocation, deadline, numOfApplicants, orgName, organizationDescription,
                    image, link);
                //Set this to be used later
                //good looks bro -kyle to ryan
                job.setID(jobListingID);
                //Make the object
                //Add to list
                jobs.Add(job);

            }
            sc.Close();


            // list of interest group object over here before we loop through it
            List<InterestGroup> interestGroupList = new List<InterestGroup>();


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

                    interestGroupList = (returnInterestList(jobs[count].getID()));


                    String interestGroupString = interestGroupToString(interestGroupList);

                    interestGroupList.Clear();




                    TableCell c = new TableCell();

                    LinkButton referralLink = new LinkButton();
                    referralLink.ID = "referralLink" + count;

                    referralLink.CssClass = "far fa-paper-plane";
                    referralLink.Command += new CommandEventHandler(this.referralButton_Click);
                    referralLink.CommandArgument += jobs[count].getID();

                    c.Controls.Add(new LiteralControl("<div class='image-flip' ontouchstart='this.classList.toggle('hover');'>"));
                    c.Controls.Add(new LiteralControl("<div class='mainflip'>"));
                    c.Controls.Add(new LiteralControl("<div class='frontside'>"));
                    c.Controls.Add(new LiteralControl("<div class='card'>"));

                    c.Controls.Add(new LiteralControl("<div class='card-body text-center'>"));
                    c.Controls.Add(new LiteralControl("<p><img class='img-fluid' src='" + jobs[count].getOrgImage() + "'alt='card image'></p>"));
                    c.Controls.Add(new LiteralControl("<h4 class='card-title'>" + jobs[count].getOrgName() + "</h4>"));
                    c.Controls.Add(new LiteralControl("<p class='card-text'>" + jobs[count].getJobTitle() + "</p>"));
                    c.Controls.Add(new LiteralControl("<a href='#' class='btn btn-primary btn-sm'><i class='fa fa-plus'></i></a>"));
                    c.Controls.Add(new LiteralControl("</div>"));
                    c.Controls.Add(new LiteralControl("</div>"));
                    c.Controls.Add(new LiteralControl("</div>"));

                    c.Controls.Add(new LiteralControl("<div class='backside'>"));
                    c.Controls.Add(new LiteralControl("<div class='card h-100'>"));
                    c.Controls.Add(new LiteralControl("<div class='card-body text-center'>"));
                    c.Controls.Add(new LiteralControl("<h4 class='card-title'>" + jobs[count].getOrgName() + "</h4>"));
                    c.Controls.Add(new LiteralControl("<h6 class='card-text'><strong>" + jobs[count].getJobTitle() + "</strong></h6>"));
                    c.Controls.Add(new LiteralControl("<h6 class='card-text'> <strong>Location: </strong> " + jobs[count].getJobLocation() + "</h6>"));
                    c.Controls.Add(new LiteralControl("<h6 class='card-text'> <strong>Deadline: </strong> " + jobs[count].getJobDeadline().ToString() + "</h6>"));
                    c.Controls.Add(new LiteralControl("<h6 class='card-text'><strong>Number of Applicants: </strong>" + jobs[count].getNumOfApplicants() + "</h6>"));
                    //lets put the interest group information in here
                    c.Controls.Add(new LiteralControl("<h6 class='card-text'><strong>Interest Groups: </strong> " + interestGroupString + "</h6>"));
                    //right here boi
                    c.Controls.Add(new LiteralControl("<ul class='list-inline'>"));
                    c.Controls.Add(new LiteralControl("<li class='list-inline-item'>"));
                    c.Controls.Add(new LiteralControl("<a class='social-icon text-xs-center' target='_blank' href='" + jobs[count].getOrgWebsite() + "'>"));
                    c.Controls.Add(new LiteralControl("<i class='fas fa-external-link-alt'></i>&nbsp;&nbsp;&nbsp;"));
                    c.Controls.Add(referralLink);
                    c.Controls.Add(new LiteralControl("</a>"));
                    c.Controls.Add(new LiteralControl("</li>"));
                    c.Controls.Add(new LiteralControl("</ul>"));
                    c.Controls.Add(new LiteralControl("</div>"));
                    c.Controls.Add(new LiteralControl("</div>"));
                    c.Controls.Add(new LiteralControl("</div>"));
                    c.Controls.Add(new LiteralControl("</div>"));
                    c.Controls.Add(new LiteralControl("</div>"));

                    //c.Style.Add("width", "33%");
                    //c.Style.Add("height", "33%");
                    r.Cells.Add(c);
                    count++;

                }

                jobPostingTable.Rows.Add(r);
            }


        }



    }


    //Method to get the interest groups assoicated with a specified job!
    public List<InterestGroup> returnInterestList(int ID)
    {

        List<InterestGroup> interestGroupList = new List<InterestGroup>();

        String connectionString = System.Configuration.ConfigurationManager.ConnectionStrings["DBConnectionString"].ConnectionString;
        System.Data.SqlClient.SqlConnection sc = new System.Data.SqlClient.SqlConnection(connectionString);
        System.Data.SqlClient.SqlCommand pullJobInfo = new System.Data.SqlClient.SqlCommand();

        pullJobInfo.Connection = sc;




        sc.Open();


        pullJobInfo.CommandText = "SELECT InterestGroups.InterestGroupID, InterestGroups.InterestGroupName FROM InterestGroups " +
            "INNER JOIN OpportunityInterestGroups ON InterestGroups.InterestGroupID = OpportunityInterestGroups.InterestGroupID " +
            "INNER JOIN OpportunityEntity ON OpportunityInterestGroups.OpportunityEntityID = OpportunityEntity.OpportunityEntityID INNER JOIN JobListing ON " +
            "OpportunityEntity.OpportunityEntityID = JobListing.JobListingID " +

            "where OpportunityEntity.OpportunityEntityID = " + ID;

        System.Data.SqlClient.SqlDataReader reader = pullJobInfo.ExecuteReader();

        while (reader.Read())
        {

            int interestGroupID = reader.GetInt32(0);
            String interestGroupName = reader.GetString(1);

            InterestGroup interestGroup = new InterestGroup(interestGroupID, interestGroupName);

            // don't forget to clear this list after parsing the string 
            interestGroupList.Add(interestGroup);

        }

        sc.Close();

        return interestGroupList;

    }


    public String conditionalIf(List<InterestGroup> interestGroupList)
    {
        String conditionalIf = "InterestGroups.InterestGroupID = ";

        //if all are selected, there is no need to loop. we want to see everything. 
        if (interestGroupList.Count == InterestGroupDrop.Items.Count)
        {
            conditionalIf = " ";
        }

        else if (interestGroupList.Count == 0)
        {
            conditionalIf = " ";
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
                    conditionalIf += interestGroupList[interestID].getInterestGroupID() + " or InterestGroups.InterestGroupID = ";
                }
                else
                {
                    //if it is the last element in the list we have to cut off the sql statement
                    conditionalIf += interestGroupList[interestID].getInterestGroupID();

                }

            }
        }

        return conditionalIf;
    }



    //GridView Method
    protected void ApplyInterestGroup_Click(object sender, EventArgs e)
    {
        //Declare a list of interest group IDS going to be string for easy use
        List<InterestGroup> interestGroupList = new List<InterestGroup>();

        //Loop through the list box and if it selected then add it to a list
        foreach (ListItem i in StudentInterestGroup.Items)
        {
            if (i.Selected == true)
            {
                //add to the list

                int interestGroupID = Convert.ToInt32(i.Value);
                String interestGroupName = i.Text;
                InterestGroup interestGroup = new InterestGroup(interestGroupID, interestGroupName);

                interestGroupList.Add(interestGroup);

            }


        }

        //conditional to get the or statements. 
        String s = conditionalIf(interestGroupList);

        displayModal(Convert.ToInt32(ViewState["reffJobID"]), s, interestGroupList);


    }


    //Method for getting query for the gridview
    public void displayModal(int jobListingID, String s, List<InterestGroup> interestGroupList)
    {

        //methodize this so we can use this for both this referall button click and the apply. re-open the modal on both clicks. 
        String connectionString = System.Configuration.ConfigurationManager.ConnectionStrings["DBConnectionString"].ConnectionString;
        System.Data.SqlClient.SqlConnection sc = new System.Data.SqlClient.SqlConnection(connectionString);
        sc.Open();

        System.Data.SqlClient.SqlCommand pullJobInfo = new System.Data.SqlClient.SqlCommand();
        pullJobInfo.CommandText = "SELECT JobListing.JobTitle, JobListing.JobDescription, JobListing.JobType, JobListing.Location, JobListing.Deadline, Organization.OrganizationName FROM JobListing INNER JOIN Organization ON JobListing.OrganizationID = Organization.OrganizationEntityID WHERE JobListing.JobListingID = " + jobListingID;
        pullJobInfo.Connection = sc;

        string query = "SELECT distinct Student.StudentEntityID, Student.StudentImage, Student.FirstName + ' ' + Student.LastName as 'FullName', Student.StudentGradeLevel, Student.StudentGPA FROM Student INNER JOIN " +
                      "StudentInterestGroups ON Student.StudentEntityID = StudentInterestGroups.StudentEntityID INNER JOIN " +
                      "InterestGroups ON StudentInterestGroups.InterestGroupID = InterestGroups.InterestGroupID where Student.SchoolEntityID = " + Session["schoolID"] + " AND " + s + "Order by Student.StudentGPA DESC";



        DataTable dt = new DataTable();
        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["DBConnectionString"].ConnectionString);
        conn.Open();
        SqlDataAdapter da = new SqlDataAdapter(query, conn);
        da.Fill(dt);
        gridviewRefer.DataSource = dt;
        gridviewRefer.DataBind();
        conn.Close();



        System.Data.SqlClient.SqlDataReader reader = pullJobInfo.ExecuteReader();
        String jobTitle = "";
        String orgName = "";
        while (reader.Read())
        {
            jobTitle = reader.GetString(0);
            orgName = reader.GetString(5);
        }

        lblJobTitle.Text = jobTitle;
        lblOrgName.Text = orgName;

        InterestGroupLabel.Text = "Students interested in: " + interestGroupToString(interestGroupList);


        ClientScript.RegisterStartupScript(this.GetType(), "Pop", "openSendToModal();", true);
    }

    public String interestGroupToString(List<InterestGroup> interestGroupList)
    {
        String interestGroupString = " ";
        for (int interestCursor = 0; interestCursor <= interestGroupList.Count - 1; interestCursor++)
        {
            if (interestCursor == interestGroupList.Count - 1)
            {
                interestGroupString += interestGroupList[interestCursor].getInterestGroupName();
            }
            else
            {
                interestGroupString += interestGroupList[interestCursor].getInterestGroupName() + ", ";

            }
        }
        return interestGroupString;
    }

    protected void ClearWebButtons_Click(object sender, CommandEventArgs e)
    {
        StudentInterestGroup.ClearSelection();
        int jobID = Convert.ToInt32(ViewState["reffJobID"]);
        List<InterestGroup> interestGroupList = returnInterestList(jobID);
        String s = conditionalIf(interestGroupList);

        displayModal(jobID, s, interestGroupList);

    }

    protected void ClearButton_Click(object sender, EventArgs e)
    {
        InterestGroupDrop.ClearSelection();

    }
}





