using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class DirectorScholarshipBoard : System.Web.UI.Page
{


    protected void Page_Load(object sender, EventArgs e)
    {


        ((Label)Master.FindControl("lblMaster")).Text = "Approved Scholarships";
        ((Label)Master.FindControl("lblMaster")).Attributes.Add("Style", "color: #fff; text-align:center; text-transform: uppercase; letter-spacing: 6px; font-size: 2.0em; margin: .67em");


    }
    protected void scholarshipTable_Load(object sender, EventArgs e)
    {
        if (Session["schoolid"] == null)
        {
            Session["schoolid"] = 12;
        }
        int countTotalScholarships = 0;
        String connectionString = System.Configuration.ConfigurationManager.ConnectionStrings["DBConnectionString"].ConnectionString;
        System.Data.SqlClient.SqlConnection sc = new System.Data.SqlClient.SqlConnection(connectionString);
        sc.Open();

        System.Data.SqlClient.SqlCommand countScholarships = new System.Data.SqlClient.SqlCommand();
        countScholarships.CommandText = "SELECT count(SchoolApproval.OpportunityEntityID) FROM OpportunityEntity INNER JOIN SchoolApproval ON OpportunityEntity.OpportunityEntityID = SchoolApproval.OpportunityEntityID where OpportunityEntity.OpportunityType = 'SCHOL' and schoolApproval.approvedflag = 'Y' and SchoolApproval.SchoolEntityID = " + Session["schoolID"];
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
           "where SchoolApproval.ApprovedFlag = 'Y' and OpportunityEntity.OpportunityType = 'SCHOL' and SchoolApproval.SchoolEntityID = " + Session["schoolID"];
        pullScholarshipInfo.Connection = sc;



        reader = pullScholarshipInfo.ExecuteReader();

        {
            List<Scholarship> scholarships = new List<Scholarship>();

            String orgName;
            String scholarshipName;
            String scholarshipDescription;
            String image;
            String link;
            decimal scholarshipMin;
            decimal scholarshipMax;
            DateTime deadline;
            int scholarshipID;

            int x = 0;
            while (reader.Read())
            {
                orgName = reader.GetString(0);
                scholarshipName = reader.GetString(1);
                scholarshipDescription = reader.GetString(2);
                image = reader.GetString(3);
                link = reader.GetString(4);
                scholarshipMin = reader.GetDecimal(5);
                scholarshipMax = reader.GetDecimal(6);
                deadline = reader.GetDateTime(7);
                scholarshipID = reader.GetInt32(8);

                x++;

                Scholarship scholarship = new Scholarship(scholarshipID, scholarshipName, scholarshipDescription,
                    scholarshipMin, scholarshipMax, image, link, deadline, orgName);

                scholarships.Add(scholarship);

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

                    referralLink.CommandArgument += scholarships[count].getScholarshipID();
                    referralLink.Command += new CommandEventHandler(this.referralButton_Click);

                    c.Controls.Add(new LiteralControl("<div class='image-flip' ontouchstart='this.classList.toggle('hover');'>"));
                    c.Controls.Add(new LiteralControl("<div class='mainflip'>"));
                    c.Controls.Add(new LiteralControl("<div class='frontside'>"));
                    c.Controls.Add(new LiteralControl("<div class='card'>"));
                    c.Controls.Add(new LiteralControl("<div class='card-body text-center'>"));
                    c.Controls.Add(new LiteralControl("<p><img class='img-fluid' src='" + scholarships[count].getImage() + "' alt='card image'></p>"));
                    c.Controls.Add(new LiteralControl("<h4 class='card-title'>" + scholarships[count].getScholarshipName() + "</h4>"));
                    c.Controls.Add(new LiteralControl("<p class='card-text'>" + scholarships[count].getOrgName() + "</p>"));
                    c.Controls.Add(new LiteralControl("<a href='#' class='btn btn-primary btn-sm'><i class='fa fa-plus'></i></a>"));
                    c.Controls.Add(new LiteralControl("</div>"));
                    c.Controls.Add(new LiteralControl("</div>"));
                    c.Controls.Add(new LiteralControl("</div>"));

                    c.Controls.Add(new LiteralControl("<div class='backside'>"));
                    c.Controls.Add(new LiteralControl("<div class='card'>"));
                    c.Controls.Add(new LiteralControl("<div class='card-body text-center'>"));
                    c.Controls.Add(new LiteralControl("<h4 class='card-title'>" + scholarships[count].getScholarshipName() + "</h4>"));
                    c.Controls.Add(new LiteralControl("<p class='card-text'>" + scholarships[count].getScholarshipName() + "</p>"));
                    c.Controls.Add(new LiteralControl("<p class='card-text'>" + scholarships[count].getScholarshipDescription() + "</p>"));
                    c.Controls.Add(new LiteralControl("<p class='card-text'> Minimum: " + scholarships[count].getScholarshipMin().ToString() + "</p>"));
                    c.Controls.Add(new LiteralControl("<p class='card-text'> Maximum: " + scholarships[count].getScholarshipMax().ToString() + "</p>"));
                    c.Controls.Add(new LiteralControl("<p class='card-text'> Deadline: " + scholarships[count].getScholarshipDueDate().ToString() + "</p>"));
                    c.Controls.Add(new LiteralControl("<ul class='list-inline'>"));
                    c.Controls.Add(new LiteralControl("<li class='list-inline-item'>"));
                    c.Controls.Add(new LiteralControl("<a class='social-icon text-xs-center' target='_blank' href='" + scholarships[count].getLink() + "'>"));
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
        String scholarshipName = "";
        String orgName = "";
        while (reader.Read())
        {
            scholarshipName = reader.GetString(0);
            orgName = reader.GetString(1);
        }

        lblScholarshipName.Text = scholarshipName;
        lblOrgName.Text = orgName;

        ClientScript.RegisterStartupScript(this.GetType(), "Pop", "openSendToModal();", true);

    }

    public void sendToButton_Click(object sender, EventArgs e)
    {
        List<int> studentIDList = new List<int>();
        for (int i = 0; i < gridviewRefer.Rows.Count; i++)
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