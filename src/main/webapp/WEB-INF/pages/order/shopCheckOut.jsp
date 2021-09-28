<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!doctype html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="Furniture Shop Html Template">
    <meta name="author" content="">
    <meta name="generator" content="Jekyll">
    <title>結帳明細</title>

    <link rel="stylesheet" href="/vendors/fontawesome-pro-5/css/all.css">
    <link rel="stylesheet" href="/vendors/bootstrap-select/css/bootstrap-select.min.css">
    <link rel="stylesheet" href="/vendors/slick/slick.min.css">
    <link rel="stylesheet" href="/vendors/magnific-popup/magnific-popup.min.css">
    <link rel="stylesheet" href="/vendors/jquery-ui/jquery-ui.min.css">
    <link rel="stylesheet" href="/vendors/animate.css">
    <link rel="stylesheet" href="/vendors/mapbox-gl/mapbox-gl.min.css">

    <link rel="stylesheet" href="/css/themes.css">
    <link rel="icon" href="/images/logo.ico" type="image/x-icon">

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
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>

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

    <!-- 預約表單畫面 -->
    <section class="ftco-counter img ftco-section ftco-no-pt ftco-no-pb" id="section-counter" data-section="about">
        <div class="container">
            <div class="row d-flex">
                <!-- 圖片 -->
                <div class="col-md-8 col-lg-5 d-flex">
                    <div class="img d-flex align-self-stretch align-items-center"
                        style="background-image:url(/images/aboutCart.jpg);">

                    </div>
                </div>

                <div class="col-md-20 col-lg-5 pl-lg-10 py-10">
                    <div class="row justify-content-start pb-3">
                        <div class="col-md-12 heading-section ftco-animate">

                            <span class="subheading">Welcome</span>
                            <h2 class="mb-4">請輸入會員資訊</h2>
                            <!-- <p>A small river named Duden flows by their place and supplies it with the necessary regelialia. It is a paradisematic country, in which roasted parts of sentences fly into your mouth.</p>
		            <p>Even the all-powerful Pointing has no control about the blind texts it is an almost unorthographic life One day however a small line of blind text by the name of Lorem Ipsum decided to leave for the far World of Grammar.</p>
		            <p>A small river named Duden flows by their place and supplies it with the necessary regelialia. It is a paradisematic country, in which roasted parts of sentences fly into your mouth.</p>
		           -->

<!-- 							<form method="get"> -->
                            <table style=" border-collapse:separate; border-spacing:0px 10px;">
                            <button id="onepass">一鍵輸入</button>
                            	<tr>
                                    <td style="color:black;">會員ID</td>
                                    <td><input type="text" class="form-control form-control-sm"
                                            style="width: 200px; height: 30PX;color:black;" name="memberid"
                                            id="memberid" value="${member.member_id}" disabled="disabled"></td>
                                </tr>
                                <tr>
                                    <td style="color:black;">Email</td>
                                    <td><input type="text" class="form-control form-control-sm"
                                            style="width: 200px; height: 30PX;color:black;" name="email"
                                            id="email"></td>
                                </tr>
                                <tr>
                                    <td style="color:black;">手機號碼</td>
                                    <td><input type="text" class="form-control form-control-sm"
                                            style="width: 200px; height: 30PX;color:black;" name="phone"
                                            id="phone"></td>
                                </tr>
                                <tr>
                                    <td style="color:black;">地址</td>
                                    <td><input type="text" class="form-control form-control-sm"
                                            style="width: 200px; height: 30PX;color:black;" name="address"
                                            id="address"></td>
                                </tr>
<!--                                 <tr> -->
<!--                                     <td>付款方式</td> -->
<!--                                     <td> -->
<!--                                         <select class="form-control form-control-sm" style="width: 200px" -->
<!--                                             name="payment" id="payment"> -->
<!--                                             <option>Paypal</option> -->
<!--                                             <option>ecpay</option> -->
<!--                                         </select> -->
<!--                                     </td> -->
<!--                                 </tr> -->
                                <!-- <tr>
                                    <td>運送方式</td>
                                    <td>
                                        <select class="form-control form-control-sm" style="width: 200px"
                                            name="reserve_style" id="reserve_style">
                                            <option>Standard Delivery</option>
                                            <option>Express Delivery</option>
                                            <option>Next Business day</option>
                                        </select>
                                    </td>
                                </tr> -->
