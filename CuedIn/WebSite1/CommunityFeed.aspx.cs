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


        Auth.SetUserCredentials("pfWh2IF2nun7O27NDqTTUFn7a",
            "ApbSuKZGfN92AZwuv5TaZG1HW4bDY5UcBawkbbJPLmA7I3cxmH",
            "411549308-AgIWJT3aFpIsTh0RHI7OrLusBKnnRqpU5LG0BmN1",
            "weQ7m0qkZdFORveMZOhvOQ5rGM8ZPCk4S4Av96LbXfkvs");






    


    }




 
}