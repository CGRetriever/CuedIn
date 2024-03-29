﻿<%@ Page Title="" Language="C#" MasterPageFile="~/SchoolMaster.master" AutoEventWireup="true" CodeFile="StudentMetricsDashboard.aspx.cs" Inherits="StudentMetricsDashboard" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
           <ol class="breadcrumb arr-bread">
    <li><a href="LandingPage.aspx">Home</a></li>
    <li><a href="JobListingMap.aspx">Work Based Learning Map</a></li>
    <li><a href="ScholarshipMap.aspx">Scholarship Map</a></li>
                               
 
    <li class="active"><span>Administrative Dashboard</span></li>       
 
                </ol>
    <link rel="stylesheet" type="text/css" href="css/TableauFormat.css">
  <!-- <div class='tableauPlaceholder' id='viz1554347216385' style='position: relative'><noscript><a href='#'><img alt=' ' src='https:&#47;&#47;public.tableau.com&#47;static&#47;images&#47;Co&#47;CommUpAdminDB&#47;Students&#47;1_rss.png' style='border: none' /></a></noscript><object class='tableauViz'  style='display:none;'><param name='host_url' value='https%3A%2F%2Fpublic.tableau.com%2F' /> <param name='embed_code_version' value='3' /> <param name='path' value='views&#47;CommUpAdminDB&#47;Students?:embed=y&amp;:display_count=y&amp;publish=yes' /> <param name='toolbar' value='yes' /><param name='static_image' value='https:&#47;&#47;public.tableau.com&#47;static&#47;images&#47;Co&#47;CommUpAdminDB&#47;Students&#47;1.png' /> <param name='animate_transition' value='yes' /><param name='display_static_image' value='yes' /><param name='display_spinner' value='yes' /><param name='display_overlay' value='yes' /><param name='display_count' value='yes' /><param name='filter' value='publish=yes' /></object></div>                <script type='text/javascript'>                    var divElement = document.getElementById('viz1554347216385');                    var vizElement = divElement.getElementsByTagName('object')[0];                    if ( divElement.offsetWidth > 800 ) { vizElement.style.width='100%';vizElement.style.height=(divElement.offsetWidth*0.75)+'px';} else if ( divElement.offsetWidth > 500 ) { vizElement.style.width='100%';vizElement.style.height=(divElement.offsetWidth*0.75)+'px';} else { vizElement.style.width='100%';vizElement.style.height='1627px';}                     var scriptElement = document.createElement('script');                    scriptElement.src = 'https://public.tableau.com/javascripts/api/viz_v1.js';                    vizElement.parentNode.insertBefore(scriptElement, vizElement);                </script>
 -->  <%-- <div runat="server" id="lousiasmall" visible="false" class="smallDesktop">
   
   <script type='text/javascript' src='https://us-east-1.online.tableau.com/javascripts/api/viz_v1.js'></script><div class='tableauPlaceholder' style='width: 100%; height: 950px;'><object class='tableauViz' width='100%' height='950' style='display:none;'><param name='host_url' value='https%3A%2F%2Fus-east-1.online.tableau.com%2F' /> <param name='embed_code_version' value='3' /> <param name='site_root' value='&#47;t&#47;cis484commup' /><param name='name' value='CommUpRockinghamCountyAdminAccount_LargeDesktop&#47;Students' /><param name='tabs' value='yes' /><param name='toolbar' value='yes' /><param name='showAppBanner' value='false' /><param name='filter' value='iframeSizedToWindow=true' /></object></div></div>
   --%>
    <div runat="server" id ="lousiasmall" visible ="false" class="smallDesktop">
        <script type='text/javascript' src='https://us-east-1.online.tableau.com/javascripts/api/viz_v1.js'></script><div class='tableauPlaceholder' style='width: 100%; height: 821px;'><object class='tableauViz' width='100%' height='821' style='display:none;'><param name='host_url' value='https%3A%2F%2Fus-east-1.online.tableau.com%2F' /> <param name='embed_code_version' value='3' /> <param name='site_root' value='&#47;t&#47;cis484commup' /><param name='name' value='CommUpLouisaCountyAdminAccountSmallDesktop&#47;Students' /><param name='tabs' value='yes' /><param name='toolbar' value='yes' /><param name='showAppBanner' value='false' /><param name='filter' value='iframeSizedToWindow=true' /></object></div>
 </div>

     <!-- Louisa County pc-->
    <div runat="server" id="lousiapc" visible ="false" class="bigDesktop">
         <script type='text/javascript' src='https://us-east-1.online.tableau.com/javascripts/api/viz_v1.js'></script><div class='tableauPlaceholder' style='width: 100%; height: 821px;'><object class='tableauViz' width='100%' height='821' style='display:none;'><param name='host_url' value='https%3A%2F%2Fus-east-1.online.tableau.com%2F' /> <param name='embed_code_version' value='3' /> <param name='site_root' value='&#47;t&#47;cis484commup' /><param name='name' value='CommUpLouisaCountyAdminAccountSmallDesktop&#47;Students' /><param name='tabs' value='yes' /><param name='toolbar' value='yes' /><param name='showAppBanner' value='false' /><param name='filter' value='iframeSizedToWindow=true' /></object></div>
   </div>


    <!-- Turner Ashby phone -->
    <div runat="server" id="turnerphone" visible="false" class="phone"> 
     <script type='text/javascript' src='https://us-east-1.online.tableau.com/javascripts/api/viz_v1.js'></script><div class='tableauPlaceholder' style='width: 100%; height: 950px;'><object class='tableauViz' width='100%' height='950' style='display:none;'><param name='host_url' value='https%3A%2F%2Fus-east-1.online.tableau.com%2F' /> <param name='embed_code_version' value='3' /> <param name='site_root' value='&#47;t&#47;cis484commup' /><param name='name' value='CommUpTurnerAshbyLargeDesktop&#47;Students' /><param name='tabs' value='yes' /><param name='toolbar' value='yes' /><param name='showAppBanner' value='false' /><param name='filter' value='iframeSizedToWindow=true' /></object></div>       </div>


        <div runat="server" id="turnerpc" visible="false" class="bigDesktop"> 
<script type='text/javascript' src='https://us-east-1.online.tableau.com/javascripts/api/viz_v1.js'></script><div class='tableauPlaceholder' style='width: 100%; height: 880px;'><object class='tableauViz' width='100%' height='880' style='display:none;'><param name='host_url' value='https%3A%2F%2Fus-east-1.online.tableau.com%2F' /> <param name='embed_code_version' value='3' /> <param name='site_root' value='&#47;t&#47;cis484commup' /><param name='name' value='CommUpTurnerAshbySmallDesktop&#47;Students' /><param name='tabs' value='yes' /><param name='toolbar' value='yes' /><param name='showAppBanner' value='false' /><param name='filter' value='iframeSizedToWindow=true' /></object></div>    </div>
  





</asp:Content>



 

