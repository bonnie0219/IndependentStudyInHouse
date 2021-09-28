<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!doctype html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="Furniture Shop Html Template">
    <meta name="author" content="">
    <meta name="generator" content="Jekyll">
    <title>所有商品</title>
<link rel="icon" href="/images/logo.ico" type="image/x-icon">
    <link rel="stylesheet" href="/vendors/fontawesome-pro-5/css/all.css">
    <link rel="stylesheet" href="/vendors/bootstrap-select/css/bootstrap-select.min.css">
    <link rel="stylesheet" href="/vendors/slick/slick.min.css">
    <link rel="stylesheet" href="/vendors/magnific-popup/magnific-popup.min.css">
    <link rel="stylesheet" href="/vendors/jquery-ui/jquery-ui.min.css">
    <link rel="stylesheet" href="/vendors/animate.css">
    <link rel="stylesheet" href="/vendors/mapbox-gl/mapbox-gl.min.css">

    <link rel="stylesheet" href="/css/themes.css">

    <link rel="icon" href="/images/favicon.ico">

    <meta name="twitter:card" content="summary">
    <meta name="twitter:site" content="@">
    <meta name="twitter:creator" content="@">
    <meta name="twitter:title" content="Shop Page 01">
    <meta name="twitter:description" content="Furniture Shop Html Template">
    <meta name="twitter:image" content="/images/logo_01.png">
<!-- 網頁資訊 之後可以再修改 -->
<!--     <meta property="og:url" content="home-01.html"> -->
<!--     <meta property="og:title" content="Home 01"> -->
<!--     <meta property="og:description" content="inHouse"> -->
<!--     <meta property="og:type" content="website"> -->
<!--     <meta property="og:image" content="/images/logo_01.png"> -->
<!--     <meta property="og:image:type" content="/image/png"> -->
<!--     <meta property="og:image:width" content="1200"> -->
<!--     <meta property="og:image:height" content="630"> -->

