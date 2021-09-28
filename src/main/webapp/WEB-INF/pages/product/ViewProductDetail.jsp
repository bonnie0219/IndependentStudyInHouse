<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="Furniture Shop Html Template">
<meta name="author" content="">
<meta name="generator" content="Jekyll">
<title>檢視商品資訊</title>
<link rel="icon" href="/images/logo.ico" type="image/x-icon">
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

<meta name="twitter:card" content="summary">
<meta name="twitter:site" content="@">
<meta name="twitter:creator" content="@">
<meta name="twitter:title" content="Product Page 05">
<meta name="twitter:description" content="Furniture Shop Html Template">
<meta name="twitter:image" content="images/logo_01.png">

<meta property="og:url" content="product-page-05.html">
<meta property="og:title" content="Product Page 05">
<meta property="og:description" content="Furniture Shop Html Template">
<meta property="og:type" content="website">
<meta property="og:image" content="images/logo_01.png">
<meta property="og:image:type" content="image/png">
<meta property="og:image:width" content="1200">
<meta property="og:image:height" content="630">
<script	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script type="text/javascript">



</script>


</head>
<body>
	<%@include file="../homepage/header.jsp"%>
	

	<main id="content">
	<section class="py-3 bg-color-3" style=height:130px;>
<div class="container">
<nav aria-label="breadcrumb">
<ol class="breadcrumb py-11">
<li class="breadcrumb-item"><a href="/inhouse/homepage">Home</a></li>
<li class="breadcrumb-item"><a href="/inhouse/shop/queryallbypage/1"> 商品列表 </a></li>
<li class="breadcrumb-item active" aria-current="page">檢視商品資料</li>
</ol>
</nav>
</div>
</section>
<!-- 		<section class="bg-color-3"> -->
<!-- 			<div class="container"> -->
<!-- 				<nav aria-label="breadcrumb" -->
<!-- 					class="d-flex align-items-center justify-content-between"> -->
<!-- 					<ol class="breadcrumb py-3 mr-6"> -->
<!-- 						<li class="breadcrumb-item"><a href="/inhouse/homepage">首頁</a></li> -->
<!-- 						<li class="breadcrumb-item"><a href="/inhouse/shop/queryallbypage/1"> 商品列表 </a></li> -->
<!-- 						<li class="breadcrumb-item active" aria-current="page"> 檢視商品資料 </li> -->
<!-- 					</ol> -->
					<!-- 左右箭頭 -->
<!-- 					<div class="navigation d-flex align-items-center"> -->
						<!-- 上一個商品 -->
<!-- 						<div class="dropdown no-caret product-dropdown"> -->
<%-- 						<c:forEach items="${findPrevious}" var="fp"> --%>
<%-- 							<a class="fs-14 pr-3 py-3 d-block dropdown-toggle" href="/inhouse/shop/findById/${fp.product_id}" --%>
<!-- 								data-toggle="dropdown" aria-haspopup="true" -->
<!-- 								aria-expanded="false" rel="prev"> <i -->
<!-- 								class="far fa-arrow-left"></i> -->
<!-- 							</a> -->
<!-- 							<div -->
<!-- 								class="dropdown-menu w-215px p-2 border-0 dropdown-menu-right rounded-0"> -->
<%-- 								<a href="/inhouse/shop/findById/${fp.product_id}" class="media align-items-center"> --%>
<!-- 									<div class="w-60px mr-2"> -->
<%-- 										<img src="${fp.product_picture}" alt="${fp.product_name}"> --%>
<!-- 									</div> -->
<!-- 									<div class="media-body"> -->
<%-- 										<p class="font-weight-bold text-primary mb-0 lh-11 mb-1">${fp.product_name}</p> --%>
<%-- 										<p class="text-primary mb-0 lh-1">${fp.product_price}</p> --%>
<!-- 									</div> -->
<!-- 								</a> -->
<!-- 							</div> -->
<%-- 						</c:forEach> --%>
<!-- 						</div> -->
						
						
						<!-- 下一個商品 -->
<!-- 						<div class="dropdown no-caret product-dropdown"> -->
<%-- 						<c:forEach items="${findNext}" var="fn"> --%>
<%-- 							<a class="fs-14 py-3 py-3 d-block dropdown-toggle" href="/inhouse/shop/findById/${fn.product_id}" --%>
<!-- 								data-toggle="dropdown" aria-haspopup="true" -->
<!-- 								aria-expanded="false" rel="next"> <i -->
<!-- 								class="far fa-arrow-right"></i> -->
<!-- 							</a> -->
<!-- 							<div -->
<!-- 								class="dropdown-menu w-215px p-2 border-0 dropdown-menu-right rounded-0"> -->
<%-- 								<a href="/inhouse/shop/findById/${fn.product_id}" class="media align-items-center"> --%>
<!-- 									<div class="w-60px mr-2"> -->
<%-- 										<img src="${fn.product_picture}" alt="${fn.product_name}"> --%>
<!-- 									</div> -->
<!-- 									<div class="media-body"> -->
<%-- 										<p class="font-weight-bold text-primary mb-0 lh-11 mb-1">${fn.product_name}</p> --%>
<%-- 										<p class="text-primary mb-0 lh-1">${fn.product_price}</p> --%>
<!-- 									</div> -->
<!-- 								</a> -->
<!-- 							</div> -->
<%-- 						</c:forEach> --%>
<!-- 						</div> -->
<!-- 					</div> -->
					<!-- 左右箭頭結束 -->
<!-- 				</nav> -->
<!-- 			</div> -->
<!-- 		</section> -->
		
		
<div class="row no-gutters">
<div class="col-lg-9 mx-auto">
<div class="row no-gutters mb-11">


<c:forEach items="${findPrevious}" var="fp">
<div class="col-sm-6 mb-6 mb-sm-0 border-right-0  align-items-center">
<div class="media align-items-center py-1">
<a href="/inhouse/shop/findById/${fp.product_id}" class="fs-14 mr-4"><i class="fas fa-arrow-left"></i></a>
<a href="/inhouse/shop/findById/${fp.product_id}" class="w-70px d-block mr-2"
style="display:inline-block;width:100%;height:50px;overflow:hidden;">
<img src="${fp.product_picture}"
 alt="How to care for your cotton.">
</a>
<div class="media-body">
<p class="fs-12 mb-1 lh-12 text-uppercase letter-spacing-05" style="color:black;">
<b>前一個商品</b>
</p>
<a href="/inhouse/shop/findById/${fp.product_id}" class="font-weight-bold">
${fp.product_name}
</a>
</div>
</div>
</div>
</c:forEach>

<c:forEach items="${findNext}" var="fn">
<div class="col-sm-6 align-items-center">
<div class="media align-items-center justify-content-end py-1">
<div class="media-body text-right">
<p class="fs-12 mb-1 lh-12 text-uppercase letter-spacing-05" style="color:black;">
<b>下一個商品</b>
</p>
<a href="/inhouse/shop/findById/${fn.product_id}" class="font-weight-bold">
${fn.product_name}
</a>
</div>
<a href="/inhouse/shop/findById/${fn.product_id}" class="w-70px d-block ml-2"
style="display:inline-block;width:100%;height:50px;overflow:hidden;">
<img src="${fn.product_picture}"
 alt="Time for new start ? We’re hiring">
