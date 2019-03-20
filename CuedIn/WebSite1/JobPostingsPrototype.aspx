<%@ Page Title="" Language="C#" MasterPageFile="~/SchoolMaster.master" AutoEventWireup="true" CodeFile="JobPostingsPrototype.aspx.cs" Inherits="JobPostingsPrototype" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<!DOCTYPE html>
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

    

            <!--Most Recent Job Posting-->

            <div class="container">     <!-- Main container div -->
                <div class="row">       <!-- Row start div -->
                <div class="col-12 ">   <!-- Job Reccomend text div -->
                    <p>Job Post Just Added</p>
                </div>                  <!-- Close Job Reccomend text div -->
            </div>                      <!-- Row close div -->
                <div class="row">     <!-- Start row Diiv -->
                    <div class="col-md-4 col-sm-4 col-xs-4" id="ashvet">  <!-- Start column div -->
                       <div class="thumbnail">          <!-- Start thumbnail div -->
                            <img src="img/ashby.png" alt="" class="img-fluid">
                            <!-- <div class="carousel-caption">
                                <h2>Ashby Vet <br>Clinic.</h2>
                            </div> -->
                        </div>          <!-- End thumbnail div -->
                    </div>              <!-- End column div -->
                    
                    <div class ="col-md-4 col-sm-4 col-xs-4">  <!-- Start column div -->
                        <h4> Ashby Animal Clinic</h4>
                        <p> Receptionist</p>
                        <h5> Lorem ipsum dolor sit amet,<br> consectetur adipiscing elit,<br> sed do</h5>
                    </div>             <!-- End column div -->
                    <div class ="col-md-4 col-sm-4 col-xs-4">  <!-- Start column div -->
                        <div id="tie"> <!-- Start employeediv -->
                        <i class="fab fa-black-tie"></i>
                        <p> 15</p>
                        </div>  <!-- Start column div -->
                        <i class="far fa-clock"></i>
                        <p>full time</p>
                        <i class="fas fa-map-marker-alt"></i>
                        <p>Harrisonburg</p>
                    </div>             <!-- End column div -->
                </div><!-- End row Diiv -->
                <div class="row">       <!-- Row start div -->
                <div class="col-12 ">   <!-- Job Reccomend text div -->
                    <p>More Job Postings</p>
                </div>                  <!-- Close Job Reccomend text div -->

                <!--End of Recent Job Posting-->


                <!-- Job Cards Start -->
<div class="row"><!-- Row start div -->
    <div class="col-md-4 col-xs-6"> <!--Column Tag Start--->
<div class="card card-cascade">

  <!-- Card image -->
  <div class="view view-cascade overlay">

    <img class="card-img-top" src="img/simplicity.jpg" alt="Card image cap">

    <a>
      <div class="mask rgba-white-slight"></div>
    </a>
  </div>

  <!-- Card content -->
  <div class="card-body card-body-cascade text-center">

    <!-- Title -->
    <h4 class="card-title"><strong>Simplicity</strong></h4>
    <!-- Subtitle -->
    <h6 class="font-weight-bold indigo-text py-2">Full-Time Sales</h6>
    <!-- Text -->
    <p class="card-text">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Voluptatibus, ex, recusandae. Facere modi sunt, quod quibusdam.
    </p>

    <!-- Facebook -->
    <a type="button" class="btn-floating btn-small btn-fb"><i class="fab fa-facebook-f"></i></a>
    <!-- Twitter -->
    <a type="button" class="btn-floating btn-small btn-tw"><i class="fab fa-twitter"></i></a>
    <!-- Google + -->
    <a type="button" class="btn-floating btn-small btn-dribbble"><i class="fab fa-dribbble"></i></a>

  </div>

