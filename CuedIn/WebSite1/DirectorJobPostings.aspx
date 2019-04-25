﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Director.master" AutoEventWireup="true" CodeFile="DirectorJobPostings.aspx.cs" Inherits="DirectorJobPostings" %>



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
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-multiselect/0.9.15/css/bootstrap-multiselect.css" type="text/css" />
        <script src ="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-multiselect/0.9.15/js/bootstrap-multiselect.js"></script>
        <script src ="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-multiselect/0.9.15/js/bootstrap-multiselect.min.js"></script>
        <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>

        <link rel='stylesheet' href='css/card.css'>
        <link rel='stylesheet' href='css/style.css'>
    </head>


       <script>
           //Initialize popover with jQuery
                   $(document).ready(function () {
                       $('.popovers').popover();
                   });
       </script>



     <div class="container">
            <button onclick="topFunction()" id="myBtn"><i class="fas fa-angle-double-up"></i></button>
         </div>

<br>
                   
 <!--- Breadcrumb --->
 
    <ol class="breadcrumb arr-bread">
 
    <li><a href="DirectorLandingPage.aspx">Home</a></li>
    <li><a href="DirectorScholarshipBoard.aspx">Approved Scholarships</a></li>
 
                               
 
    <li class="active"><span>Approved Jobs</span></li>       
 
                </ol>

<!--- END Breadcrumb --->

        <div class="container-fluid">
            <asp:Button ID="btnTop0" runat="server" CssClass="btn  btn-sm popovers img-fluid" data-content="&lt;img src='img/postingLegend.png' /&gt;" Style="margin-left: 90%; color: white;" data-html="true" data-placement="top" data-trigger="hover" Text="Icon Legend" BackColor="#006699" BorderColor="Black" OnClientClick="return false;"/>
            </div>
              <div class="container-fluid">
               
                        <asp:SqlDataSource ID="InterestGroupData" runat="server" ConnectionString="<%$ ConnectionStrings:CuedInDBConnectionString %>" 
                            SelectCommand="SELECT [InterestGroupID], [InterestGroupName] FROM [InterestGroups]">
                        </asp:SqlDataSource>
                   


                
    <div class="row">
                        <div class="col-md-3 col-lg-3 col-sm-12 col-xs-12">
                   
                    
                 <asp:CheckboxList ID="InterestGroupDrop" CssClass="checkbox" SelectionMode="Multiple" runat="server" DataSourceID="InterestGroupData" DataTextField="InterestGroupName" DataValueField="InterestGroupID" BorderStyle="Outset" BorderColor="Silver"></asp:CheckboxList>
            <asp:Button ID="ApplyChanges" runat="server" Text="Apply Filters" CssClass="btn"  OnClick="applyChanges_click"/>
                     
                        <asp:Button ID="clearButton" runat="server" CssClass="btn" Text="Clear Filters" OnClick="ClearButton_Click" />
                    </div>
                 
            <div class="col-md-9 col-lg-9 col-xs-12 col-sm-12">

            <asp:Table ID="jobPostingTable" runat="server"></asp:Table>
        </div>

            </div>
                  </div>



        <div class="row">
            <div class="col-md-4 col-xs-12 col-sm-12">
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
                                                 />
                                        </SelectParameters>

                                    </asp:SqlDataSource>

                                    <div style="overflow-y: scroll; overflow-x: hidden; height: 500px; width: 450px;">

                        <asp:ListBox ID="StudentInterestGroup" SelectionMode="Multiple"  runat="server" CssClass="rounded" DataSourceID="SqlDataSource1" 
                            DataTextField="InterestGroupName" DataValueField="InterestGroupID">

                        </asp:ListBox>
                         <div style="height: 5px; font-size: 10px;">&nbsp;</div>
                        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:CuedInDBConnectionString %>" 
                            SelectCommand="SELECT [InterestGroupID], [InterestGroupName] FROM [InterestGroups]">
                        </asp:SqlDataSource>

                        <asp:Button ID="ApplyInterestGroup" runat="server" Text="Apply Filters"  Style="background-color: white; color: #102B3F;" class="btn btn-circle"  OnClick="ApplyInterestGroup_Click"/>
                        <asp:Button ID="ClearWebButtons" runat="server" Text="Clear Filters"  Style="background-color: white; color: #102B3F;" class="btn btn-circle" OnCommand="ClearWebButtons_Click" />
                <div style="height: 5px; font-size: 10px;">&nbsp;</div>
                        <asp:Label ID="InterestGroupLabel"  runat="server" Style="color: white; font-family: 'Poppins', sans-serif; font-size: 1.0em; font-weight: bold;"></asp:Label>


                                        <asp:GridView ID="gridviewRefer" runat="server" CssClass="table table-hover table-striped table-dark table-responsive center rounded" HorizontalAlign="Center" Style="border-collapse: collapse; width: auto;" AutoGenerateColumns="False" CellPadding="1" BackColor="white" ForeColor="#102B40" DataKeyNames="StudentEntityID">
                                            <Columns>

                                                <asp:TemplateField HeaderText="Select">
                                                    <ItemTemplate>
                                                        <asp:CheckBox ID="studentCheck" runat="server" />
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:BoundField DataField="StudentEntityID" HeaderText="ID" Visible="false" />
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
                                <asp:Button  ID="btnSendTo" runat="server" Text="Send" Style="background-color: #102B3F; color: #fff; width: 100px; height: 60px;" CssClass="btn btn-circle" OnClick="sendToButton_Click" />
                                <button type="button" style="background-color: #102B3F; color: #fff; width: 100px; height: 60px;" class="btn btn-circle" data-dismiss="modal">Close</button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
                </div>
            </div>
  
            <script type='text/javascript'>
                function openSendToModal() {
                    $('[id*=sendToModal]').modal('show');
                }

                //window.onscroll = function () { scrollFunction() };

                //function scrollFunction() {
                //    if (document.body.scrollTop > 20 || document.documentElement.scrollTop > 20) {
                //        document.getElementById("myBtn").style.display = "block";
                //    } else {
                //        document.getElementById("myBtn").style.display = "none";
                //    }
                //}

                // When the user clicks on the button, scroll to the top of the document
                function topFunction() {
                    //document.body.scrollTop = 0; // For Safari
                    //document.documentElement.scrollTop = 0; // For Chrome, Firefox, IE and Opera
                }

                $(function () {
                    $('[id*=InterestGroupDrop]').multiselect({
                        includeSelectAllOption: true,
                        buttonWidth: '200px'


                    });
                });




            </script>


</asp:Content>


