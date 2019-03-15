<%@ Page Title="" Language="C#" MasterPageFile="~/SchoolMaster.master" AutoEventWireup="true" CodeFile="JobPostings.aspx.cs" Inherits="JobPostings" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<asp:Table ID="tblJobPosting" runat="server"></asp:Table>

 <script type ="text/javascript">
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
   
</asp:Content>

