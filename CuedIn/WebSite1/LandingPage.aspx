<%@ Page Title="" Language="C#" MasterPageFile="~/SchoolMaster.master" AutoEventWireup="true" CodeFile="LandingPage.aspx.cs" Inherits="LandingPage" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    


<%--<!--- Breadcrumb --->

 
    <ol class="breadcrumb arr-bread">

    <li><a href="OpportunityActDec.aspx">Manage Opportunities</a></li>
    <li><a href="ArchiveOpportunities.aspx">Archived Jobs Listings</a></li>
    <li><a href="ArchiveScholarships.aspx">Archived Scholarships</a></li>
    <li><a href="HoursApprovalPage.aspx">Student Log Hours</a></li>
    <li><a href="StudentActDec.aspx">Student Application Request</a></li>
    <li><a href="JobPostings.aspx">Approved Jobs</a></li>
    <li><a href="ScholarshipBoard.aspx">Approved Scholarships</a></li>
    <li><a href="StudentMetricsDashboard.aspx">Student Metrics Dashboard</a></li>
    <li><a href="ScholarshipDashboard.aspx">Scholarship Dashboard</a></li>
    <li><a href="JobListingDashboard.aspx">Job Listing Dashboard</a></li>
    <li><a href="JobListingMap.aspx">Work Based Learning Map</a></li>
    <li><a href="ScholarshipMap.aspx">Scholarship Map</a></li>
    <li><a href="CommunityFeed.aspx">Community Feed</a></li>
    <li><a href="CreateUser.aspx">Create User</a></li>

    
                               
 
    <li class="active"><span>Home</span></li>       
 
                </ol>

<!--- END Breadcrumb --->--%>


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
        <link rel="stylesheet" href="css/card.css">
        <link rel="stylesheet" href="css/style.css">
         <script defer src="https://use.fontawesome.com/releases/v5.0.13/js/solid.js" integrity="sha384-tzzSw1/Vo+0N5UhStP3bvwWPq+uvzCMfrN1fEFe+xBmv1C/AtVX5K0uZtmcHitFZ" crossorigin="anonymous"></script>
         <script defer src="https://use.fontawesome.com/releases/v5.0.13/js/fontawesome.js" integrity="sha384-6OIrr52G08NpOFSZdxxz1xdNSndlD4vdcf/q2myIUVO0VsqaGHJsB0RaBE01VTOY" crossorigin="anonymous"></script>
         <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.2/css/all.css" integrity="sha384-fnmOCqbTlWIlj8LyTjo7mOUStjsKC4pOpQbqyi7RrhN7udi9RwhKkMHpvLbHG9Sr" crossorigin="anonymous">
    </head>
    
    <div class="container container-fluid">
    
        <div class="container">
        <h3 class="">Metrics</h3>
     <link rel="stylesheet" type="text/css" href="css/TableauFormat.css" />   
    
    <div class="row bigDesktop" id="TurnerDesktop" runat="server" visible="false">
<script type='text/javascript' src='https://us-east-1.online.tableau.com/javascripts/api/viz_v1.js'></script><div class='tableauPlaceholder' style='width: 1599px; height: 277px;'><object class='tableauViz' width='1599' height='277' style='display:none;'><param name='host_url' value='https%3A%2F%2Fus-east-1.online.tableau.com%2F' /> <param name='embed_code_version' value='3' /> <param name='site_root' value='&#47;t&#47;commup' /><param name='name' value='LandingPageDashSmallDesktopLouisaCounty&#47;Dashboard1' /><param name='tabs' value='no' /><param name='toolbar' value='yes' /><param name='showAppBanner' value='false' /><param name='filter' value='iframeSizedToWindow=true' /></object></div></div>
        </div>

    <div class="row tablet" id="TurnerTablet" runat="server" visible="false">
<script type='text/javascript' src='https://us-east-1.online.tableau.com/javascripts/api/viz_v1.js'></script><div class='tableauPlaceholder' style='width: 1199px; height: 277px;'><object class='tableauViz' width='1199' height='277' style='display:none;'><param name='host_url' value='https%3A%2F%2Fus-east-1.online.tableau.com%2F' /> <param name='embed_code_version' value='3' /> <param name='site_root' value='&#47;t&#47;commup' /><param name='name' value='LandingPageDashTabletLouisaCounty&#47;Dashboard1' /><param name='tabs' value='no' /><param name='toolbar' value='yes' /><param name='showAppBanner' value='false' /><param name='filter' value='iframeSizedToWindow=true' /></object></div></div>



    <div class="row phone" id="TurnerPhone" runat="server" visible="false">