</a>
<a href="/inhouse/shop/findById/${fn.product_id}" class="fs-14 ml-4"><i class="fas fa-arrow-right"></i></a>
</div>
</div>
</c:forEach>

</div>
</div>
</div>	
		
		
		
		
		
		
		
		
		<section class="pt-10 pb-lg-15 pb-11">
			<div class="container">
				<div class="row no-gutters">
					<div class="col-md-7 mb-6 mb-md-0 pr-md-6 pr-lg-9">
						<div class="galleries position-relative">
<!-- 							<div -->
<!-- 								class="position-absolute pos-fixed-top-right pr-4 pt-4 z-index-2"> -->
<!-- 								<a href="#" data-toggle="tooltip" data-placement="left" -->
<!-- 									title="Add to favourite" -->
<!-- 									class="add-to-wishlist d-flex align-items-center justify-content-center text-primary bg-white hover-white bg-hover-primary w-45px h-45px rounded-circle mb-2 border"> -->
<!-- 									<i class="far fa-heart"></i> -->
<!-- 								</a> <a href="#" data-toggle="tooltip" data-placement="left" -->
<!-- 									title="Add to compare" -->
<!-- 									class="add-to-compare d-flex align-items-center justify-content-center text-primary bg-white hover-white bg-hover-primary w-45px h-45px rounded-circle mb-2 border"> -->
<!-- 									<i class="far fa-random"></i> -->
<!-- 								</a> -->
<!-- 							</div> -->
							<div class="slick-slider slider-for"
								data-slick-options='{"slidesToShow": 1, "autoplay":false,"dots":false,"arrows":false,"asNavFor": ".slider-nav"}'>
								<!-- 商品圖片 -->
								<div class="box">
									<div class="card p-0 hover-change-image rounded-0 border-0">
										<a href="${FindById.product_picture}"
											class="card-img ratio ratio-1-1 bg-img-cover-center"
											data-gtf-mfp="true" data-gallery-id="02"
											style="background-image: url('${FindById.product_picture}'); height:450px; width:450px">
										</a>
									</div>
								</div>
<!-- 								<div class="box"> -->
<!-- 									<div class="card p-0 hover-change-image rounded-0 border-0"> -->
<!-- 										<a href="/images/product-page-15.jpg" -->
<!-- 											class="card-img ratio ratio-1-1 bg-img-cover-center" -->
<!-- 											data-gtf-mfp="true" data-gallery-id="02" -->
<!-- 											style="background-image: url('/images/product-page-15.jpg')"> -->
<!-- 										</a> -->
<!-- 									</div> -->
<!-- 								</div> -->
<!-- 								<div class="box"> -->
<!-- 									<div class="card p-0 hover-change-image rounded-0 border-0"> -->
<!-- 										<a href="images/product-page-16.jpg" -->
<!-- 											class="card-img ratio ratio-1-1 bg-img-cover-center" -->
<!-- 											data-gtf-mfp="true" data-gallery-id="02" -->
<!-- 											style="background-image: url('/images/product-page-16.jpg')"> -->
<!-- 										</a> -->
<!-- 									</div> -->
<!-- 								</div> -->
<!-- 								<div class="box"> -->
<!-- 									<div class="card p-0 hover-change-image rounded-0 border-0"> -->
<!-- 										<a href="images/product-page-14.jpg" -->
<!-- 											class="card-img ratio ratio-1-1 bg-img-cover-center" -->
<!-- 											data-gtf-mfp="true" data-gallery-id="02" -->
<!-- 											style="background-image: url('/images/product-page-14.jpg')"> -->
<!-- 										</a> -->
<!-- 									</div> -->
<!-- 								</div> -->
							</div>
<!-- 							<div class="slick-slider slider-nav mt-1 mx-n1" -->
<!-- 								data-slick-options='{"slidesToShow": 4, "autoplay":false,"dots":false,"arrows":false,"asNavFor": ".slider-for","focusOnSelect": true,"responsive":[{"breakpoint": 768,"settings": {"slidesToShow": 3,"arrows":false}},{"breakpoint": 576,"settings": {"slidesToShow": 2,"arrows":false}}]}'> -->
<!-- 								<div class="box px-0"> -->
<!-- 									<div class="bg-white p-1 h-100 rounded-0"> -->
<!-- 										<img src="images/product-page-13.jpg" alt="Image 1" -->
<!-- 											class="h-100 w-100"> -->
<!-- 									</div> -->
<!-- 								</div> -->
<!-- 								<div class="box px-0"> -->
<!-- 									<div class="bg-white p-1 h-100 rounded-0"> -->
<!-- 										<img src="images/product-page-15.jpg" alt="Image 2" -->
<!-- 											class="h-100 w-100"> -->
<!-- 									</div> -->
<!-- 								</div> -->
<!-- 								<div class="box px-0"> -->
<!-- 									<div class="bg-white p-1 h-100 rounded-0"> -->
<!-- 										<img src="images/product-page-16.jpg" alt="Image 3" -->
<!-- 											class="h-100 w-100"> -->
<!-- 									</div> -->
<!-- 								</div> -->
<!-- 								<div class="box px-0"> -->
<!-- 									<div class="bg-white p-1 h-100 rounded-0"> -->
<!-- 										<img src="images/product-page-14.jpg" alt="Image 4" -->
<!-- 											class="h-100 w-100"> -->
<!-- 									</div> -->
<!-- 								</div> -->
<!-- 							</div> -->
						</div>
					</div>
					<div class="col-md-5">
					
						<p  class=" fs-20 font-weight-500 letter-spacing-05 text-uppercase mb-3" style="color:black;">${FindById.product_type}</p>
						<h2 class="fs-30 fs-lg-40 mb-2">${FindById.product_name}</h2>
						<p class="fs-20 text-primary mb-4">${FindById.product_price}</p>
<!-- 						<p class="mb-4 d-flex text-primary"> -->
<!-- 							<span class="d-inline-block mr-2 fs-14"><i -->
<!-- 								class="far fa-stopwatch"></i></span> <span class="fs-15">Only <span -->
<!-- 								class="font-weight-600">11</span> Left in Stock -->
<!-- 							</span> -->
<!-- 						</p> -->
						<p class="mb-5" style="color:black;">${FindById.product_size}</p>
