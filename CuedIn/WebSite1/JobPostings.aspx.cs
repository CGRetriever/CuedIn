using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class JobPostings : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {



    }

    protected void jobPostingTable_Load(object sender, EventArgs e)
    {
        int countTotalJobs = 0;
        String connectionString = System.Configuration.ConfigurationManager.ConnectionStrings["DBConnectionString"].ConnectionString;
        System.Data.SqlClient.SqlConnection sc = new System.Data.SqlClient.SqlConnection(connectionString);
        sc.Open();

        System.Data.SqlClient.SqlCommand countJobPostings = new System.Data.SqlClient.SqlCommand();
        countJobPostings.CommandText = "select count(JobListingID) from JobListing where approved = 'yes'";
        countJobPostings.Connection = sc;

        System.Data.SqlClient.SqlDataReader reader = countJobPostings.ExecuteReader();

        while (reader.Read())
        {
            countTotalJobs = reader.GetInt32(0);
        }

        sc.Close();

        

        sc.Open();
        System.Data.SqlClient.SqlCommand pullJobInfo = new System.Data.SqlClient.SqlCommand();
        pullJobInfo.CommandText = "SELECT Organization.OrganizationName, JobListing.JobTitle, JobListing.JobDescription, JobListing.Image FROM JobListing INNER JOIN Organization ON JobListing.OrganizationID = Organization.OrganizationEntityID";
        pullJobInfo.Connection = sc;



        reader = pullJobInfo.ExecuteReader();

        {
            String[] orgNameArray = new String[countTotalJobs];
            String[] jobTitleArray = new String[countTotalJobs];
            String[] jobDescriptionArray = new String[countTotalJobs];
            String[] imageArray = new string[countTotalJobs];
            int x = 0;
            while (reader.Read())
            {
                orgNameArray[x] = reader.GetString(0);
                jobTitleArray[x] = reader.GetString(1);
                jobDescriptionArray[x] = reader.GetString(2);
                imageArray[x] = reader.GetString(3);
                x++;

            }
            sc.Close();

            int numrows = countTotalJobs / 3;
            int numcells = 3;
            int count = 0;
            for (int j = 0; j < numrows; j++)
            {
            TableRow r = new TableRow();
             
               
            for (int i = 0; i < numcells; i++)
            {
                TableCell c = new TableCell();
                    c.Text += "<div class = 'card card-cascade>";
                    c.Text += "<div class = 'view view-cascade overlay'>";
                    c.Text += "<img class = 'card-img-top' src='" + imageArray[count] + "'>";
                    c.Text += "<div class = 'card-body card-body-cascade text-center'>";
                    c.Text += "<h4 class='card-title'> <strong>" + orgNameArray[count] + "</strong> </h4>";
                    c.Text += "<div class='font-weight-bold indigo-text py-2'>" + jobTitleArray[count] + "</div>";
                    c.Text += "<div class = 'card-text'>" + jobDescriptionArray[count] + "</div>";
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
