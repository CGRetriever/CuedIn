using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class DirectorArchiveOpportunities : System.Web.UI.Page
{
    public static String email;
    private int schoolid = 12;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["schoolid"] != null)
        {
            schoolid = Convert.ToInt32(Session["schoolid"]);
        }

        if (SearchBox1 != null)
        {
            object send1 = new object();
            EventArgs e1 = new EventArgs();

            SearchButton2_Click(send1, e1);

        }

        else
        {
            string query = "SELECT JobListing.JobTitle, Organization.OrganizationName, JobListing.JobListingID, JobListing.JobDescription, JobListing.JobType, JobListing.Location, Organization.OrganizationDescription, " +
           " Organization.ExternalLink FROM  OpportunityEntity INNER JOIN " +
           "SchoolApproval ON OpportunityEntity.OpportunityEntityID = SchoolApproval.OpportunityEntityID INNER JOIN " +
           "School ON SchoolApproval.SchoolEntityID = School.SchoolEntityID INNER JOIN " +
           " JobListing ON OpportunityEntity.OpportunityEntityID = JobListing.JobListingID INNER JOIN " +
           "Organization ON JobListing.OrganizationID = Organization.OrganizationEntityID " +
           "WHERE school.SchoolEntityID = " + @schoolid + "  and SchoolApproval.ApprovedFlag = 'Y'";


            DataTable dt = new DataTable();
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["DBConnectionString"].ConnectionString);
            conn.Open();
            SqlDataAdapter da = new SqlDataAdapter(query, conn);
            da.SelectCommand.Parameters.AddWithValue("@schoolid", schoolid);
            da.Fill(dt);
            gridviewAccJobs.DataSource = dt;
            gridviewAccJobs.DataBind();
            conn.Close();

        }

        if (SearchBox2 != null)
        {
            object send1 = new object();
            EventArgs e1 = new EventArgs();
            SearchButton1_Click(send1, e1);
        }
        else
        {

            string query1 = "SELECT JobListing.JobTitle, Organization.OrganizationName, JobListing.JobListingID, JobListing.JobDescription, JobListing.JobType, JobListing.Location, Organization.OrganizationDescription, " +
                " Organization.ExternalLink" +
                " FROM  OpportunityEntity INNER JOIN" +
                " SchoolApproval ON OpportunityEntity.OpportunityEntityID = SchoolApproval.OpportunityEntityID INNER JOIN" +
                " School ON SchoolApproval.SchoolEntityID = School.SchoolEntityID INNER JOIN" +
                " JobListing ON OpportunityEntity.OpportunityEntityID = JobListing.JobListingID INNER JOIN " +
                " Organization ON JobListing.OrganizationID = Organization.OrganizationEntityID " +
                " WHERE school.SchoolEntityID = " + schoolid + " and SchoolApproval.ApprovedFlag = 'N'";

            DataTable dt1 = new DataTable();
            SqlConnection conn1 = new SqlConnection(ConfigurationManager.ConnectionStrings["DBConnectionString"].ConnectionString);
            conn1.Open();
            SqlDataAdapter da1 = new SqlDataAdapter(query1, conn1);
            da1.Fill(dt1);
            gridviewRejJobs.DataSource = dt1;
            gridviewRejJobs.DataBind();
            conn1.Close();
        }



        gridviewAccJobs.Columns[0].Visible = false;
        ((Label)Master.FindControl("lblMaster")).Text = "Archived Jobs Listings";
        ((Label)Master.FindControl("lblMaster")).Attributes.Add("Style", "color: #fff; text-align:center; text-transform: uppercase; letter-spacing: 6px; font-size: 2.0em; margin: .67em");

        cbSelectAll.Attributes.Add("onclick", "Selectall");

        cbSelectAll2.Attributes.Add("onclick", "Selectall");


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
        approveJob.CommandText = "update SchoolApproval set approvedFlag = 'Y', schoolApproval.LastUpdated = getdate() where OpportunityEntityID = " + Session["selectedjobID"] + " and schoolEntityID = " + Session["schoolID"];
        approveJob.ExecuteNonQuery();
        sql.Close();

        Response.Redirect("~/DirectorArchiveOpportunities.aspx");
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
            lblJOrganizationName.Text = reader.GetString(0);
            lblJOrganizationDescription.Text = reader.GetString(1);
            lblJobName.Text = "Job Title: " + reader.GetString(2);
            lblJobDescription.Text = reader.GetString(3);
            lblJobType.Text = reader.GetString(4);
            lblJobLocation.Text = reader.GetString(5);
            lblJobDeadline.Text = reader.GetDateTime(6).ToString();
            lblNumOfApplicants.Text = reader.GetInt32(7).ToString();

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
            lblJOrganizationName.Text = reader.GetString(0);
            lblJOrganizationDescription.Text = reader.GetString(1);
            lblJobName.Text = "Job Title: " + reader.GetString(2);
            lblJobDescription.Text = reader.GetString(3);
            lblJobType.Text = reader.GetString(4);
            lblJobLocation.Text = reader.GetString(5);
            lblJobDeadline.Text = reader.GetDateTime(6).ToString();
            lblNumOfApplicants.Text = reader.GetInt32(7).ToString();

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
        Response.Redirect("~/DirectorArchiveOpportunities.aspx");
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
        rejectJob.CommandText = "update SchoolApproval set approvedFlag = 'N', schoolApproval.LastUpdated = getdate() where OpportunityEntityID = " + Session["selectedjobID"] + " and schoolEntityID = " + Session["schoolID"];
        rejectJob.ExecuteNonQuery();
        sql.Close();

        Response.Redirect("~/DirectorArchiveOpportunities.aspx");
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
    }


    protected void SearchButton1_Click(object sender, EventArgs e)
    {
        String term = SearchBox2.Text;

        string query = "SELECT JobListing.JobTitle, Organization.OrganizationName, JobListing.JobListingID, JobListing.JobDescription, JobListing.JobType, JobListing.Location, Organization.OrganizationDescription, " +
                  " Organization.ExternalLink FROM  OpportunityEntity INNER JOIN " +
                  "SchoolApproval ON OpportunityEntity.OpportunityEntityID = SchoolApproval.OpportunityEntityID INNER JOIN " +
                  "School ON SchoolApproval.SchoolEntityID = School.SchoolEntityID INNER JOIN " +
                  " JobListing ON OpportunityEntity.OpportunityEntityID = JobListing.JobListingID INNER JOIN " +
                  "Organization ON JobListing.OrganizationID = Organization.OrganizationEntityID " +
                  "WHERE school.SchoolEntityID = " + @schoolid + "  and SchoolApproval.ApprovedFlag = 'Y' and ((joblisting.jobtitle like '%" + @term + "%') or (Organization.OrganizationName " +
            "like '%" + @term + "%') or (joblisting.jobdescription like '%" + @term + "%'))";


        DataTable dt = new DataTable();
        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["DBConnectionString"].ConnectionString);
        conn.Open();
        SqlDataAdapter da = new SqlDataAdapter(query, conn);
        da.SelectCommand.Parameters.AddWithValue("@schoolid", schoolid);
        da.SelectCommand.Parameters.AddWithValue("@term", term);
        da.Fill(dt);
        gridviewAccJobs.DataSource = dt;
        gridviewAccJobs.DataBind();
        conn.Close();
    }

    protected void SearchButton2_Click(object sender, EventArgs e)
    {
        String term = SearchBox1.Text;

        string query = "SELECT JobListing.JobTitle, Organization.OrganizationName, JobListing.JobListingID, JobListing.JobDescription, JobListing.JobType, JobListing.Location, Organization.OrganizationDescription, " +
                  " Organization.ExternalLink FROM  OpportunityEntity INNER JOIN " +
                  "SchoolApproval ON OpportunityEntity.OpportunityEntityID = SchoolApproval.OpportunityEntityID INNER JOIN " +
                  "School ON SchoolApproval.SchoolEntityID = School.SchoolEntityID INNER JOIN " +
                  " JobListing ON OpportunityEntity.OpportunityEntityID = JobListing.JobListingID INNER JOIN " +
                  "Organization ON JobListing.OrganizationID = Organization.OrganizationEntityID " +
                  "WHERE school.SchoolEntityID = " + @schoolid + "  and SchoolApproval.ApprovedFlag = 'N' and ((joblisting.jobtitle like '%" + @term + "%') or (Organization.OrganizationName " +
            "like '%" + @term + "%') or (joblisting.jobdescription like '%" + @term + "%'))";


        DataTable dt = new DataTable();
        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["DBConnectionString"].ConnectionString);
        conn.Open();
        SqlDataAdapter da = new SqlDataAdapter(query, conn);
        da.SelectCommand.Parameters.AddWithValue("@schoolid", schoolid);
        da.SelectCommand.Parameters.AddWithValue("@term", term);
        da.Fill(dt);
        gridviewRejJobs.DataSource = dt;
        gridviewRejJobs.DataBind();
        conn.Close();

    }

    protected void cbSelectAll_Checked(object sender, EventArgs e)
    {
        if (cbSelectAll.Checked == true)
        {
            chkJobDescription1.Checked = true;
            chkJobLocation1.Checked = true;
            chkJobType1.Checked = true;
            cbSelectAll.Text = "Unselect All";
        }

        if (cbSelectAll.Checked == false)
        {
            chkJobDescription1.Checked = false;
            chkJobLocation1.Checked = false;
            chkJobType1.Checked = false;
            cbSelectAll.Text = "Select All";
        }
    }

    protected void cbSelectAll2_Checked(object sender, EventArgs e)
    {
        if (cbSelectAll2.Checked == true)
        {
            chkJobDescription.Checked = true;
            chkJobLocation.Checked = true;
            chkJobType.Checked = true;
            cbSelectAll2.Text = "Unselect All";
        }

        if (cbSelectAll2.Checked == false)
        {
            chkJobDescription.Checked = false;
            chkJobLocation.Checked = false;
            chkJobType.Checked = false;
            cbSelectAll2.Text = "Select All";
        }
    }
}