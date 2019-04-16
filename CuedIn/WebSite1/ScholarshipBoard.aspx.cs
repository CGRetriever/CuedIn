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
        if (Session["schoolID"] == null)
        {
            Session["schoolID"] = 12;
        }

        ((Label)Master.FindControl("lblMaster")).Text = "Scholarship Cards";
        //String connectionString = System.Configuration.ConfigurationManager.ConnectionStrings["DBConnectionString"].ConnectionString;
        //System.Data.SqlClient.SqlConnection sc = new System.Data.SqlClient.SqlConnection(connectionString);
        //sc.Open();

        //System.Data.SqlClient.SqlCommand sqlrecentScholarshipID = new System.Data.SqlClient.SqlCommand();
        //sqlrecentScholarshipID.CommandText = "select scholarshipID from scholarship where ScholarshipID = (select max(scholarshipID) from scholarship)";
        //sqlrecentScholarshipID.Connection = sc;
        //System.Data.SqlClient.SqlDataReader reader = sqlrecentScholarshipID.ExecuteReader();

        //while (reader.Read())
        //{
        //    recentPostID = reader.GetInt32(0);
        //}

        //sc.Close();

        //sc.Open();

        //System.Data.SqlClient.SqlCommand recentScholarshipPost = new System.Data.SqlClient.SqlCommand();
        //recentScholarshipPost.CommandText = "SELECT Scholarship.ScholarshipName, Scholarship.ScholarshipDescription, Scholarship.ScholarshipMin, Scholarship.ScholarshipMax, Scholarship.ScholarshipDueDate, Organization.OrganizationName, Organization.OrganizationDescription, Organization.Image FROM Scholarship INNER JOIN Organization ON Scholarship.OrganizationID = Organization.OrganizationEntityID where ScholarshipID =" + recentPostID;
        //recentScholarshipPost.Connection = sc;

        //reader = recentScholarshipPost.ExecuteReader();



        //    while (reader.Read())
        //    {
        //        scholarshipName = reader.GetString(0);
        //        scholarshipDescription = reader.GetString(1);
        //        scholarshipMin = (double)reader.GetDecimal(2);
        //        scholarshipMax = (double)reader.GetDecimal(3);
        //        scholarshipDueDate = reader.GetDateTime(4);
        //        orgName = reader.GetString(5);
        //        orgDescription = reader.GetString(6);
        //        orgImage = reader.GetString(7);
        //    }
        
    }
    protected void scholarshipTable_Load(object sender, EventArgs e)
    {
        int countTotalScholarships = 0;
        String connectionString = System.Configuration.ConfigurationManager.ConnectionStrings["DBConnectionString"].ConnectionString;
        System.Data.SqlClient.SqlConnection sc = new System.Data.SqlClient.SqlConnection(connectionString);
        sc.Open();

        System.Data.SqlClient.SqlCommand countScholarships = new System.Data.SqlClient.SqlCommand();
        countScholarships.CommandText = "SELECT count( SchoolApproval.OpportunityEntityID) FROM OpportunityEntity INNER JOIN SchoolApproval ON OpportunityEntity.OpportunityEntityID = SchoolApproval.OpportunityEntityID where OpportunityEntity.OpportunityType = 'JOB' and schoolApproval.approvedflag = 'Y' and SchoolApproval.SchoolEntityID = " + Session["schoolID"]; ;
        countScholarships.Connection = sc;

        System.Data.SqlClient.SqlDataReader reader = countScholarships.ExecuteReader();

        while (reader.Read())
        {
            countTotalScholarships = reader.GetInt32(0);
        }

        sc.Close();



        sc.Open();
        System.Data.SqlClient.SqlCommand pullScholarshipInfo = new System.Data.SqlClient.SqlCommand();
        pullScholarshipInfo.CommandText = "SELECT Organization.OrganizationName, Scholarship.ScholarshipName, Scholarship.ScholarshipDescription, Organization.Image, Organization.ExternalLink, Scholarship.ScholarshipMin, Scholarship.ScholarshipMax, Scholarship.ScholarshipDueDate, Scholarship.ScholarshipID FROM SchoolApproval INNER JOIN OpportunityEntity ON SchoolApproval.OpportunityEntityID = OpportunityEntity.OpportunityEntityID INNER JOIN Scholarship" +
            " ON OpportunityEntity.OpportunityEntityID = Scholarship.ScholarshipID INNER JOIN Organization ON Scholarship.OrganizationID = Organization.OrganizationEntityID " +
            "where SchoolApproval.ApprovedFlag = 'Y' and SchoolApproval.SchoolEntityID = " + Session["schoolID"];
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
            int[] scholarshipIDArray = new int[countTotalScholarships];

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
                scholarshipIDArray[x] = reader.GetInt32(8);

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
                    LinkButton referralLink = new LinkButton();
                    referralLink.ID = "referralLink" + count;

                    referralLink.CssClass = "far fa-paper-plane";

                    referralLink.CommandArgument += scholarshipIDArray[count];
                    referralLink.Command += new CommandEventHandler(this.referralButton_Click);

                    c.Controls.Add(new LiteralControl("<div class='image-flip' ontouchstart='this.classList.toggle('hover');'>"));
                    c.Controls.Add(new LiteralControl("<div class='mainflip'>"));
                    c.Controls.Add(new LiteralControl("<div class='frontside'>"));
                    c.Controls.Add(new LiteralControl("<div class='card'>"));
                    c.Controls.Add(new LiteralControl("<div class='card-body text-center'>"));
                    c.Controls.Add(new LiteralControl("<p><img class='img-fluid' src='" + imageArray[count] + "' alt='card image'></p>"));
                    c.Controls.Add(new LiteralControl("<h4 class='card-title'>" + scholarshipNameArray[count] + "</h4>"));
                    c.Controls.Add(new LiteralControl("<p class='card-text'>" + orgNameArray[count] + "</p>"));
                    c.Controls.Add(new LiteralControl("<a href='#' class='btn btn-primary btn-sm'><i class='fa fa-plus'></i></a>"));
                    c.Controls.Add(new LiteralControl("</div>"));
                    c.Controls.Add(new LiteralControl("</div>"));
                    c.Controls.Add(new LiteralControl("</div>"));

                    c.Controls.Add(new LiteralControl("<div class='backside'>"));
                    c.Controls.Add(new LiteralControl("<div class='card'>"));
                    c.Controls.Add(new LiteralControl("<div class='card-body text-center'>"));
                    c.Controls.Add(new LiteralControl("<h4 class='card-title'>" + scholarshipNameArray[count] + "</h4>"));
                    c.Controls.Add(new LiteralControl("<p class='card-text'>" + orgNameArray[count] + "</p>"));
                    c.Controls.Add(new LiteralControl("<p class='card-text'>" + scholarshipDescriptionArray[count] + "</p>"));
                    c.Controls.Add(new LiteralControl("<p class='card-text'> Minimum:" + scholarshipMinArray[count].ToString() + "</p>"));
                    c.Controls.Add(new LiteralControl("<p class='card-text'> Maximum: " + scholarshipMaxArray[count] + "</p>"));
                    c.Controls.Add(new LiteralControl("<p class='card-text'> Deadline:" + deadlineArray[count].ToString() + "</p>"));
                    c.Controls.Add(new LiteralControl("<ul class='list-inline'>"));
                    c.Controls.Add(new LiteralControl("<li class='list-inline-item'>"));
                    c.Controls.Add(new LiteralControl("<a class='social-icon text-xs-center' target='_blank' href='" + linkArray[count] + "'>"));
                    c.Controls.Add(new LiteralControl("<i class='fas fa-external-link-alt'></i>&nbsp;&nbsp;&nbsp;"));
                    c.Controls.Add(referralLink);
                    c.Controls.Add(new LiteralControl("</a>"));
                    c.Controls.Add(new LiteralControl("</li>"));
                    c.Controls.Add(new LiteralControl("</ul>"));
                    c.Controls.Add(new LiteralControl("</div>"));
                    c.Controls.Add(new LiteralControl("</div>"));
                    c.Controls.Add(new LiteralControl("</div>"));
                    c.Controls.Add(new LiteralControl("</div>"));
                    c.Controls.Add(new LiteralControl("</div>"));
                    c.Style.Add("width", "33%");
                    r.Cells.Add(c);
                    count++;

                }
                scholarshipTable.Rows.Add(r);
            }


        }

    }

    public void referralButton_Click(object sender, CommandEventArgs e)
    {
        int scholarshipID = Convert.ToInt32(e.CommandArgument);
        String connectionString = System.Configuration.ConfigurationManager.ConnectionStrings["DBConnectionString"].ConnectionString;
        System.Data.SqlClient.SqlConnection sc = new System.Data.SqlClient.SqlConnection(connectionString);
        sc.Open();

        System.Data.SqlClient.SqlCommand pullJobInfo = new System.Data.SqlClient.SqlCommand();
        pullJobInfo.CommandText = "SELECT Scholarship.ScholarshipName, Organization.OrganizationName FROM Scholarship INNER JOIN Organization ON Scholarship.OrganizationID = Organization.OrganizationEntityID WHERE Scholarship.ScholarshipID = " + scholarshipID;
        pullJobInfo.Connection = sc;

        System.Data.SqlClient.SqlDataReader reader = pullJobInfo.ExecuteReader();

        while (reader.Read())
        {
            String scholarshipName = reader.GetString(0);
            String orgName = reader.GetString(1);
        }

        lblScholarshipName.Text = scholarshipName;
        lblOrgName.Text = orgName;

        ClientScript.RegisterStartupScript(this.GetType(), "Pop", "openSendToModal();", true);

    }

    public void sendToButton_Click(object sender, EventArgs e)
    {
        List<int> studentIDList = new List<int>();
        for(int i = 0; i < gridviewRefer.Rows.Count; i++)
        {
            CheckBox check = (CheckBox)gridviewRefer.Rows[i].FindControl("studentCheck");


            if (check.Checked)
            {
                //find student ID for student who is checked
                int studentID = Convert.ToInt32(gridviewRefer.DataKeys[i]["StudentEntityID"]);
                studentIDList.Add(studentID);
            }

        }
        String connectionString = System.Configuration.ConfigurationManager.ConnectionStrings["DBConnectionString"].ConnectionString;
        System.Data.SqlClient.SqlConnection sc = new System.Data.SqlClient.SqlConnection(connectionString);
        sc.Open();

        System.Data.SqlClient.SqlConnection EmailQuery = new System.Data.SqlClient.SqlConnection(connectionString);
        List<String> emailList = new List<String>();
        // Mail Button Query
        EmailQuery.Open();
        System.Data.SqlClient.SqlCommand query = new System.Data.SqlClient.SqlCommand();
        query.Connection = EmailQuery;

        foreach (var studentID in studentIDList)
        {
            query.CommandText = "SELECT UserEntity.EmailAddress FROM UserEntity INNER JOIN Student ON UserEntity.UserEntityID = Student.StudentEntityID WHERE Student.StudentEntityID=" + studentID;
            System.Data.SqlClient.SqlDataReader Result = query.ExecuteReader();

            while (Result.Read())
            {
                String email = Result.GetString(0);
                emailList.Add(email);

            }

        }
        EmailQuery.Close();



    }

}