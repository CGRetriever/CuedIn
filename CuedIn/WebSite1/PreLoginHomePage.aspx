<%@ Page Language="C#" AutoEventWireup="true" CodeFile="PreLoginHomePage.aspx.cs" Inherits="PreLoginHomePage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
        <title>Dashboard - CommUp</title>
        <meta http-equiv="x-ua-compatible" content="ie=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta name="description" content=" A personalized school dashboard where schools can see pending job posting, scholarships, and statistics about their school">
        <meta name="author" content="Kevin Painter">
        <meta name="keywords" content="dashboard, school, pending, statistics, job">
        <!-- Font Awesome for icons - see https://fontawesome.com/v4.7.0/cheatsheet/ -->
        <link rel='stylesheet' href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
        <!-- Bootstrap CSS -->
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <!-- Custom CSS - update this if you use a name other than style.css for the Sass-generated CSS -->
        
        <link rel="stylesheet" href="css/style2.css">
        
         <script defer src="https://use.fontawesome.com/releases/v5.0.13/js/solid.js" integrity="sha384-tzzSw1/Vo+0N5UhStP3bvwWPq+uvzCMfrN1fEFe+xBmv1C/AtVX5K0uZtmcHitFZ" crossorigin="anonymous"></script>
         <script defer src="https://use.fontawesome.com/releases/v5.0.13/js/fontawesome.js" integrity="sha384-6OIrr52G08NpOFSZdxxz1xdNSndlD4vdcf/q2myIUVO0VsqaGHJsB0RaBE01VTOY" crossorigin="anonymous"></script>
         <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.2/css/all.css" integrity="sha384-fnmOCqbTlWIlj8LyTjo7mOUStjsKC4pOpQbqyi7RrhN7udi9RwhKkMHpvLbHG9Sr" crossorigin="anonymous">
    </head>
<!--===============================================================================================-->
<body>
<!-- example 8 - center logo on mobile, search right -->
<nav class="navbar fixed-top navbar-expand-md navbar-light bg-light">
    <div class="navbar-collapse collapse w-100 order-4 order-md-0 collapsenav">
        <ul class="navbar-nav mr-auto">
            <%--<li class="nav-item">
                <a class="nav-link text-center" id="about" href="#">About</a>
            </li>--%>
             <li class="nav-item">
                <a class="nav-link" href="#"></a>
            </li>
            <button>
            <li class="nav-item">
                <a class="nav-link" href="Login.aspx">Log In</a>
            </li>
        </button>
        </ul>
    </div>
    <div class="w-100 d-flex flex-nowrap">
        <div class="w-100 d-md-none">
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target=".collapsenav">
                <i class="fas fa-bars fa-lg"></i>
            </button>
        </div>
        <div class="d-flex w-100 mx-auto order-0">
            <!-- <a class="navbar-brand mx-0" id="logo" href="#">CommUp</a> -->
        </div>
    </div>
</nav>


    <div class="bg">
        
    </div>
 <section>
      <%-- <div id="phone" class ="phone">
<script type='text/javascript' src='https://us-east-1.online.tableau.com/javascripts/api/viz_v1.js'></script><div class='tableauPlaceholder' style='width: 100%; height: 827px;'><object class='tableauViz' width='100%' height='827' style='display:none;'><param name='host_url' value='https%3A%2F%2Fus-east-1.online.tableau.com%2F' /> <param name='embed_code_version' value='3' /> <param name='site_root' value='&#47;t&#47;commup' /><param name='name' value='OutsiderDash_Phone&#47;NewComerDash' /><param name='tabs' value='no' /><param name='toolbar' value='yes' /><param name='showAppBanner' value='false' /><param name='filter' value='iframeSizedToWindow=true' /></object></div></div>--%>
   <div id="phone" class ="phone">
<script type='text/javascript' src='https://us-east-1.online.tableau.com/javascripts/api/viz_v1.js'></script><div class='tableauPlaceholder' style='width: 100%; height: 827px;'><object class='tableauViz' width='100%' height='827' style='display:none;'><param name='host_url' value='https%3A%2F%2Fus-east-1.online.tableau.com%2F' /> <param name='embed_code_version' value='3' /> <param name='site_root' value='&#47;t&#47;commup' /><param name='name' value='OutsiderDash_Tablet&#47;NewComerDash' /><param name='tabs' value='no' /><param name='toolbar' value='yes' /><param name='showAppBanner' value='false' /><param name='filter' value='iframeSizedToWindow=true' /></object></div> </div>
        <div id="smallDesktop" class ="smallDesktop">
<script type='text/javascript' src='https://us-east-1.online.tableau.com/javascripts/api/viz_v1.js'></script><div class='tableauPlaceholder' style='width: 100%; height: 848px;'><object class='tableauViz' width='100%' height='848' style='display:none;'><param name='host_url' value='https%3A%2F%2Fus-east-1.online.tableau.com%2F' /> <param name='embed_code_version' value='3' /> <param name='site_root' value='&#47;t&#47;commup' /><param name='name' value='OutsiderDash_SmallDesktop&#47;NewComerDash' /><param name='tabs' value='no' /><param name='toolbar' value='yes' /><param name='showAppBanner' value='false' /><param name='filter' value='iframeSizedToWindow=true' /></object></div> </div>
   <div id="bigDesktop" class="bigDesktop">
<script type='text/javascript' src='https://us-east-1.online.tableau.com/javascripts/api/viz_v1.js'></script><div class='tableauPlaceholder' style='width: 100%; height: 927px;'><object class='tableauViz' width='100%' height='927' style='display:none;'><param name='host_url' value='https%3A%2F%2Fus-east-1.online.tableau.com%2F' /> <param name='embed_code_version' value='3' /> <param name='site_root' value='&#47;t&#47;commup' /><param name='name' value='OutsiderDash_LargeDesktop&#47;NewComerDash' /><param name='tabs' value='no' /><param name='toolbar' value='yes' /><param name='showAppBanner' value='false' /><param name='filter' value='iframeSizedToWindow=true' /></object></div> </div>
                </section>
</div>




        <!-- jQuery first, then Popper.js, then Bootstrap JS -->
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
    <!-- Popper.JS -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.0/umd/popper.min.js" integrity="sha384-cs/chFZiN24E4KMATLdqdvsezGxaGsi4hLGOzlXwp5UZB1LY//20VyM2taTB4QvJ" crossorigin="anonymous"></script>
    <!-- Bootstrap JS -->
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js" integrity="sha384-uefMccjFJAIv6A+rW+L4AHf99KvxDjWSu1z9VI8SKNVmz4sk7buKt/6v9KI65qnm" crossorigin="anonymous"></script>
    <!--Inline Javascript for Sidebar-->
    <script type="text/javascript">
        $(document).ready(function () {
            $('#sidebarCollapse').on('click', function () {
                $('#sidebar').toggleClass('active');
            });
        });
    </script>



            
   
</body>
</html>
