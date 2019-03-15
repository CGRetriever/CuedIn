<%@ Page Title="" Language="C#" MasterPageFile="~/SchoolMaster.master" AutoEventWireup="true" CodeFile="OpportunityActDec.aspx.cs" Inherits="OpportunityActDec" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
      <div class="form-row">
    <div class="form-group col-md-6">
      <label for="inputJobs">Jobs to Approve </label>
        <asp:SqlDataSource ID="JobOpportunity" runat="server" ConnectionString="<%$ ConnectionStrings:DBConnectionString %>" SelectCommand="SELECT [OpportunityID], [OpportunityType] FROM [OpportunityEntity]"></asp:SqlDataSource>
        <asp:GridView ID="GridView1" runat="server" CssClass="table table-hover table-striped" style="border-collapse:collapse;" AutoGenerateColumns="False" DataKeyNames="OpportunityID" DataSourceID="JobOpportunity">
            <Columns>
                <asp:BoundField DataField="OpportunityID" HeaderText="OpportunityID" InsertVisible="False" ReadOnly="True" SortExpression="OpportunityID" />
                <asp:BoundField DataField="OpportunityType" HeaderText="OpportunityType" SortExpression="OpportunityType" />
                     <asp:TemplateField ShowHeader="False">
            <ItemTemplate>
                <asp:Button ID="ApproveButton" runat="server" CausesValidation="false" 
                    Text="Approve" CssClass="btn-success" />
                <asp:Button ID="Reject" runat="server" CausesValidation="false" 
                    Text="Reject" CssClass="btn-danger" />
                <asp:Button ID="ViewMoreButton" runat="server" CausesValidation="false" 
                    Text="View More" CssClass="btn-primary"/>
            </ItemTemplate>
        </asp:TemplateField>
            </Columns>
            <RowStyle CssClass="cursor-pointer" />

        </asp:GridView>
    </div>
          
    <div class="form-group col-md-6">
      <label for="ScholarshipOpportunity">Scholarships to Approve</label>
        <asp:SqlDataSource ID="ScholarshipOpportunity" runat="server"></asp:SqlDataSource>
              <asp:GridView ID="GridView2" runat="server" CssClass="table table-hover table-striped" style="border-collapse:collapse;" AutoGenerateColumns="False" DataKeyNames="OpportunityID" DataSourceID="JobOpportunity">
            <Columns>
                <asp:BoundField DataField="OpportunityID" HeaderText="OpportunityID" InsertVisible="False" ReadOnly="True" SortExpression="OpportunityID" />
                <asp:BoundField DataField="OpportunityType" HeaderText="OpportunityType" SortExpression="OpportunityType" />
                     <asp:TemplateField ShowHeader="False">
            <ItemTemplate>
                <asp:Button ID="ApproveButton" runat="server" CausesValidation="false" 
                    Text="Approve" CssClass="btn-success" />
                <asp:Button ID="Reject" runat="server" CausesValidation="false" 
                    Text="Reject" CssClass="btn-danger" />
                <asp:Button ID="ViewMoreButton" runat="server" CausesValidation="false" 
                    Text="View More" CssClass="btn-primary"/>
            </ItemTemplate>
        </asp:TemplateField>
            </Columns>
            <RowStyle CssClass="cursor-pointer" />

        </asp:GridView>

    </div>
  </div>
</asp:Content>

