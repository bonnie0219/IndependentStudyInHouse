<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="Furniture Shop Html Template">
    <meta name="author" content="">
    <meta name="generator" content="Jekyll">
    <title>預約成功畫面</title>

    <link rel="stylesheet" href="/vendors/fontawesome-pro-5/css/all.css">
    <link rel="stylesheet" href="/vendors/bootstrap-select/css/bootstrap-select.min.css">
    <link rel="stylesheet" href="/vendors/slick/slick.min.css">
    <link rel="stylesheet" href="/vendors/magnific-popup/magnific-popup.min.css">
    <link rel="stylesheet" href="/vendors/jquery-ui/jquery-ui.min.css">
    <link rel="stylesheet" href="/vendors/animate.css">
    <link rel="stylesheet" href="/vendors/mapbox-gl/mapbox-gl.min.css">
    <link href="https://fonts.googleapis.com/css?family=Rubik:300,400,500,700,900" rel="stylesheet">
    <link rel="stylesheet" href="/css/themes.css">

    <link rel="icon" href="/images/favicon.ico">

    <!-- AddReserve CSS -->
    <link rel="stylesheet" href="/css_r/animate.css">
    <link rel="stylesheet" href="/css_r/style.css">
    <!-- AddReserve CSS -->

    <!-- 分頁一 -->
    <link rel="stylesheet" href="/css_r/owl.carousel.min.css">
    <link rel="stylesheet" href="/css_r/icomoon.css">
    <!-- 分頁一 -->

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
    
    <!-- 線上客服開始 -->
	<link rel="stylesheet" type="text/css"
		  href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css">
	<link rel="stylesheet" href="/assets/css/chat.css">
	<link rel="stylesheet" href="/assets/css/typing.css">

<style>
* {
    box-sizing: border-box;
    margin: 0;
    padding: 0;
}

