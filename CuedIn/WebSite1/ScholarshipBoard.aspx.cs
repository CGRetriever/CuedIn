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
        if (Session["user"] == null ||  !Session["permission"].Equals("Admin"))
        {
            Response.Redirect("Login.aspx");
        }
        else
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
    }
    protected void scholarshipTable_Load(object sender, EventArgs e)
    {
        int countTotalScholarships = 0;
        String connectionString = System.Configuration.ConfigurationManager.ConnectionStrings["DBConnectionString"].ConnectionString;
        System.Data.SqlClient.SqlConnection sc = new System.Data.SqlClient.SqlConnection(connectionString);
        sc.Open();

        System.Data.SqlClient.SqlCommand countScholarships = new System.Data.SqlClient.SqlCommand();
        countScholarships.CommandText = "select count(ScholarshipID) from Scholarship where approved = 'Y' and scholarshipID <> " + recentPostID;
        countScholarships.Connection = sc;

        System.Data.SqlClient.SqlDataReader reader = countScholarships.ExecuteReader();

        while (reader.Read())
        {
            countTotalScholarships = reader.GetInt32(0);
        }

        sc.Close();



        sc.Open();
        System.Data.SqlClient.SqlCommand pullScholarshipInfo = new System.Data.SqlClient.SqlCommand();
        pullScholarshipInfo.CommandText = "SELECT Organization.OrganizationName, Scholarship.ScholarshipName, Scholarship.ScholarshipDescription, Organization.Image, Organization.ExternalLink FROM Scholarship INNER JOIN Organization ON Scholarship.OrganizationID = Organization.OrganizationEntityID where Scholarship.Approved = 'Y' AND scholarshipID <>" + recentPostID;
        pullScholarshipInfo.Connection = sc;



        reader = pullScholarshipInfo.ExecuteReader();

        {
            String[] orgNameArray = new String[countTotalScholarships];
            String[] scholarshipNameArray = new String[countTotalScholarships];
            String[] scholarshipDescriptionArray = new String[countTotalScholarships];
            String[] imageArray = new string[countTotalScholarships];
            String[] linkArray = new string[countTotalScholarships];
            int x = 0;
            while (reader.Read())
            {
                orgNameArray[x] = reader.GetString(0);
                scholarshipNameArray[x] = reader.GetString(1);
                scholarshipDescriptionArray[x] = reader.GetString(2);
                imageArray[x] = reader.GetString(3);
                linkArray[x] = reader.GetString(4);
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
                    c.Text += "<div class = 'card card-cascade>";
                    c.Text += "<div class = 'view view-cascade overlay'>";
                    c.Text += "<img class = 'card-img-top' src='" + imageArray[count] + "'>";
                    c.Text += "<div class = 'card-body card-body-cascade text-center'>";
                    c.Text += "<h4 class='card-title'> <strong>" + orgNameArray[count] + "</strong> </h4>";
                    c.Text += "<div class='font-weight-bold indigo-text py-2'>" + scholarshipNameArray[count] + "</div>";
                    c.Text += "<div class = 'card-text'>" + scholarshipDescriptionArray[count] + "</div>";
                    c.Text += "<a type ='button' class = 'border border-white btn-medium btn-round' style = 'background-color:#ffffff;' href='" + linkArray[count] + "' target = '_blank'><i class='fas fa-link' > </i></a>";
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