<%@ Page Title="" Language="C#" MasterPageFile="~/SchoolMaster.master" AutoEventWireup="true" CodeFile="OpportunityActDec.aspx.cs" Inherits="OpportunityActDec" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>


<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <link rel="stylesheet" type="text/css" href="css/style.css">
    <div class='tableauPlaceholder' id='viz1553211444276' style='position: relative'>
        <noscript><a href='#'>
            <img alt=' ' src='https:&#47;&#47;public.tableau.com&#47;static&#47;images&#47;Ap&#47;ApprovalDashboard_CuedIn_Dark_Extra_Large_Device&#47;Dashboard1&#47;1_rss.png' style='border: none' /></a></noscript>
        <object class='tableauViz' style='display: none;'>
            <param name='host_url' value='https%3A%2F%2Fpublic.tableau.com%2F' />
            <param name='embed_code_version' value='3' />
            <param name='site_root' value='' />
            <param name='name' value='ApprovalDashboard_CuedIn_Dark_Extra_Large_Device&#47;Dashboard1' />
            <param name='tabs' value='no' />
            <param name='toolbar' value='yes' />
            <param name='static_image' value='https:&#47;&#47;public.tableau.com&#47;static&#47;images&#47;Ap&#47;ApprovalDashboard_CuedIn_Dark_Extra_Large_Device&#47;Dashboard1&#47;1.png' />
            <param name='animate_transition' value='yes' />
            <param name='display_static_image' value='yes' />
            <param name='display_spinner' value='yes' />
            <param name='display_overlay' value='yes' />
            <param name='display_count' value='yes' />
        </object>
    </div>
    <script type='text/javascript'>                    var divElement = document.getElementById('viz1553211444276'); var vizElement = divElement.getElementsByTagName('object')[0]; vizElement.style.minWidth = '1200px'; vizElement.style.maxWidth = '2560px'; vizElement.style.width = '100%'; vizElement.style.height = '307px'; var scriptElement = document.createElement('script'); scriptElement.src = 'https://public.tableau.com/javascripts/api/viz_v1.js'; vizElement.parentNode.insertBefore(scriptElement, vizElement);                </script>


    <form id="form1" runat="server">
        <div class="form-row">
            <div class="form-group col-md-6">
                <label class="form-control-lg font-weight-bold" for="inputJobs">Jobs to Approve </label>
                <asp:SqlDataSource ID="JobOpportunity" runat="server" ConnectionString="<%$ ConnectionStrings:DBConnectionString %>" SelectCommand="SELECT JobListing.JobTitle, Organization.OrganizationName, JobListing.JobListingID FROM JobListing INNER JOIN Organization ON JobListing.OrganizationID = Organization.OrganizationEntityID where joblisting.approved = 'P'"></asp:SqlDataSource>
                <asp:GridView ID="GridView1" runat="server" CssClass="table table-hover table-striped table-dark" Style="border-collapse: collapse; width: auto;" AutoGenerateColumns="False" DataKeyNames="JobListingID" DataSourceID="JobOpportunity" CellPadding="1" BackColor="#102B40" ForeColor="White">
                    <Columns>
                        <asp:BoundField DataField="JobTitle" HeaderText="Job Title" InsertVisible="False" ReadOnly="True" />
                        <asp:BoundField DataField="OrganizationName" HeaderText="Organization Name" />
                        <asp:TemplateField ShowHeader="False">
                            <ItemTemplate>
                                <asp:LinkButton ID="approveJobLinkBtn" CssClass="btn btn-success btn-circle btn-block" Text="Approve" runat="server" CommandArgument='<%#Eval ("JobListingID") %>' OnCommand="approveJobLinkBtn_Click"></asp:LinkButton>
                                <asp:LinkButton ID="rejectJobLinkBtn" CssClass="btn btn-danger btn-circle btn-block" Text="Reject" runat="server" CommandArgument='<%#Eval ("JobListingID") %>' OnCommand="rejectJobLinkBtn_Click"></asp:LinkButton>
                                <asp:LinkButton ID="moreInfoJobLinkBtn" CssClass="btn btn-warning btn-circle btn-block" Text="View More" runat="server" CommandArgument='<%#Eval ("JobListingID") %>' OnCommand="moreInfoJobLinkBtn_Click"></asp:LinkButton>
                            </ItemTemplate>
                            
                        </asp:TemplateField>
                    </Columns>
                    <RowStyle CssClass="cursor-pointer" />
                </asp:GridView>


            </div>

            <div class="form-group col-md-6">
                <label class="form-control-lg font-weight-bold" for="ScholarshipOpportunity">Scholarships to Approve</label>
                <asp:SqlDataSource ID="ScholarshipOpportunity" runat="server" ConnectionString="<%$ ConnectionStrings:DBConnectionString %>" SelectCommand="SELECT Scholarship.ScholarshipID, Scholarship.ScholarshipName, Organization.OrganizationName FROM Scholarship INNER JOIN Organization ON Scholarship.OrganizationID = Organization.OrganizationEntityID where approved = 'P'"></asp:SqlDataSource>
                <asp:GridView ID="GridView2" runat="server" CssClass="table table-hover table-striped table-dark" Style="border-collapse: collapse; width: auto;" AutoGenerateColumns="False" DataKeyNames="ScholarshipID" DataSourceID="ScholarshipOpportunity" BackColor="#102B40" ForeColor="White">
                    <Columns>
                        <asp:BoundField DataField="ScholarshipID" InsertVisible="false" ReadOnly="true" />
                        <asp:BoundField DataField="ScholarshipName" HeaderText="Scholarship Name" InsertVisible="False" ReadOnly="True" />
                        <asp:BoundField DataField="OrganizationName" HeaderText="Organization Name" InsertVisible="False" ReadOnly="True" />
                        <asp:TemplateField ShowHeader="False">
                            <ItemTemplate>
                                <asp:LinkButton ID="LinkButton2" CssClass="btn btn-success btn-circle btn-block" Text="Approve" runat="server" CommandArgument='<%#Eval ("ScholarshipID") %>' OnCommand="LinkButton2_Click"></asp:LinkButton>
                                <asp:LinkButton ID="LinkButton3" CssClass="btn btn-danger btn-circle btn-block" Text="Reject" runat="server" CommandArgument='<%#Eval ("ScholarshipID") %>' OnCommand="LinkButton3_Click"></asp:LinkButton>
                                <asp:LinkButton ID="LinkButton1" CssClass="btn btn-warning btn-circle btn-block"  Text="View More" runat="server" CommandArgument='<%#Eval ("ScholarshipID") %>' OnCommand="LinkButton1_Click"></asp:LinkButton>
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
            <%--Job Approve Modal--%>
            <div class="modal fade" id="approveXModal" role="dialog">
                <div class="modal-dialog">
                    <!-- Modal content-->
                    <div class="modal-content">
                        <div class="modal-header">
                            <div class="col-md-12 text-center">
                                <div class="modal-title">
                                    <i class="fas fa-check fa-4x progress-bar-animated rotateIn"></i>
                                    <br>
                                    <br>
                                    <h5>Are you sure you want to approve?</h5>
                                </div>
                            </div>
                            
                        </div>
                        <div class="modal-body" style="background-color: #4F79A3;">
                            <div class="col-lg-12 col-sm-12 col-md-12 col-xs-12 text-center">
                                <div class="form-group">
                                    <asp:Label ID="Label2" runat="server" Style="color: white; font-family: 'Poppins', sans-serif; font-size: 2.1em; font-weight: bold;"></asp:Label>
                                </div>
                                <div class="col-lg-12 col-sm-12 col-md-12 col-xs-12 text-center">
                                    <asp:Label ID="sublabelapprovemodal" runat="server" Style="color: white; font-family: 'Poppins', sans-serif; font-size: 2.1em; font-weight: bold;"></asp:Label>
                                </div>
                            </div>
                        </div>
                        <div class="modal-footer">
                            <div class="flex-center" style="text-align: center !important; margin: auto !important;">
                                <asp:Button ID="Button3" runat="server" Text="Message Organization" Style="background-color: #102B3F; color: #fff; width: 200px; height: 60px;" CssClass="btn btn-circle" OnClick="Button3_Click1" />
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
            <%--Job Reject Modal--%>
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
                            
                        </div>

                        <div class="modal-body" style="background-color: #4F79A3;">
                            <div class="col-lg-12 col-sm-12 col-md-12 col-xs-12 text-center">
                                <div class="form-group">
                                    <asp:Label ID="Label3" runat="server" Style="color: white; font-family: 'Poppins', sans-serif; font-size: 2.1em; font-weight: bold;"></asp:Label>
                                </div>
                                <div class="col-lg-12 col-sm-12 col-md-12 col-xs-12 text-center">
                                    <asp:Label ID="rejectjobsublabel" runat="server" Style="color: white; font-family: 'Poppins', sans-serif; font-size: 2.1em; font-weight: bold;"></asp:Label>
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
            <%-- Scholarship More Info Modal--%>
            <div class="modal fade" id="jobMoreInfoModal" role="dialog">
                <div class="modal-dialog">
                    <!-- Modal content-->
                    <div class="modal-content">
                        <div class="modal-header">
                            <div class ="col-md-12 text-center">
                            <div class="modal-title">
                                <i class="fas fa-info-circle fa-4x progress-bar-animated rotateIn"></i>
                                <br />
                                <br />
                                <%--<h5>More Information</h5>--%>
                                <asp:Label ID="Label1" Style="color: black; font-family: 'Poppins', sans-serif; font-size: 1.4em; font-weight: bold" runat="server" Text="More Information"></asp:Label>
                                <asp:Label ID="lblScholarshipName" Style="color: black; font-family: 'Poppins', sans-serif; font-size: 1.4em; font-weight: bold" runat="server"></asp:Label>
                            </div>
                            </div>
                            
                        </div>
                        <div class="modal-body" style="background-color: #4F79A3;">
                            <div class="col-lg-12 col-sm-12 col-md-12 col-xs-12 text-left">
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
                                <i class="fas fa-info-circle fa-4x progress-bar-animated rotateIn"></i>
                                <br />
                                <br />
                                <%--<h5>More Information</h5>--%>
                                <asp:Label ID="Label4" Style="color: black; font-family: 'Poppins', sans-serif; font-size: 1.4em; font-weight: bold" runat="server" Text="More Information"></asp:Label>
                                <br />
                                <asp:Label ID="lblJobName" Style="color: black; font-family: 'Poppins', sans-serif; font-size: 1.4em; font-weight: bold" runat="server"></asp:Label>
                            </div>
                            </div>
                            
                        </div>
                        <div class="modal-body" style="background-color: #4F79A3;">
                            <div class="col-lg-12 col-sm-12 col-md-12 col-xs-12 text-left">
                                <div class="form-group">
                                    <asp:Label ID="lblJOrganizationName" Style="color: white; font-family: 'Poppins', sans-serif; font-size: 1.2em;" runat="server" ForeColor="White"></asp:Label>
                                    <br />
                                    <asp:Label ID="lblJOrganizationDescription" Style="color: white; font-family: 'Poppins', sans-serif; font-size: 1.2em;" runat="server" ForeColor="White"></asp:Label>
                                    <br />
                                    <asp:Label ID="lblJobType" Style="color: white; font-family: 'Poppins', sans-serif; font-size: 1.2em;" runat="server" ForeColor="White"></asp:Label>
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
            <%--Scholarship Approve Modal--%>
            <div class="modal fade" id="approveSModal" role="dialog">
                <div class="modal-dialog">
                    <!-- Modal content-->
                    <div class="modal-content">
                        <div class="modal-header">
                            <div class="col-md-12 text-center">
                                <div class="modal-title">
                                    <i class="fas fa-check fa-4x progress-bar-animated rotateIn"></i>
                                    <br>
                                    <br>
                                    <h5>Are you sure you want to approve?</h5>
                                </div>
                            </div>
                        
                                </div>
                                <div class="modal-body" style="background-color: #4F79A3;">
                                    <div class="col-lg-12 col-sm-12 col-md-12 col-xs-12 text-center">
                                        <div class="form-group">
                                            <asp:Label ID="scholarApproveLabel" runat="server" Style="color: white; font-family: 'Poppins', sans-serif; font-size: 2.1em; font-weight: bold;"></asp:Label>
                                        </div>
                                        <div class="col-lg-12 col-sm-12 col-md-12 col-xs-12 text-center">
                                           <asp:Label ID="subscholarApproveLabel" runat="server" Style="color: white; font-family: 'Poppins', sans-serif; font-size: 2.1em; font-weight: bold;"></asp:Label>
                                            </div>
                                    </div>
                                </div>
                                <div class="modal-footer">
                                   <div class="flex-center" style="text-align: center !important; margin: auto !important;">
                                    <asp:Button ID="acceptScholarshipButton" runat="server" Text="Approve" Style="background-color: #102B3F; color: #fff; width: 200px; height: 60px;" CssClass="btn btn-circle" OnClick="acceptScholarshipButton_Click" />
                                    <button type="button" Style="background-color: #102B3F; color: #fff; width: 100px; height: 60px;" class="btn btn-circle" data-dismiss="modal">Close</button>
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
        

        <div>



            <%--Scholarship Reject Modal--%>
            <div class="modal fade" id="rejectSModal" role="dialog">
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
                            <asp:Button ID="rejectScholarshipButton" runat="server" Text="Reject" Style="background-color: #102B3F; color: #fff; width: 100px; height: 60px;" CssClass="btn btn-circle" OnClick="rejectScholarshipButton_Click" />
                            <button type="button" style="background-color: #102B3F; color: #fff; width: 100px; height: 60px;" class="btn btn-circle" data-dismiss="modal">Close</button>
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
        </div>
    </form>

</asp:Content>

