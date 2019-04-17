using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class CounselorStudentMetricsDashboard : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["schoolid"] != null)
        {
            if (Session["schoolid"].Equals(12))
            {
                lousiapc.Visible = true;
                lousiaphone.Visible = true;
                lousiatablet.Visible = true;
            }
            else if (Session["schoolid"].Equals(13))
            {
                
            }

            else if (Session["schoolid"].Equals(15))
            {
                turnerpc.Visible = true;
                turnerphone.Visible = true;
                turnertablet.Visible = true;
            }
        }
        else
        {
            lousiapc.Visible = true;
        }
        ((Label)Master.FindControl("lblMaster2")).Text = "Administrative Dashboard";
        
    }
}