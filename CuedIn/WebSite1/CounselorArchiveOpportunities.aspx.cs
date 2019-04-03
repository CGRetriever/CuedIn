using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class CounselorArchiveOpportunities : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

   
        gridviewRejJobs.Columns[2].Visible = false;
        gridviewAccJobs.Columns[2].Visible = false;
        ((Label)Master.FindControl("lblMaster2")).Text = "Archived Job Listings";
        

    }
    //Gridview Approve Button in Reject Gridview
    protected void approveJobLinkBtn_Click(object sender, CommandEventArgs e)
    {
        String connectionString = ConfigurationManager.ConnectionStrings["DBConnectionString"].ConnectionString;
        System.Data.SqlClient.SqlConnection sql = new System.Data.SqlClient.SqlConnection(connectionString);

        int rowIndex = Convert.ToInt32(((sender as LinkButton).NamingContainer as GridViewRow).RowIndex);
        GridViewRow row = gridviewRejJobs.Rows[rowIndex];

        int jobID = Convert.ToInt32(e.CommandArgument);

        Session["selectedjobID"] = jobID.ToString();


        sql.Open();
        System.Data.SqlClient.SqlCommand moreJobInfo = new System.Data.SqlClient.SqlCommand();
        moreJobInfo.Connection = sql;
        moreJobInfo.CommandText = "SELECT JobListing.JobTitle, Organization.OrganizationName, JobListing.JobListingID FROM JobListing INNER JOIN Organization ON JobListing.OrganizationID = Organization.OrganizationEntityID where JobListingID = " + Session["selectedjobID"];
        System.Data.SqlClient.SqlDataReader reader = moreJobInfo.ExecuteReader();



        while (reader.Read())
        {
            lblJobApprove.Text = reader.GetString(0);
            lblJobSubApprove.Text = reader.GetString(1);

        }

        sql.Close();




        ClientScript.RegisterStartupScript(this.GetType(), "Pop", "openApproveXModal();", true);
    }
    //Modal Approve Button in Rej Gridview
    protected void acceptJobButton_Click(object sender, EventArgs e)
    {
        String connectionString = ConfigurationManager.ConnectionStrings["DBConnectionString"].ConnectionString;
        System.Data.SqlClient.SqlConnection sql = new System.Data.SqlClient.SqlConnection(connectionString);

        sql.Open();
        System.Data.SqlClient.SqlCommand approveJob = new System.Data.SqlClient.SqlCommand();
        approveJob.Connection = sql;
        approveJob.CommandText = "update joblisting set approved = 'Y', lastUpdated ='" + DateTime.Today + "' where joblistingID = " + Session["selectedjobID"];
        approveJob.ExecuteNonQuery();
        sql.Close();

        Response.Redirect("~/CounselorArchiveOpportunities.aspx");
    }
    //Modal More Info in reject 
    protected void moreInfoRejJobLinkBtn_Click(object sender, CommandEventArgs e)
    {
        String connectionString = ConfigurationManager.ConnectionStrings["DBConnectionString"].ConnectionString;
        System.Data.SqlClient.SqlConnection sql = new System.Data.SqlClient.SqlConnection(connectionString);

        int rowIndex = Convert.ToInt32(((sender as LinkButton).NamingContainer as GridViewRow).RowIndex);
        GridViewRow row = gridviewRejJobs.Rows[rowIndex];


        int jobID = Convert.ToInt32(e.CommandArgument);

        sql.Open();
        System.Data.SqlClient.SqlCommand moreJobInfo = new System.Data.SqlClient.SqlCommand();
        moreJobInfo.Connection = sql;
        moreJobInfo.CommandText = "SELECT Organization.OrganizationName, Organization.OrganizationDescription, JobListing.JobTitle, JobListing.JobDescription, JobListing.JobType, JobListing.Location, JobListing.Deadline, JobListing.NumOfApplicants FROM Organization INNER JOIN JobListing ON Organization.OrganizationEntityID = JobListing.OrganizationID WHERE JobListing.JobListingID = " + jobID;
        System.Data.SqlClient.SqlDataReader reader = moreJobInfo.ExecuteReader();



        while (reader.Read())
        {
            //set labels to db values
            lblJOrganizationName.Text = "Organization Name: " + reader.GetString(0);
            lblJOrganizationDescription.Text = "Organization Description: " + reader.GetString(1);
            lblJobName.Text = "Job Title: " + reader.GetString(2);
            lblJobDescription.Text = "Job Description: " + reader.GetString(3);
            lblJobType.Text = "Job Type: " + reader.GetString(4);
            lblJobLocation.Text = "Job Location: " + reader.GetString(5);
            lblJobDeadline.Text = "Job Deadline: " + reader.GetDateTime(6);
            lblNumOfApplicants.Text = "Number of Applicants: " + reader.GetInt32(7);

        }

        Session["selectedjobID"] = jobID.ToString();




        ClientScript.RegisterStartupScript(this.GetType(), "Pop", "openEditSModal();", true);

    }

    //Modal More Info in accept
    protected void moreInfoAccJobLinkBtn_Click(object sender, CommandEventArgs e)
    {
        String connectionString = ConfigurationManager.ConnectionStrings["DBConnectionString"].ConnectionString;
        System.Data.SqlClient.SqlConnection sql = new System.Data.SqlClient.SqlConnection(connectionString);

        int rowIndex = Convert.ToInt32(((sender as LinkButton).NamingContainer as GridViewRow).RowIndex);
        GridViewRow row = gridviewAccJobs.Rows[rowIndex];


        int jobID = Convert.ToInt32(e.CommandArgument);

        sql.Open();
        System.Data.SqlClient.SqlCommand moreJobInfo = new System.Data.SqlClient.SqlCommand();
        moreJobInfo.Connection = sql;
        moreJobInfo.CommandText = "SELECT Organization.OrganizationName, Organization.OrganizationDescription, JobListing.JobTitle, JobListing.JobDescription, JobListing.JobType, JobListing.Location, JobListing.Deadline, JobListing.NumOfApplicants FROM Organization INNER JOIN JobListing ON Organization.OrganizationEntityID = JobListing.OrganizationID WHERE JobListing.JobListingID = " + jobID;
        System.Data.SqlClient.SqlDataReader reader = moreJobInfo.ExecuteReader();



        while (reader.Read())
        {
            //set labels to db values
            lblJOrganizationName.Text = "Organization Name: " + reader.GetString(0);
            lblJOrganizationDescription.Text = "Organization Description: " + reader.GetString(1);
            lblJobName.Text = "Job Title: " + reader.GetString(2);
            lblJobDescription.Text = "Job Description: " + reader.GetString(3);
            lblJobType.Text = "Job Type: " + reader.GetString(4);
            lblJobLocation.Text = "Job Location: " + reader.GetString(5);
            lblJobDeadline.Text = "Job Deadline: " + reader.GetDateTime(6);
            lblNumOfApplicants.Text = "Number of Applicants: " + reader.GetInt32(7);

        }

        Session["selectedjobID"] = jobID.ToString();




        ClientScript.RegisterStartupScript(this.GetType(), "Pop", "openEditSModal();", true);

    }
    //Message Organization
    protected void Button3_Click1(object sender, EventArgs e)
    {
        // Stopped here before class. Need to get the query result from the database (the business email) and store that as a variable to pass
        // to the client script start up


        String connectionString = ConfigurationManager.ConnectionStrings["DBConnectionString"].ConnectionString;
        System.Data.SqlClient.SqlConnection sql = new System.Data.SqlClient.SqlConnection(connectionString);



        sql.Open();
        System.Data.SqlClient.SqlCommand approveScholarship = new System.Data.SqlClient.SqlCommand();
        approveScholarship.Connection = sql;
        approveScholarship.CommandText = "SELECT EmailAddress FROM  UserEntity where UserEntityID = " + Session["selectedjobID"];
        approveScholarship.ExecuteNonQuery();
        sql.Close();
        //UPDATE WITH QUERIES
        string email = "abc@abc.com";
        ClientScript.RegisterStartupScript(this.GetType(), "mailto", "parent.location='mailto:" + email + "'", true);
        Response.Redirect("~/CounselorArchiveOpportunities.aspx");
    }

    //reject button clicked in approve gridview-- populates modal
    protected void rejectJobLinkBtn_Click(object sender, CommandEventArgs e)
    {
        String connectionString = ConfigurationManager.ConnectionStrings["DBConnectionString"].ConnectionString;
        System.Data.SqlClient.SqlConnection sql = new System.Data.SqlClient.SqlConnection(connectionString);

        int rowIndex = Convert.ToInt32(((sender as LinkButton).NamingContainer as GridViewRow).RowIndex);
        GridViewRow row = gridviewAccJobs.Rows[rowIndex];

        int jobID = Convert.ToInt32(e.CommandArgument);

        Session["selectedjobID"] = jobID.ToString();


        sql.Open();
        System.Data.SqlClient.SqlCommand moreJobInfo = new System.Data.SqlClient.SqlCommand();
        moreJobInfo.Connection = sql;
        moreJobInfo.CommandText = "SELECT Organization.OrganizationName, JobListing.JobTitle FROM JobListing INNER JOIN Organization ON JobListing.OrganizationID = Organization.OrganizationEntityID where JobListingID = " + Session["selectedjobid"];
        System.Data.SqlClient.SqlDataReader reader = moreJobInfo.ExecuteReader();



        while (reader.Read())
        {
            lblOrgName.Text = reader.GetString(0);
            rejectjobsublabel.Text = reader.GetString(1);

        }


        ClientScript.RegisterStartupScript(this.GetType(), "Pop", "openRejectJModal();", true);
    }
    //reject button clicked in modal-- sends to DB
    protected void rejectJobButton_Click(object sender, EventArgs e)
    {
        String connectionString = ConfigurationManager.ConnectionStrings["DBConnectionString"].ConnectionString;
        System.Data.SqlClient.SqlConnection sql = new System.Data.SqlClient.SqlConnection(connectionString);

        sql.Open();
        System.Data.SqlClient.SqlCommand rejectJob = new System.Data.SqlClient.SqlCommand();
        rejectJob.Connection = sql;
        rejectJob.CommandText = "update joblisting set approved = 'N', lastUpdated ='" + DateTime.Today + "' where joblistingID = " + Session["selectedjobID"];
        rejectJob.ExecuteNonQuery();
        sql.Close();

        Response.Redirect("~/CounselorArchiveOpportunities.aspx");
    }



}