<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="Furniture Shop Html Template">
    <meta name="author" content="">
    <meta name="generator" content="Jekyll">
    <title>會員畫面完整版</title>
<link rel="icon" href="/images/logo.ico" type="image/x-icon">
<!-- 加入Ajax函式庫 -->

<!-- <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script> -->
<script	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<!-- <script type="text/javascript" src="http://ajax.microsoft.com/ajax/jquery/jquery-1.4.min.js"></script> -->
<script type="text/javascript" src="{% static 'home/jquery.js' %}"></script>
<!-- <script type="text/javascript"> -->

<script>
var $j = jQuery.noConflict();

// 顯示第一頁
var indexPage = 1;
$j(document).ready(function(){
	
    load(indexPage);
});

// function change(page){
//    indexPage = page;
//   load(indexPage);
// }


function load(indexPage){
	//透過ajax送過去
$j.ajax({
	
   type:'post',
   //送到/product/queryallbypage/
   url:'http://localhost:8080/inhouse/querybymember/${member.member_id}' ,
   dataType:'JSON',
   contentType:'application/json',
   
   success: function(data) {
	   debugger;
	   var json = JSON.stringify(data, null, 4);
     console.log("SUCCESS : ", json);
     //透過JSON.parse轉成陣列
     var parsedObjinArray = JSON.parse(json);
     $('#showproduct').empty(""); //清空table內的資料
       if(json=null){
         $('table').prepend("<tr><td colspan='2'>暫無資料</td></tr>");
       }else{
         var table = $('#showproduct');
         table.append(' <thead ><tr><h1> " Reservation</h1><th colspan="9" style="text-align: center; background-color: #000; color: aliceblue; width: 650px;">預約表單</th></tr><tr><th>預約編號</th><th>預約日期</th><th>預約分店</th><th>偏好風格</th><th>Q1</th><th>Q2</th><th>Q3</th><th>Q4</th><th>Q5</th></tr></thead>');
         $.each(parsedObjinArray,function(i,n){
            var tr = "<tr align='center'>" + "<td>" + n.reserve_id + "</td>" +
                     "<td>" + n.reserve_Date + "</td>" + "<td>" + n.reserve_branch + "</td>" +
                     "<td>" + n.reserve_style + "</td>" + "<td>" + n.reserve_q1 + "</td>" +
                     "<td>" + n.reserve_q2 + "</td>" + "<td>" + n.reserve_q3 + "</td>" +
                     "<td>" + n.reserve_q4 + "</td>" + "<td>" + n.reserve_q5 + "</td>" +
                     "</tr>";
           table.append(tr);
       });
    }
},
error: function() {
    console.log("error");
}
});
};
</script>
    <link rel="stylesheet" href="/vendors/fontawesome-pro-5/css/all.css">
    <link rel="stylesheet" href="/vendors/bootstrap-select/css/bootstrap-select.min.css">
    <link rel="stylesheet" href="/vendors/slick/slick.min.css">
    <link rel="stylesheet" href="/vendors/magnific-popup/magnific-popup.min.css">
    <link rel="stylesheet" href="/vendors/jquery-ui/jquery-ui.min.css">
    <link rel="stylesheet" href="/vendors/animate.css">
    <link rel="stylesheet" href="/vendors/mapbox-gl/mapbox-gl.min.css">

    <link rel="stylesheet" href="/css/themes.css">

    <link rel="icon" href="/images/favicon.ico">

    <!-- AddReserve CSS -->
    <!--<link rel="stylesheet" href="/css_r/animate.css">
    <link rel="stylesheet" href="/css_r/style.css">-->
    <link rel="stylesheet" href="/css_r/circle.css">
    <!-- AddReserve CSS -->

    <meta name="twitter:card" content="summary">
    <meta name="twitter:site" content="@">
    <meta name="twitter:creator" content="@">
    <meta name="twitter:title" content="Home 01">
    <meta name="twitter:description" content="Furniture Shop Html Template">
    <meta name="twitter:image" content="images/logo_01.png">
    <!-- 網頁資訊 之後可以再修改 -->
    <meta property="og:url" content="home-01.html">
    <meta property="og:title" content="Home 01">
    <meta property="og:description" content="inHouse">
    <meta property="og:type" content="website">
    <meta property="og:image" content="images/logo_01.png">
    <meta property="og:image:type" content="image/png">
    <meta property="og:image:width" content="1200">
    <meta property="og:image:height" content="630">

     <!-- Bootstrap CSS -->
     <!-- <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous"> -->




</head>