<script	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script type="text/javascript">
	function findProduct(){
		//debugger;
		var product_name = $("#product_name").val();
		$.ajax({
			type:"GET",
			dataType:"json",
			url:"/inhouse/shop/findByName",
			data:{product_name:product_name},
			dataType:'JSON',
			contentType:'application/json',
			success: function (data){
				console.log(data);
				var json = JSON.stringify(data, null, 4);
				console.log(json);
				var parsedObjinArray = JSON.parse(json);
				console.log(parsedObjinArray);
				$('#test').empty("");
				$('#test2').empty("");
				if(parsedObjinArray.length==0){
					//alert("查無資料");
					$('#test').prepend("<div style='text-align:center;'>" +"<h3 align='center'>暫無資料</h3>" + "</div>");
			       }else{
			         var table = $('#test');
			         var trr = "<div>" + "<div>"
			         table.append(trr);
			         $.each(parsedObjinArray,function(i,n){
			            var tr = "<div style='position: relative; padding:20px;'>" + "<img style='width:400px; height:400px' src='" + n.product_picture + "'>"  +
			                     "<h4 style='padding:0 auto; position:absolute; top:45px; left:60px;' id='" + n.product_name + "'>" + n.product_name + "</h4>" + 
			                     "<a href='#' style='padding:0 auto; position:absolute; top:80px; left:60px;'>" + n.product_type + "</a>" +
			                     "<h4 style='padding:0 auto; position:absolute; top:105px; left:60px;'>" + "<span>" + "<strong>$</strong>" + "</span> " + "<span>" + n.product_price + "</span>" + "</h4>" +
			                     "</div>" ;
			            table.append(tr);
			            console.log("成功");
						//alert("查詢成功");
			      		 })
			       		table.append(' </div> </div>');
			    }
				reset();
			},
			error: function (){
				console.log("失敗");
				alert("查詢失敗");
			}
		})
	}
	
	function priceHighToLow(){
		$.ajax({
			type:"GET",
			dataType:"json",
			url:"/inhouse/shop/queryByHighPrice",
			dataType:'JSON',
			contentType:'application/json',
			success: function (data){
				console.log(data);
				var json = JSON.stringify(data, null, 4);
				console.log(json);
				var parsedObjinArray = JSON.parse(json);
				console.log(parsedObjinArray);
				$('#test').empty("");
				$('#test2').empty("");
				if(parsedObjinArray.length==0){
					//alert("查無資料");
					$('#test').prepend("<div style='text-align:center;'>" +"<h3 align='center'>暫無資料</h3>" + "</div>");
			       }else{
			         var table = $('#test');
			         var trr = "<div>" + "<div>"
			         table.append(trr);
			         $.each(parsedObjinArray,function(i,n){
			            var tr = "<div style='position: relative; padding:15px;'>" + "<img style='width:400px; height:400px' src='" + n.product_picture + "'>"  +
			                     "<h4 style='padding:0 auto; position:absolute; top:45px; left:60px;' id='" + n.product_name + "'>" + n.product_name + "</h4>" + 
			                     "<a href='#' style='padding:0 auto; position:absolute; top:80px; left:60px;'>" + n.product_type + "</a>" +
			                     "<h4 style='padding:0 auto; position:absolute; top:105px; left:60px;'>" + "<span>" + "<strong>$</strong>" + "</span> " + "<span>" + n.product_price + "</span>" + "</h4>" +
			                     "</div>" ;
			            table.append(tr);
			            console.log("排序成功");
						//alert("查詢成功");
			      		 })
			       		table.append(' </div> </div>');
			    }
			},
			error: function (){
				console.log("失敗");
				alert("排序失敗");
			}
		})
	}
	
	function priceLowToHigh(){
		$.ajax({
			type:"GET",
			dataType:"json",
			url:"/inhouse/shop/queryByLowPrice",
			dataType:'JSON',
			contentType:'application/json',
			success: function (data){
				console.log(data);
				var json = JSON.stringify(data, null, 4);
				console.log(json);
				var parsedObjinArray = JSON.parse(json);
				console.log(parsedObjinArray);
				$('#test').empty("");
				$('#test2').empty("");
				if(parsedObjinArray.length==0){
					//alert("查無資料");
					$('#test').prepend("<div style='text-align:center;'>" +"<h3 align='center'>暫無資料</h3>" + "</div>");
			       }else{
			         var table = $('#test');
			         var trr = "<div>" + "<div>"
			         table.append(trr);
			         $.each(parsedObjinArray,function(i,n){
			            var tr = "<div style='position: relative; padding:15px;'>" + "<img style='width:400px; height:400px' src='" + n.product_picture + "'>"  +
			                     "<h4 style='padding:0 auto; position:absolute; top:45px; left:60px;' id='" + n.product_name + "'>" + n.product_name + "</h4>" + 
			                     "<a href='#' style='padding:0 auto; position:absolute; top:80px; left:60px;'>" + n.product_type + "</a>" +
			                     "<h4 style='padding:0 auto; position:absolute; top:105px; left:60px;'>" + "<span>" + "<strong>$</strong>" + "</span> " + "<span>" + n.product_price + "</span>" + "</h4>" +
			                     "</div>" ;
			            table.append(tr);
			            console.log("排序成功");
						//alert("查詢成功");
			      		 })
			       		table.append(' </div> </div>');
			    }
			},
			error: function (){
				console.log("失敗");
				alert("排序失敗");
			}
		})
	}
	
	function reset(){
		$('#product_name').val('');
	}
	
	function error(){
		alert('請先登入');
	}
	
	function keep(product_id,member_name){
		//debugger;
	     $.ajax({
	         url: '/inhouse/shop/keep/' + product_id +'/'+member_name,
	         type: 'POST',
	         success: function () {

	        	alert('商藏成功');
	            
	         },
	         error: function (error) {
	             alert('您已經收藏過囉~');
	         }
	     })
	 }
	
	
</script>


</head>

