<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Home</title>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.css">
<link rel="stylesheet" type="text/css" href="/css/bootstrap.css">
<link rel="stylesheet" type="text/css" href="/css/style1.css">
<link rel="stylesheet" type="text/css" href="/css/responsive.css">

<script	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<!-- ChatBot -->
<link rel="stylesheet" type="text/css" href="/css/jquery.convform.css">
<script type="text/javascript" src="/js/jquery-3.1.1.min.js"></script>
<script type="text/javascript" src="/js/jquery.convform.js"></script>
<script type="text/javascript" src="/js/custom.js"></script>
<link rel="icon" href="/images/logo.ico" type="image/x-icon">
<!-- 加入Ajax函式庫 -->

<!-- <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script> -->
<!-- <script type="text/javascript" src="http://ajax.microsoft.com/ajax/jquery/jquery-1.4.min.js"></script> -->
<script type="text/javascript" src="{% static 'home/jquery.js' %}"></script>
<!-- <script type="text/javascript"> -->

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
<%@include file="header.jsp"%>
 <!-- 會員畫面 上方圖片 -->
    <div style=" height: 600px;
    background-image: url(/images/blog_06.jpg);
    background-size: cover;">
    
    </div>
    <!-- 會員畫面 上方圖片 -->
    
  
    <div style="float:left;width:40%;padding-left:300px">
          
     <div><img class="square" src="/images${member.member_photo}"></div>
            
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
                
               <h3 style="text-align:center;">Message:</h3>
                
               </div>
           <!-- <td align='center'><h1>${pageContext.request.userPrincipal.name}</h1></td> --> 
    <br>      
           <!--             ---------------------預約table-------------------- -->
                      
            
            	<%@include file="../message/message.jsp"%>
       
           
				
           <!--             ---------------------預約table-------------------- -->
                
    </div>
    <div style="clear:both"></div>
    <br>
    <br>
    <br>
    <br>
    <!-- 分頁尾 -->
    

     <%@include file="../homepage/footer.jsp"%>


<!-- ChatBot -->
<div class="chat_icon">
	<i class="fa fa-comments" aria-hidden="true"></i>
</div>

<div class="chat_box">
	<div class="my-conv-form-wrapper">
		<form action="" method="GET" class="hidden">

      <select data-conv-question="Hello! How can I help you" name="category">
        <option value="WebDevelopment">Website Development ?</option>
        <option value="DigitalMarketing">Digital Marketing ?</option>
      </select>

      <div data-conv-fork="category">
        <div data-conv-case="WebDevelopment">
          <input type="text" name="domainName" data-conv-question="Please, tell me your domain name">    
        </div>
        <div data-conv-case="DigitalMarketing" data-conv-fork="first-question2">
          <input type="text" name="companyName" data-conv-question="Please, enter your company name"> 
        </div>
      </div>

      <input type="text" name="name" data-conv-question="Please, Enter your name">

      <input type="text" data-conv-question="Hi {name}, <br> It's a pleasure to meet you." data-no-answer="true">

      <input data-conv-question="Enter your e-mail" data-pattern="^[a-zA-Z0-9.!#$%&’*+/=?^_`{|}~-]+@[a-zA-Z0-9-]+\.[a-zA-Z0-9-]+(?:\.[a-zA-Z0-9-]+)*$" type="email" name="email" required placeholder="What's your e-mail?">

      <select data-conv-question="Please Conform">
        <option value="Yes">Conform</option>
      </select>

  	</form>
	</div>
</div>
<!-- ChatBot end -->

	





<script type="text/javascript">
	portfolioList = document.querySelectorAll('.portfolio-box');
	portfolioList.forEach(function(portfolioPic) {
		portfolioPic.addEventListener('click',function(){
			bg = this.style.backgroundImage;
			document.getElementById('port_pop_pic_bg').classList.add("active")
			document.getElementById('port_pop_pic').style.backgroundImage = bg
			document.getElementById('port_pop_pic').classList.add("active")
		});	
	})
	document.getElementById('port_pop_pic_bg').addEventListener('click',function(){
			document.getElementById('port_pop_pic_bg').classList.remove("active")
			document.getElementById('port_pop_pic').classList.remove("active")
	})
</script>

</body>
</html>