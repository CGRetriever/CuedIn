<%@ Page Title="" Language="C#" MasterPageFile="~/Teacher.master" AutoEventWireup="true" CodeFile="UploadToDatabase.aspx.cs" Inherits="UploadToDatabase" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

        <form id="form1" runat="server">  
    <div class="container">  
        <asp:FileUpload ID="FileUpload1" runat="server" />  
        <asp:Button ID="btnUpload" runat="server" Text="Upload" OnClick="Upload" CssClass="btn-primary" />  
        <hr />  
        <asp:GridView ID="GridView1" runat="server"   
              
            AutoGenerateColumns="false" CssClass="table">  
            <Columns>  
                <asp:BoundField DataField="Name" HeaderText="File Name" />  
                <asp:TemplateField ItemStyle-HorizontalAlign="Center">  
                    <ItemTemplate>  
                        <asp:LinkButton ID="lnkDownload" runat="server" Text="Download" OnClick="DownloadFile"  
                            CommandArgument='<%# Eval("Id") %>'></asp:LinkButton>  
                    </ItemTemplate>  
                </asp:TemplateField>  
            </Columns>  
        </asp:GridView>  
    </div>  
    </form> 

</asp:Content>