<body>
<%@include file="../homepage/header.jsp"%>
    
    <main id="content">
    
    	<br>
    	<br>
    	<br>
		<section class="bg-color-3">
			<div class="container">
				<nav aria-label="breadcrumb"
					class="d-flex align-items-center justify-content-between">
					<ol class="breadcrumb py-3 mr-6">
						<li class="breadcrumb-item"><a href="/inhouse/homepage">首頁</a></li>
						<li class="breadcrumb-item"><a
							href="/inhouse/shop/queryallbypage/1"> 所有商品 </a></li>
						<li class="breadcrumb-item">${TypeName}</li>

					</ol>
				</nav>
			</div>
		</section>

		<section class="py-8 page-title border-top">
            <div class="container">
            <br>
            <br>
            <br>
                <h1 class="fs-40 my-1 text-capitalize text-center">${TypeName}</h1>
            </div>
        </section>
        <section>
            <div class="container container-xxl">
                <div class="d-flex mb-6">
                    <div class="d-flex align-items-center text-primary" data-canvas="true"
                        data-canvas-options='{"container":".filter-canvas"}'>
                        <button class="navbar-toggler border-0 px-0 mr-2 canvas-filter" type="button">
                            <span class="fs-12 toggle-icon"></span>
                        </button>
                        篩選器
                    </div>
                    <div class="ml-auto">
                        <div class="dropdown">
                            <a class="dropdown-toggle" id="dropdownMenuButton" data-toggle="dropdown"
                                aria-haspopup="true" aria-expanded="false">
                                由價錢排序
                            </a>
                            <div class="dropdown-menu dropdown-menu-right" aria-labelledby="dropdownMenuButton"
                                style="">
                                <a class="dropdown-item text-primary" onclick="priceHighToLow()">從高到低</a>
                                <a class="dropdown-item text-primary" onclick="priceLowToHigh()">從低到高</a>
                            </div>
                            <div style="display:inline;margin:0 20px">
                                <input type="text" placeholder="請輸入商品名稱" id="product_name">
                                <input type="button" value="搜尋" onclick="findProduct()">
                            </div>
                        </div>
                    </div>
                </div>
                <div id="test" class="row mb-7 overflow-hidden">
                <!--購物車的東西開始 --><!--購物車的東西開始 --><!--購物車的東西開始 -->
                <c:forEach items="${AllProduct}" var="p">
                    <div class="col-sm-6 col-lg-3 mb-6" data-animate="fadeInUp">
                        <div class="card border-0 hover-change-content product">
                            <div style="background-image: url('${p.product_picture}')"
                                class="card-img ratio bg-img-cover-center ratio-1-1">
                            </div>
                            <div class="card-img-overlay d-flex py-4 py-sm-5 pl-6 pr-4">
                                <div class="d-flex flex-column">
                                    <h4 name="order_productname" href="#" id="${p.product_name}"
											class="font-weight-bold mb-1 d-block lh-12 my-cart-id my-cart-name product">${p.product_name}</h4>
                                    <a href="#" class="text-uppercase text-muted letter-spacing-05 fs-12">${p.product_type}</a>

