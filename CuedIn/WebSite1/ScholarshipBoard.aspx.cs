using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class ScholarshipBoard : System.Web.UI.Page
{
    public static int recentPostID = 0;
    public String scholarshipName = "";
    public String scholarshipDescription = "";
    public double scholarshipMin = 0.0;
    public double scholarshipMax = 0.0;
    public DateTime scholarshipDueDate = DateTime.Today;
    public String orgName = "";
    public String orgDescription = "";
    public String orgImage = "";

    protected void Page_Load(object sender, EventArgs e)
    {

        ((Label)Master.FindControl("lblMaster")).Text = "Scholarship Cards";
        String connectionString = System.Configuration.ConfigurationManager.ConnectionStrings["DBConnectionString"].ConnectionString;
        System.Data.SqlClient.SqlConnection sc = new System.Data.SqlClient.SqlConnection(connectionString);
        sc.Open();

        System.Data.SqlClient.SqlCommand sqlrecentScholarshipID = new System.Data.SqlClient.SqlCommand();
        sqlrecentScholarshipID.CommandText = "select scholarshipID from scholarship where ScholarshipID = (select max(scholarshipID) from scholarship)";
        sqlrecentScholarshipID.Connection = sc;
        System.Data.SqlClient.SqlDataReader reader = sqlrecentScholarshipID.ExecuteReader();

        while (reader.Read())
        {
            recentPostID = reader.GetInt32(0);
        }

        sc.Close();

        sc.Open();

        System.Data.SqlClient.SqlCommand recentScholarshipPost = new System.Data.SqlClient.SqlCommand();
        recentScholarshipPost.CommandText = "SELECT Scholarship.ScholarshipName, Scholarship.ScholarshipDescription, Scholarship.ScholarshipMin, Scholarship.ScholarshipMax, Scholarship.ScholarshipDueDate, Organization.OrganizationName, Organization.OrganizationDescription, Organization.Image FROM Scholarship INNER JOIN Organization ON Scholarship.OrganizationID = Organization.OrganizationEntityID where ScholarshipID =" + recentPostID;
        recentScholarshipPost.Connection = sc;

        reader = recentScholarshipPost.ExecuteReader();



            while (reader.Read())
            {
                scholarshipName = reader.GetString(0);
                scholarshipDescription = reader.GetString(1);
                scholarshipMin = (double)reader.GetDecimal(2);
                scholarshipMax = (double)reader.GetDecimal(3);
                scholarshipDueDate = reader.GetDateTime(4);
                orgName = reader.GetString(5);
                orgDescription = reader.GetString(6);
                orgImage = reader.GetString(7);
            }
        
    }
    protected void scholarshipTable_Load(object sender, EventArgs e)
    {
        int countTotalScholarships = 0;
        String connectionString = System.Configuration.ConfigurationManager.ConnectionStrings["DBConnectionString"].ConnectionString;
        System.Data.SqlClient.SqlConnection sc = new System.Data.SqlClient.SqlConnection(connectionString);
        sc.Open();

        System.Data.SqlClient.SqlCommand countScholarships = new System.Data.SqlClient.SqlCommand();
        countScholarships.CommandText = "SELECT count( SchoolApproval.OpportunityEntityID) FROM OpportunityEntity INNER JOIN SchoolApproval ON OpportunityEntity.OpportunityEntityID = SchoolApproval.OpportunityEntityID where OpportunityEntity.OpportunityType = 'JOB' and schoolApproval.approvedflag = 'Y' and SchoolEntityID = " + Session["schoolID"];
        countScholarships.Connection = sc;

        System.Data.SqlClient.SqlDataReader reader = countScholarships.ExecuteReader();

        while (reader.Read())
        {
            countTotalScholarships = reader.GetInt32(0);
        }

        sc.Close();



        sc.Open();
        System.Data.SqlClient.SqlCommand pullScholarshipInfo = new System.Data.SqlClient.SqlCommand();
        pullScholarshipInfo.CommandText = "SELECT Organization.OrganizationName, Scholarship.ScholarshipName, Scholarship.ScholarshipDescription, Organization.Image, Organization.ExternalLink, Scholarship.ScholarshipMin, Scholarship.ScholarshipMax, Scholarship.ScholarshipDueDate FROM Scholarship INNER JOIN Organization ON Scholarship.OrganizationID = Organization.OrganizationEntityID where Scholarship.Approved = 'Y' AND scholarshipID <>" + recentPostID;
        pullScholarshipInfo.Connection = sc;



        reader = pullScholarshipInfo.ExecuteReader();

        {
            String[] orgNameArray = new String[countTotalScholarships];
            String[] scholarshipNameArray = new String[countTotalScholarships];
            String[] scholarshipDescriptionArray = new String[countTotalScholarships];
            String[] imageArray = new string[countTotalScholarships];
            String[] linkArray = new string[countTotalScholarships];
            decimal[] scholarshipMinArray = new decimal[countTotalScholarships];
            decimal[] scholarshipMaxArray = new decimal[countTotalScholarships];
            DateTime[] deadlineArray = new DateTime[countTotalScholarships];

            int x = 0;
            while (reader.Read())
            {
                orgNameArray[x] = reader.GetString(0);
                scholarshipNameArray[x] = reader.GetString(1);
                scholarshipDescriptionArray[x] = reader.GetString(2);
                imageArray[x] = reader.GetString(3);
                linkArray[x] = reader.GetString(4);
                scholarshipMinArray[x] = reader.GetDecimal(5);
                scholarshipMaxArray[x] = reader.GetDecimal(6);
                deadlineArray[x] = reader.GetDateTime(7);
                x++;

            }
            sc.Close();
            double doubleRows = countTotalScholarships / 3.0;
            int numrows = (int)(Math.Ceiling(doubleRows));
            int numcells = 3;
            int count = 0;
            for (int j = 0; j < numrows; j++)
            {
                TableRow r = new TableRow();


                for (int i = 0; i < numcells; i++)
                {
                    if (count == countTotalScholarships)
                    {
                        break;
                    }
                    TableCell c = new TableCell();
                    c.Text += "<div class='image-flip' ontouchstart='this.classList.toggle('hover');'>";
                    c.Text += "<div class='mainflip'>";
                    c.Text += "<div class='frontside'>";
                    c.Text += "<div class='card'>";
                    c.Text += "<div class='card-body text-center'>";
                    c.Text += "<p><img class='img-fluid' src='" + imageArray[count] + "' alt='card image'></p>";
                    c.Text += "<h4 class='card-title'>" + orgNameArray[count] + "</h4>";
                    c.Text += "<p class='card-text'>" + scholarshipNameArray[count] + "</p>";
                    c.Text += "<a href='#' class='btn btn-primary btn-sm'><i class='fa fa-plus'></i></a>";
                    c.Text += "</div>";
                    c.Text += "</div>";
                    c.Text += "</div>";
                    c.Text += "<div class='backside'>";
                    c.Text += "<div class='card'>";
                    c.Text += "<div class='card-body text-center'>";
                    c.Text += "<h4 class='card-title'>" + orgNameArray[count] + "</h4>";
                    c.Text += "<p class='card-text'>" + scholarshipNameArray[count] + "</p>";
                    c.Text += "<p class='card-text'> Description: " + scholarshipDescriptionArray[count] + "</p>";
                    c.Text += "<p class='card-text'> Minimum: " + scholarshipMinArray[count].ToString("$000.00") + "</p>";
                    c.Text += "<p class='card-text'> Maximum: " + scholarshipMaxArray[count].ToString("$000.00") + "</p>";
                    c.Text += "<p class='card-text'>  Deadline: " + deadlineArray[count].ToString() + "</p>";
                    c.Text += "<ul class='list-inline'>";
                    c.Text += "<li class='list-inline-item'>";
                    c.Text += "<a class='social-icon text-xs-center' target='_blank' href='" + linkArray[count] + "'>";
                    c.Text += "<i class='fas fa-external-link-alt'></i>";
                    c.Text += "</a>";
                    c.Text += "</li>";
                    c.Text += "</ul>";
                    c.Text += "</div>";
                    c.Text += "</div>";
                    c.Text += "</div>";
                    c.Text += "</div>";
                    c.Text += "</div>";
                    c.Style.Add("width", "33%");
                    r.Cells.Add(c);
                    count++;

                }
                scholarshipTable.Rows.Add(r);
            }


        }

    }

}