<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ButtonTest.aspx.cs" Inherits="ButtonTest" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<html class="no-js" lang="en">
    <head>
        <title>Sass Bootstrap Template</title>
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

    <body>
        <!--Interactive Sidebar Star -->

        <div class="wrapper">
        <!-- Sidebar  -->
        <nav id="sidebar">
            <div class="sidebar-header">
                <h3>CommUp</h3>
                <strong>CU</strong>
            </div>


            <ul class="list-unstyled components">
                <li>
                    <a href="#homeSubmenu" data-toggle="collapse" aria-expanded="false" class="dropdown-toggle">
                        <i class="fas fa-home"></i>
                        Home
                    </a>
                    <ul class="collapse list-unstyled" id="homeSubmenu">
                        <li>
                            <a href="#">Home 1</a>
                        </li>
                        <li>
                            <a href="#">Home 2</a>
                        </li>
                        <li>
                            <a href="#">Home 3</a>
                        </li>
                    </ul>
                </li>
                <li>
                    <a href="#">
                        <i class="fas fa-school"></i>
                        My School
                    </a>
                    <a href="#pageSubmenu" data-toggle="collapse" aria-expanded="false" class="dropdown-toggle">
                       <i class="fas fa-tachometer-alt"></i>
                        Dashboard
                    </a>
                    <ul class="collapse list-unstyled" id="pageSubmenu">
                        <li>
                            <a href="#">Page 1</a>
                        </li>
                        <li>
                            <a href="#">Page 2</a>
                        </li>
                        <li>
                            <a href="#">Page 3</a>
                        </li>
                    </ul>
                </li>
                <li class="active">
                    <a href="#">
                        <i class="fas fa-briefcase"></i>
                        Jobs
                    </a>
                </li>
                <li>
                    <a href="#">
                       <i class="fas fa-inbox"></i>
                        Inbox
                    </a>
                </li>
                <li>
                    <a href="#">
                        <i class="fas fa-cog"></i>
                        Settings
                    </a>
                </li>
            </ul>

            <ul class="list-unstyled CTAs">
                <li>
                    <a href="https://bootstrapious.com/tutorial/files/sidebar.zip" class="download">Contact Us</a>
                </li>
                <li>
                    <a href="https://bootstrapious.com/p/bootstrap-sidebar" class="article">Help</a>
                </li>
            </ul>
        </nav>

        <!-- Page Content  -->
        <div id="content">

            <nav class="navbar navbar-expand-lg navbar-light bg-light">
                <div class="container-fluid">

                    <button type="button" id="sidebarCollapse" class="btn btn-info">
                        <i class="fas fa-align-left"></i>
                        <span>Toggle</span>
                    </button>
                    <button class="btn btn-dark d-inline-block d-lg-none ml-auto" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                        <i class="fas fa-align-justify"></i>
                    </button>

                    <div class="collapse navbar-collapse" id="navbarSupportedContent">
                        <ul class="nav navbar-nav ml-auto">
                            <li class="nav-item active">
                                <a class="nav-link" href="#">APPROVED JOBS</a>
                            </li>
                        </ul>
                    </div>
                </div>
            </nav>
            <div class="container"><!--Start main container div-->
               <!--  <div class="row">
                    <div class="col-md-12 col-sm-12">
                <div class='tableauPlaceholder' id='viz1552802234617' style='position: relative'><noscript><a href='#'><img alt=' ' src='https:&#47;&#47;public.tableau.com&#47;static&#47;images&#47;Ap&#47;ApprovalDashboard_CuedIn&#47;Dashboard1&#47;1_rss.png' style='border: none' /></a></noscript><object class='tableauViz'  style='display:none;'><param name='host_url' value='https%3A%2F%2Fpublic.tableau.com%2F' /> <param name='embed_code_version' value='3' /> <param name='site_root' value='' /><param name='name' value='ApprovalDashboard_CuedIn&#47;Dashboard1' /><param name='tabs' value='no' /><param name='toolbar' value='yes' /><param name='static_image' value='https:&#47;&#47;public.tableau.com&#47;static&#47;images&#47;Ap&#47;ApprovalDashboard_CuedIn&#47;Dashboard1&#47;1.png' /> <param name='animate_transition' value='yes' /><param name='display_static_image' value='yes' /><param name='display_spinner' value='yes' /><param name='display_overlay' value='yes' /><param name='display_count' value='yes' /></object></div>                <script type='text/javascript'>                    var divElement = document.getElementById('viz1552802234617');                    var vizElement = divElement.getElementsByTagName('object')[0];                    vizElement.style.width='1540px';vizElement.style.height='307px';                    var scriptElement = document.createElement('script');                    scriptElement.src = 'https://public.tableau.com/javascripts/api/viz_v1.js';                    vizElement.parentNode.insertBefore(scriptElement, vizElement);                </script>
            </div>
        </div> -->
                <div class="row"><!--Start row div-->
                    <div class="col-md-12 col-sm-12"><!--Start Col div-->
                        <table class="table">
                            <thead class="thead-dark">
                             <tr>
                              <th scope="col"></th>
                              <th scope="col"></th>
                              <th scope="col">Jobs To Approve</th>
                              <th scope="col"></th>
                            </tr>
                            </thead>
                             <tbody>
                             <tr>
                              <th scope="row">1</th>
                              <td>Full Time Sales</td>
                              <td>With Simplicity</td>
                              <td><button type="button" class="btn btn-success btn-circle"><i class="fa fa-check"></i>
                            </button><button type="button" class="btn btn-danger btn-circle"><i class="fa fa-times"></i>
                            </button><button type="button" class="btn btn-warning btn-circle"><i class="far fa-comments"></i>
                            </button></td>
                            </tr>
                            <tr>
                              <th scope="row">2</th>
                               <td>Part-Time Baker</td>
                              <td>Kanis Bakery & Catering</td>
                              <td><button type="button" class="btn btn-success btn-circle"><i class="fa fa-check"></i>
                            </button><button type="button" class="btn btn-danger btn-circle"><i class="fa fa-times"></i>
                            </button><button type="button" class="btn btn-warning btn-circle"><i class="far fa-comments"></i>
                            </button></td>
                            </tr>
                            <tr>
                            </tr>
                            <th scope="row">3</th>
                               <td>Job Shadowing</td>
                              <td>Arconic</td>
                              <td><button type="button" class="btn btn-success btn-circle"><i class="fa fa-check"></i>
                            </button><button type="button" class="btn btn-danger btn-circle"><i class="fa fa-times"></i>
                            </button><button type="button" class="btn btn-warning btn-circle"><i class="far fa-comments"></i>
                            </button></td>
                            </tr>
                            <tr>
                            </tr>
                             <th scope="row">4</th>
                               <td>Part Time Sales Associate</td>
                              <td>Green Hummingbird</td>
                              <td><button type="button" class="btn btn-success btn-circle"><i class="fa fa-check"></i>
                            </button><button type="button" class="btn btn-danger btn-circle"><i class="fa fa-times"></i>
                            </button><button type="button" class="btn btn-warning btn-circle"><i class="far fa-comments"></i>
                            </button></td>
                            </tr>
                            <tr>
                            </tr>
                             <th scope="row">5</th>
                               <td>Part Time Server</td>
                              <td>Jack Browns</td>
                              <td><button type="button" class="btn btn-success btn-circle"><i class="fa fa-check"></i>
                            </button><button type="button" class="btn btn-danger btn-circle"><i class="fa fa-times"></i>
                            </button><button type="button" class="btn btn-warning btn-circle"><i class="far fa-comments"></i>
                            </button></td>
                            </tr>
                            <tr>
                            </tr>
                             <th scope="row">6</th>
                               <td>Walmart Job Shadowing</td>
                              <td>Walmart Supercenter</td>
                              <td><button type="button" class="btn btn-success btn-circle"><i class="fa fa-check"></i>
                            </button><button type="button" class="btn btn-danger btn-circle"><i class="fa fa-times"></i>
                            </button><button type="button" class="btn btn-warning btn-circle"><i class="far fa-comments"></i>
                            </button></td>
                            </tr>
                            <tr>
                            </tr>
                    </div><!--End Col div-->
                     <div class="col-md-12 col-sm-12"><!--Start Col div-->
                        <table class="table">
                            <thead class="thead-dark">
                             <tr>
                              <th scope="col"></th>
                              <th scope="col"></th>
                              <th scope="col">Scholarships To Approve</th>
                              <th scope="col"></th>
                            </tr>
                            </thead>
                             <tbody>
                             <tr>
                              <th scope="row">1</th>
                              <td>Walmart Scholarship</td>
                              <td>Walmart Supercenter</td>
                              <td><button type="button" class="btn btn-success btn-circle"><i class="fa fa-check"></i>
                            </button><button type="button" class="btn btn-danger btn-circle"><i class="fa fa-times"></i>
                            </button><button type="button" class="btn btn-warning btn-circle"><i class="far fa-comments"></i>
                            </button></td>
                            </tr>
                            <tr>
                              <th scope="row">2</th>
                               <td>Jack Browns Scholarship</td>
                              <td>Jack Browns</td>
                              <td><button type="button" class="btn btn-success btn-circle"><i class="fa fa-check"></i>
                            </button><button type="button" class="btn btn-danger btn-circle"><i class="fa fa-times"></i>
                            </button><button type="button" class="btn btn-warning btn-circle"><i class="far fa-comments"></i>
                            </button></td>
                            </tr>
                            <tr>
                            </tr>
                            <th scope="row">3</th>
                               <td>Arconic Scholarship</td>
                              <td>Arconic</td>
                              <td><button type="button" class="btn btn-success btn-circle"><i class="fa fa-check"></i>
                            </button><button type="button" class="btn btn-danger btn-circle"><i class="fa fa-times"></i>
                            </button><button type="button" class="btn btn-warning btn-circle"><i class="far fa-comments"></i>
                            </button></td>
                            </tr>
                            <tr>
                            </tr>
                             
                    </div><!--End Col div-->



                    </div><!--End Row div-->






            </div> <!--End Main Container Div--->


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
