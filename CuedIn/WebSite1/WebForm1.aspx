<%@ Page Title="" Language="C#" MasterPageFile="~/Teacher.master" AutoEventWireup="true" CodeFile="WebForm1.aspx.cs" Inherits="WebForm1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <form id="form1" runat="server">
            <div align="center">
&nbsp;<asp:FileUpload ID="FileUpload1" runat="server" BorderColor="#003366" BorderWidth="1px" ForeColor="#003366" />
        <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Upload" />
        <br />
        
        <div class="container col-md-4">
        <asp:GridView ID="GridView1" runat="server" CssClass="table table-hover table-striped table-dark table-responsive" style="border-collapse:collapse;background-size:initial;width:auto" AutoGenerateColumns="False" CellPadding="1" BackColor="#102B40" ForeColor="White" OnRowCommand="GridView1_RowCommand">
            <Columns>
                <asp:TemplateField HeaderText="File" ItemStyle-Font-Underline="true">
                    <ItemTemplate>
                        <asp:LinkButton ID="LinkButton1" runat="server" CommandArgument='<%# Eval("File") %>' CommandName="Download" Text='<%# Eval("File") %>'></asp:LinkButton>
                    </ItemTemplate>
                </asp:TemplateField>

                <asp:BoundField DataField="Size" HeaderText="Size In Bytes" />
                <asp:BoundField DataField="Type" HeaderText="File Type" />
            </Columns>
                        <RowStyle CssClass="cursor-pointer" />

        </asp:GridView>
            <br />

            </div>

    </form>
</asp:Content>

