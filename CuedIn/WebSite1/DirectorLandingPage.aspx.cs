using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class DirectorLandingPage : System.Web.UI.Page
{


    protected void Page_Load(object sender, EventArgs e)
    {
        Session["schoolID"] = 12;
        Session["userCounty"] = "Harrisonburg City Public Schools";

        // Card Arrays
        JobListing[] JobCardsArray = new JobListing[5];
        Student[] StudentCardsArray = new Student[5];
        JobListing[] StudentCardJobInfoArray = new JobListing[5];

        ((Label)Master.FindControl("lblMaster")).Text = "Home";

        EmptyPostinglbl.Visible = false;
        EmptyStudentslbl.Visible = false;


        String connectionString = ConfigurationManager.ConnectionStrings["DBConnectionString"].ConnectionString;
        System.Data.SqlClient.SqlConnection sql = new System.Data.SqlClient.SqlConnection(connectionString);

        sql.Open();
        System.Data.SqlClient.SqlCommand RecentJobs = new System.Data.SqlClient.SqlCommand();
        RecentJobs.Connection = sql;
        RecentJobs.CommandText = "SELECT TOP (5) JobListing.JobListingID, JobListing.JobTitle, Organization.Image, Organization.OrganizationName, JobListing.JobType, JobListing.JobDescription, JobListing.Location,  JobListing.NumOfApplicants, JobListing.Deadline, Organization.OrganizationDescription, Organization.ExternalLink FROM SchoolApproval INNER JOIN OpportunityEntity ON SchoolApproval.OpportunityEntityID = OpportunityEntity.OpportunityEntityID INNER JOIN JobListing" +
            " ON OpportunityEntity.OpportunityEntityID = JobListing.JobListingID INNER JOIN Organization ON JobListing.OrganizationID = Organization.OrganizationEntityID " +
            "where SchoolApproval.ApprovedFlag = 'P' and SchoolApproval.SchoolEntityID = " + Session["schoolID"] + " ORDER BY JobListing.JobListingID DESC";
        System.Data.SqlClient.SqlDataReader reader = RecentJobs.ExecuteReader();



        // Attempting OOP Stuff
        int x = 0;

        while (reader.Read())
        {

            String JobTitle = reader.GetString(1);
            String JobDescription = reader.GetString(5);
            String JobType = reader.GetString(4);
            String JobLocation = reader.GetString(6);
            DateTime JobDeadline = reader.GetDateTime(8);
            int numOfApplicants = reader.GetInt32(7);
            String OrgName = reader.GetString(3);
            String OrgDescription = reader.GetString(9);
            String OrgImage = reader.GetString(2);
            String OrgWebsite = reader.GetString(10);

            JobListing tempObject = new JobListing(JobTitle, JobDescription, JobType, JobLocation, JobDeadline, numOfApplicants, OrgName, OrgDescription, OrgImage, OrgWebsite);

            JobCardsArray[x] = tempObject;
            x++;

        }

        // OOP First Card
        if (JobCardsArray[0] != null)
        {
            Image1.ImageUrl = JobCardsArray[0].getOrgImage();
            CompanyNamelbl.Text = JobCardsArray[0].getOrgName();
            JobTitlelbl.Text = JobCardsArray[0].getJobTitle();
            CompanyNamelbl2.Text = JobCardsArray[0].getOrgName();
            lblJOrganizationDescription.Text = JobCardsArray[0].getJobDescription();
            lblJobType.Text = JobCardsArray[0].getJobType();
            lblOrgDescription.Text = JobCardsArray[0].getOrgDescription();
            JobLink1.NavigateUrl = JobCardsArray[0].getOrgWebsite();
        }


        // OOP Second Card
        if (JobCardsArray[1] != null)
        {
            Image2.ImageUrl = JobCardsArray[1].getOrgImage();
            CompanyNamelbl3.Text = JobCardsArray[1].getOrgName();
            JobTitlelbl2.Text = JobCardsArray[1].getJobTitle();
            CompanyNamelbl4.Text = JobCardsArray[1].getOrgName();
            lblJOrganizationDescription2.Text = JobCardsArray[1].getJobDescription();
            lblJobType2.Text = JobCardsArray[1].getJobType();
            lblOrgDescription2.Text = JobCardsArray[1].getOrgDescription();
            JobLink2.NavigateUrl = JobCardsArray[1].getOrgWebsite();
        }


        // OOP Third Card
        if (JobCardsArray[2] != null)
        {
            Image3.ImageUrl = JobCardsArray[2].getOrgImage();
            CompanyNamelbl5.Text = JobCardsArray[2].getOrgName();
            JobTitlelbl3.Text = JobCardsArray[2].getJobTitle();
            CompanyNamelbl6.Text = JobCardsArray[2].getOrgName();
            lblJOrganizationDescription3.Text = JobCardsArray[2].getJobDescription();
            lblJobType3.Text = JobCardsArray[2].getJobType();
            lblOrgDescription3.Text = JobCardsArray[2].getOrgDescription();
            JobLink3.NavigateUrl = JobCardsArray[2].getOrgWebsite();
        }


        // OOP Fourth Card

        sql.Close();

        if (JobCardsArray[0] == null)
        {
            card1.Visible = false;
            card2.Visible = false;
            card3.Visible = false;

            EmptyPostinglbl.Visible = true;
        }
        else if (JobCardsArray[3] == null && JobCardsArray[2] == null && JobCardsArray[1] == null)
        {

            card3.Visible = false;
            card2.Visible = false;
        }
        else if (JobCardsArray[3] == null && JobCardsArray[2] == null)
        {

            card3.Visible = false;
        }

        else
        {

        }



        // Team member queries and setting
        sql.Open();
        System.Data.SqlClient.SqlCommand RecentRequests = new System.Data.SqlClient.SqlCommand();
        RecentRequests.Connection = sql;
        RecentRequests.CommandText = "SELECT  TOP (5) ApplicationRequest.ApplicationID, JobListing.JobTitle, Organization.OrganizationName, Student.StudentGPA, Student.StudentImage, Organization.ExternalLink, Student.FirstName, Student.LastName FROM ApplicationRequest INNER JOIN JobListing ON ApplicationRequest.JobListingID = JobListing.JobListingID INNER JOIN Organization ON JobListing.OrganizationID = Organization.OrganizationEntityID INNER JOIN Student ON ApplicationRequest.StudentEntityID = Student.StudentEntityID WHERE (ApplicationRequest.ApprovedFlag = 'P') AND (Student.SchoolEntityID = " + Session["schoolID"] + ") ORDER BY ApplicationRequest.ApplicationID DESC";
        System.Data.SqlClient.SqlDataReader result = RecentRequests.ExecuteReader();


        int y = 0;

        while (result.Read())
        {


            // Stopped here, query in google drive, need to change query so results are stored in a student and joblisting object and add them to arrays, then set lbls based on arrays, need to make first and last name separate labels on cards

            int applicationID = result.GetInt32(0);
            String firstName = result.GetString(6);
            String lastName = result.GetString(7);
            double studentGPA = result.GetDouble(3);
            String studentImage = result.GetString(4);
            String jobTitle = result.GetString(1);
            String orgName = result.GetString(2);
            String orgWebsite = result.GetString(5);


            Student tempStudent = new Student(applicationID, firstName, lastName, studentGPA, studentImage);
            JobListing tempJob = new JobListing(jobTitle, orgName, orgWebsite);

            StudentCardsArray[y] = tempStudent;
            StudentCardJobInfoArray[y] = tempJob;
            y++;
        }



        // OOP First Student Request Card
        if (StudentCardsArray[0] != null)
        {
            StudentImage.ImageUrl = StudentCardsArray[0].getStudentImage();
            FrontStudentName.Text = StudentCardsArray[0].getFirstName() + " " + StudentCardsArray[0].getLastName();
            BackStudentName.Text = StudentCardsArray[0].getFirstName() + " " + StudentCardsArray[0].getLastName();
            StudentJobTitlelbl.Text = StudentCardJobInfoArray[0].getJobTitle();
            OrgTitlelbl.Text = StudentCardJobInfoArray[0].getOrgName();
            StudentGPAlbl.Text = StudentCardsArray[0].getStudentGPA().ToString();
            StudentLink1.NavigateUrl = StudentCardJobInfoArray[0].getOrgWebsite();
        }




        // OOP Second Student Request Card
        if (StudentCardsArray[1] != null)
        {
            StudentImage2.ImageUrl = StudentCardsArray[1].getStudentImage();
            FrontStudentName2.Text = StudentCardsArray[1].getFirstName() + " " + StudentCardsArray[1].getLastName();
            BackStudentName2.Text = StudentCardsArray[1].getFirstName() + " " + StudentCardsArray[1].getLastName();
            StudentJobTitlelbl2.Text = StudentCardJobInfoArray[1].getJobTitle();
            OrgTitlelbl2.Text = StudentCardJobInfoArray[1].getOrgName();
            StudentGPAlbl2.Text = StudentCardsArray[1].getStudentGPA().ToString();
            StudentLink2.NavigateUrl = StudentCardJobInfoArray[1].getOrgWebsite();
        }




        // OOP Third Student Request Card
        if (StudentCardsArray[2] != null)
        {
            StudentImage3.ImageUrl = StudentCardsArray[2].getStudentImage();
            FrontStudentName3.Text = StudentCardsArray[2].getFirstName() + " " + StudentCardsArray[2].getLastName();
            BackStudentName3.Text = StudentCardsArray[2].getFirstName() + " " + StudentCardsArray[2].getLastName();
            StudentJobTitlelbl3.Text = StudentCardJobInfoArray[2].getJobTitle();
            OrgTitlelbl3.Text = StudentCardJobInfoArray[2].getOrgName();
            StudentGPAlbl3.Text = StudentCardsArray[2].getStudentGPA().ToString();
            StudentLink3.NavigateUrl = StudentCardJobInfoArray[2].getOrgWebsite();
        }




        // OOP Fourth Student Request Card



        sql.Close();


        if (StudentCardsArray[0] == null)
        {
            StudentCard1.Visible = false;
            StudentCard2.Visible = false;
            StudentCard3.Visible = false;

            EmptyStudentslbl.Visible = true;

        }
        else if (StudentCardsArray[3] == null && StudentCardsArray[2] == null && StudentCardsArray[1] == null)
        {

            StudentCard3.Visible = false;
            StudentCard2.Visible = false;
        }
        else if (StudentCardsArray[3] == null && StudentCardsArray[2] == null)
        {

            StudentCard3.Visible = false;
        }

        else
        {

        }


        // Start of Tableau Charts
        if (Session["schoolID"].Equals(12))
        {
            LouisaDesktop.Visible = true;
            LouisaTablet.Visible = true;
            LousiaPhone.Visible = true;
        }
        else if (Session["schoolID"].Equals(15))
        {
            TurnerDesktop.Visible = true;
            TurnerTablet.Visible = true;
            TurnerPhone.Visible = true;
        }



    }


    public override void VerifyRenderingInServerForm(Control control)
    {
        /* Verifies that the control is rendered */
    }






}