using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class StudentActDec : System.Web.UI.Page
{
    public static String email;

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

    protected void approveStudentLinkBtn_Click(object sender, CommandEventArgs e)
    {
        String connectionString = ConfigurationManager.ConnectionStrings["DBConnectionString"].ConnectionString;
        System.Data.SqlClient.SqlConnection sql = new System.Data.SqlClient.SqlConnection(connectionString);

        int rowIndex = Convert.ToInt32(((sender as LinkButton).NamingContainer as GridViewRow).RowIndex);
        GridViewRow row = GridView1.Rows[rowIndex];

        int applicationID = Convert.ToInt32(e.CommandArgument);

        Session["selectedapplicationID"] = applicationID.ToString();




        sql.Open();
        System.Data.SqlClient.SqlCommand moreJobInfo = new System.Data.SqlClient.SqlCommand();
        moreJobInfo.Connection = sql;
        moreJobInfo.CommandText = "SELECT ApplicationRequest.ApplicationID, Student.FirstName + ' ' + Student.LastName AS FullName, JobListing.JobTitle, Organization.OrganizationName FROM ApplicationRequest INNER JOIN JobListing ON ApplicationRequest.JobListingID = JobListing.JobListingID INNER JOIN Organization ON JobListing.OrganizationID = Organization.OrganizationEntityID INNER JOIN Student ON ApplicationRequest.StudentEntityID = Student.StudentEntityID WHERE ApplicationRequest.ApplicationID = " + Session["selectedapplicationID"];
        System.Data.SqlClient.SqlDataReader reader = moreJobInfo.ExecuteReader();



        while (reader.Read())
        {

            StudentApproveLabel.Text = reader.GetString(1);
            StudentSubApproveLabel.Text = reader.GetString(2);
            Student2ndSubApproveLabel.Text = reader.GetString(3);


        }

        sql.Close();



        ClientScript.RegisterStartupScript(this.GetType(), "Pop", "openApproveXModal();", true);
    }

    protected void acceptJobButton_Click(object sender, EventArgs e)
    {
        String connectionString = ConfigurationManager.ConnectionStrings["DBConnectionString"].ConnectionString;
        System.Data.SqlClient.SqlConnection sql = new System.Data.SqlClient.SqlConnection(connectionString);

        sql.Open();
        System.Data.SqlClient.SqlCommand approveStudent = new System.Data.SqlClient.SqlCommand();
        approveStudent.Connection = sql;
        approveStudent.CommandText = "update applicationrequest set approvedflag = 'Y' where applicationID = " + Session["selectedapplicationID"];
        approveStudent.ExecuteNonQuery();
        sql.Close();

        Response.Redirect("~/StudentActDec.aspx");
    }


    protected void rejectStudentLinkBtn_Click(object sender, CommandEventArgs e)
    {
        String connectionString = ConfigurationManager.ConnectionStrings["DBConnectionString"].ConnectionString;
        System.Data.SqlClient.SqlConnection sql = new System.Data.SqlClient.SqlConnection(connectionString);

        int rowIndex = Convert.ToInt32(((sender as LinkButton).NamingContainer as GridViewRow).RowIndex);
        GridViewRow row = GridView1.Rows[rowIndex];

        int jobID = Convert.ToInt32(e.CommandArgument);

        Session["selectedapplicationID"] = jobID.ToString();


        sql.Open();
        System.Data.SqlClient.SqlCommand moreJobInfo = new System.Data.SqlClient.SqlCommand();
        moreJobInfo.Connection = sql;
        moreJobInfo.CommandText = "SELECT ApplicationRequest.ApplicationID, Student.FirstName + ' ' + Student.LastName AS FullName, JobListing.JobTitle, Organization.OrganizationName FROM ApplicationRequest INNER JOIN JobListing ON ApplicationRequest.JobListingID = JobListing.JobListingID INNER JOIN Organization ON JobListing.OrganizationID = Organization.OrganizationEntityID INNER JOIN Student ON ApplicationRequest.StudentEntityID = Student.StudentEntityID WHERE ApplicationRequest.ApplicationID = " + Session["selectedapplicationID"];
        System.Data.SqlClient.SqlDataReader reader = moreJobInfo.ExecuteReader();



        while (reader.Read())
        {

            StudentRejectLabel.Text = reader.GetString(1);
            StudentRejectSubLabel.Text = reader.GetString(2);
            Student2ndRejectSubLabel.Text = reader.GetString(3);


        }

        sql.Close();





        ClientScript.RegisterStartupScript(this.GetType(), "Pop", "openRejectJModal();", true);
    }

    protected void rejectJobButton_Click(object sender, EventArgs e)
    {
        String connectionString = ConfigurationManager.ConnectionStrings["DBConnectionString"].ConnectionString;
        System.Data.SqlClient.SqlConnection sql = new System.Data.SqlClient.SqlConnection(connectionString);

        sql.Open();
        System.Data.SqlClient.SqlCommand rejectStudent = new System.Data.SqlClient.SqlCommand();
        rejectStudent.Connection = sql;
        rejectStudent.CommandText = "update applicationrequest set approvedflag = 'N' where applicationID = " + Session["selectedapplicationID"];
        rejectStudent.ExecuteNonQuery();
        sql.Close();

        Response.Redirect("~/StudentActDec.aspx");
    }

    protected void moreInfoStudentLinkBtn_Click(object sender, CommandEventArgs e)
    {
        String connectionString = ConfigurationManager.ConnectionStrings["DBConnectionString"].ConnectionString;
        System.Data.SqlClient.SqlConnection sql = new System.Data.SqlClient.SqlConnection(connectionString);

        int rowIndex = Convert.ToInt32(((sender as LinkButton).NamingContainer as GridViewRow).RowIndex);
        GridViewRow row = GridView1.Rows[rowIndex];


        int applicationID = Convert.ToInt32(e.CommandArgument);

        sql.Open();
        System.Data.SqlClient.SqlCommand moreJobInfo = new System.Data.SqlClient.SqlCommand();
        moreJobInfo.Connection = sql;
        moreJobInfo.CommandText = "SELECT Student.FirstName, Student.LastName, Student.StudentGPA, Student.StudentGraduationTrack, JobListing.JobTitle, JobListing.JobDescription, JobListing.JobType, JobListing.Location, JobListing.Deadline, JobListing.NumOfApplicants, Organization.OrganizationName, Organization.OrganizationDescription FROM Organization INNER JOIN JobListing ON Organization.OrganizationEntityID = JobListing.OrganizationID INNER JOIN ApplicationRequest ON JobListing.JobListingID = ApplicationRequest.JobListingID INNER JOIN Student ON ApplicationRequest.StudentEntityID = Student.StudentEntityID where ApplicationRequest.ApplicationID = " + applicationID;
        System.Data.SqlClient.SqlDataReader reader = moreJobInfo.ExecuteReader();



        while (reader.Read())
        {
            //set labels to db values

            lblStudentFirstName.Text = "Student First Name: " + reader.GetString(0);
            lblStudentLastNameName.Text = "Student Last Name: " + reader.GetString(1);
            lblStudentGpa.Text = "Student GPA: " + reader.GetDouble(2);
            lblStudentGraduationTrack.Text = "Is student on Track?: " + reader.GetString(3);
            lblLabelBlank.Text = ""; 
            //lblStudentGpa.Text = "Student GPA: " + reader.GetString(2);
            //lblStudentTrack.Text = "Student on Graduation Track: " + reader.GetString(3);

            lblJOrganizationName.Text = "Organization Name: " + reader.GetString(10);
            lblJOrganizationDescription.Text = "Organization Description: " + reader.GetString(11);
            lblJobTitle.Text = "Job Title: " + reader.GetString(4);
            lblJobDescription.Text = "Job Description: " + reader.GetString(5);
            lblJobType.Text = "Job Type: " + reader.GetString(6);
            lblJobLocation.Text = "Job Location: " + reader.GetString(7);
            lblJobDeadline.Text = "Job Deadline: " + reader.GetDateTime(8);
            lblNumOfApplicants.Text = "Number of Applicants: " + reader.GetInt32(9);

        }

        Session["selectedapplicationID"] = applicationID.ToString();




        ClientScript.RegisterStartupScript(this.GetType(), "Pop", "openEditSModal();", true);



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
        String connectionString = ConfigurationManager.ConnectionStrings["DBConnectionString"].ConnectionString;
        System.Data.SqlClient.SqlConnection sql = new System.Data.SqlClient.SqlConnection(connectionString);

        int rowIndex = Convert.ToInt32(((sender as LinkButton).NamingContainer as GridViewRow).RowIndex);
       // GridViewRow row = GridView2.Rows[rowIndex];


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
            lblScholarshipMin.Text = "Scholarship Minimum: " + reader.GetSqlMoney(2);
            lblScholarshipMax.Text = "Scholarship Maximum: " + reader.GetSqlMoney(3);
            lblScholarshipQuantity.Text = "Scholarship Quantity: " + reader.GetInt32(4);
            lblScholarshipDueDate.Text = "Scholarship Due Date: " + reader.GetDateTime(5);

        }

        Session["selectedScholarshipID"] = scholarshipID.ToString();

        ClientScript.RegisterStartupScript(this.GetType(), "Pop", "openEditJModal();", true);

    }

    protected void LinkButton2_Click(object sender, CommandEventArgs e)
    {
        String connectionString = ConfigurationManager.ConnectionStrings["DBConnectionString"].ConnectionString;
        System.Data.SqlClient.SqlConnection sql = new System.Data.SqlClient.SqlConnection(connectionString);

        int rowIndex = Convert.ToInt32(((sender as LinkButton).NamingContainer as GridViewRow).RowIndex);
       // GridViewRow row = GridView2.Rows[rowIndex];

        int scholarshipID = Convert.ToInt32(e.CommandArgument);

        Session["selectedScholarshipID"] = scholarshipID.ToString();

        ClientScript.RegisterStartupScript(this.GetType(), "Pop", "openApproveSModal();", true);
    }


    protected void LinkButton3_Click(object sender, CommandEventArgs e)
    {
        String connectionString = ConfigurationManager.ConnectionStrings["DBConnectionString"].ConnectionString;
        System.Data.SqlClient.SqlConnection sql = new System.Data.SqlClient.SqlConnection(connectionString);

        int rowIndex = Convert.ToInt32(((sender as LinkButton).NamingContainer as GridViewRow).RowIndex);
      //  GridViewRow row = GridView2.Rows[rowIndex];

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
}