using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class CounselorHoursApprovalPage : System.Web.UI.Page
{
    public static String email;
    public static String fullName;

    protected void Page_Load(object sender, EventArgs e)
    {


        GridView1.Columns[0].Visible = false;
        ((Label)Master.FindControl("lblMaster2")).Text = "Student Log Hours";
        

    }



    public override void VerifyRenderingInServerForm(Control control)
    {
        /* Verifies that the control is rendered */
    }


    //click approve in gridview- trigger modal to open - fill modal
    protected void approveJobLinkBtn_Click(object sender, CommandEventArgs e)
    {
        String connectionString = ConfigurationManager.ConnectionStrings["DBConnectionString"].ConnectionString;
        System.Data.SqlClient.SqlConnection sql = new System.Data.SqlClient.SqlConnection(connectionString);

        int rowIndex = Convert.ToInt32(((sender as LinkButton).NamingContainer as GridViewRow).RowIndex);
        GridViewRow row = GridView1.Rows[rowIndex];

        int jobID = Convert.ToInt32(e.CommandArgument);

        Session["selectedLogID"] = jobID.ToString();

        sql.Open();
        System.Data.SqlClient.SqlCommand moreHourInfo = new System.Data.SqlClient.SqlCommand();
        moreHourInfo.Connection = sql;
        moreHourInfo.CommandText = "SELECT JobListing.JobTitle, LogHours.HoursRequested, CONCAT(Student.FirstName,' ', Student.LastName) FROM LogHours INNER JOIN Student ON LogHours.StudentEntityID = Student.StudentEntityID INNER JOIN JobListing ON LogHours.JobListingID = JobListing.JobListingID WHERE LogHours.LogID = " + Session["selectedLogID"];
        System.Data.SqlClient.SqlDataReader reader = moreHourInfo.ExecuteReader();

        while (reader.Read())
        {
            sublabelapprovemodal1.Text = reader.GetString(2);
            sublabelapprovemodal2.Text = reader.GetString(0);
            sublabelapprovemodal3.Text = "Hours: " + reader.GetInt32(1).ToString();
        }

        sql.Close();



        ClientScript.RegisterStartupScript(this.GetType(), "Pop", "openApproveXModal();", true);
    }
    //click approve in modal-- send data to DB
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

        Response.Redirect("~/CounselorHoursApprovalPage.aspx");
    }

    //click reject in gridview-- open modal-- fill modal
    protected void rejectJobLinkBtn_Click(object sender, CommandEventArgs e)
    {
        String connectionString = ConfigurationManager.ConnectionStrings["DBConnectionString"].ConnectionString;
        System.Data.SqlClient.SqlConnection sql = new System.Data.SqlClient.SqlConnection(connectionString);

        int rowIndex = Convert.ToInt32(((sender as LinkButton).NamingContainer as GridViewRow).RowIndex);
        GridViewRow row = GridView1.Rows[rowIndex];

        int jobID = Convert.ToInt32(e.CommandArgument);

        Session["selectedLogID"] = jobID.ToString();

        sql.Open();
        System.Data.SqlClient.SqlCommand moreHourInfo = new System.Data.SqlClient.SqlCommand();
        moreHourInfo.Connection = sql;
        moreHourInfo.CommandText = "SELECT JobListing.JobTitle, LogHours.HoursRequested, CONCAT(Student.FirstName,' ', Student.LastName) FROM LogHours INNER JOIN Student ON LogHours.StudentEntityID = Student.StudentEntityID INNER JOIN JobListing ON LogHours.JobListingID = JobListing.JobListingID WHERE LogHours.LogID = " + Session["selectedLogID"];
        System.Data.SqlClient.SqlDataReader reader = moreHourInfo.ExecuteReader();

        while (reader.Read())
        {
            sublabelRejectModal1.Text = reader.GetString(2);
            sublabelRejectModal2.Text = reader.GetString(0);
            sublabelRejectModal3.Text = "Hours: " + reader.GetInt32(1).ToString();
        }

        sql.Close();

        ClientScript.RegisterStartupScript(this.GetType(), "Pop", "openRejectJModal();", true);
    }
    //click reject in modal-- send to DB
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

        Response.Redirect("~/CounselorHoursApprovalPage.aspx");
    }
    //open comment modal
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



    protected void btnStudentView_Click(object sender, CommandEventArgs e)
    {
        String connectionString = ConfigurationManager.ConnectionStrings["DBConnectionString"].ConnectionString;
        System.Data.SqlClient.SqlConnection sql = new System.Data.SqlClient.SqlConnection(connectionString);

        int rowIndex = Convert.ToInt32(((sender as LinkButton).NamingContainer as GridViewRow).RowIndex);


        int logID = Convert.ToInt32(e.CommandArgument);

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
