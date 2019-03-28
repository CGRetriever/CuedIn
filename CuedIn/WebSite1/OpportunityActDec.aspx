<%@ Page Title="" Language="C#" MasterPageFile="~/SchoolMaster.master" AutoEventWireup="true" CodeFile="OpportunityActDec.aspx.cs" Inherits="OpportunityActDec" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <link rel="stylesheet" type="text/css" href="css/style.css">
        <div class='tableauPlaceholder' id='viz1553211444276' style='position: relative'><noscript><a href='#'><img alt=' ' src='https:&#47;&#47;public.tableau.com&#47;static&#47;images&#47;Ap&#47;ApprovalDashboard_CuedIn_Dark_Extra_Large_Device&#47;Dashboard1&#47;1_rss.png' style='border: none' /></a></noscript><object class='tableauViz'  style='display:none;'><param name='host_url' value='https%3A%2F%2Fpublic.tableau.com%2F' /> <param name='embed_code_version' value='3' /> <param name='site_root' value='' /><param name='name' value='ApprovalDashboard_CuedIn_Dark_Extra_Large_Device&#47;Dashboard1' /><param name='tabs' value='no' /><param name='toolbar' value='yes' /><param name='static_image' value='https:&#47;&#47;public.tableau.com&#47;static&#47;images&#47;Ap&#47;ApprovalDashboard_CuedIn_Dark_Extra_Large_Device&#47;Dashboard1&#47;1.png' /> <param name='animate_transition' value='yes' /><param name='display_static_image' value='yes' /><param name='display_spinner' value='yes' /><param name='display_overlay' value='yes' /><param name='display_count' value='yes' /></object></div>                <script type='text/javascript'>                    var divElement = document.getElementById('viz1553211444276');                    var vizElement = divElement.getElementsByTagName('object')[0];                    vizElement.style.minWidth='1200px';vizElement.style.maxWidth='2560px';vizElement.style.width='100%';vizElement.style.height='307px';                    var scriptElement = document.createElement('script');                    scriptElement.src = 'https://public.tableau.com/javascripts/api/viz_v1.js';                    vizElement.parentNode.insertBefore(scriptElement, vizElement);                </script>

      <form id="form1" runat="server">
      <div class="form-row">
    <div class="form-group col-md-6">
      <label Class="form-control-lg font-weight-bold" for="inputJobs">Jobs to Approve </label>
        <asp:SqlDataSource ID="JobOpportunity" runat="server" ConnectionString="<%$ ConnectionStrings:DBConnectionString %>" SelectCommand="SELECT JobListing.JobTitle, Organization.OrganizationName, JobListing.JobListingID FROM JobListing INNER JOIN Organization ON JobListing.OrganizationID = Organization.OrganizationEntityID where joblisting.approved = 'pen'"></asp:SqlDataSource>
        <%--Get rid of Job ID eventually- for now we need it for the DB update?--%>
        <asp:GridView ID="GridView1" runat="server" CssClass="table table-hover table-striped " style="border-collapse:collapse;" AutoGenerateColumns="False" DataKeyNames="JobListingID" DataSourceID="JobOpportunity" CellPadding="1" BackColor="#102B40" ForeColor="White">
            <Columns>
                
                <asp:BoundField DataField="JobTitle" HeaderText="Job Title" InsertVisible="False" ReadOnly="True" />
                <asp:BoundField DataField="OrganizationName" HeaderText="Organization Name" />
                     <asp:TemplateField ShowHeader="False" HeaderStyle-BorderColor="Black">
            <ItemTemplate>
                <asp:LinkButton  ID="approveJobLinkBtn" CssClass="btn btn-success btn-circle" Text="Approve" runat="server" CommandArgument='<%#Eval ("JobListingID") %>' OnCommand="approveJobLinkBtn_Click"></asp:LinkButton>
                <asp:LinkButton  ID="rejectJobLinkBtn" CssClass="btn btn-danger btn-circle" Text="Reject" runat="server" CommandArgument='<%#Eval ("JobListingID") %>' OnCommand="rejectJobLinkBtn_Click"></asp:LinkButton>
                <asp:LinkButton ID="moreInfoJobLinkBtn" CssClass="btn btn-warning btn-circle" Text="View More" runat="server" CommandArgument='<%#Eval ("JobListingID") %>' OnCommand="moreInfoJobLinkBtn_Click"></asp:LinkButton>
            </ItemTemplate>

