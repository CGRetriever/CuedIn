<%@ Page Title="" Language="C#" MasterPageFile="~/SchoolMaster.master" AutoEventWireup="true" CodeFile="HoursApprovalPage.aspx.cs" Inherits="OpportunityActDec" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <form id="form1" runat="server">


        <label class="form-control-lg font-weight-bold" for="inputJobs">Hours to Approve </label>
        <asp:SqlDataSource ID="JobOpportunity" runat="server" ConnectionString="<%$ ConnectionStrings:DBConnectionString %>" SelectCommand="SELECT LogHours.LogID, CONCAT(Student.FirstName, ' ', Student.LastName) AS FullName, Organization.OrganizationName, JobListing.JobTitle, LogHours.HoursRequested FROM JobListing INNER JOIN LogHours ON JobListing.JobListingID = LogHours.JobListingID INNER JOIN Student ON LogHours.StudentEntityID = Student.StudentEntityID INNER JOIN Organization ON JobListing.OrganizationID = Organization.OrganizationEntityID where CounselorApproval = 'P'"></asp:SqlDataSource>
        <%--Get rid of Job ID eventually- for now we need it for the DB update?--%>
        <asp:GridView ID="GridView1" runat="server" CssClass="table table-hover table-striped " Style="border-collapse: collapse;" AutoGenerateColumns="False" DataKeyNames="LogID" DataSourceID="JobOpportunity" CellPadding="1" BackColor="#102B40" ForeColor="White">
            <Columns>

                <asp:BoundField DataField="LogID" HeaderText="LogID" InsertVisible="False" ReadOnly="True" SortExpression="LogID" />
                <asp:TemplateField ShowHeader="false" HeaderStyle-BorderColor="Black">
                    <ItemTemplate>
                        <asp:LinkButton ID="btnStudentView" CssClass="border-bottom" runat="server" CommandArgument='<%#Eval ("LogID") %>' Text='<%#Eval("FullName")%>' OnCommand="btnStudentView_Click"></asp:LinkButton>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:BoundField DataField="OrganizationName" HeaderText="OrganizationName" SortExpression="OrganizationName" />
                <asp:BoundField DataField="JobTitle" HeaderText="JobTitle" SortExpression="JobTitle" />
                <asp:BoundField DataField="HoursRequested" HeaderText="HoursRequested" SortExpression="HoursRequested" />
                <asp:TemplateField ShowHeader="False" HeaderStyle-BorderColor="Black">
                    <ItemTemplate>
                        <asp:LinkButton ID="approveJobLinkBtn" CssClass="btn btn-success btn-circle" Text="Approve" runat="server" CommandArgument='<%#Eval ("LogID") %>' OnCommand="approveJobLinkBtn_Click"></asp:LinkButton>
                        <asp:LinkButton ID="rejectJobLinkBtn" CssClass="btn btn-danger btn-circle" Text="Reject" runat="server" CommandArgument='<%#Eval ("LogID") %>' OnCommand="rejectJobLinkBtn_Click"></asp:LinkButton>
                        <asp:LinkButton ID="moreInfoJobLinkBtn" CssClass="btn btn-warning btn-circle" Text="View Comments" runat="server" CommandArgument='<%#Eval ("LogID") %>' OnCommand="moreInfoJobLinkBtn_Click"></asp:LinkButton>
                    </ItemTemplate>

                    <HeaderStyle BorderColor="Black"></HeaderStyle>
                </asp:TemplateField>
            </Columns>
            <RowStyle CssClass="cursor-pointer" />
        </asp:GridView>




        <%--<div class="form-group col-md-6">
      <label class="form-control-lg font-weight-bold" for="ScholarshipOpportunity">Scholarships to Approve</label>
        <asp:SqlDataSource ID="ScholarshipOpportunity" runat="server" ConnectionString="<%$ ConnectionStrings:DBConnectionString %>" SelectCommand="SELECT Scholarship.ScholarshipID, Scholarship.ScholarshipName, Organization.OrganizationName FROM Scholarship INNER JOIN Organization ON Scholarship.OrganizationID = Organization.OrganizationEntityID where approved = 'pen'"></asp:SqlDataSource>
              <asp:GridView ID="GridView2" runat="server" CssClass="table table-hover table-striped table-dark" style="border-collapse:collapse;" AutoGenerateColumns="False" DataKeyNames="ScholarshipID" DataSourceID="ScholarshipOpportunity" BackColor="#102B40" ForeColor="White">
            <Columns>
                <asp:BoundField DataField="ScholarshipID" InsertVisible="false" ReadOnly="true" />
                <asp:BoundField DataField="ScholarshipName" HeaderText="Scholarship Name" InsertVisible="False" ReadOnly="True"  />
                <asp:BoundField DataField="OrganizationName" HeaderText="Organization Name" InsertVisible="False" ReadOnly="True"   />
                     <asp:TemplateField ShowHeader="False">
            <ItemTemplate>
                <asp:LinkButton  ID="LinkButton2" CssClass="btn btn-success btn-circle" Text="Approve" runat="server" CommandArgument='<%#Eval ("ScholarshipID") %>' OnCommand="LinkButton2_Click"></asp:LinkButton>
                <asp:LinkButton  ID="LinkButton3" CssClass="btn btn-danger btn-circle" Text="Reject" runat="server" CommandArgument='<%#Eval ("ScholarshipID") %>' OnCommand="LinkButton3_Click"></asp:LinkButton>
                <asp:LinkButton ID="LinkButton1" CssClass="btn btn-warning btn-circle" Text="View More" runat="server" CommandArgument='<%#Eval ("ScholarshipID") %>' OnCommand="LinkButton1_Click"></asp:LinkButton>
            </ItemTemplate>
        </asp:TemplateField>
            </Columns>
            <RowStyle CssClass="cursor-pointer" />
        </asp:GridView>
    </div>--%>



        <br />
        <br />

        <div>
            <%--Student View Modal--%>
            <div class="modal fade" id="viewStudentModal" role="dialog">
                <div class="modal-dialog">
                    <!-- Modal content-->
                    <div class="modal-content">
                        <div class="modal-header">
                            <div class="col-md-12 text-center">
                                <div class="modal-title">
                                    <i class="fas fa-address-card fa-4x progress-bar-animated rotateIn"></i>
                                    <br>
                                    <br>
                                    <h5>Student Information</h5>
                                    <asp:Label ID="lblStudentName" runat="server" Style="color: #102B3F; font-family: 'Poppins', sans-serif; font-size: 2.1em; font-weight: bold;"></asp:Label>

                                </div>
                            </div>
                            <button type="button" class="close" data-dismiss="modal">
                                &times;</button>
                        </div>
                        <div class="modal-body" style="background-color: #4F79A3;">
                            <div class="col-lg-12 col-sm-12 col-md-12 col-xs-12 text-center">
                                <div class="form-group">
                                </div>
                                <div class="col-lg-12 col-sm-12 col-md-12 col-xs-12 text-center">
                                    <asp:Label ID="lblGradeLevel" runat="server" Style="color: white; font-family: 'Poppins', sans-serif; font-size: 2.1em; font-weight: bold;"></asp:Label>
                                    <asp:Label ID="lblGPA" runat="server" Style="color: white; font-family: 'Poppins', sans-serif; font-size: 2.1em; font-weight: bold;"></asp:Label>
                                    <br />
                                    <asp:Label ID="lblSATScore" runat="server" Style="color: white; font-family: 'Poppins', sans-serif; font-size: 2.1em; font-weight: bold;"></asp:Label>
                                    <asp:Label ID="lblHoursWorked" runat="server" Style="color: white; font-family: 'Poppins', sans-serif; font-size: 2.1em; font-weight: bold;"></asp:Label>

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
                    function openviewStudentModal() {
                        $('[id*=viewStudentModal]').modal('show');
                    }
               </script>
            </div>
        </div>



        <div>
            <%--Hours Approve Modal--%>
            <div class="modal fade" id="approveXModal" role="dialog">
                <div class="modal-dialog">
                    <!-- Modal content-->
                    <div class="modal-content">
                        <div class="modal-header">
                            <div class="col-md-12 text-center">
                                <div class="modal-title">
                                    <i class="fas fa-check fa-4x progress-bar-animated rotateIn"></i>
                                    <br />
                                    <br />
                                    <h5>Are you sure you want to approve?</h5>
                                </div>
                            </div>
                            <button type="button" class="close" data-dismiss="modal">
                                &times;</button>
                        </div>
                        <div class="modal-body" style="background-color: #4F79A3;">
                            <div class="col-lg-12 col-sm-12 col-md-12 col-xs-12 text-center">
                                <div class="form-group">
                                    <asp:Label ID="Label2" runat="server" Style="color: white; font-family: 'Poppins', sans-serif; font-size: 2.1em; font-weight: bold;" Text="Are you sure you want to approve these hours?"></asp:Label>
                                </div>
                                <div class="col-lg-12 col-sm-12 col-md-12 col-xs-12 text-center">
                                    <asp:Label ID="sublabelapprovemodal1" runat="server" Text=" " Style="color: white; font-family: 'Poppins', sans-serif; font-size: 2.1em; font-weight: bold;"></asp:Label>
                                </div>
                                <div class="col-lg-12 col-sm-12 col-md-12 col-xs-12 text-center">
                                    <asp:Label ID="sublabelapprovemodal2" runat="server" Text=" " Style="color: white; font-family: 'Poppins', sans-serif; font-size: 2.1em; font-weight: bold;"></asp:Label>
                                </div>
                                <div class="col-lg-12 col-sm-12 col-md-12 col-xs-12 text-center">
                                    <asp:Label ID="sublabelapprovemodal3" runat="server" Text=" " Style="color: white; font-family: 'Poppins', sans-serif; font-size: 2.1em; font-weight: bold;"></asp:Label>
                                </div>
                            </div>
                        </div>
                        <div class="modal-footer">
                            <div class="flex-center" style="text-align: center !important; margin: auto !important;">
                                <asp:Button ID="Button1" runat="server" Text="Approve" Style="background-color: #102B3F; color: #fff; width: 200px; height: 60px;" CssClass="btn btn-circle" OnClick="acceptJobButton_Click" />
                                <button type="button" style="background-color: #102B3F; color: #fff; width: 100px; height: 60px;" class="btn btn-circle" data-dismiss="modal">Close</button>
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
            <%--Hours Reject Modal--%>
            <div class="modal fade" id="rejectJModal" role="dialog">
                <div class="modal-dialog">
                    <!-- Modal content-->
                    <div class="modal-content">
                        <div class="modal-header">
                            <div class="col-md-12 text-center">
                                <div class="modal-title">
                                    <i class="fas fa-times fa-4x progress-bar-animated rotateIn"></i>
                                    <br>
                                    <br>
                                    <h5>Are you sure you want to reject?</h5>
                                </div>
                            </div>
                            <button type="button" class="close" data-dismiss="modal">
                                &times;</button>
                        </div>
                        <div class="modal-body" style="background-color: #4F79A3;">
                            <div class="col-lg-12 col-sm-12 col-md-12 col-xs-12 text-center">
                                <div class="form-group">
                                    <asp:Label ID="Label3" runat="server" Style="color: white; font-family: 'Poppins', sans-serif; font-size: 2.1em; font-weight: bold;" Text="Are you sure you want to reject these hours?"></asp:Label>
                                </div>
                                <div class="col-lg-12 col-sm-12 col-md-12 col-xs-12 text-center">
                                    <asp:Label ID="sublabelRejectModal1" runat="server" Style="color: white; font-family: 'Poppins', sans-serif; font-size: 2.1em; font-weight: bold;"></asp:Label>
                                    <asp:Label ID="sublabelRejectModal2" runat="server" Style="color: white; font-family: 'Poppins', sans-serif; font-size: 2.1em; font-weight: bold;"></asp:Label>
                                    <asp:Label ID="sublabelRejectModal3" runat="server" Style="color: white; font-family: 'Poppins', sans-serif; font-size: 2.1em; font-weight: bold;"></asp:Label>
                                
                                </div>
                            </div>
                        </div>
                        <div class="modal-footer">
                            <div class="flex-center" style="text-align: center !important; margin: auto !important;">
                                <asp:Button ID="Button2" runat="server" Text="Reject" Style="background-color: #102B3F; color: #fff; width: 100px; height: 60px;" CssClass="btn btn-circle" OnClick="rejectJobButton_Click" />
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

        <div>
            <%-- Hours More Info Modal--%>
            <div class="modal fade" id="jobMoreInfoModal" role="dialog">
                <div class="modal-dialog">
                    <!-- Modal content-->
                    <div class="modal-content">
                        <div class="modal-header">
                            <div class="col-md-12 text-center">
                               <div class="modal-title">
                                    <i class="fas fa-comments fa-4x progress-bar-animated rotateIn"></i>
                                    <br>
                                    <br>
                                    <h5>Comments</h5>
                                </div>
                            </div>
                            <button type="button" class="close" data-dismiss="modal">
                                &times;</button>
                        </div>
                        <div class="modal-body" style="background-color: #4F79A3;">
                            <div class="col-lg-12 col-sm-12 col-md-12 col-xs-12 text-center">
                                <div class="form-group">
                                    
                                    <asp:Label ID="Label4" runat="server" Text="Student Comment:"></asp:Label>
                                    <asp:Label ID="StudentComment" runat="server"></asp:Label>
                                </div>
                                <div class="col-lg-12 col-sm-12 col-md-12 col-xs-12 text-center">
                                    <asp:Label ID="Label5" runat="server" Text="Organization Comment:"></asp:Label>
                                    <asp:Label ID="BusinessComment" runat="server"></asp:Label>
                                </div>



                            </div>

                        
                        <div class="modal-footer">
                            <div class="flex-center" style="text-align: center !important; margin: auto !important;">
                            <button type="button" style="background-color: #102B3F; color: #fff; width: 100px; height: 60px;" class="btn btn-circle" data-dismiss="modal">Close</button>
                            </div>
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
            <%--Scholarship Reject Modal--%>
            <div class="modal fade" id="rejectSModal" role="dialog">
                <div class="modal-dialog">
                    <!-- Modal content-->
                    <div class="modal-content">
                        <div class="modal-header">
                            <h4 class="modal-title">Reject Scholarship</h4>
                            <button type="button" class="close" data-dismiss="modal">
                                &times;</button>
                        </div>
                        <div class="modal-body">
                            <div class="col-lg-12 col-sm-12 col-md-12 col-xs-12">
                                <div class="form-group">
                                    <asp:Label ID="Label1" runat="server" Text="Are you sure you want to reject this scholarship listing?"></asp:Label>
                                </div>
                            </div>
                        </div>
                        <div class="modal-footer">
                            <asp:Button ID="rejectScholarshipButton" runat="server" Text="Reject" CssClass="btn btn-danger btn-circle" OnClick="rejectScholarshipButton_Click" />
                            <button type="button" class="btn btn-warning btn-circle" data-dismiss="modal">Close</button>
                        </div>
                    </div>
                </div>
                <script type='text/javascript'>
                    function openRejectSModal() {
                        $('[id*=rejectSModal]').modal('show');
                    }
                </script>
            </div>
        </div>
    </form>



</asp:Content>

