using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class SchoolMaster : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        //if (Session["user"] == null || !Session["permission"].Equals("Admin"))
        //{
        //    Response.Redirect("Login.aspx");
        //}

        //else if (!Session.IsNewSession && Request.UrlReferrer == null)
        //{
        //    Response.Redirect("Login.aspx");
        //}


       

    }

    protected void btn(object sender, EventArgs e)
    {
        //Response.Redirect("Login.aspx");
    }

    protected void StudentSizeBtn_Click(object sender, EventArgs e)
    {
        //TextBox TextBox1 = (TextBox)ContentPlaceHolder1.FindControl("TextBox1");
        //Label StudentApproveLabel = (Label)ContentPlaceHolder1.FindControl("StudentApproveLabel");
        //StudentApproveLabel.Font.Size = FontUnit.Parse("3.3em");



    }
}
