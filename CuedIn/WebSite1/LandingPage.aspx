<%@ Page Title="" Language="C#" MasterPageFile="~/SchoolMaster.master" AutoEventWireup="true" CodeFile="LandingPage.aspx.cs" Inherits="LandingPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="form-row col-12 container-fluid">
        <div class="card col-2" style="width: 18rem;">
            <div class="card-img-top">
            <asp:Image ID="Image1" runat="server" ImageUrl="~/img/jackbrowns.jpg" CssClass="img-fluid card-img-top" />
            <%--<img class="img-fluid card-img-top" src="img/jackbrowns.jpg" alt="CardImage" />--%>
                </div>
          <div class="card-body">
              <div class="card-text">
              <asp:Label ID="Label1" runat="server" CssClass="font-weight-bold" Text="Label"></asp:Label>
                  </div>
          </div>
       </div>

        <div class="col-1.8"></div>


        <div class="card col-2 card-img-top" style="width: 18rem;">
            <div class="card-img-top">
            <asp:Image ID="Image2" runat="server" ImageUrl="~/img/sentara.jpg" CssClass="img-fluid card-img" />
            <%--<img class="img-fluid card-img-top" src="img/sentara.jpg" alt="CardImage" />--%>
                </div>
          <div class="card-body">
              <div class="card-text">
            <asp:Label ID="Label2" runat="server" CssClass="font-weight-bold" Text="Label"></asp:Label>
                  </div>
          </div>
       </div>

        <div class="col-1.8"></div>

        <div class="card col-2" style="width: 18rem;">
            <asp:Image ID="Image3" runat="server" ImageUrl="~/img/foodlion.jpg" CssClass="img-fluid card-img" />
          <div class="card-body">
            <asp:Label ID="Label3" runat="server" CssClass="font-weight-bold" Text="Label"></asp:Label>
          </div>
       </div>

        <div class="col-1.8"></div>

        <div class="card col-2" style="width: 18rem;">
            <asp:Image ID="Image4" runat="server" ImageUrl="~/img/greenhummingbird.jpg" CssClass="img-fluid" />
          <div class="card-body">
            <asp:Label ID="Label4" runat="server" CssClass="font-weight-bold" Text="Label"></asp:Label>
          </div>
       </div>

        <div class="col-1.8"></div>

        <div class="card col-2" style="width: 18rem;">
            <asp:Image ID="Image5" runat="server" ImageUrl="~/img/eltoneye.jpg" CssClass="img-fluid test" />
          <div class="card-body">
            <asp:Label ID="Label5" runat="server" CssClass="font-weight-bold" Text="Label"></asp:Label>
          </div>
       </div>




    </div>



</asp:Content>

