<%@ Page Title="" Language="C#" MasterPageFile="~/Director.master" AutoEventWireup="true" CodeFile="DirectorStudentActDec.aspx.cs" Inherits="DirectorStudentActDec" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>


<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <head>
         <link rel='stylesheet' href='css/style.css'>
    </head>
     <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>


    <!--- Breadcrumb --->

 
    <ol class="breadcrumb arr-bread">
 
    <li><a href="DirectorLandingPage.aspx">Home</a></li>
    <li><a href="DirectorHoursApprovalPage.aspx">Student Log Hours</a></li>
 
                               
 
    <li class="active"><span>Student Application Request</span></li>       
 
                </ol>

<!--- END Breadcrumb --->

   
        <div class="form-check-inline" style="display: flex; justify-content: flex-end ">
        <asp:Button ID="btnTop0" runat="server" CssClass="btn  btn-sm popovers img-fluid" data-content="&lt;img src='img/AppDecMoreInfo.png' /&gt;" Style="margin-right: 1%; color: white;" data-html="true" data-placement="top" data-trigger="hover" Text="Icon Legend" BackColor="#006699" BorderColor="Black" />
        <asp:LinkButton ID="helpButton" runat="server" CssClass="btn btn-sm popovers img-fluid fa-2x" data-content="&lt;img src='img/studentapphelp.png' width=100% height=100% /&gt;" Style="margin-right: 8%; color: #006699;" data-html="true" data-placement="top" data-trigger="hover" BackColor="Transparent"><i class="far fa-question-circle"></i></asp:LinkButton>
        </div>
        

        <button onclick="topFunction()" id="myBtn"><i class="fas fa-angle-double-up"></i></button>

        <div class="form-group">
            <div class="col-md-10 container text-center">
                

                <div class="col-auto text-center rounded" style="background-color: #BDC1C7; padding: 10px;">
                    <asp:Label ID="Label4" runat="server" Text="Search" Style="color: black; text-align: center; /*font-weight: bold; */ letter-spacing: 6px; font-size: 1.2em; margin: .67em"></asp:Label>
                    <asp:TextBox ID="SearchBox" runat="server"></asp:TextBox>
                    <asp:LinkButton ID="SearchButton" runat="server" Style="color:black" OnClick="SearchButton_Click"><i class="fas fa-search"></i></asp:LinkButton>
                    <br />
                    <asp:CheckBox runat="server" Style="color: black; padding-right:30px" AutoPostBack="true" ID="cbSelectAll" Text="Select All" CssClass=".JchkAll" Checked="false" ViewStateMode = "Enabled" OnCheckedChanged="cbSelectAll_Checked"/>
                    <%--<asp:CheckBox ID="chkImage" Style="color: black; padding-right:30px" runat="server" Text="Image" Checked="false" CssClass=".JchkGrid" />--%>
                    <asp:CheckBox ID="chkGradeLevel" Style="color: black; padding-right:30px" runat="server" Text="Grade Level" Checked="false" />
                    <asp:CheckBox ID="chkGPA" Style="color: black; padding-right:30px" runat="server" Text="GPA" Checked="false" />
                 <!--   <asp:CheckBox ID="chkHoursWBL" Style="color: white;" runat="server" Text="Hours of WBL" Checked="false" /> -->
               <!--     <asp:CheckBox ID="chkJobDescription" Style="color: white;" runat="server" Text="Job Description" Checked="false" /> -->
                    <asp:CheckBox ID="chkJobType" Style="color: black; padding-right:30px" runat="server" Text="Job Type" Checked="false" CssClass="custom-checkbox" />

                    <asp:Button ID="btnCheckGridView" runat="server" Text="Apply" OnClick="btnCheckGridView_Click" Style="background-color: white; color: #102B3F;" class="btn btn-circle" />

                    


                </div>
                <div style="height: 5px; font-size: 10px;">&nbsp;</div>
               
                <div class="table-responsive">

              <asp:GridView ID="GridView1" runat="server" CssClass="table table-hover table-striped table-responsive table-dark rounded" Style="border-collapse: collapse; width:100%;" AutoGenerateColumns="False" DataKeyNames="ApplicationID"  CellPadding="1" BackColor="#102B40" ForeColor="White" OnDataBinding="btnCheckGridView_Click">
                  <HeaderStyle BackColor="#4F79A3" />
                      <Columns>

                        <asp:BoundField DataField="ApplicationID" HeaderText="ApplicationID" ReadOnly="True" SortExpression="ApplicationID" InsertVisible="False" Visible="false" >
                          <ItemStyle Font-Size="Large" />
                          </asp:BoundField>
                        <asp:TemplateField HeaderText="Image">
                            <ItemTemplate>
                                     <asp:Image ID="studentImage" style="max-width:7em;max-height:7em;" runat="server" ImageUrl="~/img/student.JPG" OnLoad="studentImage_Load" CssClass="img-fluid" BackColor="White" />
                            </ItemTemplate>
                            <ItemStyle Font-Size="Large" />
                        </asp:TemplateField>
                        <asp:BoundField DataField="FullName" HeaderText="Full Name" SortExpression="FullName" ReadOnly="True" HeaderStyle-Wrap="true" >
