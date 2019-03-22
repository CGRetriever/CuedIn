using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class ModalTestPage : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            DataTable dt = new DataTable();
            dt.Columns.AddRange(new DataColumn[] {
        new DataColumn("student_Id")
        ,new DataColumn("Month_Name")
        ,new DataColumn("Amount")
        ,new DataColumn("IsPaid")
        ,new DataColumn("date")
    });

            dt.Rows.Add(1, "Jan", 5200, "Yes", DateTime.Now.AddDays(-263));
            dt.Rows.Add(2, "Feb", 6500, "No", DateTime.Now.AddDays(-50));
            dt.Rows.Add(3, "Mar", 7500, "", "");
            dt.Rows.Add(4, "Apr", 6333, "No", DateTime.Now.AddDays(-63));
            dt.Rows.Add(5, "Jun", 15000, "Yes", DateTime.Now.AddDays(-93));
            GridView1.DataSource = dt;
            GridView1.DataBind();
        }
    }

    protected void Display(object sender, EventArgs e)
    {
        int rowIndex = Convert.ToInt32(((sender as LinkButton).NamingContainer as GridViewRow).RowIndex);
        GridViewRow row = GridView1.Rows[rowIndex];

        lblstudentid.Text = (row.FindControl("lblstudent_Id") as Label).Text;
        lblmonth.Text = (row.FindControl("lblMonth_Name") as Label).Text; ;
        txtAmount.Text = (row.FindControl("lblAmount") as Label).Text;
        ClientScript.RegisterStartupScript(this.GetType(), "Pop", "openModal();", true);
    }

    protected void btnSave_Click(object sender, EventArgs e)
    {
        //Your Saving code.
    }
}