using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class StudentMetricsDashboard : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["schoolid"] != null)
        {
            if (Session["schoolid"].Equals(12))
            {
                lousiapc.Visible = true;
                lousiasmall.Visible = true;
              
            }
            else if (Session["schoolid"].Equals(13))
            {
                
            }

            else if (Session["schoolid"].Equals(15))
            {
                turnerpc.Visible = true;
                turnerphone.Visible = true;
              
            }
        } else
        {
            lousiapc.Visible = true;
        }
        
        ((Label)Master.FindControl("lblMaster")).Text = "Administrative Dashboard";
        ((Label)Master.FindControl("lblMaster")).Attributes.Add("Style", "color: #fff; text-align:center; text-transform: uppercase; letter-spacing: 6px; font-size: 2.0em; margin: .67em");

    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        string constr = ConfigurationManager.ConnectionStrings["DBConnectionString"].ConnectionString;
        using (SqlConnection con = new SqlConnection(constr))
        {
            using (SqlCommand cmd = new SqlCommand("SELECT Student.FirstName +' '+ Student.LastName as 'Student Name', Student.HoursOfWorkPlaceExp, LogHours.HoursRequested ,Student.HoursOfWorkPlaceExp +' '+ LogHours.HoursRequested as 'Total Hours', Student.StudentGradeLevel, Student.StudentEthnicity, Student.StudentGender, Student.IncomeLevel,     Student.StudentAthleteFlag FROM Student INNER JOIN   LogHours ON Student.StudentEntityID = LogHours.StudentEntityID"))  //insert our query here
            {
                using (SqlDataAdapter sda = new SqlDataAdapter())
                {
                    cmd.Connection = con;
                    sda.SelectCommand = cmd;
                    using (DataTable dt = new DataTable())
                    {
                        sda.Fill(dt);
                        //Build the CSV file data as a Comma separated string.
                        string csv = string.Empty;

                        foreach (DataColumn column in dt.Columns)
                        {
                            //Add the Header row for CSV file.
                            csv += column.ColumnName + ',';
                        }

                        //Add new line.
                        csv += "\r\n";

                        foreach (DataRow row in dt.Rows)
                        {
                            foreach (DataColumn column in dt.Columns)
                            {
                                //Add the Data rows.
                                csv += row[column.ColumnName].ToString().Replace(",", ";") + ',';
                            }

                            //Add new line.
                            csv += "\r\n";
                        }

                        //Download the CSV file.
                        Response.Clear();
                        Response.Buffer = true;
                        Response.AddHeader("content-disposition", "attachment;filename=Report.csv");
                        Response.Charset = "";
                        Response.ContentType = "application/text";
                        Response.Output.Write(csv);
                        Response.Flush();
                        Response.End();
                    }
                }
            }
        }
    }
}