<%@ Page Title="" Language="C#" MasterPageFile="~/SchoolMaster.master" AutoEventWireup="true" CodeFile="ArchiveScholarships.aspx.cs" Inherits="ArchiveScholarships" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
        <div class="row">
        <div class="col-12 ">
            <p>Archived Scholarships</p>
        </div>
    </div>
    <form id="form1" runat="server">
        <%--Rejected Scholarships Gridview--%>
        <div class="form-row">
                        <asp:Button ID="btnTop0" runat="server" CssClass="btn  btn-sm popovers img-fluid" data-content="&lt;img src='img/AppDecMoreInfo.png' /&gt;" Style="margin-left: 90%; color: white;" data-html="true" data-placement="top" data-trigger="hover" Text="Icon Legend" BackColor="#006699" BorderColor="Black" />
        <div class="form-group col-md-6">
            <label class="form-control-lg font-weight-bold" for="ScholarshipOpportunity">Rejected Scholarships</label>

            <asp:SqlDataSource ID="ScholarshipOpportunity" runat="server" ConnectionString="<%$ ConnectionStrings:DBConnectionString %>" SelectCommand="SELECT Scholarship.ScholarshipID, Scholarship.ScholarshipName, Scholarship.ScholarshipDescription, Scholarship.ScholarshipMin, Scholarship.ScholarshipMax, Organization.OrganizationName, Organization.OrganizationDescription, Organization.ExternalLink FROM Scholarship INNER JOIN Organization ON Scholarship.OrganizationID = Organization.OrganizationEntityID where approved = 'N'"></asp:SqlDataSource>

            <div class="text-center rounded" style="background-color: #102B3F;width:auto;">
                    
                    
                    <asp:CheckBox ID="chkScholarshipMin" Style="color: white;" runat="server" Text="Scholarship Minimum" Checked="false" />
                    <asp:CheckBox ID="chkScholarshipMax" Style="color: white;" runat="server" Text="Scholarship Maximum" Checked="false" />
                    <asp:CheckBox ID="chkExternalLink2" Style="color: white;" runat="server" Text="Website" Checked="false" />
                    

                    <asp:Button ID="btnCheckGridView1" runat="server" Text="Apply" OnClick="btnCheckGridView1_Click" Style="background-color: white; color: #102B3F;" class="btn btn-circle" />
                </div>
                <br />

            <asp:GridView ID="rejScholarshipGridview" runat="server" CssClass="table table-hover table-striped table-dark" Style="border-collapse: collapse;" AutoGenerateColumns="False" DataKeyNames="ScholarshipID" DataSourceID="ScholarshipOpportunity" BackColor="#102B40" ForeColor="White">

                    <Columns>
                        <asp:BoundField DataField="ScholarshipID" InsertVisible="false" ReadOnly="true" />
                        <asp:BoundField DataField="ScholarshipName" HeaderText="Scholarship Name" InsertVisible="False" ReadOnly="True" />
                        <asp:BoundField DataField="OrganizationName" HeaderText="Organization Name" InsertVisible="False" ReadOnly="True" />

                        <asp:BoundField DataField="ScholarshipDescription" HeaderText="Scholarship Description" InsertVisible="False" ReadOnly="True" />
                        <asp:BoundField DataField="ScholarshipMin" HeaderText="Scholarship Minimum" InsertVisible="False" ReadOnly="True" DataFormatString="{0:C2}"/>
                        <asp:BoundField DataField="ScholarshipMax" HeaderText="Scholarship Maximum" InsertVisible="False" ReadOnly="True" DataFormatString="{0:C2}" />

                        <asp:TemplateField HeaderText="Website">
                            <ItemTemplate>
                                <asp:LinkButton ID="btnOrgLink" runat="server" href='<%#Eval("ExternalLink")%>' target="_blank"><i class="fas fa-external-link-alt"></i></asp:LinkButton>
                            </ItemTemplate>
                        </asp:TemplateField>


                    <asp:TemplateField ShowHeader="False">
                        <ItemTemplate>
                            <asp:LinkButton ID="btnScholarshipApprove" CssClass="btn btn-success btn-circle" Text="Approve" runat="server" CommandArgument='<%#Eval ("ScholarshipID") %>' OnCommand="btnScholarshipApprove_Click"><i class="fas fa-check"></i></asp:LinkButton>
                            <asp:LinkButton ID="btnScholarshipViewMore" CssClass="btn btn-warning btn-circle" Text="View More" runat="server" CommandArgument='<%#Eval ("ScholarshipID") %>' OnCommand="btnRejScholarshipViewMore_Click"><i class="fas fa-info"></i></asp:LinkButton>

                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
                <RowStyle CssClass="cursor-pointer" />
            </asp:GridView>
        </div>
            <%--Accepted Scholarships--%>
                    <div class="form-group col-md-6">
            <label class="form-control-lg font-weight-bold" for="ScholarshipOpportunity">Accepted Scholarships</label>

                        <div class="text-center rounded" style="background-color: #102B3F;width:auto;">

                    <asp:CheckBox ID="chkScholarshipMin1" Style="color: white;" runat="server" Text="Scholarship Minimum" Checked="false" />
                    <asp:CheckBox ID="chkScholarshipMax1" Style="color: white;" runat="server" Text="Scholarship Maximum" Checked="false" />
                    <asp:CheckBox ID="chkExternalLink1" Style="color: white;" runat="server" Text="Website" Checked="false" />
                    

                    <asp:Button ID="btnCheckGridView2" runat="server" Text="Apply" OnClick="btnCheckGridView2_Click" Style="background-color: white; color: #102B3F;" class="btn btn-circle" />
                </div>
                <br />

            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:DBConnectionString %>" SelectCommand="SELECT Scholarship.ScholarshipID, Scholarship.ScholarshipName, Scholarship.ScholarshipDescription, Scholarship.ScholarshipMin, Scholarship.ScholarshipMax, Organization.OrganizationName, Organization.OrganizationDescription, Organization.ExternalLink FROM Scholarship INNER JOIN Organization ON Scholarship.OrganizationID = Organization.OrganizationEntityID where approved = 'Y'"></asp:SqlDataSource>

            

            <asp:GridView ID="acceptScholarshipGridview" runat="server" CssClass="table table-hover table-striped table-dark" Style="border-collapse: collapse;" AutoGenerateColumns="False" DataKeyNames="ScholarshipID" DataSourceID="SqlDataSource1" BackColor="#102B40" ForeColor="White">

                    <Columns>
                        <asp:BoundField DataField="ScholarshipID" InsertVisible="false" ReadOnly="true" />
                        <asp:BoundField DataField="ScholarshipName" HeaderText="Scholarship Name" InsertVisible="False" ReadOnly="True" />
                        <asp:BoundField DataField="OrganizationName" HeaderText="Organization Name" InsertVisible="False" ReadOnly="True" />

                        <asp:BoundField DataField="ScholarshipDescription" HeaderText="Scholarship Description" InsertVisible="False" ReadOnly="True" />
                        <asp:BoundField DataField="ScholarshipMin" HeaderText="Scholarship Minimum" InsertVisible="False" ReadOnly="True" DataFormatString="{0:C2}"/>
                        <asp:BoundField DataField="ScholarshipMax" HeaderText="Scholarship Maximum" InsertVisible="False" ReadOnly="True" DataFormatString="{0:C2}" />

                        <asp:TemplateField HeaderText="Website">
                            <ItemTemplate>
                                <asp:LinkButton ID="btnOrgLink" runat="server" href='<%#Eval("ExternalLink")%>' target="_blank"><i class="fas fa-external-link-alt"></i></asp:LinkButton>
                            </ItemTemplate>
                        </asp:TemplateField>

                    <asp:TemplateField ShowHeader="False">
                        <ItemTemplate>
                            <asp:LinkButton ID="btnScholarshipReject" CssClass="btn btn-circle btn-danger" Text="Decline" runat="server" CommandArgument='<%#Eval ("ScholarshipID") %>' OnCommand="btnScholarshipReject_Click"><i class="fas fa-times"></i></asp:LinkButton>
                            <asp:LinkButton ID="btnScholarshipViewMore" CssClass="btn btn-warning btn-circle" Text="View More" runat="server" CommandArgument='<%#Eval ("ScholarshipID") %>' OnCommand="btnAccScholarshipViewMore_Click"><i class="fas fa-info"></i></asp:LinkButton>

                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
                <RowStyle CssClass="cursor-pointer" />
            </asp:GridView>
        </div>
            <script>
                //Initialize popover with jQuery
                $(document).ready(function () {
                    $('.popovers').popover();
                });
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
                                  <asp:Label ID="lblScholarApprove" runat="server" Style="color: white; font-family: 'Poppins', sans-serif; font-size: 2.1em; font-weight: bold;"></asp:Label>                                </div>
                                
                            <div class="col-lg-12 col-sm-12 col-md-12 col-xs-12 text-center">
                                    <asp:Label ID="lblScholarSubApprove" runat="server" Style="color: white; font-family: 'Poppins', sans-serif; font-size: 2.1em; font-weight: bold;"></asp:Label>
                                </div>
                        </div>
                            </div>
                        <div class="modal-footer">
                            <div class="flex-center" style="text-align: center !important; margin: auto !important;">
                                 <asp:HyperLink ID="AcceptSMaillink" NavigateUrl="~/OpportunityActDec.aspx" Style="background-color: #102B3F; color: #fff; width: 100px; height: 60px; text-align: center; display:table-cell;" CssClass="btn btn-circle" runat="server" Text="Message Organization"></asp:HyperLink>
                                </div>
                            <div class="row">
                                <div>
                                <asp:Button ID="acceptScholarshipButton" runat="server" Text="Approve" Style="background-color: #102B3F; color: #fff; width: 100px; height: 60px;" CssClass="btn btn-circle" OnClick="acceptScholarshipButton_Click" />
                                <asp:Label ID="Label9" runat="server" Text="&nbsp;&nbsp;" style="Color: #ffffff"></asp:Label>
                                <button type="button" style="background-color: #102B3F; color: #fff; width: 100px; height: 60px;" class="btn btn-circle" data-dismiss="modal">Close</button>
                                 <asp:Label ID="Label10" runat="server" Text="&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;" style="Color: #ffffff"></asp:Label>
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
                            <div class ="col-md-12 text-center">
                            <div class="modal-title">
                                <i class="fas fa-info-circle fa-4x progress-bar-animated rotateIn" style="color: #102B3F;"></i>
                                <br />
                                <br />
                                <%--<h5>More Information</h5>--%>
                                <asp:Label ID="Label2"  Style="color: #102B3F; font-family: 'Poppins', sans-serif; font-size: 1.4em; font-weight: bold" runat="server" ForeColor="Black" Text="More Information"></asp:Label>
                                <br />
                                <asp:Label ID="Label3"  Style="color: #102B3F; font-family: 'Poppins', sans-serif; font-size: 1.4em; font-weight: bold" runat="server" ForeColor="Black"></asp:Label>
                            </div>
                            </div>
                            
                        </div>
                        <div class="modal-body" style="background-color: #4F79A3;">
                            <div class="col-lg-12 col-sm-12 col-md-12 col-xs-12">
                                <div class="form-group">
                                    <asp:Label ID="lblSOrganizationName" Style="color: white; font-family: 'Poppins', sans-serif; font-size: 1.2em;"  runat="server" ForeColor="White"></asp:Label>
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
                        <div class="modal-body"  style="background-color: #4F79A3;">
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
                                 <asp:HyperLink ID="RejectSMaillink" NavigateUrl="~/OpportunityActDec.aspx" Style="background-color: #102B3F; color: #fff; width: 100px; height: 60px; text-align: center; display:table-cell;" CssClass="btn btn-circle" runat="server" Text="Message Organization"></asp:HyperLink>
                                </div>
                            <div class="row">
                                <div>
                            <asp:Button ID="rejectScholarshipButton" runat="server" Text="Decline" Style="background-color: #102B3F; color: #fff; width: 100px; height: 60px;" CssClass="btn btn-circle" OnClick="rejectScholarshipButton_Click" />
                            <asp:Label ID="Label5" runat="server" Text="&nbsp;&nbsp;" style="Color: #ffffff"></asp:Label>
                            <button type="button" style="background-color: #102B3F; color: #fff; width: 100px; height: 60px;" class="btn btn-circle" data-dismiss="modal">Close</button>
                            <asp:Label ID="Label6" runat="server" Text="&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;" style="Color: #ffffff"></asp:Label>
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
            </div>
            </form>
</asp:Content>

