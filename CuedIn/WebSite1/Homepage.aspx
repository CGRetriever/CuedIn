﻿<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Homepage.aspx.cs" Inherits="css_Homepage" %>

<!DOCTYPE html>
<header id="topnav">
  <div class="inner">
    <div class="logo">Commup</div>
    <nav role='navigation'>
      <ul>
        <li><a href="#">Home</a></li>
        <li><a href="#">About</a></li>
        <li><a href="#">Clients</a></li>
        <li><a href="Login.aspx">Login</a></li>
      </ul>
    </nav>  
  </div>
</header>

	<link rel="stylesheet" type="text/css" href="css/HomePage.css">
<img src="images/commup_headerpic.jpg" alt="Sample Image" class="imgfit"/>

<div>

</div>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
    
<body>
    <form id="form1" runat="server">
        <section>
        <div id="smallDesktop" class ="smallDesktop">
<script type='text/javascript' src='https://us-east-1.online.tableau.com/javascripts/api/viz_v1.js'></script><div class='tableauPlaceholder' style='width: 100%; height: 666px;'><object class='tableauViz' width='100%' height='666' style='display:none;'><param name='host_url' value='https%3A%2F%2Fus-east-1.online.tableau.com%2F' /> <param name='embed_code_version' value='3' /> <param name='site_root' value='&#47;t&#47;cis484commup' /><param name='name' value='OutsiderDashboard&#47;NewComerDash' /><param name='tabs' value='no' /><param name='toolbar' value='yes' /><param name='showAppBanner' value='false' /><param name='filter' value='iframeSizedToWindow=true' /></object></div>        </div>
   <div id="bigDesktop" class="bigDesktop">
<script type='text/javascript' src='https://us-east-1.online.tableau.com/javascripts/api/viz_v1.js'></script><div class='tableauPlaceholder' style='width: 100%; height: 1107px;'><object class='tableauViz' width='100%' height='1107' style='display:none;'><param name='host_url' value='https%3A%2F%2Fus-east-1.online.tableau.com%2F' /> <param name='embed_code_version' value='3' /> <param name='site_root' value='&#47;t&#47;cis484commup' /><param name='name' value='OutsiderDash_LargeMonitors&#47;NewComerDash' /><param name='tabs' value='no' /><param name='toolbar' value='yes' /><param name='showAppBanner' value='false' /><param name='filter' value='iframeSizedToWindow=true' /></object></div> </div>
        </section>
    </form>
</body>
</html>
<script>
$(document).ready(function(){
  $(window).scroll(function(){
    var scrollTop = $(window).scrollTop();
    if (scrollTop > 49) {
        $('body').addClass('header-fixed');
    } else {
        $('body').removeClass('header-fixed');
    }
    // change the style of the navbar when the user scrolls into the next zone.
    // get the distance of the 2nd section from the top of the page - height of header.
    var topOffset = $('#demosection2').offset().top;
    var headerHeight = $('#topnav').height();
    var transitionPoint = topOffset - headerHeight;
    if (scrollTop > transitionPoint) {
        $('#topnav').addClass('alt-header');
    } else {
        $('#topnav').removeClass('alt-header');
    }
  });
    });
    </script>