<body>
    <header class="main-header navbar-light header-sticky header-sticky-smart position-absolute fixed-top">
        <div class="sticky-area bg-white">
            <div class="container container-xxl">
                <nav class="navbar navbar-expand-xl px-0 py-2 py-xl-0 d-block">
                    <div class="d-none d-xl-block">
                        <div class="row align-items-center">
                            <div class="col-2">
                                <div class="position-relative">
                                    <a href="#search-popup" data-gtf-mfp="true"
                                        data-mfp-options='{"type":"inline","focus": "#keyword","mainClass": "mfp-search-form mfp-move-from-top mfp-align-top"}'
                                        class="nav-search d-flex align-items-center"><i class="far fa-search"></i><span
                                            class="d-none d-xl-inline-block ml-2 font-weight-500">Search</span></a>
                                </div>
                            </div>
                            <div class="col-xl-8 mx-auto position-static">
                                <div class="d-flex mt-3 mt-xl-0 align-items-center w-100 justify-content-center">
                                    <ul class="navbar-nav hover-menu main-menu px-0 mx-xl-n4">
                                        <li aria-haspopup="true" aria-expanded="false"
                                            class="nav-item dropdown-item-home dropdown py-2 py-xl-5 px-0 px-xl-2">
                                            <a class="nav-link dropdown-toggle p-0" href="index.html"
                                                data-toggle="dropdown">
                                                關於
                                                <span class="caret"></span>
                                            </a>
                                            <ul class="dropdown-menu pt-3 pb-0 pb-xl-3 x-animated x-fadeInUp">
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
                                        
                                        <li aria-haspopup="true" aria-expanded="false"
                                            class="nav-item dropdown-item-pages dropdown py-2 py-xl-5 px-0 px-xl-2">
                                            <a class="nav-link dropdown-toggle p-0" href="#" data-toggle="dropdown">
                                                最新消息
                                                <span class="caret"></span>
                                            </a>
                                            <ul class="dropdown-menu pt-3 pb-0 pb-xl-3 x-animated x-fadeInUp">
                                                <li class="dropdown-item dropdown dropright">
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
                                        <li aria-haspopup="true" aria-expanded="false"
                                            class="nav-item dropdown py-2 py-xl-5 px-0 px-xl-2">
                                            <a class="nav-link  p-0" href="#" data-toggle="dropdown">
                                                設計師簡介
                                                <span class="caret"></span>
                                            </a>
                                        </li>
                                        <li aria-haspopup="true" aria-expanded="false"
                                            class="nav-item dropdown py-2 py-xl-5 px-0 px-xl-2">
                                            <a class="nav-link  p-0" href="#" data-toggle="dropdown">
                                                作品集
                                                <span class="caret"></span>
                                            </a>
                                        </li>
                                    </ul>
                                    <a class="navbar-brand mx-5 mr-0 d-inline-block py-0" href="index.html">
                                        <img src="/images/logo.png" alt="Furnitor" style="width: 75px">
                                    </a>
                                    <ul class="navbar-nav hover-menu main-menu px-0 mx-xl-n4">
                                        
                                        <li aria-haspopup="true" aria-expanded="false"
                                            class="nav-item dropdown py-2 py-xl-5 px-0 px-xl-2">
                                            <a class="nav-link dropdown-toggle p-0" href="#" data-toggle="dropdown">
                                                精選專欄
                                                <span class="caret"></span>
                                            </a>
                                            <ul class="dropdown-menu pt-3 pb-0 pb-xl-3 x-animated x-fadeInUp">
                                                <li class="dropdown-item dropdown dropright">
                                                    <a class="dropdown-link" href="#"
                                                        data-toggle="dropdown">
                                                        客戶心得分享
                                                    </a>
                                                </li>
                                                <li class="dropdown-item dropdown dropright">
                                                    <a class="dropdown-link" href="#"
                                                        data-toggle="dropdown">
                                                        名人推薦
                                                    </a>
                                                </li>
                                            </ul>
                                        </li>
                                        <li aria-haspopup="true" aria-expanded="false"
                                            class="nav-item dropdown py-2 py-xl-5 px-0 px-xl-2">
                                            <a class="nav-link dropdown-toggle p-0" href="#" data-toggle="dropdown">
                                                服務流程
                                                <span class="caret"></span>
                                            </a>
                                            <ul class="dropdown-menu pt-3 pb-0 pb-xl-3 x-animated x-fadeInUp">
                                                <li class="dropdown-item dropdown dropright">
                                                    <a class="dropdown-link" href="#"
                                                        data-toggle="dropdown">
                                                        流程介紹
                                                    </a>
                                                </li>
                                                <li class="dropdown-item dropdown dropright">
                                                    <a class="dropdown-link" href="#"
                                                        data-toggle="dropdown">
                                                        專案合作
                                                    </a>
                                                </li>
                                                <li class="dropdown-item dropdown dropright">
                                                    <a class="dropdown-link" href="#"
                                                        data-toggle="dropdown">
                                                        預約(表單)
                                                    </a>
                                                </li>
                                            </ul>
                                        </li>
                                        <li aria-haspopup="true" aria-expanded="false"
                                            class="nav-item dropdown py-2 py-xl-5 px-0 px-xl-2">
                                            <a class="nav-link  p-0" href="#" data-toggle="dropdown">
                                                預約服務
                                                <span class="caret"></span>
                                            </a>
                                        </li>
                                        <li aria-haspopup="true" aria-expanded="false"
                                            class="nav-item dropdown-item-shop dropdown py-2 py-xl-5 px-0 px-xl-2">
                                            <a class="nav-link dropdown-toggle p-0" href="store.html"
                                                data-toggle="dropdown">
                                                商品
                                                <span class="caret"></span>
                                            </a>
                                           
                                        </li>
                                    </ul>
                                </div>
                            </div>
                            <div class="col-2">
                                <ul
                                    class="navbar-nav flex-row justify-content-xl-end d-flex flex-wrap text-body py-0 navbar-right">
                                    <li class="nav-item">
                                        <a class="nav-link pr-3 py-0" href="login-register.html">
                                            <i class="far fa-user-alt"></i>
                                        </a>
                                    </li>
                                    <li class="nav-item">
                                        <a class="nav-link position-relative px-3 py-0" href="#"><i
                                                class="far fa-heart"></i>
                                            <span class="position-absolute number">0</span></a>
                                    </li>
                                    <li class="nav-item">
                                        <a class="nav-link position-relative px-3 menu-cart py-0" href="#"
                                            data-canvas="true" data-canvas-options='{"container":".cart-canvas"}'>
                                            <i class="far fa-shopping-basket"></i>
                                            <span class="position-absolute number">0</span>
                                        </a>
                                    </li>
                                </ul>
                            </div>
                        </div>
                    </div>
                    <div class="d-flex align-items-center d-xl-none">
                        <button class="navbar-toggler border-0 px-0 canvas-toggle" type="button" data-canvas="true"
                            data-canvas-options='{"width":"250px","container":".sidenav"}'>
                            <span class="fs-24 toggle-icon"></span>
                        </button>
                        <div class="mx-auto"><a class="navbar-brand d-inline-block mr-0" href="index.html">
                                <img src="images/logo.png" alt="Furnitor">
                            </a></div>
                        <a href="#search-popup" data-gtf-mfp="true"
                            data-mfp-options='{"type":"inline","focus": "#keyword","mainClass": "mfp-search-form mfp-move-from-top mfp-align-top"}'
                            class="nav-search d-flex align-items-center"><i class="far fa-search"></i></a>
                    </div>
                </nav>
            </div>
        </div>
    </header>



   <!-- 會員畫面 上方圖片 -->
    <div style=" height: 600px;
    background-image: url(/images/blog_06.jpg);
    background-size: cover;"></div>
    <!-- 會員畫面 上方圖片 -->
  
