<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
 <style type="text/css">
		@import url("https://fonts.googleapis.com/css?family=Noto+Sans+TC:100,300,400,500,700,900&display=swap");
		*{
  			margin: 0; */ */
  			padding: 0; */ */
  			list-style: none; */ */
		}
		body{
/* 			padding: 100px 0; */
/* 			background: linear-gradient(20deg,#3d5493,#1aa2a0) fixed center center / 100% 100%; */
		}
		.wrap{
			width: 1200px;
			margin: auto;
		}
		.item{
			display: flex;
			align-items: center;
			margin-bottom: 70px;
			font-family: 'Noto Sans TC', sans-serif;
		}
		.item h2{ font-weight: 900; }
		.item p{ font-weight: 300; }
		.item .pic{
			width: 55%;
			flex-shrink: 0;
		}
		.item .pic img{
			width: 100%;
			vertical-align: middle;
		}
		.item .txt{
			width: 55%;
			flex-shrink: 0;
			padding: 50px 30px;
			box-sizing: border-box;
			position: relative;
			z-index: 1;
		}
		.item > :first-child{
			margin-right: -10%;
		}
		.item:nth-child(1) .txt{
			background-color: rgba(149, 219, 214, .8);
		}
		.item:nth-child(2) .txt{
			background-color: rgba(221, 164, 255, .8);
		}
		.item:nth-child(3) .txt{
			background-color: rgba(254, 201, 121, .8);
		}
/* 		.item:nth-child(4) .txt{ */
/* 			background-color: rgba(149, 219, 214, .8); */
/* 		} */
	</style>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="Furniture Shop Html Template">
    <meta name="author" content="">
    <meta name="generator" content="Jekyll">
    <title>品牌故事</title>
<!--     <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.7/css/bootstrap.min.css"> -->
<!--     <link rel="stylesheet" href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css"> -->
    <link rel="stylesheet" href="/vendors/fontawesome-pro-5/css/all.css">
    <link rel="stylesheet" href="/vendors/bootstrap-select/css/bootstrap-select.min.css">
    <link rel="stylesheet" href="/vendors/slick/slick.min.css">
    <link rel="stylesheet" href="/vendors/magnific-popup/magnific-popup.min.css">
    <link rel="stylesheet" href="/vendors/jquery-ui/jquery-ui.min.css">
    <link rel="stylesheet" href="/vendors/animate.css">
    <link rel="stylesheet" href="/vendors/mapbox-gl/mapbox-gl.min.css">
    <link href="https://fonts.googleapis.com/css?family=Rubik:300,400,500,700,900" rel="stylesheet">
    <link rel="stylesheet" href="/css/themes.css">


    <link rel="icon" href="/images/logo.ico" type="image/x-icon">

    <meta name="twitter:card" content="summary">
    <meta name="twitter:site" content="@">
    <meta name="twitter:creator" content="@">
    <meta name="twitter:title" content="Home 01">
    <meta name="twitter:description" content="Furniture Shop Html Template">
    <meta name="twitter:image" content="/images/logo_01.png">
    <!-- 網頁資訊 之後可以再修改 -->
    <meta property="og:url" content="home-01.html">
    <meta property="og:title" content="Home 01">
    <meta property="og:description" content="inHouse">
    <meta property="og:type" content="website">
    <meta property="og:image" content="images/logo_01.png">
    <meta property="og:image:type" content="image/png">

    <meta property="og:image:width" content="1200">
    <meta property="og:image:height" content="630">
</head>

<body>
    <%@include file="../homepage/header.jsp"%>

<main id="content">
<section class="py-3 bg-color-3" style=height:130px;>
<div class="container">
<nav aria-label="breadcrumb">
<ol class="breadcrumb py-11">
<li class="breadcrumb-item"><a href="/inhouse/homepage">Home</a></li>
<li class="breadcrumb-item"><a href="/inhouse/about">關於</a></li>
<li class="breadcrumb-item active" aria-current="page">關於InHouse</li>
</ol>
</nav>
</div>
</section>

