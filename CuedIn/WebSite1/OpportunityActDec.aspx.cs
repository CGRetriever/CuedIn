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
        if (!IsPostBack)
        {
        }
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
            sql.Open();
            System.Data.SqlClient.SqlCommand approveJob = new System.Data.SqlClient.SqlCommand();
            approveJob.Connection = sql;
            approveJob.CommandText = "update joblisting set approved = 'yes', lastUpdated ='" + DateTime.Today + "' where joblistingID = " + jobID;
            approveJob.ExecuteNonQuery();
            sql.Close();

            //Maybe pop-up box that says "Job XYZ Approved, would you like to send to a student?"//

        }
        else if (e.CommandName == "JReject")
        {
            sql.Open();
            System.Data.SqlClient.SqlCommand rejectJob = new System.Data.SqlClient.SqlCommand();
            rejectJob.Connection = sql;
            rejectJob.CommandText = "update joblisting set approved = 'no', lastUpdated ='" + DateTime.Today + "' where joblistingID = " + jobID;
            rejectJob.ExecuteNonQuery();
            sql.Close();

            //Maybe pop-up box that says "Job XYZ Rejected, would you like to message the business??"//
        }
        Response.Redirect(Request.RawUrl);

    }

    protected void GridView2_OnRowCommand(object sender, GridViewCommandEventArgs e)
    {
        int scholarshipID = Convert.ToInt32(e.CommandArgument);
        String connectionString = ConfigurationManager.ConnectionStrings["DBConnectionString"].ConnectionString;
        System.Data.SqlClient.SqlConnection sql = new System.Data.SqlClient.SqlConnection(connectionString);
        if (e.CommandName == "SApprove")
        {
            sql.Open();
            System.Data.SqlClient.SqlCommand approveScholarship = new System.Data.SqlClient.SqlCommand();
            approveScholarship.Connection = sql;
            approveScholarship.CommandText = "update scholarship set approved = 'yes', lastUpdated ='" + DateTime.Today + "' where scholarshipID = " + scholarshipID;
            approveScholarship.ExecuteNonQuery();
            //Maybe pop-up box that says "Job XYZ Approved, would you like to send to a student?"//
        }

        if (e.CommandName == "SReject")
        {
            sql.Open();
            System.Data.SqlClient.SqlCommand rejectScholarship = new System.Data.SqlClient.SqlCommand();
            rejectScholarship.Connection = sql;
            rejectScholarship.CommandText = "update scholarship set approved = 'no', lastUpdated ='" + DateTime.Today + "' where scholarshipID = " + scholarshipID;
            rejectScholarship.ExecuteNonQuery();
            //Maybe pop-up box that says "Job XYZ Rejected, would you like to message the business?"//
        }

        Response.Redirect(Request.RawUrl);
    }




}