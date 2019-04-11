<%@ Page Title="" Language="C#" MasterPageFile="~/SchoolMaster.master" AutoEventWireup="true" CodeFile="StudentActDec.aspx.cs" Inherits="StudentActDec" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">


    <form id="form1" runat="server">
        <div class="form-row">
            <div class="col-md-12 text-center">
            </div>
            <div class="col-auto container-fluid text-center">
                <div class="text-center rounded" style="background-color: #102B3F; width: auto;">

                    <asp:CheckBox ID="chkImage" Style="color: white;" runat="server" Text="Image" Checked="false" />
                    <asp:CheckBox ID="chkGradeLevel" Style="color: white;" runat="server" Text="Grade Level" Checked="false" />
                    <asp:CheckBox ID="chkGPA" Style="color: white;" runat="server" Text="GPA" Checked="false" />
                    <asp:CheckBox ID="chkHoursWBL" Style="color: white;" runat="server" Text="Hours of WBL" Checked="false" />
                    <asp:CheckBox ID="chkJobDescription" Style="color: white;" runat="server" Text="Job Description" Checked="false" />
                    <asp:CheckBox ID="chkJobType" Style="color: white;" runat="server" Text="Job Type" Checked="false" />
                    <asp:CheckBox ID="chkOrgWebsite" Style="color: white;" runat="server" Text="Website" Checked="false" />


                    <asp:Button ID="btnCheckGridView" runat="server" Text="Apply" OnClick="btnCheckGridView_Click" Style="background-color: white; color: #102B3F;" class="btn btn-circle" />
                </div>
                <br />
                
                <asp:GridView ID="GridView1" runat="server" CssClass="table table-hover table-striped table-dark table-responsive" Style="border-collapse: collapse;" AutoGenerateColumns="False" DataSourceID="StudentOpportunity" CellPadding="1" BackColor="#102B40" ForeColor="White" DataKeyNames="ApplicationID">
                    <Columns>

                        <asp:BoundField DataField="ApplicationID" HeaderText="ApplicationID" ReadOnly="True" SortExpression="ApplicationID" InsertVisible="False" />
                        <asp:TemplateField HeaderText="Image">
                            <ItemTemplate>
                                <asp:Image ID="studentImage" runat="server" CssClass="rounded-circle col-sm-1" ImageUrl='<%#Eval("StudentImage")%>' />
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:BoundField DataField="FullName" HeaderText="Full Name" SortExpression="FullName" ReadOnly="True" HeaderStyle-Wrap="true" />
                        <asp:BoundField DataField="StudentGradeLevel" HeaderText="Grade Level" ReadOnly="True" HeaderStyle-Wrap="true" ItemStyle-Width="5%"/>
                        <asp:BoundField DataField="StudentGPA" HeaderText="GPA" ReadOnly="True" HeaderStyle-Wrap="true" />
                        <asp:BoundField DataField="HoursOfWorkPlaceExp" HeaderText="Hours Of WBL" ReadOnly="True" HeaderStyle-Wrap="true" />
                        <asp:BoundField DataField="JobTitle" HeaderText="Job Title" SortExpression="JobTitle" ItemStyle-Wrap="true"  />
                        <asp:BoundField DataField="JobDescription" HeaderText="Job Description" ReadOnly="True" ItemStyle-Wrap="true"/>
                        <asp:BoundField DataField="JobType" HeaderText="Job Type" ReadOnly="True" />
                        <asp:BoundField DataField="OrganizationName" HeaderText="Organization Name" SortExpression="OrganizationName" ItemStyle-Wrap="true"/>
                        <asp:TemplateField HeaderText=" Website">
                            <ItemTemplate>
                                <asp:LinkButton ID="btnOrgLink" runat="server" href='<%#Eval("ExternalLink")%>' target="_blank"><i class="fas fa-external-link-alt"></i></asp:LinkButton>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField ShowHeader="False" HeaderStyle-BorderColor="Black">
                            <ItemTemplate>
                                <asp:LinkButton ID="approveStudentLinkBtn" CssClass="btn btn-success btn-circle" Text="Approve" runat="server" CommandArgument='<%#Eval ("ApplicationID") %>' OnCommand="approveStudentLinkBtn_Click"></asp:LinkButton>
                                <asp:LinkButton ID="rejectStudentLinkBtn" CssClass="btn btn-danger btn-circle" Text="Reject" runat="server" CommandArgument='<%#Eval ("ApplicationID") %>' OnCommand="rejectStudentLinkBtn_Click"></asp:LinkButton>
                                <asp:LinkButton ID="moreInfoStudentLinkBtn" CssClass="btn btn-warning btn-circle" Text="View More" runat="server" CommandArgument='<%#Eval ("ApplicationID") %>' OnCommand="moreInfoStudentLinkBtn_Click"></asp:LinkButton>
                            </ItemTemplate>

                            <HeaderStyle BorderColor="Black"></HeaderStyle>
                        </asp:TemplateField>

                    </Columns>
                    <RowStyle CssClass="cursor-pointer" />
                </asp:GridView>
                    
            </div>


            <asp:SqlDataSource ID="StudentOpportunity" runat="server" ConnectionString="<%$ ConnectionStrings:CuedInDBConnectionString2 %>" SelectCommand="SELECT ApplicationRequest.ApplicationID, Student.FirstName + ' ' + Student.LastName AS FullName, JobListing.JobTitle, Organization.OrganizationName, Student.StudentGradeLevel, Student.StudentGPA, Student.DaysAbsent, Student.HoursOfWorkPlaceExp, Student.StudentImage, JobListing.JobDescription, JobListing.JobType, JobListing.Location, Organization.ExternalLink FROM ApplicationRequest INNER JOIN JobListing ON ApplicationRequest.JobListingID = JobListing.JobListingID INNER JOIN Organization ON JobListing.OrganizationID = Organization.OrganizationEntityID INNER JOIN Student ON ApplicationRequest.StudentEntityID = Student.StudentEntityID WHERE (ApplicationRequest.ApprovedFlag = 'P')"></asp:SqlDataSource>




            <div class="form-group col-md-6">
            </div>

        </div>

        <br />
        <br />

        <div>
            <%--Student Approve Modal--%>
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
                                    <asp:Label ID="Label1" runat="server" Style="color: #102B3F; font-family: 'Poppins', sans-serif; font-size: 1.6em; font-weight: bold;" Text="Are you sure you want to approve?"></asp:Label>
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
                                <asp:Button ID="Button1" runat="server" Text="Approve" Style="background-color: #102B3F; color: #fff; width: 100px; height: 60px;" CssClass="btn btn-circle" OnClick="acceptJobButton_Click" />
                                <button type="button" style="background-color: #102B3F; color: #fff; width: 100px; height: 60px;" class="btn btn-circle" data-dismiss="modal">Close</button>
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



            <div>
                <%--Student Reject Modal--%>
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
                                        <asp:Label ID="Label2" runat="server" Style="color: #102B3F; font-family: 'Poppins', sans-serif; font-size: 1.6em; font-weight: bold;" Text="Are you sure you want to reject?"></asp:Label>
                                    </div>
                                </div>

                            </div>
                            <div class="modal-body" style="background-color: #4F79A3;">
                                <div class="col-lg-12 col-sm-12 col-md-12 col-xs-12 text-center">
                                    <div class="form-group">
                                        <asp:Label ID="StudentRejectLabel" runat="server" Style="color: white; font-family: 'Poppins', sans-serif; font-size: 2.1em; font-weight: bold;"></asp:Label>
                                        <br />
                                        <asp:Label ID="StudentRejectSubLabel" runat="server" Style="color: white; font-family: 'Poppins', sans-serif; font-size: 2.1em; font-weight: bold;"></asp:Label>
                                        <br />

                                        <asp:Label ID="Student2ndRejectSubLabel" runat="server" Style="color: white; font-family: 'Poppins', sans-serif; font-size: 2.1em; font-weight: bold;"></asp:Label>
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
                <%-- Student More Info Modal--%>
                <div class="modal fade" id="myModal" role="dialog">
                    <div class="modal-dialog">
                        <!-- Modal content-->
                        <div class="modal-content">
                            <div class="modal-header">
                                <div class="col-md-12 text-center">
                                    <div class="modal-title">
                                        <i class="fas fa-info-circle fa-4x progress-bar-animated rotateIn" style="color: #102B3F;"></i>
                                        <br>
                                        <br>
                                        <%--<h5>More Information</h5>--%>
                                        <asp:Label ID="Label3" runat="server" Style="color: #102B3F; font-family: 'Poppins', sans-serif; font-size: 1.7em; font-weight: bold;" Text="More Information"></asp:Label>
                                        <div class="col-lg-12 col-sm-12 col-md-12 col-xs-12 text-center">
                                            <asp:Label ID="lblStudentName" runat="server" Style="color: #102B3F; font-family: 'Poppins', sans-serif; font-size: 2.1em; font-weight: bold;"></asp:Label>
                                        </div>
                                        <div class="col-lg-12 col-sm-12 col-md-12 col-xs-12 text-center">
                                            <asp:Label ID="lblSudentGPA" runat="server" Style="color: #102B3F; font-family: 'Poppins', sans-serif; font-size: 2.1em; font-weight: bold;"></asp:Label>
                                        </div>
                                        <div class="col-lg-12 col-sm-12 col-md-12 col-xs-12 text-center">
                                            <asp:Label ID="lblStudentStatus" runat="server" Style="color: #102B3F; font-family: 'Poppins', sans-serif; font-size: 2.1em; font-weight: bold;"></asp:Label>
                                        </div>
                                    </div>
                                </div>

                            </div>
                            <div class="modal-body" style="background-color: #4F79A3;">
                                <div class="col-lg-12 col-sm-12 col-md-12 col-xs-12 text-left">
                                    <div class="form-group">
                                        <asp:Label ID="lblOrgName" Style="color: white; font-family: 'Poppins', sans-serif; font-size: 1.6em;" runat="server" ForeColor="White"></asp:Label>
                                        <br />
                                        <asp:Label ID="lblOrgDesc" Style="color: white; font-family: 'Poppins', sans-serif; font-size: 1.6em;" runat="server" ForeColor="White"></asp:Label>
                                        <br />

                                        <asp:Label ID="lblJobTitle" Style="color: white; font-family: 'Poppins', sans-serif; font-size: 1.6em;" runat="server" ForeColor="White"></asp:Label>
                                        <br />
                                        <asp:Label ID="lblJobDesc" Style="color: white; font-family: 'Poppins', sans-serif; font-size: 1.6em;" runat="server" ForeColor="White"></asp:Label>
                                        <br />
                                        <asp:Label ID="lblJobLocation" Style="color: white; font-family: 'Poppins', sans-serif; font-size: 1.6em;" runat="server" ForeColor="White"></asp:Label>
                                        <br />
                                        <asp:Label ID="lblJobDeadline" Style="color: white; font-family: 'Poppins', sans-serif; font-size: 1.6em;" runat="server" ForeColor="White"></asp:Label>
                                        <br />
                                        <asp:Label ID="lblNumberOfApplicants" Style="color: white; font-family: 'Poppins', sans-serif; font-size: 1.6em;" runat="server" ForeColor="White"></asp:Label>
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
    </form>

</asp:Content>