<!--   <main id="content"> -->
<!--         <section class="py-3 bg-color-3 style=height:130px;"> -->
<!--             <div class="container"> -->
<!--                 <nav aria-label="breadcrumb"> -->
<!--                     <ol class="breadcrumb py-0"> -->
<!--                         <li class="breadcrumb-item"><a href="index.html">首頁</a></li> -->
<!--                         <li class="breadcrumb-item active" aria-current="page">會員專區</li> -->
<!--                     </ol> -->
<!--                 </nav> -->
<!--             </div> -->
<!--         </section> -->
<!--              </div> -->

 
<hr size=3 color=#C2C2FF style="FILTER: alpha(opacity=100,finishopacity=0,style=3)">
<h2 class="fs-sm-40 mb-11 text-center">關於InHouse<hr size=3 color=#C2C2FF style="FILTER: alpha(opacity=100,finishopacity=0,style=3)"></h2>

    
   <!-- 分頁一 -->

<!--     <h1 style="margin-left:190px">品牌故事</h1> -->
<!--     <br> -->
<!--     <br> -->
<!--  	<div class="product-item"> -->
<!-- 				<div class="container"> -->
<!-- 					<div class="row"> -->
<!-- 						<div class="col-xs-12 col-sm-6"> -->
<!-- 							<div class="pic"> -->
<!-- 								<img class="img-responsive" src="/images/employee/1.jpg"> -->
<!-- 							</div> -->
<!-- 						</div> -->
<!-- 						<div class="col-xs-12 col-sm-6"> -->
<!-- 							<div class="txt"> -->
<!-- 							 <br> -->
<!--                              <br> -->
<!-- 								<h2 style="color:#00AA88"><strong>InHouse成立動機</strong></h2> -->
<!-- 								<p style="color:#000000;font-size:20px">主題為設計裝潢整合家具販售的店商平台，因疫情的關係 -->
<!-- 								，需在家遠距辦公及教學，並在去年時室內設計諮詢亮增加了1.85倍 -->
<!-- 								，所以建立一個不透過任何第三方，而是直接面對消費者著銷售的商業模式 -->
<!-- 								，提供完善的制度、注重消費著的體驗。</p> -->
<!-- 							</div> -->
<!-- 						</div> -->
<!-- 					</div> -->
<!-- 				</div> -->
<!-- 			</div> -->
			
<!-- <div class="product-item"> -->
<!-- 				<div class="container"> -->
<!-- 					<div class="row"> -->
<!-- 						<div class="col-xs-12 col-sm-6 col-sm-push-6"> -->
<!-- 							<div class="pic"> -->
<!-- 								<img class="img-responsive" src="/images/employee/2.jpg"> -->
<!-- 							</div> -->
<!-- 						</div> -->
<!-- 						<div class="col-xs-12 col-sm-6 col-sm-pull-6"> -->
<!-- 							<div class="txt"> -->
<!-- 							 <br> -->
<!--                              <br> -->
<!-- 								<h2 style="color:#00AA88"><strong>InHouse設計發想</strong></h2> -->
<!-- 								<p style="color:#000000;font-size:20px">⼩組的主題為設計裝潢整合傢俱販售的 -->
<!-- 									電商平台，在疫情之下，消費者在家即 -->
<!-- 									可觀看設計師作品、傢俱資訊及⽂章分 -->
<!-- 									享，並利⽤線上服務系統，預約及諮詢 -->
<!-- 									相關問題，還可透過⼩遊戲領取優惠 -->
<!-- 									卷；提供完善的制度及體驗，讓消費者 -->
<!-- 									能⽅便快速有效率的使⽤此平台。</p> -->
<!-- 							</div> -->
<!-- 						</div> -->
<!-- 					</div> -->
<!-- 				</div> -->
<!-- 			</div> -->

<!--             <br> -->
<!--             <br> -->
<!--             <br> -->
<!--             <br> -->