<script type='text/javascript' src='https://us-east-1.online.tableau.com/javascripts/api/viz_v1.js'></script><div class='tableauPlaceholder' style='width: 767px; height: 252px;'><object class='tableauViz' width='767' height='252' style='display:none;'><param name='host_url' value='https%3A%2F%2Fus-east-1.online.tableau.com%2F' /> <param name='embed_code_version' value='3' /> <param name='site_root' value='&#47;t&#47;commup' /><param name='name' value='LandingPageDashPhoneLouisaCounty&#47;Dashboard1' /><param name='tabs' value='no' /><param name='toolbar' value='yes' /><param name='showAppBanner' value='false' /><param name='filter' value='iframeSizedToWindow=true' /></object></div> </div>


    <div class="row bigDesktop" id="LouisaDesktop" runat="server" visible="false">
     <script type='text/javascript' src='https://us-east-1.online.tableau.com/javascripts/api/viz_v1.js'></script><div class='tableauPlaceholder' style='width: 100%; height: 277px;'><object class='tableauViz' width='100%' height='277' style='display:none;'><param name='host_url' value='https%3A%2F%2Fus-east-1.online.tableau.com%2F' /> <param name='embed_code_version' value='3' /> <param name='site_root' value='&#47;t&#47;commup' /><param name='name' value='LandingPageDashTabletLouisaCounty&#47;Dashboard1' /><param name='tabs' value='no' /><param name='toolbar' value='yes' /><param name='showAppBanner' value='false' /><param name='filter' value='iframeSizedToWindow=true' /></object></div>
    </div>

     <div class="row smallDesktop" id="LouisaTablet" runat="server" visible="false">
     <script type='text/javascript' src='https://us-east-1.online.tableau.com/javascripts/api/viz_v1.js'></script><div class='tableauPlaceholder' style='width: 100%; height: 277px;'><object class='tableauViz' width='100%' height='277' style='display:none;'><param name='host_url' value='https%3A%2F%2Fus-east-1.online.tableau.com%2F' /> <param name='embed_code_version' value='3' /> <param name='site_root' value='&#47;t&#47;commup' /><param name='name' value='LandingPageDashTabletLouisaCounty&#47;Dashboard1' /><param name='tabs' value='no' /><param name='toolbar' value='yes' /><param name='showAppBanner' value='false' /><param name='filter' value='iframeSizedToWindow=true' /></object></div>
         </div>

    <div class="row phone" id="LousiaPhone" runat="server" visible="false">
