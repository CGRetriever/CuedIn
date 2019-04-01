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
        //Response.Cache.SetExpires(DateTime.UtcNow.AddMinutes(-1));
        //Response.Cache.SetCacheability(System.Web.HttpCacheability.NoCache);
        //Response.Cache.SetNoStore();
    }

    protected void btn(object sender, EventArgs e)
    {
        //Response.Redirect("Login.aspx");
    }
}
