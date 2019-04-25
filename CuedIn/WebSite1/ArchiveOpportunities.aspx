<%@ Page Title="" Language="C#" MasterPageFile="~/SchoolMaster.master" AutoEventWireup="true" CodeFile="ArchiveOpportunities.aspx.cs" Inherits="ArchiveOpportunities" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">


    <link rel="stylesheet" href="css/style.css" />
   

           <!--- Breadcrumb --->

    <ol class="breadcrumb arr-bread">
 
    <li><a href="LandingPage.aspx">Home</a></li>
    <li><a href="OpportunityActDec.aspx">Manage Opportunities</a></li>
    <li><a href="ArchiveScholarships.aspx">Archived Scholarships</a></li>
                               
 
    <li class="active"><span>Archived Jobs</span></li>       
 
                </ol>


<!--- END Breadcrumb --->

     <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>

       
    
<div class="row">

    <button onclick="topFunction()" id="myBtn"><i class="fas fa-angle-double-up"></i></button>
   

    <div class="form-check-inline" style="display: flex; justify-content: flex-end">
    <asp:Button ID="btnTop0" runat="server" CssClass="btn  btn-sm popovers img-fluid" data-content="&lt;img src='img/AppDecMoreInfo.png' /&gt;" Style="margin-left: 1490px; color: white;" data-html="true" data-placement="top" data-trigger="hover" Text="Icon Legend" BackColor="#006699" />
    <asp:LinkButton ID="helpButton" runat="server" CssClass="btn btn-sm popovers img-fluid fa-2x" data-content="&lt;img src='img/archivejobshelp.png' width=100% height=100% /&gt;" Style=" color: #006699;" data-html="true" data-placement="top" data-trigger="hover" BackColor="Transparent"><i class="far fa-question-circle"></i></asp:LinkButton> 
    </div>


</div>


 <%--Rejected Jobs Gridview--%>
    <div class="container-fluid ">
        <div class="row">

            <div class="form-group col-lg-6">
                <div class="text-center">
                    <label class="form-control-lg font-weight-bold" for="inputJobs">Rejected Jobs </label>



                    <div class="col-auto text-center" style="background-color: #BDC1C7; padding: 10px;">
                        <asp:Label ID="Label17" runat="server" Text="Search" Style="color: black; text-align: center; /*font-weight: bold; */ letter-spacing: 6px; font-size: 1.2em; margin: .67em"></asp:Label>
                        <asp:TextBox ID="SearchBox1" runat="server"></asp:TextBox>
                        <asp:LinkButton ID="SearchButton1" runat="server" Text="Search" OnClick="SearchButton1_Click" Style="color:black;"><i class="fas fa-search"></i></asp:LinkButton>

                        <br />


                        <asp:CheckBox runat="server" Style="color: black; padding-right:30px" OnCheckedChanged="cbSelectAll2_Checked" AutoPostBack="true" ID="cbSelectAll2" Text="Select All" CssClass=".JchkAll" />
                        
                        <asp:CheckBox ID="chkJobDescription" Style="color: black; padding-right:30px" runat="server" Text="Job Description" Checked="false" CssClass=".JchkGrid"/>
                        <asp:CheckBox ID="chkJobType" Style="color: black; padding-right:30px" runat="server" Text="Job Type" Checked="false" CssClass=".JchkGrid"/>
                        <asp:CheckBox ID="chkJobLocation" Style="color: black; padding-right:30px" runat="server" Text="Location" Checked="false" CssClass=".JchkGrid"/>

                        <asp:Button ID="btnCheckGridView" runat="server" Text="Apply" OnClick="btnCheckGridView_Click" Style="background-color: white; color: #102B3F;" class="btn btn-circle" />
                    </div>

                    <div style="height:5px;font-size:10px;">&nbsp;</div>

                   
                    <div class="table-responsive">
                    <asp:GridView ID="gridviewRejJobs" runat="server" CssClass="table table-hover table-striped table-dark" AutoGenerateColumns="False" OnDataBinding="btnCheckGridView_Click" DataKeyNames="JobListingID"  CellPadding="1" BackColor="#102B40" ForeColor="White">
                        <HeaderStyle BackColor="#4F79A3" />
                        <Columns>
                            <asp:BoundField DataField="JobTitle" HeaderText="Job Title" InsertVisible="False" ReadOnly="True" >
                            <ItemStyle Font-Size="Large" />
                            </asp:BoundField>
                            <asp:BoundField DataField="OrganizationName" HeaderText="Organization Name" >

                            <ItemStyle Font-Size="Large" />
                            </asp:BoundField>

                            <asp:BoundField DataField="JobDescription" HeaderText="Job Description" ItemStyle-Wrap="true" Visible="false" >
