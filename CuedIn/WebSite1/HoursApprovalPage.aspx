<%@ Page Title="" Language="C#" MasterPageFile="~/SchoolMaster.master" AutoEventWireup="true" CodeFile="HoursApprovalPage.aspx.cs" Inherits="OpportunityActDec" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <form id="form1" runat="server">
        <div class="form-row">
       <div class="col-md-12 text-center">
      <label Class="form-control-lg font-weight-bold" for="inputJobs"></label>
           </div>

        <div class="col-md-12 text-center rounded" style="background-color:#102B3F;">
            <asp:CheckBox ID="chkImage" Style="color:white;" runat="server" Text="Image"  Checked="false" />
            <asp:CheckBox ID="chkGradeLevel" Style="color:white;" runat="server" Text="Grade Level"  Checked="false" />
            <asp:CheckBox ID="chkGPA" Style="color:white;" runat="server" Text="GPA"  Checked="false" />
            <asp:CheckBox ID="chkHoursWBL" Style="color:white;" runat="server" Text="Hours of WBL"  Checked="false" />
            <asp:CheckBox ID="chkJobType" Style="color:white;" runat="server" Text="Job Type"  Checked="false" />
            <asp:CheckBox ID="chkLink" Style="color:white;" runat="server" Text="Organization Link"  Checked="false" />
            
            <asp:Button ID="btnCheckGridView" runat="server" Text="Apply" OnClick="btnCheckGridView_Click" style="background-color: white; color:#102B3F;" class="btn btn-circle" />
        </div>
            <br />
       <div class="col-auto container-fluid text-center">
        <asp:GridView ID="GridView1" runat="server" CssClass="table table-hover table-striped table-responsive table-dark" Style="border-collapse: collapse;" AutoGenerateColumns="False" DataKeyNames="LogID" DataSourceID="JobOpportunity" CellPadding="1" BackColor="#102B40" ForeColor="White">
            <Columns>

                <asp:BoundField DataField="LogID" HeaderText="LogID" InsertVisible="False" ReadOnly="True" SortExpression="LogID" />
                <asp:TemplateField HeaderText="Image">
                    <ItemTemplate>
                        <asp:Image ID="studentImage" runat="server" CssClass="rounded-circle col-sm-1" ImageUrl='<%#Eval("StudentImage")%>' />
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField ShowHeader="false" HeaderStyle-BorderColor="Black">
                    <ItemTemplate>
                        <asp:LinkButton ID="btnStudentView" CssClass="border-bottom" runat="server" CommandArgument='<%#Eval ("LogID") %>' Text='<%#Eval("FullName")%>' OnCommand="btnStudentView_Click"></asp:LinkButton>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:BoundField DataField="StudentGradeLevel" HeaderText="Grade Level" SortExpression="GradeLevel" />
                <asp:BoundField DataField="StudentGPA" HeaderText="GPA" SortExpression="GPA" />
                <asp:BoundField DataField="HoursOfWorkPlaceExp" HeaderText="Hours of WBL" SortExpression="HoursOfWorkPlaceExp" />
                <asp:BoundField DataField="OrganizationName" HeaderText="Organization Name" SortExpression="OrganizationName" />
                <asp:BoundField DataField="JobTitle" HeaderText="Job Title" SortExpression="JobTitle" />
                <asp:BoundField DataField="JobType" HeaderText="Job Type" SortExpression="JobTitle" />
                <asp:BoundField DataField="HoursRequested" HeaderText="Hours Requested" SortExpression="HoursRequested" />
                <asp:TemplateField HeaderText="Organization Link">
                    <ItemTemplate>
                        <asp:LinkButton ID="btnExternalLink" runat="server" href='<%#Eval("ExternalLink")%>' target="_blank"><i class="fas fa-external-link-alt"></i></asp:LinkButton>
                    </ItemTemplate>
                </asp:TemplateField>
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
           </div>
        <asp:SqlDataSource ID="JobOpportunity" runat="server" ConnectionString="<%$ ConnectionStrings:DBConnectionString %>" SelectCommand="SELECT LogHours.LogID, CONCAT(Student.FirstName, ' ', Student.LastName) AS FullName, Student.StudentGradeLevel, Student.StudentGPA, Student.StudentACTScore, Student.StudentSATScore, Student.StudentGender, Student.StudentEthnicity, Student.HoursOfWorkPlaceExp, Student.StudentAthleteFlag, Student.StudentGraduationTrack, Student.StudentImage, Organization.OrganizationName, Organization.OrganizationDescription, Organization.ExternalLink, JobListing.JobTitle, JobListing.JobDescription, JobListing.JobType, JobListing.Location, LogHours.HoursRequested FROM JobListing INNER JOIN LogHours ON JobListing.JobListingID = LogHours.JobListingID INNER JOIN Organization ON JobListing.OrganizationID = Organization.OrganizationEntityID INNER JOIN Student ON LogHours.StudentEntityID = Student.StudentEntityID where LogHours.CounselorApproval = 'P' AND LogHours.OrganizationApproval = 'Y'"></asp:SqlDataSource>


