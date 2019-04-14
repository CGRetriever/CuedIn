using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class JobPostings : System.Web.UI.Page
{
    
    public String jobTitle = "";
    public String jobDescription = "";
    public String jobType = "";
    public String jobLocation = "";
    public DateTime jobDeadline = DateTime.Today;
    public int numOfApplicants = 0;
    public String orgName = "";
    public String orgDescription = "";
    public String orgImage = "";

    protected void Page_Load(object sender, EventArgs e)
    {

        //initialize array of Jobs
        //List<JobListing> jobListingList = new List<JobListing>();
        //String connectionString = System.Configuration.ConfigurationManager.ConnectionStrings["DBConnectionString"].ConnectionString;
        //System.Data.SqlClient.SqlConnection sc = new System.Data.SqlClient.SqlConnection(connectionString);
        //sc.Open();

        //System.Data.SqlClient.SqlCommand sqlJobInfo = new System.Data.SqlClient.SqlCommand();
        //sqlJobInfo.CommandText = "SELECT JobListing.JobTitle, JobListing.JobDescription, JobListing.JobType, JobListing.Location, JobListing.Deadline, JobListing.NumOfApplicants, Organization.OrganizationName, Organization.OrganizationDescription, Organization.Image, Organization.ExternalLink FROM JobListing INNER JOIN Organization ON JobListing.OrganizationID = Organization.OrganizationEntityID where approved = 'Y' ";
        //sqlJobInfo.Connection = sc;
        //System.Data.SqlClient.SqlDataReader reader = sqlJobInfo.ExecuteReader();
        //while (reader.Read())
        //{
        //    JobListing jobListingObj = new JobListing(reader.GetString(0), reader.GetString(1), reader.GetString(2), reader.GetString(3), reader.GetDateTime(4), reader.GetInt32(5), reader.GetString(6), reader.GetString(7), reader.GetString(8), reader.GetString(9));
        //    jobListingList.Add(jobListingObj);
        //}

        //sc.Close();

        //TableRow row = new TableRow();
        //TableCell cell = new TableCell();
        //TableCell cell2 = new TableCell();
        //TableCell cell3 = new TableCell();
        ////link Button for referrals
        //LinkButton referralLink = new LinkButton();
        ////link button for website
        //LinkButton websiteButton = new LinkButton();
        
        //TextBox txtBox = new TextBox();












        //sqlrecentJobPostID.CommandText = "select max(joblistingID) from jobListing;";
        //sqlrecentJobPostID.Connection = sc;
        //System.Data.SqlClient.SqlDataReader reader = sqlrecentJobPostID.ExecuteReader();

        //while (reader.Read())
        //{
        //    recentPostID = reader.GetInt32(0);
        //}

        //sc.Close();

        //sc.Open();


        //System.Data.SqlClient.SqlCommand recentJobPost = new System.Data.SqlClient.SqlCommand();
        //recentJobPost.CommandText = "SELECT JobListing.JobTitle, JobListing.JobDescription, JobListing.JobType, JobListing.Location, JobListing.Deadline, JobListing.NumOfApplicants, Organization.OrganizationName, Organization.OrganizationDescription, Organization.Image FROM JobListing INNER JOIN Organization ON JobListing.OrganizationID = Organization.OrganizationEntityID where JobListingID =" + recentPostID;
        //recentJobPost.Connection = sc;

        //reader = recentJobPost.ExecuteReader();

        ((Label)Master.FindControl("lblMaster")).Text = "Job Cards";



        //while (reader.Read())
        //{
        //    jobTitle = reader.GetString(0);
        //    jobDescription = reader.GetString(1);
        //    jobType = reader.GetString(2);
        //    jobLocation = reader.GetString(3);
        //    jobDeadline = reader.GetDateTime(4);
        //    numOfApplicants = reader.GetInt32(5);
        //    orgName = reader.GetString(6);
        //    orgDescription = reader.GetString(7);
        //    orgImage = reader.GetString(8);

        //}


        

    }







    protected void jobPostingTable_Load(object sender, EventArgs e)
    {
        int countTotalJobs = 0;
        String connectionString = System.Configuration.ConfigurationManager.ConnectionStrings["DBConnectionString"].ConnectionString;
        System.Data.SqlClient.SqlConnection sc = new System.Data.SqlClient.SqlConnection(connectionString);
        sc.Open();

        System.Data.SqlClient.SqlCommand countJobPostings = new System.Data.SqlClient.SqlCommand();
        countJobPostings.CommandText = "select count(JobListingID) from JobListing where approved = 'Y'";
        countJobPostings.Connection = sc;

        System.Data.SqlClient.SqlDataReader reader = countJobPostings.ExecuteReader();

        while (reader.Read())
        {
            countTotalJobs = reader.GetInt32(0);
        }

        sc.Close();



        sc.Open();
        System.Data.SqlClient.SqlCommand pullJobInfo = new System.Data.SqlClient.SqlCommand();
        pullJobInfo.CommandText = "SELECT Organization.OrganizationName, JobListing.JobTitle, JobListing.JobDescription, Organization.Image, Organization.ExternalLink, JobListing.Location, JobListing.Deadline, JobListing.NumOfApplicants, Organization.OrganizationDescription, JobListing.JobListingID FROM JobListing INNER JOIN Organization ON JobListing.OrganizationID = Organization.OrganizationEntityID where approved = 'Y' ";
        pullJobInfo.Connection = sc;



        reader = pullJobInfo.ExecuteReader();

        {
            int[] jobListingID = new int[countTotalJobs];
            String[] orgNameArray = new String[countTotalJobs];
            String[] jobTitleArray = new String[countTotalJobs];
            String[] jobDescriptionArray = new String[countTotalJobs];
            String[] imageArray = new string[countTotalJobs];
            String[] linkArray = new string[countTotalJobs];
            String[] jobLocationArray = new string[countTotalJobs];
            int[] numOfApplicantsArray = new int[countTotalJobs];
            String[] organizationDescriptionArray = new string[countTotalJobs];
            DateTime[] deadlineArray = new DateTime[countTotalJobs];


            int x = 0;
            while (reader.Read())
            {
                
                orgNameArray[x] = reader.GetString(0);
                jobTitleArray[x] = reader.GetString(1);
                jobDescriptionArray[x] = reader.GetString(2);
                imageArray[x] = reader.GetString(3);
                linkArray[x] = reader.GetString(4);
                jobLocationArray[x] = reader.GetString(5);
                deadlineArray[x] = reader.GetDateTime(6);
                numOfApplicantsArray[x] = reader.GetInt32(7);
                organizationDescriptionArray[x] = reader.GetString(8);
                jobListingID[x] = reader.GetInt32(9);
                x++;

            }
            sc.Close();
            double doubleRows = countTotalJobs / 3.0;
            int numrows = (int)(Math.Ceiling(doubleRows));
            int numcells = 3;
            int count = 0;
            for (int j = 0; j < numrows; j++)
            {
                TableRow r = new TableRow();


                    for (int i = 0; i < numcells; i++)
                        {
                            if (count == countTotalJobs)
                            {
                                break;
                            }
                            TableCell c = new TableCell();

                    LinkButton referralLink = new LinkButton();
                    referralLink.ID = "referralLink" + count;
                    referralLink.CssClass = "fas fa-paper-plane";
                    
                    //c.Text += "<div class='col-xs-12 col-sm-6 col-md-4'>";
                    c.Text += "<div class='image-flip' ontouchstart='this.classList.toggle('hover');'>";
                    c.Text += "<div class='mainflip'>";
                    c.Text += "<div class='frontside'>";
                    c.Text += "<div class='card'>";
                    c.Text += "<div class='card-body text-center'>";
                    c.Text += "<p><img class='img-fluid' src='"+imageArray[count]+"' alt='card image'></p>";
                    c.Text += "<h4 class='card-title'>"+orgNameArray[count]+"</h4>";
                    c.Text += "<p class='card-text'>"+jobTitleArray[count]+"</p>";
                    c.Text += "<a href='#' class='btn btn-primary btn-sm'><i class='fa fa-plus'></i></a>";
                    c.Text += "</div>";
                    c.Text += "</div>";
                    c.Text += "</div>";
                    c.Text += "<div class='backside'>";
                    c.Text += "<div class='card'>";
                    c.Text += "<div class='card-body text-center'>";
                    c.Text += "<h4 class='card-title'>" + orgNameArray[count] + "</h4>";
                    c.Text += "<p class='card-text'>" + jobTitleArray[count] + "</p>";
                    c.Text += "<p class='card-text'> Job Description: " + jobDescriptionArray[count] + "</p>";
                    c.Text += "<p class='card-text'> Location: " + jobLocationArray[count] + "</p>";
                    c.Text += "<p class='card-text'>  Deadline: " + deadlineArray[count].ToString() + "</p>";
                    c.Text += "<p class='card-text'>  Number of Applicants: " + numOfApplicantsArray[count] + "</p>";
                    c.Text += "<ul class='list-inline'>";
                    c.Text += "<li class='list-inline-item'>";
                    c.Text += "<a class='social-icon text-xs-center' target='_blank' href='" + linkArray[count]+"'>";
                    c.Text += "<i class='fas fa-external-link-alt'></i>";
                    c.Text += "</a>";
                    c.Text += "</li>";
                    c.Text += "</ul>";
                    c.Text += "</div>";
                    c.Text += "</div>";
                    c.Text += "</div>";
                    c.Text += "</div>";
                    c.Text += "</div>";
                    c.Controls.Add(referralLink);
                    referralLink.CommandArgument += jobListingID;
                    referralLink.Command += referralButton_Click;
                    
                    



                    //c.Text += "<div class = 'card card-cascade>";
                    //        c.Text += "<div class = 'view view-cascade overlay'>";
                    //        c.Text += "<img class = 'card-img-top' src='" + imageArray[count] + "'>";
                    //        c.Text += "<div class = 'card-body card-body-cascade text-center'>";
                    //        c.Text += "<h4 class='card-title'> <strong>" + orgNameArray[count] + "</strong> </h4>";
                    //        c.Text += "<div class='font-weight-bold indigo-text py-2'>" + jobTitleArray[count] + "</div>";
                    //        c.Text += "<div class = 'card-text'>" + jobDescriptionArray[count] + "</div>";
                    //        c.Text += "<a type ='button' class = 'border border-white btn-medium btn-round' style = 'background-color:#ffffff;' href='" + linkArray[count] + "' target = '_blank'><i class='fas fa-link' > </i></a>";
                    //        c.Text += "</div>";
                    //        c.Text += "</div>";
                    //        c.Text += "</div>";
                    //        c.Text += "</div>";
                            c.Style.Add("width", "33%");
                            r.Cells.Add(c);
                            count++;

                        }
                jobPostingTable.Rows.Add(r);
            }
                
                
            }

        }

    public void referralButton_Click (object sender, CommandEventArgs e)
    {
        int jobListingID = (Int32) e.CommandArgument;
    }

    }