<ItemStyle Wrap="True" Font-Size="Large"></ItemStyle>
                            </asp:BoundField>
                            <asp:BoundField DataField="JobType" HeaderText="Job Type" Visible="false" >
                            <ItemStyle Font-Size="Large" />
                            </asp:BoundField>
                            <asp:BoundField DataField="Location" HeaderText="Location" Visible="false" >

                            <ItemStyle Font-Size="Large" />
                            </asp:BoundField>

                            <asp:TemplateField ShowHeader="False" HeaderText="Actions">
                                <ItemTemplate>
                                    <asp:LinkButton ID="btnJobApprove" CssClass="btn btn-success btn-circle btn-block" Text="Approve" runat="server" CommandArgument='<%#Eval ("JobListingID") %>' OnCommand="approveJobLinkBtn_Click"><i class="fas fa-check"></i></asp:LinkButton>
                                    <asp:LinkButton ID="btnJobViewMore" CssClass="btn btn-warning btn-circle btn-block" Text="View More" runat="server" CommandArgument='<%#Eval ("JobListingID") %>' OnCommand="moreInfoRejJobLinkBtn_Click"><i class="fas fa-info"></i></asp:LinkButton>

                                </ItemTemplate>
                                <ItemStyle Font-Size="Large" />
                            </asp:TemplateField>

                        </Columns>
                        <RowStyle CssClass="cursor-pointer" />
                    </asp:GridView>
                        </div>

                </div>
            </div>
            <%--Accepted Jobs Gridview--%>

            <div class="form-group col-lg-6">
                <div class="text-center">
                    <label class="form-control-lg font-weight-bold" for="inputJobs">Accepted Jobs </label>


                    <div class="col-auto text-center" style="background-color: #BDC1C7;padding:10px;">
                        <asp:Label ID="Label3" runat="server" Text="Search" Style="color: black; text-align: center; /*font-weight: bold; */ letter-spacing: 6px; font-size: 1.2em; margin: .67em"></asp:Label>
                        <asp:TextBox ID="SearchBox2" runat="server"></asp:TextBox>
                        <asp:LinkButton ID="SearchButton2" runat="server" Text="Search" OnClick="SearchButton2_Click" Style="color:black;"><i class="fas fa-search"></i></asp:LinkButton>
                        <br />
                        <asp:CheckBox runat="server" Style="color: black; padding-right:30px" OnCheckedChanged="cbSelectAll_Checked" AutoPostBack="true" ID="cbSelectAll" Text="Select All" CssClass=".JchkAll1" />
                        
                        
                        
                        <asp:CheckBox ID="chkJobDescription1" Style="color:black; padding-right:30px" runat="server" Text="Job Description" Checked="false" CssClass=".JchkGrid1" />
                        <asp:CheckBox ID="chkJobType1" Style="color:black; padding-right:30px" runat="server" Text="Job Type" Checked="false" CssClass=".JchkGrid1" />
                        <asp:CheckBox ID="chkJobLocation1" Style="color: black; padding-right:30px" runat="server" Text="Location" Checked="false" CssClass=".JchkGrid1" />


                        <asp:Button ID="btnCheckGridView2" runat="server" Text="Apply" OnClick="btnCheckGridView2_Click" Style="background-color: white; color: #102B3F;" class="btn btn-circle" />
                    </div>

                   <div style="height:5px;font-size:10px;">&nbsp;</div>

                    
                    <div class="table-responsive">
                    <asp:GridView ID="gridviewAccJobs" runat="server" CssClass="table table-hover table-striped table-dark"  AutoGenerateColumns="False" OnDataBinding="btnCheckGridView2_Click" DataKeyNames="JobListingID"  CellPadding="1" BackColor="#102B40" ForeColor="White" BorderStyle="None">
                        <HeaderStyle BackColor="#4F79A3" />
                        <Columns>

                            <asp:BoundField DataField="JobListingID" HeaderText="JobListingID" ReadOnly="True" SortExpression="JobListingID" Visible="false" >
                            <ItemStyle Font-Size="Large" />
                            </asp:BoundField>
                            <asp:BoundField DataField="JobTitle" HeaderText="Job Title" InsertVisible="False" ReadOnly="True" >
                            <ItemStyle Font-Size="Large" />
                            </asp:BoundField>
                            <asp:BoundField DataField="OrganizationName" HeaderText="Organization Name" >

                            <ItemStyle Font-Size="Large" />
                            </asp:BoundField>

                            <asp:BoundField DataField="JobDescription" HeaderText="Job Description" ItemStyle-Wrap="true" Visible="false" >