*, html {
    --primaryGradient: linear-gradient(93.12deg, #581B98 0.52%, #9C1DE7 100%);
    --secondaryGradient: linear-gradient(268.91deg, #581B98 -2.14%, #9C1DE7 99.69%);
    --primaryBoxShadow: 0px 10px 15px rgba(0, 0, 0, 0.1);
    --secondaryBoxShadow: 0px -10px 15px rgba(0, 0, 0, 0.1);
    --light: 300;
    --regular: 400;
    --semiBold: 600;
    --extraLight: 300;
    --italic: 300;
    --primary: #581B98;
}

/* 300;0,400;0,600;1,300 */

body {
    font-family: 'Nunito', sans-serif;
    font-weight: 400;
    font-size: 100%;
    background: #F1F1F1;
}

.chatbox__support {
    background: #f9f9f9;
    height: 450px;
    width: 350px;
    box-shadow: 0px 0px 15px rgba(0, 0, 0, 0.1);
    border-top-left-radius: 20px;
    border-top-right-radius: 20px;
}

/* HEADER */
.chatbox__header {
    background: var(--primaryGradient);
    display: flex; 
    flex-direction: row;
    align-items: center;
    justify-content: center;
    padding: 15px 20px;
    border-top-left-radius: 20px;
    border-top-right-radius: 20px;
    box-shadow: var(--primaryBoxShadow);
}

.chatbox__image--header {
    margin-right: 10px;
}

.chatbox__heading--header {
    font-size: 1.2rem;
    color: white;
}

.chatbox__description--header {
    font-size: .9rem;
    color: white;
}

/* Messages */
.chatbox__messages {
    padding: 0 20px;
}

.messages__item {
    margin-top: 10px;
    background: #E0E0E0; 
    padding: 8px 12px;
    max-width: 70%;
}

.messages__item--visitor,
.messages__item--typing {
    border-top-left-radius: 20px;
    border-top-right-radius: 20px;
    border-bottom-right-radius: 20px;
}

.messages__item--operator {
    border-top-left-radius: 20px;
    border-top-right-radius: 20px;
    border-bottom-left-radius: 20px;
    background: var(--primary);
    color: white;
}

/* FOOTER */
.chatbox__footer {
    display: flex; 
    flex-direction: row;
    align-items: center;
    justify-content: space-between;
    padding: 20px 20px;
    background: var(--secondaryGradient);
    box-shadow: var(--secondaryBoxShadow);
    border-bottom-right-radius: 10px;
    border-bottom-left-radius: 10px;
    margin-top: 20px;
}

.chatbox__footer input {
    border: none;
    padding: 10px 10px;
    border-radius: 30px;
    text-align: center;
}

.chatbox__send--footer {
    color: white;
}

.chatbox__button button,
.chatbox__button button:focus,
.chatbox__button button:visited {
    padding: 15px;
    background: white;
    border: none;  
    outline: none;  
/*      border-radius: 60px;  */
    border-top-left-radius: 50px;
    border-top-right-radius: 50px;
    border-bottom-left-radius: 50px;
    border-bottom-right-radius: 50px;
    box-shadow: 0px 10px 15px rgba(0, 0, 0, 0.1);
    cursor: pointer;  
/*  	position:flex;  */
/*  	top:100px;  */
/*    	left:10px;  */
/* /*  	display: flex;   */ */
/*  	bottom:80px;  */
/* 	right:10px; */
} 


</style>
	
	<script src="/assets/js/Chat.js"></script>
	
	<!-- 線上客服結束 -->
    
    
</head>

<body>
    <%@include file="../homepage/header.jsp"%>
    

    <br>
    <br>
    <br>
    <br>
    <br>
    <br>

    
   <!-- 分頁一 -->

   <section class="ftco-section ftco-project bg-light" data-section="projects">
    <div class="container-fluid px-md-5">
        <div class="row justify-content-center pb-5">
      <div class="col-md-12 heading-section text-center ftco-animate">
          <span class="subheading"></span>
        <h2 class="mb-4">Thank you :)</h2>
        <p>親愛的顧客您好，感謝您的預約!!</p>
        <p>您現在可至信箱收取信件，後續將有專人為您服務。</p>
      </div>
    </div>
   
    <br>
    <p>你可能也喜歡...</p>
        <div class="row">
            <div class="col-md-12 testimonial">
        <div class="carousel-project owl-carousel">
            <div class="item">
                <div class="project">
                            <div class="img">
                                <img src="/images/project-1.jpg" class="img-fluid" alt="Colorlib Template">
                                <a href="/images/project-1.jpg" class="icon image-popup d-flex justify-content-center align-items-center">
                                    <span class="icon-expand"></span>
                                </a>
                            </div>
                            <div class="text px-4">
                                <h3><a href="#">Office Interior Design</a></h3>
                                <span>Interior Design</span>
                            </div>
                        </div>
            </div>
            <div class="item">
                <div class="project">
                            <div class="img">
                                <img src="/images/project-2.jpg" class="img-fluid" alt="Colorlib Template">
                                <a href="/images/project-2.jpg" class="icon image-popup d-flex justify-content-center align-items-center">
                                    <span class="icon-expand"></span>
                                </a>
                            </div>
                            <div class="text px-4">
                                <h3><a href="#">Office Interior Design</a></h3>
                                <span>Interior Design</span>
                            </div>
                        </div>
            </div>
            <div class="item">
                <div class="project">
                            <div class="img">
                                <img src="/images/project-3.jpg" class="img-fluid" alt="Colorlib Template">
                                <a href="/images/project-3.jpg" class="icon image-popup d-flex justify-content-center align-items-center">
                                    <span class="icon-expand"></span>
                                </a>
                            </div>
                            <div class="text px-4">
                                <h3><a href="#">Office Interior Design</a></h3>
                                <span>Interior Design</span>
                            </div>
                        </div>
            </div>
            <div class="item">
                <div class="project">
                            <div class="img">
                                <img src="/images/project-4.jpg" class="img-fluid" alt="Colorlib Template">
                                <a href="/images/project-4.jpg" class="icon image-popup d-flex justify-content-center align-items-center">
                                    <span class="icon-expand"></span>
                                </a>
                            </div>
                            <div class="text px-4">
                                <h3><a href="#">Office Interior Design</a></h3>
                                <span>Interior Design</span>
                            </div>
                        </div>
            </div>
            <div class="item">
                <div class="project">
                            <div class="img">
                                <img src="/images/project-5.jpg" class="img-fluid" alt="Colorlib Template">
                                <a href="/images/project-5.jpg" class="icon image-popup d-flex justify-content-center align-items-center">
                                    <span class="icon-expand"></span>
                                </a>
                            </div>
                            <div class="text px-4">
                                <h3><a href="#">Office Interior Design</a></h3>
                                <span>Interior Design</span>
                            </div>
                        </div>
            </div>
            <div class="item">
                <div class="project">
                            <div class="img">
                                <img src="/images/project-6.jpg" class="img-fluid" alt="Colorlib Template">
                                <a href="/images/project-6.jpg" class="icon image-popup d-flex justify-content-center align-items-center">
                                    <span class="icon-expand"></span>
                                </a>
                            </div>
                            <div class="text px-4">
                                <h3><a href="#">Office Interior Design</a></h3>
                                <span>Interior Design</span>
                            </div>
                        </div>
            </div>
        </div>
      </div>
        </div>
    </div>
</section>








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

 <!-- AddReserve JS loader -->
 <div id="ftco-loader" class="show fullscreen"><svg class="circular" width="48px" height="48px"><circle class="path-bg" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke="#eeeeee"/><circle class="path" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke-miterlimit="10" stroke="#F96D00"/></svg></div>


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
<!--         <a href="#" -->
<!--             class="gtf-back-to-top bg-white text-primary hover-white bg-hover-primary shadow p-0 w-52px h-52 rounded-circle fs-20 d-flex align-items-center justify-content-center" -->
<!--             title="Back To Top"><i class="fal fa-arrow-up"></i></a> -->
            
         <%@include file="../message/message_new.jsp"%>   
            
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