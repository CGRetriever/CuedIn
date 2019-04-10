using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class LandingPage : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

        String connectionString = ConfigurationManager.ConnectionStrings["DBConnectionString"].ConnectionString;
        System.Data.SqlClient.SqlConnection sql = new System.Data.SqlClient.SqlConnection(connectionString);

        sql.Open();
        System.Data.SqlClient.SqlCommand RecentJobs = new System.Data.SqlClient.SqlCommand();
        RecentJobs.Connection = sql;
        RecentJobs.CommandText = "SELECT top 5 JobListing.JobListingID, JobListing.JobTitle, Organization.Image, JobListing.Approved FROM JobListing INNER JOIN Organization ON JobListing.OrganizationID = Organization.OrganizationEntityID where Approved = 'P' order by JobListing.JobListingID desc";
        System.Data.SqlClient.SqlDataReader reader = RecentJobs.ExecuteReader();


        String[] imageArray = new string[5];
        String[] jobTitleArray = new string[5];
        int x = 0;

        while (reader.Read())
        {

            imageArray[x] = reader.GetString(2);
            jobTitleArray[x] = reader.GetString(1);
            x++;

        }

      

        Image1.ImageUrl = imageArray[0];
        Image2.ImageUrl = imageArray[1];
        Image3.ImageUrl = imageArray[2];
        Image4.ImageUrl = imageArray[3];
        Image5.ImageUrl = imageArray[4];

        Label1.Text = jobTitleArray[0];
        Label2.Text = jobTitleArray[1];
        Label3.Text = jobTitleArray[2];
        Label4.Text = jobTitleArray[3];
        Label5.Text = jobTitleArray[4];



        sql.Close();





    }

    public override void VerifyRenderingInServerForm(Control control)
    {
        /* Verifies that the control is rendered */
    }





    




    protected void Icon1_Click(object sender, EventArgs e)
    {
        int r = 4;
        int p = 2;
        int t = 5;

    }

    protected void Icon2_Click(object sender, EventArgs e)
    {
        int r = 4;
        int p = 2;
        int t = 5;
    }

    protected void Icon3_Click(object sender, EventArgs e)
    {
        int r = 4;
        int p = 2;
        int t = 5;
    }

    protected void Icon4_Click(object sender, EventArgs e)
    {
        int r = 4;
        int p = 2;
        int t = 5;
    }

    protected void Icon5_Click(object sender, EventArgs e)
    {
        int r = 4;
        int p = 2;
        int t = 5;
    }
}