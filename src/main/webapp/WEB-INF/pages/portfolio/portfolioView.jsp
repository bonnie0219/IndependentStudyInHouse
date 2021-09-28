<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page language="java" import="java.util.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ page language="java" import="tw.InHouse.portfolio_model.Portfolio"%>
<%@ page language="java" import="java.util.ArrayList" %>
<!doctype html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="Furniture Shop Html Template">
    <meta name="author" content="">
    <meta name="generator" content="Jekyll">
    <title>InHouse</title>

    <link rel="stylesheet" type="text/css" href="/css/paging.css">
    <script type="text/javascript" src="/js/jquery-1.11.2.js"></script>
    <script type="text/javascript" src="/js/query.js"></script>
    <script type="text/javascript" src="/js/paging.js"></script>
    
    <link rel="stylesheet" href="/vendors/fontawesome-pro-5/css/all.css">
    <link rel="stylesheet" href="/vendors/bootstrap-select/css/bootstrap-select.min.css">
    <link rel="stylesheet" href="/vendors/slick/slick.min.css">
    <link rel="stylesheet" href="/vendors/magnific-popup/magnific-popup.min.css">
    <link rel="stylesheet" href="/vendors/jquery-ui/jquery-ui.min.css">
    <link rel="stylesheet" href="/vendors/animate.css">
    <link rel="stylesheet" href="/vendors/mapbox-gl/mapbox-gl.min.css">

    <link rel="stylesheet" href="/css/themes.css">

    <link rel="icon" href="/images/favicon.ico">
    <link rel="icon" href="/images/logo.ico" type="image/x-icon">    
    <meta name="twitter:card" content="summary">
    <meta name="twitter:site" content="@">
    <meta name="twitter:creator" content="@">
    <meta name="twitter:title" content="Home 01">
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
    

    
</head>

<body>
<%@include file="../homepage/header.jsp"%>
<main id="content">
<section class="py-3 bg-color-3" style=height:130px;>
<div class="container">
<nav aria-label="breadcrumb">
<ol class="breadcrumb py-11">
<li class="breadcrumb-item"><a href="index.html">Home</a></li>
<li class="breadcrumb-item"><a href="/inhouse/portfolio/portfolioView/getall"> 客戶分享 </a></li>
<li class="breadcrumb-item active" aria-current="page">作品集介紹</li>
</ol>
</nav>
</div>
</section>
<!------------------大概從這邊開始ㄅ--------------->
<hr size=3 color=#C2C2FF style="FILTER: alpha(opacity=100,finishopacity=0,style=3)">
<h2 class="fs-sm-40 mb-11 text-center">作品集介紹<hr size=3 color=#C2C2FF style="FILTER: alpha(opacity=100,finishopacity=0,style=3)"></h2>



<section class="pt-10 pb-11 pb-lg-15">
<div class="container">
  <%     //import arraylist and modelbean
       //  String a= "/Inhouse/portfolio/portfolioView/getall";
         ArrayList<Portfolio> list = (ArrayList<Portfolio>)request.getAttribute("thePortfolioBean");  //取出所儲存的資料
         int page_current = 1; //現在頁數
         int page_begin = 0;  //顯示 從0開始計算
         int page_end = 8;   //一頁所顯示的最大數量 
         int total_count = 0;
         if(list != null)
            total_count = list.size();   //訊息的總量
         int page_total = total_count / 9 + (total_count % 9 != 0 ? 1 : 0);
            //需要判斷傳進來是否為字串或數字 轉型成INTEGER           
            try
            {
             Integer.parseInt(request.getParameter("begin"));    //接收參數如果不是数字或數值超過2147483647，超過就拋出異常
             page_current = Integer.parseInt(request.getParameter("begin")); 
            }
             catch(Exception e)
                       {
         	            page_current=1; //因為判斷他不是數值 所以給他一導向回第一頁
                        }
            //----------------------------------------------------------
         //加上一個判斷導正 如果給出不符合頁數的值 將從第一頁開始導向
         if(page_current>page_total||page_current<0){
        	 page_current=1;       	 
         }
       //--------------------------
         page_begin = (page_current - 1) * 9;
         page_end = page_begin + 8 > total_count ? total_count : page_begin + 8;
         
         request.getSession().setAttribute("page_current", page_current);  //將當前頁數保存到session中
         request.getSession().setAttribute("page_total", page_total);  //最大頁數
         request.getSession().setAttribute("total_count", total_count); //資料的總和
         request.getSession().setAttribute("page_begin", page_begin);   //儲存的資料-開始
         request.getSession().setAttribute("page_end", page_end);  //儲存的資料-結束      
    %>
