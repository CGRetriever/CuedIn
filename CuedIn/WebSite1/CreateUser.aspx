<%@ Page Title="" Language="C#" AutoEventWireup="true" MasterPageFile="~/SchoolMaster.master" runat="server" CodeFile="CreateUser.aspx.cs" Inherits="CreateUser"  %>


<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="server">
    <!DOCTYPE html>

<head>
	<title>Login V3</title>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
<!--===============================================================================================-->	
	<link rel="icon" type="image/png" href="images/icons/favicon.ico"/>
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="vendor/bootstrap/css/bootstrap.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="fonts/font-awesome-4.7.0/css/font-awesome.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="fonts/iconic/css/material-design-iconic-font.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="vendor/animate/animate.css">
<!--===============================================================================================-->	
	<link rel="stylesheet" type="text/css" href="vendor/css-hamburgers/hamburgers.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="vendor/animsition/css/animsition.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="vendor/select2/select2.min.css">
<!--===============================================================================================-->	
	<link rel="stylesheet" type="text/css" href="vendor/daterangepicker/daterangepicker.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="css/util.css">
	<link rel="stylesheet" type="text/css" href="css/main.css">
    <link rel="stylesheet" type="text/css" href="css/style.css" />
<!--===============================================================================================-->
</head>
     

	
	<div class="limiter">
		<div class="container-login100">
			<div class="wrap-login100">
				<form class="login100-form validate-form" runat="server">
					<span>
						<img src="images/CommUpMainLogo.png" alt="logo" class="RoundedElement">
					</span>

					<span class="login100-form-title p-b-34 p-t-27">
						Create Users
					
					</span>

                    <div class="wrap-input100 validate-input" data-validate = "Enter first name">
						<input runat="server" maxlength="30" class="input100" id="firstName" type="text" name="username" placeholder="First Name" required data-error="Enter First Name">
                       
						<span class="focus-input100" data-placeholder="&#xf207;"></span>
					</div>
                    <div class="wrap-input100 validate-input" data-validate = "Enter middle name">
						<input runat="server" maxlength="30" class="input100" id="middleName" type="text" name="username" placeholder="Middle Name (Optional)">
						<span class="focus-input100" data-placeholder="&#xf207;"></span>
					</div>

                    <div class="wrap-input100 validate-input" data-validate = "Enter last name">
						<input runat="server"  maxlength="30" class="input100" id="lastName" type="text" name="username" placeholder="Last Name" required>
						<span class="focus-input100" data-placeholder="&#xf207;"></span>
					</div>

                    <div class="wrap-input100 validate-input" data-validate = "Enter address">
						<input runat="server" maxlength="30" class="input100" id="address" type="text" name="username" placeholder="Address" required>
						<span class="focus-input100" data-placeholder="&#xf207;"></span>
					</div>


					<div class="wrap-input100 validate-input" data-validate = "Enter username">
						<input runat="server" maxlength="30" class="input100" id="username" type="text" name="username" placeholder="Username" required>
						<span class="focus-input100" data-placeholder="&#xf207;"></span>
					</div>

                    <div class="wrap-input100 validate-input" data-validate = "Enter email">
						<input runat="server" maxlength="30" class="input100" id="email" type="text" name="username" placeholder="Email" required>
						<span class="focus-input100" data-placeholder="&#xf207;"></span>
					</div>
    

                    <div class="ddl">
                        <asp:DropDownList ID="role" runat="server" border-radius="50px" Width="390px" Height="50px" BackColor="#36536f" BorderColor="Transparent" ForeColor="#efefef" Font-Names="Poppins-Regular"  Font-Size="Medium" > 
                             <asp:ListItem>Select A Role</asp:ListItem>
                            <asp:ListItem Text="Teacher"></asp:ListItem>
                            <asp:ListItem Text="Counselor"></asp:ListItem>
                            <asp:ListItem Text="Admin"></asp:ListItem>
                        </asp:DropDownList>
                    </div>
                    <br />
                     <div class="ddl">
                        <asp:DropDownList ID="DropDownList2" runat="server" border-radius="50px" Width="390px" Height="50px" BackColor="#36536f" BorderColor="Transparent" ForeColor="#efefef" Font-Names="Poppins-Regular"  Font-Size="Medium" > 
                             <asp:ListItem>Select A School</asp:ListItem>
                            <asp:ListItem Text="Harrisonburg High School"></asp:ListItem>
                            <asp:ListItem Text="Skyline Middle School"></asp:ListItem>
                            <asp:ListItem Text="Thomas Harrison Middle School"></asp:ListItem>
                        </asp:DropDownList>
                    </div>
                    <br />

					<div class="wrap-input100  validate-input" data-validate="Enter password">
						<input runat="server" maxlength="30" class="input100" id="password" type="password" name="pass" placeholder="Password" required>
						<span class="focus-input100" data-placeholder="&#xf191;"></span>
					</div>


                    <div class="wrap-input100  validate-input" data-validate="Confirm password">
						<input runat="server" maxlength="30" class="input100" id="password2" type="password" name="pass" placeholder="Confirm Password" required>
						<span class="focus-input100" data-placeholder="&#xf191;"></span>
					</div>

					<div class="contact100-form-checkbox">
						<input class="input-checkbox100" id="ckb1" type="checkbox" name="remember-me">
						<label class="label-checkbox100" for="ckb1">
							Remember me
						</label>
					</div>

					<div class="container-login100-form-btn">
						<asp:Button class="login100-form-btn" Text="Create" runat="server" OnClick="CreateUserClick">
							
						</asp:Button>
					</div>
                      <br />
                        <br />

                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;

                        <asp:Label ID="Label2" runat="server" ForeColor="#CC0000" style="text-align:center"></asp:Label>

				
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;

                        <asp:Label ID="Label1" runat="server" ForeColor="#CC0000" style="text-align:center"></asp:Label>

				
					</div>
				</form>
			</div>
		</div>
	</div>
	

	<div id="dropDownSelect1"></div>
	
<!--===============================================================================================-->
	<script src="vendor/jquery/jquery-3.2.1.min.js"></script>
<!--===============================================================================================-->
	<script src="vendor/animsition/js/animsition.min.js"></script>
<!--===============================================================================================-->
	<script src="vendor/bootstrap/js/popper.js"></script>
	<script src="vendor/bootstrap/js/bootstrap.min.js"></script>
<!--===============================================================================================-->
	<script src="vendor/select2/select2.min.js"></script>
<!--===============================================================================================-->
	<script src="vendor/daterangepicker/moment.min.js"></script>
	<script src="vendor/daterangepicker/daterangepicker.js"></script>
<!--===============================================================================================-->
	<script src="vendor/countdowntime/countdowntime.js"></script>
<!--===============================================================================================-->
	<script src="js/main.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/1000hz-bootstrap-validator/0.11.9/validator.min.js"></script>
</body>
         </form>
</html>

</asp:Content>

