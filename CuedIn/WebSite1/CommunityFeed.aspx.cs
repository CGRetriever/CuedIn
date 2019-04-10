using System;
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

        //Now lets make query for the amount of rows we need for our contacts table
        int rows = 0;
        sc.Open();
        System.Data.SqlClient.SqlCommand countRowsQuery = new System.Data.SqlClient.SqlCommand();
        countRowsQuery.Connection = sc;

        //bang bang get the query to get the amount of people with twitter @s
        countRowsQuery.CommandText = "select count(UserEntityID) from userEntity where [TwitterHandle] is not null";

        System.Data.SqlClient.SqlDataReader reader = countRowsQuery.ExecuteReader();

        //set-up the rows we need
        while(reader.Read()){
            rows = reader.GetInt32(0);
        }

        
        sc.Close();

        //initialize arrays of objects!!!
        List<UserEntity> userEntityList = new List<UserEntity>();
        List<School> schoolList = new List<School>();
        List<Organization> organizationList = new List<Organization>();

        //Populating these arrays with some fully loaded info for flexibility and future usage
        sc.Open();
        System.Data.SqlClient.SqlCommand populateUsers = new System.Data.SqlClient.SqlCommand();

        //get all of that jaunt
        populateUsers.CommandText = "Select * from UserEntity where TwitterHandle is not null and EntityType != 'STUD'";

        reader = populateUsers.ExecuteReader();

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

        //Schools
        populateUsers.CommandText = "SELECT SchoolEntityID,SchoolName,StreetAddress,Country,City,State,SchoolCounty,ZipCode FROM UserEntity " +
            "INNER JOIN School ON UserEntity.UserEntityID = School.SchoolEntityID where TwitterHandle is not null";

        reader = populateUsers.ExecuteReader();

        while (reader.Read())
        {

        }










        //for (int i = 0; i <= rows; i++)
        //{
        //    TableRow row = new TableRow();
        //    TableCell cell = new TableCell();
        //    LinkButton zing = new LinkButton();
        //    zing.Text = "hello";
        //    zing.ID = "sheesh" + i;
        //    cell.Controls.Add(zing);
        //    row.Cells.Add(cell);
        //    ContactsTable.Rows.Add(row);
        //}


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


    public void Button_click(object sender, EventArgs e, String tweetLink)
    {
        LinkButton btn = sender as LinkButton;
        
    }
}