<!--     <table style="border:3px #cccccc solid; margin-left: 300px;" cellpadding="8" border='1'> -->
    <table style="margin-left:300px; border-collapse:separate; border-spacing:0px 10px; ">
        <tr>
            <td align="center" valign="center">
            <div>
                <img class="square" src="/images/profile.jpg" />
            </div>
            </td>
            <td>
            	<br>
                <br>
                <h1 style="margin-left:10px; margin-top:20px;">Dear,${pageContext.request.userPrincipal.name}</h1>
                <h3 style="margin-left:10px;">It's your reservation:</h3>
				<ul class="nav nav-tabs" id="myTab">
					<li class="nav-item"><a class="nav-link active" data-toggle="tab" href="#a">My Account</a></li>
					<li class="nav-item"><a class="nav-link" data-toggle="tab" href="#order">Order</a></li>
					<li class="nav-item"><a class="nav-link" data-toggle="tab" href="#reserve">Reservation</a></li>
					<li class="nav-item"><a class="nav-link" data-toggle="tab" href="#c">Coupon</a></li>
				</ul>

			</td>
            <!-- <td align='center'><h1>${pageContext.request.userPrincipal.name}</h1></td> -->
        </tr>
        <tr>
            <td><a data-toggle="tab" href="#order"><button type="button" class="btn btn-outline-secondary" style="border: 1px solid ;margin: 10px; width: 200px;">My Account</button></a></td>
            <td rowspan="4">
            
