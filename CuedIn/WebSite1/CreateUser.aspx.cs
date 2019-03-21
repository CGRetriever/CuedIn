using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class CreateUser : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void CreateUserClick(object sender, EventArgs e)
    {
        String connectionString = ConfigurationManager.ConnectionStrings["DBConnectionString"].ConnectionString;
        System.Data.SqlClient.SqlConnection sql = new System.Data.SqlClient.SqlConnection(connectionString);
       
        sql.Open();
        System.Data.SqlClient.SqlCommand query = new System.Data.SqlClient.SqlCommand();
        query.Connection = sql;

        //get our ID for future use (inserting into tables that use this key but not have it auto increment 1 person, password)
        query.CommandText = "SELECT max(UserEntityID) FROM dbo.UserEntity";

        System.Data.SqlClient.SqlDataReader reader = query.ExecuteReader();

        int userID = 0;

        while (reader.Read())
        {

            userID = reader.GetInt32(0);
            //increment by one because this is our new BEID after we insert
            userID++;

        }
        sql.Close();

        sql.Open();
        System.Data.SqlClient.SqlCommand insert = new System.Data.SqlClient.SqlCommand();
        insert.Connection = sql;
        //inserting into the BE table 


        //insert into the person table 
        insert.CommandText = "insert into dbo.userentity (UserName, EmailAddress, EntityType) " +
            "values (@username, @emailaddress, @entitytype)";

        
        insert.Parameters.AddWithValue("@username",username.Value);
        insert.Parameters.AddWithValue("@emailaddress", email.Value);
        insert.Parameters.AddWithValue("@entitytype", role.Value);



        insert.ExecuteNonQuery();

        //inserting into the password 
        insert.CommandText = "insert into dbo.Password (PasswordID, PasswordHash, passwordSalt, UserEntityID, lastupdated)  " +
            "values (@passwordID, @passwordHash, @passwordSalt, @userentityID, getDate())";

        String hashedPass = PasswordHash.HashPassword(password.Value);
        insert.Parameters.AddWithValue("@passwordID", userID);
        insert.Parameters.AddWithValue("@passwordHash", hashedPass);
        

        //had to use only the substring and not the full salt value because there is a max length of 10 in the DB.
        insert.Parameters.AddWithValue("@passwordSalt", PasswordHash.returnSalt(hashedPass).Substring(0, 9));
        insert.Parameters.AddWithValue("@userentityID", userID);
        insert.ExecuteNonQuery();



        //empmty these fields out.
        username.Value = "";
        password.Value = "";
        email.Value = "";
        role.Value = "";
    }
}