using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class TeacherJobPosting : System.Web.UI.Page
{
    public static int recentPostID = 0;
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
        String connectionString = System.Configuration.ConfigurationManager.ConnectionStrings["DBConnectionString"].ConnectionString;
        System.Data.SqlClient.SqlConnection sc = new System.Data.SqlClient.SqlConnection(connectionString);
        sc.Open();

        System.Data.SqlClient.SqlCommand sqlrecentJobPostID = new System.Data.SqlClient.SqlCommand();
        sqlrecentJobPostID.CommandText = "select max(joblistingID) from jobListing;";
        sqlrecentJobPostID.Connection = sc;
        System.Data.SqlClient.SqlDataReader reader = sqlrecentJobPostID.ExecuteReader();

        while (reader.Read())
        {
            recentPostID = reader.GetInt32(0);
        }

        sc.Close();

        sc.Open();

        System.Data.SqlClient.SqlCommand recentJobPost = new System.Data.SqlClient.SqlCommand();
        recentJobPost.CommandText = "SELECT JobListing.JobTitle, JobListing.JobDescription, JobListing.JobType, JobListing.Location, JobListing.Deadline, JobListing.NumOfApplicants, Organization.OrganizationName, Organization.OrganizationDescription, Organization.Image FROM JobListing INNER JOIN Organization ON JobListing.OrganizationID = Organization.OrganizationEntityID where JobListingID =" + recentPostID;
        recentJobPost.Connection = sc;

        reader = recentJobPost.ExecuteReader();

        ((Label)Master.FindControl("lblMaster2")).Text = "Job Board";

        while (reader.Read())
        {
            jobTitle = reader.GetString(0);
            jobDescription = reader.GetString(1);
            jobType = reader.GetString(2);
            jobLocation = reader.GetString(3);
            jobDeadline = reader.GetDateTime(4);
            numOfApplicants = reader.GetInt32(5);
            orgName = reader.GetString(6);
            orgDescription = reader.GetString(7);
            orgImage = reader.GetString(8);

        }


    }









    protected void jobPostingTable_Load(object sender, EventArgs e)
    {
        int countTotalJobs = 0;
        String connectionString = System.Configuration.ConfigurationManager.ConnectionStrings["DBConnectionString"].ConnectionString;
        System.Data.SqlClient.SqlConnection sc = new System.Data.SqlClient.SqlConnection(connectionString);
        sc.Open();

        System.Data.SqlClient.SqlCommand countJobPostings = new System.Data.SqlClient.SqlCommand();
        countJobPostings.CommandText = "select count(JobListingID) from JobListing where approved = 'Y' and jobListingID <> " + recentPostID;
        countJobPostings.Connection = sc;

        System.Data.SqlClient.SqlDataReader reader = countJobPostings.ExecuteReader();

        while (reader.Read())
        {
            countTotalJobs = reader.GetInt32(0);
        }

        sc.Close();



        sc.Open();
        System.Data.SqlClient.SqlCommand pullJobInfo = new System.Data.SqlClient.SqlCommand();
        pullJobInfo.CommandText = "SELECT Organization.OrganizationName, JobListing.JobTitle, JobListing.JobDescription, Organization.Image, Organization.ExternalLink FROM JobListing INNER JOIN Organization ON JobListing.OrganizationID = Organization.OrganizationEntityID where jobListingID <>" + recentPostID + "and approved = 'Y' ";
        pullJobInfo.Connection = sc;



        reader = pullJobInfo.ExecuteReader();

        {
            String[] orgNameArray = new String[countTotalJobs];
            String[] jobTitleArray = new String[countTotalJobs];
            String[] jobDescriptionArray = new String[countTotalJobs];
            String[] imageArray = new string[countTotalJobs];
            String[] linkArray = new string[countTotalJobs];
            int x = 0;
            while (reader.Read())
            {
                orgNameArray[x] = reader.GetString(0);
                jobTitleArray[x] = reader.GetString(1);
                jobDescriptionArray[x] = reader.GetString(2);
                imageArray[x] = reader.GetString(3);
                linkArray[x] = reader.GetString(4);
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
                    c.Text += "<div class = 'card card-cascade>";
                    c.Text += "<div class = 'view view-cascade overlay'>";
                    c.Text += "<img class = 'card-img-top' src='" + imageArray[count] + "'>";
                    c.Text += "<div class = 'card-body card-body-cascade text-center'>";
                    c.Text += "<h4 class='card-title'> <strong>" + orgNameArray[count] + "</strong> </h4>";
                    c.Text += "<div class='font-weight-bold indigo-text py-2'>" + jobTitleArray[count] + "</div>";
                    c.Text += "<div class = 'card-text'>" + jobDescriptionArray[count] + "</div>";
                    c.Text += "<a type ='button' class = 'border border-white btn-medium btn-round' style = 'background-color:#ffffff;' href='" + linkArray[count] + "' target = '_blank'><i class='fas fa-link' > </i></a>";
                    c.Text += "</div>";
                    c.Text += "</div>";
                    c.Text += "</div>";
                    c.Text += "</div>";
                    c.Style.Add("width", "33%");
                    r.Cells.Add(c);
                    count++;

                }
                jobPostingTable.Rows.Add(r);
            }


        }

    }
}





