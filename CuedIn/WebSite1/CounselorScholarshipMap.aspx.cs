using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class CounselorScholarshipMap : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["user"] == null || !Session["permission"].Equals("Counselor"))
        {
            Response.Redirect("Login.aspx");
        }
        else
        {
        }
    }
}