</div>
</div> <!---Column Tag End -->
        <div class="col-md-4 col-xs-6"> <!--Column Tag Start--->
            <div class="card card-cascade">

  <!-- Card image -->
  <div class="view view-cascade overlay">
    <img class="card-img-top" src="img/cafe.jpg" alt="Card image cap">
    <a>
      <div class="mask rgba-white-slight"></div>
    </a>
  </div>

  <!-- Card content -->
  <div class="card-body card-body-cascade text-center">

    <!-- Title -->
    <h4 class="card-title"><strong>Kani's</strong></h4>
    <!-- Subtitle -->
    <h6 class="font-weight-bold indigo-text py-2">Part-Time Baker</h6>
    <!-- Text -->
    <p class="card-text">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Voluptatibus, ex, recusandae. Facere modi sunt, quod quibusdam.
    </p>

    <!-- Facebook -->
    <a type="button" class="btn-floating btn-small btn-fb"><i class="fab fa-facebook-f"></i></a>
    <!-- Twitter -->
    <a type="button" class="btn-floating btn-small btn-tw"><i class="fab fa-twitter"></i></a>
    <!-- Google + -->
    <a type="button" class="btn-floating btn-small btn-dribbble"><i class="fab fa-dribbble"></i></a>

  </div>

</div>
</div>      <!--Column Tag End--->
        <div class="col-md-4 col-xs-6">   <!--Column Tag Start--->
<div class="card card-cascade">

  <!-- Card image -->
  <div class="view view-cascade overlay">
    <img class="card-img-top" src="img/arconic.jpg" alt="Card image cap">
    <a>
      <div class="mask rgba-white-slight"></div>
    </a>
  </div>

  <!-- Card content -->
  <div class="card-body card-body-cascade text-center">

    <!-- Title -->
    <h4 class="card-title"><strong>Arconic</strong></h4>
    <!-- Subtitle -->
    <h6 class="font-weight-bold indigo-text py-2">Material Take Off Technician</h6>
    <!-- Text -->
    <p class="card-text">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Voluptatibus, ex, recusandae. Facere modi sunt, quod quibusdam.
    </p>

    <!-- Facebook -->
    <a type="button" class="btn-floating btn-small btn-fb"><i class="fab fa-facebook-f"></i></a>
    <!-- Twitter -->
    <a type="button" class="btn-floating btn-small btn-tw"><i class="fab fa-twitter"></i></a>
    <!-- Google + -->
    <a type="button" class="btn-floating btn-small btn-dribbble"><i class="fab fa-dribbble"></i></a>

  </div>

</div>
</div> <!--Column Tag End--->





</div><!-- Row End div -->
<!-- End of Job Cards End -->
                




<!--- BULLSHIT EXTRA CODE IGNORE --->

           <!--  </div>  
            <div class="card-deck">
             <div class="card">
                <div class="card-title">
                <h3>Learn More</h3>
            </div>
                <img class="card-img-top" src="img/ashby.png" alt="Card image cap">
                <div class="card-body">
                 <h5 class="card-title">Card title</h5>
                 <p class="card-text">This is a wider card with supporting text below as a natural lead-in to additional content. This content is a little bit longer.</p>
            </div>
                <div class="card-footer">
                 <small class="text-muted">Last updated 3 mins ago</small>
            </div>
            </div>
            <div class="card">
            <img class="card-img-top" src="img/ashby.png" alt="Card image cap">
             <div class="card-body">
            <h5 class="card-title">Card title</h5>
            <p class="card-text">This card has supporting text below as a natural lead-in to additional content.</p>
            </div>
                 <div class="card-footer">
                <small class="text-muted">Last updated 3 mins ago</small>
            </div>
            </div>
             <div class="card">
            <img class="card-img-top" src="img/ashby.png" alt="Card image cap">
    <div class="card-body">
      <h5 class="card-title">Card title</h5>
      <p class="card-text">This is a wider card with supporting text below as a natural lead-in to additional content. This card has even longer content than the first to show that equal height action.</p>
    </div>
    <div class="card-footer">
      <small class="text-muted">Last updated 3 mins ago</small>
    </div>
  </div>
</div>     
 -->


           
            </div><!-- Close Main container div -->


        <!-- jQuery first, then Popper.js, then Bootstrap JS -->
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
    <!-- Popper.JS -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.0/umd/popper.min.js" integrity="sha384-cs/chFZiN24E4KMATLdqdvsezGxaGsi4hLGOzlXwp5UZB1LY//20VyM2taTB4QvJ" crossorigin="anonymous"></script>
    <!-- Bootstrap JS -->
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js" integrity="sha384-uefMccjFJAIv6A+rW+L4AHf99KvxDjWSu1z9VI8SKNVmz4sk7buKt/6v9KI65qnm" crossorigin="anonymous"></script>

</body>

</html>
</asp:Content>

