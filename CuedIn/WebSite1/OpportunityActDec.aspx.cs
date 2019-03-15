using System;
using System.Collections.Generic;
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
        if (e.CommandName == "Approve")
        {
            int test = Convert.ToInt32(e.CommandArgument);
            TextBox1.Text = test.ToString();

        }



    }




}