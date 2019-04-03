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
        //if (Session["user"] == null || !Session["permission"].Equals("Admin"))
        //{
        //    Response.Redirect("Login.aspx");
        //}
        //else
        //{
        //}
        //    //DropDownList2.DataBind();
        //role.DataBind();
        //role.Items.Insert(0, new ListItem("Please Select a Role", ""));
        //role.Items[0].Selected = true;
        //role.Items[0].Attributes["disabled"] = "disabled";

        //DropDownList2.Items.Insert(0, new ListItem("Please Select a School", ""));
        //DropDownList2.Items[0].Selected = true;
        //DropDownList2.Items[0].Attributes["disabled"] = "disabled";
        ((Label)Master.FindControl("lblMaster")).Text = "Create Users";
    }

    protected void CreateUserClick(object sender, EventArgs e)
    {
        Label1.Text = "";
        Label2.Text = "";
        String connectionString = ConfigurationManager.ConnectionStrings["DBConnectionString"].ConnectionString;
        System.Data.SqlClient.SqlConnection sql = new System.Data.SqlClient.SqlConnection(connectionString);
       
        sql.Open();
        System.Data.SqlClient.SqlCommand query = new System.Data.SqlClient.SqlCommand();
        query.Connection = sql;

        if (password.Value.Equals(password2.Value)) {


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
            username.Value.Trim();
            email.Value.Trim();
            firstName.Value.Trim();
            middleName.Value.Trim();
            lastName.Value.Trim();

            

            insert.Parameters.AddWithValue("@username", HttpUtility.HtmlEncode(username.Value));
            insert.Parameters.AddWithValue("@emailaddress", HttpUtility.HtmlEncode(email.Value));
            insert.Parameters.AddWithValue("@entitytype", HttpUtility.HtmlEncode("SCHL"));



            insert.ExecuteNonQuery();
             

            //inserting into the password 
            insert.CommandText = "insert into dbo.Password (PasswordID, PasswordHash, passwordSalt, UserEntityID, lastupdated)  " +
                "values (@passwordID, @passwordHash, @passwordSalt, @userentityID, getDate())";



            String hashedPass = PasswordHash.HashPassword(password.Value);
            insert.Parameters.AddWithValue("@passwordID", userID);
            insert.Parameters.AddWithValue("@passwordHash", hashedPass.Substring(0,10));

            string test = PasswordHash.returnSalt(hashedPass);

            //had to use only the substring and not the full salt value because there is a max length of 10 in the DB.
            insert.Parameters.AddWithValue("@passwordSalt", test.Substring(0,10));
            insert.Parameters.AddWithValue("@userentityID", userID);
            insert.ExecuteNonQuery();

            insert.CommandText = "insert into dbo.schoolemployee (SchoolEmployeeEntityID, FirstName, LastName, MiddleName, StreetAddress, Country, City, State, Zipcode, SchoolEmployeeEntityType, SchoolEntityID) " +
      "values (@SchoolEmployeeEntityID, @FirstName, @LastName, @MiddleName, @StreetAddress, @Country, @City, @State, @Zipcode, @SchoolEmployeeEntityType, @SchoolEntityID)";


            insert.Parameters.AddWithValue("@SchoolEmployeeEntityID", HttpUtility.HtmlEncode(userID));
            insert.Parameters.AddWithValue("@FirstName", HttpUtility.HtmlEncode(firstName.Value));
            insert.Parameters.AddWithValue("@LastName", HttpUtility.HtmlEncode(lastName.Value));
            insert.Parameters.AddWithValue("@MiddleName", HttpUtility.HtmlEncode(middleName.Value));
            insert.Parameters.AddWithValue("@StreetAddress", HttpUtility.HtmlEncode(address.Value));
            insert.Parameters.AddWithValue("@Country", HttpUtility.HtmlEncode("USA"));
            insert.Parameters.AddWithValue("@City", HttpUtility.HtmlEncode(city.Value));
            insert.Parameters.AddWithValue("@State", HttpUtility.HtmlEncode("VA"));
            int zip;
            if (int.TryParse(zipcode.Value, out zip))
            {
                insert.Parameters.AddWithValue("@Zipcode", HttpUtility.HtmlEncode(zip));
            }
            else
            {
                insert.Parameters.AddWithValue("@Zipcode", 00000);
                Label1.Text = "Enter a number for the zipcode";
            }

            
            
            insert.Parameters.AddWithValue("@SchoolEmployeeEntityType", role.SelectedItem.Value);
            insert.Parameters.AddWithValue("@SchoolEntityID", DropDownList2.SelectedItem.Value);
            insert.ExecuteNonQuery();


            //empmty these fields out.
            firstName.Value = "";
            lastName.Value = "";
            middleName.Value = "";
            city.Value = "";
            zipcode.Value = "";

     
            address.Value = "";
            username.Value = "";
            password.Value = "";
            email.Value = "";
            role.SelectedIndex = 0;
            DropDownList2.SelectedIndex = 0;
            Label1.Text = "Account Created!";
        }
        else
        {
            Label2.Text = "Passwords do not match";
        }
    }

   
}