<!--                                     <h4 class="mt-auto text-primary mb-0 my-cart-price price"> -->
<%-- 										${p.product_price}</h4> --%>

                                    
<!--                                     <h4 class="mt-auto text-primary mb-0 my-cart-price price"> -->
<%-- 											${p.product_price}</h4> --%>
											
									<h4><span><strong>$</strong></span><span name="order_productprice" class="mt-auto text-primary mb-0 my-cart-price price">${p.product_price}</span></h4>

                                </div>
                                <div class="ml-auto d-flex flex-column">
                                    <div class="my-auto content-change-vertical">
                                        <a href="#" data-toggle="tooltip" data-placement="left" title="Add to card"
                                            class="card-add d-flex align-items-center justify-content-center text-primary bg-white hover-white bg-hover-primary w-45px h-45px rounded-circle mb-2 border">
                                            <i class="far fa-shopping-basket"></i>
                                        </a>
                                        <a onclick = 'keep("${p.product_id}","${pageContext.request.userPrincipal.name}")' data-toggle="tooltip" data-placement="left" title="Add to favourite"
                                            class="add-to-wishlist d-flex align-items-center justify-content-center text-primary bg-white hover-white bg-hover-primary w-45px h-45px rounded-circle mb-2 border">
                                            <i class="far fa-heart"></i>
                                        </a>
                                        <a href="/inhouse/shop/findById/${p.product_id}" data-toggle="tooltip" data-placement="left" title="Preview"
                                            class="preview d-flex align-items-center justify-content-center text-primary bg-white hover-white bg-hover-primary w-45px h-45px rounded-circle mb-2 border">
                                            <i class="far fa-eye"></i>
                                        </a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    </c:forEach>
                    <!--購物車的東西結束 --><!--購物車的東西結束 --><!--購物車的東西結束 -->
                </div>
                <nav id="test2" class="pb-11 pb-lg-14 overflow-hidden">
                    <ul class="pagination justify-content-center align-items-center mb-0">
                        <li>總商品數:${totalElements} 總頁數:${totalPages}</li>
                    </ul>
                    <ul class="pagination justify-content-center align-items-center mb-0">
                        <li>
                        <c:forEach var="i" begin="1" end="${totalPages}" step="1">
                        	<a href="/inhouse/shop/queryallbypage/${i}">${i}</a> 
 						</c:forEach>
 						</li>
                    </ul>
                </nav>
            </div>
        </section>
    </main>
    
    <%@include file="../homepage/footer.jsp"%>
    
    <script src="/vendors/jquery.min.js"></script>
    <script src="/vendors/jquery-ui/jquery-ui.min.js"></script>
    <script src="/vendors/bootstrap/bootstrap.bundle.js"></script>
    <script src="/vendors/bootstrap-select/js/bootstrap-select.min.js"></script>
    <script src="/vendors/slick/slick.min.js"></script>
    <script src="/vendors/waypoints/jquery.waypoints.min.js"></script>
    <script src="/vendors/counter/countUp.js"></script>
    <script src="/vendors/magnific-popup/jquery.magnific-popup.min.js"></script>
    <script src="/vendors/hc-sticky/hc-sticky.min.js"></script>
    <script src="/vendors/jparallax/TweenMax.min.js"></script>
    <script src="/vendors/mapbox-gl/mapbox-gl.js"></script>

	<!--購物車的東西開始 --><!--購物車的東西開始 --><!--購物車的東西開始 -->
	<script src="/js/shopcar.js"></script>
	<!--購物車的東西結束 --><!--購物車的東西結束 --><!--購物車的東西結束 -->

    <script src="/js/theme.js"></script>
    
    <div class="position-fixed pos-fixed-bottom-right p-6 z-index-10">
        <a href="#"
            class="gtf-back-to-top bg-white text-primary hover-white bg-hover-primary shadow p-0 w-52px h-52 rounded-circle fs-20 d-flex align-items-center justify-content-center"
            title="Back To Top"><i class="fal fa-arrow-up"></i></a>
    </div>
    <!--         <div class="canvas-overlay"> -->
	<!--         </div> -->
	
	
	<div id="keep" class="canvas-sidebar cart-canvas my-cart-popup">
		<div class="shopping cart">
			<div class="card border-0 pt-5 pb-7 h-100">
				<div class="px-6 text-right">
					<span
						class="canvas-close d-inline-block fs-24 mb-1 ml-auto lh-1 text-primary"><i
						class="fal fa-times"></i></span>
				</div>
				<div class="card-header bg-transparent py-0 px-6">
					<h3 class="fs-24 mb-5">收藏</h3>
				</div>