<HeaderStyle Wrap="True"></HeaderStyle>
                          <ItemStyle Font-Size="Large" />
                          </asp:BoundField>
                        <asp:BoundField DataField="StudentGradeLevel" HeaderText="Grade Level" ReadOnly="True" HeaderStyle-Wrap="true" Visible="false" >
<HeaderStyle Wrap="True"></HeaderStyle>
                          <ItemStyle Font-Size="Large" />
                          </asp:BoundField>
                        <asp:BoundField DataField="StudentGPA" HeaderText="GPA" ReadOnly="True" HeaderStyle-Wrap="true" Visible="false" >
<HeaderStyle Wrap="True"></HeaderStyle>
                          <ItemStyle Font-Size="Large" />
                          </asp:BoundField>
                        <asp:BoundField DataField="HoursOfWorkPlaceExp" HeaderText="Hours Of WBL" SortExpression="HoursOfWorkPlaceExp" ReadOnly="True" HeaderStyle-Wrap="true" >
<HeaderStyle Wrap="True"></HeaderStyle>
                          <ItemStyle Font-Size="Large" />
                          </asp:BoundField>
                        <asp:BoundField DataField="JobTitle" HeaderText="Job Title" SortExpression="JobTitle" ItemStyle-Wrap="true" >
<ItemStyle Wrap="True" Font-Size="Large"></ItemStyle>
                          </asp:BoundField>
                        <asp:BoundField DataField="JobDescription" HeaderText="Job Description" SortExpression="JobDescription" ReadOnly="True" ItemStyle-Wrap="true" >
<ItemStyle Wrap="True" Font-Size="Large"></ItemStyle>
                          </asp:BoundField>
                        <asp:BoundField DataField="JobType" HeaderText="Job Type" ReadOnly="True" Visible="false" >
                          <ItemStyle Font-Size="Large" />
                          </asp:BoundField>
                        <asp:BoundField DataField="OrganizationName" HeaderText="Organization Name" SortExpression="OrganizationName" ItemStyle-Wrap="true" >
