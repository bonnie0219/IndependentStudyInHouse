<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" import="tw.InHouse.article_model.Articlememberin"%>
<%@ page language="java" import="tw.InHouse.article_model.Articlememberlike"%>
<%@ page language="java" import="java.util.ArrayList" %>
<%@ page language="java" import="java.util.*" %>
<!doctype html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="Furniture Shop Html Template">
    <meta name="author" content="">
    <meta name="generator" content="Jekyll">
     <style>
.btn{
  display: inline-block;
  border-left:-20px;
  width: 90px;
  height: 90px;
  background: #f1f1f1;
  margin: 10px;
  border-radius:70%;
  box-shadow: 0 5px 15px -5px #00000070;
  color: #3498db;
  overflow: hidden;
  position: relative;
   padding-right:100px;
}
.btn i{
  line-height: 27px; 
  line-width:10px;
  border-left:10px;
  font-size: 26px;
  transition: 0.2s linear;
  
}
.btn:hover i{
  transform: scale(1.3);
  color: #f1f1f1;
}
.btn::before{
  content: "";
  position: absolute;
  width: 120%;
  height: 120%;
  background:#ffc0cb;
  transform: rotate(45deg);
  left: -110%;
  top: 90%;
  
}
.btn:hover::before{
  animation: aaa 0.7s 1;
  top: -10%;
  left: -10%;
}
@keyframes aaa {
  0%{
    left:-110%;
    top: 90%;
  }50%{
    left: 10%;
    top: -30%;
  }100%{
    top: -10%;
    left: -10%;
  }
}

     </style>
    <title>InHouse</title>
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
    <meta name="twitter:title" content="Home 01">
    <meta name="twitter:description" content="Furniture Shop Html Template">
    <meta name="twitter:image" content="/images/logo_01.png">
    <!-- ???????????? ????????????????????? -->
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
<input  type="hidden" id="member_name" name="member_name" value="${pageContext.request.userPrincipal.name}">
<section class="py-3 bg-color-3" style=height:130px;>
<div class="container">
<nav aria-label="breadcrumb">
<ol class="breadcrumb py-11">
<li class="breadcrumb-item"><a href="index.html">Home</a></li>
<li class="breadcrumb-item"><a href="/inhouse/article/articleView/getall"> ???????????? </a></li>
<c:forEach items="${theColumnBean}" var="p">
<li class="breadcrumb-item active" aria-current="page">${p.article_title}</li>
</ol>
</nav>
</div>
</section>
<!------------------????????????????????????-----??????????????????????????????+1	---------->
<div class="container">
<!------------------???????????????---------------->


<c:if test="${pageContext.request.userPrincipal.name!=null}">
<li class="list-inline text-lg-right" style="margin-top: 20px;">
<button class="btn middle "style="border-radius:70%;width:50px;height:50px;padding-left:12px;"
onclick = 'articlelike("${article_id}","${pageContext.request.userPrincipal.name}")' >
 <i class="far fa-thumbs-up"></i>																																				
 </button><a class="fs-20" style="margin:10px;
  margin-top: 40px;width:50px;height:50px;" id="liketo${article_id}">${p.article_like}Like</a>
 <input  type="hidden" id="articles${article_id}" value="${p.article_like+1}"></li>
</c:if>



<!------------------???????????????????????????---------->
<c:if test="${pageContext.request.userPrincipal.name==null}">
<li class="list-inline text-lg-right" style="margin-top: 20px;">
<a class="middle "style="border-radius:70%;width:50px;height:50px;padding-left:12px;line-height: 27px; 
  line-width:10px;
  border-left:10px;
  font-size: 26px;
  transition: 0.2s linear;
  ">
 <i class="far fa-thumbs-up" ></i>																																				
 </a><a class="fs-20" style="margin:10px;
  margin-top: 30px;width:50px;height:50px;" id="likeit">${p.article_like}Like</a>
 <input  type="hidden" id="article1" value="${p.article_like+1}"></li>
</c:if>
<hr size=3 color=#C2C2FF style="FILTER: alpha(opacity=100,finishopacity=0,style=3)">
<div style="display: flex;
  justify-content: center;
  align-items: center;
  align-content: center;
  flex-wrap: wrap;
  text-align:center;">
