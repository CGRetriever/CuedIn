<%@ Page Title="" Language="C#" MasterPageFile="~/SchoolMaster.master" AutoEventWireup="true" CodeFile="CommunityFeed.aspx.cs" Inherits="CommunityFeed" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <form id="form1" runat="server">

  <div class="form-row">
    <div class="col-md-5 mb-3">
    <asp:Label ID="NewsFeedLabel" runat="server" Text="Our Feed" Font-Bold="True"></asp:Label>

        <div class ="card text-center" style="width:20rem;">
               <asp:Image ID="BannerPicture" CssClass="card-img-top" runat="server" />
            <div class="card-header">
               <asp:Image ID="profilePicture" CssClass="img-fluid" runat="server" />
            </div>
            <div class="card-body ">
   
                <asp:Label ID="UserNameLabel" CssClass="card-text" runat="server"  Font-Bold="True"></asp:Label>
            
         </div>
        </div>
    </div>
    </div>
    <div class="col-md-5 mb-3">
    <asp:Label ID="CommunityFeedLabel" runat="server" Text="Community Feed" Font-Bold="True"></asp:Label>
    </div>

    <div class="col-sm-2 mb-3">
     <asp:Label ID="ContactsLabel" runat="server" Text="Contacts" Font-Bold="True"></asp:Label>

      </div>
    </div>




    </form>



</asp:Content>

