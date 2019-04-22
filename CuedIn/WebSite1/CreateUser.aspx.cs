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
        zipcode.Attributes.CssStyle.Remove("background-color");
        email.Attributes.CssStyle.Remove("background-color");
        password.Attributes.CssStyle.Remove("background-color");
        password2.Attributes.CssStyle.Remove("background-color");

        int zip;
        Label1.Text = "";
        Label2.Text = "";
        String connectionString = ConfigurationManager.ConnectionStrings["DBConnectionString"].ConnectionString;
        System.Data.SqlClient.SqlConnection sql = new System.Data.SqlClient.SqlConnection(connectionString);

        sql.Open();
        System.Data.SqlClient.SqlCommand query = new System.Data.SqlClient.SqlCommand();
        query.Connection = sql;
        if (int.TryParse(zipcode.Value, out zip))
        {
            if (email.Value.Contains("@"))
            {
                if (password.Value.Equals(password2.Value))
                {
                    if (password.Value.Length >= 8)
                    {



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
                        insert.CommandText = "insert into dbo.userentity (UserName, EmailAddress, EntityType, LastUpdated) " +
                            "values (@username, @emailaddress, @entitytype, getDate())";
                        username.Value.Trim();
                        email.Value.Trim();
                        firstName.Value.Trim();
                        middleName.Value.Trim();
                        lastName.Value.Trim();

                        //Create user entity
                        UserEntity user = new UserEntity(username.Value.Trim(), email.Value.Trim(), role.SelectedItem.Value);
                        SchoolEmployee employee = new SchoolEmployee(firstName.Value.Trim(), lastName.Value.Trim(), middleName.Value.Trim(),
                            address.Value.Trim(), "USA", city.Value.Trim(), "VA", zipcode.Value, user.getEntityType(),
                            Convert.ToInt32(DropDownList2.SelectedItem.Value));


                        insert.Parameters.AddWithValue("@username", HttpUtility.HtmlEncode(user.getUserName()));
                        insert.Parameters.AddWithValue("@emailaddress", HttpUtility.HtmlEncode(user.getEmailAddress()));
                        insert.Parameters.AddWithValue("@entitytype", HttpUtility.HtmlEncode("SCHL"));



                        insert.ExecuteNonQuery();


                        //inserting into the password 
                        insert.CommandText = "insert into dbo.Password (PasswordID, PasswordHash, passwordSalt, UserEntityID, lastupdated)  " +
                            "values (@passwordID, @passwordHash, @passwordSalt, @userentityID, getDate())";



                        String hashedPass = PasswordHash.HashPassword(password.Value);
                        insert.Parameters.AddWithValue("@passwordID", userID);
                        insert.Parameters.AddWithValue("@passwordHash", hashedPass);

                        string test = PasswordHash.returnSalt(hashedPass);

                        //had to use only the substring and not the full salt value because there is a max length of 10 in the DB.
                        insert.Parameters.AddWithValue("@passwordSalt", test.Substring(0, 24));
                        insert.Parameters.AddWithValue("@userentityID", userID);
                        insert.ExecuteNonQuery();

                        insert.CommandText = "insert into dbo.schoolemployee (SchoolEmployeeEntityID, FirstName, LastName, MiddleName, StreetAddress, Country, City, State, Zipcode, SchoolEmployeeEntityType, SchoolEntityID, LastUpdated) " +
                  "values (@SchoolEmployeeEntityID, @FirstName, @LastName, @MiddleName, @StreetAddress, @Country, @City, @State, @Zipcode, @SchoolEmployeeEntityType, @SchoolEntityID, getDate())";


                        insert.Parameters.AddWithValue("@SchoolEmployeeEntityID", HttpUtility.HtmlEncode(userID));
                        insert.Parameters.AddWithValue("@FirstName", HttpUtility.HtmlEncode(employee.getFirstName()));
                        insert.Parameters.AddWithValue("@LastName", HttpUtility.HtmlEncode(employee.getLastName()));
                        insert.Parameters.AddWithValue("@MiddleName", HttpUtility.HtmlEncode(employee.getMiddleName()));
                        insert.Parameters.AddWithValue("@StreetAddress", HttpUtility.HtmlEncode(employee.getStreetAddress()));
                        insert.Parameters.AddWithValue("@Country", HttpUtility.HtmlEncode(employee.getCountry()));
                        insert.Parameters.AddWithValue("@City", HttpUtility.HtmlEncode(employee.getCity()));
                        insert.Parameters.AddWithValue("@State", HttpUtility.HtmlEncode("VA"));

                        if (int.TryParse(zipcode.Value, out zip))
                        {
                            insert.Parameters.AddWithValue("@Zipcode", HttpUtility.HtmlEncode(employee.getZipCode()));
                        }
                        else
                        {
                            insert.Parameters.AddWithValue("@Zipcode", 00000);
                            Label1.Text = "Enter a number for the zipcode";
                        }



                        insert.Parameters.AddWithValue("@SchoolEmployeeEntityType", employee.getSchoolEmployeeEntityType());
                        insert.Parameters.AddWithValue("@SchoolEntityID", employee.getSchoolEntityID());
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
                        Label2.Text = "The Password Must Be More Than 8 Characters";
                        password.Attributes.CssStyle.Add("background-color", "crimson");
                        password2.Attributes.CssStyle.Add("background-color", "crimson");
                    }
                }
                else
                {
                    Label2.Text = "Passwords do not match";
                    password.Attributes.CssStyle.Add("background-color", "crimson");
                    password2.Attributes.CssStyle.Add("background-color", "crimson");

                }
                }

                else
                {
                    Label2.Text = "Please Enter a Valid Email";
                    email.Value = "";
                    email.Attributes.CssStyle.Add("background-color", "crimson");
                }
            }
            else
            {
                Label2.Text = "Please Enter a Valid Zipcode";
                zipcode.Value = "";
                zipcode.Attributes.CssStyle.Add("background-color", "crimson");

            }
        }
      
 }





