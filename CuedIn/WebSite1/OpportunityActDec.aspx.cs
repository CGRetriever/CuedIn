using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class OpportunityActDec : System.Web.UI.Page
{
    private  static String email;
    private int schoolid = 12;
    protected void Page_Load(object sender, EventArgs e)
    {
        
        if (Session["schoolid"] != null)
        {
            schoolid = Convert.ToInt32(Session["schoolid"]);
            if (Session["schoolid"].Equals(12))
            {
                lousiapc.Visible = true;
                lousiaphone.Visible = true;
                lousiatablet.Visible = true;
            }
            else if (Session["schoolid"].Equals(13))
            {

            }

            else if (Session["schoolid"].Equals(15))
            {
                turnerpc.Visible = true;
                turnerphone.Visible = true;
                turnertablet.Visible = true;
            }
        }
        else
        {
            lousiapc.Visible = true;



        }




        string query = "SELECT JobListing.JobTitle, Organization.OrganizationName, JobListing.JobListingID, JobListing.JobDescription, JobListing.JobType, JobListing.Location, Organization.OrganizationDescription, " +
            "Organization.ExternalLink FROM  OpportunityEntity INNER JOIN SchoolApproval ON " +
            "OpportunityEntity.OpportunityEntityID = SchoolApproval.OpportunityEntityID INNER JOIN " +
            "School ON SchoolApproval.SchoolEntityID = School.SchoolEntityID INNER JOIN" +
            " JobListing ON OpportunityEntity.OpportunityEntityID = JobListing.JobListingID INNER JOIN" +
            " Organization ON JobListing.OrganizationID = Organization.OrganizationEntityID" +
            " WHERE schoolapproval.SchoolEntityID = " + @schoolid + " and SchoolApproval.ApprovedFlag = 'P'" ;

        if (SearchBox1 != null)
        {
            object send1 = new object();
            EventArgs e1 = new EventArgs();
            SearchButton1_Click(send1, e1);
        }

        else
        {
            DataTable dt = new DataTable();
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["DBConnectionString"].ConnectionString);
            conn.Open();
            SqlDataAdapter da = new SqlDataAdapter(query, conn);
            da.SelectCommand.Parameters.AddWithValue("@schoolid", schoolid);
            da.Fill(dt);
            GridView1.DataSource = dt;
            GridView1.DataBind();
            conn.Close();
        }

        if (SearchBox2 != null)
        {
            object send1 = new object();
            EventArgs e1 = new EventArgs();
            SearchButton2_Click(send1, e1);
        }
        else
        {

            string query1 = "SELECT Scholarship.ScholarshipID,Scholarship.ScholarshipName, Scholarship.ScholarshipDescription, Scholarship.ScholarshipMin, Scholarship.ScholarshipMax, Organization.OrganizationName, Organization.OrganizationDescription, " +
                " Organization.ExternalLink" +
                " FROM OpportunityEntity INNER JOIN" +
                "   Scholarship ON OpportunityEntity.OpportunityEntityID = Scholarship.ScholarshipID INNER JOIN " +
                " SchoolApproval ON OpportunityEntity.OpportunityEntityID = SchoolApproval.OpportunityEntityID INNER JOIN " +
                "School ON SchoolApproval.SchoolEntityID = School.SchoolEntityID INNER JOIN " +
                "Organization ON Scholarship.OrganizationID = Organization.OrganizationEntityID " +
                " where school.SchoolEntityID = " + schoolid + " and SchoolApproval.ApprovedFlag = 'P'";

            DataTable dt1 = new DataTable();
            SqlConnection conn1 = new SqlConnection(ConfigurationManager.ConnectionStrings["DBConnectionString"].ConnectionString);
            conn1.Open();
            SqlDataAdapter da1 = new SqlDataAdapter(query1, conn1);
            da1.SelectCommand.Parameters.AddWithValue("@schoolid", schoolid);
            da1.Fill(dt1);
            GridView2.DataSource = dt1;
            GridView2.DataBind();
            conn1.Close();
        }

        ((Label)Master.FindControl("lblMaster")).Text = "Manage Jobs and <br> Scholarships";
        ((Label)Master.FindControl("lblMaster")).Attributes.Add("Style", "color: #fff; text-align:center; text-transform: uppercase; letter-spacing: 6px; font-size: 2.0em; margin: .67em");

        cbSelectAll.Attributes.Add("onclick", "Selectall");




        cbSelectAll2.Attributes.Add("onclick", "Selectall");

        


    }



    public override void VerifyRenderingInServerForm(Control control)
    {
        /* Verifies that the control is rendered */
    }

    //approve button clicked in gridview--opens modal-- populates modal
    protected void approveJobLinkBtn_Click(object sender, CommandEventArgs e)
    {
        String connectionString = ConfigurationManager.ConnectionStrings["DBConnectionString"].ConnectionString;
        System.Data.SqlClient.SqlConnection sql = new System.Data.SqlClient.SqlConnection(connectionString);

        int rowIndex = Convert.ToInt32(((sender as LinkButton).NamingContainer as GridViewRow).RowIndex);
        GridViewRow row = GridView1.Rows[rowIndex];

        int jobID = Convert.ToInt32(e.CommandArgument);

        Session["selectedjobID"] = jobID.ToString();

        String temp = Session["selectedjobID"].ToString();

        sql.Open();
        System.Data.SqlClient.SqlCommand moreJobInfo = new System.Data.SqlClient.SqlCommand();
        moreJobInfo.Connection = sql;
        moreJobInfo.CommandText = "SELECT Organization.OrganizationName, JobListing.JobTitle FROM JobListing INNER JOIN Organization ON JobListing.OrganizationID = Organization.OrganizationEntityID where JobListingID = " + Session["selectedjobid"];
        System.Data.SqlClient.SqlDataReader reader = moreJobInfo.ExecuteReader();



        while (reader.Read())
        {
            Label2.Text = reader.GetString(0);
            sublabelapprovemodal.Text = reader.GetString(1);

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
    //yes button clicked in modal-- sends to DB
    protected void acceptJobButton_Click(object sender, EventArgs e)
    {
        String connectionString = ConfigurationManager.ConnectionStrings["DBConnectionString"].ConnectionString;
        System.Data.SqlClient.SqlConnection sql = new System.Data.SqlClient.SqlConnection(connectionString);

        sql.Open();
        System.Data.SqlClient.SqlCommand approveJob = new System.Data.SqlClient.SqlCommand();
        approveJob.Connection = sql;
        approveJob.CommandText = "update schoolApproval set approvedFlag = 'Y', schoolApproval.LastUpdated = getdate() where OpportunityEntityID = " + Session["selectedjobID"] + " and schoolEntityID = " + Session["schoolID"];
        approveJob.ExecuteNonQuery();
        sql.Close();

        Response.Redirect("~/OpportunityActDec.aspx");
    }

    //reject button clicked in gridview-- populates modal
    protected void rejectJobLinkBtn_Click(object sender, CommandEventArgs e)
    {
        String connectionString = ConfigurationManager.ConnectionStrings["DBConnectionString"].ConnectionString;
        System.Data.SqlClient.SqlConnection sql = new System.Data.SqlClient.SqlConnection(connectionString);

        int rowIndex = Convert.ToInt32(((sender as LinkButton).NamingContainer as GridViewRow).RowIndex);
        GridViewRow row = GridView1.Rows[rowIndex];

        int jobID = Convert.ToInt32(e.CommandArgument);

        Session["selectedjobID"] = jobID.ToString();


        sql.Open();
        System.Data.SqlClient.SqlCommand moreJobInfo = new System.Data.SqlClient.SqlCommand();
        moreJobInfo.Connection = sql;
        moreJobInfo.CommandText = "SELECT Organization.OrganizationName, JobListing.JobTitle FROM JobListing INNER JOIN Organization ON JobListing.OrganizationID = Organization.OrganizationEntityID where JobListingID = " + Session["selectedjobid"];
        System.Data.SqlClient.SqlDataReader reader = moreJobInfo.ExecuteReader();



        while (reader.Read())
        {
            Label3.Text = reader.GetString(0);
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
        rejectJob.CommandText = "update schoolApproval set approvedFlag = 'N', schoolApproval.LastUpdated = getdate() where OpportunityEntityID = " + Session["selectedjobID"] + " and schoolEntityID = " + Session["schoolID"]; ;
        rejectJob.ExecuteNonQuery();
        sql.Close();

        Response.Redirect("~/OpportunityActDec.aspx");
    }
    //more info button clicked in gridview
    protected void moreInfoJobLinkBtn_Click(object sender, CommandEventArgs e)
    {
        String connectionString = ConfigurationManager.ConnectionStrings["DBConnectionString"].ConnectionString;
        System.Data.SqlClient.SqlConnection sql = new System.Data.SqlClient.SqlConnection(connectionString);

        int rowIndex = Convert.ToInt32(((sender as LinkButton).NamingContainer as GridViewRow).RowIndex);
        GridViewRow row = GridView1.Rows[rowIndex];


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
            lblJOrganizationDescription.Text = "Organization Description: "+ reader.GetString(1);
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



    //more info button clicked in scholarship gridview
    protected void LinkButton1_Click(object sender, CommandEventArgs e)
    {

        String connectionString = ConfigurationManager.ConnectionStrings["DBConnectionString"].ConnectionString;
        System.Data.SqlClient.SqlConnection sql = new System.Data.SqlClient.SqlConnection(connectionString);

        int rowIndex = Convert.ToInt32(((sender as LinkButton).NamingContainer as GridViewRow).RowIndex);
        GridViewRow row = GridView2.Rows[rowIndex];


        int scholarshipID = Convert.ToInt32(e.CommandArgument);

        sql.Open();
        System.Data.SqlClient.SqlCommand moreScholarshipInfo = new System.Data.SqlClient.SqlCommand();
        moreScholarshipInfo.Connection = sql;
        moreScholarshipInfo.CommandText = "SELECT Scholarship.ScholarshipName, Scholarship.ScholarshipDescription, Scholarship.ScholarshipMin, Scholarship.ScholarshipMax, Scholarship.ScholarshipQuantity, Scholarship.ScholarshipDueDate, Organization.OrganizationName, Organization.OrganizationDescription FROM Scholarship INNER JOIN Organization ON Scholarship.OrganizationID = Organization.OrganizationEntityID WHERE Scholarship.ScholarshipID = " + scholarshipID;
        System.Data.SqlClient.SqlDataReader reader = moreScholarshipInfo.ExecuteReader();



        while (reader.Read())
        {
            //set labels to db values
            lblSOrganizationName.Text = "Organization Name: " + reader.GetString(6);
            lblSOrganizationDescription.Text = "Organization Description: " + reader.GetString(7);
            lblScholarshipName.Text = "Scholarship Name : " + reader.GetString(0);
            lblScholarshipDescription.Text = "Scholarship Description: " + reader.GetString(1);
            lblScholarshipMin.Text = "Scholarship Minimum: $" + reader.GetSqlMoney(2);
            lblScholarshipMax.Text = "Scholarship Maximum: $" + reader.GetSqlMoney(3);
            lblScholarshipQuantity.Text = "Scholarship Quantity: " + reader.GetInt32(4);
            lblScholarshipDueDate.Text = "Scholarship Due Date: " + reader.GetDateTime(5);

        }

        Session["selectedScholarshipID"] = scholarshipID.ToString();

        ClientScript.RegisterStartupScript(this.GetType(), "Pop", "openEditJModal();", true);

    }
    //approve button clicked in scholarship gridview
    protected void LinkButton2_Click(object sender, CommandEventArgs e)
    {
        String connectionString = ConfigurationManager.ConnectionStrings["DBConnectionString"].ConnectionString;
        System.Data.SqlClient.SqlConnection sql = new System.Data.SqlClient.SqlConnection(connectionString);
        
        int rowIndex = Convert.ToInt32(((sender as LinkButton).NamingContainer as GridViewRow).RowIndex);
        GridViewRow row = GridView2.Rows[rowIndex];

        int scholarshipID = Convert.ToInt32(e.CommandArgument);

        Session["selectedScholarshipID"] = scholarshipID.ToString();


        sql.Open();
        System.Data.SqlClient.SqlCommand moreJobInfo = new System.Data.SqlClient.SqlCommand();
        moreJobInfo.Connection = sql;
        moreJobInfo.CommandText = "SELECT Organization.OrganizationName, Scholarship.ScholarshipName FROM  Scholarship INNER JOIN Organization ON Scholarship.OrganizationID = Organization.OrganizationEntityID where Scholarship.ScholarshipID = " + Session["selectedScholarshipID"];
        System.Data.SqlClient.SqlDataReader reader = moreJobInfo.ExecuteReader();



        while (reader.Read())
        {

            scholarApproveLabel.Text = reader.GetString(0);
            subscholarApproveLabel.Text = reader.GetString(1);
        }

        sql.Close();



        System.Data.SqlClient.SqlConnection EmailQuery = new System.Data.SqlClient.SqlConnection(connectionString);


        // Mail Button Query
        EmailQuery.Open();
        System.Data.SqlClient.SqlCommand query = new System.Data.SqlClient.SqlCommand();
        query.Connection = EmailQuery;
        query.CommandText = "SELECT  UserEntity.EmailAddress FROM  Scholarship INNER JOIN Organization ON Scholarship.OrganizationID = Organization.OrganizationEntityID INNER JOIN UserEntity ON Organization.OrganizationEntityID = UserEntity.UserEntityID WHERE Scholarship.ScholarshipID= " + Session["selectedScholarshipID"];
        System.Data.SqlClient.SqlDataReader Result = query.ExecuteReader();



        while (Result.Read())
        {
            email = Result.GetString(0);
        }

        EmailQuery.Close();


        AcceptSMailButton.NavigateUrl = "mailto:" + email + "?Subject=CommUP:%20Scholarship%20Approval!";

        ClientScript.RegisterStartupScript(this.GetType(), "Pop", "openApproveSModal();", true);
    }

    //reject button clicked in scholarship gridview
    protected void LinkButton3_Click(object sender, CommandEventArgs e)
    {
        String connectionString = ConfigurationManager.ConnectionStrings["DBConnectionString"].ConnectionString;
        System.Data.SqlClient.SqlConnection sql = new System.Data.SqlClient.SqlConnection(connectionString);

        int rowIndex = Convert.ToInt32(((sender as LinkButton).NamingContainer as GridViewRow).RowIndex);
        GridViewRow row = GridView2.Rows[rowIndex];

        int scholarshipID = Convert.ToInt32(e.CommandArgument);

        Session["selectedScholarshipID"] = scholarshipID.ToString();

        sql.Open();
        System.Data.SqlClient.SqlCommand moreJobInfo = new System.Data.SqlClient.SqlCommand();
        moreJobInfo.Connection = sql;
        moreJobInfo.CommandText = "SELECT Organization.OrganizationName, Scholarship.ScholarshipName FROM  Scholarship INNER JOIN Organization ON Scholarship.OrganizationID = Organization.OrganizationEntityID where Scholarship.ScholarshipID = " + Session["selectedScholarshipID"];
        System.Data.SqlClient.SqlDataReader reader = moreJobInfo.ExecuteReader();



        while (reader.Read())
        {
            scholarRejectLabel.Text = reader.GetString(0);
            scholarsubRejectLabel.Text = reader.GetString(1);
        }

        sql.Close();


        System.Data.SqlClient.SqlConnection EmailQuery = new System.Data.SqlClient.SqlConnection(connectionString);


        // Mail Button Query
        EmailQuery.Open();
        System.Data.SqlClient.SqlCommand query = new System.Data.SqlClient.SqlCommand();
        query.Connection = EmailQuery;
        query.CommandText = "SELECT  UserEntity.EmailAddress FROM  Scholarship INNER JOIN Organization ON Scholarship.OrganizationID = Organization.OrganizationEntityID INNER JOIN UserEntity ON Organization.OrganizationEntityID = UserEntity.UserEntityID WHERE Scholarship.ScholarshipID= " + Session["selectedScholarshipID"];
        System.Data.SqlClient.SqlDataReader Result = query.ExecuteReader();



        while (Result.Read())
        {
            email = Result.GetString(0);
        }

        EmailQuery.Close();


        RejectSMailButton.NavigateUrl = "mailto:" + email + "?Subject=CommUP:%20Scholarship%20Rejection";
        
        ClientScript.RegisterStartupScript(this.GetType(), "Pop", "openRejectSModal();", true);
    }
    //reject button clicked in modal-- updates DB
    protected void rejectScholarshipButton_Click(object sender, EventArgs e)
    {
        String connectionString = ConfigurationManager.ConnectionStrings["DBConnectionString"].ConnectionString;
        System.Data.SqlClient.SqlConnection sql = new System.Data.SqlClient.SqlConnection(connectionString);

        sql.Open();
        System.Data.SqlClient.SqlCommand rejectScholarship = new System.Data.SqlClient.SqlCommand();
        rejectScholarship.Connection = sql;
        rejectScholarship.CommandText = "update schoolApproval set approvedFlag = 'N', schoolApproval.LastUpdated = getdate() where OpportunityEntityID = " + Session["selectedScholarshipID"] + " and schoolEntityID = " + Session["schoolID"]; ;
        rejectScholarship.ExecuteNonQuery();
        sql.Close();
        
        Response.Redirect("~/OpportunityActDec.aspx");
    }
    //approve button clicked in modal-- updates DB
    protected void acceptScholarshipButton_Click(object sender, EventArgs e)
    {
        String connectionString = ConfigurationManager.ConnectionStrings["DBConnectionString"].ConnectionString;
        System.Data.SqlClient.SqlConnection sql = new System.Data.SqlClient.SqlConnection(connectionString);

        sql.Open();
        System.Data.SqlClient.SqlCommand approveScholarship = new System.Data.SqlClient.SqlCommand();
        approveScholarship.Connection = sql;
        approveScholarship.CommandText = "update schoolApproval set approvedFlag = 'Y', schoolApproval.LastUpdated = getdate() where OpportunityEntityID = " + Session["selectedScholarshipID"] + " and schoolEntityID = " + Session["schoolID"]; ;
        approveScholarship.ExecuteNonQuery();
        sql.Close();

        Response.Redirect("~/OpportunityActDec.aspx");
    }

    

    //mail bullshit
    protected void Button3_Click1(object sender, EventArgs e)
    {
        // Stopped here before class. Need to get the query result from the database (the business email) and store that as a variable to pass
        // to the client script start up


        String connectionString = ConfigurationManager.ConnectionStrings["DBConnectionString"].ConnectionString;
        System.Data.SqlClient.SqlConnection sql = new System.Data.SqlClient.SqlConnection(connectionString);


        sql.Open();
        System.Data.SqlClient.SqlCommand approveScholarship = new System.Data.SqlClient.SqlCommand();
        approveScholarship.Connection = sql;
        approveScholarship.CommandText = "SELECT EmailAddress FROM  UserEntity where UserEntityID = " + Session["selectedScholarshipID"] + " and schoolEntityID = " + Session["schoolID"];
        System.Data.SqlClient.SqlDataReader reader = approveScholarship.ExecuteReader();


        while (reader.Read())
        {
            email = reader.GetString(0);
        }

        sql.Close();


    }


    protected void btnCheckGridView_Click(object sender, EventArgs e)
    {


        if (chkJobDescription.Checked != true)
        {
            for (int i = 0; i < GridView1.Columns.Count; i++)
            {
                if (GridView1.Columns[i].HeaderText == "Job Description")
                {
                    GridView1.Columns[i].Visible = false;

                }
            }
        }
        else
        {
            for (int i = 0; i < GridView1.Columns.Count; i++)
            {
                if (GridView1.Columns[i].HeaderText == "Job Description")
                {
                    GridView1.Columns[i].Visible = true;

                }
            }
        }


        if (chkJobType.Checked != true)
        {
            for (int i = 0; i < GridView1.Columns.Count; i++)
            {
                if (GridView1.Columns[i].HeaderText == "Job Type")
                {
                    GridView1.Columns[i].Visible = false;

                }
            }
        }
        else
        {
            for (int i = 0; i < GridView1.Columns.Count; i++)
            {
                if (GridView1.Columns[i].HeaderText == "Job Type")
                {
                    GridView1.Columns[i].Visible = true;

                }
            }
        }


        if (chkJobLocation.Checked != true)
        {
            for (int i = 0; i < GridView1.Columns.Count; i++)
            {
                if (GridView1.Columns[i].HeaderText == "Location")
                {
                    GridView1.Columns[i].Visible = false;

                }
            }
        }
        else
        {
            for (int i = 0; i < GridView1.Columns.Count; i++)
            {
                if (GridView1.Columns[i].HeaderText == "Location")
                {
                    GridView1.Columns[i].Visible = true;

                }
            }
        }



    }

    protected void btnCheckGridView2_Click(object sender, EventArgs e)
    {


        if (chkScholarshipMin.Checked != true)
        {
            for (int i = 0; i < GridView2.Columns.Count; i++)
            {
                if (GridView2.Columns[i].HeaderText == "Scholarship Minimum")
                {
                    GridView2.Columns[i].Visible = false;

                }
            }
        }
        else
        {
            for (int i = 0; i < GridView2.Columns.Count; i++)
            {
                if (GridView2.Columns[i].HeaderText == "Scholarship Minimum")
                {
                    GridView2.Columns[i].Visible = true;

                }
            }
        }

        if (chkScholarshipMax.Checked != true)
        {
            for (int i = 0; i < GridView2.Columns.Count; i++)
            {
                if (GridView2.Columns[i].HeaderText == "Scholarship Maximum")
                {
                    GridView2.Columns[i].Visible = false;

                }
            }
        }
        else
        {
            for (int i = 0; i < GridView2.Columns.Count; i++)
            {
                if (GridView2.Columns[i].HeaderText == "Scholarship Maximum")
                {
                    GridView2.Columns[i].Visible = true;

                }
            }
        }
        //SearchBox1.Text = "";
        //SearchBox2.Text = "";
    }



    protected void SearchButton1_Click(object sender, EventArgs e)
    {
        String term = SearchBox1.Text;

        string query = "SELECT JobListing.JobTitle, Organization.OrganizationName, JobListing.JobListingID, JobListing.JobDescription, JobListing.JobType, JobListing.Location, Organization.OrganizationDescription, " +
            "Organization.ExternalLink FROM  OpportunityEntity INNER JOIN SchoolApproval ON " +
            "OpportunityEntity.OpportunityEntityID = SchoolApproval.OpportunityEntityID INNER JOIN " +
            "School ON SchoolApproval.SchoolEntityID = School.SchoolEntityID INNER JOIN" +
            " JobListing ON OpportunityEntity.OpportunityEntityID = JobListing.JobListingID INNER JOIN" +
            " Organization ON JobListing.OrganizationID = Organization.OrganizationEntityID" +
            " WHERE schoolapproval.SchoolEntityID = " + @schoolid + " and SchoolApproval.ApprovedFlag = 'P'and((JobListing.JobTitle like '%" + @term + "%') or (Organization.OrganizationName " +
            "like '%" + @term + "%') or (JobListing.JobDescription like '%" + @term
            + "%') or (JobListing.JobType like '%" + @term + "%')) and schoolapproval.SchoolEntityID =  " + @schoolid;

      


        DataTable dt = new DataTable();
        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["DBConnectionString"].ConnectionString);
        conn.Open();
        SqlDataAdapter da = new SqlDataAdapter(query, conn);
        da.SelectCommand.Parameters.AddWithValue("@schoolid", schoolid);
        da.SelectCommand.Parameters.AddWithValue("@term", term);
        da.Fill(dt);
        GridView1.DataSource = dt;
        GridView1.DataBind();
        conn.Close();
    }

    protected void SearchButton2_Click(object sender, EventArgs e)
    {
        String term = SearchBox2.Text;

         //Just need to parameterize it
        string query = "SELECT Scholarship.ScholarshipID,Scholarship.ScholarshipName, Scholarship.ScholarshipDescription, Scholarship.ScholarshipMin, Scholarship.ScholarshipMax, Organization.OrganizationName, Organization.OrganizationDescription, " +
        " Organization.ExternalLink" +
        " FROM OpportunityEntity INNER JOIN" +
        "   Scholarship ON OpportunityEntity.OpportunityEntityID = Scholarship.ScholarshipID INNER JOIN " +
        " SchoolApproval ON OpportunityEntity.OpportunityEntityID = SchoolApproval.OpportunityEntityID INNER JOIN " +
        "School ON SchoolApproval.SchoolEntityID = School.SchoolEntityID INNER JOIN " +
        "Organization ON Scholarship.OrganizationID = Organization.OrganizationEntityID " +
        " where school.SchoolEntityID = " + @schoolid + " and SchoolApproval.ApprovedFlag = 'P' and((scholarship.scholarshipname like '%" + @term + "%') or (Organization.OrganizationName " +
            "like '%" + @term + "%') ) and schoolapproval.SchoolEntityID =  " + @schoolid;

        
        DataTable dt = new DataTable();
        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["DBConnectionString"].ConnectionString);
        conn.Open();
        SqlDataAdapter da = new SqlDataAdapter(query, conn);
        da.SelectCommand.Parameters.AddWithValue("@schoolid", schoolid);
        da.SelectCommand.Parameters.AddWithValue("@term", term);
        da.Fill(dt);
        GridView2.DataSource = dt;
        GridView2.DataBind();
        conn.Close();

    }

    protected void cbSelectAll_Checked(object sender, EventArgs e)
    {
        if (cbSelectAll.Checked == true)
        {
            chkJobDescription.Checked = true;
            chkJobLocation.Checked = true;
            chkJobType.Checked = true;
            cbSelectAll.Text = "Unselect All";

        }

        if (cbSelectAll.Checked == false)
        {
            chkJobDescription.Checked = false;
            chkJobLocation.Checked = false;
            chkJobType.Checked = false;
            cbSelectAll.Text = "Select All";
        }
    }

    protected void cbSelectAll2_Checked(object sender, EventArgs e)
    {
        if (cbSelectAll2.Checked == true)
        {
            chkScholarshipMin.Checked = true;
            chkScholarshipMax.Checked = true;
            cbSelectAll2.Text = "Unselect All";

        }

        if (cbSelectAll2.Checked == false)
        {
            chkScholarshipMin.Checked = false;
            chkScholarshipMax.Checked = false;
            cbSelectAll2.Text = "Select All";
        }
    }
}