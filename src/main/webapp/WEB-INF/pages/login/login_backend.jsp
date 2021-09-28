<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
	<title>後台系統登入</title>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="icon" href="/images/logo.ico" type="image/x-icon">
<!--===============================================================================================-->	
	<!-- <link rel="icon" type="image/png" href="images/icons/favicon.ico"/> -->
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="/vendor_l/bootstrap/css/bootstrap.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="/fonts/font-awesome-4.7.0/css/font-awesome.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="/fonts/Linearicons-Free-v1.0.0/icon-font.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="/vendor_l/animate/animate.css">
<!--===============================================================================================-->	
	<link rel="stylesheet" type="text/css" href="/vendor_l/css-hamburgers/hamburgers.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="/vendor_l/animsition/css/animsition.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="/vendor_l/select2/select2.min.css">
<!--===============================================================================================-->	
	<link rel="stylesheet" type="text/css" href="/vendor_l/daterangepicker/daterangepicker.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="/css_l/util.css">
	<link rel="stylesheet" type="text/css" href="/css_l/main.css">
<!--===============================================================================================-->
<script>
function keyinAll1(){
	
	$('#username').val('admin');
	$('#password').val('123');
	
}
function keyinAll2(){
	
	$('#username').val('user');
	$('#password').val('123');
	
}
</script>
</head>
<body style="background-color: #666666;">
	
	<div class="limiter">
		<div class="container-login100">
			<div class="wrap-login100">
				<form action="/backend/home" method="post" class="login100-form validate-form">
					<span class="login100-form-title p-b-43">
						InHouse後台登入系統
					</span>
					
					
					<div class="wrap-input100 validate-input" data-validate = "Valid username is required: xxxxxxx">
						<input class="input100" type="text" id="username" name="username" placeholder="Username">
						<span class="focus-input100"></span>
<!-- 						<span class="label-input100">Username</span> -->
					</div>
					
					
					<div class="wrap-input100 validate-input" data-validate="Password is required">
						<input class="input100" type="password" id="password" name="password" placeholder="Password">
						<span class="focus-input100"></span>
<!-- 						<span class="label-input100">Password</span> -->
					</div>

					<div class="flex-sb-m w-full p-t-3 p-b-32">
						<div class="contact100-form-checkbox">
							<input class="input-checkbox100" id="ckb1" type="checkbox" name="remember-me">
							<label class="label-checkbox100" for="ckb1">
								Remember me
							</label>
						</div>
					
<!-- 						<div> -->
<!-- 							<a href="#" class="txt1"> -->
<!-- 								Forgot Password? -->
<!-- 							</a> -->
<!-- 						</div> -->

				        <span><input type="button" onclick="keyinAll1()" value="管理員"></span>
						<span><input type="button" onclick="keyinAll2()" value="員工"></span>
					</div>


					<div class="container-login100-form-btn">
						<button class="login100-form-btn" style="background-color:#3d2e11">
							Login
						</button>
					</div>
					
					<div class="text-center p-t-46 p-b-20">
						<span class="txt2">
<!-- 							or sign up using -->
						</span>
					</div>
				</form>

				<div class="login100-more" style="background-image: url('/images/bg5.gif');">
				</div>
			</div>
		</div>
	</div>
	
	

	
	
<!--===============================================================================================-->
	<script src="/vendor_l/jquery/jquery-3.2.1.min.js"></script>
<!--===============================================================================================-->
	<script src="/vendor_l/animsition/js/animsition.min.js"></script>
<!--===============================================================================================-->
	<script src="/vendor_l/bootstrap/js/popper.js"></script>
	<script src="/vendor_l/bootstrap/js/bootstrap.min.js"></script>
<!--===============================================================================================-->
	<script src="/vendor_l/select2/select2.min.js"></script>
<!--===============================================================================================-->
	<script src="/vendor_l/daterangepicker/moment.min.js"></script>
	<script src="/vendor_l/daterangepicker/daterangepicker.js"></script>
<!--===============================================================================================-->
	<script src="/vendor_l/countdowntime/countdowntime.js"></script>
<!--===============================================================================================-->
	<script src="/js_l/main.js"></script>

</body>
</html>