using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class JobPostings : System.Web.UI.Page
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

        //initialize array of Jobs
        //List<JobListing> jobListingList = new List<JobListing>();
        //String connectionString = System.Configuration.ConfigurationManager.ConnectionStrings["DBConnectionString"].ConnectionString;
        //System.Data.SqlClient.SqlConnection sc = new System.Data.SqlClient.SqlConnection(connectionString);
        //sc.Open();

        //System.Data.SqlClient.SqlCommand sqlJobInfo = new System.Data.SqlClient.SqlCommand();
        //sqlJobInfo.CommandText = "SELECT JobListing.JobTitle, JobListing.JobDescription, JobListing.JobType, JobListing.Location, JobListing.Deadline, JobListing.NumOfApplicants, Organization.OrganizationName, Organization.OrganizationDescription, Organization.Image, Organization.ExternalLink FROM JobListing INNER JOIN Organization ON JobListing.OrganizationID = Organization.OrganizationEntityID where approved = 'Y' ";
        //sqlJobInfo.Connection = sc;
        //System.Data.SqlClient.SqlDataReader reader = sqlJobInfo.ExecuteReader();
        //while (reader.Read())
        //{
        //    JobListing jobListingObj = new JobListing(reader.GetString(0), reader.GetString(1), reader.GetString(2), reader.GetString(3), reader.GetDateTime(4), reader.GetInt32(5), reader.GetString(6), reader.GetString(7), reader.GetString(8), reader.GetString(9));
        //    jobListingList.Add(jobListingObj);
        //}

        //sc.Close();

        //TableRow row = new TableRow();
        //TableCell cell = new TableCell();
        //TableCell cell2 = new TableCell();
        //TableCell cell3 = new TableCell();
        ////link Button for referrals
        //LinkButton referralLink = new LinkButton();
        ////link button for website
        //LinkButton websiteButton = new LinkButton();


        //sqlrecentJobPostID.CommandText = "select max(joblistingID) from jobListing;";
        //sqlrecentJobPostID.Connection = sc;
        //System.Data.SqlClient.SqlDataReader reader = sqlrecentJobPostID.ExecuteReader();

        //while (reader.Read())
        //{
        //    recentPostID = reader.GetInt32(0);
        //}

        //sc.Close();

        //sc.Open();


        //System.Data.SqlClient.SqlCommand recentJobPost = new System.Data.SqlClient.SqlCommand();
        //recentJobPost.CommandText = "SELECT JobListing.JobTitle, JobListing.JobDescription, JobListing.JobType, JobListing.Location, JobListing.Deadline, JobListing.NumOfApplicants, Organization.OrganizationName, Organization.OrganizationDescription, Organization.Image FROM JobListing INNER JOIN Organization ON JobListing.OrganizationID = Organization.OrganizationEntityID where JobListingID =" + recentPostID;
        //recentJobPost.Connection = sc;

        //reader = recentJobPost.ExecuteReader();

        ((Label)Master.FindControl("lblMaster")).Text = "Job Cards";



        //while (reader.Read())
        //{
        //    jobTitle = reader.GetString(0);
        //    jobDescription = reader.GetString(1);
        //    jobType = reader.GetString(2);
        //    jobLocation = reader.GetString(3);
        //    jobDeadline = reader.GetDateTime(4);
        //    numOfApplicants = reader.GetInt32(5);
        //    orgName = reader.GetString(6);
        //    orgDescription = reader.GetString(7);
        //    orgImage = reader.GetString(8);

        //}




    }







    protected void jobPostingTable_Load(object sender, EventArgs e)
    {
        int countTotalJobs = 0;
        String connectionString = System.Configuration.ConfigurationManager.ConnectionStrings["DBConnectionString"].ConnectionString;
        System.Data.SqlClient.SqlConnection sc = new System.Data.SqlClient.SqlConnection(connectionString);
        sc.Open();

        System.Data.SqlClient.SqlCommand countJobPostings = new System.Data.SqlClient.SqlCommand();
        countJobPostings.CommandText = "SELECT count( SchoolApproval.OpportunityEntityID) FROM OpportunityEntity INNER JOIN SchoolApproval ON OpportunityEntity.OpportunityEntityID = SchoolApproval.OpportunityEntityID where OpportunityEntity.OpportunityType = 'JOB' and schoolApproval.approvedflag = 'Y' and SchoolApproval.SchoolEntityID = " + Session["schoolID"];
            //"and SchoolEntityID = " + Session["schoolID"];
        countJobPostings.Connection = sc;

        System.Data.SqlClient.SqlDataReader reader = countJobPostings.ExecuteReader();

        while (reader.Read())
        {
            countTotalJobs = reader.GetInt32(0);
        }

        sc.Close();



        sc.Open();
        System.Data.SqlClient.SqlCommand pullJobInfo = new System.Data.SqlClient.SqlCommand();
        pullJobInfo.CommandText = "SELECT  Organization.OrganizationName, JobListing.JobTitle, JobListing.JobDescription," +
            " Organization.Image, Organization.ExternalLink, JobListing.Location, JobListing.Deadline, JobListing.NumOfApplicants, Organization.OrganizationDescription," +
            " JobListing.JobListingID FROM SchoolApproval INNER JOIN OpportunityEntity ON SchoolApproval.OpportunityEntityID = OpportunityEntity.OpportunityEntityID INNER JOIN JobListing" +
            " ON OpportunityEntity.OpportunityEntityID = JobListing.JobListingID INNER JOIN Organization ON JobListing.OrganizationID = Organization.OrganizationEntityID " +
            "where SchoolApproval.ApprovedFlag = 'Y' and SchoolApproval.SchoolEntityID = " + Session["schoolID"];
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
                    c.Controls.Add(referralLink);
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

        ClientScript.RegisterStartupScript(this.GetType(), "Pop", "openSendToModal();", true);

    }

    public void sendToButton_Click(object sender, EventArgs e)
    {
        List<int> studentIDList = new List<int>();
        for (int i = 0; i < gridviewRefer.Rows.Count; i++)
        {
            CheckBox check = (CheckBox)gridviewRefer.Rows[i].FindControl("studentCheck");


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


    protected void dropdownInterestGroup_SelectedIndexChanged(object sender, EventArgs e)
    {

    }
}