<!--                                 <tr> -->
<!--                                     <td>持卡人姓名 -->
<!--                                     <input type="text" class="form-control form-control-sm" -->
<!--                                             style="width: 200px; height: 30PX;" name="card" -->
<!--                                             id="card"></td>                                 -->
<!--                                     <td>信用卡號 -->
<!--                                     <input type="text" class="form-control form-control-sm" -->
<!--                                             style="width: 200px; height: 30PX;" name="cardid" -->
<!--                                             id="cardid"></td> -->
<!--                                 </tr> -->
<!--                                 <tr> -->
<!--                                     <td>有效日期 -->
<!--                                     <input type="text" class="form-control form-control-sm" -->
<!--                                             style="width: 200px; height: 30PX;" name="date" -->
<!--                                             id="date"></td>                                -->
<!--                                     <td>安全碼 -->
<!--                                     <input type="text" class="form-control form-control-sm" -->
<!--                                             style="width: 200px; height: 30PX;" name="cvv" -->
<!--                                             id="cvv"></td> -->
<!--                                 </tr> -->
<!--                                 <tr> -->
<!--                                     <td colspan="2"> -->
<!--                                         <div style="text-align:right"> -->
<!--                                            <button id="checkcard" class="btn btn btn-info py-3 px-4" style="defined">付款驗證</button> -->
<!--                                         </div> -->
<!--                                     </td> -->
<!--                                 </tr> -->
                                <tr>
                                    <td colspan="2">
                                        <br>
                                        <hr>
                                        <br>
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="2">
                                        <div class="col-md-12 col-lg-12">
                                            <div class="odr-box">
                                                <div class="title-left">
                                                    <h3>購物車</h3>
                                                </div>
                                                <div class="rounded p-2 bg-light">
                                                <div class="shopcartitem"></div>
                                                                                          
                                                </div>
                                                <div class="rounded p-2 bg-light">
                                    				<h5>訂單總價</h5>
                                    				<div class="ml-auto h5 " id="carttotal"></div>
                                				</div>
                                            </div>
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="2">
                                        <div class="form-group"  style="text-align:right">
                                        
                                            <button class="btn btn btn-info py-3 px-4" id="placeorder">送出訂單</button>
<!--                                             <input type="submit" class="btn btn btn-info py-3 px-4" id="placeorder"> -->
                                        </div>
                                    </td>
                                </tr>
                            </table>
<!-- 							</form> -->
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>



<!--     <footer class="pt-10 pb-9 footer bg-color-2"> -->
<!--         <div class="container container-xxl"> -->
<!--             <div class="row"> -->
<!--                 <div class="col-lg mb-6 mb-lg-0"> -->
<!--                     <a href="#" class="footer-logo d-block"><img src="/images/logo.png" alt="Furnitor" -->
<!--                             style="width: 120px ;"></a> -->
<!--                 </div> -->
<!--                 <div class="col-sm-８ col-lg mb-８ mb-md-0"> -->
<!--                     <ul class="list-unstyled"> -->
<!--                         <li class="py-0"><a href="#" class="lh-213">關於我們</a> </li> -->
<!--                         <li class="py-0"><a href="#" class="lh-213">網站地圖</a> </li> -->
<!--                         <li class="py-0"><a href="#" class="lh-213">電話：(03)4257387</a> </li> -->
<!--                         <li class="py-0"><a href="#" class="lh-213">地址：320桃園市中壢區中大路300號 國立中央大學</a> </li> -->
<!--                         <li class="py-0"><a href="#" class="lh-213">(工程二館側面/資策會大樓)</a> </li> -->
<!--                     </ul> -->
<!--                 </div> -->
<!--                 <div class="col-sm-８ col-lg mb-８ mb-md-0"> -->
<!--                     <ul class="list-unstyled"> -->
<!--                         <li class="py-0"><a href="#" class="lh-213">第六組</a> </li> -->
<!--                         <li class="py-0"><a href="#" class="lh-213">組　長：李岳蓁</a> </li> -->
<!--                         <li class="py-0"><a href="#" class="lh-213">技術長：王淳弘</a> </li> -->
<!--                         <li class="py-0"><a href="#" class="lh-213">組　員：邱若綺</a> </li> -->
<!--                         <li class="py-0"><a href="#" class="lh-213">　　　　江彥勳</a> </li> -->
<!--                         <li class="py-0"><a href="#" class="lh-213">　　　　徐璟文</a> </li> -->
<!--                         <li class="py-0"><a href="#" class="lh-213">　　　　陳俊源</a> </li> -->
<!--                     </ul> -->
<!--                 </div> -->