<!-- 						<img class="border mb-6" src="images/product-page-09.jpg" -->
<!-- 							alt="Image Product"> -->
						<form>
							<div class="form-group shop-swatch mb-6">
								<label class="mb-3"><span
									class="text-primary fs-16 font-weight-bold">Color:</span> <span
									class="var text-capitalize text-primary">${FindById.product_color}</span></label>
							</div>
							<!-- 俊源要修改 -->
							<button type="submit" class="btn btn-primary btn-block mb-4">加到購物車</button>
							<ul
								class="list-inline px-xl-8 mb-4 d-flex align-items-center justify-content-center">
								<li class="list-inline-item mr-5"><img class=""
									src="/images/p1.png" alt="Visa"></li>
								<li class="list-inline-item mr-5"><img class=""
									src="/images/p2.png" alt="Visa"></li>
								<li class="list-inline-item mr-5"><img class=""
									src="/images/p3.png" alt="Visa"></li>
								<li class="list-inline-item mr-5"><img class=""
									src="/images/p4.png" alt="Visa"></li>
								<li class="list-inline-item mr-5"><img class=""
									src="/images/p5.png" alt="Visa"></li>
							</ul>
						</form>
					</div>
				</div>
			</div>
		</section>

		
		<section class="pb-11 pb-lg-13">
			<div class="container">
				<div class="collapse-tabs">
					<ul
						class="nav nav-pills mb-3 justify-content-center d-md-flex d-none"
						id="pills-tab" role="tablist">
						<li class="nav-item"><a
							class="nav-link active show fs-lg-30 fs-24 font-weight-bold p-0 mr-md-10 mr-4"
							id="pills-description-tab" data-toggle="pill"
							href="#pills-description" role="tab"
							aria-controls="pills-description" aria-selected="false">商品描述</a>
						</li>
						<li class="nav-item"><a
							class="nav-link fs-lg-30 fs-24 font-weight-bold p-0 mr-md-10 mr-4"
							id="pills-infomation-tab" data-toggle="pill"
							href="#pills-infomation" role="tab"
							aria-controls="pills-infomation" aria-selected="false">詳細資料</a>
						</li>
						<li class="nav-item"><a
							class="nav-link fs-lg-30 fs-24 font-weight-bold p-0"
							id="pills-reviews-tab" data-toggle="pill" href="#pills-reviews"
							role="tab" aria-controls="pills-reviews" aria-selected="true">付款及取貨方式
								</a></li>
					</ul>
					<div class="tab-content bg-white-md shadow-none py-md-5 p-0">
						<div id="collapse-tabs-accordion-01">
							<div class="tab-pane tab-pane-parent fade show active"
								id="pills-description" role="tabpanel">
								<div class="card border-0 bg-transparent">
									<div
										class="card-header border-0 d-block d-md-none bg-transparent px-0 py-1"
										id="headingDetails-01">
										<h5 class="mb-0">
											<button
												class="btn lh-2 fs-18 py-1 px-6 shadow-none w-100 collapse-parent border text-primary"
												data-toggle="false" data-target="#description-collapse-01"
												aria-expanded="true" aria-controls="description-collapse-01">
												商品描述</button>
										</h5>
									</div>
									<div id="description-collapse-01"
										class="collapsible collapse show"
										aria-labelledby="headingDetails-01"
										data-parent="#collapse-tabs-accordion-01" style="">
										<div id="accordion-style-01"
											class="accordion accordion-01 border-md-0 border p-md-0 p-6">
											
											<p class="mt-6 mt-md-10 mxw-830 mx-auto mb-0" style="color:black;">${FindById.product_descrip}</p>
										</div>
									</div>
								</div>
							</div>
							<div class="tab-pane tab-pane-parent fade" id="pills-infomation"
								role="tabpanel">
								<div class="card border-0 bg-transparent">
									<div
										class="card-header border-0 d-block d-md-none bg-transparent px-0 py-1"
										id="headinginfomation-01">
										<h5 class="mb-0">
											<button
												class="btn lh-2 fs-18 py-1 px-6 shadow-none w-100 collapse-parent border collapsed text-primary"
												data-toggle="collapse" data-target="#infomation-collapse-01"
												aria-expanded="false" aria-controls="infomation-collapse-01">
												詳細資料</button>
										</h5>
									</div>
									<div id="infomation-collapse-01" class="collapsible collapse"
										aria-labelledby="headinginfomation-01"
										data-parent="#collapse-tabs-accordion-01" style="">
										<div id="accordion-style-01-2"
											class="accordion accordion-01 border-md-0 border p-md-0 p-6 ">
											<div class="mxw-830 mx-auto pt-md-4">
												<div class="table-responsive mb-md-7">
													<table class="table table-border-top-0">
														<tbody>
															<tr>
																<td class="pl-0">種類</td>
																<td class="text-right pr-0">${FindById.product_type}</td>
															</tr>
															<tr>
																<td class="pl-0">顏色</td>
																<td class="text-right pr-0">${FindById.product_color}</td>
															</tr>
															<tr>
																<td class="pl-0">尺寸</td>
																<td class="text-right pr-0">${FindById.product_size}</td>
															</tr>
														</tbody>
													</table>
												</div>
												<div class="row">
<!-- 													<div class="col-sm-3 col-md-2 mb-6 mb-sm-0"> -->
<!-- 														<img class="border" src="/images/product-page-09.jpg" -->
<!-- 															alt="Image Product"> -->
<!-- 													</div> -->
<%-- 													<a href="${FindById.product_picture}" --%>
<!-- 														class="card-img ratio ratio-1-1 bg-img-cover-center" -->
<!-- 														data-gtf-mfp="true" data-gallery-id="02" -->
<%-- 														style="background-image: url('${FindById.product_picture}'); height:450px; width:450px; display:block; margin:auto;"> --%>
<!-- 													</a> -->
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
							<!-- 評價 -->
