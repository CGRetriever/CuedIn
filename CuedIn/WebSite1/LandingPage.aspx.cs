using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class LandingPage : System.Web.UI.Page
{

    // OOP Stuff
    public static JobListing[] JobCardsArray = new JobListing[4];





    // Job posting arrays
    public static String[] imageArray = new string[5];
    public static String[] jobTitleArray = new string[5];
    public static int[] jobListingIDArray = new int[5];
    public static String[] orgNameArray = new string[5];
    public static String[] jobTypeArray = new string[5];
    public static String[] jobLocationArray = new string[5];
    public static int[] numOfapplicantsArray = new int[5];
    public static String[] jobDeadLineArray = new string[5];
    public static String[] jobDescArray = new string[5];
    public static String[] OrgDescArray = new string[5];
    public static String[] OrgWebURLArray = new string[5];




    // Student request arrays
    public static String[] StudentImageArray = new string[5];
    public static String[] applicationIDArray = new string[5];
    public static String[] StudentNamearray = new string[5];
    public static String[] AppJobTitleArray = new string[5];
    public static String[] AppOrgTitleArray = new string[5];
    public static String[] AppStudentGPAArray = new string[5];
    public static String[] StudentOrgWebURLArray = new string[5];



    protected void Page_Load(object sender, EventArgs e)
    {

        ((Label)Master.FindControl("lblMaster")).Text = "Landing Page";

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




            imageArray[x] = reader.GetString(2);
            jobTitleArray[x] = reader.GetString(1);
            jobListingIDArray[x] = reader.GetInt32(0);
            orgNameArray[x] = reader.GetString(3);
            jobTypeArray[x] = reader.GetString(4);
            jobLocationArray[x] = reader.GetString(6);
            jobDescArray[x] = reader.GetString(5);
            numOfapplicantsArray[x] = reader.GetInt32(7);
            jobDeadLineArray[x] = reader.GetDateTime(8).ToString();
            OrgDescArray[x] = reader.GetString(9);
            OrgWebURLArray[x] = reader.GetString(10);
            x++;

        }




        // OOP First Card

        if(JobCardsArray[0] != null)
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

        if (JobCardsArray[3] != null)
        {
            Image4.ImageUrl = JobCardsArray[3].getOrgImage();
            CompanyNamelbl7.Text = JobCardsArray[3].getOrgName();
            JobTitlelbl4.Text = JobCardsArray[3].getJobTitle();
            CompanyNamelbl8.Text = JobCardsArray[3].getOrgName();
            lblJOrganizationDescription4.Text = JobCardsArray[3].getJobDescription();
            lblJobType4.Text = JobCardsArray[3].getJobType();
            lblOrgDescription4.Text = JobCardsArray[3].getOrgDescription();
            JobLink4.NavigateUrl = JobCardsArray[3].getOrgWebsite();
        }




        




        sql.Close();

        

        if(JobCardsArray[0] == null)
        {
            card1.Visible = false;
            card2.Visible = false;
            card3.Visible = false;
            card4.Visible = false;
            EmptyPostinglbl.Visible = true;
        }
        else if (JobCardsArray[3] == null && JobCardsArray[2] == null && JobCardsArray[1] == null)
        {
            card4.Visible = false;
            card3.Visible = false;
            card2.Visible = false;
        }
        else if (JobCardsArray[3] == null && JobCardsArray[2] == null)
        {
            card4.Visible = false;
            card3.Visible = false;
        }
        else if (JobCardsArray[3] == null)
        {
            card4.Visible = false;
        }
        else
        {

        }

        LandingPage.JobCardsArray = null;


        






        // Team member queries and setting
        sql.Open();
        System.Data.SqlClient.SqlCommand RecentRequests = new System.Data.SqlClient.SqlCommand();
        RecentRequests.Connection = sql;
        RecentRequests.CommandText = "SELECT TOP (5) ApplicationRequest.ApplicationID, Student.FirstName + ' ' + Student.LastName AS FullName, JobListing.JobTitle, Organization.OrganizationName, Student.StudentGPA, Student.StudentImage,  Organization.ExternalLink FROM ApplicationRequest INNER JOIN JobListing ON ApplicationRequest.JobListingID = JobListing.JobListingID INNER JOIN Organization ON JobListing.OrganizationID = Organization.OrganizationEntityID INNER JOIN Student ON ApplicationRequest.StudentEntityID = Student.StudentEntityID WHERE (ApplicationRequest.ApprovedFlag = 'P') AND Student.SchoolEntityID = " + Session["schoolID"] + " ORDER BY ApplicationRequest.ApplicationID DESC";
        System.Data.SqlClient.SqlDataReader result = RecentRequests.ExecuteReader();


        int y = 0;

        while (result.Read())
        {
            applicationIDArray[y] = result.GetInt32(0).ToString();
            StudentNamearray[y] = result.GetString(1);
            AppJobTitleArray[y] = result.GetString(2);
            AppOrgTitleArray[y] = result.GetString(3);
            AppStudentGPAArray[y] = result.GetDouble(4).ToString();
            StudentImageArray[y] = result.GetString(5);
            StudentOrgWebURLArray[y] = result.GetString(6);
            y++;
        }


        // First Student Request Card
        StudentImage.ImageUrl = StudentImageArray[0];
        FrontStudentName.Text = StudentNamearray[0];
        BackStudentName.Text = StudentNamearray[0];
        StudentJobTitlelbl.Text = AppJobTitleArray[0];
        OrgTitlelbl.Text = AppOrgTitleArray[0];
        StudentGPAlbl.Text = AppStudentGPAArray[0];
        StudentLink1.NavigateUrl = StudentOrgWebURLArray[0];


        // Second Student Request Card
        StudentImage2.ImageUrl = StudentImageArray[1];
        FrontStudentName2.Text = StudentNamearray[1];
        BackStudentName2.Text = StudentNamearray[1];
        StudentJobTitlelbl2.Text = AppJobTitleArray[1];
        OrgTitlelbl2.Text = AppOrgTitleArray[1];
        StudentGPAlbl2.Text = AppStudentGPAArray[1];
        StudentLink2.NavigateUrl = StudentOrgWebURLArray[1];

        // Third Student Request Card
        StudentImage3.ImageUrl = StudentImageArray[2];
        FrontStudentName3.Text = StudentNamearray[2];
        BackStudentName3.Text = StudentNamearray[2];
        StudentJobTitlelbl3.Text = AppJobTitleArray[2];
        OrgTitlelbl3.Text = AppOrgTitleArray[2];
        StudentGPAlbl3.Text = AppStudentGPAArray[2];
        StudentLink3.NavigateUrl = StudentOrgWebURLArray[2];

        // Fourth Student Request Card
        StudentImage4.ImageUrl = StudentImageArray[3];
        FrontStudentName4.Text = StudentNamearray[3];
        BackStudentName4.Text = StudentNamearray[3];
        StudentJobTitlelbl4.Text = AppJobTitleArray[3];
        OrgTitlelbl4.Text = AppOrgTitleArray[3];
        StudentGPAlbl4.Text = AppStudentGPAArray[3];
        StudentLink4.NavigateUrl = StudentOrgWebURLArray[3];



        sql.Close();

        //LandingPage.StudentNamearray = null;
        //StudentNamearray[1] = null;
        //StudentNamearray[2] = null;
        //StudentNamearray[3] = null;

        if (StudentNamearray[0] == null)
        {
            StudentCard1.Visible = false;
            StudentCard2.Visible = false;
            StudentCard3.Visible = false;
            StudentCard4.Visible = false;
            EmptyStudentslbl.Visible = true;

        }
        else if (StudentNamearray[3] == null && StudentNamearray[2] == null && StudentNamearray[1] == null)
        {
            StudentCard4.Visible = false;
            StudentCard3.Visible = false;
            StudentCard2.Visible = false;
        }
        else if (StudentNamearray[3] == null && StudentNamearray[2] == null)
        {
            StudentCard4.Visible = false;
            StudentCard3.Visible = false;
        }
        else if (StudentNamearray[3] == null)
        {
            StudentCard4.Visible = false;
        }
        else
        {

        }

        StudentNamearray[0] = null;
        StudentNamearray[1] = null;
        StudentNamearray[2] = null;
        StudentNamearray[3] = null;
        StudentNamearray[4] = null;




        // Start of Tableu Charts
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