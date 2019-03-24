using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class OpportunityActDec : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        GridView2.Columns[0].Visible = false;
    }



    public override void VerifyRenderingInServerForm(Control control)
    {
        /* Verifies that the control is rendered */
    }

    protected void GridView1_OnRowCommand(object sender, GridViewCommandEventArgs e)

    {
        int jobID = Convert.ToInt32(e.CommandArgument);
        String connectionString = ConfigurationManager.ConnectionStrings["DBConnectionString"].ConnectionString;
        System.Data.SqlClient.SqlConnection sql = new System.Data.SqlClient.SqlConnection(connectionString);

        if (e.CommandName == "JApprove")
        {
            //sql.Open();
            //System.Data.SqlClient.SqlCommand approveJob = new System.Data.SqlClient.SqlCommand();
            //approveJob.Connection = sql;
            //approveJob.CommandText = "update joblisting set approved = 'yes', lastUpdated ='" + DateTime.Today + "' where joblistingID = " + jobID;
            //approveJob.ExecuteNonQuery();
            //sql.Close();

            //Maybe pop-up box that says "Job XYZ Approved, would you like to send to a student?"//
            ClientScript.RegisterStartupScript(this.GetType(), "Pop", "openModal();", true);

        }
        else if (e.CommandName == "JReject")
        {
            //sql.Open();
            //System.Data.SqlClient.SqlCommand rejectJob = new System.Data.SqlClient.SqlCommand();
            //rejectJob.Connection = sql;
            //rejectJob.CommandText = "update joblisting set approved = 'no', lastUpdated ='" + DateTime.Today + "' where joblistingID = " + jobID;
            //rejectJob.ExecuteNonQuery();
            //sql.Close();

            //Maybe pop-up box that says "Job XYZ Rejected, would you like to message the business??"//
        }




        Response.Redirect(Request.RawUrl);

    }







    protected void LinkButton1_Click(object sender, CommandEventArgs e)
    {

        //int rowIndex = Convert.ToInt32(((sender as LinkButton).NamingContainer as GridViewRow).RowIndex);
        //GridViewRow row = GridView2.Rows[rowIndex];
        ////lblstudentid.Text = (row.FindControl("lblstudent_Id") as Label).Text;
        ////lblmonth.Text = (row.FindControl("lblMonth_Name") as Label).Text; ;
        ////txtAmount.Text = (row.FindControl("lblAmount") as Label).Text;

        //String sName;
        //String sDesc;

        //sName = GridView2.Rows[rowIndex].Cells[0].Text;
        //sDesc = GridView2.Rows[rowIndex].Cells[1].Text;

        ////String primarykey;

        ////  primarykey = GridView2.Rows[rowIndex].Cells[0].Text;
        String connectionString = ConfigurationManager.ConnectionStrings["DBConnectionString"].ConnectionString;
        System.Data.SqlClient.SqlConnection sql = new System.Data.SqlClient.SqlConnection(connectionString);

        int rowIndex = Convert.ToInt32(((sender as LinkButton).NamingContainer as GridViewRow).RowIndex);
        GridViewRow row = GridView2.Rows[rowIndex];


        int scholarshipID = Convert.ToInt32(e.CommandArgument);

        Session["selectedScholarshipID"] = scholarshipID.ToString();

        ClientScript.RegisterStartupScript(this.GetType(), "Pop", "openEditSModal();", true);

    }

    protected void LinkButton2_Click(object sender, CommandEventArgs e)
    {
        String connectionString = ConfigurationManager.ConnectionStrings["DBConnectionString"].ConnectionString;
        System.Data.SqlClient.SqlConnection sql = new System.Data.SqlClient.SqlConnection(connectionString);
        
        int rowIndex = Convert.ToInt32(((sender as LinkButton).NamingContainer as GridViewRow).RowIndex);
        GridViewRow row = GridView2.Rows[rowIndex];

        int scholarshipID = Convert.ToInt32(e.CommandArgument);

        Session["selectedScholarshipID"] = scholarshipID.ToString();

        ClientScript.RegisterStartupScript(this.GetType(), "Pop", "openApproveSModal();", true);

        //sql.Open();
        //System.Data.SqlClient.SqlCommand approveScholarship = new System.Data.SqlClient.SqlCommand();
        //approveScholarship.Connection = sql;
        //approveScholarship.CommandText = "update scholarship set approved = 'yes', lastUpdated ='" + DateTime.Today + "' where scholarshipID = " + scholarshipID;
        //approveScholarship.ExecuteNonQuery();
    }


    protected void LinkButton3_Click(object sender, CommandEventArgs e)
    {
        String connectionString = ConfigurationManager.ConnectionStrings["DBConnectionString"].ConnectionString;
        System.Data.SqlClient.SqlConnection sql = new System.Data.SqlClient.SqlConnection(connectionString);

        int rowIndex = Convert.ToInt32(((sender as LinkButton).NamingContainer as GridViewRow).RowIndex);
        GridViewRow row = GridView2.Rows[rowIndex];

        int scholarshipID = Convert.ToInt32(e.CommandArgument);

        Session["selectedScholarshipID"] = scholarshipID.ToString();

        ClientScript.RegisterStartupScript(this.GetType(), "Pop", "openRejectSModal();", true);


        //sql.Open();
        //System.Data.SqlClient.SqlCommand rejectScholarship = new System.Data.SqlClient.SqlCommand();
        //rejectScholarship.Connection = sql;
        //rejectScholarship.CommandText = "update scholarship set approved = 'no', lastUpdated ='" + DateTime.Today + "' where scholarshipID = " + scholarshipID;
        //rejectScholarship.ExecuteNonQuery();
        //sql.Close();
    }

    protected void rejectScholarshipButton_Click(object sender, EventArgs e)
    {
        String connectionString = ConfigurationManager.ConnectionStrings["DBConnectionString"].ConnectionString;
        System.Data.SqlClient.SqlConnection sql = new System.Data.SqlClient.SqlConnection(connectionString);

        sql.Open();
        System.Data.SqlClient.SqlCommand rejectScholarship = new System.Data.SqlClient.SqlCommand();
        rejectScholarship.Connection = sql;
        rejectScholarship.CommandText = "update scholarship set approved = 'no', lastUpdated ='" + DateTime.Today + "' where scholarshipID = " + Session["selectedScholarshipID"];
        rejectScholarship.ExecuteNonQuery();
        sql.Close();

        Response.Redirect(Request.RawUrl);
    }
}