<!-- 設定找到的 -->
<!--全部專欄位置-->
<!-- 沒有文章就顯示這個 -->
<c:if test="${sessionScope.total_count==0}">
<h2 class="fs-sm-40 mb-11 text-center">Sorry~</h2>
<h2 class="fs-sm-40 mb-11 text-center">現在沒有新增任何作品集</h2>
</c:if>

<div class="row" style="vertical-align:top;" >
<c:forEach var="p" items="${thePortfolioBean}" begin="<%=page_begin%>" end="<%=page_end%>">
<div class="col-sm-6 col-lg-4 mb-8" data-animate="fadeInUp" 
style="height:100%;width:100%;vertical-align:top;display:inline-block;" >
<div class="card border-0">   

<!-- ------------圖片------	------ -->
<a href="/inhouse/portfolio/portfolioView/${p.portfolio_id}" class="hover-shine card-img-top"
style="display:inline-block;width:100%;height:250px;">
<img src="${p.portfolio_image}" alt="image error">
</a>
<div class="card-body px-0 pt-6 pb-0">
<p class="card-text fs-12 mb-2 lh-12 text-uppercase letter-spacing-05 font-weight-500" style="color:black;">
${p.portfolio_time}
</p>
<h3 class="card-title mb-3 fs-20">
    <!--連結加上標題-->
<a href="/inhouse/portfolio/portfolioView/${p.portfolio_id}">${p.portfolio_title}</a>
</h3>

<a href="/inhouse/portfolio/portfolioView/${p.portfolio_id}" class="fs-14 font-weight-bold border-bottom border-light-dark text-uppercase letter-spacing-05 d-inline-block border-hover-primary">
Read more
</a>
</div>
</div>
</div>

	</c:forEach>

<!--整體-->
</div>
<!--分頁-->
<nav class="pt-2">
<ul class="pagination justify-content-center align-items-center mb-0">
<!-- 給判斷 -->
<c:if test="${sessionScope.page_current-1>0}">
<li class="page-item fs-12 d-none d-sm-block">
<a class="page-link"href="${a}?begin=${sessionScope.page_current - 1 }" tabindex="-1"><i class="far fa-angle-double-left"></i></a>
</li>
</c:if>
<c:if test="${sessionScope.page_current-2>0}">
<li class="page-item" ><a class="page-link" href="${a}?begin=${sessionScope.page_current-2}">${sessionScope.page_current-2}</a></li>
</c:if>
<c:if test="${sessionScope.page_current-1>0}">
<li class="page-item" ><a class="page-link" href="${a}?begin=${sessionScope.page_current -1}" id="count">${sessionScope.page_current-1}</a></li>
</c:if>
<c:if test="${total_count>9}">
<li class="page-item active" aria-current="page"><a class="page-link" href="${a}?begin=${sessionScope.page_current}">${sessionScope.page_current}</a></li>
</c:if>
<c:if test="${sessionScope.page_current+1<=sessionScope.page_total}">
<li class="page-item"><a class="page-link" href="${a}?begin=${sessionScope.page_current + 1 }">${sessionScope.page_current+1}</a></li>
</c:if>
<c:if test="${sessionScope.page_current+2<=sessionScope.page_total}">
<li class="page-item"><a class="page-link" href="${a}?begin=${sessionScope.page_current + 2 }">${sessionScope.page_current+2}</a></li>
</c:if>
<c:if test="${sessionScope.page_current+1<=sessionScope.page_total}">
<li class="page-item fs-12 d-none d-sm-block">
<a class="page-link" href="${a}?begin=${sessionScope.page_current + 1 }"><i class="far fa-angle-double-right"></i></a>
</li>
</c:if>
</ul>
</nav>
<c:if test="${sessionScope.total_count!=0}">
Now Page : ${sessionScope.page_current } / ${sessionScope.page_total } 共:${total_count}件作品集

</c:if>
</div>
</section>

<!------------------------->
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
                                <a class="dropdown-link" href="/inhouse/reserve/addReserveForm">
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
                        <a class="nav-link dropdown-toggle p-0" href="/inhouse/shop/ShopAllProduct" data-toggle="dropdown">
                            商品
                            <span class="caret"></span>
                        </a>
                   
                    </li>
                </ul>
            </div>
              </div>
    </div>
</body>

</html>
