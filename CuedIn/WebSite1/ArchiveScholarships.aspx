<%@ Page Title="" Language="C#" MasterPageFile="~/SchoolMaster.master" AutoEventWireup="true" CodeFile="ArchiveScholarships.aspx.cs" Inherits="ArchiveScholarships" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="row">
        <div class="col-12 ">
            <p>Archived Scholarships</p>
        </div>
    </div>

    


                 <!--- Breadcrumb --->

    <ol class="breadcrumb arr-bread">
 
    <li><a href="LandingPage.aspx">Home</a></li>
    <li><a href="OpportunityActDec.aspx">Manage Opportunities</a></li>
    <li><a href="ArchiveOpportunities.aspx">Archived Jobs</a></li>
                               
 
    <li class="active"><span>Archived Scholarships</span></li>       
 
                </ol>

     <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>

<!--- END Breadcrumb --->

    <div class=container-fluid>
        <%--Rejected Scholarships Gridview--%>
        <div class="row">


            <button onclick="topFunction()" id="myBtn"><i class="fas fa-angle-double-up"></i></button>
            <asp:Button ID="btnTop0" runat="server" CssClass="btn  btn-sm popovers img-fluid" data-content="&lt;img src='img/AppDecMoreInfo.png' /&gt;" Style="margin-left: 90%; color: white;" data-html="true" data-placement="top" data-trigger="hover" Text="Icon Legend" BackColor="#006699" BorderColor="Black" />
            </div>