<ItemStyle Wrap="True" Font-Size="Large"></ItemStyle>
                          </asp:BoundField>
                        <asp:TemplateField ShowHeader="False" HeaderText="Actions">
                            <ItemTemplate>
                                <asp:LinkButton ID="approveStudentLinkBtn" CssClass="btn btn-success btn-circle btn-block" Text="Approve" runat="server" CommandArgument='<%#Eval ("ApplicationID") %>' OnCommand="approveStudentLinkBtn_Click"><i class="fas fa-check"></i></asp:LinkButton>
                                <asp:LinkButton ID="rejectStudentLinkBtn" CssClass="btn btn-danger btn-circle btn-block" Text="Reject" runat="server" CommandArgument='<%#Eval ("ApplicationID") %>' OnCommand="rejectStudentLinkBtn_Click"><i class="fas fa-times"></i></asp:LinkButton>
                                <asp:LinkButton ID="moreInfoStudentLinkBtn" CssClass="btn btn-warning btn-circle btn-block" Text="View More" runat="server" CommandArgument='<%#Eval ("ApplicationID") %>' OnCommand="moreInfoStudentLinkBtn_Click"><i class="fas fa-info"></i></asp:LinkButton>
                            </ItemTemplate>
                            <ItemStyle Font-Size="Large" />
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


        </script>

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


                                        <asp:Label ID="Label2" runat="server" Style="color: #102B3F; font-family: 'Poppins', sans-serif; font-size: 1.6em; font-weight: bold;" Text="Are you sure you want to decline?"></asp:Label>

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
                                        <asp:Label ID="Label6" Style="color: white; font-family: 'Poppins', sans-serif; font-size: 1.2em;" runat="server" ForeColor="White" Text="Organization Name:" Font-Bold="true"></asp:Label>
                                        <br />
                                        <asp:Label ID="lblOrgName" Style="color: white; font-family: 'Poppins', sans-serif; font-size: 1.2em;" runat="server" ForeColor="White"></asp:Label>
                                        <br />
                                        <asp:Label ID="Label7" Style="color: white; font-family: 'Poppins', sans-serif; font-size: 1.2em;" runat="server" ForeColor="White" Text="Organization Description:" Font-Bold="true"></asp:Label>
                                        <br />
                                        <asp:Label ID="lblOrgDesc" Style="color: white; font-family: 'Poppins', sans-serif; font-size: 1.2em;" runat="server" ForeColor="White"></asp:Label>
                                        <br />
                                        <asp:Label ID="Label9" Style="color: white; font-family: 'Poppins', sans-serif; font-size: 1.2em;" runat="server" ForeColor="White" Text="Job Title:" Font-Bold="true"></asp:Label>
                                        <br />
                                        <asp:Label ID="lblJobTitle" Style="color: white; font-family: 'Poppins', sans-serif; font-size: 1.2em;" runat="server" ForeColor="White"></asp:Label>
                                        <br />
                                        <asp:Label ID="Label8" Style="color: white; font-family: 'Poppins', sans-serif; font-size: 1.2em;" runat="server" ForeColor="White" Text="Job Description:" Font-Bold="true"></asp:Label>
                                        <br />
                                        <asp:Label ID="lblJobDesc" Style="color: white; font-family: 'Poppins', sans-serif; font-size: 1.2em;" runat="server" ForeColor="White"></asp:Label>
                                        <br />
                                        <asp:Label ID="Label10" Style="color: white; font-family: 'Poppins', sans-serif; font-size: 1.2em;" runat="server" ForeColor="White" Text="Job Location:" Font-Bold="true"></asp:Label>
                                        <br />
                                        <asp:Label ID="lblJobLocation" Style="color: white; font-family: 'Poppins', sans-serif; font-size: 1.2em;" runat="server" ForeColor="White"></asp:Label>
                                        <br />
                                        <asp:Label ID="Label11" Style="color: white; font-family: 'Poppins', sans-serif; font-size: 1.2em;" runat="server" ForeColor="White" Text="Number of Applicants:" Font-Bold="true"></asp:Label>
                                        <br />
                                        <asp:Label ID="lblNumberOfApplicants" Style="color: white; font-family: 'Poppins', sans-serif; font-size: 1.2em;" runat="server" ForeColor="White"></asp:Label>
                                        <br />
                                        <asp:Label ID="Label12" Style="color: white; font-family: 'Poppins', sans-serif; font-size: 1.2em;" runat="server" ForeColor="White" Text="Deadline:" Font-Bold="true"></asp:Label>
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
                                    <asp:Label ID="lblHeader" runat="server" Style="color: #102B3F; font-family: 'Poppins', sans-serif; font-size: 1.6em; font-weight: bold;" Text="Student Information"></asp:Label>
                                    <br />
                                    <asp:Image ID="imgStudent" runat="server" CssClass="rounded-circle col-md-6" />
                                    <asp:Label ID="Label5" runat="server" Style="color: #102B3F; font-family: 'Poppins', sans-serif; font-size: 2.1em; font-weight: bold;"></asp:Label>

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
   



</asp:Content>