<!--                 <div class="col-sm-6 col-lg"> -->
<!--                     <ul class="list-inline text-lg-right"> -->
<!--                         <li class="list-inline-item mr-4"><a href="#" class="fs-20"><i -->
<!--                                     class="fab fa-pinterest-p"></i></a></li> -->
<!--                         <li class="list-inline-item mr-4"><a href="#" class="fs-20"><i -->
<!--                                     class="fab fa-facebook-f"></i></a></li> -->
<!--                         <li class="list-inline-item mr-4"><a href="#" class="fs-20"><i class="fab fa-instagram"></i></a> -->
<!--                         </li> -->
<!--                         <li class="list-inline-item"><a href="#" class="fs-20"><i class="fab fa-twitter"></i></a></li> -->
<!--                     </ul> -->
<!--                     <p class="mb-0 text-gray text-lg-right">&copy; 2021.InHouse -->
<!--                                             <a　target="_blank" href="https://sc.chinaz.com/moban/">&#x7F51;&#x9875;&#x6A21;&#x677F;</a></p> -->
<!--                 </div> -->
<!--             </div> -->
<!--         </div> -->
<!--     </footer> -->

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
    <div id="ftco-loader" class="show fullscreen"><svg class="circular" width="48px" height="48px">
            <circle class="path-bg" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke="#eeeeee" />
            <circle class="path" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke-miterlimit="10"
                stroke="#F96D00" />
        </svg></div>


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
                    <img src="/images/short_logo.png" alt="Furnitor">
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

                    </li>
                </ul>
            </div>

        </div>
    </div>
  	<script>
		$(document).ready(function() {
				var memberid = $('#memberid').val();
				var cartdetail = JSON.parse(localStorage.getItem("Cart"));
				console.log(cartdetail.items[0].id);
				
                for(let i=0; i<cartdetail.items.length; i++){
                	
                var itemperprice = parseFloat(cartdetail.items[i].price);
                var itemperqty = parseFloat(cartdetail.items[i].qty);
                var itemtotalprice = itemperprice*itemperqty;
				$('.shopcartitem').append(
                        '<div class="rounded p-2 bg-light">'+
                        '<div class="media mb-2 border-bottom">'+
                            '<div class="media-body">'+'<a href="detail.html">'+'產品名稱: '+cartdetail.items[i].name+'</a>'
                                +'<div class="small text-muted">'+'產品單價: '+ cartdetail.items[i].price +
                                '<span class="mx-2">|</span>' +'購買數量: '+ cartdetail.items[i].qty+
                                '<span class="mx-2">|</span>'+'價格: '+itemtotalprice+
                                '</div>'+
                            '</div>'+
                        '</div>'
				)
                }
                $('#carttotal').append('$'+cartdetail.total);
			$("#placeorder").click(function() {
				var cart = JSON.parse(localStorage.getItem("Cart"));
				var cartItem = JSON.stringify(cart.items);
				var pdtotalprice = cart.total;
				$.ajax({
					type : 'post',
					url : '/shopcarinsert.controller',
					data : {cartItem:cartItem,pdtotalprice:pdtotalprice,memberid:memberid},
//  					contentType : 'application/json',
					success : function(data) {
						console.log(data);
						console.log("success");
						location.href="/";
					},
					error : function() {
						console.log("error");
					}
				});
			
			})
			$("#onepass").click(function(){
				$("#email").val("a123@gmail.com");
				$("#phone").val("0912345678");
				$("#address").val("新北市土城區玉明路99號");
			})
		});
    </script>
</body>

</html>