<div class="row">
            <div class="form-group col-md-6">
                <div class="text-center">
                <label class="form-control-lg font-weight-bold" for="ScholarshipOpportunity">Rejected Scholarships</label>
                </div>


                <div class="col-auto text-center" style="background-color: #102B3F; padding: 10px;">
                    <%--<asp:Label ID="lblSearch" runat="server" Text="Search" Style="color: #fff; text-align: center; /*font-weight: bold; */ letter-spacing: 6px; font-size: 1.2em; margin: .67em"></asp:Label>
                    <asp:TextBox ID="SearchBox1" runat="server"></asp:TextBox>
                    <asp:LinkButton ID="SearchButton1" runat="server" Text="Search" OnClick="SearchButton1_Click" Style="color:white;"><i class="fas fa-search"></i></asp:LinkButton>

                    <br />--%>

                    <asp:CheckBox runat="server" Style="color: white;" OnCheckedChanged="cbSelectAll_Checked" AutoPostBack="true" ID="cbSelectAll" Text="Select All" CssClass=".JchkAll"/>
                    <asp:CheckBox ID="chkScholarshipMin" Style="color: white;" runat="server" Text="Scholarship Minimum" Checked="false" CssClass=".JchkGrid" />
                    <asp:CheckBox ID="chkScholarshipMax" Style="color: white;" runat="server" Text="Scholarship Maximum" Checked="false" CssClass=".JchkGrid" />
                    
                    <asp:Button ID="btnCheckGridView1" runat="server" Text="Apply" OnClick="btnCheckGridView1_Click" Style="background-color: white; color: #102B3F;" class="btn btn-circle" />
                </div>

                <div style="height:5px;font-size:10px;">&nbsp;</div>
               
                <asp:SqlDataSource ID="ScholarshipOpportunity" runat="server" ConnectionString="<%$ ConnectionStrings:DBConnectionString %>" SelectCommand="SELECT Scholarship.ScholarshipID,Scholarship.ScholarshipName, Scholarship.ScholarshipDescription, Scholarship.ScholarshipMin, Scholarship.ScholarshipMax, Organization.OrganizationName, Organization.OrganizationDescription, 
                         Organization.ExternalLink
                         FROM OpportunityEntity INNER JOIN
                         Scholarship ON OpportunityEntity.OpportunityEntityID = Scholarship.ScholarshipID INNER JOIN
                         SchoolApproval ON OpportunityEntity.OpportunityEntityID = SchoolApproval.OpportunityEntityID INNER JOIN
                         School ON SchoolApproval.SchoolEntityID = School.SchoolEntityID INNER JOIN
                         Organization ON Scholarship.OrganizationID = Organization.OrganizationEntityID
						 where school.SchoolEntityID  = @schoolID and SchoolApproval.ApprovedFlag = 'N'">

                        <SelectParameters>
                          <asp:SessionParameter Name="schoolID" SessionField="schoolID"
                           DefaultValue="12" />

                        </SelectParameters>


                </asp:SqlDataSource>
                <div class="table-responsive">
                <asp:GridView ID="rejScholarshipGridview" runat="server" CssClass="table table-hover table-striped table-dark" AutoGenerateColumns="False" DataKeyNames="ScholarshipID" DataSourceID="ScholarshipOpportunity" BackColor="#102B40" ForeColor="White">

                    <Columns>
                        <asp:BoundField DataField="ScholarshipID" InsertVisible="false" ReadOnly="true" Visible="false" />
                        <asp:BoundField DataField="ScholarshipName" HeaderText="Scholarship Name" InsertVisible="False" ReadOnly="True" />
                        <asp:BoundField DataField="OrganizationName" HeaderText="Organization Name" InsertVisible="False" ReadOnly="True" />

                        <asp:BoundField DataField="ScholarshipDescription" HeaderText="Scholarship Description" InsertVisible="False" ReadOnly="True" Visible="false" />
                        <asp:BoundField DataField="ScholarshipMin" HeaderText="Scholarship Minimum" InsertVisible="False" ReadOnly="True" DataFormatString="{0:C2}" Visible="false" />
                        <asp:BoundField DataField="ScholarshipMax" HeaderText="Scholarship Maximum" InsertVisible="False" ReadOnly="True" DataFormatString="{0:C2}" Visible="false" />




                        <asp:TemplateField ShowHeader="False" HeaderText="Actions">
                            <ItemTemplate>
                                <asp:LinkButton ID="btnScholarshipApprove" CssClass="btn btn-success btn-circle btn-block" Text="Approve" runat="server" CommandArgument='<%#Eval ("ScholarshipID") %>' OnCommand="btnScholarshipApprove_Click"><i class="fas fa-check"></i></asp:LinkButton>
                                <asp:LinkButton ID="btnScholarshipViewMore" CssClass="btn btn-warning btn-circle btn-block" Text="View More" runat="server" CommandArgument='<%#Eval ("ScholarshipID") %>' OnCommand="btnRejScholarshipViewMore_Click"><i class="fas fa-info"></i></asp:LinkButton>

                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                    <RowStyle CssClass="cursor-pointer" />
                </asp:GridView>
                    </div>
            </div>
            <%--Accepted Scholarships--%>
            <div class="form-group col-md-6">
             
                    <label class="form-control-lg font-weight-bold" for="ScholarshipOpportunity">Accepted Scholarships</label>

                    <div class="col-auto text-center" style="background-color: #102B3F; width: auto; padding: 10px;">
                        <%--<asp:Label ID="lblSearch2" runat="server" Text="Search" Style="color: #fff; text-align: center; /*font-weight: bold; */ letter-spacing: 6px; font-size: 1.2em; margin: .67em"></asp:Label>
                        <asp:TextBox ID="SearchBox2" runat="server"></asp:TextBox>
                        <asp:LinkButton ID="SearchButton2" runat="server" Text="Search" OnClick="SearchButton2_Click" Style="color:white;"><i class="fas fa-search"></i></asp:LinkButton>

                        <br />--%>
                        <asp:CheckBox runat="server" Style="color: white;" OnCheckedChanged="cbSelectAll2_Checked" AutoPostBack="true" ID="cbSelectAll2" Text="Select All" CssClass=".JchkAll1"/>
                        <asp:CheckBox ID="chkScholarshipMin1" Style="color: white;" runat="server" Text="Scholarship Minimum" Checked="false" CssClass=".JchkGrid1" />
                        <asp:CheckBox ID="chkScholarshipMax1" Style="color: white;" runat="server" Text="Scholarship Maximum" Checked="false" CssClass=".JchkGrid1" />
                        


                        <asp:Button ID="btnCheckGridView2" runat="server" Text="Apply" OnClick="btnCheckGridView2_Click" Style="background-color: white; color: #102B3F;" class="btn btn-circle" />
                    </div>

                    <div style="height:5px;font-size:10px;">&nbsp;</div>
                    

                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:DBConnectionString %>" SelectCommand="SELECT Scholarship.ScholarshipID, Scholarship.ScholarshipName, Scholarship.ScholarshipDescription, Scholarship.ScholarshipMin, Scholarship.ScholarshipMax, Organization.OrganizationName, Organization.OrganizationDescription, 
                         Organization.ExternalLink
