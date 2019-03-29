<%@ Page Title="" Language="C#" MasterPageFile="~/SchoolMaster.master" AutoEventWireup="true" CodeFile="ArchiveOpportunities.aspx.cs" Inherits="ArchiveOpportunities" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="row">
        <div class="col-12 ">
            <p>Archived Opportunities</p>
        </div>
    </div>
    <form id="form1" runat="server">
        <%--Rejected Jobs Gridview--%>
        <div class="form-row">
            <div class="form-group col-md-6">
                <label class="form-control-lg font-weight-bold" for="inputJobs">Archived Jobs </label>

                <asp:SqlDataSource ID="JobOpportunity" runat="server" ConnectionString="<%$ ConnectionStrings:DBConnectionString %>" SelectCommand="SELECT JobListing.JobTitle, Organization.OrganizationName, JobListing.JobListingID FROM JobListing INNER JOIN Organization ON JobListing.OrganizationID = Organization.OrganizationEntityID where joblisting.approved = 'no'"></asp:SqlDataSource>

                <asp:GridView ID="gridviewArchivedJobs" runat="server" CssClass="table table-hover table-striped " Style="border-collapse: collapse;" AutoGenerateColumns="False" DataKeyNames="JobListingID" DataSourceID="JobOpportunity" CellPadding="1" BackColor="#102B40" ForeColor="White">
                    <Columns>

                        <asp:BoundField DataField="JobTitle" HeaderText="Job Title" InsertVisible="False" ReadOnly="True" />
                        <asp:BoundField DataField="OrganizationName" HeaderText="Organization Name" />
                        <asp:TemplateField ShowHeader="False" HeaderStyle-BorderColor="Black">
                            <ItemTemplate>
                                <asp:LinkButton ID="approveJobLinkBtn" CssClass="btn btn-success btn-circle" Text="Approve" runat="server" CommandArgument='<%#Eval ("JobListingID") %>' OnCommand="approveJobLinkBtn_Click"></asp:LinkButton>
                                <asp:LinkButton ID="moreInfoJobLinkBtn" CssClass="btn btn-warning btn-circle" Text="View More" runat="server" CommandArgument='<%#Eval ("JobListingID") %>' OnCommand="moreInfoJobLinkBtn_Click"></asp:LinkButton>
                            </ItemTemplate>

                            <HeaderStyle BorderColor="Black"></HeaderStyle>
                        </asp:TemplateField>
                    </Columns>
                    <RowStyle CssClass="cursor-pointer" />
                </asp:GridView>


            </div>
        
        <%--Rejected Scholarships Gridview--%>
        <div class="form-group col-md-6">
            <label class="form-control-lg font-weight-bold" for="ScholarshipOpportunity">Archived Scholarships</label>

            <asp:SqlDataSource ID="ScholarshipOpportunity" runat="server" ConnectionString="<%$ ConnectionStrings:DBConnectionString %>" SelectCommand="SELECT Scholarship.ScholarshipID, Scholarship.ScholarshipName, Organization.OrganizationName FROM Scholarship INNER JOIN Organization ON Scholarship.OrganizationID = Organization.OrganizationEntityID where approved = 'no'"></asp:SqlDataSource>

            

            <asp:GridView ID="GridView2" runat="server" CssClass="table table-hover table-striped table-dark" Style="border-collapse: collapse;" AutoGenerateColumns="False" DataKeyNames="ScholarshipID" DataSourceID="ScholarshipOpportunity" BackColor="#102B40" ForeColor="White">
                <Columns>
                    
                    <asp:BoundField DataField="ScholarshipName" HeaderText="Scholarship Name" InsertVisible="False" ReadOnly="True" />
                    <asp:BoundField DataField="OrganizationName" HeaderText="Organization Name" InsertVisible="False" ReadOnly="True" />
                    <asp:TemplateField ShowHeader="False">
                        <ItemTemplate>
                            <asp:LinkButton ID="btnScholarshipApprove" CssClass="btn btn-success btn-circle" Text="Approve" runat="server" CommandArgument='<%#Eval ("ScholarshipID") %>' OnCommand="btnScholarshipApprove_Click"></asp:LinkButton>
                            <asp:LinkButton ID="btnScholarshipViewMore" CssClass="btn btn-warning btn-circle" Text="View More" runat="server" CommandArgument='<%#Eval ("ScholarshipID") %>' OnCommand="btnScholarshipViewMore_Click"></asp:LinkButton>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
                <RowStyle CssClass="cursor-pointer" />
            </asp:GridView>
        </div>
        <div>
            </div>

            <%--Job Approve Modal--%>
            <div class="modal fade" id="approveXModal" role="dialog">
                <div class="modal-dialog">
                    <!-- Modal content-->
                    <div class="modal-content">
                        <div class="modal-header">
                            <h4 class="modal-title">Approve Job</h4>
                            <button type="button" class="close" data-dismiss="modal">
                                &times;</button>
                        </div>
                        <div class="modal-body">
                            <div class="col-lg-12 col-sm-12 col-md-12 col-xs-12">
                                <div class="form-group">
                                    <asp:Label ID="Label2" runat="server" Text="Are you sure you want to approve this job listing?"></asp:Label>
                                </div>
                            </div>
                        </div>
                        <div class="modal-footer">
                            <asp:Button ID="Button3" runat="server" Text="Message Organization" CssClass="btn btn-circle btn-primary" OnClick="Button3_Click1" />
                            <asp:Button ID="Button1" runat="server" Text="Approve" CssClass="btn btn-success btn-circle" OnClick="acceptJobButton_Click" />
                            <button type="button" class="btn btn-warning btn-circle" data-dismiss="modal">Close</button>
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
                            <h4 class="modal-title">More Information</h4>
                            <button type="button" class="close" data-dismiss="modal">
                                &times;</button>
                        </div>
                        <div class="modal-body">
                            <div class="col-lg-12 col-sm-12 col-md-12 col-xs-12">
                                <div class="form-group">
                                    <asp:Label ID="lblJobTitle" runat="server"></asp:Label>
                                    <br />
                                    <asp:Label ID="lblJobDescription" runat="server"></asp:Label>
                                    <br />
                                    <asp:Label ID="lblJobType" runat="server"></asp:Label>
                                    <br />
                                    <asp:Label ID="lblJobLocation" runat="server"></asp:Label>
                                    <br />
                                    <asp:Label ID="lblJobDeadline" runat="server"></asp:Label>
                                    <br />
                                    <asp:Label ID="lblNumOfApplicants" runat="server"></asp:Label>
                                    <br />
                                    <asp:Label ID="lblJOrganizationName" runat="server"></asp:Label>
                                    <br />
                                    <asp:Label ID="lblJOrganizationDescription" runat="server"></asp:Label>
                                    <br />

                                </div>
                            </div>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-warning btn-circle" data-dismiss="modal">Close</button>
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
            <%--Scholarship Approve Modal--%>
            <div class="modal fade" id="approveSModal" role="dialog">
                <div class="modal-dialog">
                    <!-- Modal content-->
                    <div class="modal-content">
                        <div class="modal-header">
                            <h4 class="modal-title">Approve Scholarship</h4>
                            <button type="button" class="close" data-dismiss="modal">
                                &times;</button>
                        </div>
                        <div class="modal-body">
                            <div class="col-lg-12 col-sm-12 col-md-12 col-xs-12">
                                <div class="form-group">
                                    <asp:Label ID="ApprovalLbl" runat="server" Text="Are you sure you want to approve this scholarship listing?"></asp:Label>
                                </div>
                            </div>
                        </div>
                        <div class="modal-footer">
                            <asp:Button ID="acceptScholarshipButton" runat="server" Text="Approve" CssClass="btn btn-success btn-circle" OnClick="acceptScholarshipButton_Click" />
                            <button type="button" class="btn btn-warning btn-circle" data-dismiss="modal">Close</button>
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
                            <h4 class="modal-title">More Information</h4>
                            <button type="button" class="close" data-dismiss="modal">
                                &times;</button>
                        </div>
                        <div class="modal-body">
                            <div class="col-lg-12 col-sm-12 col-md-12 col-xs-12">
                                <div class="form-group">
                                    <asp:Label ID="lblSOrganizationName" runat="server"></asp:Label>
                                    <br />
                                    <asp:Label ID="lblSOrganizationDescription" runat="server"></asp:Label>
                                    <br />
                                    <asp:Label ID="lblScholarshipName" runat="server"></asp:Label>
                                    <br />
                                    <asp:Label ID="lblScholarshipDescription" runat="server"></asp:Label>
                                    <br />
                                    <asp:Label ID="lblScholarshipMin" runat="server"></asp:Label>
                                    <br />
                                    <asp:Label ID="lblScholarshipMax" runat="server"></asp:Label>
                                    <br />
                                    <asp:Label ID="lblScholarshipQuantity" runat="server"></asp:Label>
                                    <br />
                                    <asp:Label ID="lblScholarshipDueDate" runat="server"></asp:Label>
                                    <br />

                                </div>
                            </div>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-warning btn-circle" data-dismiss="modal">Close</button>
                        </div>
                    </div>
                </div>
                <script type='text/javascript'>
                    function openEditJModal() {
                        $('[id*=jobMoreInfoModal]').modal('show');
                    }
                </script>
            </div>
        </div>
    </form>

</asp:Content>

