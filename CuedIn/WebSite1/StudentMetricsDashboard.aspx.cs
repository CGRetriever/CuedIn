using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;


public partial class StudentMetricsDashboard : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {


        ((Label)Master.FindControl("lblMaster")).Text = "Administrative Dashboard";


        
        String connectionString = ConfigurationManager.ConnectionStrings["DBConnectionString"].ConnectionString;

        System.Data.SqlClient.SqlConnection sql = new System.Data.SqlClient.SqlConnection(connectionString);
        sql.Open();
        System.Data.SqlClient.SqlCommand cmd = new System.Data.SqlClient.SqlCommand();
        cmd.Connection = sql;
        cmd.CommandText = "SELECT  count(*) FROM scholarship where approved = 'P'";
        int numberOfScholarships = ((int)cmd.ExecuteScalar());
        cmd.CommandText = "SELECT  count(*) FROM joblisting where approved = 'P'";
        int numberOfJobs = ((int)cmd.ExecuteScalar());
        sql.Close();
        SendSMS(numberOfScholarships, numberOfJobs);


    }

    protected void SendSMS(int scholarshipNum, int jobNum)
    {
      TwilioObj twilioObj = new TwilioObj(scholarshipNum, jobNum);
    }

 
    
    
  

}