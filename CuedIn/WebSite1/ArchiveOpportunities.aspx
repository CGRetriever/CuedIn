<%@ Page Title="" Language="C#" MasterPageFile="~/SchoolMaster.master" AutoEventWireup="true" CodeFile="ArchiveOpportunities.aspx.cs" Inherits="ArchiveOpportunities" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="row">
        <div class="col-12 ">
            
        </div>
    </div>
    <form id="form1" runat="server">
        <%--Rejected Jobs Gridview--%>
            <div class="form-row">
            <div class="form-group col-md-6">
                <label class="form-control-lg font-weight-bold" for="inputJobs">Rejected Jobs </label>
                <div class="form-row container-fluid">
         <div class="col-auto container-fluid text-center">
           <div class="col-auto text-center rounded" style="background-color:#102B3F;">
           <asp:Label ID="Label17" runat="server" Text="Search" Style="color: #fff; text-align:center; /*font-weight: bold;*/ letter-spacing: 6px; font-size: 1.2em; margin: .67em"></asp:Label>
           <asp:TextBox ID="SearchBox1" runat="server"></asp:TextBox>
           <asp:Button ID="SearchButton1" runat="server" Text="Search" OnClick="SearchButton1_Click" CssClass="btn" />
           </div>


                <asp:GridView ID="gridviewRejJobs" runat="server" CssClass="table table-hover table-striped table-dark" Style="border-collapse: collapse;" AutoGenerateColumns="False" DataKeyNames="JobListingID" DataSourceID="SQLDataSource1" CellPadding="1" BackColor="#102B40" ForeColor="White">
                    <Columns>

                        <asp:BoundField DataField="JobTitle" HeaderText="JobTitle" SortExpression="JobTitle" />
                        <asp:BoundField DataField="OrganizationName" HeaderText="OrganizationName" SortExpression="OrganizationName" />
                        <asp:BoundField DataField="JobListingID" HeaderText="JobListingID" ReadOnly="True" SortExpression="JobListingID" />
                                            <asp:TemplateField ShowHeader="False">
                        <ItemTemplate>
                            <asp:LinkButton ID="btnJobApprove" CssClass="btn btn-success btn-circle" Text="Approve" runat="server" CommandArgument='<%#Eval ("JobListingID") %>' OnCommand="approveJobLinkBtn_Click"><i class="fas fa-check"></i></asp:LinkButton>
                            <asp:LinkButton ID="btnJobViewMore" CssClass="btn btn-warning btn-circle" Text="View More" runat="server" CommandArgument='<%#Eval ("JobListingID") %>' OnCommand="moreInfoRejJobLinkBtn_Click"><i class="fas fa-info"></i></asp:LinkButton>
                        </ItemTemplate>
                    </asp:TemplateField>
                    </Columns>
                    <RowStyle CssClass="cursor-pointer" />
                </asp:GridView>

                <asp:SqlDataSource ID="SQLDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:DBConnectionString %>" SelectCommand="SELECT JobListing.JobTitle, Organization.OrganizationName, JobListing.JobListingID FROM JobListing INNER JOIN Organization ON JobListing.OrganizationID = Organization.OrganizationEntityID where joblisting.approved = 'N'"></asp:SqlDataSource>
             </div>
                    </div>
                


            </div>
        <%--Accepted Jobs Gridview--%>
        
            <div class="form-group col-md-6">
                <label class="form-control-lg font-weight-bold" for="inputJobs">Accepted Jobs </label>
                <div class="form-row container-fluid">
         <div class="col-auto container-fluid text-center">
           <div class="col-auto text-center rounded" style="background-color:#102B3F;">
           <asp:Label ID="Label3" runat="server" Text="Search" Style="color: #fff; text-align:center; /*font-weight: bold;*/ letter-spacing: 6px; font-size: 1.2em; margin: .67em"></asp:Label>
           <asp:TextBox ID="SearchBox2" runat="server"></asp:TextBox>
           <asp:Button ID="SearchButton2" runat="server" Text="Search" OnClick="SearchButton2_Click" CssClass="btn" />
           </div>


                <asp:GridView ID="gridviewAccJobs" runat="server" CssClass="table table-hover table-striped table-dark" Style="border-collapse: collapse;" AutoGenerateColumns="False" DataKeyNames="JobListingID" DataSourceID="JobOpportunity" CellPadding="1" BackColor="#102B40" ForeColor="White">
                    <Columns>

                        <asp:BoundField DataField="JobTitle" HeaderText="JobTitle" SortExpression="JobTitle" />
                        <asp:BoundField DataField="OrganizationName" HeaderText="OrganizationName" SortExpression="OrganizationName" />
                        <asp:BoundField DataField="JobListingID" HeaderText="JobListingID" ReadOnly="True" SortExpression="JobListingID" />
                                            <asp:TemplateField ShowHeader="False">
                        <ItemTemplate>
                            <asp:LinkButton ID="btnJobReject" CssClass="btn btn-circle btn-danger" Text="Decline" runat="server" CommandArgument='<%#Eval ("JobListingID") %>' OnCommand="rejectJobLinkBtn_Click"><i class="fas fa-times"></i></asp:LinkButton>
                            <asp:LinkButton ID="btnJobViewMore" CssClass="btn btn-warning btn-circle" Text="View More" runat="server" CommandArgument='<%#Eval ("JobListingID") %>' OnCommand="moreInfoAccJobLinkBtn_Click"><i class="fas fa-info"></i></asp:LinkButton>
                        </ItemTemplate>
                    </asp:TemplateField>
                    </Columns>
                    <RowStyle CssClass="cursor-pointer" />
                </asp:GridView>
                <asp:SqlDataSource ID="JobOpportunity" runat="server" ConnectionString="<%$ ConnectionStrings:DBConnectionString %>" SelectCommand="SELECT JobListing.JobTitle, Organization.OrganizationName, JobListing.JobListingID FROM JobListing INNER JOIN Organization ON JobListing.OrganizationID = Organization.OrganizationEntityID where joblisting.approved = 'Y'"></asp:SqlDataSource>


            </div>
                </div>
        

 

            <%--Job Approve Modal--%>
            <div class="modal fade" id="approveXModal" role="dialog">
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
                                 <asp:Label ID="lblJobApprove" runat="server" Style="color: white; font-family: 'Poppins', sans-serif; font-size: 2.1em; font-weight: bold;"></asp:Label>
                                </div>
                                <div class="col-lg-12 col-sm-12 col-md-12 col-xs-12 text-center">
                                    <asp:Label ID="lblJobSubApprove" runat="server" Style="color: white; font-family: 'Poppins', sans-serif; font-size: 2.1em; font-weight: bold;"></asp:Label>
                                </div>
                            </div>
                        </div>
                        <div class="modal-footer">
                            <div class="flex-center" style="text-align: center !important; margin: auto !important;">
                             <asp:HyperLink ID="MailButtonLink" NavigateUrl="~/OpportunityActDec.aspx" Style="background-color: #102B3F; color: #fff; width: 100px; height: 60px; text-align: center; display:table-cell;" CssClass="btn btn-circle" runat="server" Text="Message Organization"></asp:HyperLink>
                                </div>
                            <div class="row">
                                <div>
                                <asp:Button ID="Button1" runat="server" Text="Approve" Style="background-color: #102B3F; color: #fff; width: 100px; height: 60px;" CssClass="btn btn-circle" OnClick="acceptJobButton_Click" />
                                <asp:Label ID="Label9" runat="server" Text="&nbsp;&nbsp;" style="Color: #ffffff"></asp:Label>
                                <button type="button" style="background-color: #102B3F; color: #fff; width: 100px; height: 60px;" class="btn btn-circle" data-dismiss="modal">Close</button>
                                <asp:Label ID="Label10" runat="server" Text="&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;" style="Color: #ffffff"></asp:Label>
                                </div>
                                </div>
                        </div>
                    </div>
                </div>
                <script type='text/javascript'>
                    function openApproveXModal() {
                        $('[id*=approveXModal]').modal('show');
                    }
                </script>
            </div>
        </div>
        <div>
            <%-- Job More Info Modal--%>
            <div class="modal fade" id="myModal" role="dialog">
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
                                <asp:Label ID="Label1" Style="color: #102B3F; font-family: 'Poppins', sans-serif; font-size: 1.4em; font-weight: bold" runat="server" Text="More Information"></asp:Label>
                                <br />
                                <asp:Label ID="lblJobName" Style="color: #102B3F; font-family: 'Poppins', sans-serif; font-size: 1.4em; font-weight: bold" runat="server"></asp:Label>
                            </div>
                            </div>
                            
                        </div>
                        <div class="modal-body" style="background-color: #4F79A3;">
                            <div class="col-lg-12 col-sm-12 col-md-12 col-xs-12 text-left">
                                <div class="form-group">
                                    <%--<asp:Label ID="Label2"  Style="color: white; font-family: 'Poppins', sans-serif; font-size: 1.2em;" Text="Testing Jaunt"  runat="server"></asp:Label>
                                    <br />--%>
                                    <asp:Label ID="lblJOrganizationName" Style="color: white; font-family: 'Poppins', sans-serif; font-size: 1.2em;" runat="server" ForeColor="White"></asp:Label>
                                    <br />
                                    <asp:Label ID="lblJOrganizationDescription" Style="color: white; font-family: 'Poppins', sans-serif; font-size: 1.2em;" runat="server" ForeColor="White"></asp:Label>
                                    <br />
                                    <asp:Label ID="lblJobType" runat="server" Style="color: white; font-family: 'Poppins', sans-serif; font-size: 1.2em;" ForeColor="White"></asp:Label>
                                    <br />
                                    <asp:Label ID="lblJobDescription" Style="color: white; font-family: 'Poppins', sans-serif; font-size: 1.2em;" runat="server" ForeColor="White"></asp:Label>
                                    <br />
                                    <asp:Label ID="lblJobLocation" Style="color: white; font-family: 'Poppins', sans-serif; font-size: 1.2em;" runat="server" ForeColor="White"></asp:Label>
                                    <br />
                                    <asp:Label ID="lblNumOfApplicants" Style="color: white; font-family: 'Poppins', sans-serif; font-size: 1.2em;" runat="server" ForeColor="White"></asp:Label>
                                    <br />
                                    <asp:Label ID="lblJobDeadline" Style="color: white; font-family: 'Poppins', sans-serif; font-size: 1.2em;" runat="server" ForeColor="White"></asp:Label>
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
                    function openEditSModal() {
                        $('[id*=myModal]').modal('show');
                    }
                </script>
            </div>
        </div>
        <div>
            <%--Job Reject Modal--%>
            <div class="modal fade" id="rejectJModal" role="dialog">
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
                                    <asp:Label ID="Label5" runat="server" Style="color: #102B3F; font-family: 'Poppins', sans-serif; font-size: 1.6em; font-weight: bold;" Text="Are you sure you want to decline?"></asp:Label> 
                                </div>
                            </div>
                            
                        </div>

                        <div class="modal-body" style="background-color: #4F79A3;">
                            <div class="col-lg-12 col-sm-12 col-md-12 col-xs-12 text-center">
                                <div class="form-group">
                                    <asp:Label ID="lblOrgName" runat="server" Style="color: white; font-family: 'Poppins', sans-serif; font-size: 2.1em; font-weight: bold;"></asp:Label>
                                </div>
                                <div class="col-lg-12 col-sm-12 col-md-12 col-xs-12 text-center">
                                    <asp:Label ID="rejectjobsublabel" runat="server" Style="color: white; font-family: 'Poppins', sans-serif; font-size: 2.1em; font-weight: bold;"></asp:Label>
                                </div>


                        </div>
                            </div>
                           <div class="modal-footer">
                            <div class="flex-center" style="text-align: center !important; margin: auto !important;">
                                <asp:HyperLink ID="RejectMailButton" NavigateUrl="~/OpportunityActDec.aspx" Style="background-color: #102B3F; color: #fff; width: 100px; height: 60px; text-align: center; display:table-cell;" CssClass="btn btn-circle" runat="server" Text="Message Organization"></asp:HyperLink>
                                </div>
                               <div class="row">
                                    <div>
                                <asp:Button ID="Button3" runat="server" Text="Decline" Style="background-color: #102B3F; color: #fff; width: 100px; height: 60px;" CssClass="btn btn-circle" OnClick="rejectJobButton_Click" />
                                <asp:Label ID="Label11" runat="server" Text="&nbsp;&nbsp;" style="Color: #ffffff"></asp:Label>
                                <button type="button" style="background-color: #102B3F; color: #fff; width: 100px; height: 60px;" class="btn btn-circle" data-dismiss="modal">Close</button>
                                <asp:Label ID="Label12" runat="server" Text="&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;" style="Color: #ffffff"></asp:Label>
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
                                <asp:Label ID="Label66"  Style="color: #102B3F; font-family: 'Poppins', sans-serif; font-size: 1.4em; font-weight: bold" runat="server" ForeColor="Black"></asp:Label>
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
                                   <%-- <asp:Label ID="lblScholarshipName" runat="server" ForeColor="White"></asp:Label>
                                    <br />--%>
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
                                <asp:Button ID="Button2" runat="server" Text="Decline" Style="background-color: #102B3F; color: #fff; width: 100px; height: 60px;" CssClass="btn btn-circle" OnClick="rejectJobButton_Click" />
                                <button type="button" style="background-color: #102B3F; color: #fff; width: 100px; height: 60px;" class="btn btn-circle" data-dismiss="modal">Close</button>
                            </div>
                        </div>
                    </div>
                </div>

                <script type='text/javascript'>
                    function openRejectJModal() {
                        $('[id*=rejectJModal]').modal('show');
                    }
                </script>
            </div>
        </div>

     
    </form>

</asp:Content>

