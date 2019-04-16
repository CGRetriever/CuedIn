<%@ Page Title="" Language="C#" MasterPageFile="~/SchoolMaster.master" AutoEventWireup="true" CodeFile="HoursApprovalPage.aspx.cs" Inherits="OpportunityActDec" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

   
    <form id="form1" runat="server">


         <!--- Breadcrumb --->

 
    <ol class="breadcrumb arr-bread">
 
    <li><a href="LandingPage.aspx">Home</a></li>
    <li><a href="StudentActDec.aspx">Student Application Request</a></li>
 
                               
 
    <li class="active"><span>Student Log Hours</span></li>       
 
                </ol>

<!--- END Breadcrumb --->


        <button onclick="topFunction()" id="myBtn"><i class="fas fa-angle-double-up"></i></button>
        <asp:Button ID="btnTop0" runat="server" CssClass="btn  btn-sm popovers img-fluid" data-content="&lt;img src='img/AppDecMoreInfo.png' /&gt;" Style="margin-left: 90%; color: white;" data-html="true" data-placement="top" data-trigger="hover" Text="Icon Legend" BackColor="#006699" BorderColor="Black" />
        
        <div class="form-group">
            <div class="col-md-8 container-fluid text-center">
                <div class="col-auto text-center" style="background-color: #102B3F;">
                    <asp:Label ID="Label6" runat="server" Text="Search" Style="color: #fff; text-align: center; letter-spacing: 6px; font-size: 1.2em; margin: .67em"></asp:Label>
                    <asp:TextBox ID="SearchBox" runat="server"></asp:TextBox>
                    <asp:LinkButton ID="SearchButton" runat="server" Text="Search" OnClick="SearchButton_Click" Style="color:white;"><i class="fas fa-search"></i></asp:LinkButton>
                    <br />

                    <asp:CheckBox runat="server" Style="color: white;" CheckedChanged="cbSelectAll_Checked" AutoPostBack="true" ID="cbSelectAll" Text="Select All" CssClass=".JchkAll"/>
                    <asp:CheckBox ID="chkImage" Style="color: white;" runat="server" Text="Image" Checked="false" CssClass=".JchkGrid" />
                    <asp:CheckBox ID="chkGradeLevel" Style="color: white;" runat="server" Text="Grade Level" Checked="false" CssClass=".JchkGrid" />
                    <asp:CheckBox ID="chkGPA" Style="color: white;" runat="server" Text="GPA" Checked="false" CssClass=".JchkGrid" />
                    <asp:CheckBox ID="chkHoursWBL" Style="color: white;" runat="server" Text="Hours of WBL" Checked="false" CssClass=".JchkGrid" />
                    <asp:CheckBox ID="chkJobType" Style="color: white;" runat="server" Text="Job Type" Checked="false" CssClass=".JchkGrid" />

                    <asp:Button ID="btnCheckGridView" runat="server" Text="Apply" OnClick="btnCheckGridView_Click" Style="background-color: white; color: #102B3F;" class="btn btn-circle" />
                </div>

                <div style="height:5px;font-size:10px;">&nbsp;</div>
                
                <asp:SqlDataSource ID="JobOpportunity" runat="server" ConnectionString="<%$ ConnectionStrings:DBConnectionString %>" SelectCommand="SELECT LogHours.LogID, CONCAT(Student.FirstName, ' ', Student.LastName) AS FullName, Student.StudentGradeLevel, Student.StudentGPA, Student.StudentACTScore,
 Student.StudentSATScore, Student.StudentGender, Student.StudentEthnicity, Student.HoursOfWorkPlaceExp, Student.StudentAthleteFlag, Student.StudentGraduationTrack, 
 Student.StudentImage, Organization.OrganizationName, Organization.OrganizationDescription, Organization.ExternalLink, JobListing.JobTitle, JobListing.JobDescription, 
 JobListing.JobType, JobListing.Location, LogHours.HoursRequested FROM JobListing INNER JOIN LogHours ON JobListing.JobListingID = LogHours.JobListingID INNER JOIN Organization
 ON JobListing.OrganizationID = Organization.OrganizationEntityID INNER JOIN Student ON LogHours.StudentEntityID = Student.StudentEntityID where LogHours.CounselorApproval = 'P' AND LogHours.OrganizationApproval = 'Y' and SchoolEntityID = @schoolID">
                        <SelectParameters>
                          <asp:SessionParameter Name="schoolID" SessionField="schoolID"
                           DefaultValue="12" />

                        </SelectParameters>

                </asp:SqlDataSource>
                <asp:GridView ID="GridView1" runat="server" CssClass="table table-hover table-striped table-responsive table-dark" Style="border-collapse: collapse; width:auto;" AutoGenerateColumns="False" DataKeyNames="LogID" DataSourceID="JobOpportunity" CellPadding="1" BackColor="#102B40" ForeColor="White">
                    <Columns>

                       
                        <asp:TemplateField HeaderText="Image" Visible="false">
                            <ItemTemplate>
                                <asp:Image ID="studentImage" runat="server" CssClass="rounded-circle col-sm-1" ImageUrl='<%#Eval("StudentImage")%>' />
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Student Name">
                            <ItemTemplate>
                                <asp:LinkButton ID="btnStudentView" CssClass="border-bottom" runat="server" CommandArgument='<%#Eval ("LogID") %>' Text='<%#Eval("FullName")%>' OnCommand="btnStudentView_Click"></asp:LinkButton>
                            </ItemTemplate>
                        </asp:TemplateField>
                         <asp:BoundField DataField="LogID" HeaderText="LogID" InsertVisible="False" ReadOnly="True" SortExpression="LogID" Visible="false" />
                        <asp:BoundField DataField="StudentGradeLevel" HeaderText="Grade Level" SortExpression="GradeLevel" visible="false"/>
                        <asp:BoundField DataField="StudentGPA" HeaderText="GPA" SortExpression="GPA" Visible="false"/>
                        <asp:BoundField DataField="HoursOfWorkPlaceExp" HeaderText="Hours of WBL" SortExpression="HoursOfWorkPlaceExp" Visible="false"/>
                        <asp:BoundField DataField="OrganizationName" HeaderText="Organization Name" SortExpression="OrganizationName" />
                        <asp:BoundField DataField="JobTitle" HeaderText="Job Title" SortExpression="JobTitle" />
                        <asp:BoundField DataField="JobType" HeaderText="Job Type" SortExpression="JobTitle" />
                        <asp:BoundField DataField="HoursRequested" HeaderText="Hours Requested" SortExpression="HoursRequested" />

                        <asp:TemplateField ShowHeader="False">
                            <ItemTemplate>
                                <asp:LinkButton ID="approveJobLinkBtn" CssClass="btn btn-success btn-circle btn-block" Text="Approve" runat="server" CommandArgument='<%#Eval ("LogID") %>' OnCommand="approveJobLinkBtn_Click"><i class="fas fa-check"></i></asp:LinkButton>
                                <asp:LinkButton ID="rejectJobLinkBtn" CssClass="btn btn-danger btn-circle btn-block" Text="Decline" runat="server" CommandArgument='<%#Eval ("LogID") %>' OnCommand="rejectJobLinkBtn_Click"><i class="fas fa-times"></i></asp:LinkButton>
                                <asp:LinkButton ID="moreInfoJobLinkBtn" CssClass="btn btn-warning btn-circle btn-block" Text="View Comments" runat="server" CommandArgument='<%#Eval ("LogID") %>' OnCommand="moreInfoJobLinkBtn_Click"><i class="fas fa-comments"></i></asp:LinkButton>
                            </ItemTemplate>


                        </asp:TemplateField>
                    </Columns>
                    <RowStyle CssClass="cursor-pointer" />
                </asp:GridView>
                


            </div>
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
                                    <asp:Label ID="Label2" runat="server" Style="color: #102B3F; font-family: 'Poppins', sans-serif; font-size: 1.6em; font-weight: bold;" Text="Are you sure you want to decline these hours?"></asp:Label>
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

