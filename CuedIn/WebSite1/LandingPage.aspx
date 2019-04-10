<%@ Page Title="" Language="C#" MasterPageFile="~/SchoolMaster.master" AutoEventWireup="true" CodeFile="LandingPage.aspx.cs" Inherits="LandingPage" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <form id="form1" runat="server">
    
    <div class="form-row col-12 container-fluid">
        <div class="card col-2" style="width: 18rem;">
            <div class="card-img-top">
            <asp:Image ID="Image1" runat="server" ImageUrl="~/img/jackbrowns.jpg" CssClass="img-fluid card-img-top" />
            <%--<img class="img-fluid card-img-top" src="img/jackbrowns.jpg" alt="CardImage" />--%>
                </div>
          <div class="card-body">
              <div class="card-text text-center">
              <asp:Label ID="Label1" runat="server" CssClass="font-weight-bold" Text="Label"></asp:Label>
                  <div>
                  <asp:LinkButton ID="Icon1" runat="server" CausesValidation="false" OnClick="Icon1_Click" CssClass="btn"><i class="fa fa-question-circle"></i></asp:LinkButton>
                      </div>
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
              <div class="card-text text-center">
            <asp:Label ID="Label2" runat="server" CssClass="font-weight-bold" Text="Label"></asp:Label>
                  <div>
                  <asp:LinkButton ID="Icon2" runat="server" CausesValidation="false" OnClick="Icon2_Click"><i class="fa fa-question-circle" aria-hidden="true"></i></asp:LinkButton>
                      </div>
                  </div>
          </div>
       </div>

        <div class="col-1.8"></div>

        <div class="card col-2" style="width: 18rem;">
            <asp:Image ID="Image3" runat="server" ImageUrl="~/img/foodlion.jpg" CssClass="img-fluid card-img" />
          <div class="card-body">
              <div class="card-text text-center">
            <asp:Label ID="Label3" runat="server" CssClass="font-weight-bold" Text="Label"></asp:Label>
                  <div>
                  <asp:LinkButton ID="Icon3" runat="server" CausesValidation="false" OnClick="Icon3_Click"><i class="fa fa-question-circle" aria-hidden="true"></i></asp:LinkButton>
                      </div>
                  </div>
          </div>
       </div>

        <div class="col-1.8"></div>

        <div class="card col-2" style="width: 18rem;">
            <asp:Image ID="Image4" runat="server" ImageUrl="~/img/greenhummingbird.jpg" CssClass="img-fluid" />
          <div class="card-body">
              <div class="card-text text-center">
            <asp:Label ID="Label4" runat="server" CssClass="font-weight-bold" Text="Label"></asp:Label>
                  <div>
                  <asp:LinkButton ID="Icon4" runat="server" CausesValidation="false" OnClick="Icon4_Click"><i class="fa fa-question-circle" aria-hidden="true"></i></asp:LinkButton>
                      </div>
                  </div>
          </div>
       </div>

        <div class="col-1.8"></div>

        <div class="card col-2" style="width: 18rem;">
            <asp:Image ID="Image5" runat="server" ImageUrl="~/img/eltoneye.jpg" CssClass="img-fluid test" />
          <div class="card-body">
              <div class="card-text text-center">
            <asp:Label ID="Label5" runat="server" CssClass="font-weight-bold" Text="Label"></asp:Label>
                  <div>
                  <asp:LinkButton ID="Icon5" runat="server" CausesValidation="false" OnClick="Icon5_Click" CssClass="align-content-center"><i class="fa fa-question-circle" aria-hidden="true"></i></asp:LinkButton>
                      </div>
                  </div>
          </div>
       </div>




    </div>


        </form>
</asp:Content>

