using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Tweetinvi;
using System.Configuration;
using System.Drawing;


public partial class TeacherCommunityFeed : System.Web.UI.Page
{
    //Sql objects for global use boi
    String connectionString = ConfigurationManager.ConnectionStrings["DBConnectionString"].ConnectionString;
    System.Data.SqlClient.SqlConnection sc = new System.Data.SqlClient.SqlConnection();

    protected void Page_Load(object sender, EventArgs e)
    {
        //this is for testing purposes
        Session["schoolID"] = 12;
        Session["userCounty"] = "Harrisonburg City Public Schools";
        //set up county variables. This is for community feed, and contacts.
        String countyFeed = "";
        String countyTwitterHandle = "";
        if (Session["userCounty"].ToString() == ("Rockingham County"))
        {
            TweeterFeedLink.HRef = "https://twitter.com/RockinghamTODAY?ref_src=twsrc%5Etfw";
            countyFeed = TweeterFeedLink.HRef;
            countyTwitterHandle = "RockinghamToday";
        }

        else if (Session["userCounty"].ToString() == ("Louisa County"))
        {
            TweeterFeedLink.HRef = "https://twitter.com/LCPSchools?ref_src=twsrc%5Etfw";
            countyFeed = TweeterFeedLink.HRef;
            countyTwitterHandle = "LCPSchools";

        }

        else if (Session["userCounty"].ToString() == ("Harrisonburg City Public Schools"))
        {
            TweeterFeedLink.HRef = "https://twitter.com/HCPSNews?ref_src=twsrc%5Etfw";
            countyFeed = TweeterFeedLink.HRef;
            countyTwitterHandle = "HCPSNews";

        }

        //set up connection String
        sc.ConnectionString = connectionString;

        ((Label)Master.FindControl("lblMaster")).Text = "Community Feed";
        ((Label)Master.FindControl("lblMaster")).Attributes.Add("Style", "color: #fff; text-align:center; text-transform: uppercase; letter-spacing: 6px; font-size: 2.0em; margin: .67em");

        //API Keys Consumers
        String ConsumerAPIKey = "m1OiqyDwhR4N6qhUZKPs5Ol8v";
        String ConsumerSecretKey = "AcgglHiet3ZZ06X7tBIjf2BdQmy4os7wRLHvjFz8mWcMHwdaop";
        //API keys Secret/Tokens
        String accessToken = "1116437883563458560-cS8oBkKGbtz9JW8Q4X4fm8k49os1ao";
        String accessSecretToken = "pkCNEQZ4pmVASwoYPzX2O4u0EPV9ItI1akFje9Jfhwwcm";

        //Set up the Auth for Twitter
        Auth.SetUserCredentials(ConsumerAPIKey, ConsumerSecretKey, accessToken, accessSecretToken);




        //initialize arrays of objects!!!
        List<UserEntity> userEntityList = new List<UserEntity>();
        List<School> schoolList = new List<School>();
        List<Organization> organizationList = new List<Organization>();



        //Populating these arrays with some fully loaded info for flexibility and future usage
        sc.Open();
        System.Data.SqlClient.SqlCommand populateUsers = new System.Data.SqlClient.SqlCommand();
        populateUsers.Connection = sc;

        //get all of that jaunt
        populateUsers.CommandText = "Select * from UserEntity where TwitterHandle is not null and EntityType != 'STUD'";

        System.Data.SqlClient.SqlDataReader reader = populateUsers.ExecuteReader();




        //populate our array with fully loaded UserEntityObjects
        while (reader.Read())
        {

            int userEntityID = reader.GetInt32(0);
            String userName = reader.GetString(1);
            String emailAddress = reader.GetString(2);
            String twitterHandle = reader.GetString(3);
            String twitterLink = reader.GetString(4);
            String entityType = reader.GetString(5);

            UserEntity userEntityObj = new UserEntity(userEntityID, userName, emailAddress,
                twitterHandle, twitterLink, entityType);

            userEntityList.Add(userEntityObj);

        }

        sc.Close();

        //Schools populate
        sc.Open();
        populateUsers.CommandText = "SELECT  School.SchoolEntityID, School.SchoolName, School.StreetAddress, School.Country, School.City, School.State, " +
            "School.SchoolCounty, School.ZipCode, UserEntity.UserName, UserEntity.EmailAddress," +
            " UserEntity.TwitterHandle, UserEntity.TwitterLink, UserEntity.EntityType FROM   UserEntity INNER JOIN " +
            " School ON UserEntity.UserEntityID = School.SchoolEntityID WHERE(UserEntity.TwitterHandle IS NOT NULL)";

        reader = populateUsers.ExecuteReader();

        while (reader.Read())
        {
            int schoolEntityID = reader.GetInt32(0);
            String schoolName = reader.GetString(1);
            String streetAddress = reader.GetString(2);
            String country = reader.GetString(3);
            String city = reader.GetString(4);
            String state = reader.GetString(5);
            String schoolCounty = reader.GetString(6);
            int zipCode = reader.GetInt32(7);

            String userName = reader.GetString(8);
            String emailAddress = reader.GetString(9);
            String twitterHandle = reader.GetString(10);
            String twitterLink = reader.GetString(11);
            String entityType = reader.GetString(12);

            //userEntityID 

            School schoolObj = new School(schoolEntityID, schoolName, streetAddress,
               country, city, state, schoolCounty, zipCode, userName, emailAddress,
               twitterHandle, twitterLink, entityType);

            schoolList.Add(schoolObj);
        }

        sc.Close();

        //Organization populate
        sc.Open();

        populateUsers.CommandText = "SELECT Organization.OrganizationEntityID, Organization.OrganizationName, Organization.OrganizationDescription, " +
            "Organization.StreetAddress, Organization.Country, Organization.City, Organization.State, " +
            " Organization.ZipCode, Organization.Image, Organization.ExternalLink, UserEntity.UserName, UserEntity.EmailAddress," +
            " UserEntity.TwitterHandle, UserEntity.TwitterLink, UserEntity.EntityType " +
            "FROM  UserEntity INNER JOIN " +
            "Organization ON UserEntity.UserEntityID = Organization.OrganizationEntityID " +
            "WHERE(UserEntity.TwitterHandle IS NOT NULL)";

        reader = populateUsers.ExecuteReader();

        while (reader.Read())
        {
            int organizationEntityID = reader.GetInt32(0);
            String organizationName = reader.GetString(1);
            String organizationDescription = reader.GetString(2);
            String streetAddress = reader.GetString(3);
            String country = reader.GetString(4);
            String city = reader.GetString(5);
            String state = reader.GetString(6);
            int zipCode = reader.GetInt32(7);
            String image = reader.GetString(8);
            String externalLink = reader.GetString(9);

            String userName = reader.GetString(10);
            String emailAddress = reader.GetString(11);
            String twitterHandle = reader.GetString(12);
            String twitterLink = reader.GetString(13);
            String entityType = reader.GetString(14);

            Organization organizationObj = new Organization(organizationEntityID, organizationName, organizationDescription, streetAddress,
                country, city, state, zipCode, image, externalLink, userName, emailAddress, twitterHandle, twitterLink, entityType);

            organizationList.Add(organizationObj);

        }

        //Make initial county feed. Depends on user session vars
        TableRow row = new TableRow();
        TableCell cell = new TableCell();
        TableCell cell2 = new TableCell();
        LinkButton CountyContactLink = new LinkButton();
        CountyContactLink.CssClass = "border-bottom border-dark";
        System.Web.UI.WebControls.Image twitterAvi = new System.Web.UI.WebControls.Image();
        twitterAvi.CssClass = "rounded-circle";
        CountyContactLink.Text = "County Feed";
        twitterAvi.CssClass = "rounded-circle";
        CountyContactLink.Text = "Our County Feed";
        CountyContactLink.ID = "CountyLink";
        var countyUser = Tweetinvi.User.GetUserFromScreenName(countyTwitterHandle);
        twitterAvi.ImageUrl = countyUser.ProfileImageUrl;
        cell.Controls.Add(CountyContactLink);

        cell2.Controls.Add(twitterAvi);
        row.Cells.Add(cell2);
        row.Cells.Add(cell);
        ContactsTable.Rows.Add(row);



        // associate jobnames,schoolnames, with twitter (associating userEntities, with schools and organizations)
        for (int i = 0; i <= userEntityList.Count - 1; i++)
        {
            //New row and add a new cell to the row
            row = new TableRow();
            cell = new TableCell();
            cell2 = new TableCell();
            //make a new link button to instatntiate it later
            LinkButton twitterContactLink = new LinkButton();
            twitterContactLink.CssClass = "border-bottom border-dark";
            twitterAvi = new System.Web.UI.WebControls.Image();
            twitterAvi.CssClass = "rounded-circle";

            for (int j = 0; j <= schoolList.Count - 1; j++)
            {
                //match with the userID's and if they match set the obj aligned with other
                //after set the image to the twitter image url
                if (userEntityList[i].getUserEntityID() == schoolList[j].getSchoolEntityID())
                {

                    var schoolUser = Tweetinvi.User.GetUserFromScreenName(schoolList[j].getTwitterHandle());
                    schoolList[j].setImage(schoolUser.ProfileImageUrl);

                    //this particular component is a school we are going to make the button display the school name
                    //then we are going to add it into a row and cell
                    //then add a commandeventhandler dynamically

                    twitterContactLink.Text = schoolList[j].getSchoolName() + "\n";
                    twitterContactLink.ID = "TwitterContactLink" + i;
                    twitterAvi.ImageUrl = schoolList[j].getImage();
                    cell.Controls.Add(twitterContactLink);

                    cell2.Controls.Add(twitterAvi);
                    row.Cells.Add(cell2);
                    row.Cells.Add(cell);
                    ContactsTable.Rows.Add(row);

                    twitterContactLink.Command += new CommandEventHandler(this.Button_click);
                    twitterContactLink.CommandArgument = schoolList[j].getTwitterLink();
                    break;

                }
            }

            for (int j = 0; j <= organizationList.Count - 1; j++)
            {
                //match with the userID's and if they match set the obj aligned with other
                //after set the image to the twitter image url
                if (userEntityList[i].getUserEntityID() == organizationList[j].GetOrganizationEntityID())
                {
                    var organizationUser = Tweetinvi.User.GetUserFromScreenName(organizationList[j].getTwitterHandle());
                    organizationList[j].setImage(organizationUser.ProfileImageUrl);

                    //this particular component is a school we are going to make the button display the school name
                    //then we are going to add it into a row and cell
                    //then add a commandeventhandler dynamically

                    twitterContactLink.Text = organizationList[j].getOrganizationName() + "\n";
                    twitterContactLink.ID = "TwitterContactLink" + i;
                    cell.Controls.Add(twitterContactLink);
                    twitterAvi.ImageUrl = organizationList[j].GetImage();
                    cell.Controls.Add(twitterContactLink);
                    cell2.Controls.Add(twitterAvi);
                    row.Cells.Add(cell2);
                    row.Cells.Add(cell);


                    ContactsTable.Rows.Add(row);


                    twitterContactLink.Command += new CommandEventHandler(this.Button_click);
                    twitterContactLink.CommandArgument = organizationList[j].getTwitterLink();
                    break;
                }

            }

        }






    }
  

    public void Button_click(object sender, CommandEventArgs e)
    {
        LinkButton btn = sender as LinkButton;
        String twitterLink = e.CommandArgument.ToString();
        TweeterFeedLink.HRef = twitterLink;
    }
}