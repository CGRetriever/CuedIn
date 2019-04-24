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
    <link rel="stylesheet" href="css/PreLoginButtonStyling.css">
        
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
            
            <li class="nav-item">
                <button>
                <a class="nav-link" href="Login.aspx">Log In</a>
                </button>
            </li>
        
        </ul>
    </div>
    <br />
    <br />
    <div class ="links">
        <p><a class="ct-btn-scroll ct-js-btn-scroll" href="#bigDesktop"><img alt="Arrow Down Icon" src="https://www.solodev.com/assets/anchor/arrow-down.png"/></a></p>
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
    
    
 <div>
    <section>
      <%-- <div id="phone" class ="phone">
<script type='text/javascript' src='https://us-east-1.online.tableau.com/javascripts/api/viz_v1.js'></script><div class='tableauPlaceholder' style='width: 100%; height: 827px;'><object class='tableauViz' width='100%' height='827' style='display:none;'><param name='host_url' value='https%3A%2F%2Fus-east-1.online.tableau.com%2F' /> <param name='embed_code_version' value='3' /> <param name='site_root' value='&#47;t&#47;commup' /><param name='name' value='OutsiderDash_Phone&#47;NewComerDash' /><param name='tabs' value='no' /><param name='toolbar' value='yes' /><param name='showAppBanner' value='false' /><param name='filter' value='iframeSizedToWindow=true' /></object></div></div>--%>
   <div id="phone" class ="phone">
<script type='text/javascript' src='https://us-east-1.online.tableau.com/javascripts/api/viz_v1.js'></script><div class='tableauPlaceholder' style='width: 100%; height: 827px;'><object class='tableauViz' width='100%' height='827' style='display:none;'><param name='host_url' value='https%3A%2F%2Fus-east-1.online.tableau.com%2F' /> <param name='embed_code_version' value='3' /> <param name='site_root' value='&#47;t&#47;commup' /><param name='name' value='OutsiderDash_Tablet&#47;NewComerDash' /><param name='tabs' value='no' /><param name='toolbar' value='yes' /><param name='showAppBanner' value='false' /><param name='filter' value='iframeSizedToWindow=true' /></object></div> </div>
        <div id="smallDesktop" class ="smallDesktop block">
<script type='text/javascript' src='https://us-east-1.online.tableau.com/javascripts/api/viz_v1.js'></script><div class='tableauPlaceholder' style='width: 100%; height: 848px;'><object class='tableauViz' width='100%' height='848' style='display:none;'><param name='host_url' value='https%3A%2F%2Fus-east-1.online.tableau.com%2F' /> <param name='embed_code_version' value='3' /> <param name='site_root' value='&#47;t&#47;commup' /><param name='name' value='OutsiderDash_SmallDesktop&#47;NewComerDash' /><param name='tabs' value='no' /><param name='toolbar' value='yes' /><param name='showAppBanner' value='false' /><param name='filter' value='iframeSizedToWindow=true' /></object></div> </div>
   <div id="bigDesktop" class="bigDesktop">
<script type='text/javascript' src='https://us-east-1.online.tableau.com/javascripts/api/viz_v1.js'></script><div class='tableauPlaceholder' style='width: 100%; height: 927px;'><object class='tableauViz' width='100%' height='927' style='display:none;'><param name='host_url' value='https%3A%2F%2Fus-east-1.online.tableau.com%2F' /> <param name='embed_code_version' value='3' /> <param name='site_root' value='&#47;t&#47;commup' /><param name='name' value='OutsiderDash_LargeDesktop&#47;NewComerDash' /><param name='tabs' value='no' /><param name='toolbar' value='yes' /><param name='showAppBanner' value='false' /><param name='filter' value='iframeSizedToWindow=true' /></object></div> </div>
                </section>
</div>




    <script type="text/javascript">
        $("a[href^='#']").on('click', function (e) {
	e.preventDefault();
	var hash = this.hash;
	$("a[href^='#']").removeClass('active');
	$(this).addClass('active');
	$('html, body').animate({
		scrollTop: ($(hash).offset().top - 60)
	}, 100, function () {
		window.location.hash = hash;
	});
});
    </script>
</body>
</html>