<%-- 				<input type="hidden" id="member_name" value="${pageContext.request.userPrincipal.name}" /> --%>
				<div id="test3">
					
					
				</div>

			</div>
		</div>
	</div>
	
	
	<!--購物車的東西開始 --><!--購物車的東西開始 --><!--購物車的東西開始 -->
	<div class="canvas-sidebar cart-canvas my-cart-popup">
	<div class="shopping cart">
		<div class="card border-0 pt-5 pb-7 h-100">
			<div class="px-6 text-right">
				<span
					class="canvas-close d-inline-block fs-24 mb-1 ml-auto lh-1 text-primary"><i
					class="fal fa-times"></i></span>
			</div>
			<div class="card-header bg-transparent py-0 px-6">
				<h3 class="fs-24 mb-5">Your Cart</h3>

			</div>
			<form method="post">
				<div class="card-body px-6 pt-7 overflow-y-auto">
					<ul class="cart-list">
					</ul>
				</div>
				<div class="card-footer mt-auto border-0 bg-transparent px-6 pb-0 pt-5">
					<div class="d-flex align-items-center mb-4">
						<span class="font-weight-bold text-primary">Subtotal</span> 
						
						<span class="d-block ml-auto text-primary my-cart-total"></span>
					
					</div>
					<div class="d-flex align-items-center mb-4">
<!-- 						<span class="font-weight-bold text-primary">優惠價格:</span>  -->
<!-- 						<span class="d-block ml-auto text-primary my-cart-total2" id="coupon2"></span> -->
							<span class="font-weight-bold text-primary" style="display:none">優惠價格:</span> <!--  style="display:none"-->
      						<span class="d-block ml-auto text-primary my-cart-total2" id="coupon2" style="visibility:hidden"></span><!-- style="visibility:hidden" -->
					</div>	
					
					
					<br>
						<br>
					
					<label>選擇優惠券</label> <select class="form-control w-100 text-primary mb-4"
								name="coupon_name1" id="coupon_name1" required  >
								<option value=""></option>
								<c:forEach items="${MemberCoupon}" var="c">
								<option >${c.coupon_name}</option>
								 </c:forEach>
								
							</select>
					<!--<a href="#" class="d-block fs-14 text-uppercase letter-spacing-05 text-center font-weight-bold">View -->
					<!--Cart</a> -->
				</div>
			</form>

		</div>
		<button style="z-index:100" class="my-cart-checkout btn btn-primary btn-block mb-2">Check Out</button>
		</div>
	</div>
	
	<!--購物車的東西結束 --><!--購物車的東西結束 --><!--購物車的東西結束 -->

<!-- 	</div> -->
    <!-- Filter篩選的地方 -->
    <div class="canvas-sidebar filter-canvas">
        <div class="canvas-overlay">
        </div>
        <form class="h-100">
            <div class="card border-0 pt-5 pb-7 h-100">
                <div class="px-6 text-right">
                    <span class="canvas-close d-inline-block text-right fs-24 mb-1 ml-auto lh-1 text-primary"><i
                            class="fal fa-times"></i></span>
                </div>
                <div class="card-header bg-transparent py-0 px-6 border-bottom">
                    <h3 class="fs-30 mb-5">
                        商品篩選分類
                    </h3>
                    <p class="fs-15 text-primary mb-3">篩選後，總共有 ${totalElements} 個商品</p>
                </div>
                <div class="card-body px-6 pt-7 overflow-y-auto">
                    <div class="card border-0 mb-8">
                    	<div class="card-header bg-transparent border-0 p-0">
                            <h3 class="card-title fs-18 mb-0">
                                <a href="/inhouse/shop/queryallbypage/1">所有商品</a>
                            </h3>
                        </div>
                        <br>
                        <br>
                        <div class="card-header bg-transparent border-0 p-0">
                            <h3 class="card-title fs-18 mb-0">
                                商品類型
                            </h3>
                        </div>
                        <div class="card-body px-0 pt-4 pb-0">
                            <ul class="list-unstyled">
                                <li class="mb-1">
                                    <a href="/inhouse/shop/findByType1/1"
                                        class="text-secondary hover-primary border-bottom border-white border-hover-primary d-inline-block lh-12">桌椅系列</a>
                                </li>
                                <li class="mb-1">
                                    <a href="/inhouse/shop/findByType2/1"
                                        class="text-secondary hover-primary border-bottom border-white border-hover-primary d-inline-block lh-12">沙發系列</a>
                                </li>
                                <li class="mb-1">
                                    <a href="/inhouse/shop/findByType3/1"
                                        class="text-secondary hover-primary border-bottom border-white border-hover-primary d-inline-block lh-12">床架系列</a>
                                </li>
                                <li class="mb-1">
                                    <a href="/inhouse/shop/findByType4/1"
                                        class="text-secondary hover-primary border-bottom border-white border-hover-primary d-inline-block lh-12">收納系列</a>
                                </li>
                                <li class="mb-1">
                                    <a href="/inhouse/shop/findByType5/1"
                                        class="text-secondary hover-primary border-bottom border-white border-hover-primary d-inline-block lh-12">相關商品
                                        </a>
                                </li>
                            </ul>
                        </div>
                    </div>
                    <div class="card border-0 mb-8">
                        <div class="card-header bg-transparent border-0 p-0">
                            <h3 class="card-title fs-18 mb-0">
                                Price
                            </h3>
                        </div>
                        <div class="card-body px-0 pt-4 pb-0">
                            <ul class="list-unstyled">
