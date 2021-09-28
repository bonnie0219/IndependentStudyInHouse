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
    <title>會員優惠券列表</title>
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
  // url:'http://localhost:8080/backend/coupon/all',
   url:'http://localhost:8080/inhouse/all/${member.member_id}' ,
   dataType:'JSON',
   contentType:'application/json',
   
   success: function(data) {
	   debugger;
	   var json = JSON.stringify(data, null, 4);
     console.log("SUCCESS : ", json);
     //透過JSON.parse轉成陣列
     var parsedObjinArray = JSON.parse(json);
     $('#showproduct').empty(""); 
 	if( json=null){
 	$('table').prepend("<tr><td colspan='2'>暫無資料</td></tr>");
 	}else{
 	var table = $('#showproduct');
 	//table.append("<tr id='ptitle'><th>coupon_id</th><th>coupon_addtime</th><th>coupon_count</th><th>coupon_endtime</th><th>coupon_name</th><th>coupon_photo</th><th>coupon_rule</th><th>coupon_starttime</th><th>coupon_status</th><th>coupon_type</th><th>member_id</th></tr>");

 	$.each(parsedObjinArray,function(i,n){
 //	var tr =   " <div class=\"card border-0 mb-7\"> "+ n.member.member_id +
 	var tr =   " <div class=\"card border-0 mb-7\"> "+
 	"   <div class=\"row no-gutters\"> " +
 	"    <div class=\"col-md-6 pr-md-8\" style=\"margin-top: 40px;\"> "+
 	 "       <a href=\"blog-post-01.html\" class=\"hover-shine d-block\"> "+
 	  " <img src=\"/images"+n.coupon_photo+"\" alt=\"Under the sun in Cape Town\" id=\"sofaimg\" style=\"height:150px; width:600px\"   >" +
 	   "     </a>    "+       
 	   " </div> "+
 	   " <div class=\"col-md-6\"> "+
 	   "  <div class=\"card-body py-6 px-0 pb-0\"> "+ "<br>"+
 	   
 	     "       <h3 class=\"card-title mb-3 fs-20\"> "+
 	          n.coupon_name+ 
 	         "   </h3>"+
 	       
 	       "     <p class=\"card-text mb-4\" style=\"color:black\">" + n.coupon_rule  +"</p>"+
 	      "     <p      class=\"card-text fs-12 mb-2 text-muted lh-12 text-uppercase letter-spacing-05 font-weight-500\">  "+
          "期限:"+ n.coupon_starttime +"~"+  n.coupon_endtime+
    "  </p> "+
 	          "  <a href=\"http://localhost:8080/inhouse/bylaws\"    class=\"fs-14 font-weight-bold border-bottom border-light-dark text-uppercase letter-spacing-05 d-inline-block border-hover-primary\"> "+
 	               " 使用條款"+
 	         "   </a>"+
 	     "   </div>"+
 	   " </div>"+
 	"</div>"+
 	"</div>" ;
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
<!-- 分功能列 -->
<%@include file="header.jsp"%>



   <!-- 會員畫面 上方圖片 -->
   
   
    <div style=" height: 600px;
    background-image: url(/images/blog_06.jpg);
    background-size: cover;"></div>
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
                
               <h3 style="text-align:center;">It's your coupon:</h3>
                
               </div>
           <!-- <td align='center'><h1>${pageContext.request.userPrincipal.name}</h1></td> --> 
    <br>      
           <!--             ---------------------預約table-------------------- -->
           <table id="showproduct" border="1" style="width:750px;"></table>
				
           <!--             ---------------------預約table-------------------- -->
                
    </div>
    <div style="clear:both"></div>
    <br>
    <br>
    <br>
    <br>
    <!-- 分頁尾 -->
    <%@include file="footer.jsp"%> 
 
 
<!--     <table style="border:3px #cccccc solid; margin-left: 300px;" cellpadding="8" border='1'> -->
<!--     <table style="margin-left:300px; border-collapse:separate; border-spacing:0px 10px; "> -->
<!--         <tr> -->
<!--             <td align="center" valign="center"> -->
<!--             <div> -->
<%--                 <img class="square" src="/images${member.member_photo}" /> --%>
<!--             </div> -->
<!--             </td> -->
<!--             <td> -->
<!--             	<br> -->
<!--                 <br> -->
<%--                 <h1 style="margin-left:10px; margin-top:20px;">Dear,${pageContext.request.userPrincipal.name}</h1> --%>
<!--                 <h3 style="margin-left:10px;">It's your coupon's list:</h3> -->
<!--             </td> -->
            <!-- <td align='center'><h1>${pageContext.request.userPrincipal.name}</h1></td> -->
        </tr>
<!--         <tr> -->
<!--             <td><a  href="/inhouse/ProfilesMember"><button type="button" class="btn btn-outline-secondary" style="border: 1px solid ;margin: 10px; width: 200px;position:absolute;">My Account</button></a></td> -->
<!--             <td rowspan="10"> -->
            
<!--             ---------------------預約table-------------------- -->
<!--          	<table id="showproduct" border="0"> -->
<!-- 				</table> -->
<!-- 				<br> -->
<!-- 				<br> -->
<!-- 				<br> -->
<!-- 				<br> -->
<!-- 				<br> -->
				
				
<!--             ---------------------預約table-------------------- -->
                
                
<!--                 </td> -->
<!--         </tr> -->
         
        
<!--         <tr> -->
<%--             <td><a href="/inhouse/ProfilesOrder/${member.member_id}"><button type="button" class="btn btn-outline-secondary" style="border: 1px solid; margin: 10px; width: 200px;position:absolute;">Order</button></a></td> --%>
<!--           <td rowspan="4"> -->

<!--         </tr> -->
        
<!--         <tr> -->
<!--             <td><a  href="/inhouse/ProfilesReserve"><button type="button"  class="btn btn-outline-secondary"  style="border: 1px solid; margin: 10px; width: 200px;position:absolute;">Reservation</button></a></td> -->
<!--         </tr> -->
        
<!--         <tr> -->
<!--             <td><a  href="ProfilesCoupon"><button type="button" class="btn btn-outline-secondary" style="border: 1px solid; margin: 10px; width: 200px;position:absolute;">Coupon</button></a></td> -->
<!--         </tr> -->
       
<!--         <tr> -->
<!--             <td><a href="inhouse/message"><button type="button" class="btn btn-outline-secondary" style="border: 1px solid; margin: 10px; width: 200px;position:absolute;">Message</button></a></td> -->
<!--         </tr> -->
<!--          <tr> -->
<!--             <td><a data-toggle="tab" href="/inhouse/ProfilesCoupon"><button type="button" class="btn btn-outline-" style="border: 0px solid; margin: 10px; width: 200px;"></button></a></td> -->
<!--         </tr> -->
        
           
<!--     </table> -->
<!--     <br> -->
<!--     <br> -->
<!--     <br> -->
<!--     <br> -->
   
   






<%-- <%@include file="../homepage/footer.jsp"%> --%>


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