FROM OpportunityEntity INNER JOIN
                         Scholarship ON OpportunityEntity.OpportunityEntityID = Scholarship.ScholarshipID INNER JOIN
                         SchoolApproval ON OpportunityEntity.OpportunityEntityID = SchoolApproval.OpportunityEntityID INNER JOIN
                         School ON SchoolApproval.SchoolEntityID = School.SchoolEntityID INNER JOIN
                         Organization ON Scholarship.OrganizationID = Organization.OrganizationEntityID
						 where school.SchoolEntityID  = @schoolID and SchoolApproval.ApprovedFlag = 'Y'">
                         <SelectParameters>
                          <asp:SessionParameter Name="schoolID" SessionField="schoolID"
                           DefaultValue="12" />

                            </SelectParameters>
                    </asp:SqlDataSource>

                <div class="table-responsive">
                    <asp:GridView ID="acceptScholarshipGridview" runat="server" CssClass="table table-hover table-striped table-dark"  AutoGenerateColumns="False" DataKeyNames="ScholarshipID" DataSourceID="SqlDataSource1" BackColor="#102B40" ForeColor="White">

                        <Columns>
                            <asp:BoundField DataField="ScholarshipID" InsertVisible="false" ReadOnly="true" Visible="false"/>
                            <asp:BoundField DataField="ScholarshipName" HeaderText="Scholarship Name" InsertVisible="False" ReadOnly="True" />
                            <asp:BoundField DataField="OrganizationName" HeaderText="Organization Name" InsertVisible="False" ReadOnly="True" />

                            <asp:BoundField DataField="ScholarshipDescription" HeaderText="Scholarship Description" InsertVisible="False" ReadOnly="True" Visible="false"/>
                            <asp:BoundField DataField="ScholarshipMin" HeaderText="Scholarship Minimum" InsertVisible="False" ReadOnly="True" DataFormatString="{0:C2}" Visible="false" />
                            <asp:BoundField DataField="ScholarshipMax" HeaderText="Scholarship Maximum" InsertVisible="False" ReadOnly="True" DataFormatString="{0:C2}" Visible="false" />



                            <asp:TemplateField ShowHeader="False" HeaderText="Actions">
                                <ItemTemplate>
                                    <asp:LinkButton ID="btnScholarshipReject" CssClass="btn btn-circle btn-danger btn-block" Text="Decline" runat="server" CommandArgument='<%#Eval ("ScholarshipID") %>' OnCommand="btnScholarshipReject_Click"><i class="fas fa-times"></i></asp:LinkButton>
                                    <asp:LinkButton ID="btnScholarshipViewMore" CssClass="btn btn-warning btn-circle btn-block" Text="View More" runat="server" CommandArgument='<%#Eval ("ScholarshipID") %>' OnCommand="btnAccScholarshipViewMore_Click"><i class="fas fa-info"></i></asp:LinkButton>

                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                        <RowStyle CssClass="cursor-pointer" />
                    </asp:GridView>
                    </div>
               
            </div>
            </div> 
            <script>
                //Initialize popover with jQuery
                $(document).ready(function () {
                    $('.popovers').popover();
                });
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

                                            function Selectall() {
              if ($('.JchkAll').is(':checked')) {
               // .JchkGrid cssClass will be assigned to all other checkboxes in your control
                $('.JchkGrid').attr('checked', 'true');
              }
              else {
                $('.JchkGrid').removeAttr('checked', 'false');
              }
                }

                                       function Selectall() {
              if ($('.JchkAll1').is(':checked')) {
               // .JchkGrid cssClass will be assigned to all other checkboxes in your control
                $('.JchkGrid1').attr('checked', 'true');
              }
              else {
                $('.JchkGrid1').removeAttr('checked', 'false');
              }
            }


            </script>
        </div>
        <div>
            <%--Scholarship Approve Modal--%>
            <div class="modal fade" id="approveSModal" role="dialog">
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
                                    <asp:Label ID="Label4" runat="server" Style="color: #102B3F; font-family: 'Poppins', sans-serif; font-size: 1.6em; font-weight: bold;" Text="Are you sure you want to approve?"></asp:Label>
                                </div>
                            </div>
                        </div>
                        <div class="modal-body" style="background-color: #4F79A3;">
                            <div class="col-lg-12 col-sm-12 col-md-12 col-xs-12 text-center">
                                <div class="form-group">
                                    <asp:Label ID="lblScholarApprove" runat="server" Style="color: white; font-family: 'Poppins', sans-serif; font-size: 2.1em; font-weight: bold;"></asp:Label>
                                </div>

                                <div class="col-lg-12 col-sm-12 col-md-12 col-xs-12 text-center">
                                    <asp:Label ID="lblScholarSubApprove" runat="server" Style="color: white; font-family: 'Poppins', sans-serif; font-size: 2.1em; font-weight: bold;"></asp:Label>
                                </div>
                            </div>
                        </div>
                        <div class="modal-footer">
                            <div class="flex-center" style="text-align: center !important; margin: auto !important;">
                                <asp:HyperLink ID="AcceptSMaillink" NavigateUrl="~/OpportunityActDec.aspx" Style="background-color: #102B3F; color: #fff; width: 100px; height: 60px; text-align: center; display: table-cell;" CssClass="btn btn-circle" runat="server" Text="Message Organization"></asp:HyperLink>
                            </div>
                            <div class="row">
                                <div>
                                    <asp:Button ID="acceptScholarshipButton" runat="server" Text="Approve" Style="background-color: #102B3F; color: #fff; width: 100px; height: 60px;" CssClass="btn btn-circle" OnClick="acceptScholarshipButton_Click" />
                                    <asp:Label ID="Label9" runat="server" Text="&nbsp;&nbsp;" Style="color: #ffffff"></asp:Label>
                                    <button type="button" style="background-color: #102B3F; color: #fff; width: 100px; height: 60px;" class="btn btn-circle" data-dismiss="modal">Close</button>
                                    <asp:Label ID="Label10" runat="server" Text="&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;" Style="color: #ffffff"></asp:Label>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <script type='text/javascript'>
                    function openApproveSModal() {
                        $('[id*=approveSModal]').modal('show');
                    }
                </script>
            </div>
        </div>
        <div>
            <%-- Scholarship More Info Modal--%>
            <div class="modal fade" id="jobMoreInfoModal" role="dialog">
                <div class="modal-dialog">
                    <!-- Modal content-->
                    <div class="modal-content">
                        <div class="modal-header">
                            <div class="col-md-12 text-center">
                                <div class="modal-title">
                                    <i class="fas fa-info-circle fa-4x progress-bar-animated rotateIn" style="color: #102B3F;"></i>
                                    <br />
                                    <br />
                                    <%--<h5>More Information</h5>--%>
                                    <asp:Label ID="Label2" Style="color: #102B3F; font-family: 'Poppins', sans-serif; font-size: 1.4em; font-weight: bold" runat="server" ForeColor="Black" Text="More Information"></asp:Label>
                                    <br />
                                    <asp:Label ID="Label3" Style="color: #102B3F; font-family: 'Poppins', sans-serif; font-size: 1.4em; font-weight: bold" runat="server" ForeColor="Black"></asp:Label>
                                </div>
                            </div>

                        </div>
                        <div class="modal-body" style="background-color: #4F79A3;">
                            <div class="col-lg-12 col-sm-12 col-md-12 col-xs-12">
                                <div class="form-group">
                                    <asp:Label ID="lblSOrganizationName" Style="color: white; font-family: 'Poppins', sans-serif; font-size: 1.2em;" runat="server" ForeColor="White"></asp:Label>
                                    <br />
                                    <asp:Label ID="lblSOrganizationDescription" Style="color: white; font-family: 'Poppins', sans-serif; font-size: 1.2em;" runat="server" ForeColor="White"></asp:Label>
                                    <br />
                                    <asp:Label ID="lblScholarshipDescription" Style="color: white; font-family: 'Poppins', sans-serif; font-size: 1.2em;" runat="server" ForeColor="White"></asp:Label>
                                    <br />
                                    <asp:Label ID="lblScholarshipMin" Style="color: white; font-family: 'Poppins', sans-serif; font-size: 1.2em;" runat="server" ForeColor="White"></asp:Label>
                                    <br />
                                    <asp:Label ID="lblScholarshipMax" Style="color: white; font-family: 'Poppins', sans-serif; font-size: 1.2em;" runat="server" ForeColor="White"></asp:Label>
                                    <br />
                                    <asp:Label ID="lblScholarshipQuantity" Style="color: white; font-family: 'Poppins', sans-serif; font-size: 1.2em;" runat="server" ForeColor="White"></asp:Label>
                                    <br />
                                    <asp:Label ID="lblScholarshipDueDate" Style="color: white; font-family: 'Poppins', sans-serif; font-size: 1.2em;" runat="server" ForeColor="White"></asp:Label>
                                    <br />

                                </div>
                            </div>
                        </div>
                        <div class="modal-footer">
                            <div class="flex-center" style="text-align: center !important; margin: auto !important;">
                                <button type="button" style="background-color: #102B3F; color: #fff; width: 100px; height: 60px;" class="btn btn-circle" data-dismiss="modal">Close</button>
                            </div>
                        </div>
                    </div>
                </div>
                <script type='text/javascript'>
                    function openEditJModal() {
                        $('[id*=jobMoreInfoModal]').modal('show');
                    }
                </script>
            </div>

            <%--Scholarship Reject Modal--%>
            <div class="modal fade" id="rejectSModal" role="dialog">
                <div class="modal-dialog">
                    <!-- Modal content-->
                    <div class="modal-content">
                        <div class="modal-header">
                            <div class="col-md-12 text-center">
                                <div class="modal-title">
                                    <i class="fas fa-times fa-4x progress-bar-animated rotateIn" style="color: #102B3F;"></i>
                                    <br>
                                    <br>
                                    <%--<h5>Are you sure you want to reject?</h5>--%>
                                    <asp:Label ID="Label1" runat="server" Style="color: #102B3F; font-family: 'Poppins', sans-serif; font-size: 1.6em; font-weight: bold;" Text="Are you sure you want to decline?"></asp:Label>
                                </div>
                            </div>

                        </div>
                        <div class="modal-body" style="background-color: #4F79A3;">
                            <div class="col-lg-12 col-sm-12 col-md-12 col-xs-12 text-center">
                                <div class="form-group">
                                    <asp:Label ID="scholarRejectLabel" runat="server" Style="color: white; font-family: 'Poppins', sans-serif; font-size: 2.1em; font-weight: bold;"></asp:Label>
                                </div>
                                <div class="col-lg-12 col-sm-12 col-md-12 col-xs-12 text-center">
                                    <asp:Label ID="scholarsubRejectLabel" runat="server" Style="color: white; font-family: 'Poppins', sans-serif; font-size: 2.1em; font-weight: bold;"></asp:Label>
                                </div>
                            </div>
                        </div>

                        <div class="modal-footer">
                            <div class="flex-center" style="text-align: center !important; margin: auto !important;">
                                <asp:HyperLink ID="RejectSMaillink" NavigateUrl="~/OpportunityActDec.aspx" Style="background-color: #102B3F; color: #fff; width: 100px; height: 60px; text-align: center; display: table-cell;" CssClass="btn btn-circle" runat="server" Text="Message Organization"></asp:HyperLink>
                            </div>
                            <div class="row">
                                <div>
                                    <asp:Button ID="rejectScholarshipButton" runat="server" Text="Decline" Style="background-color: #102B3F; color: #fff; width: 100px; height: 60px;" CssClass="btn btn-circle" OnClick="rejectScholarshipButton_Click" />
                                    <asp:Label ID="Label5" runat="server" Text="&nbsp;&nbsp;" Style="color: #ffffff"></asp:Label>
                                    <button type="button" style="background-color: #102B3F; color: #fff; width: 100px; height: 60px;" class="btn btn-circle" data-dismiss="modal">Close</button>
                                    <asp:Label ID="Label6" runat="server" Text="&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;" Style="color: #ffffff"></asp:Label>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

        </div>
        <script type='text/javascript'>
            function openRejectSModal() {
                $('[id*=rejectSModal]').modal('show');
            }
        </script>
        
  

</asp:Content>