<!--                                 <li class="mb-1"> -->
<!--                                     <a href="#" -->
<!--                                         class="text-secondary hover-primary border-bottom border-white border-hover-primary d-inline-block lh-12">All -->
<!--                                     </a> -->
<!--                                 </li> -->
                                <li class="mb-1">
                                    <a href="#"
                                        class="text-secondary hover-primary border-bottom border-white border-hover-primary d-inline-block lh-12">$10
                                        - $2000</a>
                                </li>
                                <li class="mb-1">
                                    <a href="#"
                                        class="text-secondary hover-primary border-bottom border-white border-hover-primary d-inline-block lh-12">$2000
                                        - $5000</a>
                                </li>
                                <li class="mb-1">
                                    <a href="#"
                                        class="text-secondary hover-primary border-bottom border-white border-hover-primary d-inline-block lh-12">$5000
                                        - $10000</a>
                                </li>
                                <li class="mb-1">
                                    <a href="#"
                                        class="text-secondary hover-primary border-bottom border-white border-hover-primary d-inline-block lh-12">$10000以上</a>
                                </li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </form>
    </div>
    
    <!-- 首頁搜尋的地方 -->
    <div class="mfp-hide search-popup mfp-with-anim" id="search-popup">
		<form>
			<div class="input-group position-relative">
				<div class="input-group-prepend d-none d-md-block">
					<select class="selectpicker" name="category" id="region-01"
						data-style="btn-lg letter-spacing-0 border-0 border-bottom border-2x bg-transparent text-white border-white fs-24 pl-0 shadow-none text-capitalize font-weight-normal">
						<option value="" selected>所有商品</option>
						<option value="chairs">桌椅系列</option>
						<option value="stands">沙發系列</option>
						<option value="tables">床架系列</option>
						<option value="accessory">收納系列</option>
						<option value="accessory">相關商品</option>
					</select>
				</div>
				<input type="text" id="keyword" name="keyword"
					class="form-control border-0 border-bottom border-2x bg-transparent text-white border-white fs-24 form-control-lg"
					placeholder="請輸入想尋找的商品名稱">
				<div
					class="input-group-append position-absolute pos-fixed-right-center">
					<button
						class="input-group-text bg-transparent border-0 text-white fs-30 px-0 btn-lg"
						type="submit">
						<i class="far fa-search"></i>
					</button>
				</div>
			</div>
		</form>
	</div>
    <!-- 網頁縮小之後的功能列 -->
	<div class="sidenav canvas-sidebar bg-white">
		<div class="canvas-overlay"></div>
		<div class="pt-5 pb-7 card border-0 h-100">
			<div
				class="d-flex align-items-center card-header border-0 py-0 pl-8 pr-7 mb-9 bg-transparent">
				<a href="index.html" class="d-block w-52px"> <img
					src="/images/short_logo.png" alt="Furnitor">
				</a> <span
					class="canvas-close d-inline-block text-right fs-24 ml-auto lh-1 text-primary"><i
					class="fal fa-times"></i></span>
			</div>
			<div class="overflow-y-auto pb-6 pl-8 pr-7 card-body pt-0">
				<ul class="navbar-nav main-menu px-0">
					<li aria-haspopup="true" aria-expanded="false"
						class="nav-item dropdown py-1 px-0"><a
						class="nav-link dropdown-toggle p-0" href="#"
						data-toggle="dropdown"> 關於 <span class="caret"></span>
					</a>
						<ul class="dropdown-menu pt-3 pb-0 pb-xl-3">
							<li class="dropdown-item"><a class="dropdown-link" href="#">
									品牌故事 </a></li>
							<li class="dropdown-item"><a class="dropdown-link" href="#">
									社會責任 </a></li>
							<li class="dropdown-item"><a class="dropdown-link" href="#">
									企業理念 </a></li>
							<li class="dropdown-item"><a class="dropdown-link" href="#">
									相關影片 </a></li>
							<li class="dropdown-item"><a class="dropdown-link" href="#">
									直營門市 </a></li>
						</ul></li>
					<li aria-haspopup="true" aria-expanded="false"
						class="nav-item dropdown py-1 px-0"><a
						class="nav-link dropdown-toggle p-0" href="#"
						data-toggle="dropdown"> 最新消息 <span class="caret"></span>
					</a>
						<ul class="dropdown-menu pt-3 pb-0 pb-xl-3">
							<li class="dropdown-item"><a class="dropdown-link" href="#">
									活動訊息(優惠券) </a></li>
							<li class="dropdown-item"><a class="dropdown-link" href="#">
									新聞 </a></li>
							<li class="dropdown-item"><a class="dropdown-link" href="#">
									相關連結 </a></li>
						</ul></li>
					<li aria-haspopup="true" aria-expanded="false"
						class="nav-item dropdown py-1 px-0"><a class="nav-link p-0"
						href="#"> 設計師簡介 <span class="caret"></span>
					</a></li>
					<li aria-haspopup="true" aria-expanded="false"
						class="nav-item dropdown py-1 px-0"><a class="nav-link p-0"
						href="#"> 作品集 <span class="caret"></span>
					</a></li>
					<li aria-haspopup="true" aria-expanded="false"
						class="nav-item dropdown py-1 px-0"><a
						class="nav-link dropdown-toggle p-0" href="#"
						data-toggle="dropdown"> 精選專欄 <span class="caret"></span>
					</a>
						<ul class="dropdown-menu pt-3 pb-0 pb-xl-3">
							<li class="dropdown-item"><a class="dropdown-link" href="#">
									客戶心得分享 </a></li>
							<li class="dropdown-item"><a class="dropdown-link" href="#">
									名人推薦 </a></li>
						</ul></li>
					<li aria-haspopup="true" aria-expanded="false"
						class="nav-item dropdown py-1 px-0"><a
						class="nav-link dropdown-toggle p-0" href="#"
						data-toggle="dropdown"> 服務流程 <span class="caret"></span>
					</a>
						<ul class="dropdown-menu pt-3 pb-0 pb-xl-3">
							<li class="dropdown-item"><a class="dropdown-link" href="#">
									流程介紹 </a></li>
							<li class="dropdown-item"><a class="dropdown-link" href="#">
									專案合作 </a></li>
							<li class="dropdown-item"><a class="dropdown-link" href="#">
									預約(表單) </a></li>
						</ul></li>
					<li aria-haspopup="true" aria-expanded="false"
						class="nav-item dropdown py-1 px-0"><a class="nav-link p-0"
						href="#"> 預約服務 <span class="caret"></span>
					</a></li>
					<li aria-haspopup="true" aria-expanded="false"
						class="nav-item dropdown py-1 px-0"><a
						class="nav-link dropdown-toggle p-0" href="store.html"
						data-toggle="dropdown"> 商品 <span class="caret"></span>
					</a> <!-- <div class="dropdown-menu p-0 dropdown-menu-listing x-animated x-fadeInUp">

                            <h4 class="dropdown-header text-dark fs-16 my-3">
                                Shop Pages
                            </h4>

                            <div class="dropdown-item">
                                <a class="dropdown-link" href="shop-page-01.html">
                                    Shop Layout <sup>V1</sup>
                                </a>
                            </div>

                            <h4 class="dropdown-header text-dark fs-16 my-3">
                                Product Page
                            </h4>

                            <div class="dropdown-item">
                                <a class="dropdown-link" href="product-page-01.html">
                                    Product Layout <sup>V1</sup>
                                </a>
                            </div>
                            <div class="dropdown-item">
                                <a class="dropdown-link" href="product-page-02.html">
                                    Product Layout <sup>V2</sup>
                                </a>
                            </div>

                            <h4 class="dropdown-header text-dark fs-16 my-3">
                                Product Type
                            </h4>

                            <div class="dropdown-item">
                                <a class="dropdown-link" href="product-page-03.html">
                                    Product Simple
                                </a>
                            </div>
                            <div class="dropdown-item">
                                <a class="dropdown-link" href="product-page-02.html">
                                    Product Variable (Color/Size/etc.)
                                </a>
                            </div>
                            <div class="dropdown-item">
                                <a class="dropdown-link" href="product-page-07.html">
                                    Product Time Limit
                                </a>
                            </div>
                            <div class="dropdown-item">
                                <a class="dropdown-link" href="product-page-06.html">
                                    Product Grouped
                                </a>
                            </div>
                            <div class="dropdown-item">
                                <a class="dropdown-link" href="product-page-09.html">
                                    Product External / Affiliate
                                </a>
                            </div>
                            <h4 class="dropdown-header text-dark fs-16 my-3">
                                Shop Page
                            </h4>

                            <div class="dropdown-item">
                                <a class="dropdown-link" href="cart.html">
                                    Cart
                                </a>
                            </div>
                            <div class="dropdown-item">
                                <a class="dropdown-link" href="compare.html">
                                    Compare
                                </a>
                            </div>
                            <div class="dropdown-item">
                                <a class="dropdown-link" href="stores.html">
                                    Store
                                </a>
                            </div>
                            <div class="dropdown-item">
                                <a class="dropdown-link" href="wishlist.html">
                                    Wishlist
                                </a>
                            </div>
                        </div> --></li>
				</ul>
			</div>
