<%@ Page Title="" Language="C#" MasterPageFile="~/Teacher.master" AutoEventWireup="true" CodeFile="TeacherCommunityFeed.aspx.cs" Inherits="TeacherCommunityFeed" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server" width="80%">

    


<!--- Breadcrumb --->

 
    <ol class="breadcrumb arr-bread">
 
    <li><a href="TeacherLandingPage.aspx">Home</a></li>                         
 
    <li class="active"><span>Community Feed</span></li>       
 
                </ol>

<!--- END Breadcrumb --->


<div="container-fluid">
<div class="row">
     <div class ="col-sm-4">
         <button onclick="topFunction()" id="myBtn"><i class="fas fa-angle-double-up"></i></button>
       
     
          <div class ="card text-center" >
                <div class="card-header">
                    <asp:Label ID="TweetStream" runat="server" Text="Our Tweets" Font-Bold="True"></asp:Label>
                </div>
                <div class="card-body">
                    <a class="twitter-timeline" href="https://twitter.com/ValleyConsulti1?ref_src=twsrc%5Etfw" data-width="80%" data-height="800">Tweets by ValleyConsulti1</a> <script async src="https://platform.twitter.com/widgets.js" charset="utf-8"></script>
                </div>
              </div>
             </div>


         <div class ="col-sm-4">

        <div class ="card text-center">
                <div class="card-header">
                    <asp:Label ID="CommunityFeedLabel" runat="server" Text="Community Feed" Font-Bold="True"></asp:Label>
                </div>
                <div class="card-body border-light">
                    <a class="twitter-timeline"  id="TweeterFeedLink" runat="server"
                        href="https://twitter.com/ValleyConsulti1?ref_src=twsrc%5Etfw" data-width="400" data-height="800" >CommunityFeed</a> <script async src="https://platform.twitter.com/widgets.js" charset="utf-8"></script>
                    
                </div>
              </div>


    </div>

      
<div class ="col-sm-4">
        <div class ="card text-center">
                <div class="card-header">
                    <asp:Label ID="ContactLabel" runat="server" Text="Contacts" Font-Bold="True"></asp:Label>
                </div>
                <div class="card-body">

                    <asp:Table ID="ContactsTable" runat="server" CssClass="table table-striped" ></asp:Table>
                </div>
              </div>

    </div>
    </>
</div>
    </div>




    




            <script type='text/javascript'>
                function openTweetVerification() {
                    $('[id*=TweetVerification]').modal('show');
                } 
                             window.onscroll = function() {scrollFunction()};

                            function scrollFunction() {
              if (document.body.scrollTop > 20 || document.documentElement.scrollTop > 20) {
                document.getElementById("myBtn").style.display = "block";
              } else {
                document.getElementById("myBtn").style.display = "none";
              }
            }

            // When the user clicks on the button, scroll to the top of the document
            function topFunction() {
              document.body.scrollTop = 0; // For Safari
              document.documentElement.scrollTop = 0; // For Chrome, Firefox, IE and Opera
            }

            </script>


    



</asp:Content>

