using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class OpportunityActDec : System.Web.UI.Page
{
    public static String email;
    public static String fullName;

    protected void Page_Load(object sender, EventArgs e)
    {
        GridView1.Columns[0].Visible = false;
    }



    public override void VerifyRenderingInServerForm(Control control)
    {
        /* Verifies that the control is rendered */
    }

    protected void GridView1_OnRowCommand(object sender, GridViewCommandEventArgs e)

    {
        int jobID = Convert.ToInt32(e.CommandArgument);
        String connectionString = ConfigurationManager.ConnectionStrings["DBConnectionString"].ConnectionString;
        System.Data.SqlClient.SqlConnection sql = new System.Data.SqlClient.SqlConnection(connectionString);

        if (e.CommandName == "JApprove")
        {
            //sql.Open();
            //System.Data.SqlClient.SqlCommand approveJob = new System.Data.SqlClient.SqlCommand();
            //approveJob.Connection = sql;
            //approveJob.CommandText = "update joblisting set approved = 'yes', lastUpdated ='" + DateTime.Today + "' where joblistingID = " + jobID;
            //approveJob.ExecuteNonQuery();
            //sql.Close();

            //Maybe pop-up box that says "Job XYZ Approved, would you like to send to a student?"//
            ClientScript.RegisterStartupScript(this.GetType(), "Pop", "openModal();", true);

        }
        else if (e.CommandName == "JReject")
        {
            //sql.Open();
            //System.Data.SqlClient.SqlCommand rejectJob = new System.Data.SqlClient.SqlCommand();
            //rejectJob.Connection = sql;
            //rejectJob.CommandText = "update joblisting set approved = 'no', lastUpdated ='" + DateTime.Today + "' where joblistingID = " + jobID;
            //rejectJob.ExecuteNonQuery();
            //sql.Close();

            //Maybe pop-up box that says "Job XYZ Rejected, would you like to message the business??"//
        }




        Response.Redirect(Request.RawUrl);

    }

    protected void approveJobLinkBtn_Click(object sender, CommandEventArgs e)
    {
        String connectionString = ConfigurationManager.ConnectionStrings["DBConnectionString"].ConnectionString;
        System.Data.SqlClient.SqlConnection sql = new System.Data.SqlClient.SqlConnection(connectionString);

        int rowIndex = Convert.ToInt32(((sender as LinkButton).NamingContainer as GridViewRow).RowIndex);
        GridViewRow row = GridView1.Rows[rowIndex];

        int jobID = Convert.ToInt32(e.CommandArgument);

        Session["selectedLogID"] = jobID.ToString();

        ClientScript.RegisterStartupScript(this.GetType(), "Pop", "openApproveXModal();", true);
    }

    protected void acceptJobButton_Click(object sender, EventArgs e)
    {
        String connectionString = ConfigurationManager.ConnectionStrings["DBConnectionString"].ConnectionString;
        System.Data.SqlClient.SqlConnection sql = new System.Data.SqlClient.SqlConnection(connectionString);

        sql.Open();
        System.Data.SqlClient.SqlCommand approveJob = new System.Data.SqlClient.SqlCommand();
        approveJob.Connection = sql;
        approveJob.CommandText = "update LogHours set CounselorApproval = 'Y' where logID = " + Session["selectedLogID"];
        approveJob.ExecuteNonQuery();
        sql.Close();

        GridView1.DataBind();

        Response.Redirect("~/HoursApprovalPage.aspx");
    }


    protected void rejectJobLinkBtn_Click(object sender, CommandEventArgs e)
    {
        String connectionString = ConfigurationManager.ConnectionStrings["DBConnectionString"].ConnectionString;
        System.Data.SqlClient.SqlConnection sql = new System.Data.SqlClient.SqlConnection(connectionString);

        int rowIndex = Convert.ToInt32(((sender as LinkButton).NamingContainer as GridViewRow).RowIndex);
        GridViewRow row = GridView1.Rows[rowIndex];

        int jobID = Convert.ToInt32(e.CommandArgument);

        Session["selectedLogID"] = jobID.ToString();

        ClientScript.RegisterStartupScript(this.GetType(), "Pop", "openRejectJModal();", true);
    }

    protected void rejectJobButton_Click(object sender, EventArgs e)
    {
        String connectionString = ConfigurationManager.ConnectionStrings["DBConnectionString"].ConnectionString;
        System.Data.SqlClient.SqlConnection sql = new System.Data.SqlClient.SqlConnection(connectionString);

        sql.Open();
        System.Data.SqlClient.SqlCommand rejectJob = new System.Data.SqlClient.SqlCommand();
        rejectJob.Connection = sql;
        rejectJob.CommandText = "update LogHours set CounselorApproval = 'N' where logID = " + Session["selectedLogID"];
        rejectJob.ExecuteNonQuery();
        sql.Close();

        GridView1.DataBind();

        Response.Redirect("~/HoursApprovalPage.aspx");
    }

    protected void moreInfoJobLinkBtn_Click(object sender, CommandEventArgs e)
    {
        // working here

        String connectionString = ConfigurationManager.ConnectionStrings["DBConnectionString"].ConnectionString;
        System.Data.SqlClient.SqlConnection sql = new System.Data.SqlClient.SqlConnection(connectionString);

        int rowIndex = Convert.ToInt32(((sender as LinkButton).NamingContainer as GridViewRow).RowIndex);
        GridViewRow row = GridView1.Rows[rowIndex];


        int jobID = Convert.ToInt32(e.CommandArgument);
        Session["selectedLogID"] = jobID.ToString();

        sql.Open();
        System.Data.SqlClient.SqlCommand moreJobInfo = new System.Data.SqlClient.SqlCommand();
        moreJobInfo.Connection = sql;
        moreJobInfo.CommandText = "SELECT StudentComment.Comment, OrganizationComment.Comment AS Expr1 FROM OrganizationComment INNER JOIN StudentComment ON OrganizationComment.LogID = StudentComment.LogID INNER JOIN LogHours ON OrganizationComment.LogID = LogHours.LogID where LogHours.LogID = " + Session["selectedLogID"];
        System.Data.SqlClient.SqlDataReader reader = moreJobInfo.ExecuteReader();

        while (reader.Read())
        {
            StudentComment.Text = reader.GetString(0);
            BusinessComment.Text = reader.GetString(1);
        }

        sql.Close();


     


        ClientScript.RegisterStartupScript(this.GetType(), "Pop", "openEditJModal();", true);



    }




    protected void LinkButton1_Click(object sender, CommandEventArgs e)
    {

        //int rowIndex = Convert.ToInt32(((sender as LinkButton).NamingContainer as GridViewRow).RowIndex);
        //GridViewRow row = GridView2.Rows[rowIndex];
        ////lblstudentid.Text = (row.FindControl("lblstudent_Id") as Label).Text;
        ////lblmonth.Text = (row.FindControl("lblMonth_Name") as Label).Text; ;
        ////txtAmount.Text = (row.FindControl("lblAmount") as Label).Text;

        //String sName;
        //String sDesc;

        //sName = GridView2.Rows[rowIndex].Cells[0].Text;
        //sDesc = GridView2.Rows[rowIndex].Cells[1].Text;

        ////String primarykey;

        ////  primarykey = GridView2.Rows[rowIndex].Cells[0].Text;
        //String connectionString = ConfigurationManager.ConnectionStrings["DBConnectionString"].ConnectionString;
        //System.Data.SqlClient.SqlConnection sql = new System.Data.SqlClient.SqlConnection(connectionString);

        //int rowIndex = Convert.ToInt32(((sender as LinkButton).NamingContainer as GridViewRow).RowIndex);
        ////GridViewRow row = GridView2.Rows[rowIndex];


        //int scholarshipID = Convert.ToInt32(e.CommandArgument);

        //sql.Open();
        //System.Data.SqlClient.SqlCommand moreScholarshipInfo = new System.Data.SqlClient.SqlCommand();
        //moreScholarshipInfo.Connection = sql;
        //moreScholarshipInfo.CommandText = "SELECT Scholarship.ScholarshipName, Scholarship.ScholarshipDescription, Scholarship.ScholarshipMin, Scholarship.ScholarshipMax, Scholarship.ScholarshipQuantity, Scholarship.ScholarshipDueDate, Organization.OrganizationName, Organization.OrganizationDescription FROM Scholarship INNER JOIN Organization ON Scholarship.OrganizationID = Organization.OrganizationEntityID WHERE Scholarship.ScholarshipID = " + scholarshipID;
        //System.Data.SqlClient.SqlDataReader reader = moreScholarshipInfo.ExecuteReader();



        //while (reader.Read())
        //{
        //    //set labels to db values
        //    lblSOrganizationName.Text = "Organization Name: " + reader.GetString(6);
        //    lblSOrganizationDescription.Text = "Organization Description: " + reader.GetString(7);
        //    lblScholarshipName.Text = "Scholarship Name : " + reader.GetString(0);
        //    lblScholarshipDescription.Text = "Scholarship Description: " + reader.GetString(1);
        //    lblScholarshipMin.Text = "Scholarship Minimum: " + reader.GetSqlMoney(2);
        //    lblScholarshipMax.Text = "Scholarship Maximum: " + reader.GetSqlMoney(3);
        //    lblScholarshipQuantity.Text = "Scholarship Quantity: " + reader.GetInt32(4);
        //    lblScholarshipDueDate.Text = "Scholarship Due Date: " + reader.GetDateTime(5);

        //}

        //Session["selectedScholarshipID"] = scholarshipID.ToString();

        //ClientScript.RegisterStartupScript(this.GetType(), "Pop", "openEditJModal();", true);

    }

    protected void LinkButton2_Click(object sender, CommandEventArgs e)
    {
        String connectionString = ConfigurationManager.ConnectionStrings["DBConnectionString"].ConnectionString;
        System.Data.SqlClient.SqlConnection sql = new System.Data.SqlClient.SqlConnection(connectionString);

        int rowIndex = Convert.ToInt32(((sender as LinkButton).NamingContainer as GridViewRow).RowIndex);
        //GridViewRow row = GridView2.Rows[rowIndex];

        int scholarshipID = Convert.ToInt32(e.CommandArgument);

        Session["selectedScholarshipID"] = scholarshipID.ToString();

        ClientScript.RegisterStartupScript(this.GetType(), "Pop", "openApproveSModal();", true);
    }


    protected void LinkButton3_Click(object sender, CommandEventArgs e)
    {
        String connectionString = ConfigurationManager.ConnectionStrings["DBConnectionString"].ConnectionString;
        System.Data.SqlClient.SqlConnection sql = new System.Data.SqlClient.SqlConnection(connectionString);

        int rowIndex = Convert.ToInt32(((sender as LinkButton).NamingContainer as GridViewRow).RowIndex);
        //GridViewRow row = GridView2.Rows[rowIndex];

        int scholarshipID = Convert.ToInt32(e.CommandArgument);

        Session["selectedScholarshipID"] = scholarshipID.ToString();

        ClientScript.RegisterStartupScript(this.GetType(), "Pop", "openRejectSModal();", true);
    }

    protected void rejectScholarshipButton_Click(object sender, EventArgs e)
    {
        String connectionString = ConfigurationManager.ConnectionStrings["DBConnectionString"].ConnectionString;
        System.Data.SqlClient.SqlConnection sql = new System.Data.SqlClient.SqlConnection(connectionString);

        sql.Open();
        System.Data.SqlClient.SqlCommand rejectScholarship = new System.Data.SqlClient.SqlCommand();
        rejectScholarship.Connection = sql;
        rejectScholarship.CommandText = "update scholarship set approved = 'no', lastUpdated ='" + DateTime.Today + "' where scholarshipID = " + Session["selectedScholarshipID"];
        rejectScholarship.ExecuteNonQuery();
        sql.Close();

        Response.Redirect("~/OpportunityActDec.aspx");
    }

    protected void acceptScholarshipButton_Click(object sender, EventArgs e)
    {
        String connectionString = ConfigurationManager.ConnectionStrings["DBConnectionString"].ConnectionString;
        System.Data.SqlClient.SqlConnection sql = new System.Data.SqlClient.SqlConnection(connectionString);

        sql.Open();
        System.Data.SqlClient.SqlCommand approveScholarship = new System.Data.SqlClient.SqlCommand();
        approveScholarship.Connection = sql;
        approveScholarship.CommandText = "update scholarship set approved = 'yes', lastUpdated ='" + DateTime.Today + "' where scholarshipID = " + Session["selectedScholarshipID"];
        approveScholarship.ExecuteNonQuery();
        sql.Close();

        Response.Redirect("~/OpportunityActDec.aspx");
    }




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
        System.Data.SqlClient.SqlDataReader reader = approveScholarship.ExecuteReader();


        while (reader.Read())
        {
            email = reader.GetString(0);
        }

        sql.Close();

        string url = HttpContext.Current.Request.Url.GetLeftPart(UriPartial.Authority) + "%26argument=Number1";
        string command = "mailto:" + email + "?subject=CommUp: Job Approval";
        System.Diagnostics.Process.Start(command);
        //ClientScript.RegisterStartupScript(this.GetType(), "mailto", "parent.location='mailto:" + OpportunityActDec.email + "'", true);
        //Response.Redirect("~/OpportunityActDec.aspx");
    }

    protected void approveJobLinkBtn_Command(object sender, CommandEventArgs e)
    {
        ClientScript.RegisterStartupScript(this.GetType(), "Pop", "openApproveXModal();", true);
    }


    protected void btnStudentView_Click (object sender, CommandEventArgs e)
    {
        String connectionString = ConfigurationManager.ConnectionStrings["DBConnectionString"].ConnectionString;
        System.Data.SqlClient.SqlConnection sql = new System.Data.SqlClient.SqlConnection(connectionString);

        int rowIndex = Convert.ToInt32(((sender as LinkButton).NamingContainer as GridViewRow).RowIndex);
        

        int logID= Convert.ToInt32(e.CommandArgument);

        Session["logID"] = logID.ToString();

        //find student ID from logID
        sql.Open();
        System.Data.SqlClient.SqlCommand findStudentID = new System.Data.SqlClient.SqlCommand();
        findStudentID.Connection = sql;
        findStudentID.CommandText = "SELECT StudentEntityID FROM LogHours WHERE LogID = " + Session["logID"];
        System.Data.SqlClient.SqlDataReader IDreader = findStudentID.ExecuteReader();

        //declare studentID session variable
        Session["studentID"] = 0;

        while (IDreader.Read())
        {
            Session["studentID"] = IDreader.GetInt32(0);
        }

        sql.Close();

        //get student info for selected student
        sql.Open();
        System.Data.SqlClient.SqlCommand getStudentInfo = new System.Data.SqlClient.SqlCommand();
        getStudentInfo.Connection = sql;
        getStudentInfo.CommandText = "SELECT CONCAT(FirstName,' ',LastName), StudentGradeLevel, StudentGPA, StudentSATScore, HoursOfWorkPlaceExp, StudentEntityID FROM Student WHERE StudentEntityID = " + Session["studentID"];
        System.Data.SqlClient.SqlDataReader studentReader = getStudentInfo.ExecuteReader();

        while (studentReader.Read())
        {
            //fill labels in modal
            
            
            lblStudentName.Text = studentReader.GetString(0);
            lblGradeLevel.Text = "Grade Level: " + studentReader.GetString(1);
            lblGPA.Text = "GPA: " + studentReader.GetDouble(2);
            lblSATScore.Text = "SAT Score: " + studentReader.GetInt32(3);
            lblHoursWorked.Text = "WBL Hours Earned: " + studentReader.GetInt32(4);
        }



        ClientScript.RegisterStartupScript(this.GetType(), "Pop", "openviewStudentModal();", true);
    }
}