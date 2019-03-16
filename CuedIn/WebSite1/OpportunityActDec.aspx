<%@ Page Title="" Language="C#" MasterPageFile="~/SchoolMaster.master" AutoEventWireup="true" CodeFile="OpportunityActDec.aspx.cs" Inherits="OpportunityActDec" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

      <div class='tableauPlaceholder' id='viz1552756250690' style='position: relative'><noscript><a href='#'><img alt=' ' src='https:&#47;&#47;public.tableau.com&#47;static&#47;images&#47;Ap&#47;ApprovalDashboard_CuedIn&#47;Dashboard1&#47;1_rss.png' style='border: none' /></a></noscript><object class='tableauViz'  style='display:none;'><param name='host_url' value='https%3A%2F%2Fpublic.tableau.com%2F' /> <param name='embed_code_version' value='3' /> <param name='site_root' value='' /><param name='name' value='ApprovalDashboard_CuedIn&#47;Dashboard1' /><param name='tabs' value='no' /><param name='toolbar' value='yes' /><param name='static_image' value='https:&#47;&#47;public.tableau.com&#47;static&#47;images&#47;Ap&#47;ApprovalDashboard_CuedIn&#47;Dashboard1&#47;1.png' /> <param name='animate_transition' value='yes' /><param name='display_static_image' value='yes' /><param name='display_spinner' value='yes' /><param name='display_overlay' value='yes' /><param name='display_count' value='yes' /></object></div>                <script type='text/javascript'>                    var divElement = document.getElementById('viz1552756250690');                    var vizElement = divElement.getElementsByTagName('object')[0];                    vizElement.style.width='1540px';vizElement.style.height='307px';                    var scriptElement = document.createElement('script');                    scriptElement.src = 'https://public.tableau.com/javascripts/api/viz_v1.js';                    vizElement.parentNode.insertBefore(scriptElement, vizElement);                </script>
      <form id="form1" runat="server">
      <div class="form-row">
    <div class="form-group col-md-6">
      <label for="inputJobs">Jobs to Approve </label>
        <asp:SqlDataSource ID="JobOpportunity" runat="server" ConnectionString="<%$ ConnectionStrings:DBConnectionString %>" SelectCommand="SELECT JobListing.JobTitle, Organization.OrganizationName, JobListing.JobListingID FROM JobListing INNER JOIN Organization ON JobListing.OrganizationID = Organization.OrganizationEntityID where joblisting.approved = 'pen'"></asp:SqlDataSource>
        <%--Set this so it's only selecting job opportunities that are pending--%>
        <%--Get rid of Job ID eventually- for now we need it for the DB update?--%>
        <asp:GridView ID="GridView1" runat="server" CssClass="table table-hover table-striped" style="border-collapse:collapse;" AutoGenerateColumns="False" DataKeyNames="JobListingID" DataSourceID="JobOpportunity" CellPadding="1"  OnRowCommand="GridView1_OnRowCommand">
            <Columns>
                
                <asp:BoundField DataField="JobTitle" HeaderText="Job Title" InsertVisible="False" ReadOnly="True" />
                <asp:BoundField DataField="OrganizationName" HeaderText="Organization Name" />
                     <asp:TemplateField ShowHeader="False" HeaderStyle-BorderColor="Black">
            <ItemTemplate>
                <asp:Button  ID="ApproveButton" runat="server" CausesValidation="false"  
                    Text="Approve" CssClass="btn-success" CommandName ="JApprove" CommandArgument='<%#Eval ("JobListingID") %>'/>
                <asp:Button ID="Reject" runat="server" CausesValidation="false" 
                    Text="Reject" CssClass="btn-danger" CommandName ="JReject" CommandArgument='<%#Eval ("JobListingID") %>' />
                <asp:Button ID="ViewMoreButton" runat="server" CausesValidation="false" 
                    Text="View More" CssClass="btn-primary" CommandName = "JViewMore" CommandArgument='<%#Eval ("JobListingID") %>'/>
            </ItemTemplate>

<HeaderStyle BorderColor="Black"></HeaderStyle>
        </asp:TemplateField>
            </Columns>
            <RowStyle CssClass="cursor-pointer" />
        </asp:GridView>


    </div>
        
    <div class="form-group col-md-6">
      <label for="ScholarshipOpportunity">Scholarships to Approve</label>
        <asp:SqlDataSource ID="ScholarshipOpportunity" runat="server" ConnectionString="<%$ ConnectionStrings:DBConnectionString %>" SelectCommand="SELECT Scholarship.ScholarshipID, Scholarship.ScholarshipName, Organization.OrganizationName FROM Scholarship INNER JOIN Organization ON Scholarship.OrganizationID = Organization.OrganizationEntityID where approved = 'pen'"></asp:SqlDataSource>
              <asp:GridView ID="GridView2" runat="server" CssClass="table table-hover table-striped" style="border-collapse:collapse;" AutoGenerateColumns="False" DataKeyNames="ScholarshipID" DataSourceID="ScholarshipOpportunity" OnRowCommand="GridView2_OnRowCommand">
            <Columns>
                <asp:BoundField DataField="ScholarshipName" HeaderText="Scholarship Name" InsertVisible="False" ReadOnly="True"  />
                <asp:BoundField DataField="OrganizationName" HeaderText="Organization Name" InsertVisible="False" ReadOnly="True"   />
                     <asp:TemplateField ShowHeader="False">
            <ItemTemplate>
                <asp:Button  ID="ApproveButton" runat="server" CausesValidation="false" 
                    Text="Approve" CssClass="btn-success" CommandName ="SApprove" CommandArgument='<%#Eval ("ScholarshipID") %>' />
                <asp:Button ID="Reject" runat="server" CausesValidation="false" 
                    Text="Reject" CssClass="btn-danger" CommandName ="SReject" CommandArgument='<%#Eval ("ScholarshipID") %>' />
                <asp:Button ID="ViewMoreButton" runat="server" CausesValidation="false" 
                    Text="View More" CssClass="btn-primary"  CommandName ="SViewMore" CommandArgument='<%#Eval ("ScholarshipID") %>' />
            </ItemTemplate>
        </asp:TemplateField>
            </Columns>
            <RowStyle CssClass="cursor-pointer" />
        </asp:GridView>
    </div>
    
        
  </div>

          <br />
          <br />
        
      </form>

</asp:Content>