<div class="wrap">
		<!-- item 1  -->
		<div class="item">
			<div class="pic">
				<img src="https://picsum.photos/600/350?random=10">
			</div>
			<div class="txt">
				<h2>品牌故事</h2>
				<p style="color:black; font-size:20px;">於2021年5月4號於中壢資策會誕生,由熱愛程式碼的6位青年共同發想所創立
				，希望透過我們的巧思以及設計給用戶最好的體驗感受。</p>
			</div>
		</div>
		<!-- item 2  -->
		<div class="item">
			<div class="txt">
				<h2>InHouse成立動機</h2>
				<p style="color:black; font-size:20px;">主題為設計裝潢整合家具販售的電商平台，因疫情的關係
 								，需在家遠距辦公及教學，並在去年時室內設計諮詢量增加了1.85倍
 								，所以建立一個不透過任何第三方，而是直接面對消費者著銷售的商業模式
 								，提供完善的制度、注重消費者的體驗。</p>
			</div>
			<div class="pic">
				<img src="https://picsum.photos/600/350?random=11">
			</div>
		</div>
		<!-- item 3  -->
		<div class="item">
			<div class="pic">
				<img src="https://picsum.photos/600/350?random=12">
			</div>
			<div class="txt">
				<h2>InHouse設計發想</h2>
				<p style="color:black; font-size:20px;">⼩組的主題為設計裝潢整合傢俱販售的
					電商平台，在疫情之下，消費者在家即
					可觀看設計師作品、傢俱資訊及⽂章分
			    	享，並利⽤線上服務系統，預約及諮詢
					相關問題，還可透過⼩遊戲領取優惠
					卷；提供完善的制度及體驗，讓消費者
					能⽅便快速有效率的使⽤此平台。</p>
			</div>
		</div>
		<!-- item 4  -->
