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


        <%--View More Modal--%>
        <div class="modal fade" id="IconModal" role="dialog">
            <div class="modal-dialog">
                <!-- Modal content-->
                <div class="modal-content">
                    <div class="modal-header">
                        <div class="col-md-12 text-center">
                                <div class="modal-title">
                                    <i class="fas fa-check fa-4x progress-bar-animated rotateIn" style="color: #102B3F;"></i>
                                    <br>
                                    <br>
                                    <%--<h5>Are you sure you want to approve?</h5>--%>
                                    <asp:Label ID="Label6" runat="server" Style="color: #102B3F; font-family: 'Poppins', sans-serif; font-size: 1.6em; font-weight: bold;" Text="Are you sure you want to approve?"></asp:Label>
                                </div>
                            </div>
                        
                    </div>
                    <div class="modal-body" style="background-color: #4F79A3;">
                        <div class="col-lg-12 col-sm-12 col-md-12 col-xs-12 text-center">
                            <div class="form-group">
                                <asp:Label ID="StudentApproveLabel" runat="server" Style="color: white; font-family: 'Poppins', sans-serif; font-size: 2.1em; font-weight: bold;"></asp:Label>
                            <br />
                            
                               <asp:Label ID="StudentSubApproveLabel" runat="server" Style="color: white; font-family: 'Poppins', sans-serif; font-size: 2.1em; font-weight: bold;"></asp:Label>
                               <br />
                            
                               <asp:Label ID="Student2ndSubApproveLabel" runat="server" Style="color: white; font-family: 'Poppins', sans-serif; font-size: 2.1em; font-weight: bold;"></asp:Label>
                                
                            </div>
                            </div>
                            </div>
                    
                    <div class="modal-footer">
                        <div class="flex-center" style="text-align: center !important; margin: auto !important;">
                        <asp:Button ID="Button1" runat="server" Text="Approve" Style="background-color: #102B3F; color: #fff; width: 100px; height: 60px;" CssClass="btn btn-circle"/>
                        <button type="button" style="background-color: #102B3F; color: #fff; width: 100px; height: 60px;"  Class="btn btn-circle"data-dismiss="modal">Close</button>
                    </div>
                        </div>
                </div>
            </div>
    </div>
            <script type='text/javascript'>
                function openIconModal() {
                    $('[id*=IconModal]').modal('show');
                } 
            </script>


        </form>
</asp:Content>

