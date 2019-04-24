using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Counselor : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        //if (Session["user"] == null || !Session["permission"].Equals("Counselor"))
        //{
        //    Response.Redirect("Login.aspx");
        //}

        //else if (!Session.IsNewSession && Request.UrlReferrer == null)
        //{
        //    Response.Redirect("Login.aspx");
        //}

        Session["schoolID"] = 12;
        Session["userCounty"] = "Harrisonburg City Public Schools";

    }

    protected void btn(object sender, EventArgs e)
    {
        Response.Redirect("Login.aspx");
    }

    protected void HomeButton_Click(object sender, ImageClickEventArgs e)
    {
        Response.Redirect("JobPostings.aspx");
    }
}