<!-- 		<div class="item"> -->
<!-- 			<div class="txt"> -->
<!-- 				<h2>這邊是敲碗區</h2> -->
<!-- 				<p>金魚的切版敲碗敲了一年總算...碗破了，切版的金魚就跑出來了，你還想看甚麼? 你要不要去拿個碗出來敲看看? 把碗敲破了的話，你就會...給你媽媽罵。</p> -->
<!-- 			</div> -->
<!-- 			<div class="pic"> -->
<!-- 				<img src="https://picsum.photos/600/350?random=13"> -->
<!-- 			</div> -->
<!-- 		</div> -->
	</div>











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



 <script src="/js_r/jquery.min.js"></script>
 <script src="/js_r/jquery-migrate-3.0.1.min.js"></script>
 <script src="/js_r/popper.min.js"></script>
 <script src="/js_r/bootstrap.min.js"></script>
 <script src="/js_r/jquery.waypoints.min.js"></script>
 <script src="/js_r/jquery.stellar.min.js"></script>
 <script src="/js_r/owl.carousel.min.js"></script>
 <script src="/js_r/aos.js"></script>
 <script src="/js_r/jquery.animateNumber.min.js"></script>
 <script src="/js_r/scrollax.min.js"></script>
 <script src="/js_r/main.js"></script>
  <!-- AddReserve JS loader -->

    <script src="/js/theme.js"></script>
   
    <div class="position-fixed pos-fixed-bottom-right p-6 z-index-10">
        <a href="#"
            class="gtf-back-to-top bg-white text-primary hover-white bg-hover-primary shadow p-0 w-52px h-52 rounded-circle fs-20 d-flex align-items-center justify-content-center"
            title="Back To Top"><i class="fal fa-arrow-up"></i></a>
    </div>
    <div class="canvas-sidebar cart-canvas">
        <div class="canvas-overlay">
        </div>
        <form class="h-100">
            <div class="card border-0 pt-5 pb-7 h-100">
                <div class="px-6 text-right">
                    <span class="canvas-close d-inline-block fs-24 mb-1 ml-auto lh-1 text-primary"><i
                            class="fal fa-times"></i></span>
                </div>
                <div class="card-header bg-transparent py-0 px-6">
                    <h3 class="fs-24 mb-5">
                        Your Cart
                    </h3>
                    <p class="fs-15 text-primary"><span class="d-inline-block mr-2 fs-14"><i
                                class="far fa-check-circle"></i></span>
                        Your cart is saved for the next <span class="font-weight-500">4m34s</span></p>
                </div>
                <div class="card-body px-6 pt-7 overflow-y-auto">
                    <div class="mb-6 d-flex">
                        <a href="#" class="d-block mr-4"><i class="fal fa-times"></i></a>
                        <div class="media">
                            <div class="w-70px mr-4">
                                <img src="images/cart-01.jpg" alt="Partridge Bar Stool">
                            </div>
                            <div class="media-body">
                                <p class="text-muted fs-12 mb-0 text-uppercase letter-spacing-05 lh-1 mb-1">chairs</p>
                                <a href="#" class="font-weight-bold mb-3 d-block">Partridge Bar Stool</a>
                                <div class="d-flex align-items-center">
                                    <div class="input-group position-relative">
                                        <a href="#" class="down position-absolute pos-fixed-left-center pl-2"><i
                                                class="far fa-minus"></i></a>
                                        <input type="number" class="w-100px px-6 text-center" value="1">
                                        <a href="#" class="up position-absolute pos-fixed-right-center pr-2"><i
                                                class="far fa-plus"></i>
                                        </a>
                                    </div>
                                    <p class="mb-0 ml-12 text-primary">$1250.00</p>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="mb-6 d-flex">
                        <a href="#" class="d-block mr-4"><i class="fal fa-times"></i></a>
                        <div class="media">
                            <div class="w-70px mr-4">
                                <img src="images/cart-02.jpg" alt="Partridge Bar Stool">
                            </div>
                            <div class="media-body">
                                <p class="text-muted fs-12 mb-0 text-uppercase letter-spacing-05 lh-1 mb-1">Table</p>
                                <a href="#" class="font-weight-bold mb-3 d-block">Partridge Round Bar</a>
                                <div class="d-flex align-items-center">
                                    <div class="input-group position-relative">
                                        <a href="#" class="down position-absolute pos-fixed-left-center pl-2"><i
                                                class="far fa-minus"></i></a>
                                        <input type="number" class="w-100px px-6 text-center number" value="1">
                                        <a href="#" class="up position-absolute pos-fixed-right-center pr-2"><i
                                                class="far fa-plus"></i>
                                        </a>
                                    </div>
                                    <p class="mb-0 ml-12 text-primary">$1250.00</p>
                                </div>
                            </div>
                        </div>
                    </div>
                    <p class="fs-15 text-primary pt-1">
                        <span class="d-inline-block mr-2 fs-14"><i class="fas fa-info-circle"></i></span>
                        Special instruction for seller
                    </p>
                </div>
                <div class="card-footer mt-auto border-0 bg-transparent px-6 pb-0 pt-5">
                    <div class="d-flex align-items-center mb-4">
                        <span class="font-weight-bold text-primary">Subtotal</span>
                        <span class="d-block ml-auto text-primary">$2000.00</span>
                    </div>
                    <input type="text" class="form-control w-100 text-primary mb-4"
                        placeholder="Enter coupon code here">
                    <input type="submit" class="btn btn-primary btn-block mb-2" value="Check Out">
                    <a href="#" class="d-block fs-14 text-uppercase letter-spacing-05 text-center font-weight-bold">View
                        Cart</a>
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
                <div class="input-group-append position-absolute pos-fixed-right-center">
                    <button class="input-group-text bg-transparent border-0 text-white fs-30 px-0 btn-lg"
                        type="submit"><i class="far fa-search"></i></button>
                </div>
            </div>
        </form>
    </div>
    <!-- 網頁縮小之後的功能列 -->
    <div class="sidenav canvas-sidebar bg-white">
        <div class="canvas-overlay">
        </div>
        <div class="pt-5 pb-7 card border-0 h-100">
            <div class="d-flex align-items-center card-header border-0 py-0 pl-8 pr-7 mb-9 bg-transparent">
                <a href="index.html" class="d-block w-52px">
                    <img src="images/short_logo.png" alt="Furnitor">
                </a>
                <span class="canvas-close d-inline-block text-right fs-24 ml-auto lh-1 text-primary"><i
                        class="fal fa-times"></i></span>
            </div>
            <div class="overflow-y-auto pb-6 pl-8 pr-7 card-body pt-0">
                <ul class="navbar-nav main-menu px-0">
                    <li aria-haspopup="true" aria-expanded="false" class="nav-item dropdown py-1 px-0">
                        <a class="nav-link dropdown-toggle p-0" href="#" data-toggle="dropdown">
                            關於
                            <span class="caret"></span>
                        </a>
                        <ul class="dropdown-menu pt-3 pb-0 pb-xl-3">
                            <li class="dropdown-item">
                                <a class="dropdown-link" href="#">
                                    品牌故事
                                </a>
                            </li>
                            <li class="dropdown-item">
                                <a class="dropdown-link" href="#">
                                    社會責任
                                </a>
                            </li>
                            <li class="dropdown-item">
                                <a class="dropdown-link" href="#">
                                    企業理念
                                </a>
                            </li>
                            <li class="dropdown-item">
                                <a class="dropdown-link" href="#">
                                    相關影片
                                </a>
                            </li>
                            <li class="dropdown-item">
                                <a class="dropdown-link" href="#">
                                    直營門市
                                </a>
                            </li>
                        </ul>
                    </li>
                    <li aria-haspopup="true" aria-expanded="false" class="nav-item dropdown py-1 px-0">
                        <a class="nav-link dropdown-toggle p-0" href="#" data-toggle="dropdown">
                            最新消息
                            <span class="caret"></span>
                        </a>
                        <ul class="dropdown-menu pt-3 pb-0 pb-xl-3">
                            <li class="dropdown-item">
                                <a class="dropdown-link" href="#">
                                    活動訊息(優惠券)
                                </a>
                            </li>
                            <li class="dropdown-item">
                                <a class="dropdown-link" href="#">
                                    新聞
                                </a>
                            </li>
                            <li class="dropdown-item">
                                <a class="dropdown-link" href="#">
                                    相關連結
                                </a>
                            </li>
                        </ul>
                    </li>
                    <li aria-haspopup="true" aria-expanded="false" class="nav-item dropdown py-1 px-0">
                        <a class="nav-link p-0" href="#">
                            設計師簡介
                            <span class="caret"></span>
                        </a>
                    </li>
                    <li aria-haspopup="true" aria-expanded="false" class="nav-item dropdown py-1 px-0">
                        <a class="nav-link p-0" href="#">
                            作品集
                            <span class="caret"></span>
                        </a>
                    </li>
                    <li aria-haspopup="true" aria-expanded="false" class="nav-item dropdown py-1 px-0">
                        <a class="nav-link dropdown-toggle p-0" href="#" data-toggle="dropdown">
                            精選專欄
                            <span class="caret"></span>
                        </a>
                        <ul class="dropdown-menu pt-3 pb-0 pb-xl-3">
                            <li class="dropdown-item">
                                <a class="dropdown-link" href="#">
                                    客戶心得分享
                                </a>
                            </li>
                            <li class="dropdown-item">
                                <a class="dropdown-link" href="#">
                                    名人推薦
                                </a>
                            </li>
                        </ul>
                    </li>
                    <li aria-haspopup="true" aria-expanded="false" class="nav-item dropdown py-1 px-0">
                        <a class="nav-link dropdown-toggle p-0" href="#" data-toggle="dropdown">
                            服務流程
                            <span class="caret"></span>
                        </a>
                        <ul class="dropdown-menu pt-3 pb-0 pb-xl-3">
                            <li class="dropdown-item">
                                <a class="dropdown-link" href="#">
                                    流程介紹
                                </a>
                            </li>
                            <li class="dropdown-item">
                                <a class="dropdown-link" href="#">
                                    專案合作
                                </a>
                            </li>
                            <li class="dropdown-item">
                                <a class="dropdown-link" href="#">
                                    預約(表單)
                                </a>
                            </li>
                        </ul>
                    </li>
                    <li aria-haspopup="true" aria-expanded="false" class="nav-item dropdown py-1 px-0">
                        <a class="nav-link p-0" href="#">
                            預約服務
                            <span class="caret"></span>
                        </a>
                    </li>
                    <li aria-haspopup="true" aria-expanded="false" class="nav-item dropdown py-1 px-0">
                        <a class="nav-link dropdown-toggle p-0" href="store.html" data-toggle="dropdown">
                            商品
                            <span class="caret"></span>
                        </a>
                        <!-- <div class="dropdown-menu p-0 dropdown-menu-listing x-animated x-fadeInUp">

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
                        </div> -->
                    </li>
                </ul>
            </div>
            <!-- <div class="card-footer bg-transparent border-0 mt-auto pl-8 pr-7 pb-0 pt-4">
                <ul class="list-inline d-flex align-items-center mb-3">
                    <li class="list-inline-item mr-4"><a href="#" class="fs-20 lh-1"><i
                                class="fab fa-pinterest-p"></i></a>
                    </li>
                    <li class="list-inline-item mr-4"><a href="#" class="fs-20 lh-1"><i
                                class="fab fa-facebook-f"></i></a></li>
                    <li class="list-inline-item mr-4"><a href="#" class="fs-20 lh-1"><i
                                class="fab fa-instagram"></i></a></li>
                    <li class="list-inline-item"><a href="#" class="fs-20 lh-1"><i class="fab fa-twitter"></i></a></li>
                </ul>
                <p class="mb-0 text-gray">Copyright &copy; 2021.Company name All rights reserved.<a target="_blank"
                        href="https://sc.chinaz.com/moban/">&#x7F51;&#x9875;&#x6A21;&#x677F;</a></p>
            </div> -->
        </div>
    </div>
</body>

</html>