<ItemStyle Wrap="True" Font-Size="Large"></ItemStyle>
                            </asp:BoundField>
                            <asp:BoundField DataField="JobType" HeaderText="Job Type" Visible="false" >
                            <ItemStyle Font-Size="Large" />
                            </asp:BoundField>
                            <asp:BoundField DataField="Location" HeaderText="Location" Visible="false" >


                            <ItemStyle Font-Size="Large" />
                            </asp:BoundField>


                            <asp:TemplateField ShowHeader="False" HeaderText="Actions">
                                <ItemTemplate>
                                    <asp:LinkButton ID="btnJobReject" CssClass="btn btn-circle btn-danger btn-block" Text="Decline" runat="server" CommandArgument='<%#Eval ("JobListingID") %>' OnCommand="rejectJobLinkBtn_Click"><i class="fas fa-times"></i></asp:LinkButton>
                                    <asp:LinkButton ID="btnJobViewMore" CssClass="btn btn-warning btn-circle btn-block" Text="View More" runat="server" CommandArgument='<%#Eval ("JobListingID") %>' OnCommand="moreInfoAccJobLinkBtn_Click"><i class="fas fa-info"></i></asp:LinkButton>

                                </ItemTemplate>
                                <ItemStyle Font-Size="Large" />
                            </asp:TemplateField>

                        </Columns>
                        <RowStyle CssClass="cursor-pointer" />
                    </asp:GridView>
                </div>
            </div>


            </div>


        </div>


            <script>
                //Initialize popover with jQuery
                $(document).ready(function () {
                    $('.popovers').popover({
                        container: 'body',
                    });

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
                            <asp:HyperLink ID="MailButtonLink" NavigateUrl="~/OpportunityActDec.aspx" Style="background-color: #102B3F; color: #fff; width: 100px; height: 60px; text-align: center; display: table-cell;" CssClass="btn btn-circle" runat="server" Text="Message Organization"></asp:HyperLink>
                        </div>
                        <div class="row">
                            <div>
                                <asp:Button ID="Button1" runat="server" Text="Approve" Style="background-color: #102B3F; color: #fff; width: 100px; height: 60px;" CssClass="btn btn-circle" OnClick="acceptJobButton_Click" />
                                <asp:Label ID="Label9" runat="server" Text="&nbsp;&nbsp;" Style="color: #ffffff"></asp:Label>
                                <button type="button" style="background-color: #102B3F; color: #fff; width: 100px; height: 60px;" class="btn btn-circle" data-dismiss="modal">Close</button>
                                <asp:Label ID="Label10" runat="server" Text="&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;" Style="color: #ffffff"></asp:Label>
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

        <div>
            <%-- Job More Info Modal--%>
            <div class="modal fade" id="myModal" role="dialog">
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
                                    <asp:Label ID="Label1" Style="color: #102B3F; font-family: 'Poppins', sans-serif; font-size: 1.4em; font-weight: bold" runat="server" Text="More Information"></asp:Label>
                                    <br />
                                    <asp:Label ID="lblJobName" Style="color: #102B3F; font-family: 'Poppins', sans-serif; font-size: 1.4em; font-weight: bold" runat="server"></asp:Label>
                                </div>
                            </div>

                        </div>
                        <div class="modal-body" style="background-color: #4F79A3;">
                            <div class="col-lg-12 col-sm-12 col-md-12 col-xs-12 text-left">
                                <div class="form-group">
                                    <asp:Label ID="Label6" Style="color: white; font-family: 'Poppins', sans-serif; font-size: 1.2em;" runat="server" ForeColor="White" Text="Organization Name:" Font-Bold="true"></asp:Label>
                                    <br />
                                    <asp:Label ID="lblJOrganizationName" Style="color: white; font-family: 'Poppins', sans-serif; font-size: 1.2em;" runat="server" ForeColor="White"></asp:Label>
                                    <br />
                                    <asp:Label ID="Label7" Style="color: white; font-family: 'Poppins', sans-serif; font-size: 1.2em;" runat="server" ForeColor="White" Text="Organization Description:" Font-Bold="true"></asp:Label>
                                    <br />
                                    <asp:Label ID="lblJOrganizationDescription" Style="color: white; font-family: 'Poppins', sans-serif; font-size: 1.2em;" runat="server" ForeColor="White"></asp:Label>
                                    <br />
                                    <asp:Label ID="Label8" Style="color: white; font-family: 'Poppins', sans-serif; font-size: 1.2em;" runat="server" ForeColor="White" Text="Job Type:" Font-Bold="true"></asp:Label>
                                    <br />
                                    <asp:Label ID="lblJobType" runat="server" Style="color: white; font-family: 'Poppins', sans-serif; font-size: 1.2em;" ForeColor="White"></asp:Label>
                                    <br />
                                    <asp:Label ID="Label13" Style="color: white; font-family: 'Poppins', sans-serif; font-size: 1.2em;" runat="server" ForeColor="White" Text="Job Description:" Font-Bold="true"></asp:Label>
                                    <br />
                                    <asp:Label ID="lblJobDescription" Style="color: white; font-family: 'Poppins', sans-serif; font-size: 1.2em;" runat="server" ForeColor="White"></asp:Label>
                                    <br />
                                    <asp:Label ID="Label14" Style="color: white; font-family: 'Poppins', sans-serif; font-size: 1.2em;" runat="server" ForeColor="White" Text="Job Location:" Font-Bold="true"></asp:Label>
                                    <br />
                                    <asp:Label ID="lblJobLocation" Style="color: white; font-family: 'Poppins', sans-serif; font-size: 1.2em;" runat="server" ForeColor="White"></asp:Label>
                                    <br />
                                    <asp:Label ID="Label15" Style="color: white; font-family: 'Poppins', sans-serif; font-size: 1.2em;" runat="server" ForeColor="White" Text="Number of Applicants:" Font-Bold="true"></asp:Label>
                                    <br />
                                    <asp:Label ID="lblNumOfApplicants" Style="color: white; font-family: 'Poppins', sans-serif; font-size: 1.2em;" runat="server" ForeColor="White"></asp:Label>
                                    <br />
                                    <asp:Label ID="Label16" Style="color: white; font-family: 'Poppins', sans-serif; font-size: 1.2em;" runat="server" ForeColor="White" Text="Job Deadline:" Font-Bold="true"></asp:Label>
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
                                <asp:HyperLink ID="RejectMailButton" NavigateUrl="~/OpportunityActDec.aspx" Style="background-color: #102B3F; color: #fff; width: 100px; height: 60px; text-align: center; display: table-cell;" CssClass="btn btn-circle" runat="server" Text="Message Organization"></asp:HyperLink>
                            </div>


                            <div class="row">
                                <div>
                                    <asp:Button ID="Button3" runat="server" Text="Decline" Style="background-color: #102B3F; color: #fff; width: 100px; height: 60px;" CssClass="btn btn-circle" OnClick="rejectJobButton_Click" />
                                    <asp:Label ID="Label11" runat="server" Text="&nbsp;&nbsp;" Style="color: #ffffff"></asp:Label>
                                    <button type="button" style="background-color: #102B3F; color: #fff; width: 100px; height: 60px;" class="btn btn-circle" data-dismiss="modal">Close</button>
                                    <asp:Label ID="Label12" runat="server" Text="&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;" Style="color: #ffffff"></asp:Label>

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
                                            <asp:Label ID="Label66" Style="color: #102B3F; font-family: 'Poppins', sans-serif; font-size: 1.4em; font-weight: bold" runat="server" ForeColor="Black"></asp:Label>
                                        </div>
                                    </div>

                                </div>
                                <div class="modal-body" style="background-color: #4F79A3;">
                                    <div class="col-lg-12 col-sm-12 col-md-12 col-xs-12">
                                        <div class="form-group">
                                            <asp:Label ID="Label18" Style="color: white; font-family: 'Poppins', sans-serif; font-size: 1.2em;" runat="server" ForeColor="White" Text="Organization Name:" Font-Bold="true"></asp:Label>
                                            <br />
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
                                        <asp:Button ID="Button2" runat="server" Text="Decline" Style="background-color: #102B3F; color: #fff; width: 100px; height: 60px;" CssClass="btn btn-circle" OnClick="rejectJobButton_Click" />
                                        <button type="button" style="background-color: #102B3F; color: #fff; width: 100px; height: 60px;" class="btn btn-circle" data-dismiss="modal">Close</button>
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



</asp:Content>