<script type='text/javascript' src='https://us-east-1.online.tableau.com/javascripts/api/viz_v1.js'></script><div class='tableauPlaceholder' style='width: 100%; height: 252px;'><object class='tableauViz' width='100%' height='252' style='display:none;'><param name='host_url' value='https%3A%2F%2Fus-east-1.online.tableau.com%2F' /> <param name='embed_code_version' value='3' /> <param name='site_root' value='&#47;t&#47;commup' /><param name='name' value='LandingPageDashPhoneLouisaCounty&#47;Dashboard1' /><param name='tabs' value='no' /><param name='toolbar' value='yes' /><param name='showAppBanner' value='false' /><param name='filter' value='iframeSizedToWindow=true' /></object></div>      </div>

        <br />

        <h3 class="">Manage Posts
        <asp:LinkButton ID="OppPageLink" runat="server" CssClass="btn" PostBackUrl="~/OpportunityActDec.aspx"><i class="fas fa-arrow-circle-right fa-2x"></i></asp:LinkButton>
            </h3>
        <div class="row">
            <button onclick="topFunction()" id="myBtn"><i class="fas fa-angle-double-up"></i></button>
            
            <%--<! -- Label for No Job Postings -->--%>
            <p class="col-6" id="EmptyPostinglbl" runat="server">No More Recent Job Postings</p>
            
            
            <!-- Team member -->
            <div class="col-xs-12 col-sm-6 col-md-3" id="card1" runat="server">
                <div class="image-flip" ontouchstart="this.classList.toggle('hover');">
                    <div class="mainflip">
                        <div class="frontside">
                            <div class="card">
                                <div class="card-body text-center">
                                    <p><asp:Image ID="Image1" runat="server" ImageUrl="~/img/arconic.jpg" CssClass="img-fluid" /></p>
                                    <asp:Label ID="CompanyNamelbl" runat="server" Text="Text" CssClass="card-title img-fluid" Style="color: #102B3F; font-family: 'Poppins', sans-serif; font-size: 1.6em; padding-left: 20px; padding-right: 20px;"></asp:Label>
                                    <div class="text-center">
                                    <asp:Label ID="JobTitlelbl" runat="server" CssClass="card-text" Text="Test Jaunt"></asp:Label>
                                        <br />
                                        <a href='#' class='btn btn-primary btn-sm' style="margin-top:5px"><i class='fa fa-plus'></i></a>
                                        </div>
                                </div>
                            </div>
                        </div>
                        <div class="backside">
                            <div class="card">
                                <div class="card-body text-center mt-4">
                                    <asp:Label ID="CompanyNamelbl2" runat="server" Text="Sunlimetech" CssClass="card-title" Style="color: #102B3F; font-family: 'Poppins', sans-serif; font-size: 1.6em; padding-left: 20px; padding-right: 20px;"></asp:Label>
                                    <div class="form-group text-left">
                                    <asp:Label ID="Label1" runat="server" CssClass="card-text font-weight-bold" Text="Job Type:"></asp:Label>
                                        <br />
                                    <asp:Label ID="lblJobType" runat="server" CssClass="card-text" Text="Test Text"></asp:Label>
                                        <br />
                                     <asp:Label ID="Label2" runat="server" CssClass="card-text font-weight-bold" Text="Job Description:"></asp:Label>
                                        <br />
                                    <asp:Label ID="lblJOrganizationDescription" runat="server" CssClass="card-text" Text="Test Text"></asp:Label>
                                        <br />
                                    <asp:Label ID="Label3" runat="server" CssClass="card-text font-weight-bold" Text="Organization Description:"></asp:Label>
                                        <br />
                                    <asp:Label ID="lblOrgDescription" runat="server" CssClass="card-text" Text="Test Text"></asp:Label>
                                        <br />
                                        </div>
                                    <asp:HyperLink ID="JobLink1" runat="server"><i class="fas fa-external-link-alt"></i></asp:HyperLink>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- ./Team member -->
            <!-- Team member -->
            <div class="col-xs-12 col-sm-6 col-md-3" id="card2" runat="server">
                <div class="image-flip" ontouchstart="this.classList.toggle('hover');">
                    <div class="mainflip">
                        <div class="frontside">
                            <div class="card">
                                <div class="card-body text-center">
                                    <p><asp:Image ID="Image2" runat="server" ImageUrl="~/img/arconic.jpg" CssClass="img-fluid" /></p>
                                    <asp:Label ID="CompanyNamelbl3" runat="server" Text="Text" CssClass="card-title img-fluid" Style="color: #102B3F; font-family: 'Poppins', sans-serif; font-size: 1.6em; padding-left: 20px; padding-right: 20px;"></asp:Label>
                                    <div class="text-center">
                                    <asp:Label ID="JobTitlelbl2" runat="server" CssClass="card-text" Text="Test Jaunt"></asp:Label>
                                        <br />
                                        <a href='#' class='btn btn-primary btn-sm' style="margin-top:5px"><i class='fa fa-plus'></i></a>
                                        </div>
                                </div>
                            </div>
                        </div>
                        <div class="backside">
                            <div class="card">
                                <div class="card-body text-center mt-4">
                                    <asp:Label ID="CompanyNamelbl4" runat="server" Text="Sunlimetech" CssClass="card-title" Style="color: #102B3F; font-family: 'Poppins', sans-serif; font-size: 1.6em; padding-left: 20px; padding-right: 20px;"></asp:Label>
                                    <div class="form-group text-left">
                                    <asp:Label ID="Label7" runat="server" CssClass="card-text font-weight-bold" Text="Job Type:"></asp:Label>
                                        <br />
                                    <asp:Label ID="lblJobType2" runat="server" CssClass="card-text" Text="Test Text"></asp:Label>
                                        <br />
                                     <asp:Label ID="Label9" runat="server" CssClass="card-text font-weight-bold" Text="Job Description:"></asp:Label>
                                        <br />
                                    <asp:Label ID="lblJOrganizationDescription2" runat="server" CssClass="card-text" Text="Test Text"></asp:Label>
                                        <br />
                                    <asp:Label ID="Label11" runat="server" CssClass="card-text font-weight-bold" Text="Organization Description:"></asp:Label>
                                        <br />
                                    <asp:Label ID="lblOrgDescription2" runat="server" CssClass="card-text" Text="Test Text"></asp:Label>
                                        <br />
                                        </div>
                                   <asp:HyperLink ID="JobLink2" runat="server"><i class="fas fa-external-link-alt"></i></asp:HyperLink>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- ./Team member -->
             <!-- Team member -->
            <div class="col-xs-12 col-sm-6 col-md-3" id="card3" runat="server">
                <div class="image-flip" ontouchstart="this.classList.toggle('hover');">
                    <div class="mainflip">
                        <div class="frontside">
                            <div class="card">
                                <div class="card-body text-center container-fluid">
                                    <p><asp:Image ID="Image3" runat="server" ImageUrl="~/img/arconic.jpg" CssClass="img-fluid" /></p>
                                    <asp:Label ID="CompanyNamelbl5" runat="server" Text="Text" CssClass="card-title img-fluid" Style="color: #102B3F; font-family: 'Poppins', sans-serif; font-size: 1.6em; padding-left: 20px; padding-right: 20px;"></asp:Label>
                                    <div class="text-center">
                                    <asp:Label ID="JobTitlelbl3" runat="server" CssClass="card-text" Text="Test Jaunt"></asp:Label>
                                        <br />
                                        <a href='#' class='btn btn-primary btn-sm' style="margin-top:5px"><i class='fa fa-plus'></i></a>
                                        </div>
                                </div>
                            </div>
                        </div>
                        <div class="backside">
                            <div class="card">
                                <div class="card-body text-center mt-4">
                                    <asp:Label ID="CompanyNamelbl6" runat="server" Text="Sunlimetech" CssClass="card-title" Style="color: #102B3F; font-family: 'Poppins', sans-serif; font-size: 1.6em; padding-left: 20px; padding-right: 20px;"></asp:Label>
                                    <div class="form-group text-left">
                                    <asp:Label ID="Label8" runat="server" CssClass="card-text font-weight-bold" Text="Job Type:"></asp:Label>
                                        <br />
                                    <asp:Label ID="lblJobType3" runat="server" CssClass="card-text" Text="Test Text"></asp:Label>
                                        <br />
                                     <asp:Label ID="Label12" runat="server" CssClass="card-text font-weight-bold" Text="Job Description:"></asp:Label>
                                        <br />
                                    <asp:Label ID="lblJOrganizationDescription3" runat="server" CssClass="card-text" Text="Test Text"></asp:Label>
                                        <br />
                                    <asp:Label ID="Label14" runat="server" CssClass="card-text font-weight-bold" Text="Organization Description:"></asp:Label>
                                        <br />
                                    <asp:Label ID="lblOrgDescription3" runat="server" CssClass="card-text" Text="Test Text"></asp:Label>
                                        <br />
                                        </div>
                                    <asp:HyperLink ID="JobLink3" runat="server"><i class="fas fa-external-link-alt"></i></asp:HyperLink>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- ./Team member -->
            <!-- Team member -->
            <div class="col-xs-12 col-sm-6 col-md-3" id="card4" runat="server">
                <div class="image-flip" ontouchstart="this.classList.toggle('hover');">
                    <div class="mainflip">
                        <div class="frontside">
                            <div class="card">
                                <div class="card-body text-center">
                                    <p><asp:Image ID="Image4" runat="server" ImageUrl="~/img/arconic.jpg" CssClass="img-fluid" /></p>
                                    <asp:Label ID="CompanyNamelbl7" runat="server" Text="Text" CssClass="card-title img-fluid" Style="color: #102B3F; font-family: 'Poppins', sans-serif; font-size: 1.6em; padding-left: 20px; padding-right: 20px;"></asp:Label>
                                    <div class="text-center">
                                    <asp:Label ID="JobTitlelbl4" runat="server" CssClass="card-text" Text=""></asp:Label>
                                        <br />
                                        <a href='#' class='btn btn-primary btn-sm' style="margin-top:5px"><i class='fa fa-plus'></i></a>
                                        </div>
                                </div>
                            </div>
                        </div>
                        <div class="backside">
                            <div class="card">
                                <div class="card-body text-center mt-4">
                                    <asp:Label ID="CompanyNamelbl8" runat="server" Text="Sunlimetech" CssClass="card-title" Style="color: #102B3F; font-family: 'Poppins', sans-serif; font-size: 1.6em; padding-left: 20px; padding-right: 20px;"></asp:Label>
                                    <div class="form-group text-left">
                                    <asp:Label ID="Label10" runat="server" CssClass="card-text font-weight-bold" Text="Job Type:"></asp:Label>
                                        <br />
                                    <asp:Label ID="lblJobType4" runat="server" CssClass="card-text" Text="Test Text"></asp:Label>
                                        <br />
                                     <asp:Label ID="Label15" runat="server" CssClass="card-text font-weight-bold" Text="Job Description:"></asp:Label>
                                        <br />
                                    <asp:Label ID="lblJOrganizationDescription4" runat="server" CssClass="card-text" Text="Test Text"></asp:Label>
                                        <br />
                                    <asp:Label ID="Label17" runat="server" CssClass="card-text font-weight-bold" Text="Organization Description:"></asp:Label>
                                        <br />
                                    <asp:Label ID="lblOrgDescription4" runat="server" CssClass="card-text" Text="Test Text"></asp:Label>
                                        <br />
                                        </div>
                                   <asp:HyperLink ID="JobLink4" runat="server"><i class='fas fa-external-link-alt'></i></asp:HyperLink>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- ./Team member -->
            </div>
        </div>


        <!-- Student Cards -->
        <br />
        <div class="container container-fluid">
        <h3 class="">Student Applications Pending Approval
            <asp:LinkButton ID="StudentPageLink" runat="server" CssClass="btn" PostBackUrl="~/StudentActDec.aspx"><i class="fas fa-arrow-circle-right fa-2x"></i></asp:LinkButton>
        </h3>
        <div class="row">
           
            
            <%--No more Students Pending Label--%>
            <p class="col-6" id="EmptyStudentslbl" runat="server">No More Pending Student Applications</p>
            
            
            <!-- Team member -->
            <div class="col-xs-12 col-sm-6 col-md-3" id="StudentCard1" runat="server">
                <div class="image-flip" ontouchstart="this.classList.toggle('hover');">
                    <div class="mainflip">
                        <div class="frontside">
                            <div class="card">
                                <div class="card-body text-center">
                                    <p><asp:Image ID="StudentImage" runat="server" ImageUrl="~/img/arconic.jpg" CssClass="img-fluid" /></p>
                                    <asp:Label ID="FrontStudentName" runat="server" Text="Text" CssClass="card-title img-fluid" Style="color: #102B3F; font-family: 'Poppins', sans-serif; font-size: 1.6em; padding-left: 20px; padding-right: 20px;"></asp:Label>
                                    <br />
                                    <a href='#' class='btn btn-primary btn-sm' style="margin-top:5px"><i class='fa fa-plus'></i></a>
                                </div>
                            </div>
                        </div>
                        <div class="backside">
                            <div class="card">
                                <div class="card-body text-center mt-4">
                                    <asp:Label ID="BackStudentName" runat="server" Text="Text" CssClass="card-title" Style="color: #102B3F; font-family: 'Poppins', sans-serif; font-size: 1.6em; padding-left: 20px; padding-right: 20px;"></asp:Label>
                                    <div class="form-group text-left">
                                    <asp:Label ID="JTitle" runat="server" CssClass="card-text font-weight-bold" Text="Job Title:"></asp:Label>
                                        <br />
                                    <asp:Label ID="StudentJobTitlelbl" runat="server" CssClass="card-text" Text="Test Text"></asp:Label>
                                        <br />
                                     <asp:Label ID="OrgTitle" runat="server" CssClass="card-text font-weight-bold" Text="Organization Title:"></asp:Label>
                                        <br />
                                    <asp:Label ID="OrgTitlelbl" runat="server" CssClass="card-text" Text="Test Text"></asp:Label>
                                        <br />
                                    <asp:Label ID="StudentGPA" runat="server" CssClass="card-text font-weight-bold" Text="Student GPA:"></asp:Label>
                                        <br />
                                    <asp:Label ID="StudentGPAlbl" runat="server" CssClass="card-text" Text="Test Text"></asp:Label>
                                        <br />
                                        </div>
                                    <asp:HyperLink ID="StudentLink1" runat="server"><i class='fas fa-external-link-alt'></i></asp:HyperLink>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- ./Team member -->
            <!-- Team member -->
            <div class="col-xs-12 col-sm-6 col-md-3" id="StudentCard2" runat="server">
                <div class="image-flip" ontouchstart="this.classList.toggle('hover');">
                    <div class="mainflip">
                        <div class="frontside">
                            <div class="card">
                                <div class="card-body text-center">
                                    <p><asp:Image ID="StudentImage2" runat="server" ImageUrl="~/img/arconic.jpg" CssClass="img-fluid" /></p>
                                    <asp:Label ID="FrontStudentName2" runat="server" Text="Text" CssClass="card-title img-fluid" Style="color: #102B3F; font-family: 'Poppins', sans-serif; font-size: 1.6em; padding-left: 20px; padding-right: 20px;"></asp:Label>
                                    <br />
                                    <a href='#' class='btn btn-primary btn-sm' style="margin-top:5px"><i class='fa fa-plus'></i></a>
                                </div>
                            </div>
                        </div>
                        <div class="backside">
                            <div class="card">
                                <div class="card-body text-center mt-4">
                                    <asp:Label ID="BackStudentName2" runat="server" Text="Text" CssClass="card-title" Style="color: #102B3F; font-family: 'Poppins', sans-serif; font-size: 1.6em; padding-left: 20px; padding-right: 20px;"></asp:Label>
                                    <div class="form-group text-left">
                                    <asp:Label ID="JTitle2" runat="server" CssClass="card-text font-weight-bold" Text="Job Title:"></asp:Label>
                                        <br />
                                    <asp:Label ID="StudentJobTitlelbl2" runat="server" CssClass="card-text" Text="Test Text"></asp:Label>
                                        <br />
                                     <asp:Label ID="OrgTitle2" runat="server" CssClass="card-text font-weight-bold" Text="Organization Title:"></asp:Label>
                                        <br />
                                    <asp:Label ID="OrgTitlelbl2" runat="server" CssClass="card-text" Text="Test Text"></asp:Label>
                                        <br />
                                    <asp:Label ID="StudentGPA2" runat="server" CssClass="card-text font-weight-bold" Text="Student GPA:"></asp:Label>
                                        <br />
                                    <asp:Label ID="StudentGPAlbl2" runat="server" CssClass="card-text" Text="Test Text"></asp:Label>
                                        <br />
                                        </div>
                                    <asp:HyperLink ID="StudentLink2" runat="server"><i class='fas fa-external-link-alt'></i></asp:HyperLink>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- ./Team member -->
            <!-- Team member -->
            <div class="col-xs-12 col-sm-6 col-md-3" id="StudentCard3" runat="server">
                <div class="image-flip"ontouchstart="this.classList.toggle('hover');">
                    <div class="mainflip">
                        <div class="frontside">
                            <div class="card">
                                <div class="card-body text-center">
                                    <p><asp:Image ID="StudentImage3" runat="server" ImageUrl="~/img/arconic.jpg" CssClass="img-fluid" /></p>
                                    <asp:Label ID="FrontStudentName3" runat="server" Text="Text" CssClass="card-title img-fluid" Style="color: #102B3F; font-family: 'Poppins', sans-serif; font-size: 1.6em; padding-left: 20px; padding-right: 20px;"></asp:Label>
                                    <br />
                                    <a href='#' class='btn btn-primary btn-sm' style="margin-top:5px"><i class='fa fa-plus'></i></a>
                                </div>
                            </div>
                        </div>
                        <div class="backside">
                            <div class="card">
                                <div class="card-body text-center mt-4">
                                    <asp:Label ID="BackStudentName3" runat="server" Text="Text" CssClass="card-title" Style="color: #102B3F; font-family: 'Poppins', sans-serif; font-size: 1.6em; padding-left: 20px; padding-right: 20px;"></asp:Label>
                                    <div class="form-group text-left">
                                    <asp:Label ID="JTitle3" runat="server" CssClass="card-text font-weight-bold" Text="Job Title:"></asp:Label>
                                        <br />
                                    <asp:Label ID="StudentJobTitlelbl3" runat="server" CssClass="card-text" Text="Test Text"></asp:Label>
                                        <br />
                                     <asp:Label ID="OrgTitle3" runat="server" CssClass="card-text font-weight-bold" Text="Organization Title:"></asp:Label>
                                        <br />
                                    <asp:Label ID="OrgTitlelbl3" runat="server" CssClass="card-text" Text="Test Text"></asp:Label>
                                        <br />
                                    <asp:Label ID="StudentGPA3" runat="server" CssClass="card-text font-weight-bold" Text="Student GPA:"></asp:Label>
                                        <br />
                                    <asp:Label ID="StudentGPAlbl3" runat="server" CssClass="card-text" Text="Test Text"></asp:Label>
                                        <br />
                                        </div>
                                    <asp:HyperLink ID="StudentLink3" runat="server"><i class='fas fa-external-link-alt'></i></asp:HyperLink>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                </div>
            
            <!-- ./Team member -->
            <!-- Team member -->
            <div class="col-xs-12 col-sm-6 col-md-3" id="StudentCard4" runat="server">
                <div class="image-flip" ontouchstart="this.classList.toggle('hover');">
                    <div class="mainflip">
                        <div class="frontside">
                            <div class="card">
                                <div class="card-body text-center">
                                    <p><asp:Image ID="StudentImage4" runat="server" ImageUrl="~/img/arconic.jpg" CssClass="img-fluid" /></p>
                                    <asp:Label ID="FrontStudentName4" runat="server" Text="Text" CssClass="card-title img-fluid" Style="color: #102B3F; font-family: 'Poppins', sans-serif; font-size: 1.6em; padding-left: 20px; padding-right: 20px;"></asp:Label>
                                    <br />
                                    <a href='#' class='btn btn-primary btn-sm' style="margin-top:5px"><i class='fa fa-plus'></i></a>
                                </div>
                            </div>
                        </div>
                        <div class="backside">
                            <div class="card">
                                <div class="card-body text-center mt-4">
                                    <asp:Label ID="BackStudentName4" runat="server" Text="Text" CssClass="card-title" Style="color: #102B3F; font-family: 'Poppins', sans-serif; font-size: 1.6em; padding-left: 20px; padding-right: 20px;"></asp:Label>
                                    <div class="form-group text-left">
                                    <asp:Label ID="JTitle4" runat="server" CssClass="card-text font-weight-bold" Text="Job Title:"></asp:Label>
                                        <br />
                                    <asp:Label ID="StudentJobTitlelbl4" runat="server" CssClass="card-text" Text="Test Text"></asp:Label>
                                        <br />
                                     <asp:Label ID="OrgTitle4" runat="server" CssClass="card-text font-weight-bold" Text="Organization Title:"></asp:Label>
                                        <br />
                                    <asp:Label ID="OrgTitlelbl4" runat="server" CssClass="card-text" Text="Test Text"></asp:Label>
                                        <br />
                                    <asp:Label ID="StudentGPA4" runat="server" CssClass="card-text font-weight-bold" Text="Student GPA:"></asp:Label>
                                        <br />
                                    <asp:Label ID="StudentGPAlbl4" runat="server" CssClass="card-text" Text="Test Text"></asp:Label>
                                        <br />
                                        </div>
                                    <asp:HyperLink ID="StudentLink4" runat="server"><i class='fas fa-external-link-alt'></i></asp:HyperLink>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- ./Team member -->
            <!-- ./Team member -->
                
        </div>
   
        

        <script>
                window.onscroll = function() {scrollFunction()};

                function scrollFunction() {
          if (document.body.scrollTop > 20 || document.documentElement.scrollTop > 20) {
            document.getElementById("myBtn").style.display = "block";
          } else {
            document.getElementById("myBtn").style.display = "none";
          }
        }

        // When the user clicks on the button, scroll to the top of the document
        function topFunction() {
          document.body.scrollTop = 0; // For Safari
          document.documentElement.scrollTop = 0; // For Chrome, Firefox, IE and Opera
            }

        </script>
 


<br />


    




    



        
</asp:Content>