<!--             <div class="card-footer bg-transparent border-0 mt-auto pl-8 pr-7 pb-0 pt-4"> -->
<!--                 <ul class="list-inline d-flex align-items-center mb-3"> -->
<!--                     <li class="list-inline-item mr-4"><a href="#" class="fs-20 lh-1"><i -->
<!--                                 class="fab fa-pinterest-p"></i></a> -->
<!--                     </li> -->
<!--                     <li class="list-inline-item mr-4"><a href="#" class="fs-20 lh-1"><i -->
<!--                                 class="fab fa-facebook-f"></i></a></li> -->
<!--                     <li class="list-inline-item mr-4"><a href="#" class="fs-20 lh-1"><i -->
<!--                                 class="fab fa-instagram"></i></a></li> -->
<!--                     <li class="list-inline-item"><a href="#" class="fs-20 lh-1"><i class="fab fa-twitter"></i></a></li> -->
<!--                 </ul> -->
<!--                 <p class="mb-0 text-gray">Copyright &copy; 2021.Company name All rights reserved.<a target="_blank" -->
<!--                         href="https://sc.chinaz.com/moban/">&#x7F51;&#x9875;&#x6A21;&#x677F;</a></p> -->
<!--             </div> -->
        </div>
    </div>
</body>

</html>