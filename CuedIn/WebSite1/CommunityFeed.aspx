<%@ Page Title="" Language="C#" MasterPageFile="~/SchoolMaster.master" AutoEventWireup="true" CodeFile="CommunityFeed.aspx.cs" Inherits="CommunityFeed" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <form id="form1" runat="server" >


<div class="form-row">
     <div class ="form-group col-lg-4">
         <button onclick="topFunction()" id="myBtn"><i class="fas fa-angle-double-up"></i></button>
       
        <div class ="card text-center" style="width:30rem;">
            <div class="card-header">
                    <asp:Label ID="NewsFeedLabel" runat="server" Text="Our Profile" Font-Bold="True"></asp:Label>

            </div>
            <div class="card-body ">
                    <asp:Image ID="profilePicture" CssClass="img-fluid" runat="server" />

                <asp:Label ID="UserNameLabel" CssClass="card-text" runat="server"  Font-Bold="True"></asp:Label>
                <asp:TextBox id="TweetBox" rows="5" CssClass="form-control" TextMode="multiline" runat="server" BorderColor="Silver" ValidationGroup="Group1" Font-Size="Smaller" />
                </div>
         

                <%--<asp:RequiredFieldValidator ID="RequiredFieldValidator1" CssClass ="invalid-feedback" runat="server" ControlToValidate="TweetBox" ErrorMessage="Must be filled out" ValidationGroup="Group1" ForeColor="Red"></asp:RequiredFieldValidator>--%>
            <div class="card-body">
                <asp:LinkButton  ID="SendItButton" runat="server" OnCommand="TweetButtonClick" CssClass="btn"><i class="fas fa-paper-plane fa-3x"></i></asp:LinkButton>
                <p class="card-text font-weight-bold font-black">Send Tweet </p>
            </div>
         
        </div>
          <div class ="card text-center" style="width:30rem;">
                <div class="card-header">
                    <asp:Label ID="TweetStream" runat="server" Text="Our Tweets" Font-Bold="True"></asp:Label>
                </div>
                <div class="card-body">
                    <a class="twitter-timeline" href="https://twitter.com/ValleyConsulti1?ref_src=twsrc%5Etfw" data-width="400" data-height="400">Tweets by ValleyConsulti1</a> <script async src="https://platform.twitter.com/widgets.js" charset="utf-8"></script>
                </div>
              </div>
             </div>


         <div class ="form-group col-sm-4">

        <div class ="card text-center" style="width:30rem;">
                <div class="card-header">
                    <asp:Label ID="CommunityFeedLabel" runat="server" Text="Community Feed" Font-Bold="True"></asp:Label>
                </div>
                <div class="card-body border-light">
                    <a class="twitter-timeline"  id="TweeterFeedLink" runat="server"
                        href="https://twitter.com/ValleyConsulti1?ref_src=twsrc%5Etfw" data-width="400" data-height="800" >CommunityFeed</a> <script async src="https://platform.twitter.com/widgets.js" charset="utf-8"></script>
                    
                </div>
              </div>


    </div>

             <div>

        <div class ="card text-center" style="width:25rem;">
                <div class="card-header">
                    <asp:Label ID="ContactLabel" runat="server" Text="Contacts" Font-Bold="True"></asp:Label>
                </div>
                <div class="card-body">

                    <asp:Table ID="ContactsTable" runat="server" CssClass="table-striped"></asp:Table>
                </div>
              </div>


    </div>
</div>



     <div class="modal fade" id="TweetVerification" role="dialog" >
            <div class="modal-dialog">
                <!-- Modal content-->
                <div class="modal-content">
                    <div class="modal-header">
                    
                        <div class="col-md-12 text-center">
                                <div class="modal-title">
                                   
                                    <i class="fab fa-twitter-square fa-5x" style="color: #102B3F;"></i>
                                    <br>
                                    <br>
                                 
                                    <asp:Label ID="MessageLabel" runat="server" Style="color: #102B3F; font-family: 'Poppins', sans-serif; font-size: 1.6em; font-weight: bold;" Text="Do you want to send this Tweet?"></asp:Label>
                                </div>
                            </div>
                        
                    </div>
                    <div class="modal-body" style="background-color: #4F79A3;">
                        <div class="col-lg-12 col-sm-12 col-md-12 col-xs-12 text-center">
                            <div class="form-group">
                                <asp:Label ID="Tweet" runat="server" Style="color: white; font-family: 'Poppins', sans-serif; font-size: 1.9em; font-weight: bold;"></asp:Label>
                                
                            </div>
                         </div>
                    </div>
                    
                    <div class="modal-footer">
                        <div class="flex-center" style="text-align: center !important; margin: auto !important;">
                        <asp:Button ID="SendTweet" runat="server" Text="Send It!" OnClick="SendTweet_Click" Style="background-color: #102B3F; color: #fff; width: 100px; height: 60px;" CssClass="btn btn-circle" />
                        <button type="button" style="background-color: #102B3F; color: #fff; width: 100px; height: 60px;" Class="btn btn-circle"data-dismiss="modal">Close</button>
                         </div>
                        
                    </div>
                </div>
            </div>
    </div>




            <script type='text/javascript'>
                function openTweetVerification() {
                    $('[id*=TweetVerification]').modal('show');
                } 

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


    </form>



</asp:Content>

