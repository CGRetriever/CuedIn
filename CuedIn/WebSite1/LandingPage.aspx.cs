using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class LandingPage : System.Web.UI.Page
{

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
    




    // Student request arrays
    public static String[] StudentImageArray = new string[5];
    public static String[] applicationIDArray = new string[5];
    public static String[] StudentNamearray = new string[5];
    public static String[] AppJobTitleArray = new string[5];
    public static String[] AppOrgTitleArray = new string[5];
    public static String[] AppStudentGPAArray = new string[5];
    



    protected void Page_Load(object sender, EventArgs e)
    {



        String connectionString = ConfigurationManager.ConnectionStrings["DBConnectionString"].ConnectionString;
        System.Data.SqlClient.SqlConnection sql = new System.Data.SqlClient.SqlConnection(connectionString);

        sql.Open();
        System.Data.SqlClient.SqlCommand RecentJobs = new System.Data.SqlClient.SqlCommand();
        RecentJobs.Connection = sql;
        RecentJobs.CommandText = "SELECT TOP (5) JobListing.JobListingID, JobListing.JobTitle, Organization.Image, JobListing.Approved, Organization.OrganizationName, JobListing.JobType, JobListing.JobDescription, JobListing.Location,  JobListing.NumOfApplicants, JobListing.Deadline, Organization.OrganizationDescription, Organization.ExternalLink FROM JobListing INNER JOIN Organization ON JobListing.OrganizationID = Organization.OrganizationEntityID WHERE (JobListing.Approved = 'P') ORDER BY JobListing.JobListingID DESC";
        System.Data.SqlClient.SqlDataReader reader = RecentJobs.ExecuteReader();


        int x = 0;

        while (reader.Read())
        {

            imageArray[x] = reader.GetString(2);
            jobTitleArray[x] = reader.GetString(1);
            jobListingIDArray[x] = reader.GetInt32(0);
            orgNameArray[x] = reader.GetString(4);
            jobTypeArray[x] = reader.GetString(5);
            jobLocationArray[x] = reader.GetString(7);
            jobDescArray[x] = reader.GetString(6);
            numOfapplicantsArray[x] = reader.GetInt32(8);
            jobDeadLineArray[x] = reader.GetDateTime(9).ToString();
            OrgDescArray[x] = reader.GetString(10);
            x++;

        }


        // First Card
        Image1.ImageUrl = imageArray[0];
        CompanyNamelbl.Text = orgNameArray[0];
        JobTitlelbl.Text = jobTitleArray[0];
        CompanyNamelbl2.Text = orgNameArray[0];
        lblJOrganizationDescription.Text = jobDescArray[0];
        lblJobType.Text = jobTypeArray[0];
        lblOrgDescription.Text = OrgDescArray[0];
        


        // Second card
        Image2.ImageUrl = imageArray[1];
        CompanyNamelbl3.Text = orgNameArray[1];
        JobTitlelbl2.Text = jobTitleArray[1];
        CompanyNamelbl4.Text = orgNameArray[1];
        lblJOrganizationDescription2.Text = jobDescArray[1];
        lblJobType2.Text = jobTypeArray[1];
        lblOrgDescription2.Text = OrgDescArray[1];
        


        // Third card
        Image3.ImageUrl = imageArray[2];
        CompanyNamelbl5.Text = orgNameArray[2];
        JobTitlelbl3.Text = jobTitleArray[2];
        CompanyNamelbl6.Text = orgNameArray[2];
        lblJOrganizationDescription3.Text = jobDescArray[2];
        lblJobType3.Text = jobTypeArray[2];
        lblOrgDescription3.Text = OrgDescArray[2];
        


        // Fourth card
        Image4.ImageUrl = imageArray[3];
        CompanyNamelbl7.Text = orgNameArray[3];
        JobTitlelbl4.Text = jobTitleArray[3];
        CompanyNamelbl8.Text = orgNameArray[3];
        lblJOrganizationDescription4.Text = jobDescArray[3];
        lblJobType4.Text = jobTypeArray[3];
        lblOrgDescription4.Text = OrgDescArray[3];
        


        sql.Close();









        // Team member queries and setting
        sql.Open();
        System.Data.SqlClient.SqlCommand RecentRequests = new System.Data.SqlClient.SqlCommand();
        RecentRequests.Connection = sql;
        RecentRequests.CommandText = "SELECT TOP (5) ApplicationRequest.ApplicationID, Student.FirstName + ' ' + Student.LastName AS FullName, JobListing.JobTitle, Organization.OrganizationName, Student.StudentGPA, Student.StudentImage,  Organization.ExternalLink FROM ApplicationRequest INNER JOIN JobListing ON ApplicationRequest.JobListingID = JobListing.JobListingID INNER JOIN Organization ON JobListing.OrganizationID = Organization.OrganizationEntityID INNER JOIN Student ON ApplicationRequest.StudentEntityID = Student.StudentEntityID WHERE (ApplicationRequest.ApprovedFlag = 'P') ORDER BY ApplicationRequest.ApplicationID DESC";
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
            y++;
        }


        // First Student Request Card
        StudentImage.ImageUrl = StudentImageArray[0];
        FrontStudentName.Text = StudentNamearray[0];
        BackStudentName.Text = StudentNamearray[0];
        StudentJobTitlelbl.Text = AppJobTitleArray[0];
        OrgTitlelbl.Text = AppOrgTitleArray[0];
        StudentGPAlbl.Text = AppStudentGPAArray[0];
        


        // Second Student Request Card
        StudentImage2.ImageUrl = StudentImageArray[1];
        FrontStudentName2.Text = StudentNamearray[1];
        BackStudentName2.Text = StudentNamearray[1];
        StudentJobTitlelbl2.Text = AppJobTitleArray[1];
        OrgTitlelbl2.Text = AppOrgTitleArray[1];
        StudentGPAlbl2.Text = AppStudentGPAArray[1];
        

        // Third Student Request Card
        StudentImage3.ImageUrl = StudentImageArray[2];
        FrontStudentName3.Text = StudentNamearray[2];
        BackStudentName3.Text = StudentNamearray[2];
        StudentJobTitlelbl3.Text = AppJobTitleArray[2];
        OrgTitlelbl3.Text = AppOrgTitleArray[2];
        StudentGPAlbl3.Text = AppStudentGPAArray[2];
       

        // Fourth Student Request Card
        StudentImage4.ImageUrl = StudentImageArray[3];
        FrontStudentName4.Text = StudentNamearray[3];
        BackStudentName4.Text = StudentNamearray[3];
        StudentJobTitlelbl4.Text = AppJobTitleArray[3];
        OrgTitlelbl4.Text = AppOrgTitleArray[3];
        StudentGPAlbl4.Text = AppStudentGPAArray[3];
        



        sql.Close();
    }


    public override void VerifyRenderingInServerForm(Control control)
    {
        /* Verifies that the control is rendered */
    }



    //protected void JobLink1_Click(object sender, EventArgs e)
    //{
    //    JobLink1.PostBackUrl = "https://www.walmart.com/";
    //}


}