<HeaderStyle BorderColor="Black"></HeaderStyle>
        </asp:TemplateField>
            </Columns>
            <RowStyle CssClass="cursor-pointer" />
        </asp:GridView>


    </div>
        
    <div class="form-group col-md-6">
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
                           <h5> Are you sure you want to approve?</h5>
                        </div>
                            </div>
                        <button type="button" class="close" data-dismiss="modal">
                            &times;</button>
                    </div>
                    <div class="modal-body" style="background-color: #4F79A3;">
                        <div class="col-lg-12 col-sm-12 col-md-12 col-xs-12 text-center">
                            <div class="form-group">
                                <asp:Label ID="Label2" runat="server" style="color:white;font-family: 'Poppins', sans-serif; font-size: 2.1em; font-weight:bold;" Text="Ashby Animal Clinic"></asp:Label>
                            </div>
                            <div class="col-lg-12 col-sm-12 col-md-12 col-xs-12 text-center">
                                <h4 style="color:white;font-family: 'Poppins', sans-serif; font-weight:bold;">Receptionist</h4>
                                </div>
                        </div>
                    </div>
                      <div class="modal-footer">
                        <div class="flex-center" style= "text-align:center !important; margin:auto !important;">
                        <asp:Button ID="Button3" runat="server" Text="Message Organization" style="background-color:#102B3F;color:#fff; width:200px; height:60px;" CssClass="btn btn-circle" OnClick="Button3_Click1"  />
                        <asp:Button ID="Button1" runat="server" Text="Approve" style="background-color:#102B3F;color:#fff; width:100px; height:60px;" CssClass="btn btn-circle" OnClick ="acceptJobButton_Click"/>
                        <button type="button" style="background-color:#102B3F;color:#fff; width:100px; height:60px;"  Class="btn btn-circle"data-dismiss="modal">Close</button>
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
                           <h5> Are you sure you want to reject?</h5>
                        </div>
                            </div>
                        <button type="button" class="close" data-dismiss="modal">
                            &times;</button>
                    </div>
                    
                    <div class="modal-body" style="background-color: #4F79A3;">
                        <div class="col-lg-12 col-sm-12 col-md-12 col-xs-12 text-center">
                            <div class="form-group">
                                <asp:Label ID="Label3" runat="server" style="color:white;font-family: 'Poppins', sans-serif; font-size: 2.1em; font-weight:bold;" Text="Ashby Animal Clinic"></asp:Label>
                            </div>
                            <div class="col-lg-12 col-sm-12 col-md-12 col-xs-12 text-center">
                                <h4 style="color:white;font-family: 'Poppins', sans-serif; font-weight:bold;">Receptionist</h4>
                                </div>

                        </div>
                    </div>
                    <div class="modal-footer">
                        <div class="flex-center" style= "text-align:center !important; margin:auto !important;">
                        <asp:Button ID="Button2" runat="server" Text="Reject" style="background-color:#102B3F;color:#fff; width:100px; height:60px;" CssClass="btn btn-circle" OnClick ="rejectJobButton_Click"/>
                        <button type="button"style="background-color:#102B3F;color:#fff; width:100px; height:60px; " Class="btn btn-circle"data-dismiss="modal">Close</button>
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
                         <h4 class="modal-title">
                            More Information</h4>
                        <button type="button" class="close" data-dismiss="modal">
                            &times;</button>
                    </div>
                    <div class="modal-body">
                        <div class="col-lg-12 col-sm-12 col-md-12 col-xs-12">
                            <div class="form-group">
                                <asp:Label ID="lblSOrganizationName" runat="server"></asp:Label> <br />
                                <asp:Label ID="lblSOrganizationDescription" runat="server"></asp:Label> <br />
                                <asp:Label ID="lblScholarshipName" runat="server"></asp:Label> <br />
                                <asp:Label ID="lblScholarshipDescription" runat="server"></asp:Label> <br />
                                <asp:Label ID="lblScholarshipMin" runat="server"></asp:Label> <br />
                                <asp:Label ID="lblScholarshipMax" runat="server"></asp:Label> <br />
                                <asp:Label ID="lblScholarshipQuantity" runat="server"></asp:Label> <br />
                                <asp:Label ID="lblScholarshipDueDate" runat="server"></asp:Label> <br />

                            </div>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" Class="btn btn-warning btn-circle" data-dismiss="modal"> Close</button>
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
                         <h4 class="modal-title">
                            More Information</h4>
                        <button type="button" class="close" data-dismiss="modal">
                            &times;</button>
                    </div>
                    <div class="modal-body">
                        <div class="col-lg-12 col-sm-12 col-md-12 col-xs-12">
                            <div class="form-group">
                                <asp:Label ID="lblJobTitle" runat="server"></asp:Label> <br />
                                <asp:Label ID ="lblJobDescription" runat="server"></asp:Label> <br />
                                <asp:Label ID="lblJobType" runat="server"></asp:Label> <br />
                                <asp:Label ID="lblJobLocation" runat="server"></asp:Label> <br />
                                <asp:Label ID="lblJobDeadline" runat="server"></asp:Label> <br />
                                <asp:Label ID="lblNumOfApplicants" runat="server"></asp:Label> <br />
                                <asp:Label ID="lblJOrganizationName" runat="server"></asp:Label> <br />
                                <asp:Label ID ="lblJOrganizationDescription" runat="server"></asp:Label> <br />
                            
                            </div>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" Class="btn btn-warning btn-circle" data-dismiss="modal"> Close</button>
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
                        <h4 class="modal-title">
                            Approve Scholarship</h4>
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
                        <asp:Button ID="acceptScholarshipButton" runat="server" Text="Approve" CssClass="btn btn-success btn-circle" OnClick ="acceptScholarshipButton_Click"/>
                        <button type="button" Class="btn btn-warning btn-circle"data-dismiss="modal">Close</button>
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
                        <h4 class="modal-title">
                            Reject Scholarship</h4>
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
                        <asp:Button ID="rejectScholarshipButton" runat="server" Text="Reject" CssClass="btn btn-danger btn-circle" OnClick ="rejectScholarshipButton_Click"/>
                        <button type="button" Class="btn btn-warning btn-circle"data-dismiss="modal">Close</button>
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

