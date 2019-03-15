<%@ Page Title="" Language="C#" MasterPageFile="~/SchoolMaster.master" AutoEventWireup="true" CodeFile="JobPostings.aspx.cs" Inherits="JobPostings" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    
    <form id="form1" runat="server">
    
    <asp:GridView ID="jobPosting" runat="server" DataSourceID="jobPostingDB" AutoGenerateColumns="False">
        <Columns>
            <asp:TemplateField ItemStyle-CssClass="card-body card-body-cascade text-center">
                <ItemTemplate> 
                    <asp:Image ID="image" runat="server" ImageURL= CssClass="card-img-top" />
                    <asp:Label ID ="company" runat="server" Text='<%# Bind("OrganizationName")%>' CssClass="h4"></asp:Label>
                    <br />
                    <asp:Label ID="subtitle" runat="server" Text='<%# Bind ("JobTitle")%>' CssClass="font-weight-bold indigo-text py-2 h6"></asp:Label>
                    <br />
                    <asp:Label ID="text" runat="server" Text='<%# Bind("JobDescription")%>' CssClass="p-0"></asp:Label>

                </ItemTemplate>
            </asp:TemplateField>
                        
        </Columns>
    </asp:GridView>

        <asp:SqlDataSource ID="jobPostingDB" runat="server" ConnectionString="<%$ ConnectionStrings:DBConnectionString %>" SelectCommand="SELECT JobListing.JobTitle, JobListing.JobDescription, Organization.OrganizationName FROM JobListing INNER JOIN Organization ON JobListing.OrganizationID = Organization.OrganizationEntityID WHERE UPPER(JobListing.Approved) = 'YES'"></asp:SqlDataSource>


   
    </form>
   
</asp:Content>