<h1>${p.article_title}</h1></div><hr size=3 color=#C2C2FF style="FILTER: alpha(opacity=100,finishopacity=0,style=3)" >
<div style="display: flex;
  justify-content: center;
  align-items: center;
  align-content: center;
  flex-wrap: wrap;
  text-align:center;">


    <!--- ??????????????????---------????????????????????????------------------- -->
${p.article}
   
  <!----------????????????------------------------------------------- -->
</div>
<!-- - share article button-->
<hr>
 <div class="col-sm-6 col-lg">
 <!--  
<a href='javascript: void(window.open(&apos;https://lineit.line.me/share/ui?url=&apos; .concat(encodeURIComponent(location.href)) ));' title='????????? LINE ??????'><img alt='?????????LINE?????? !' height='40' src='${p.article_image}' width='168'/></a>
-->
 <!-- data-href??????????????????????????? -->
 


 <!-- ???????????????????????? -->
<div id="fb-root"></div>
                  <ul class="list-inline text-lg-center">
                           <!--  ??????????????????LINE -->
                        <li class="list-inline-item mr-4"><a href='javascript: void(window.open(&apos;https://lineit.line.me/share/ui?url=&apos; .concat(encodeURIComponent(location.href)) ));' class="fs-20"><i
 class="fab "><img src="https://livedoor.blogimg.jp/line_tw/imgs/2/9/29691b85-s.png" style="width:30px;height:30px;">Line</i></a></li>
                           <!-- ?????????FB???????????? -->
                 <!--        <li class="list-inline-item mr-4"><a href="https://www.facebook.com/InHouse-Beta-107797614952583" class="fs-20"><i
                                    class="fab fa-facebook-f"></i>FaceBook</a></li> -->
                           <!-- ???????????????FB -->   
                           <!-- 
<script async defer crossorigin="anonymous" src="https://connect.facebook.net/zh_TW/sdk.js#xfbml=1&version=v11.0" nonce="evyfm67J"></script>
 <div class="fb-share-button" data-href="http://localhost:8085/articleView/${p.article_id}" data-layout="button" data-size="small"><a target="_blank" href="https://www.facebook.com/sharer/sharer.php?u=http%3A%2F%2Flocalhost%3A8085%2FarticleView%2F1&amp;src=sdkpreparse" 
 class="fb-xfbml-parse-ignore"></a></div> -->
                  <!--     <li class="list-inline-item mr-4 "><a href="http://pinterest.com/pin/create/link/?url=http://localhost:8080/inhouse/article/articleView/${p.article_id}" class="fs-20"><i   -->    <!-- ???????????????200??? -->                             
                        <li class="list-inline-item mr-4 "><a href="http://pinterest.com/pin/create/link/?url=https://twitter.com/Coumarounabc/status/1438045581016846336" class="fs-20"><i                              
                                    class="fab fa-pinterest-p"></i>interest</a></li>
                        <li class="list-inline-item mr-4 "><a href="https://www.facebook.com/sharer/sharer.php?kid_directed_site=0&sdk=joey&u=https%3A%2F%2Fwww.facebook.com%2FInHouse-Beta-107797614952583&display=popup&ref=plugin&src=share_button" class="fs-20"><i                                 
                                    class="fab fa-facebook-f"></i>aceBook</a></li>
                        <li class="list-inline-item mr-4"><a href="https://www.instagram.com/" class="fs-20"><i 
                                    class="fab fa-instagram"></i>Instagram</a></li>
                        <li class="list-inline-item"><a href="https://twitter.com/share?text=inhouse${p.article_title}&url=http://localhost:8080/inhouse/article/articleView/${p.article_id}" class="fs-20"><i 
                                    class="fab fa-twitter"></i>Twitter</a></li>               
                        </ul>
             </div>
             <hr>
</div>
</c:forEach>


<section class="pt-7 pb-10 pb-md-15">
<div class="container">
<div class="row no-gutters">
<div class="col-lg-9 mx-auto">
<div class="row no-gutters mb-11">


<c:forEach items="${findPrevious}" var="fp">
<div class="col-sm-6 mb-6 mb-sm-0 border-right-0 border-sm-right align-items-center">
<div class="media align-items-center py-1">
<a href="/inhouse/article/articleView/${fp.article_id}" class="fs-14 mr-4"><i class="fas fa-arrow-left"></i></a>
<a href="/inhouse/article/articleView/${fp.article_id}" class="w-70px d-block mr-2"
style="display:inline-block;width:100%;height:50px;overflow:hidden;">
<img src="${fp.article_image}"
 alt="How to care for your cotton.">