</div>



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
                                    <i class="fas fa-address-card fa-4x progress-bar-animated rotateIn" style="color: #102B3F;"></i>
                                    <br>
                                    <br>
                                    <%--<h5>Student Information</h5>--%>
                                     <asp:Label ID="Label3" runat="server" Style="color: #102B3F; font-family: 'Poppins', sans-serif; font-size: 1.6em; font-weight: bold;" Text="Student Information"></asp:Label>
                                    <asp:Label ID="lblStudentName" runat="server" Style="color: #102B3F; font-family: 'Poppins', sans-serif; font-size: 2.1em; font-weight: bold;"></asp:Label>

                                </div>
                            </div>
                           
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
                                    <i class="fas fa-check fa-4x progress-bar-animated rotateIn" style="color: #102B3F;"></i>
                                    <br />
                                    <br />
                                    <%--<h5>Are you sure you want to approve?</h5>--%>
                                    <asp:Label ID="Label1" runat="server" Style="color: #102B3F; font-family: 'Poppins', sans-serif; font-size: 1.6em; font-weight: bold;" Text="Are you sure you want to approve these hours?"></asp:Label>
                                </div>
                            </div>
                            
                        </div>
                        <div class="modal-body" style="background-color: #4F79A3;">
                            <div class="col-lg-12 col-sm-12 col-md-12 col-xs-12 text-center">
                                <div class="form-group">
                                    <asp:Label ID="sublabelapprovemodal1" runat="server" Text=" " Style="color: white; font-family: 'Poppins', sans-serif; font-size: 2.1em; font-weight: bold;"></asp:Label>
                                <br />
                                    <asp:Label ID="sublabelapprovemodal2" runat="server" Text=" " Style="color: white; font-family: 'Poppins', sans-serif; font-size: 2.1em; font-weight: bold;"></asp:Label>
                                <br />
                                    <asp:Label ID="sublabelapprovemodal3" runat="server" Text=" " Style="color: white; font-family: 'Poppins', sans-serif; font-size: 2.1em; font-weight: bold;"></asp:Label>
                                </div>
                            </div>
                        </div>
                        <div class="modal-footer">
                            <div class="flex-center" style="text-align: center !important; margin: auto !important;">
                                <asp:Button ID="Button1" runat="server" Text="Approve" Style="background-color: #102B3F; color: #fff; width: 100px; height: 60px;" CssClass="btn btn-circle" OnClick="acceptJobButton_Click" />
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
                                    <i class="fas fa-times fa-4x progress-bar-animated rotateIn" style="color: #102B3F;"></i>
                                    <br>
                                    <br>
                                    <%--<h5>Are you sure you want to reject?</h5>--%>
                                    <asp:Label ID="Label2" runat="server" Style="color: #102B3F; font-family: 'Poppins', sans-serif; font-size: 1.6em; font-weight: bold;" Text="Are you sure you want to reject these hours?"></asp:Label>
                                </div>
                            </div>
                           
                        </div>
                        <div class="modal-body" style="background-color: #4F79A3;">
                            <div class="col-lg-12 col-sm-12 col-md-12 col-xs-12 text-center">
                                <div class="form-group">
                                    <asp:Label ID="sublabelRejectModal1" runat="server" Style="color: white; font-family: 'Poppins', sans-serif; font-size: 2.1em; font-weight: bold;"></asp:Label>
                                    <br />
                                    <asp:Label ID="sublabelRejectModal2" runat="server" Style="color: white; font-family: 'Poppins', sans-serif; font-size: 2.1em; font-weight: bold;"></asp:Label>
                                    <br />
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
                                    <i class="fas fa-comments fa-4x progress-bar-animated rotateIn" style="color: #102B3F;"></i>
                                    <br>
                                    <br>
                                    <%--<h5>Comments</h5>--%>
                                    <asp:Label ID="lblComments" Style="color: #102B3F; font-family: 'Poppins', sans-serif; font-size: 1.5em; font-weight: bold" runat="server" Text="Comments"></asp:Label>
                                </div>
                            </div>
                            
                        </div>
                        <div class="modal-body" style="background-color: #4F79A3;">
                            <div class="col-lg-12 col-sm-12 col-md-12 col-xs-12 text-center">
                                <div class="form-group">
                                    
                                    <asp:Label ID="Label4" Style="color: white; font-family: 'Poppins', sans-serif; font-size: 1.2em;" runat="server" Text="Student Comment:"></asp:Label>
                                    <asp:Label ID="StudentComment" Style="color: white; font-family: 'Poppins', sans-serif; font-size: 1.2em;" runat="server"></asp:Label>
                                </div>
                                <div class="col-lg-12 col-sm-12 col-md-12 col-xs-12 text-center">
                                    <asp:Label ID="Label5" Style="color: white; font-family: 'Poppins', sans-serif; font-size: 1.2em;" runat="server" Text="Organization Comment:"></asp:Label>
                                    <asp:Label ID="BusinessComment" Style="color: white; font-family: 'Poppins', sans-serif; font-size: 1.2em;" runat="server"></asp:Label>
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
            </div>
            <script type='text/javascript'>
                function openEditJModal() {
                    $('[id*=jobMoreInfoModal]').modal('show');
                }
            </script>
        </div>

            
    </form>



</asp:Content>

