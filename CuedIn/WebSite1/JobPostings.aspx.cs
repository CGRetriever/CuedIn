using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class JobPostings : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        int count = 0;
        String connectionString = System.Configuration.ConfigurationManager.ConnectionStrings["DBConnectionString"].ConnectionString;
        System.Data.SqlClient.SqlConnection sc = new System.Data.SqlClient.SqlConnection(connectionString);
        sc.Open();

        System.Data.SqlClient.SqlCommand countJobPostings = new System.Data.SqlClient.SqlCommand();
        countJobPostings.CommandText = "select count(JobListingID) from JobListing where approved = 'yes'";
        countJobPostings.Connection = sc;

        System.Data.SqlClient.SqlDataReader reader = countJobPostings.ExecuteReader();

        while (reader.Read())
        {
            count = reader.GetInt32(0);
        }

        int colCnt = 3;
        int rowCnt = count / colCnt;

        for (int rowCtr = 1; rowCtr <= rowCnt; rowCtr++)
        {
            TableRow tableRow = new TableRow();
            tblJobPosting.Rows.Add(tableRow);
            for (int cellCtr = 1; cellCtr <= colCnt; cellCtr++)
            {
                TableCell tableCell = new TableCell();
                tableCell.Text
            }
        }


    }
}