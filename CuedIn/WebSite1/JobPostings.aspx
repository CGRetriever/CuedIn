<%@ Page Title="" Language="C#" MasterPageFile="~/SchoolMaster.master" AutoEventWireup="true" CodeFile="JobPostings.aspx.cs" Inherits="JobPostings" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    
    <form id="form1" runat="server">
    
    <asp:GridView ID="jobPosting" runat="server" DataSourceID="jobPostingDB">
        <Columns>
            <asp:TemplateField ItemStyle-CssClass="card-body card-body-cascade text-center">
                <ItemTemplate> 
                    <asp:Image ID="image" runat="server" ImageURL="C:\Users\labpatron\Source\Repos\cued-in2\CuedIn\WebSite1\img\simplicity.jpg" CssClass="card-img-top" />
                    <asp:Label ID ="company" runat="server" Text='<%# Bind("OrganizationName")%>' CssClass="h4"></asp:Label>
                    <br />
                    <asp:Label ID="subtitle" runat="server" Text='<%# Bind ("JobTitle")%>' CssClass="font-weight-bold indigo-text py-2 h6"></asp:Label>
                    <br />
                    <asp:Label ID="text" runat="server" Text='<%# Bind("JobDescription")%>' CssClass="p-0"></asp:Label>

                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
    </asp:GridView>

        <asp:SqlDataSource ID="jobPostingDB" runat="server" ConnectionString="<%$ ConnectionStrings:DBConnectionString %>" SelectCommand="SELECT JobListing.JobTitle, JobListing.JobDescription, Organization.OrganizationName FROM JobListing INNER JOIN Organization ON JobListing.OrganizationID = Organization.OrganizationEntityID"></asp:SqlDataSource>

 <!--<script type ="text/javascript">
     function addCells() {
         var table = '';
         var rows = 2;
         var cols = 3;
         for (var i = 0; i < 5; i++) {
             table += '<tr>';
             for (var c = 1; c <= cols; c++) {
                 table += '<td>' + c + '</td>';
             }
             table += '</tr>';
         }
         document.write('<table border = 1>' + table + '</table>');
     }
 </script>   
     -->
   
    </form>
   
</asp:Content>

