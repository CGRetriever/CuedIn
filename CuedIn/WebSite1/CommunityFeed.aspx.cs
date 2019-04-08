using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Tweetinvi;



public partial class CommunityFeed : System.Web.UI.Page
{

    protected void Page_Load(object sender, EventArgs e)
    {
        ((Label)Master.FindControl("lblMaster")).Text = "Community Feed";

        String ConsumerAPIKey = "DniQmv9b00q3fUmIsJ1XUfsVk";
        String ConsumerSecretKey = "2XxjzfYbyQgQfvK0T8tXntG6BOV7XGC2sJo4zUdOFY2LbqJojs";

        String accessToken = "411549308-HzZFxXI32uraK0fUsLGoVxYfD6AXDjZFDwA4LAvZ";
        String accessSecretToken = "rOqotd9WCARD5nrtU3wOFpOJhFRhBEmnNE7oKZ0vqdGL0";

        Auth.SetUserCredentials(ConsumerAPIKey, ConsumerSecretKey, accessToken, accessSecretToken);

        var authUser = Tweetinvi.User.GetAuthenticatedUser();

        var profilePic = authUser.ProfileImageUrlFullSize;

        profilePicture.ImageUrl = profilePic;

        UserNameLabel.Text = "@"+ authUser.UserIdentifier.ToString();








    }




 
}