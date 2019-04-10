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



        while (reader.Read())
        {

            Image1.ImageUrl = reader.GetString(2);


        }

        //sql.Close();





    }
}