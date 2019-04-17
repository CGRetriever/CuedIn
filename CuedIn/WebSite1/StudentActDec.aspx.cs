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

        ((Label)Master.FindControl("lblMaster")).Text = "Student Application Requests";
        ((Label)Master.FindControl("lblMaster")).Attributes.Add("Style", "color: #fff; text-align:center; text-transform: uppercase; letter-spacing: 6px; font-size: 2.0em; margin: .67em");

        cbSelectAll.Attributes.Add("onclick", "Selectall");

    }



    public override void VerifyRenderingInServerForm(Control control)
    {
        /* Verifies that the control is rendered */
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
        moreJobInfo.CommandText = "SELECT Student.FirstName + ' ' + Student.LastName, Student.StudentGPA, Student.StudentGraduationTrack, JobListing.JobTitle, JobListing.JobDescription, JobListing.JobType, JobListing.Location, JobListing.Deadline, JobListing.NumOfApplicants, Organization.OrganizationName, Organization.OrganizationDescription FROM Organization INNER JOIN JobListing ON Organization.OrganizationEntityID = JobListing.OrganizationID INNER JOIN ApplicationRequest ON JobListing.JobListingID = ApplicationRequest.JobListingID INNER JOIN Student ON ApplicationRequest.StudentEntityID = Student.StudentEntityID where ApplicationRequest.ApplicationID = " + applicationID;
        System.Data.SqlClient.SqlDataReader reader = moreJobInfo.ExecuteReader();



        while (reader.Read())
        {
            //set labels to db values

            lblStudentName.Text = reader.GetString(0);
            lblSudentGPA.Text = "GPA: " + reader.GetDouble(1).ToString();

            // On track if statement
            String status = reader.GetString(2);

            if (status == "Y")
            {
                lblStudentStatus.Text = "Student on Track";
            }
            else
            {
                lblStudentStatus.Text = "Student not on Track";
            }

            lblOrgName.Text = "Organization Name: " + reader.GetString(9);
            lblOrgDesc.Text = "Organization Description: " + reader.GetString(10);
            lblJobTitle.Text = "Job Title: " + reader.GetString(3);
            lblJobDesc.Text = "Job Description: " + reader.GetString(4);
            lblJobLocation.Text = "Location: " + reader.GetString(6);
            lblJobDeadline.Text = "Deadline: " + reader.GetDateTime(7).ToString();
            lblNumberOfApplicants.Text = "Number Of Applicants: " + reader.GetInt32(8).ToString();

        }

        sql.Close();

        Session["selectedapplicationID"] = applicationID.ToString();




        ClientScript.RegisterStartupScript(this.GetType(), "Pop", "openEditSModal();", true);



    }


    protected void btnCheckGridView_Click(object sender, EventArgs e)
    {

        if (chkImage.Checked != true)
        {
            for (int i = 0; i < GridView1.Columns.Count; i++)
            {
                if (GridView1.Columns[i].HeaderText == "Image")
                {
                    GridView1.Columns[i].Visible = false;

                }
            }
        }
        else
        {
            for (int i = 0; i < GridView1.Columns.Count; i++)
            {
                if (GridView1.Columns[i].HeaderText == "Image")
                {
                    GridView1.Columns[i].Visible = true;

                }
            }
        }

        if (chkGradeLevel.Checked != true)
        {
            for (int i = 0; i < GridView1.Columns.Count; i++)
            {
                if (GridView1.Columns[i].HeaderText == "Grade Level")
                {
                    GridView1.Columns[i].Visible = false;

                }
            }
        }
        else
        {
            for (int i = 0; i < GridView1.Columns.Count; i++)
            {
                if (GridView1.Columns[i].HeaderText == "Grade Level")
                {
                    GridView1.Columns[i].Visible = true;

                }
            }
        }


        if (chkGPA.Checked != true)
        {
            for (int i = 0; i < GridView1.Columns.Count; i++)
            {
                if (GridView1.Columns[i].HeaderText == "GPA")
                {
                    GridView1.Columns[i].Visible = false;

                }
            }
        }
        else
        {
            for (int i = 0; i < GridView1.Columns.Count; i++)
            {
                if (GridView1.Columns[i].HeaderText == "GPA")
                {
                    GridView1.Columns[i].Visible = true;

                }
            }
        }


        if (chkHoursWBL.Checked != true)
        {
            for (int i = 0; i < GridView1.Columns.Count; i++)
            {
                if (GridView1.Columns[i].HeaderText == "Hours Of WBL")
                {
                    GridView1.Columns[i].Visible = false;

                }
            }
        }
        else
        {
            for (int i = 0; i < GridView1.Columns.Count; i++)
            {
                if (GridView1.Columns[i].HeaderText == "Hours Of WBL")
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

    }

    protected void chkOrgWebsite_CheckedChanged(object sender, EventArgs e)
    {

    }


    //protected void SearchButton_Click(object sender, EventArgs e)
    //{
    //    String term = SearchBox.Text;

    //    StudentOpportunity.SelectParameters.Add("term", term);

    //    StudentOpportunity.SelectCommand = "SELECT ApplicationRequest.ApplicationID, Student.StudentImage, CONCAT(Student.FirstName, ' ', Student.LastName) AS FullName, Student.StudentGradeLevel, Student.StudentGPA, Student.HoursOfWorkPlaceExp, JobListing.JobTitle, JobListing.JobDescription, JobListing.JobType, Organization.OrganizationName FROM ApplicationRequest INNER JOIN JobListing ON ApplicationRequest.JobListingID = JobListing.JobListingID INNER JOIN Organization ON JobListing.OrganizationID = Organization.OrganizationEntityID INNER JOIN Student ON ApplicationRequest.StudentEntityID = Student.StudentEntityID WHERE(ApplicationRequest.ApprovedFlag = 'P') and((Student.FirstName like '%" + @term + "%' or Student.LastName like '%" + @term + "%') or (JobListing.JobTitle like '%" + @term + "%') or (Organization.OrganizationName like '%" + @term + "%') or (Student.StudentGradeLevel like '%" + @term + "%') or (Student.StudentGPA like '%" + @term + "%') or (Student.HoursOfWorkPlaceExp like '%" + @term + "%') or (JobListing.JobDescription like '%" + @term + "%') or (JobListing.JobType like '%" + @term + "%'))";
    //    StudentOpportunity.DataBind();
    //    GridView1.DataBind();

    //    StudentOpportunity.SelectParameters.Clear();
    //}



    protected void btnStudentView_Click(object sender, CommandEventArgs e)
    {
        String connectionString = ConfigurationManager.ConnectionStrings["DBConnectionString"].ConnectionString;
        System.Data.SqlClient.SqlConnection sql = new System.Data.SqlClient.SqlConnection(connectionString);

        int rowIndex = Convert.ToInt32(((sender as LinkButton).NamingContainer as GridViewRow).RowIndex);


        int applicationID = Convert.ToInt32(e.CommandArgument);

        Session["applicationID"] = applicationID.ToString();

        //find student ID from logID
        sql.Open();
        System.Data.SqlClient.SqlCommand findStudentID = new System.Data.SqlClient.SqlCommand();
        findStudentID.Connection = sql;
        findStudentID.CommandText = "SELECT StudentEntityID FROM ApplicationRequest WHERE applicationID = " + Session["applicationID"];
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
        getStudentInfo.CommandText = "SELECT CONCAT(FirstName,' ',LastName), StudentGradeLevel, StudentGPA, StudentSATScore, HoursOfWorkPlaceExp, StudentEntityID, StudentImage FROM Student WHERE StudentEntityID = " + Session["studentID"];
        System.Data.SqlClient.SqlDataReader studentReader = getStudentInfo.ExecuteReader();

        while (studentReader.Read())
        {
            //fill labels in modal


            lblStudentName.Text = studentReader.GetString(0);
            lblGradeLevel.Text = "Grade Level: " + studentReader.GetString(1);
            lblGPA.Text = "GPA: " + studentReader.GetDouble(2);
            lblSATScore.Text = "SAT Score: " + studentReader.GetInt32(3);
            lblHoursWorked.Text = "WBL Hours Earned: " + studentReader.GetInt32(4);
            imgStudent.ImageUrl = studentReader.GetString(6);
        }



        ClientScript.RegisterStartupScript(this.GetType(), "Pop", "openviewStudentModal();", true);
    }

    protected void cbSelectAll_Checked (object sender, EventArgs e)
    {
        
            {
            if (cbSelectAll.Checked == true)
            {
                chkGPA.Checked = true;
                chkGradeLevel.Checked = true;
                chkHoursWBL.Checked = true;
                chkImage.Checked = true;
                chkJobDescription.Checked = true;
                chkJobType.Checked = true;
                cbSelectAll.Text = "Unselect All";

            }

            if (cbSelectAll.Checked == false)
            {
                chkGPA.Checked = false;
                chkGradeLevel.Checked = false;
                chkHoursWBL.Checked = false;
                chkImage.Checked = false;
                chkJobDescription.Checked = false;
                chkJobType.Checked = false;
                cbSelectAll.Text = "Select All";
            }
        }
    }

}