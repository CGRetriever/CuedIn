<%@ Page Title="" Language="C#" MasterPageFile="~/SchoolMaster.master" AutoEventWireup="true" CodeFile="JobPostings.aspx.cs" Inherits="JobPostings" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    
    <form id="form1" runat="server">
    
    <asp:Table ID="jobPostingTable" runat="server" OnLoad="jobPostingTable_Load" Width="100%" > </asp:Table>
   
    </form>
   
</asp:Content>

