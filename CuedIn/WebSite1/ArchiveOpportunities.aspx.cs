using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class ArchiveOpportunities : System.Web.UI.Page
{
    public static String email;
    
    protected void Page_Load(object sender, EventArgs e)
    {

        gridviewRejJobs.Columns[2].Visible = false;
        gridviewRejJobs.Columns[3].Visible = false;
        gridviewRejJobs.Columns[4].Visible = false;
        gridviewRejJobs.Columns[5].Visible = false;

        gridviewAccJobs.Columns[2].Visible = false;
        gridviewAccJobs.Columns[3].Visible = false;
        gridviewAccJobs.Columns[4].Visible = false;
        gridviewAccJobs.Columns[5].Visible = false;

        ((Label)Master.FindControl("lblMaster")).Text = "Archived Jobs Listings";
       

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


        System.Data.SqlClient.SqlConnection EmailQuery = new System.Data.SqlClient.SqlConnection(connectionString);


        // Mail Button Query
        EmailQuery.Open();
        System.Data.SqlClient.SqlCommand query = new System.Data.SqlClient.SqlCommand();
        query.Connection = EmailQuery;
        query.CommandText = "SELECT  UserEntity.EmailAddress FROM  JobListing INNER JOIN Organization ON JobListing.OrganizationID = Organization.OrganizationEntityID INNER JOIN UserEntity ON Organization.OrganizationEntityID = UserEntity.UserEntityID WHERE JobListing.JobListingID = " + Session["selectedjobID"];
        System.Data.SqlClient.SqlDataReader Result = query.ExecuteReader();



        while (Result.Read())
        {
            email = Result.GetString(0);
        }

        EmailQuery.Close();



        MailButtonLink.NavigateUrl = "mailto:" + email + "?Subject=CommUP:%20Job%20Approval!";




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

        Response.Redirect("~/ArchiveOpportunities.aspx");
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
        Response.Redirect("~/ArchiveOpportunities.aspx");
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

        sql.Close();

        System.Data.SqlClient.SqlConnection EmailQuery = new System.Data.SqlClient.SqlConnection(connectionString);


        // Mail Button Query
        EmailQuery.Open();
        System.Data.SqlClient.SqlCommand query = new System.Data.SqlClient.SqlCommand();
        query.Connection = EmailQuery;
        query.CommandText = "SELECT  UserEntity.EmailAddress FROM  JobListing INNER JOIN Organization ON JobListing.OrganizationID = Organization.OrganizationEntityID INNER JOIN UserEntity ON Organization.OrganizationEntityID = UserEntity.UserEntityID WHERE JobListing.JobListingID = " + Session["selectedjobID"];
        System.Data.SqlClient.SqlDataReader Result = query.ExecuteReader();



        while (Result.Read())
        {
            email = Result.GetString(0);
        }

        EmailQuery.Close();



        RejectMailButton.NavigateUrl = "mailto:" + email + "?Subject=CommUP:%20Job%20Rejection";



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

        Response.Redirect("~/ArchiveOpportunities.aspx");
    }




    protected void btnCheckGridView_Click(object sender, EventArgs e)
    {
        {


            if (chkJobDescription.Checked != true)
            {
                for (int i = 0; i < gridviewRejJobs.Columns.Count; i++)
                {
                    if (gridviewRejJobs.Columns[i].HeaderText == "Job Description")
                    {
                        gridviewRejJobs.Columns[i].Visible = false;

                    }
                }
            }
            else
            {
                for (int i = 0; i < gridviewRejJobs.Columns.Count; i++)
                {
                    if (gridviewRejJobs.Columns[i].HeaderText == "Job Description")
                    {
                        gridviewRejJobs.Columns[i].Visible = true;

                    }
                }
            }


            if (chkJobType.Checked != true)
            {
                for (int i = 0; i < gridviewRejJobs.Columns.Count; i++)
                {
                    if (gridviewRejJobs.Columns[i].HeaderText == "Job Type")
                    {
                        gridviewRejJobs.Columns[i].Visible = false;

                    }
                }
            }
            else
            {
                for (int i = 0; i < gridviewRejJobs.Columns.Count; i++)
                {
                    if (gridviewRejJobs.Columns[i].HeaderText == "Job Type")
                    {
                        gridviewRejJobs.Columns[i].Visible = true;

                    }
                }
            }


            if (chkJobLocation.Checked != true)
            {
                for (int i = 0; i < gridviewRejJobs.Columns.Count; i++)
                {
                    if (gridviewRejJobs.Columns[i].HeaderText == "Location")
                    {
                        gridviewRejJobs.Columns[i].Visible = false;

                    }
                }
            }
            else
            {
                for (int i = 0; i < gridviewRejJobs.Columns.Count; i++)
                {
                    if (gridviewRejJobs.Columns[i].HeaderText == "Location")
                    {
                        gridviewRejJobs.Columns[i].Visible = true;

                    }
                }
            }


            if (chkOrgWebsite.Checked != true)
            {
                for (int i = 0; i < gridviewRejJobs.Columns.Count; i++)
                {
                    if (gridviewRejJobs.Columns[i].HeaderText == " Website")
                    {
                        gridviewRejJobs.Columns[i].Visible = false;

                    }
                }
            }
            else
            {
                for (int i = 0; i < gridviewRejJobs.Columns.Count; i++)
                {
                    if (gridviewRejJobs.Columns[i].HeaderText == " Website")
                    {
                        gridviewRejJobs.Columns[i].Visible = true;

                    }
                }
            }


        }



 
    }

    protected void btnCheckGridView2_Click(object sender, EventArgs e)
    {


        if (chkJobDescription1.Checked != true)
        {
            for (int i = 0; i < gridviewAccJobs.Columns.Count; i++)
            {
                if (gridviewAccJobs.Columns[i].HeaderText == "Job Description")
                {
                    gridviewAccJobs.Columns[i].Visible = false;

                }
            }
        }
        else
        {
            for (int i = 0; i < gridviewAccJobs.Columns.Count; i++)
            {
                if (gridviewAccJobs.Columns[i].HeaderText == "Job Description")
                {
                    gridviewAccJobs.Columns[i].Visible = true;

                }
            }
        }


        if (chkJobType1.Checked != true)
        {
            for (int i = 0; i < gridviewAccJobs.Columns.Count; i++)
            {
                if (gridviewAccJobs.Columns[i].HeaderText == "Job Type")
                {
                    gridviewAccJobs.Columns[i].Visible = false;

                }
            }
        }
        else
        {
            for (int i = 0; i < gridviewAccJobs.Columns.Count; i++)
            {
                if (gridviewAccJobs.Columns[i].HeaderText == "Job Type")
                {
                    gridviewAccJobs.Columns[i].Visible = true;

                }
            }
        }


        if (chkJobLocation1.Checked != true)
        {
            for (int i = 0; i < gridviewAccJobs.Columns.Count; i++)
            {
                if (gridviewAccJobs.Columns[i].HeaderText == "Location")
                {
                    gridviewAccJobs.Columns[i].Visible = false;

                }
            }
        }
        else
        {
            for (int i = 0; i < gridviewAccJobs.Columns.Count; i++)
            {
                if (gridviewAccJobs.Columns[i].HeaderText == "Location")
                {
                    gridviewAccJobs.Columns[i].Visible = true;

                }
            }
        }


        if (chkOrgWebsite1.Checked != true)
        {
            for (int i = 0; i < gridviewAccJobs.Columns.Count; i++)
            {
                if (gridviewAccJobs.Columns[i].HeaderText == " Website")
                {
                    gridviewAccJobs.Columns[i].Visible = false;

                }
            }
        }
        else
        {
            for (int i = 0; i < gridviewAccJobs.Columns.Count; i++)
            {
                if (gridviewAccJobs.Columns[i].HeaderText == " Website")
                {
                    gridviewAccJobs.Columns[i].Visible = true;

                }
            }
        }


    }
}