<%@ Page Title="" Language="C#" MasterPageFile="~/Teacher.master" AutoEventWireup="true" CodeFile="TeacherJobPosting.aspx.cs" Inherits="TeacherJobPosting" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    
    
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


    </head>
            <!--Most Recent Job Posting-->

            <div class='container'>     <!-- Main container div -->
                <div class='row'>       <!-- Row start div -->
                <div class='col-12 '>   <!-- Job Reccomend text div -->
                    <p>Job Post Just Added</p>
                </div>                  <!-- Close Job Reccomend text div -->
            </div>                      <!-- Row close div -->
                <div class='row'>     <!-- Start row Diiv -->
                    <div class='col-md-4 col-sm-4 col-xs-4' id='ashvet'>  <!-- Start column div -->
                       <div class='thumbnail'>          <!-- Start thumbnail div -->
                            <img src='<%=orgImage %>' alt='' class='img-fluid'>
    
                        </div>          <!-- End thumbnail div -->
                    </div>              <!-- End column div -->
                    
                    <div class ='col-md-4 col-sm-4 col-xs-4'>  <!-- Start column div -->
                        <h4> <%=orgName%></h4>
                        <p> <%=jobTitle %></p>
                        <h5> <%=jobDescription%></h5>
                    </div>             <!-- End column div -->
                    <div class ='col-md-4 col-sm-4 col-xs-4'>  <!-- Start column div -->
                        <div id='tie'> <!-- Start employeediv -->
                        <i class='fab fa-black-tie'></i>
                        <p><%=numOfApplicants%></p>
                        </div>  <!-- Start column div -->
                        <i class='far fa-clock'></i>
                        <p><%=jobType%></p>
                        <i class='fas fa-map-marker-alt'></i>
                        <p><%=jobLocation%></p>
                    </div>             <!-- End column div -->
                </div><!-- End row Diiv -->
                <div class='row'>       <!-- Row start div -->
                <div class='col-12 '>   <!-- Job Reccomend text div -->
                    <p>More Job Postings</p>
                </div>                  <!-- Close Job Reccomend text div -->

                <!--End of Recent Job Posting-->
    
                    
                    <asp:Table ID="jobPostingTable" runat="server" OnLoad="jobPostingTable_Load" Width="100%" > </asp:Table>

   
 
   
</asp:Content>
