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




        for (int i = 0; i <= rows; i++)
        {
            TableRow row = new TableRow();
            TableCell cell = new TableCell();
            LinkButton zing = new LinkButton();
            zing.Text = "hello";
            zing.ID = "sheesh" + i;
            cell.Controls.Add(zing);
            row.Cells.Add(cell);
            ContactsTable.Rows.Add(row);
        }


    }
    protected void TweetButtonClick(object sender, CommandEventArgs e)
    {
        Tweet.Text = TweetBox.Text;
        ClientScript.RegisterStartupScript(this.GetType(), "Pop", "openTweetVerification();", true);

        //TweeterFeedLink.HRef = "https://twitter.com/TA_FCA?ref_src=twsrc%5Etfw";

    }









    protected void SendTweet_Click(object sender, EventArgs e)
    {
        String yeet = Tweet.Text;
        var firstTweet = Tweetinvi.Tweet.PublishTweet(yeet);
    }


    public void Button_click(object sender, EventArgs e, String tweetLink)
    {
        LinkButton btn = sender as LinkButton;
        
    }
}