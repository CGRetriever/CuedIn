﻿using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class CounselorArchiveScholarships : System.Web.UI.Page
{
    public static String email;

    protected void Page_Load(object sender, EventArgs e)
    {
        rejScholarshipGridview.Columns[0].Visible = false;
        ((Label)Master.FindControl("lblMaster")).Text = "Archived Scholarships";
        ((Label)Master.FindControl("lblMaster")).Attributes.Add("Style", "color: #fff; text-align:center; text-transform: uppercase; letter-spacing: 6px; font-size: 2.0em; margin: .67em");

        cbSelectAll.Attributes.Add("onclick", "Selectall");




        cbSelectAll2.Attributes.Add("onclick", "Selectall");



    }

    protected void acceptScholarshipButton_Click(object sender, EventArgs e)
    {
        String connectionString = ConfigurationManager.ConnectionStrings["DBConnectionString"].ConnectionString;
        System.Data.SqlClient.SqlConnection sql = new System.Data.SqlClient.SqlConnection(connectionString);

        sql.Open();
        System.Data.SqlClient.SqlCommand approveScholarship = new System.Data.SqlClient.SqlCommand();
        approveScholarship.Connection = sql;
        approveScholarship.CommandText = "update schoolApproval set approvedFlag = 'Y' where OpportunityEntityID = " + Session["selectedScholarshipID"] + " and schoolEntityID = " + Session["schoolID"];
        approveScholarship.ExecuteNonQuery();
        sql.Close();

        Response.Redirect("~/ArchiveScholarships.aspx");
    }
    //Gridview Rejected View More Button
    protected void btnRejScholarshipViewMore_Click(object sender, CommandEventArgs e)
    {


        String connectionString = ConfigurationManager.ConnectionStrings["DBConnectionString"].ConnectionString;
        System.Data.SqlClient.SqlConnection sql = new System.Data.SqlClient.SqlConnection(connectionString);

        int rowIndex = Convert.ToInt32(((sender as LinkButton).NamingContainer as GridViewRow).RowIndex);
        GridViewRow row = rejScholarshipGridview.Rows[rowIndex];


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
            Label3.Text = "Scholarship Name : " + reader.GetString(0);
            lblScholarshipDescription.Text = "Scholarship Description: " + reader.GetString(1);
            lblScholarshipMin.Text = "Scholarship Minimum: $" + reader.GetSqlMoney(2);
            lblScholarshipMax.Text = "Scholarship Maximum: $" + reader.GetSqlMoney(3);
            lblScholarshipQuantity.Text = "Scholarship Quantity: " + reader.GetInt32(4);
            lblScholarshipDueDate.Text = "Scholarship Due Date: " + reader.GetDateTime(5);

        }

        Session["selectedScholarshipID"] = scholarshipID.ToString();

        ClientScript.RegisterStartupScript(this.GetType(), "Pop", "openEditJModal();", true);

    }

    //Message Organization
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
        approveScholarship.ExecuteNonQuery();
        sql.Close();
        //UPDATE WITH QUERIES
        string email = "abc@abc.com";
        ClientScript.RegisterStartupScript(this.GetType(), "mailto", "parent.location='mailto:" + email + "'", true);
        Response.Redirect("~/ArchiveScholarships.aspx");
    }
    //Gridview Approve Button in Rejected GridView
    protected void btnScholarshipApprove_Click(object sender, CommandEventArgs e)
    {
        String connectionString = ConfigurationManager.ConnectionStrings["DBConnectionString"].ConnectionString;
        System.Data.SqlClient.SqlConnection sql = new System.Data.SqlClient.SqlConnection(connectionString);

        int rowIndex = Convert.ToInt32(((sender as LinkButton).NamingContainer as GridViewRow).RowIndex);
        GridViewRow row = rejScholarshipGridview.Rows[rowIndex];

        int scholarshipID = Convert.ToInt32(e.CommandArgument);

        Session["selectedScholarshipID"] = scholarshipID.ToString();


        sql.Open();
        System.Data.SqlClient.SqlCommand moreJobInfo = new System.Data.SqlClient.SqlCommand();
        moreJobInfo.Connection = sql;
        moreJobInfo.CommandText = "SELECT Scholarship.ScholarshipID, Scholarship.ScholarshipName, Organization.OrganizationName FROM Scholarship INNER JOIN Organization ON Scholarship.OrganizationID = Organization.OrganizationEntityID where ScholarshipID = " + Session["selectedScholarshipID"];
        System.Data.SqlClient.SqlDataReader reader = moreJobInfo.ExecuteReader();



        while (reader.Read())
        {
            lblScholarApprove.Text = reader.GetString(1);
            lblScholarSubApprove.Text = reader.GetString(2);

        }

        sql.Close();


        System.Data.SqlClient.SqlConnection EmailQuery = new System.Data.SqlClient.SqlConnection(connectionString);

        // Mail Button Query
        EmailQuery.Open();
        System.Data.SqlClient.SqlCommand query = new System.Data.SqlClient.SqlCommand();
        query.Connection = EmailQuery;
        query.CommandText = "SELECT  UserEntity.EmailAddress FROM  Scholarship INNER JOIN Organization ON Scholarship.OrganizationID = Organization.OrganizationEntityID INNER JOIN UserEntity ON Organization.OrganizationEntityID = UserEntity.UserEntityID WHERE Scholarship.ScholarshipID= " + Session["selectedScholarshipID"];
        System.Data.SqlClient.SqlDataReader Result = query.ExecuteReader();



        while (Result.Read())
        {
            email = Result.GetString(0);
        }

        EmailQuery.Close();


        AcceptSMaillink.NavigateUrl = "mailto:" + email + "?Subject=CommUP:%20Scholarship%20Approval!";



        ClientScript.RegisterStartupScript(this.GetType(), "Pop", "openApproveSModal();", true);
    }

    //reject button clicked in accept scholarship gridview
    protected void btnScholarshipReject_Click(object sender, CommandEventArgs e)
    {
        String connectionString = ConfigurationManager.ConnectionStrings["DBConnectionString"].ConnectionString;
        System.Data.SqlClient.SqlConnection sql = new System.Data.SqlClient.SqlConnection(connectionString);

        int rowIndex = Convert.ToInt32(((sender as LinkButton).NamingContainer as GridViewRow).RowIndex);
        GridViewRow row = acceptScholarshipGridview.Rows[rowIndex];

        int scholarshipID = Convert.ToInt32(e.CommandArgument);

        Session["selectedScholarshipID"] = scholarshipID.ToString();

        sql.Open();
        System.Data.SqlClient.SqlCommand moreJobInfo = new System.Data.SqlClient.SqlCommand();
        moreJobInfo.Connection = sql;
        moreJobInfo.CommandText = "SELECT Organization.OrganizationName, Scholarship.ScholarshipName FROM  Scholarship INNER JOIN Organization ON Scholarship.OrganizationID = Organization.OrganizationEntityID where Scholarship.ScholarshipID = " + Session["selectedScholarshipID"];
        System.Data.SqlClient.SqlDataReader reader = moreJobInfo.ExecuteReader();



        while (reader.Read())
        {
            scholarRejectLabel.Text = reader.GetString(0);
            scholarsubRejectLabel.Text = reader.GetString(1);
        }



        System.Data.SqlClient.SqlConnection EmailQuery = new System.Data.SqlClient.SqlConnection(connectionString);

        // Mail Button Query
        EmailQuery.Open();
        System.Data.SqlClient.SqlCommand query = new System.Data.SqlClient.SqlCommand();
        query.Connection = EmailQuery;
        query.CommandText = "SELECT  UserEntity.EmailAddress FROM  Scholarship INNER JOIN Organization ON Scholarship.OrganizationID = Organization.OrganizationEntityID INNER JOIN UserEntity ON Organization.OrganizationEntityID = UserEntity.UserEntityID WHERE Scholarship.ScholarshipID= " + Session["selectedScholarshipID"];
        System.Data.SqlClient.SqlDataReader Result = query.ExecuteReader();



        while (Result.Read())
        {
            email = Result.GetString(0);
        }

        EmailQuery.Close();


        RejectSMaillink.NavigateUrl = "mailto:" + email + "?Subject=CommUP:%20Scholarship%20Rejection";




        ClientScript.RegisterStartupScript(this.GetType(), "Pop", "openRejectSModal();", true);
    }
    //reject button clicked in modal-- updates DB
    protected void rejectScholarshipButton_Click(object sender, EventArgs e)
    {
        String connectionString = ConfigurationManager.ConnectionStrings["DBConnectionString"].ConnectionString;
        System.Data.SqlClient.SqlConnection sql = new System.Data.SqlClient.SqlConnection(connectionString);

        sql.Open();
        System.Data.SqlClient.SqlCommand rejectScholarship = new System.Data.SqlClient.SqlCommand();
        rejectScholarship.Connection = sql;
        rejectScholarship.CommandText = "update SchoolApproval set approvedFlag = 'N' where OpportunityEntityID = " + Session["selectedScholarshipID"] + " and schoolEntityID = " + Session["schoolID"];
        rejectScholarship.ExecuteNonQuery();
        sql.Close();

        Response.Redirect("~/ArchiveScholarships.aspx");
    }

    //Gridview Accepted View More Button
    protected void btnAccScholarshipViewMore_Click(object sender, CommandEventArgs e)
    {
        String connectionString = ConfigurationManager.ConnectionStrings["DBConnectionString"].ConnectionString;
        System.Data.SqlClient.SqlConnection sql = new System.Data.SqlClient.SqlConnection(connectionString);

        int rowIndex = Convert.ToInt32(((sender as LinkButton).NamingContainer as GridViewRow).RowIndex);
        GridViewRow row = acceptScholarshipGridview.Rows[rowIndex];


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
            Label3.Text = "Scholarship Name : " + reader.GetString(0);
            lblScholarshipDescription.Text = "Scholarship Description: " + reader.GetString(1);
            lblScholarshipMin.Text = "Scholarship Minimum: $" + reader.GetSqlMoney(2);
            lblScholarshipMax.Text = "Scholarship Maximum: $" + reader.GetSqlMoney(3);
            lblScholarshipQuantity.Text = "Scholarship Quantity: " + reader.GetInt32(4);
            lblScholarshipDueDate.Text = "Scholarship Due Date: " + reader.GetDateTime(5);

        }

        Session["selectedScholarshipID"] = scholarshipID.ToString();

        ClientScript.RegisterStartupScript(this.GetType(), "Pop", "openEditJModal();", true);

    }


    protected void btnCheckGridView1_Click(object sender, EventArgs e)
    {


        if (chkScholarshipMin.Checked != true)
        {
            for (int i = 0; i < rejScholarshipGridview.Columns.Count; i++)
            {
                if (rejScholarshipGridview.Columns[i].HeaderText == "Scholarship Minimum")
                {
                    rejScholarshipGridview.Columns[i].Visible = false;

                }
            }
        }
        else
        {
            for (int i = 0; i < rejScholarshipGridview.Columns.Count; i++)
            {
                if (rejScholarshipGridview.Columns[i].HeaderText == "Scholarship Minimum")
                {
                    rejScholarshipGridview.Columns[i].Visible = true;

                }
            }
        }

        if (chkScholarshipMax.Checked != true)
        {
            for (int i = 0; i < rejScholarshipGridview.Columns.Count; i++)
            {
                if (rejScholarshipGridview.Columns[i].HeaderText == "Scholarship Maximum")
                {
                    rejScholarshipGridview.Columns[i].Visible = false;

                }
            }
        }
        else
        {
            for (int i = 0; i < rejScholarshipGridview.Columns.Count; i++)
            {
                if (rejScholarshipGridview.Columns[i].HeaderText == "Scholarship Maximum")
                {
                    rejScholarshipGridview.Columns[i].Visible = true;

                }
            }
        }



    }

    protected void btnCheckGridView2_Click(object sender, EventArgs e)
    {


        if (chkScholarshipMin1.Checked != true)
        {
            for (int i = 0; i < acceptScholarshipGridview.Columns.Count; i++)
            {
                if (acceptScholarshipGridview.Columns[i].HeaderText == "Scholarship Minimum")
                {
                    acceptScholarshipGridview.Columns[i].Visible = false;

                }
            }
        }
        else
        {
            for (int i = 0; i < acceptScholarshipGridview.Columns.Count; i++)
            {
                if (acceptScholarshipGridview.Columns[i].HeaderText == "Scholarship Minimum")
                {
                    acceptScholarshipGridview.Columns[i].Visible = true;

                }
            }
        }

        if (chkScholarshipMax1.Checked != true)
        {
            for (int i = 0; i < acceptScholarshipGridview.Columns.Count; i++)
            {
                if (acceptScholarshipGridview.Columns[i].HeaderText == "Scholarship Maximum")
                {
                    acceptScholarshipGridview.Columns[i].Visible = false;

                }
            }
        }
        else
        {
            for (int i = 0; i < acceptScholarshipGridview.Columns.Count; i++)
            {
                if (acceptScholarshipGridview.Columns[i].HeaderText == "Scholarship Maximum")
                {
                    acceptScholarshipGridview.Columns[i].Visible = true;

                }
            }
        }





    }


    //protected void SearchButton1_Click(object sender, EventArgs e)
    //{
    //    String term = SearchBox1.Text;

    //    ScholarshipOpportunity.SelectParameters.Add("term", term);

    //    ScholarshipOpportunity.SelectCommand = "SELECT Scholarship.ScholarshipID, Scholarship.ScholarshipName, Organization.OrganizationName, Scholarship.ScholarshipMin, Scholarship.ScholarshipMax FROM Scholarship INNER JOIN Organization ON Scholarship.OrganizationID = Organization.OrganizationEntityID where(approved = 'N') and((Scholarship.ScholarshipName like '%" + @term + "%' or Organization.OrganizationName like '%" + @term + "%') or (Scholarship.ScholarshipMin like '%" + term + "%') or (Scholarship.ScholarshipMax like '%" + term + "%'))";
    //    ScholarshipOpportunity.DataBind();
    //    rejScholarshipGridview.DataBind();

    //    ScholarshipOpportunity.SelectParameters.Clear();
    //}

    //protected void SearchButton2_Click(object sender, EventArgs e)
    //{
    //    String term = SearchBox2.Text;

    //    SqlDataSource1.SelectParameters.Add("term", term);

    //    SqlDataSource1.SelectCommand = "SELECT Scholarship.ScholarshipID, Scholarship.ScholarshipName, Organization.OrganizationName, Scholarship.ScholarshipMin, Scholarship.ScholarshipMax FROM Scholarship INNER JOIN Organization ON Scholarship.OrganizationID = Organization.OrganizationEntityID where(approved = 'Y') and((Scholarship.ScholarshipName like '%" + @term + "%' or Organization.OrganizationName like '%" + @term + "%') or (Scholarship.ScholarshipMin like '%" + term + "%') or (Scholarship.ScholarshipMax like '%" + term + "%'))";
    //    SqlDataSource1.DataBind();
    //    acceptScholarshipGridview.DataBind();

    //    SqlDataSource1.SelectParameters.Clear();


    //}


    protected void cbSelectAll_Checked(object sender, EventArgs e)
    {
        if (cbSelectAll.Checked == true)
        {
            chkScholarshipMin.Checked = true;
            chkScholarshipMax.Checked = true;
            cbSelectAll.Text = "Unselect All";

        }

        if (cbSelectAll.Checked == false)
        {
            chkScholarshipMin.Checked = false;
            chkScholarshipMax.Checked = false;
            cbSelectAll.Text = "Select all";
        }
    }

    protected void cbSelectAll2_Checked(object sender, EventArgs e)
    {
        if (cbSelectAll2.Checked == true)
        {
            chkScholarshipMin1.Checked = true;
            chkScholarshipMax1.Checked = true;
            cbSelectAll2.Text = "Unselect All";
        }

        if (cbSelectAll2.Checked == false)
        {
            chkScholarshipMin1.Checked = false;
            chkScholarshipMax1.Checked = false;
            cbSelectAll2.Text = "Select all";
        }
    }
}