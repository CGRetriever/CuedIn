<%@ Page Title="" Language="C#" MasterPageFile="~/SchoolMaster.master" AutoEventWireup="true" CodeFile="OpportunityActDec.aspx.cs" Inherits="OpportunityActDec" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
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
                <asp:Button ID="ApproveButton" runat="server" CausesValidation="false"  
                    Text="Approve" CssClass="btn-success" CommandName ="JApprove" CommandArgument='<%#Eval ("JobListingID") %>'/>
                <asp:Button ID="Reject" runat="server" CausesValidation="false" 
                    Text="Reject" CssClass="btn-danger" CommandName ="JReject" CommandArgument='<%#Eval ("JobListingID") %>' />
                <asp:Button ID="ViewMoreButton1" runat="server" CausesValidation="false" 
                    Text="View More" CssClass="btn-primary" />
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
                <asp:Button ID="ApproveButton" runat="server" CausesValidation="false" 
                    Text="Approve" CssClass="btn-success" CommandName ="SApprove" CommandArgument='<%#Eval ("ScholarshipID") %>' />
                <asp:Button ID="Reject" runat="server" CausesValidation="false" 
                    Text="Reject" CssClass="btn-danger" CommandName ="SReject" CommandArgument='<%#Eval ("ScholarshipID") %>' />
                <asp:Button ID="ViewMoreButton" runat="server" CausesValidation="false" 
                    Text="View More" CssClass="btn-primary"/>
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