</a>
<div class="media-body">
<p class="fs-12 mb-1 text-muted lh-12 text-uppercase letter-spacing-05">
???????????????
</p>
<a href="/inhouse/article/articleView/${fp.article_id}" class="font-weight-bold">
${fp.article_title}
</a>
</div>
</div>
</div>
</c:forEach>

<c:forEach items="${findNext}" var="fn">
<div class="col-sm-6 align-items-center">
<div class="media align-items-center justify-content-end py-1">
<div class="media-body text-right">
<p class="fs-12 mb-1 text-muted lh-12 text-uppercase letter-spacing-05">
???????????????
</p>
<a href="/inhouse/article/articleView/${fn.article_id}" class="font-weight-bold">
${fn.article_title}
</a>
</div>
<a href="/inhouse/article/articleView/${fn.article_id}" class="w-70px d-block ml-2"
style="display:inline-block;width:100%;height:50px;overflow:hidden;">
<img src="${fn.article_image}"
 alt="Time for new start ? We???re hiring">
</a>
<a href="/inhouse/article/articleView/${fn.article_id}" class="fs-14 ml-4"><i class="fas fa-arrow-right"></i></a>
</div>
</div>
</c:forEach>

</div>
</div>
</div>

            <c:if test="${pageContext.request.userPrincipal.name!=null}">
            <form action="memberinarticle/${article_id}" method="post">
            <input  type="hidden" id="member_name" name="member_name" value="${pageContext.request.userPrincipal.name}">
            <input  type="hidden" id="member_photo" name="member_photo" value="${member.member_photo}">
            <input  type="hidden" id="article_id" name="article_id" value="${article_id}">           
    <h2 class="mb-0 fs-40 text-center">
    ${member.member_name} ?????????????????????
    </h2>
    <p class="mb-10 text-center"></p> 
    <div class="" style="display:inline;">
    <img src="/images${member.member_photo}" alt="${member.member_name}"style="position:absolute;margin-left:100px;height:200px;border-radius:50%;width:200px;" >
    <textarea id="article_in" name="article_in" maxlength=50 minlength=5 class="form-control" style="width:700px;mapping-top:100px;margin-left:400px;height:200px;resize : none;border-radius: 10px;" required="required"></textarea></div>
    <p class="mb-10 text-center"></p>
    <div class="text-center">
    <button type="submit" class=" btn-primary text-uppercase letter-spacing-05" style="border-radius: 10px;">
    ??????    
    </button>
    </div>
    </form>
               
            </c:if>
<p class="mb-10 text-center"></p>


<h2 class="mb-10 fs-40 text-center">
????????????
</h2>
<!-- ---------------------------style="display:block;"---------------------------------- -->
<div class="slick-slider"  
 data-slick-options='{"slidesToShow": 3,"infinite":true,"autoplay":false,"dots":false,"arrows":false,"responsive":[{"breakpoint": 769,"settings": {"slidesToShow":2}},{"breakpoint": 576,"settings": {"slidesToShow": 1}}]}'>

<c:forEach items="${top3}" var="t3">
<div class="box">
<div class="card border-0">
<a href="/inhouse/article/articleView/${t3.article_id}" class="hover-shine card-img-top" style="display:inline-block;width:100%;height:250px;">
<img src="${t3.article_image}" alt="Under the sun in Cape Town">
</a>
<div class="card-body px-0 pt-6 pb-0">
<p class="card-text fs-12 mb-2 text-muted lh-12 text-uppercase letter-spacing-05 font-weight-500">
${t3.article_type}${t3.article_time}
</p>
<h3 class="card-title mb-0 fs-20">
<a href="/inhouse/article/articleView/${t3.article_id}">${t3.article_title}</a>
</h3>
</div>
</div>
</div>
</c:forEach>
</div>
<!-- ??????????????? -->
<section>

    </section>
<!-- ???????????????end -->
<!-- ????????? -->
 <p class="mb-10 text-center"></p>
