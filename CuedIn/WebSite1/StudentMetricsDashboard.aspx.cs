using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class StudentMetricsDashboard : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["schoolid"].Equals(12))
        {
            lousia.Visible = true;
        }
        else if (Session["schoolid"].Equals(13))
        {
            rockingham.Visible = true;
        }

        else if (Session["schoolid"].Equals(15))
        {
            turner.Visible = true;
        }
        ((Label)Master.FindControl("lblMaster")).Text = "Administrative Dashboard";
        
    }
}