<!--             ---------------------預約table-------------------- -->
<div class="tab-content">
    <div class="tab-pane fade in active" id="member">.a.</div>
    <div class="tab-pane fade" id="reserve">
         	<table id="showproduct" border="1">
				</table>
				<br>
				<br>
				<br>
				<br>
				<br>
	</div>		
    <div class="tab-pane fade" id="order"><h1>aaaaaa</h1></div>
    <div class="tab-pane fade" id="java">...</div>
</div>

		
				
<!--             ---------------------預約table-------------------- -->
                
                
                </td>
        </tr>
        <tr>
            <td><a data-toggle="tab" href="#order"><button type="button" class="btn btn-outline-secondary" style="border: 1px solid; margin: 10px; width: 200px;">Order</button></a></td>
        </tr>
        <tr>
            <td><a data-toggle="tab" href="#reserve"><button type="button"  class="btn btn-outline-secondary"  style="border: 1px solid; margin: 10px; width: 200px;">Reservation</button></a></td>
        </tr>
        <tr>
            <td><a data-toggle="tab" href="#coupon"><button type="button" class="btn btn-outline-secondary" style="border: 1px solid; margin: 10px; width: 200px;">Coupon</button></a></td>
        </tr>
           
    </table>
    <br>
    <br>
    <br>
    <br>
   
   







    <footer class="pt-10 pb-9 footer bg-color-2">
        <div class="container container-xxl">
            <div class="row">
                <div class="col-lg mb-6 mb-lg-0">
                    <a href="#" class="footer-logo d-block"><img src="/images/logo.png" alt="Furnitor"></a>
                </div>
                <div class="col-sm-８ col-lg mb-８ mb-md-0">
                    <ul class="list-unstyled">
                        <li class="py-0"><a href="#" class="lh-213">關於我們</a> </li>
                        <li class="py-0"><a href="#" class="lh-213">網站地圖</a> </li>
                        <li class="py-0"><a href="#" class="lh-213">電話：(03)4257387</a> </li>
                        <li class="py-0"><a href="#" class="lh-213">地址：320桃園市中壢區中大路300號 國立中央大學</a> </li>
                        <li class="py-0"><a href="#" class="lh-213">(工程二館側面/資策會大樓)</a> </li>
                    </ul>
                </div>
                <div class="col-sm-８ col-lg mb-８ mb-md-0">
                    <ul class="list-unstyled">
                        <li class="py-0"><a href="#" class="lh-213">第六組</a> </li>
                        <li class="py-0"><a href="#" class="lh-213">組　長：李岳蓁</a> </li>
                        <li class="py-0"><a href="#" class="lh-213">技術長：王淳弘</a> </li>
                        <li class="py-0"><a href="#" class="lh-213">組　員：邱若綺</a> </li>
                        <li class="py-0"><a href="#" class="lh-213">　　　　江彥勳</a> </li>
                        <li class="py-0"><a href="#" class="lh-213">　　　　徐璟文</a> </li>
                        <li class="py-0"><a href="#" class="lh-213">　　　　陳俊源</a> </li>
                    </ul>
                </div>

                <div class="col-sm-6 col-lg">
                    <ul class="list-inline text-lg-right">
                        <li class="list-inline-item mr-4"><a href="#" class="fs-20"><i
                                    class="fab fa-pinterest-p"></i></a></li>
                        <li class="list-inline-item mr-4"><a href="#" class="fs-20"><i
                                    class="fab fa-facebook-f"></i></a></li>
                        <li class="list-inline-item mr-4"><a href="#" class="fs-20"><i class="fab fa-instagram"></i></a>
                        </li>
                        <li class="list-inline-item"><a href="#" class="fs-20"><i class="fab fa-twitter"></i></a></li>
                    </ul>
                    <p class="mb-0 text-gray text-lg-right">&copy; 2021.InHouse 
<!--                     <a　target="_blank" href="https://sc.chinaz.com/moban/">&#x7F51;&#x9875;&#x6A21;&#x677F;</a></p> -->
                </div>
            </div>
        </div>
    </footer>


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
<!--  <div id="ftco-loader" class="show fullscreen"><svg class="circular" width="48px" height="48px"><circle class="path-bg" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke="#eeeeee"/><circle class="path" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke-miterlimit="10" stroke="#F96D00"/></svg></div>


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
 <script src="/js_r/main.js"></script>-->
  <!-- AddReserve JS loader -->

  <script src="/js/theme.js"></script> 
  
<!--   刪除一整大串 -->
    
    
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
         
    <!-- Optional JavaScript -->
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
</body>

</html>