<!-- ??????111111111111111111111111111111111111111111111111111111 -->
<%   ArrayList<Articlememberin> list = (ArrayList<Articlememberin>)request.getAttribute("amin");  //????????????????????????
//???????????????????????????
int message = 0;
if(list != null)
	message = list.size();  
   request.getSession().setAttribute("message", message);
   
   //---------------------------
   int page_current = 1; //????????????
         int page_begin = 0;  //?????? ???0????????????
         int page_end = 15;   //?????????????????????????????? 
         int total_count = 0;
         if(list != null)
            total_count = list.size();   //???????????????
         int page_total = total_count / 15 + (total_count % 15 != 0 ? 1 : 0);
            //????????????????????????????????????????????? ?????????INTEGER           
            try
            {
             Integer.parseInt(request.getParameter("begin"));    //?????????????????????????????????????????????2147483647????????????????????????
             page_current = Integer.parseInt(request.getParameter("begin")); 
            }
             catch(Exception e)
                       {
         	            page_current=1; //??????????????????????????? ?????????????????????????????????
                        }
            //----------------------------------------------------------
         //???????????????????????? ????????????????????????????????? ???????????????????????????
         if(page_current>page_total||page_current<0){
        	 page_current=1;       	 
         }
       //--------------------------
         page_begin = (page_current - 1) * 15;
         page_end = page_begin + 14 > total_count ? total_count : page_begin + 14;
         
         request.getSession().setAttribute("page_current", page_current);  //????????????????????????session???
         request.getSession().setAttribute("page_total", page_total);  //????????????
         request.getSession().setAttribute("total_count", total_count); //???????????????
         request.getSession().setAttribute("page_begin", page_begin);   //???????????????-??????
         request.getSession().setAttribute("page_end", page_end);  //???????????????-??????   %>
<!-- ??????111111111111111111111111111111111111111111111111111111 -->
<c:if test="${message!=0}">
<h2 class="mb-10 fs-40 text-center">
${message} Comments
</h2>
</c:if>
<c:if test="${message==0}">
<h2 class="mb-10 fs-40 text-center">
?????????????????????~!
</h2>
</c:if>
<section class="pb-11 pb-lg-15">
<div >



<!-- DIV????????????????????? -->
<c:forEach items="${amin}" var="amin" begin="<%=page_begin%>" end="<%=page_end%>" >
<div class="media border-bottom pb-0 mb-2 ">
<div class="w-70px d-block mr-6">
<img src="${amin.member_photo}" alt="${amin.member_name}"
style="position:absolute;height:75px;width:75px;border-radius:50%;">

</div>
<div class="media-body mb-1">
<p class="d-flex mb-1 align-items-center">
<span class="font-weight-600 text-primary d-block mr-2">${amin.member_name}</span>
<span class="fs-12 text-primary">${amin.article_intime}</span>
</p>
<p class="text-gray-01 lh-175 mb-2">${amin.article_in}</p>
<li class="list-inline text-lg-right" style="margin-top:- 20px;">
<a class="fs-20" style="margin: 30px;
  margin-top: -20px;width:10px;height:10px;">
<i class="fab">
<!--?????????????????????????????????ID???????????? -->
<c:if test="${amin.member_name==member.member_name}">
<button class=" btn-primary text-uppercase letter-spacing-05" style="border-radius: 10px;"
 onclick = 'deleteMembername("${amin.idam}","${member.member_name}")'>
 ????????????																																		
 </button>
</c:if>

<c:if test="${pageContext.request.userPrincipal.name!=null}">
 <button class=" btn-primary text-uppercase letter-spacing-05" style="border-radius: 10px;"
  onclick = 'golikearticlemessage("${amin.article_id}","${member.member_name}","${amin.idam}")'>
 <i class="far fa-thumbs-up"></i>																																				
 </button>
  <input  type="hidden" id="likenow${amin.idam}" value="${amin.articlemember_like+1}">
</i> <asd id="likeis${amin.idam}">${amin.articlemember_like}Like</a></li>
</c:if>


<c:if test="${pageContext.request.userPrincipal.name==null}">
 <button class=" btn-primary text-uppercase letter-spacing-05" style="border-radius: 10px;"
 onclick = 'golikearticlemessage("${amin.idam}","${member.member_name}")' disabled="disabled">
 <i class="far fa-thumbs-up "></i>																																				
 </button> 
</i> ${amin.articlemember_like} Like</a></li>
</c:if>

</div>
</div>
</c:forEach>

<!-- ??????111111111111111111111111111111111111111111111111111111 -->
<nav class="pt-2">
<ul class="pagination justify-content-center align-items-center mb-0">
<!-- ????????? -->
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
<!-- ??????111111111111111111111111111111111111111111111111111111 -->

