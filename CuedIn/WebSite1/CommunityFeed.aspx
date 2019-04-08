<%@ Page Title="" Language="C#" MasterPageFile="~/SchoolMaster.master" AutoEventWireup="true" CodeFile="CommunityFeed.aspx.cs" Inherits="CommunityFeed" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <form id="form1" runat="server">

 
    <div class="card-columns">

        <div class ="card text-center" style="width:20rem;">
            <div class="card-header">
                    <asp:Label ID="NewsFeedLabel" runat="server" Text="Our Feed" Font-Bold="True"></asp:Label>

               <asp:Image ID="profilePicture" CssClass="img-fluid" runat="server" />
            </div>
            <div class="card-body ">
                <asp:Label ID="UserNameLabel" CssClass="card-text" runat="server"  Font-Bold="True"></asp:Label>
                <asp:TextBox id="TweetBox" rows="5" CssClass="form-control" TextMode="multiline" runat="server" BorderColor="Silver" Font-Size="Smaller" />

            <div class="card-footer">
                <asp:LinkButton ID="LinkButton1" runat="server"><i class="fas fa-paper-plane fa-3x"></i></asp:LinkButton>
            </div>
            </div>
        </div>
          <div class ="card text-center" style="width:20rem;">
                <div class="card-header">
                    <asp:Label ID="TweetStream" runat="server" Text="Tweets" Font-Bold="True"></asp:Label>
                </div>
                <div class="card-body">

                </div>

        </div>
    </div>
   





    </form>



</asp:Content>

