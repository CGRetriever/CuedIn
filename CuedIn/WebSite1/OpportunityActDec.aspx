<%@ Page Title="" Language="C#" MasterPageFile="~/SchoolMaster.master" AutoEventWireup="true" CodeFile="OpportunityActDec.aspx.cs" Inherits="OpportunityActDec" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

      <div class='tableauPlaceholder' id='viz1552846592803' style='position: relative'><noscript><a href='#'><img alt=' ' src='https:&#47;&#47;public.tableau.com&#47;static&#47;images&#47;Ap&#47;ApprovalDashboard_CuedIn_Dark&#47;Dashboard1&#47;1_rss.png' style='border: none' /></a></noscript><object class='tableauViz'  style='display:none;'><param name='host_url' value='https%3A%2F%2Fpublic.tableau.com%2F' /> <param name='embed_code_version' value='3' /> <param name='site_root' value='' /><param name='name' value='ApprovalDashboard_CuedIn_Dark&#47;Dashboard1' /><param name='tabs' value='no' /><param name='toolbar' value='yes' /><param name='static_image' value='https:&#47;&#47;public.tableau.com&#47;static&#47;images&#47;Ap&#47;ApprovalDashboard_CuedIn_Dark&#47;Dashboard1&#47;1.png' /> <param name='animate_transition' value='yes' /><param name='display_static_image' value='yes' /><param name='display_spinner' value='yes' /><param name='display_overlay' value='yes' /><param name='display_count' value='yes' /></object></div>                <script type='text/javascript'>                    var divElement = document.getElementById('viz1552846592803');                    var vizElement = divElement.getElementsByTagName('object')[0];                    vizElement.style.width='1540px';vizElement.style.height='307px';                    var scriptElement = document.createElement('script');                    scriptElement.src = 'https://public.tableau.com/javascripts/api/viz_v1.js';                    vizElement.parentNode.insertBefore(scriptElement, vizElement);                </script>
      <form id="form1" runat="server">
      <div class="form-row">
    <div class="form-group col-md-6">
      <label Class="form-control-lg font-weight-bold" for="inputJobs">Jobs to Approve </label>
        <asp:SqlDataSource ID="JobOpportunity" runat="server" ConnectionString="<%$ ConnectionStrings:DBConnectionString %>" SelectCommand="SELECT JobListing.JobTitle, Organization.OrganizationName, JobListing.JobListingID FROM JobListing INNER JOIN Organization ON JobListing.OrganizationID = Organization.OrganizationEntityID where joblisting.approved = 'pen'"></asp:SqlDataSource>
        <%--Set this so it's only selecting job opportunities that are pending--%>
        <%--Get rid of Job ID eventually- for now we need it for the DB update?--%>
        <asp:GridView ID="GridView1" runat="server" CssClass="table table-hover table-striped " style="border-collapse:collapse;" AutoGenerateColumns="False" DataKeyNames="JobListingID" DataSourceID="JobOpportunity" CellPadding="1"  OnRowCommand="GridView1_OnRowCommand" BackColor="#102B40" ForeColor="White">
            <Columns>
                
                <asp:BoundField DataField="JobTitle" HeaderText="Job Title" InsertVisible="False" ReadOnly="True" />
                <asp:BoundField DataField="OrganizationName" HeaderText="Organization Name" />
                     <asp:TemplateField ShowHeader="False" HeaderStyle-BorderColor="Black">
            <ItemTemplate>
                <asp:Button  ID="ApproveButton" runat="server" CausesValidation="false"  
                    Text="Approve" CssClass="btn btn-success btn-circle" CommandName ="JApprove" CommandArgument='<%#Eval ("JobListingID") %>'/>
                <asp:Button ID="Reject" runat="server" CausesValidation="false" 
                    Text="Reject" CssClass="btn btn-danger btn-circle" CommandName ="JReject" CommandArgument='<%#Eval ("JobListingID") %>' />
                <asp:Button ID="ViewMoreButton" runat="server" CausesValidation="false" 
                    Text="View More" CssClass="btn btn-warning btn-circle" CommandName = "JViewMore" CommandArgument='<%#Eval ("JobListingID") %>'/>
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
                <asp:Button  ID="ApproveButton" runat="server" CausesValidation="false" 
                    Text="Approve" CssClass="btn btn-success btn-circle" CommandName ="SApprove" CommandArgument='<%#Eval ("ScholarshipID") %>' />
                <asp:Button ID="Reject" runat="server" CausesValidation="false" 
                    Text="Reject" CssClass="btn btn-danger btn-circle" CommandName ="SReject" CommandArgument='<%#Eval ("ScholarshipID") %>' />
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

          <asp:Button ID="Button1" runat="server" Text="Button" />

<div>
        <div class="modal fade" id="myModal" role="dialog">
            <div class="modal-dialog">
                <!-- Modal content-->
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal">
                            &times;</button>
                        <h4 class="modal-title">
                            Student Fee Details</h4>
                    </div>
                    <div class="modal-body">
                        <div class="col-lg-12 col-sm-12 col-md-12 col-xs-12">
                            <div class="form-group">
                                <asp:Label ID="lblstudent" runat="server" Text="Aadmission No: "></asp:Label>
                                <asp:Label ID="lblstudentid" runat="server" Text=""></asp:Label>
                            </div>
                            <div class="form-group">
                                <asp:Label ID="Label1" runat="server" Text="Month"></asp:Label>
                                <asp:Label ID="lblmonth" runat="server" Text=""></asp:Label>
                            </div>
                            <div class="form-group">
                                <asp:Label ID="Label2" runat="server" Text="Amount"></asp:Label>
                                <asp:TextBox ID="txtAmount" runat="server" TabIndex="3" MaxLength="75" CssClass="form-control"
                                    placeholder="Enter Amount"></asp:TextBox>
                            </div>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <asp:Button ID="btnSave" runat="server" Text="Pay" CssClass="btn btn-info" />
                        <button type="button" class="btn btn-info" data-dismiss="modal">
                            Close</button>
                    </div>
                </div>
            </div>
            <script type='text/javascript'>
                function openModal() {
                    $('[id*=myModal]').modal('show');
                } 
            </script>
        </div>
    </div>


</form>
</asp:Content>