</div>


</section>
<!-- ?????????end -->

</div>

</section>

<!-------------------->
    <%@include file="../homepage/footer.jsp"%>
</main>
<script type="text/javascript">
function bindScrollEvent(){
	//????????????????????????
	$(window).scroll(function(){
	var docHeight = $(document).height;//???????????????????????????
	var winHeight=$(window).height;//????????????
	var winScrollHeight=$(window).scrollTop();//????????????????????????
	if(docHeight-30<=winHeight+winScrollHeight){
	   //??????
	}
	});

	}
</script>
<script type="text/javascript">
<!-----------????????????-------->
function golikearticlemessage(article_id,member_name,idam){
    $.ajax({
        url: '/inhouse/article/golikearticlemessage/'+ article_id +'/'+member_name+'/'+idam,
        type: 'POST',
        success: function () {
         	 	var like = document.getElementById("likeis"+idam);
       	    	var likeas = document.getElementById("likenow"+idam).value;     
       	        like.innerText= likeas+"Like";
       	     Swal.fire('?????????????????????~');
       	     <!--     alert('????????????');	-->
           
        },
        error: function (error) {
        	Swal.fire('?????????????????????~');
        }
    })
}
<!-------------------->
</script>
 <script type="text/javascript">
 <!------???????????????ID----????????????---------->
 function deleteMembername(article_id,member_name){
        Swal.fire({
            title: "????????????",
            icon: 'warning',
            text: "??????????????????????!",
            showCancelButton: true}).then(function(result) {
           if (result.value) {
        	   Swal.fire({icon: 'success',
              	 title: '??????????????????',
              	  showConfirmButton: false,
              	  timer: 1500});
        	   $.ajax({
        	         url: '/inhouse/article/delete/' + article_id +'/'+member_name,
        	         type: 'POST',
        	         success: function () {
        	             <!-----????????????-------->
        	            // history.go(0)
        	             <!-----history.go(0)=F5????????????-------->
        	         },
        	         error: function (error) {
        	         }
        	     })      
        	     //??????????????????????????????????????????????????????
        	     setTimeout(function(){
        	    	 history.go(0);
        	    	},1500);
           
           }
           else {
               Swal.fire({icon: 'error',
              	 title: '??????????????????',
              	  showConfirmButton: false,
              	  timer: 1500});
           }
        });
    }	
 
 
 
 
 
 
 
 
 <!-----------????????????-------->
 function articlelike(article_id,member_name){
     $.ajax({
         url: '/inhouse/article/articlelikego/' + article_id +'/'+member_name,
         type: 'POST',
         success: function () {
        	 Swal.fire('?????????????????????~');
        	  	var  liketo = document.getElementById("liketo"+article_id);
        	  	var liketonow = document.getElementById("articles"+article_id).value;          
        	  	liketo.innerText= liketonow+"Like";
        	  	<!--  alert('????????????');	-->
            
         },
         error: function (error) {
        	 Swal.fire('?????????????????????~');
         }
     })
 }
 <!-------------------->
 </script>
 <script type="text/javascript">


 </script>
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
   
    <!-- ------------------------------------------------------------- -->
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
    <!-- ????????????????????? -->
    <div class="mfp-hide search-popup mfp-with-anim" id="search-popup">
        <form>
            <div class="input-group position-relative">
                <div class="input-group-prepend d-none d-md-block">
                    <select class="selectpicker" name="category" id="region-01"
                        data-style="btn-lg letter-spacing-0 border-0 border-bottom border-2x bg-transparent text-white border-white fs-24 pl-0 shadow-none text-capitalize font-weight-normal">
                        <option value="" selected>????????????</option>
                        <option value="chairs">????????????</option>
                        <option value="stands">????????????</option>
                        <option value="tables">????????????</option>
                        <option value="accessory">????????????</option>
                        <option value="accessory">????????????</option>
                    </select>
                </div>
                <input type="text" id="keyword" name="keyword"
                    class="form-control border-0 border-bottom border-2x bg-transparent text-white border-white fs-24 form-control-lg"
                    placeholder="?????????????????????????????????">
                <div class="input-group-append position-absolute pos-fixed-right-center">
                    <button class="input-group-text bg-transparent border-0 text-white fs-30 px-0 btn-lg"
                        type="submit"><i class="far fa-search"></i></button>
                </div>
            </div>
        </form>
    </div>
    <!-- ?????????????????????????????? -->
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
                            ??????
                            <span class="caret"></span>
                        </a>
                        <ul class="dropdown-menu pt-3 pb-0 pb-xl-3">
                            <li class="dropdown-item">
                                <a class="dropdown-link" href="#">
                                    ????????????
                                </a>
                            </li>
                            <li class="dropdown-item">
                                <a class="dropdown-link" href="#">
                                    ????????????
                                </a>
                            </li>
                            <li class="dropdown-item">
                                <a class="dropdown-link" href="#">
                                    ????????????
                                </a>
                            </li>
                            <li class="dropdown-item">
                                <a class="dropdown-link" href="#">
                                    ????????????
                                </a>
                            </li>
                            <li class="dropdown-item">
                                <a class="dropdown-link" href="#">
                                    ????????????
                                </a>
                            </li>
                        </ul>
                    </li>
                    <li aria-haspopup="true" aria-expanded="false" class="nav-item dropdown py-1 px-0">
                        <a class="nav-link dropdown-toggle p-0" href="#" data-toggle="dropdown">
                            ????????????
                            <span class="caret"></span>
                        </a>
                        <ul class="dropdown-menu pt-3 pb-0 pb-xl-3">
                            <li class="dropdown-item">
                                <a class="dropdown-link" href="#">
                                    ????????????(?????????)
                                </a>
                            </li>
                            <li class="dropdown-item">
                                <a class="dropdown-link" href="#">
                                    ??????
                                </a>
                            </li>
                            <li class="dropdown-item">
                                <a class="dropdown-link" href="#">
                                    ????????????
                                </a>
                            </li>
                        </ul>
                    </li>
                    <li aria-haspopup="true" aria-expanded="false" class="nav-item dropdown py-1 px-0">
                        <a class="nav-link p-0" href="#">
                            ???????????????
                            <span class="caret"></span>
                        </a>
                    </li>
                    <li aria-haspopup="true" aria-expanded="false" class="nav-item dropdown py-1 px-0">
                        <a class="nav-link p-0" href="#">
                            ?????????
                            <span class="caret"></span>
                        </a>
                    </li>
                    <li aria-haspopup="true" aria-expanded="false" class="nav-item dropdown py-1 px-0">
                        <a class="nav-link dropdown-toggle p-0" href="#" data-toggle="dropdown">
                            ????????????
                            <span class="caret"></span>
                        </a>
                        <ul class="dropdown-menu pt-3 pb-0 pb-xl-3">
                            <li class="dropdown-item">
                                <a class="dropdown-link" href="#">
                                    ??????????????????
                                </a>
                            </li>
                            <li class="dropdown-item">
                                <a class="dropdown-link" href="#">
                                    ????????????
                                </a>
                            </li>
                        </ul>
                    </li>
                    <li aria-haspopup="true" aria-expanded="false" class="nav-item dropdown py-1 px-0">
                        <a class="nav-link dropdown-toggle p-0" href="#" data-toggle="dropdown">
                            ????????????
                            <span class="caret"></span>
                        </a>
                        <ul class="dropdown-menu pt-3 pb-0 pb-xl-3">
                            <li class="dropdown-item">
                                <a class="dropdown-link" href="#">
                                    ????????????
                                </a>
                            </li>
                            <li class="dropdown-item">
                                <a class="dropdown-link" href="#">
                                    ????????????
                                </a>
                            </li>
                            <li class="dropdown-item">
                                <a class="dropdown-link" href="/inhouse/reserve/addReserveForm">
                                    ??????(??????)
                                </a>
                            </li>
                        </ul>
                    </li>
                    <li aria-haspopup="true" aria-expanded="false" class="nav-item dropdown py-1 px-0">
                        <a class="nav-link p-0" href="#">
                            ????????????
                            <span class="caret"></span>
                        </a>
                    </li>
                    <li aria-haspopup="true" aria-expanded="false" class="nav-item dropdown py-1 px-0">
                        <a class="nav-link dropdown-toggle p-0" href="/inhouse/shop/ShopAllProduct" data-toggle="dropdown">
                            ??????
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
    <!--????????????-->
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@9"></script> 
<!--????????????-->   
</body>

</html>