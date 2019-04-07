<%@ Page Title="" Language="C#" MasterPageFile="~/SchoolMaster.master" AutoEventWireup="true" CodeFile="CommunityFeed.aspx.cs" Inherits="CommunityFeed" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <form id="form1" runat="server">

<div class="container-fluid" >
  <div class="form-row">
    <div class="col-md-5 mb-3">
    <asp:Label ID="NewsFeedLabel" runat="server" Text="Our Feed" Font-Bold="True"></asp:Label>
        
        <div class ="container">
            <asp:Panel ID="ProfilePanel" runat="server">
                <asp:Image ID="ProfilePicture" runat="server" />
               
            </asp:Panel>
        </div>
    </div>
    <div class="col-md-5 mb-3">
    <asp:Label ID="CommunityFeedLabel" runat="server" Text="Community Feed" Font-Bold="True"></asp:Label>
    </div>

    <div class="col-sm-2 mb-3">
     <asp:Label ID="ContactsLabel" runat="server" Text="Contacts" Font-Bold="True"></asp:Label>

      </div>
    </div>
  </div> 



    </form>



</asp:Content>