<!-- 							<div class="tab-pane tab-pane-parent fade" id="pills-reviews" -->
<!-- 								role="tabpanel"> -->
<!-- 								<div class="card border-0 bg-transparent"> -->
<!-- 									<div -->
<!-- 										class="card-header border-0 d-block d-md-none bg-transparent px-0 py-1" -->
<!-- 										id="headingreviews-01"> -->
<!-- 										<h5 class="mb-0"> -->
<!-- 											<button -->
<!-- 												class="btn lh-2 fs-18 py-1 px-6 shadow-none w-100 collapse-parent border collapsed text-primary" -->
<!-- 												data-toggle="collapse" data-target="#reviews-collapse-01" -->
<!-- 												aria-expanded="false" aria-controls="reviews-collapse-01"> -->
<!-- 												Reviews (3)</button> -->
<!-- 										</h5> -->
<!-- 									</div> -->
<!-- 									<div id="reviews-collapse-01" class="collapsible collapse" -->
<!-- 										aria-labelledby="headingreviews-01" -->
<!-- 										data-parent="#collapse-tabs-accordion-01" style=""> -->
<!-- 										<div id="accordion-style-01-3" -->
<!-- 											class="accordion accordion-01 border-md-0 border p-md-0 p-6"> -->
<!-- 											<div class="comment-product mxw-830 mx-auto pt-md-4"> -->
<!-- 												<ul -->
<!-- 													class="list-inline mb-3 d-flex justify-content-center rating-result"> -->
<!-- 													<li class="list-inline-item fs-18 text-primary"><i -->
<!-- 														class="fas fa-star"></i></li> -->
<!-- 													<li class="list-inline-item fs-18 text-primary"><i -->
<!-- 														class="fas fa-star"></i></li> -->
<!-- 													<li class="list-inline-item fs-18 text-primary"><i -->
<!-- 														class="fas fa-star"></i></li> -->
<!-- 													<li class="list-inline-item fs-18 text-primary"><i -->
<!-- 														class="fas fa-star"></i></li> -->
<!-- 													<li class="list-inline-item fs-18 text-primary"><i -->
<!-- 														class="fas fa-star"></i></li> -->
<!-- 												</ul> -->
<!-- 												<p class="text-center mb-10 fs-15 text-primary lh-1"> -->
<!-- 													<span class="d-inline-block border-right pr-1 mr-1">5.0</span>Base -->
<!-- 													on 3 Reviews -->
<!-- 												</p> -->
<!-- 												<div class="media border-bottom pb-6 mb-6 "> -->
<!-- 													<div class="w-70px d-block mr-6"> -->
<!-- 														<img src="images/tes_01.png" alt="Dean. D"> -->
<!-- 													</div> -->
<!-- 													<div class="media-body mb-1"> -->
<!-- 														<div -->
<!-- 															class="row no-gutters mb-1 align-items-center rating-result"> -->
<!-- 															<ul class="list-inline mb-0 mr-auto d-flex col-sm-6"> -->
<!-- 																<li class="list-inline-item fs-12 text-primary"><i -->
<!-- 																	class="fas fa-star"></i></li> -->
<!-- 																<li class="list-inline-item fs-12 text-primary"><i -->
<!-- 																	class="fas fa-star"></i></li> -->
<!-- 																<li class="list-inline-item fs-12 text-primary"><i -->
<!-- 																	class="fas fa-star"></i></li> -->
<!-- 																<li class="list-inline-item fs-12 text-primary"><i -->
<!-- 																	class="fas fa-star"></i></li> -->
<!-- 																<li class="list-inline-item fs-12 text-primary"><i -->
<!-- 																	class="fas fa-star"></i></li> -->
<!-- 															</ul> -->
<!-- 															<div class="col-sm-6 text-sm-right"> -->
<!-- 																<span class="fs-12 text-primary">Nov 20, 2020</span> -->
<!-- 															</div> -->
<!-- 														</div> -->
<!-- 														<p class="text-gray-01 lh-175 mb-1">It has a really -->
<!-- 															nice fit however it loses many fluffs and is kind of -->
<!-- 															see-through because the fabric is quite wid-meshed. -->
<!-- 															Nevertheless it's a really good and comfy staple that -->
<!-- 															goes with every kind.</p> -->
<!-- 														<span class="font-weight-500 text-primary d-block">Dean. -->
<!-- 															D</span> -->
<!-- 													</div> -->
<!-- 												</div> -->
<!-- 												<div class="media border-bottom pb-6 mb-6 "> -->
<!-- 													<div class="w-70px d-block mr-6"> -->
<!-- 														<img src="images/tes_02.png" alt="Dean. D"> -->
<!-- 													</div> -->
<!-- 													<div class="media-body mb-1"> -->
<!-- 														<div -->
<!-- 															class="row no-gutters mb-1 align-items-center rating-result"> -->
<!-- 															<ul class="list-inline mb-0 mr-auto d-flex col-sm-6"> -->
<!-- 																<li class="list-inline-item fs-12 text-primary"><i -->
<!-- 																	class="fas fa-star"></i></li> -->
<!-- 																<li class="list-inline-item fs-12 text-primary"><i -->
<!-- 																	class="fas fa-star"></i></li> -->
<!-- 																<li class="list-inline-item fs-12 text-primary"><i -->
<!-- 																	class="fas fa-star"></i></li> -->
<!-- 																<li class="list-inline-item fs-12 text-primary"><i -->
<!-- 																	class="fas fa-star"></i></li> -->
<!-- 																<li class="list-inline-item fs-12 text-primary"><i -->
<!-- 																	class="fas fa-star"></i></li> -->
<!-- 															</ul> -->
<!-- 															<div class="col-sm-6 text-sm-right"> -->
<!-- 																<span class="fs-12 text-primary">Nov 20, 2020</span> -->
<!-- 															</div> -->
<!-- 														</div> -->
<!-- 														<p class="text-gray-01 lh-175 mb-1">It has a really -->
<!-- 															nice fit however it loses many fluffs and is kind of -->
<!-- 															see-through because the fabric is quite wid-meshed. -->
<!-- 															Nevertheless it's a really good and comfy staple that -->
<!-- 															goes with every kind.</p> -->
<!-- 														<span class="font-weight-500 text-primary d-block">Dean. -->
<!-- 															D</span> -->
<!-- 													</div> -->
<!-- 												</div> -->
<!-- 												<div class="media "> -->
<!-- 													<div class="w-70px d-block mr-6"> -->
<!-- 														<img src="images/tes_03.png" alt="Dean. D"> -->
<!-- 													</div> -->
<!-- 													<div class="media-body mb-1"> -->
<!-- 														<div -->
<!-- 															class="row no-gutters mb-1 align-items-center rating-result"> -->
<!-- 															<ul class="list-inline mb-0 mr-auto d-flex col-sm-6"> -->
<!-- 																<li class="list-inline-item fs-12 text-primary"><i -->
<!-- 																	class="fas fa-star"></i></li> -->
<!-- 																<li class="list-inline-item fs-12 text-primary"><i -->
<!-- 																	class="fas fa-star"></i></li> -->
<!-- 																<li class="list-inline-item fs-12 text-primary"><i -->
<!-- 																	class="fas fa-star"></i></li> -->
<!-- 																<li class="list-inline-item fs-12 text-primary"><i -->
<!-- 																	class="fas fa-star"></i></li> -->
<!-- 																<li class="list-inline-item fs-12 text-primary"><i -->
<!-- 																	class="fas fa-star"></i></li> -->
<!-- 															</ul> -->
<!-- 															<div class="col-sm-6 text-sm-right"> -->
<!-- 																<span class="fs-12 text-primary">Nov 20, 2020</span> -->
<!-- 															</div> -->
<!-- 														</div> -->
<!-- 														<p class="text-gray-01 lh-175 mb-1">It has a really -->
<!-- 															nice fit however it loses many fluffs and is kind of -->
<!-- 															see-through because the fabric is quite wid-meshed. -->
<!-- 															Nevertheless it's a really good and comfy staple that -->
<!-- 															goes with every kind.</p> -->
<!-- 														<span class="font-weight-500 text-primary d-block">Dean. -->
<!-- 															D</span> -->
<!-- 													</div> -->
<!-- 												</div> -->
<!-- 												<div class="text-center mt-6 mt-md-9"> -->
<!-- 													<a href="#" class="btn btn-outline-primary write-review">write -->
<!-- 														a review</a> -->
<!-- 												</div> -->
<!-- 												<div class="card border-0 mt-9 form-review hide "> -->
<!-- 													<div class="card-body p-0"> -->
<!-- 														<h3 class="fs-40 text-center mb-9">Write A Review</h3> -->
<!-- 														<form> -->
<!-- 															<div class="d-flex flex-wrap"> -->
<!-- 																<p class="text-primary font-weight-bold mb-0 mr-2 mb-2">Your -->
<!-- 																	Rating</p> -->
<!-- 																<div -->
<!-- 																	class="form-group mb-6 d-flex justify-content-start"> -->
<!-- 																	<div class="rate-input"> -->
<!-- 																		<input type="radio" id="star5" name="rate" value="5"> -->
<!-- 																		<label for="star5" title="text" class="mb-0 mr-1 lh-1"> -->
<!-- 																			<i class="fal fa-star"></i> -->
<!-- 																		</label> <input type="radio" id="star4" name="rate" value="4"> -->
<!-- 																		<label for="star4" title="text" class="mb-0 mr-1 lh-1"> -->
<!-- 																			<i class="fal fa-star"></i> -->
<!-- 																		</label> <input type="radio" id="star3" name="rate" value="3"> -->
<!-- 																		<label for="star3" title="text" class="mb-0 mr-1 lh-1"> -->
<!-- 																			<i class="fal fa-star"></i> -->
<!-- 																		</label> <input type="radio" id="star2" name="rate" value="2"> -->
<!-- 																		<label for="star2" title="text" class="mb-0 mr-1 lh-1"> -->
<!-- 																			<i class="fal fa-star"></i> -->
<!-- 																		</label> <input type="radio" id="star1" name="rate" value="1"> -->
<!-- 																		<label for="star1" title="text" class="mb-0 mr-1 lh-1"> -->
<!-- 																			<i class="fal fa-star"></i> -->
<!-- 																		</label> -->
<!-- 																	</div> -->
<!-- 																</div> -->
<!-- 															</div> -->
<!-- 															<div class="row"> -->
<!-- 																<div class="col-sm-6"> -->
<!-- 																	<div class="form-group mb-6"> -->
<!-- 																		<input placeholder="Your Name*" class="form-control" -->
<!-- 																			type="text" name="name"> -->
<!-- 																	</div> -->
<!-- 																</div> -->
<!-- 																<div class="col-sm-6"> -->
<!-- 																	<div class="form-group mb-6"> -->
<!-- 																		<input type="email" placeholder="Your Email*" -->
<!-- 																			name="email" class="form-control"> -->
<!-- 																	</div> -->
<!-- 																</div> -->
<!-- 															</div> -->
<!-- 															<div class="form-group mb-8"> -->
<!-- 																<textarea class="form-control" placeholder="Your Review" -->
<!-- 																	name="message" rows="5"></textarea> -->
<!-- 															</div> -->
<!-- 															<div class="text-center"> -->
<!-- 																<button type="submit" class="btn btn-primary">submit -->
<!-- 																	now</button> -->
<!-- 															</div> -->
<!-- 														</form> -->
<!-- 													</div> -->
<!-- 												</div> -->
<!-- 											</div> -->
<!-- 										</div> -->
<!-- 									</div> -->
<!-- 								</div> -->
<!-- 							</div> -->
							<!-- 評價結束 -->
						</div>
					</div>
				</div>
			</div>
		</section>

		
