<%@ Page Title="" Language="C#" MasterPageFile="~/SchoolMaster.master" AutoEventWireup="true" CodeFile="CommunityFeed.aspx.cs" Inherits="CommunityFeed" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <form id="form1" runat="server">

<div class="form-row">
     <div class ="form-group col-md-4">

        <div class ="card text-center" style="width:30rem;">
            <div class="card-header">
                    <asp:Label ID="NewsFeedLabel" runat="server" Text="Our Profile" Font-Bold="True"></asp:Label>

               <asp:Image ID="profilePicture" CssClass="img-fluid" runat="server" />
            </div>
            <div class="card-body ">
                <asp:Label ID="UserNameLabel" CssClass="card-text" runat="server"  Font-Bold="True"></asp:Label>
                <asp:TextBox id="TweetBox" rows="5" CssClass="form-control" TextMode="multiline" runat="server" BorderColor="Silver" ValidationGroup="Group1" Font-Size="Smaller" />
             
         

                <%--<asp:RequiredFieldValidator ID="RequiredFieldValidator1" CssClass ="invalid-feedback" runat="server" ControlToValidate="TweetBox" ErrorMessage="Must be filled out" ValidationGroup="Group1" ForeColor="Red"></asp:RequiredFieldValidator>--%>
            <div class="card-footer">
                <asp:LinkButton  ID="SendItButton" runat="server" OnCommand="TweetButtonClick"><i class="fas fa-paper-plane fa-3x"></i></asp:LinkButton>
            </div>
            </div>
        </div>
          <div class ="card text-center" style="width:30rem;">
                <div class="card-header">
                    <asp:Label ID="TweetStream" runat="server" Text="Tweets" Font-Bold="True"></asp:Label>
                </div>
                <div class="card-body">
                    <a class="twitter-timeline"  href="https://twitter.com/KyleKim09?ref_src=twsrc%5Etfw" data-width="400" data-height="400" >Tweets by KyleKim09</a> <script async src="https://platform.twitter.com/widgets.js" charset="utf-8"></script>
                </div>
              </div>
        </div>

         <div class ="form-group col-md-4">

        <div class ="card text-center" style="width:30rem;">
                <div class="card-header">
                    <asp:Label ID="Label1" runat="server" Text="Tweets" Font-Bold="True"></asp:Label>
                </div>
                <div class="card-body">
                    <a class="twitter-timeline"  href="https://twitter.com/KyleKim09?ref_src=twsrc%5Etfw" data-width="400" data-height="400" >Tweets by KyleKim09</a> <script async src="https://platform.twitter.com/widgets.js" charset="utf-8"></script>
                </div>
              </div>


    </div>

             <div class ="form-group col-md-4">

        <div class ="card text-center" style="width:25rem;">
                <div class="card-header">
                    <asp:Label ID="Label2" runat="server" Text="Tweets" Font-Bold="True"></asp:Label>
                </div>
                <div class="card-body">
                    <a class="twitter-timeline"  href="https://twitter.com/KyleKim09?ref_src=twsrc%5Etfw" data-width="400" data-height="400" >Tweets by KyleKim09</a> <script async src="https://platform.twitter.com/widgets.js" charset="utf-8"></script>
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
                        <asp:Button ID="SendTweet" runat="server" Text="Send It!" Style="background-color: #102B3F; color: #fff; width: 100px; height: 60px;" CssClass="btn btn-circle" />
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
            </script>


    </form>



</asp:Content>

