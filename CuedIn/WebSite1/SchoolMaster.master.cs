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
