using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;


public partial class Login : System.Web.UI.Page
{
 
    public Login()
    {

    }
    protected void Page_Load(object sender, EventArgs e)
    {
       


        String connectionString = ConfigurationManager.ConnectionStrings["DBConnectionString"].ConnectionString;
        System.Data.SqlClient.SqlConnection sql = new System.Data.SqlClient.SqlConnection(connectionString);
        sql.Open();
        System.Data.SqlClient.SqlCommand query = new System.Data.SqlClient.SqlCommand();
        query.Connection = sql;
      


        //testing to see if we already made the username column in person.person
        query.CommandText = "Select username from dbo.userentity";
        try
        {
            System.Data.SqlClient.SqlDataReader reader = query.ExecuteReader();
        }
        //if not, we catch this error and make the new column in person.person
        catch
        {
            query.CommandText = "Alter table dbo.userentity add username varchar(50)";
            query.ExecuteNonQuery();
        }

        sql.Close();
        
    }


    protected void btn_click(object sender, EventArgs e)
    {
        Response.Redirect("JobPostingsPrototype.aspx");
    }


    protected void LoginButton_Click(object sender, EventArgs e)
    {
        String connectionString = ConfigurationManager.ConnectionStrings["DBConnectionString"].ConnectionString;
        System.Data.SqlClient.SqlConnection sql = new System.Data.SqlClient.SqlConnection(connectionString);
        
        sql.Open();
        System.Data.SqlClient.SqlCommand query = new System.Data.SqlClient.SqlCommand();
        query.Connection = sql;

        //query to grab the password of the username entered in
        query.CommandText = "SELECT DISTINCT dbo.Password.PasswordHash FROM dbo.Password INNER JOIN  " +
            "dbo.UserEntity ON dbo.Password.UserEntityID = dbo.UserEntity.UserEntityID where upper(username) = upper(@userName)";

        query.Parameters.AddWithValue("@userName", HttpUtility.HtmlEncode(username.Value));

        System.Data.SqlClient.SqlDataReader reader = query.ExecuteReader();


        String storedPassword = " ";
        while (reader.Read())
        {
            //Lazy way to handle null usernames. 
            if (reader.IsDBNull(0))
            {
                storedPassword = " ";
            }
            else
            {
                storedPassword = reader.GetString(0);
            }

        }
        sql.Close();
        reader.Close();

        //method to validate if password in hashed textbox matches our hashed password in the DB
        if (PasswordHash.ValidatePassword(password.Value, storedPassword))
        {
            Label1.Text = "Success!";
            String permissions = " ";
            sql.Open();
            System.Data.SqlClient.SqlCommand query1 = new System.Data.SqlClient.SqlCommand();
          
            query1.Connection = sql;
            query1.CommandText = "SELECT dbo.UserEntity.UserEntityID from dbo.userentity where upper(username) like upper(@userName1)";

            query1.Parameters.AddWithValue("@userName1", HttpUtility.HtmlEncode(username.Value));
            System.Data.SqlClient.SqlDataReader reader1 = query1.ExecuteReader();
            int id = 0;
            while (reader1.Read())
            {
                if (reader1.IsDBNull(0))
                    username.Value = "null";


                else
                {
                    id = reader1.GetInt32(0);
                }
            }
            
            query1.CommandText= "SELECT dbo.SchoolEmployee.SchoolEmployeeEntityType from dbo.schoolemployee where SchoolEmployeeEntityID = @SchoolEmployeeEntityID";
            query1.Parameters.AddWithValue("@SchoolEmployeeEntityID", id);
            reader1.Close();
            System.Data.SqlClient.SqlDataReader reader2 = query1.ExecuteReader();
            while (reader2.Read())
            {
                if (reader2.IsDBNull(0))
                    username.Value = "null";


                else
                {
                    permissions = reader2.GetString(0);
                }
            }


            //Test the permsissions
            if (permissions.Equals("Admin"))
                {
                    Response.Redirect("JobPostings.aspx");
                }
            else if (permissions.Equals("Counselor"))
            {
                Response.Redirect("CounselorJobPosting.aspx");
            }
            else if(permissions.Equals("Teacher"))
            {
                Response.Redirect("TeacherJobPosting.aspx");
            }

        }
        else
        {
            Label1.Text = "Your username or password is incorrect, please try again.";

            username.Value = "";
            password.Value = "";
            
            
        }


    }

   
}