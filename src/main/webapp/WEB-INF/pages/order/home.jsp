<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en" xmlns:th="http://www.thymeleaf.org">
<head
	class="main-header navbar-light header-sticky header-sticky-smart position-absolute fixed-top">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="Furniture Shop Html Template">
<meta name="author" content="">
<meta name="generator" content="Jekyll">
<title>結帳明細</title>

<link rel="stylesheet" href="/vendors/fontawesome-pro-5/css/all.css">
<link rel="stylesheet"
	href="/vendors/bootstrap-select/css/bootstrap-select.min.css">
<link rel="stylesheet" href="/vendors/slick/slick.min.css">
<link rel="stylesheet"
	href="/vendors/magnific-popup/magnific-popup.min.css">
<link rel="stylesheet" href="/vendors/jquery-ui/jquery-ui.min.css">
<link rel="stylesheet" href="/vendors/animate.css">
<link rel="stylesheet" href="/vendors/mapbox-gl/mapbox-gl.min.css">

<link rel="stylesheet" href="/css/themes.css">

<link rel="icon" href="/images/favicon.ico">
<!-- 	<link rel="icon" href="/images/logo.png"> -->

<!-- AddReserve CSS -->
<link rel="stylesheet" href="/css_r/animate.css">
<link rel="stylesheet" href="/css_r/style.css">
<!-- AddReserve CSS -->

<meta name="twitter:card" content="summary">
<meta name="twitter:site" content="@">
<meta name="twitter:creator" content="@">
<meta name="twitter:title" content="Home 01">
<meta name="twitter:description" content="Furniture Shop Html Template">
<link rel="icon" href="/images/logo.ico" type="image/x-icon">

<!--     試試logo -->
<!--     <meta name="twitter:image" content="images/logo_01.png"> -->
<meta name="twitter:image" content="/images/logo_01.png">
<meta name="twitter:image" content="/images/logo.png">
<!-- 網頁資訊 之後可以再修改 -->
<meta property="og:url" content="home-01.html">
<meta property="og:title" content="Home 01">
<meta property="og:description" content="inHouse">
<meta property="og:type" content="website">
<!--     試試logo -->
<!--     <meta property="og:image" content="images/logo_01.png"> -->
<!--     <meta property="og:image:type" content="image/png"> -->
<meta property="og:image" content="/images/logo_01.png">
<meta property="og:image:type" content="/image/png">
<meta property="og:image:width" content="1200">
<meta property="og:image:height" content="630">


<style>
body {
	font-family: Arial;
	font-size: 17px;
	padding: 8px;
}

* {
	box-sizing: border-box;
}

.row {
	display: -ms-flexbox; /* IE10 */
	display: flex;
	-ms-flex-wrap: wrap; /* IE10 */
	flex-wrap: wrap;
	margin: 0 -16px;
}

.col-25 {
	-ms-flex: 25%; /* IE10 */
	flex: 25%;
}

.col-50 {
	-ms-flex: 50%; /* IE10 */
	flex: 50%;
}

.col-75 {
	-ms-flex: 75%; /* IE10 */
	flex: 75%;
}

.col-25, .col-50, .col-75 {
	padding: 0 16px;
}

.container {
	background-color: #f2f2f2;
	padding: 5px 20px 15px 20px;
	border: 1px solid lightgrey;
	border-radius: 3px;
}

input[type=text] {
	width: 100%;
	margin-bottom: 20px;
	padding: 12px;
	border: 1px solid #ccc;
	border-radius: 3px;
}

label {
	margin-bottom: 10px;
	display: block;
}

.icon-container1 {
	margin-bottom: 20px;
	padding: 7px 0;
	font-size: 24px;
}

.btn {
	background-color: #4CAF50;
	color: white;
	padding: 12px;
	margin: 10px 0;
	border: none;
	width: 100%;
	border-radius: 3px;
	cursor: pointer;
	font-size: 17px;
}

.btn:hover {
	background-color: #45a049;
}

a {
	color: #2196F3;
}

hr {
	border: 1px solid lightgrey;
}

span.price {
	float: right;
	color: grey;
}

/* Responsive layout - when the screen is less than 800px wide, make the two columns stack on top of each other instead of next to each other (also change the direction - make the "cart" column go on top) */
@media ( max-width : 800px) {
	.row {
		flex-direction: column-reverse;
	}
	.col-25 {
		margin-bottom: 20px;
	}
}
</style>

</head>
<body>
	<!-- 表頭開始 -->
<%@include file="../homepage/header.jsp"%>

	<!-- 表頭結束 -->

	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<div class="row">
		<div class="col-75">
			<div class="container">
				<form method="post" action="/pay">
					<div class="col-50">
						<h3>Payment</h3>
<!-- 						<label>Accepted Cards</label> -->
<!-- 						<div class="icon-container1"> -->
<!-- 							<i class="fa fa-cc-visa" style="color: navy;"></i> <i -->
<!-- 								class="fa fa-cc-amex" style="color: blue;"></i> <i -->
<!-- 								class="fa fa-cc-mastercard" style="color: red;"></i> <i -->
<!-- 								class="fa fa-cc-discover" style="color: orange;"></i> -->
<!-- 						</div> -->
						 <label for="price">Total</label>
						 <input type="hidden" id="price" name="price" value="">
						 <input id="price1" name="price" value="" disabled="disabled">
						 <label for="currency">Currency</label> 
<!-- 						 <input type="text" id="currency" name="currency" placeholder="Enter Currency"> -->
						 <select type="text" id="currency" name="currency" placeholder="Enter Currency">
						 	<option value="TWD">TWD</option>
						 	<option value="USD">USD</option>
						 </select> 
						 <label for="method">Payment Method</label> 
						 <input type="text" id="method" name="method" value="paypal"> 
						 <label for="intent">Intent</label> 
						 <input type="text" id="intent" name="intent" value="sale"> 
						 <label for="description">Payment Description</label> 
						 <input type="text" id="description" name="description" placeholder="Payment Description">

					</div>

					<input type="submit" value="Continue to checkout" class="btn">
				</form>
			</div>
		</div>
		<div class="col-25">
			<div class="container">
				<h4>
					Cart <span class="cart" style="color: black"><i
						class="fa fa-shopping-cart"></i></span>
				</h4>
				<div class="shopcaritem"></div>
				<hr>
				<p>
					Total <span class="totalprice" style="color: black"></span>
				</p>
			</div>
		</div>
	</div>
	<%@include file="../homepage/footer.jsp"%>

	<script>
		$(document)
				.ready(
						function() {
							var cartdetail = JSON.parse(localStorage
									.getItem("Cart"));
							console.log(cartdetail)
							console.log(cartdetail.items[0].id);
							for (let i = 0; i < cartdetail.items.length; i++) {
								var itemperprice = parseFloat(cartdetail.items[i].price);
								var itemperqty = parseFloat(cartdetail.items[i].qty);
								var itemtotalprice = itemperprice * itemperqty;
								$('.shopcaritem')
										.append(
												'<div class="media mb-2 border-bottom"><div class="media-body"> <a href="detail.html">'
														+ cartdetail.items[i].name
														+ '</a><div class="small text-muted">Price: $'
														+ cartdetail.items[i].price
														+ '<span class="mx-2">|</span> Qty: '
														+ cartdetail.items[i].qty
														+ '<span class="mx-2">|</span> Subtotal: $'
														+ itemtotalprice
														+ '</div></div></div>')
							}
							$('.totalprice').html(cartdetail.total)
							$('#price').val(cartdetail.total);
							$('#price1').val(cartdetail.total);
						});
	</script>

</body>

</html>