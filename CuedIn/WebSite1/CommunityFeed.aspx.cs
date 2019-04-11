﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Tweetinvi;
using System.Configuration;


public partial class CommunityFeed : System.Web.UI.Page
{
    //Sql objects for global use boi
    String connectionString = ConfigurationManager.ConnectionStrings["DBConnectionString"].ConnectionString;
    System.Data.SqlClient.SqlConnection sc = new System.Data.SqlClient.SqlConnection();

    protected void Page_Load(object sender, EventArgs e)
    {
        //set up connection String
        sc.ConnectionString = connectionString;

        ((Label)Master.FindControl("lblMaster")).Text = "Community Feed";

        //API Keys Consumers
        String ConsumerAPIKey = "DniQmv9b00q3fUmIsJ1XUfsVk";
        String ConsumerSecretKey = "2XxjzfYbyQgQfvK0T8tXntG6BOV7XGC2sJo4zUdOFY2LbqJojs";
        //API keys Secret/Tokens
        String accessToken = "411549308-HzZFxXI32uraK0fUsLGoVxYfD6AXDjZFDwA4LAvZ";
        String accessSecretToken = "rOqotd9WCARD5nrtU3wOFpOJhFRhBEmnNE7oKZ0vqdGL0";

        //Set up the Auth for Twitter
        Auth.SetUserCredentials(ConsumerAPIKey, ConsumerSecretKey, accessToken, accessSecretToken);

        //Make a new Twitter user obj based on our credentials
        var authUser = Tweetinvi.User.GetAuthenticatedUser();

        //Get the profile pic
        var profilePic = authUser.ProfileImageUrlFullSize;

        //Set the profile pic in the Card
        profilePicture.ImageUrl = profilePic;

        //Get twitter handle and set it to a label in a card
        UserNameLabel.Text = "@"+ authUser.UserIdentifier.ToString();



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
        while (reader.Read()){

            int userEntityID = reader.GetInt32(0);
            String userName = reader.GetString(1);
            String emailAddress = reader.GetString(2);
            String twitterHandle = reader.GetString(3);
            String twitterLink = reader.GetString(4);
            String entityType = reader.GetString(5);

            UserEntity userEntityObj = new UserEntity(userEntityID, userName, emailAddress,
                twitterHandle,twitterLink, entityType);

            userEntityList.Add(userEntityObj);

        }

        sc.Close();

        //Schools
        sc.Open();
        populateUsers.CommandText = "SELECT SchoolEntityID,SchoolName,StreetAddress,Country,City,State,SchoolCounty,ZipCode FROM UserEntity " +
            "INNER JOIN School ON UserEntity.UserEntityID = School.SchoolEntityID where TwitterHandle is not null";

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

            School schoolObj = new School(schoolEntityID, schoolName, streetAddress,
               country, city, state, schoolCounty, zipCode);

            schoolList.Add(schoolObj);
        }

        sc.Close();

        //Organization populate
        sc.Open();

        populateUsers.CommandText = "SELECT  OrganizationEntityID,OrganizationName,OrganizationDescription,StreetAddress,Country,City,State,ZipCode,Image,ExternalLink FROM " +
            "UserEntity INNER JOIN Organization ON UserEntity.UserEntityID = Organization.OrganizationEntityID where TwitterHandle is not null";

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

            Organization organizationObj = new Organization(organizationEntityID, organizationName, organizationDescription, streetAddress,
                country, city, state, zipCode, image, externalLink);

            organizationList.Add(organizationObj);

        }



        // associate jobnames,schoolnames, with twitter (associating userEntities, with schools and organizations)
        for (int i = 0; i <= userEntityList.Count - 1; i++)
        {
            //
            for (int j = 0; j <= schoolList.Count - 1; j++)
            {
                //match with the userID's and if they match set the obj aligned with other
                //after set the image to the twitter image url
                if (userEntityList[i].getUserEntityID() == schoolList[j].getSchoolEntityID())
                {
                    userEntityList[i].setSchool(schoolList[j]);
                    var schoolUser = Tweetinvi.User.GetUserFromScreenName(userEntityList[i].getTwitterHandle());
                    userEntityList[i].getSchool().setImage(schoolUser.ProfileImageUrl);
                    break;

                }
            }

            for (int j = 0; j <= organizationList.Count - 1; j++)
            {
                //match with the userID's and if they match set the obj aligned with other
                //after set the image to the twitter image url
                if (userEntityList[i].getUserEntityID() == organizationList[j].GetOrganizationEntityID())
                {
                    userEntityList[i].setOrganization(organizationList[j]);
                    var organizationUser = Tweetinvi.User.GetUserFromScreenName(userEntityList[i].getTwitterHandle());
                    userEntityList[i].getOrganization().setImage(organizationUser.ProfileImageUrl);
                    break;
                }


            }
                TableRow row = new TableRow();
                TableCell cell = new TableCell();
                LinkButton twitterContactLink = new LinkButton();

                if (userEntityList[i].getSchool() != null)
                {
                    twitterContactLink.Text = userEntityList[i].getSchool().getSchoolName();
                    twitterContactLink.ID = "TwitterContactLink" + i;
                    cell.Controls.Add(twitterContactLink);
                    row.Cells.Add(cell);
                    ContactsTable.Rows.Add(row);
                    
                    twitterContactLink.Command += new CommandEventHandler(this.Button_click);
                    twitterContactLink.CommandArgument = userEntityList[i].getTwitterLink();
                }
                else if (userEntityList[i].getOrganization() != null)
                {
                    twitterContactLink.Text = userEntityList[i].getOrganization().getOrganizationName();
                    twitterContactLink.ID = "TwitterContactLink" + i;
                    cell.Controls.Add(twitterContactLink);
                    row.Cells.Add(cell);
                    ContactsTable.Rows.Add(row);

                    twitterContactLink.Command += new CommandEventHandler(this.Button_click);
                    twitterContactLink.CommandArgument = userEntityList[i].getTwitterLink();
            }

            }
        


    }
    protected void TweetButtonClick(object sender, CommandEventArgs e)
    {
        //Transfer the text in the textbox to the Modal Text box
        Tweet.Text = TweetBox.Text;
        ClientScript.RegisterStartupScript(this.GetType(), "Pop", "openTweetVerification();", true);

        //TweeterFeedLink.HRef = "https://twitter.com/TA_FCA?ref_src=twsrc%5Etfw";

    }


    protected void SendTweet_Click(object sender, EventArgs e)
    {
        //The stuff in the modal text box is the stuff we are going to tweet
        String yeet = Tweet.Text;
        var firstTweet = Tweetinvi.Tweet.PublishTweet(yeet);
    }


    public void Button_click(object sender, CommandEventArgs e)
    {
        LinkButton btn = sender as LinkButton;
        String twitterLink = e.CommandArgument.ToString();
        TweeterFeedLink.HRef = twitterLink;
    }
}