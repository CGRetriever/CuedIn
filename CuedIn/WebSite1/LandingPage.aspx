<%@ Page Title="" Language="C#" MasterPageFile="~/SchoolMaster.master" AutoEventWireup="true" CodeFile="LandingPage.aspx.cs" Inherits="LandingPage" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <form id="form1" runat="server">
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
    
    <div class="container">
        <h3 class="">Manage Posts</h3>
        <div class="row">
            <!-- Team member -->
            <div class="col-xs-12 col-sm-6 col-md-3">
                <div class="image-flip" ontouchstart="this.classList.toggle('hover');">
                    <div class="mainflip">
                        <div class="frontside">
                            <div class="card">
                                <div class="card-body text-center">
                                    <p><asp:Image ID="Image1" runat="server" ImageUrl="~/img/arconic.jpg" /></p>
                                    <asp:Label ID="CompanyNamelbl" runat="server" Text="Text" CssClass="card-title" Style="color: #102B3F; font-family: 'Poppins', sans-serif; font-size: 1.6em; padding-left: 20px; padding-right: 20px;"></asp:Label>
                                    <div class="text-center">
                                    <asp:Label ID="JobTitlelbl" runat="server" CssClass="card-text" Text="Test Jaunt"></asp:Label>
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
                                    <%--<ul class="list-inline">
                                        <li class="list-inline-item">
                                            <a class="social-icon text-xs-center" target="_blank" href="#">
                                                <i class="fab fa-facebook"></i>
                                            </a>
                                        </li>
                                        <li class="list-inline-item">
                                            <a class="social-icon text-xs-center" target="_blank" href="#">
                                                <i class="fab fa-twitter-square"></i>
                                            </a>
                                        </li>
                                        <li class="list-inline-item">
                                            <a class="social-icon text-xs-center" target="_blank" href="#">
                                                <i class="fab fa-instagram"></i>
                                            </a>
                                        </li>
                                        <li class="list-inline-item">
                                            <a class="social-icon text-xs-center" target="_blank" href="#">
                                                <i class="fab fa-google"></i>
                                            </a>
                                        </li>
                                    </ul>--%>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- ./Team member -->
            <!-- Team member -->
            <div class="col-xs-12 col-sm-6 col-md-3">
                <div class="image-flip" ontouchstart="this.classList.toggle('hover');">
                    <div class="mainflip">
                        <div class="frontside">
                            <div class="card">
                                <div class="card-body text-center">
                                    <p><asp:Image ID="Image2" runat="server" ImageUrl="~/img/arconic.jpg" /></p>
                                    <asp:Label ID="CompanyNamelbl3" runat="server" Text="Text" CssClass="card-title" Style="color: #102B3F; font-family: 'Poppins', sans-serif; font-size: 1.6em; padding-left: 20px; padding-right: 20px;"></asp:Label>
                                    <div class="text-center">
                                    <asp:Label ID="JobTitlelbl2" runat="server" CssClass="card-text" Text="Test Jaunt"></asp:Label>
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
                                    <%--<ul class="list-inline">
                                        <li class="list-inline-item">
                                            <a class="social-icon text-xs-center" target="_blank" href="#">
                                                <i class="fab fa-facebook"></i>
                                            </a>
                                        </li>
                                        <li class="list-inline-item">
                                            <a class="social-icon text-xs-center" target="_blank" href="#">
                                                <i class="fab fa-twitter-square"></i>
                                            </a>
                                        </li>
                                        <li class="list-inline-item">
                                            <a class="social-icon text-xs-center" target="_blank" href="#">
                                                <i class="fab fa-instagram"></i>
                                            </a>
                                        </li>
                                        <li class="list-inline-item">
                                            <a class="social-icon text-xs-center" target="_blank" href="#">
                                                <i class="fab fa-google"></i>
                                            </a>
                                        </li>
                                    </ul>--%>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- ./Team member -->
             <!-- Team member -->
            <div class="col-xs-12 col-sm-6 col-md-3">
                <div class="image-flip" ontouchstart="this.classList.toggle('hover');">
                    <div class="mainflip">
                        <div class="frontside">
                            <div class="card">
                                <div class="card-body text-center">
                                    <p><asp:Image ID="Image3" runat="server" ImageUrl="~/img/arconic.jpg" /></p>
                                    <asp:Label ID="CompanyNamelbl5" runat="server" Text="Text" CssClass="card-title" Style="color: #102B3F; font-family: 'Poppins', sans-serif; font-size: 1.6em; padding-left: 20px; padding-right: 20px;"></asp:Label>
                                    <div class="text-center">
                                    <asp:Label ID="JobTitlelbl3" runat="server" CssClass="card-text" Text="Test Jaunt"></asp:Label>
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
                                    <%--<ul class="list-inline">
                                        <li class="list-inline-item">
                                            <a class="social-icon text-xs-center" target="_blank" href="#">
                                                <i class="fab fa-facebook"></i>
                                            </a>
                                        </li>
                                        <li class="list-inline-item">
                                            <a class="social-icon text-xs-center" target="_blank" href="#">
                                                <i class="fab fa-twitter-square"></i>
                                            </a>
                                        </li>
                                        <li class="list-inline-item">
                                            <a class="social-icon text-xs-center" target="_blank" href="#">
                                                <i class="fab fa-instagram"></i>
                                            </a>
                                        </li>
                                        <li class="list-inline-item">
                                            <a class="social-icon text-xs-center" target="_blank" href="#">
                                                <i class="fab fa-google"></i>
                                            </a>
                                        </li>
                                    </ul>--%>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- ./Team member -->
            <!-- Team member -->
            <div class="col-xs-12 col-sm-6 col-md-3">
                <div class="image-flip" ontouchstart="this.classList.toggle('hover');">
                    <div class="mainflip">
                        <div class="frontside">
                            <div class="card">
                                <div class="card-body text-center">
                                    <p><asp:Image ID="Image4" runat="server" ImageUrl="~/img/arconic.jpg" /></p>
                                    <asp:Label ID="CompanyNamelbl7" runat="server" Text="Text" CssClass="card-title" Style="color: #102B3F; font-family: 'Poppins', sans-serif; font-size: 1.6em; padding-left: 20px; padding-right: 20px;"></asp:Label>
                                    <div class="text-center">
                                    <asp:Label ID="JobTitlelbl4" runat="server" CssClass="card-text" Text="Test Jaunt"></asp:Label>
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
                                    <%--<ul class="list-inline">
                                        <li class="list-inline-item">
                                            <a class="social-icon text-xs-center" target="_blank" href="#">
                                                <i class="fab fa-facebook"></i>
                                            </a>
                                        </li>
                                        <li class="list-inline-item">
                                            <a class="social-icon text-xs-center" target="_blank" href="#">
                                                <i class="fab fa-twitter-square"></i>
                                            </a>
                                        </li>
                                        <li class="list-inline-item">
                                            <a class="social-icon text-xs-center" target="_blank" href="#">
                                                <i class="fab fa-instagram"></i>
                                            </a>
                                        </li>
                                        <li class="list-inline-item">
                                            <a class="social-icon text-xs-center" target="_blank" href="#">
                                                <i class="fab fa-google"></i>
                                            </a>
                                        </li>
                                    </ul>--%>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- ./Team member -->


        </form>
</asp:Content>

