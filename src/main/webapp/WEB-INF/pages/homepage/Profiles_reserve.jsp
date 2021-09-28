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
    <title>會員預約列表</title>
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
<!-- 分功能列 -->
<%@include file="header.jsp"%>

   
   <!-- 會員畫面 上方圖片 -->
    <div style=" height: 600px;
    
    background-image: url(/images/blog_06.jpg);
    background-size: cover;">
        
    </div>
    
    <!-- 會員畫面 上方圖片 -->
        <script type="text/javascript">
			function nofind(){
  			var img=event.srcElement;
  			img.src="/images/logo.png"; //替換的圖片
 			 img.onerror=null; //控制不要一直觸發錯誤
			}
	</script>
   
  
    <div style="float:left;width:40%;padding-left:300px">
          
     <div><img class="square" src="/images${member.member_photo}" onerror="nofind()"></div>
            
     <div><a  href="/inhouse/ProfilesMember"><button type="button" class="btn btn-outline-secondary" style="border: 1px solid ;margin: 10px; width: 200px;">My Account</button></a></div>
       
     <div><a href="/inhouse/ProfilesOrder/${member.member_id}"><button type="button" class="btn btn-outline-secondary" style="border: 1px solid; margin: 10px; width: 200px;">Order</button></a></div>
          
     <div> <a href="/inhouse/ProfilesReserve"><button type="button"  class="btn btn-outline-secondary"  style="border: 1px solid; margin: 10px; width: 200px;">Reservation</button></a> </div>
               
     <div><a href="/inhouse/ProfilesCoupon"><button type="button" class="btn btn-outline-secondary" style="border: 1px solid; margin: 10px; width: 200px;">Coupon</button></a></div>
     
     <div> <a href="/inhouse/message"><button type="button" class="btn btn-outline-secondary" style="border: 1px solid; margin: 10px; width: 200px;">Message</button></a></div>
   
     </div>
 
    <!--     <table style="border:3px #cccccc solid; margin-left: 300px;" cellpadding="8" border='1'> -->
    <div style="float:right;width:60%">
    <br>
    <br>
    
               <div style="text-align:center;padding-right:300px"><h1>Dear,${pageContext.request.userPrincipal.name}</h1>
                
               <h3 style="text-align:center;">It's your reservation:</h3>
                
               </div>
           <!-- <td align='center'><h1>${pageContext.request.userPrincipal.name}</h1></td> --> 
    <br>      
           <!--             ---------------------預約table-------------------- -->
           <table id="showproduct" border="1"></table>
				
           <!--             ---------------------預約table-------------------- -->
                
    </div>
    <div style="clear:both"></div>
    <br>
    <br>
    <br>
    <br>
    <!-- 分頁尾 -->
    <%@include file="footer.jsp"%>



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
    <div class="position-fixed pos-fixed-bottom-right p-6 z-index-10">
<!--         <a href="#" -->
<!--             class="gtf-back-to-top bg-white text-primary hover-white bg-hover-primary shadow p-0 w-52px h-52 rounded-circle fs-20 d-flex align-items-center justify-content-center" -->
<!--             title="Back To Top"><i class="fal fa-arrow-up"></i></a> -->
            
         <%@include file="../message/message_new.jsp"%>   
            
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