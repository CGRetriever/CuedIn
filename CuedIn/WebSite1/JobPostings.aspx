<%@ Page Title="" Language="C#" MasterPageFile="~/SchoolMaster.master" AutoEventWireup="true" CodeFile="JobPostings.aspx.cs" Inherits="JobPostings" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">


    <head>
        <title>Job Postings</title>
        <meta http-equiv="x-ua-compatible" content="ie=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <meta name="description" content="">
        <meta name="author" content="">
        <meta name="keywords" content="">
        <!-- Font Awesome for icons - see https://fontawesome.com/v4.7.0/cheatsheet/ -->
        <link rel='stylesheet' href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
        <!-- Bootstrap CSS -->
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <!-- Custom CSS - update this if you use a name other than style.css for the Sass-generated CSS -->
        <link rel="stylesheet" href="css/style.css">
        <script defer src="https://use.fontawesome.com/releases/v5.0.13/js/solid.js" integrity="sha384-tzzSw1/Vo+0N5UhStP3bvwWPq+uvzCMfrN1fEFe+xBmv1C/AtVX5K0uZtmcHitFZ" crossorigin="anonymous"></script>
        <script defer src="https://use.fontawesome.com/releases/v5.0.13/js/fontawesome.js" integrity="sha384-6OIrr52G08NpOFSZdxxz1xdNSndlD4vdcf/q2myIUVO0VsqaGHJsB0RaBE01VTOY" crossorigin="anonymous"></script>
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.2/css/all.css" integrity="sha384-fnmOCqbTlWIlj8LyTjo7mOUStjsKC4pOpQbqyi7RrhN7udi9RwhKkMHpvLbHG9Sr" crossorigin="anonymous">
        <link rel='stylesheet' href='css/card.css'>
        <link rel='stylesheet' href='css/style.css'>
    </head>
    <form id="form1" runat="server">
        <div class="container">
            <asp:Table ID="jobPostingTable" runat="server" OnLoad="jobPostingTable_Load" Width="100%"></asp:Table>
        </div>

        <div>
            <%--Refer Job Modal--%>
            <div class="modal fade" id="sendToModal" role="dialog">
                <div class="modal-dialog">
                    <!-- Modal content-->
                    <div class="modal-content">
                        <div class="modal-header">
                            <div class="col-md-12 text-center">
                                <div class="modal-title">
                                    <i class="fas fa-paper-plane fa-4x progress-bar-animated rotateIn" style="color: #102B3F;"></i>
                                    <br>
                                    <br>

                                    <asp:Label ID="lblJobTitle" runat="server" Style="color: #102B3F; font-family: 'Poppins', sans-serif; font-size: 1.6em; font-weight: bold;"></asp:Label>
                                    <asp:Label ID="lblOrgName" runat="server" Style="color: #102B3F; font-family: 'Poppins', sans-serif; font-size: 1.6em; font-weight: bold;"></asp:Label>
                                </div>
                            </div>

                        </div>
                        <div class="modal-body" style="background-color: #4F79A3;">
                            <div class="col-lg-12 col-sm-12 col-md-12 col-xs-12 text-center">
                                <div class="form-group">
                                    <asp:Label ID="lblSendTo" runat="server" Style="color: white; font-family: 'Poppins', sans-serif; font-size: 2.1em; font-weight: bold;" Text="Send To"></asp:Label>
                                    <br />
                                    <asp:SqlDataSource ID="ReferStudents" runat="server" ConnectionString="<%$ ConnectionStrings:CuedInDBConnectionString2 %>" SelectCommand="SELECT Student.StudentEntityID, CONCAT(Student.FirstName, ' ', Student.LastName) AS FullName, Student.StudentGradeLevel, Student.StudentGPA, Student.StudentImage FROM Student INNER JOIN School ON Student.SchoolEntityID = School.SchoolEntityID WHERE Student.SchoolEntityID = @schoolID ORDER BY Student.LastName ASC">
                                        <SelectParameters>
                                            <asp:SessionParameter Name="schoolID" SessionField="schoolID"
                                                DefaultValue="12" />
                                        </SelectParameters>

                                    </asp:SqlDataSource>
                                    <div style="overflow-y: scroll; overflow-x: hidden; height: 500px; width: 450px;">
                                    <asp:GridView ID="gridviewRefer" runat="server" CssClass="table table-hover table-striped table-dark table-responsive center" HorizontalAlign="Center" Style="border-collapse: collapse; width: auto;" AutoGenerateColumns="False" DataSourceID="ReferStudents" CellPadding="1" BackColor="white" ForeColor="#102B40" DataKeyNames="StudentEntityID">
                                        <Columns>
                                            
                                            <asp:TemplateField HeaderText="Select">
                                                <ItemTemplate>
                                                    <asp:CheckBox ID="studentCheck" runat="server" />
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:BoundField DataField="StudentEntityID" HeaderText="ID" />
                                            <asp:TemplateField HeaderText="Image" Visible="false">
                                                <ItemTemplate>
                                                <asp:Image ID="studentImage" runat="server" CssClass="rounded-circle col-sm-1" ImageUrl='<%#Eval("StudentImage")%>' />
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:BoundField DataField="FullName" HeaderText="Full Name" SortExpression="FullName" ReadOnly="True" HeaderStyle-Wrap="true" />
                                            <asp:BoundField DataField="StudentGradeLevel" HeaderText="Grade Level" ReadOnly="True" HeaderStyle-Wrap="true" />
                                            <asp:BoundField DataField="StudentGPA" HeaderText="GPA" ReadOnly="True" HeaderStyle-Wrap="true" />
                                        </Columns>
                                    </asp:GridView>
                                        </div>
                                    
                                </div>
                            </div>
                        </div>

                        <div class="modal-footer">
                            <div class="flex-center" style="text-align: center !important; margin: auto !important;">
                                <asp:Button ID="btnSendTo" runat="server" Text="Send" Style="background-color: #102B3F; color: #fff; width: 100px; height: 60px;" CssClass="btn btn-circle" OnClick="sendToButton_Click" />
                                <button type="button" style="background-color: #102B3F; color: #fff; width: 100px; height: 60px;" class="btn btn-circle" data-dismiss="modal">Close</button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <script type='text/javascript'>
                function openSendToModal() {
                    $('[id*=sendToModal]').modal('show');
                }
            </script>
    </form>

</asp:Content>