<!-- 		<section class="pb-11 pb-lg-15"> -->
<!-- 			<div class="container container-xxl"> -->
<!-- 				<h2 class="fs-md-40 fs-30 mb-9 text-center">May You Like This</h2> -->
<!-- 				<div class="slick-slider" -->
<!-- 					data-slick-options='{"slidesToShow": 4, "autoplay":false,"dots":false,"arrows":false,"responsive":[{"breakpoint": 992,"settings": {"slidesToShow":3}},{"breakpoint": 768,"settings": {"slidesToShow": 2}},{"breakpoint": 576,"settings": {"slidesToShow": 1}}]}'> -->
<!-- 					<div class="box"> -->
<!-- 						<div class="card border-0 hover-change-content product"> -->
<!-- 							<div style="background-image: url('images/product-16.jpg')" -->
<!-- 								class="card-img ratio bg-img-cover-center ratio-1-1"></div> -->
<!-- 							<div class="card-img-overlay d-flex py-4 py-sm-5 pl-6 pr-4"> -->
<!-- 								<div class="d-flex flex-column"> -->
<!-- 									<a href="#" class="font-weight-bold mb-1 d-block lh-12">Bow -->
<!-- 										Chair</a> <a href="#" -->
<!-- 										class="text-uppercase text-muted letter-spacing-05 fs-12">chair</a> -->
<!-- 									<p class="mt-auto text-primary mb-0">$1390.00</p> -->
<!-- 								</div> -->
<!-- 								<div class="ml-auto d-flex flex-column"> -->
<!-- 									<div class="my-auto content-change-vertical"> -->
<!-- 										<a href="#" data-toggle="tooltip" data-placement="left" -->
<!-- 											title="Add to card" -->
<!-- 											class="add-to-cart d-flex align-items-center justify-content-center text-primary bg-white hover-white bg-hover-primary w-45px h-45px rounded-circle mb-2 border"> -->
<!-- 											<i class="far fa-shopping-basket"></i> -->
<!-- 										</a> <a href="#" data-toggle="tooltip" data-placement="left" -->
<!-- 											title="Add to favourite" -->
<!-- 											class="add-to-wishlist d-flex align-items-center justify-content-center text-primary bg-white hover-white bg-hover-primary w-45px h-45px rounded-circle mb-2 border"> -->
<!-- 											<i class="far fa-heart"></i> -->
<!-- 										</a> <a href="#" data-toggle="tooltip" data-placement="left" -->
<!-- 											title="Add to compare" -->
<!-- 											class="add-to-compare d-flex align-items-center justify-content-center text-primary bg-white hover-white bg-hover-primary w-45px h-45px rounded-circle mb-2 border"> -->
<!-- 											<i class="far fa-random"></i> -->
<!-- 										</a> <a href="#" data-toggle="tooltip" data-placement="left" -->
<!-- 											title="Preview" -->
<!-- 											class="preview d-flex align-items-center justify-content-center text-primary bg-white hover-white bg-hover-primary w-45px h-45px rounded-circle mb-2 border"> -->
<!-- 											<i class="far fa-eye"></i> -->
<!-- 										</a> -->
<!-- 									</div> -->
<!-- 								</div> -->
<!-- 							</div> -->
<!-- 						</div> -->
<!-- 					</div> -->
<!-- 					<div class="box"> -->
<!-- 						<div class="card border-0 hover-change-content product"> -->
<!-- 							<div style="background-image: url('images/product-04.jpg')" -->
<!-- 								class="card-img ratio bg-img-cover-center ratio-1-1"></div> -->
<!-- 							<div class="card-img-overlay d-flex py-4 py-sm-5 pl-6 pr-4"> -->
<!-- 								<div class="d-flex flex-column"> -->
<!-- 									<a href="#" class="font-weight-bold mb-1 d-block lh-12">Piper -->
<!-- 										Bar</a> <a href="#" -->
<!-- 										class="text-uppercase text-muted letter-spacing-05 fs-12">table</a> -->
<!-- 									<p class="mt-auto text-primary mb-0">$1390.00</p> -->
<!-- 								</div> -->
<!-- 								<div class="ml-auto d-flex flex-column"> -->
<!-- 									<div -->
<!-- 										class="badge badge-yellow badge-circle ml-auto w-45px h-45px fs-12 d-flex align-items-center justify-content-center mb-2"> -->
<!-- 										hot</div> -->
<!-- 									<div class="my-auto content-change-vertical"> -->
<!-- 										<a href="#" data-toggle="tooltip" data-placement="left" -->
<!-- 											title="Add to card" -->
<!-- 											class="add-to-cart d-flex align-items-center justify-content-center text-primary bg-white hover-white bg-hover-primary w-45px h-45px rounded-circle mb-2 border"> -->
<!-- 											<i class="far fa-shopping-basket"></i> -->
<!-- 										</a> <a href="#" data-toggle="tooltip" data-placement="left" -->
<!-- 											title="Add to favourite" -->
<!-- 											class="add-to-wishlist d-flex align-items-center justify-content-center text-primary bg-white hover-white bg-hover-primary w-45px h-45px rounded-circle mb-2 border"> -->
<!-- 											<i class="far fa-heart"></i> -->
<!-- 										</a> <a href="#" data-toggle="tooltip" data-placement="left" -->
<!-- 											title="Add to compare" -->
<!-- 											class="add-to-compare d-flex align-items-center justify-content-center text-primary bg-white hover-white bg-hover-primary w-45px h-45px rounded-circle mb-2 border"> -->
<!-- 											<i class="far fa-random"></i> -->
<!-- 										</a> <a href="#" data-toggle="tooltip" data-placement="left" -->
<!-- 											title="Preview" -->
<!-- 											class="preview d-flex align-items-center justify-content-center text-primary bg-white hover-white bg-hover-primary w-45px h-45px rounded-circle mb-2 border"> -->
<!-- 											<i class="far fa-eye"></i> -->
<!-- 										</a> -->
<!-- 									</div> -->
<!-- 								</div> -->
<!-- 							</div> -->
<!-- 						</div> -->
<!-- 					</div> -->
<!-- 					<div class="box"> -->
<!-- 						<div class="card border-0 hover-change-content product"> -->
<!-- 							<div style="background-image: url('images/product-06.jpg')" -->
<!-- 								class="card-img ratio bg-img-cover-center ratio-1-1"></div> -->
<!-- 							<div class="card-img-overlay d-flex py-4 py-sm-5 pl-6 pr-4"> -->
<!-- 								<div class="d-flex flex-column"> -->
<!-- 									<a href="#" class="font-weight-bold mb-1 d-block lh-12">Golden -->
<!-- 										Clock</a> <a href="#" -->
<!-- 										class="text-uppercase text-muted letter-spacing-05 fs-12">decor</a> -->
<!-- 									<p class="mt-auto text-primary mb-0">$1390.00</p> -->
<!-- 								</div> -->
<!-- 								<div class="ml-auto d-flex flex-column"> -->
<!-- 									<div class="my-auto content-change-vertical"> -->
<!-- 										<a href="#" data-toggle="tooltip" data-placement="left" -->
<!-- 											title="Add to card" -->
<!-- 											class="add-to-cart d-flex align-items-center justify-content-center text-primary bg-white hover-white bg-hover-primary w-45px h-45px rounded-circle mb-2 border"> -->
<!-- 											<i class="far fa-shopping-basket"></i> -->
<!-- 										</a> <a href="#" data-toggle="tooltip" data-placement="left" -->
<!-- 											title="Add to favourite" -->
<!-- 											class="add-to-wishlist d-flex align-items-center justify-content-center text-primary bg-white hover-white bg-hover-primary w-45px h-45px rounded-circle mb-2 border"> -->
<!-- 											<i class="far fa-heart"></i> -->
<!-- 										</a> <a href="#" data-toggle="tooltip" data-placement="left" -->
<!-- 											title="Add to compare" -->
<!-- 											class="add-to-compare d-flex align-items-center justify-content-center text-primary bg-white hover-white bg-hover-primary w-45px h-45px rounded-circle mb-2 border"> -->
<!-- 											<i class="far fa-random"></i> -->
<!-- 										</a> <a href="#" data-toggle="tooltip" data-placement="left" -->
<!-- 											title="Preview" -->
<!-- 											class="preview d-flex align-items-center justify-content-center text-primary bg-white hover-white bg-hover-primary w-45px h-45px rounded-circle mb-2 border"> -->
<!-- 											<i class="far fa-eye"></i> -->
<!-- 										</a> -->
<!-- 									</div> -->
<!-- 								</div> -->
<!-- 							</div> -->
<!-- 						</div> -->
<!-- 					</div> -->
<!-- 					<div class="box"> -->
<!-- 						<div class="card border-0 hover-change-content product"> -->
<!-- 							<div style="background-image: url('images/product-05.jpg')" -->
<!-- 								class="card-img ratio bg-img-cover-center ratio-1-1"></div> -->
<!-- 							<div class="card-img-overlay d-flex py-4 py-sm-5 pl-6 pr-4"> -->
<!-- 								<div class="d-flex flex-column"> -->
<!-- 									<a href="#" class="font-weight-bold mb-1 d-block lh-12">Piper -->
<!-- 										Bar</a> <a href="#" -->
<!-- 										class="text-uppercase text-muted letter-spacing-05 fs-12">Table</a> -->
<!-- 									<p class="mt-auto text-primary mb-0">$1390.00</p> -->
<!-- 								</div> -->
<!-- 								<div class="ml-auto d-flex flex-column"> -->
<!-- 									<div class="my-auto content-change-vertical"> -->
<!-- 										<a href="#" data-toggle="tooltip" data-placement="left" -->
<!-- 											title="Add to card" -->
<!-- 											class="add-to-cart d-flex align-items-center justify-content-center text-primary bg-white hover-white bg-hover-primary w-45px h-45px rounded-circle mb-2 border"> -->
<!-- 											<i class="far fa-shopping-basket"></i> -->
<!-- 										</a> <a href="#" data-toggle="tooltip" data-placement="left" -->
<!-- 											title="Add to favourite" -->
<!-- 											class="add-to-wishlist d-flex align-items-center justify-content-center text-primary bg-white hover-white bg-hover-primary w-45px h-45px rounded-circle mb-2 border"> -->
<!-- 											<i class="far fa-heart"></i> -->
<!-- 										</a> <a href="#" data-toggle="tooltip" data-placement="left" -->
<!-- 											title="Add to compare" -->
<!-- 											class="add-to-compare d-flex align-items-center justify-content-center text-primary bg-white hover-white bg-hover-primary w-45px h-45px rounded-circle mb-2 border"> -->
<!-- 											<i class="far fa-random"></i> -->
<!-- 										</a> <a href="#" data-toggle="tooltip" data-placement="left" -->
<!-- 											title="Preview" -->
<!-- 											class="preview d-flex align-items-center justify-content-center text-primary bg-white hover-white bg-hover-primary w-45px h-45px rounded-circle mb-2 border"> -->
<!-- 											<i class="far fa-eye"></i> -->
<!-- 										</a> -->
<!-- 									</div> -->
<!-- 								</div> -->
<!-- 							</div> -->
<!-- 						</div> -->
<!-- 					</div> -->
<!-- 					<div class="box"> -->
<!-- 						<div class="card border-0 hover-change-content product"> -->
<!-- 							<div style="background-image: url('images/product-16.jpg')" -->
<!-- 								class="card-img ratio bg-img-cover-center ratio-1-1"></div> -->
<!-- 							<div class="card-img-overlay d-flex py-4 py-sm-5 pl-6 pr-4"> -->
<!-- 								<div class="d-flex flex-column"> -->
<!-- 									<a href="#" class="font-weight-bold mb-1 d-block lh-12">Golden -->
<!-- 										Clock</a> <a href="#" -->
<!-- 										class="text-uppercase text-muted letter-spacing-05 fs-12">decor</a> -->
<!-- 									<p class="mt-auto text-primary mb-0">$1390.00</p> -->
<!-- 								</div> -->
<!-- 								<div class="ml-auto d-flex flex-column"> -->
<!-- 									<div class="my-auto content-change-vertical"> -->
<!-- 										<a href="#" data-toggle="tooltip" data-placement="left" -->
<!-- 											title="Add to card" -->
<!-- 											class="add-to-cart d-flex align-items-center justify-content-center text-primary bg-white hover-white bg-hover-primary w-45px h-45px rounded-circle mb-2 border"> -->
<!-- 											<i class="far fa-shopping-basket"></i> -->
<!-- 										</a> <a href="#" data-toggle="tooltip" data-placement="left" -->
<!-- 											title="Add to favourite" -->
<!-- 											class="add-to-wishlist d-flex align-items-center justify-content-center text-primary bg-white hover-white bg-hover-primary w-45px h-45px rounded-circle mb-2 border"> -->
<!-- 											<i class="far fa-heart"></i> -->
<!-- 										</a> <a href="#" data-toggle="tooltip" data-placement="left" -->
<!-- 											title="Add to compare" -->
<!-- 											class="add-to-compare d-flex align-items-center justify-content-center text-primary bg-white hover-white bg-hover-primary w-45px h-45px rounded-circle mb-2 border"> -->
<!-- 											<i class="far fa-random"></i> -->
<!-- 										</a> <a href="#" data-toggle="tooltip" data-placement="left" -->
<!-- 											title="Preview" -->
<!-- 											class="preview d-flex align-items-center justify-content-center text-primary bg-white hover-white bg-hover-primary w-45px h-45px rounded-circle mb-2 border"> -->
<!-- 											<i class="far fa-eye"></i> -->
<!-- 										</a> -->
<!-- 									</div> -->
<!-- 								</div> -->
<!-- 							</div> -->
<!-- 						</div> -->
<!-- 					</div> -->
<!-- 					<div class="box"> -->
<!-- 						<div class="card border-0 hover-change-content product"> -->
<!-- 							<div style="background-image: url('images/product-04.jpg')" -->
<!-- 								class="card-img ratio bg-img-cover-center ratio-1-1"></div> -->
<!-- 							<div class="card-img-overlay d-flex py-4 py-sm-5 pl-6 pr-4"> -->
<!-- 								<div class="d-flex flex-column"> -->
<!-- 									<a href="#" class="font-weight-bold mb-1 d-block lh-12">Piper -->
<!-- 										Bar</a> <a href="#" -->
<!-- 										class="text-uppercase text-muted letter-spacing-05 fs-12">Table</a> -->
<!-- 									<p class="mt-auto text-primary mb-0">$1390.00</p> -->
<!-- 								</div> -->
<!-- 								<div class="ml-auto d-flex flex-column"> -->
<!-- 									<div class="my-auto content-change-vertical"> -->
<!-- 										<a href="#" data-toggle="tooltip" data-placement="left" -->
<!-- 											title="Add to card" -->
<!-- 											class="add-to-cart d-flex align-items-center justify-content-center text-primary bg-white hover-white bg-hover-primary w-45px h-45px rounded-circle mb-2 border"> -->
<!-- 											<i class="far fa-shopping-basket"></i> -->
<!-- 										</a> <a href="#" data-toggle="tooltip" data-placement="left" -->
<!-- 											title="Add to favourite" -->
<!-- 											class="add-to-wishlist d-flex align-items-center justify-content-center text-primary bg-white hover-white bg-hover-primary w-45px h-45px rounded-circle mb-2 border"> -->
<!-- 											<i class="far fa-heart"></i> -->
<!-- 										</a> <a href="#" data-toggle="tooltip" data-placement="left" -->
<!-- 											title="Add to compare" -->
<!-- 											class="add-to-compare d-flex align-items-center justify-content-center text-primary bg-white hover-white bg-hover-primary w-45px h-45px rounded-circle mb-2 border"> -->
<!-- 											<i class="far fa-random"></i> -->
<!-- 										</a> <a href="#" data-toggle="tooltip" data-placement="left" -->
<!-- 											title="Preview" -->
<!-- 											class="preview d-flex align-items-center justify-content-center text-primary bg-white hover-white bg-hover-primary w-45px h-45px rounded-circle mb-2 border"> -->
<!-- 											<i class="far fa-eye"></i> -->
<!-- 										</a> -->
<!-- 									</div> -->
<!-- 								</div> -->
<!-- 							</div> -->
<!-- 						</div> -->
<!-- 					</div> -->
<!-- 					<div class="box"> -->
<!-- 						<div class="card border-0 hover-change-content product"> -->
<!-- 							<div style="background-image: url('images/product-26.jpg')" -->
<!-- 								class="card-img ratio bg-img-cover-center ratio-1-1"></div> -->
<!-- 							<div class="card-img-overlay d-flex py-4 py-sm-5 pl-6 pr-4"> -->
<!-- 								<div class="d-flex flex-column"> -->
<!-- 									<a href="#" class="font-weight-bold mb-1 d-block lh-12">Golden -->
<!-- 										Clock</a> <a href="#" -->
<!-- 										class="text-uppercase text-muted letter-spacing-05 fs-12">decor</a> -->
<!-- 									<p class="mt-auto text-primary mb-0"> -->
<!-- 										<span -->
<!-- 											class="text-line-through text-secondary fs-14 d-inline-block mr-2">$1390.00</span> -->
<!-- 										$1000.00 -->
<!-- 									</p> -->
<!-- 								</div> -->
<!-- 								<div class="ml-auto d-flex flex-column"> -->
<!-- 									<div -->
<!-- 										class="badge badge-pink badge-circle ml-auto w-45px h-45px fs-12 d-flex align-items-center justify-content-center mb-2"> -->
<!-- 										sale</div> -->
<!-- 									<div class="my-auto content-change-vertical"> -->
<!-- 										<a href="#" data-toggle="tooltip" data-placement="left" -->
<!-- 											title="Add to card" -->
<!-- 											class="add-to-cart d-flex align-items-center justify-content-center text-primary bg-white hover-white bg-hover-primary w-45px h-45px rounded-circle mb-2 border"> -->
<!-- 											<i class="far fa-shopping-basket"></i> -->
<!-- 										</a> <a href="#" data-toggle="tooltip" data-placement="left" -->
<!-- 											title="Add to favourite" -->
<!-- 											class="add-to-wishlist d-flex align-items-center justify-content-center text-primary bg-white hover-white bg-hover-primary w-45px h-45px rounded-circle mb-2 border"> -->
<!-- 											<i class="far fa-heart"></i> -->
<!-- 										</a> <a href="#" data-toggle="tooltip" data-placement="left" -->
<!-- 											title="Add to compare" -->
<!-- 											class="add-to-compare d-flex align-items-center justify-content-center text-primary bg-white hover-white bg-hover-primary w-45px h-45px rounded-circle mb-2 border"> -->
<!-- 											<i class="far fa-random"></i> -->
<!-- 										</a> <a href="#" data-toggle="tooltip" data-placement="left" -->
<!-- 											title="Preview" -->
<!-- 											class="preview d-flex align-items-center justify-content-center text-primary bg-white hover-white bg-hover-primary w-45px h-45px rounded-circle mb-2 border"> -->
<!-- 											<i class="far fa-eye"></i> -->
<!-- 										</a> -->
<!-- 									</div> -->
<!-- 								</div> -->
<!-- 							</div> -->
<!-- 						</div> -->
<!-- 					</div> -->
<!-- 					<div class="box"> -->
<!-- 						<div class="card border-0 hover-change-content product"> -->
<!-- 							<div style="background-image: url('images/product-05.jpg')" -->
<!-- 								class="card-img ratio bg-img-cover-center ratio-1-1"></div> -->
<!-- 							<div class="card-img-overlay d-flex py-4 py-sm-5 pl-6 pr-4"> -->
<!-- 								<div class="d-flex flex-column"> -->
<!-- 									<a href="#" class="font-weight-bold mb-1 d-block lh-12">Piper -->
<!-- 										Bar</a> <a href="#" -->
<!-- 										class="text-uppercase text-muted letter-spacing-05 fs-12">Table</a> -->
<!-- 									<p class="mt-auto text-primary mb-0">$1390.00</p> -->
<!-- 								</div> -->
<!-- 								<div class="ml-auto d-flex flex-column"> -->
<!-- 									<div -->
<!-- 										class="badge badge-yellow badge-circle ml-auto w-45px h-45px fs-12 d-flex align-items-center justify-content-center mb-2"> -->
<!-- 										hot</div> -->
<!-- 									<div class="my-auto content-change-vertical"> -->
<!-- 										<a href="#" data-toggle="tooltip" data-placement="left" -->
<!-- 											title="Add to card" -->
<!-- 											class="add-to-cart d-flex align-items-center justify-content-center text-primary bg-white hover-white bg-hover-primary w-45px h-45px rounded-circle mb-2 border"> -->
<!-- 											<i class="far fa-shopping-basket"></i> -->
<!-- 										</a> <a href="#" data-toggle="tooltip" data-placement="left" -->
<!-- 											title="Add to favourite" -->
<!-- 											class="add-to-wishlist d-flex align-items-center justify-content-center text-primary bg-white hover-white bg-hover-primary w-45px h-45px rounded-circle mb-2 border"> -->
<!-- 											<i class="far fa-heart"></i> -->
<!-- 										</a> <a href="#" data-toggle="tooltip" data-placement="left" -->
<!-- 											title="Add to compare" -->
<!-- 											class="add-to-compare d-flex align-items-center justify-content-center text-primary bg-white hover-white bg-hover-primary w-45px h-45px rounded-circle mb-2 border"> -->
<!-- 											<i class="far fa-random"></i> -->
<!-- 										</a> <a href="#" data-toggle="tooltip" data-placement="left" -->
<!-- 											title="Preview" -->
<!-- 											class="preview d-flex align-items-center justify-content-center text-primary bg-white hover-white bg-hover-primary w-45px h-45px rounded-circle mb-2 border"> -->
<!-- 											<i class="far fa-eye"></i> -->
<!-- 										</a> -->
<!-- 									</div> -->
<!-- 								</div> -->
<!-- 							</div> -->
<!-- 						</div> -->
<!-- 					</div> -->
<!-- 				</div> -->
<!-- 			</div> -->
<!-- 		</section> -->
		<!-- 你可能會喜歡 結束 -->
		
	</main>
	<%@include file="../homepage/footer.jsp"%>
	
	<!--購物車的東西開始 --><!--購物車的東西開始 --><!--購物車的東西開始 -->
	<script src="/js/shopcar.js"></script>
	<!--購物車的東西結束 --><!--購物車的東西結束 --><!--購物車的東西結束 -->

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

	<script src="/js/theme.js"></script>

	<div class="position-fixed pos-fixed-bottom-right p-6 z-index-10">
		<a href="#"
			class="gtf-back-to-top bg-white text-primary hover-white bg-hover-primary shadow p-0 w-52px h-52 rounded-circle fs-20 d-flex align-items-center justify-content-center"
			title="Back To Top"><i class="fal fa-arrow-up"></i></a>
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
					<input type="text" class="form-control w-100 text-primary mb-4"
					placeholder="Enter coupon code here">
					<!--<a href="#" class="d-block fs-14 text-uppercase letter-spacing-05 text-center font-weight-bold">View -->
					<!--Cart</a> -->
				</div>
			</form>

		</div>
		<button style="z-index:100" class="my-cart-checkout btn btn-primary btn-block mb-2">Check Out</button>
		</div>
	</div>
	
	<!--購物車的東西結束 --><!--購物車的東西結束 --><!--購物車的東西結束 -->
	
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
	
	<div class="sidenav canvas-sidebar bg-white">
		<div class="canvas-overlay"></div>
		<div class="pt-5 pb-7 card border-0 h-100">
			<div
				class="d-flex align-items-center card-header border-0 py-0 pl-8 pr-7 mb-9 bg-transparent">
				<a href="index.html" class="d-block w-52px"> <img
					src="images/short_logo.png" alt="Furnitor">
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
<!-- 			<div -->
<!-- 				class="card-footer bg-transparent border-0 mt-auto pl-8 pr-7 pb-0 pt-4"> -->
<!-- 				<ul class="list-inline d-flex align-items-center mb-3"> -->
<!-- 					<li class="list-inline-item mr-4"><a href="#" -->
<!-- 						class="fs-20 lh-1"><i class="fab fa-pinterest-p"></i></a></li> -->
<!-- 					<li class="list-inline-item mr-4"><a href="#" -->
<!-- 						class="fs-20 lh-1"><i class="fab fa-facebook-f"></i></a></li> -->
<!-- 					<li class="list-inline-item mr-4"><a href="#" -->
<!-- 						class="fs-20 lh-1"><i class="fab fa-instagram"></i></a></li> -->
<!-- 					<li class="list-inline-item"><a href="#" class="fs-20 lh-1"><i -->
<!-- 							class="fab fa-twitter"></i></a></li> -->
<!-- 				</ul> -->
<!-- 				<p class="mb-0 text-gray"> -->
<!-- 					Copyright &copy; 2021.Company name All rights reserved.<a -->
<!-- 						target="_blank" href="https://sc.chinaz.com/moban/">&#x7F51;&#x9875;&#x6A21;&#x677F;</a> -->
<!-- 				</p> -->
<!-- 			</div> -->
		</div>
	</div>
</body>
</html>