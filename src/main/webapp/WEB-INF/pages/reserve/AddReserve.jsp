<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="Furniture Shop Html Template">
    <meta name="author" content="">
    <meta name="generator" content="Jekyll">
    <title>線上服務預約完整版</title>
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
    <script	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <script	src="https://cdn.jsdelivr.net/npm/pretty-checkbox@3.0/dist/pretty-checkbox.min.css"></script>
    
    <style type="text/css">
    
    td {
    	 color:black;
    	 font-size:18px;
    	 
    }
    
    </style>
    
      <script type = "text/javascript">
         $(document).ready(function () {
             var reserve = {};
             $('#btnAddReserve').click(function () {
//                 reserve.reserve_memberid = $('#reserve_memberid').val();
                reserve.reserve_memberid={};
	          	reserve.reserve_memberid.member_id = $('#reserve_memberid').val();
	          	console.log( reserve.reserve_memberid.member_id + "reserve_memberid")
	           	console.log(reserve);
                reserve.reserve_Date = $('#reserve_Date').val();
                reserve.reserve_branch = $('#reserve_branch').val();
                reserve.reserve_style= $('#reserve_style').val();
                reserve.reserve_q1=$("input:radio[name=reserve_q1]:checked").val();
                reserve.reserve_q2=$("input:radio[name=reserve_q2]:checked").val();
                reserve.reserve_q3=$("input:radio[name=reserve_q3]:checked").val();
                reserve.reserve_q4=$("input:radio[name=reserve_q4]:checked").val();
                reserve.reserve_q5=$("input:radio[name=reserve_q5]:checked").val();
                 var reserveJSON = JSON.stringify(reserve);
                 console.log(reserveJSON);
                 $.ajax({
                     url: 'http://localhost:8080/inhouse/reserve/addFrontend',
                     method: 'POST',
                     data: reserveJSON,
                     contentType: "application/json; charset=utf-8",
                     success: function () {
                         alert('線上預約服務成功!');
                         reset();
                     },
                     error: function (error) {
                         //alert('錯誤',error);
                         window.location.href="http://localhost:8080/inhouse/successEmail";
                         reset();
                     }
                 })  
             })
         });
         
         
         
         function reset() {
     		$('#reserve_id').val('');
     		$('#reserve_memberid').val('');
     		$('#reserve_Date').val('');
     		$('#reserve_branch').val('');
     		$('#reserve_style').val('');
     		$("input:radio[name=reserve_q1]:checked").val('');
     		$("input:radio[name=reserve_q2]:checked").val('');
     		$("input:radio[name=reserve_q3]:checked").val('');
     		$("input:radio[name=reserve_q4]:checked").val('');
     		$("input:radio[name=reserve_q5]:checked").val('');
     		$('#btnaddmember').text("新增");
     	}
         
//         一鍵輸入下面選項
        function keyin(){
        	$('input[name="reserve_q1"]')[1].checked = true;
        	$('input[name="reserve_q2"]')[0].checked = true;
        	$('input[name="reserve_q3"]')[1].checked = true;
        	$('input[name="reserve_q4"]')[0].checked = true;
        	$('input[name="reserve_q5"]')[0].checked = true;
        	
        }
        
        
//         var getSelectedValue = document.querySelector( 'input[name="reserve_q1"]:checked');   
//         if(getSelectedValue != null) {   
//                  alert("Radio button is selected");  
//          else {  
//                 alert("選項1為完成"); 

// 不行  會同步跳出
/*if ($('input[name="reserve_q1"]:checked').length) {   
           alert("Radio button is selected"); 
      }
      else {
           alert("Radio button is selected");
      }*/
    
                  
      </script>
</head>

<body>
<!--     <header class="main-header navbar-light header-sticky header-sticky-smart position-absolute fixed-top"> -->
<!--         <div class="sticky-area bg-white"> -->
<!--             <div class="container container-xxl"> -->
<!--                 <nav class="navbar navbar-expand-xl px-0 py-2 py-xl-0 d-block"> -->
<!--                     <div class="d-none d-xl-block"> -->
<!--                         <div class="row align-items-center"> -->
<!--                             <div class="col-2"> -->
<!--                                 <div class="position-relative"> -->
<!--                                     <a href="#search-popup" data-gtf-mfp="true" -->
<!--                                         data-mfp-options='{"type":"inline","focus": "#keyword","mainClass": "mfp-search-form mfp-move-from-top mfp-align-top"}' -->
<!--                                         class="nav-search d-flex align-items-center"><i class="far fa-search"></i><span -->
<!--                                             class="d-none d-xl-inline-block ml-2 font-weight-500">Search</span></a> -->
<!--                                 </div> -->
<!--                             </div> -->
<!--                             <div class="col-xl-8 mx-auto position-static"> -->
<!--                                 <div class="d-flex mt-3 mt-xl-0 align-items-center w-100 justify-content-center"> -->
<!--                                     <ul class="navbar-nav hover-menu main-menu px-0 mx-xl-n4"> -->
<!--                                         <li aria-haspopup="true" aria-expanded="false" -->
<!--                                             class="nav-item dropdown-item-home dropdown py-2 py-xl-5 px-0 px-xl-2"> -->
<!--                                             <a class="nav-link dropdown-toggle p-0" href="index.html" -->
<!--                                                 data-toggle="dropdown"> -->
<!--                                                 關於 -->
<!--                                                 <span class="caret"></span> -->
<!--                                             </a> -->
<!--                                             <ul class="dropdown-menu pt-3 pb-0 pb-xl-3 x-animated x-fadeInUp"> -->
<!--                                                 <li class="dropdown-item"> -->
<!--                                                     <a class="dropdown-link" href="#"> -->
<!--                                                         品牌故事 -->
<!--                                                     </a> -->
<!--                                                 </li> -->
<!--                                                 <li class="dropdown-item"> -->
<!--                                                     <a class="dropdown-link" href="#"> -->
<!--                                                         社會責任 -->
<!--                                                     </a> -->
<!--                                                 </li> -->
<!--                                                 <li class="dropdown-item"> -->
<!--                                                     <a class="dropdown-link" href="#"> -->
<!--                                                         企業理念 -->
<!--                                                     </a> -->
<!--                                                 </li> -->
<!--                                                 <li class="dropdown-item"> -->
<!--                                                     <a class="dropdown-link" href="#"> -->
<!--                                                         相關影片 -->
<!--                                                     </a> -->
<!--                                                 </li> -->
<!--                                                 <li class="dropdown-item"> -->
<!--                                                     <a class="dropdown-link" href="#"> -->
<!--                                                         直營門市 -->
<!--                                                     </a> -->
<!--                                                 </li> -->
<!--                                             </ul> -->
<!--                                         </li> -->
                                        
<!--                                         <li aria-haspopup="true" aria-expanded="false" -->
<!--                                             class="nav-item dropdown-item-pages dropdown py-2 py-xl-5 px-0 px-xl-2"> -->
<!--                                             <a class="nav-link dropdown-toggle p-0" href="#" data-toggle="dropdown"> -->
<!--                                                 最新消息 -->
<!--                                                 <span class="caret"></span> -->
<!--                                             </a> -->
<!--                                             <ul class="dropdown-menu pt-3 pb-0 pb-xl-3 x-animated x-fadeInUp"> -->
<!--                                                 <li class="dropdown-item dropdown dropright"> -->
<!--                                                     <a class="dropdown-link" href="#"> -->
<!--                                                         活動訊息(優惠券) -->
<!--                                                     </a> -->
<!--                                                 </li> -->
<!--                                                 <li class="dropdown-item"> -->
<!--                                                     <a class="dropdown-link" href="#"> -->
<!--                                                         新聞 -->
<!--                                                     </a> -->
<!--                                                 </li> -->
<!--                                                 <li class="dropdown-item"> -->
<!--                                                     <a class="dropdown-link" href="#"> -->
<!--                                                         相關連結 -->
<!--                                                     </a> -->
<!--                                                 </li> -->
<!--                                             </ul> -->
<!--                                         </li> -->
<!--                                         <li aria-haspopup="true" aria-expanded="false" -->
<!--                                             class="nav-item dropdown py-2 py-xl-5 px-0 px-xl-2"> -->
<!--                                             <a class="nav-link  p-0" href="#" data-toggle="dropdown"> -->
<!--                                                 設計師簡介 -->
<!--                                                 <span class="caret"></span> -->
<!--                                             </a> -->
<!--                                         </li> -->
<!--                                         <li aria-haspopup="true" aria-expanded="false" -->
<!--                                             class="nav-item dropdown py-2 py-xl-5 px-0 px-xl-2"> -->
<!--                                             <a class="nav-link  p-0" href="#" data-toggle="dropdown"> -->
<!--                                                 作品集 -->
<!--                                                 <span class="caret"></span> -->
<!--                                             </a> -->
<!--                                         </li> -->
<!--                                     </ul> -->
<!--                                     <a class="navbar-brand mx-5 mr-0 d-inline-block py-0" href="/inhouse/homepage"> -->
<!--                                         <img src="/images/logo.png" alt="Furnitor" style="width: 75px"> -->
<!--                                     </a> -->
<!--                                     <ul class="navbar-nav hover-menu main-menu px-0 mx-xl-n4"> -->
                                        
<!--                                         <li aria-haspopup="true" aria-expanded="false" -->
<!--                                             class="nav-item dropdown py-2 py-xl-5 px-0 px-xl-2"> -->
<!--                                             <a class="nav-link dropdown-toggle p-0" href="#" data-toggle="dropdown"> -->
<!--                                                 精選專欄 -->
<!--                                                 <span class="caret"></span> -->
<!--                                             </a> -->
<!--                                             <ul class="dropdown-menu pt-3 pb-0 pb-xl-3 x-animated x-fadeInUp"> -->
<!--                                                 <li class="dropdown-item dropdown dropright"> -->
<!--                                                     <a class="dropdown-link" href="#" -->
<!--                                                         data-toggle="dropdown"> -->
<!--                                                         客戶心得分享 -->
<!--                                                     </a> -->
<!--                                                 </li> -->
<!--                                                 <li class="dropdown-item dropdown dropright"> -->
<!--                                                     <a class="dropdown-link" href="#" -->
<!--                                                         data-toggle="dropdown"> -->
<!--                                                         名人推薦 -->
<!--                                                     </a> -->
<!--                                                 </li> -->
<!--                                             </ul> -->
<!--                                         </li> -->
<!--                                         <li aria-haspopup="true" aria-expanded="false" -->
<!--                                             class="nav-item dropdown py-2 py-xl-5 px-0 px-xl-2"> -->
<!--                                             <a class="nav-link dropdown-toggle p-0" href="#" > -->
<!--                                                 服務流程 -->
<!--                                                 <span class="caret"></span> -->
<!--                                             </a> -->
<!--                                             <ul class="dropdown-menu pt-3 pb-0 pb-xl-3 x-animated x-fadeInUp"> -->
<!--                                                 <li class="dropdown-item dropdown dropright"> -->
<!--                                                     <a class="dropdown-link" href="#" -->
<!--                                                         data-toggle="dropdown"> -->
<!--                                                         流程介紹 -->
<!--                                                     </a> -->
<!--                                                 </li> -->
<!--                                                 <li class="dropdown-item dropdown dropright"> -->
<!--                                                     <a class="dropdown-link" href="#" -->
<!--                                                         data-toggle="dropdown"> -->
<!--                                                         專案合作 -->
<!--                                                     </a> -->
<!--                                                 </li> -->
<!--                                                 <li class="dropdown-item dropdown dropright"> -->
<!--                                                     <a class="dropdown-link" href="/inhouse/reserve/addReserveForm" -->
<!--                                                        > -->
<!--                                                         預約(表單) -->
<!--                                                     </a> -->
<!--                                                 </li> -->
<!--                                             </ul> -->
<!--                                         </li> -->
<!--                                         <li aria-haspopup="true" aria-expanded="false" -->
<!--                                             class="nav-item dropdown py-2 py-xl-5 px-0 px-xl-2"> -->
<!--                                             <a class="nav-link  p-0" href="#" data-toggle="/inhouse/reserve/addReserveForm"> -->
<!--                                                 預約服務 -->
<!--                                                 <span class="caret"></span> -->
<!--                                             </a> -->
<!--                                         </li> -->
<!--                                         <li aria-haspopup="true" aria-expanded="false" -->
<!--                                             class="nav-item dropdown-item-shop dropdown py-2 py-xl-5 px-0 px-xl-2"> -->
<!--                                             <a class="nav-link dropdown-toggle p-0" href="/inhouse/shop/ShopAllProduct" -->
<!--                                                 > -->
<!--                                                 商品 -->
<!--                                                 <span class="caret"></span> -->
<!--                                             </a> -->
                                           
<!--                                         </li> -->
<!--                                     </ul> -->
<!--                                 </div> -->
<!--                             </div> -->
<!--                             <div class="col-2"> -->
<!--                                 <ul -->
<!--                                     class="navbar-nav flex-row justify-content-xl-end d-flex flex-wrap text-body py-0 navbar-right"> -->
<!--                                     <li class="nav-item"> -->
<!--                                         <a class="nav-link pr-3 py-0" href="/inhouse/login"> -->
<!--                                             <i class="far fa-user-alt"></i> -->
<!--                                         </a> -->
<!--                                     </li> -->
<!--                                     <li class="nav-item"> -->
<!--                                         <a class="nav-link position-relative px-3 py-0" href="#"><i -->
<!--                                                 class="far fa-heart"></i> -->
<!--                                             <span class="position-absolute number">0</span></a> -->
<!--                                     </li> -->
<!--                                     <li class="nav-item"> -->
<!--                                         <a class="nav-link position-relative px-3 menu-cart py-0" href="#" -->
<!--                                             data-canvas="true" data-canvas-options='{"container":".cart-canvas"}'> -->
<!--                                             <i class="far fa-shopping-basket"></i> -->
<!--                                             <span class="position-absolute number">0</span> -->
<!--                                         </a> -->
<!--                                     </li> -->
<!--                                 </ul> -->
<!--                             </div> -->
<!--                         </div> -->
<!--                     </div> -->
<!--                     <div class="d-flex align-items-center d-xl-none"> -->
<!--                         <button class="navbar-toggler border-0 px-0 canvas-toggle" type="button" data-canvas="true" -->
<!--                             data-canvas-options='{"width":"250px","container":".sidenav"}'> -->
<!--                             <span class="fs-24 toggle-icon"></span> -->
<!--                         </button> -->
<!--                         <div class="mx-auto"><a class="navbar-brand d-inline-block mr-0" href="/inhouse/login"> -->
<!--                                 <img src="/images/logo.png" alt="Furnitor"> -->
<!--                             </a></div> -->
<!--                         <a href="#search-popup" data-gtf-mfp="true" -->
<!--                             data-mfp-options='{"type":"inline","focus": "#keyword","mainClass": "mfp-search-form mfp-move-from-top mfp-align-top"}' -->
<!--                             class="nav-search d-flex align-items-center"><i class="far fa-search"></i></a> -->
<!--                     </div> -->
<!--                 </nav> -->
<!--             </div> -->
<!--         </div> -->
<!--     </header> -->
<%@include file="../homepage/header.jsp"%>
    

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
    			<div class="col-md-6 col-lg-4 d-flex">
    				<div class="img d-flex align-self-stretch align-items-center" style="background-image:url(/images/about.jpg);">
    			
                        
                        <!-- <div class="request-quote py-5">
	    					<div class="py-2">
	    						<span class="subheading">Be Part of our Business</span>
	    						<h3>Request A Quote</h3>
	    					</div>


	    					<form action="#" class="request-form ftco-animate">
			    				<div class="form-group">
			    					<input type="text" class="form-control" placeholder="First Name">
			    				</div>
			    				<div class="form-group">
			    					<input type="text" class="form-control" placeholder="Last Name">
			    				</div>
		    					<div class="form-group">
			    					<div class="form-field">
	          					<div class="select-wrap">
	                      <div class="icon-arr"><span class="ion-ios-arrow-down"></span></div>
	                      <select name="" id="" class="form-control">
	                      	<option value="">Select Your Services</option>
	                        <option value="">Construction</option>
	                        <option value="">Renovation</option>
	                        <option value="">Interior Design</option>
	                        <option value="">Exterior Design</option>
	                        <option value="">Painting</option>
	                      </select>
	                    </div>
			              </div>
			    				</div>
		    					<div class="form-group">
			    					<input type="text" class="form-control" placeholder="Phone">
			    				</div>
		    					<div class="form-group">
			              <textarea name="" id="" cols="30" rows="2" class="form-control" placeholder="Message"></textarea>
			            </div>
			            <div class="form-group">
			              <input type="submit" value="Request A Quote" class="btn btn-secondary py-3 px-4">
			            </div>
			    			</form>



	    				</div> -->




    				</div>
    			</div>



    			<div class="col-md-6 col-lg-8 pl-lg-5 py-5">
    				<div class="row justify-content-start pb-3">
						<div class="col-md-12 heading-section ftco-animate">

							<span class="subheading">Welcome</span>
							<h2 class="mb-4">Make an Reservation Immediately !!</h2>
							<!-- <p>A small river named Duden flows by their place and supplies it with the necessary regelialia. It is a paradisematic country, in which roasted parts of sentences fly into your mouth.</p>
		            <p>Even the all-powerful Pointing has no control about the blind texts it is an almost unorthographic life One day however a small line of blind text by the name of Lorem Ipsum decided to leave for the far World of Grammar.</p>
		            <p>A small river named Duden flows by their place and supplies it with the necessary regelialia. It is a paradisematic country, in which roasted parts of sentences fly into your mouth.</p>
		           -->

						
							<table
								style="border-collapse: separate; border-spacing: 0px 10px;">
								<tr>
									<td>1. 客戶專屬ID</td>
									<td><input type="text"
										class="form-control form-control-sm"
										style="width: 200px; height: 30PX;" name="reserve_memberid"
										id="reserve_memberid" value="${member.member_id}"
										disabled="disabled"></td>
								</tr>
								<tr>
									<td>2. 預約日期</td>
									<td><input type="date" class="form-control"
										style="width: 200px" name="reserve_Date" id="reserve_Date" min="2021-09-24" ></td>
								</tr>
								<tr>
									<td>3. 預約門市</td>
									<td><select class="form-control form-control-sm"
										style="width: 200px" name="reserve_branch" id="reserve_branch">
											<option>中壢門市</option>
											<option>基隆門市</option>
											<option>台中門市</option>
											<option>高雄門市</option>
									</select></td>
								</tr>
								<tr>
									<td>4. 偏好風格</td>
									<td><select class="form-control form-control-sm"
										style="width: 200px" name="reserve_style" id="reserve_style">
											<option>簡約風</option>
											<option>工業風</option>
											<option>北歐風</option>
											<option>古典風</option>
											<option>自然風</option>
											<option>現代風</option>
									</select></td>
								</tr>
								<tr>
									<td>Q1 要進行改造的空間是否為10坪以上？(室內面積 不含陽台)</td>
									<td style="text-align:center;">
										<div>
											<input type="radio" 
												name="reserve_q1" id="exampleRadios1" value="1"> <label style="margin:0 30px 0 0;"
												class="form-check-label" for="exampleRadios2">YES</label> 
											<input  type="radio" 
												name="reserve_q1" id="exampleRadios1" value="2"> <label
												class="form-check-label" for="exampleRadios2">NO</label>
										</div>
										
										
									</td>
								</tr>
								<tr>
									<td>Q2 該空間是否沒有違章搭建(或有意願拆除)？</td>
									<td style="text-align:center;">
										<div>
											<input type="radio"
												name="reserve_q2" id="exampleRadios2" value="1"> <label style="margin:0 30px 0 0;"
												class="form-check-label" for="exampleRadios2">YES</label>
											<label>        </label>
											<input type="radio"
												name="reserve_q2" id="exampleRadios2" value="2"> <label
												class="form-check-label" for="exampleRadios2">NO</label>
										</div>
									</td>
								</tr>

								<tr>
									<td>Q3 工程及家具預算是否超過60萬元？</td>
									<td style="text-align:center;">
										<div>
											<input type="radio"
												name="reserve_q3" id="exampleRadios3" value="1"> <label style="margin:0 30px 0 0;"
												class="form-check-label" for="exampleRadios2">YES</label>
											<input type="radio"
												name="reserve_q3" id="exampleRadios3" value="2"> <label
												class="form-check-label" for="exampleRadios2">NO</label>
										</div>
									</td>
								</tr>
								<tr>
									<td>Q4 是否能接受將有室裝審查與場勘丈量約6~10萬元的費用？</td>
									<td style="text-align:center;">
										<div>
											<input type="radio"
												name="reserve_q4" id="exampleRadios4" value="1"> <label style="margin:0 30px 0 0;"
												class="form-check-label" for="exampleRadios2">YES</label>
											<input type="radio"
												name="reserve_q4" id="exampleRadios4" value="2"> <label
												class="form-check-label" for="exampleRadios2">NO</label>
										</div>
									</td>
								</tr>
								<tr>
									<td>Q5 裝潢預計日期是否大於3個月?</td>
									<td style="text-align:center;">
										<div>
											<input type="radio"
												name="reserve_q5" id="exampleRadios5" value="1"> <label style="margin:0 30px 0 0;"
												class="form-check-label" for="exampleRadios2">YES</label>
											<input type="radio"
												name="reserve_q5" id="exampleRadios5" value="2"> <label
												class="form-check-label" for="exampleRadios2">NO</label>
										</div>
									</td>
								</tr>
								<tr>
									<td>
										<br>
										<div class="form-group">
											<input type="submit" id="btnAddReserve" value="SUBMIT"
												class="btn btn-secondary py-3 px-4" style="margin-left: 300px;">
										</div>
									</td>
									<td>
										<br>
										<div class="form-group">
											<input type="button" onclick="keyin()" value="一鍵輸入" class="btn btn-secondary py-3 px-4">
										</div>
									</td>
								</tr>
							</table>
						</div>
						


						<!-- 小設計 -->
		        </div>
		    		<div class="row">
		          <div class="col-md-6 col-lg-3 justify-content-center counter-wrap ftco-animate d-flex">
		            <div class="block-18 text-center p-4 mb-4 align-self-stretch d-flex">
		              <div class="text">
		                <strong class="number" data-number="143">0</strong>
		                <span style="color:black;">Days of established</span>
		              </div>
		            </div>
		          </div>
		          <div class="col-md-6 col-lg-3 justify-content-center counter-wrap ftco-animate d-flex">
		            <div class="block-18 text-center py-4 px-3 mb-4 align-self-stretch d-flex">
		              <div class="text">
		                <strong class="number" data-number="15">0</strong>
		                <span style="color:black;">Project Done</span>
		              </div>
		            </div>
		          </div>
		          <div class="col-md-6 col-lg-3 justify-content-center counter-wrap ftco-animate d-flex">
		            <div class="block-18 text-center py-4 px-3 mb-4 align-self-stretch d-flex">
		              <div class="text">
		                <strong class="number" data-number="10">0</strong>
		                <span style="color:black;">Our Designer</span>
		              </div>
		            </div>
		          </div>
		          <div class="col-md-6 col-lg-3 justify-content-center counter-wrap ftco-animate d-flex">
		            <div class="block-18 text-center py-4 px-3 mb-4 align-self-stretch d-flex">
		              <div class="text">
		                <strong class="number" data-number="100">0</strong>
		                <span style="color:black;">Members</span>
		              </div>
		            </div>
		          </div>
		        </div>

                
	        </div>
        </div>
    	</div>
    </section>

















  <%@include file="../homepage/footer.jsp"%>








<!-- 檢核 -->
	<script >
	$(function(){
		var regBtn = $("#regBtn");
		console.log("A+"+regBtn)
		    $("#exampleRadios2").change(function(){
		        var that = $(this);
		        that.prop("checked",that.prop("checked"));
		        console.log("B+"+that.prop)
		        if(that.prop("checked")){
		            regBtn.prop("disabled",false)}
		        else{
		            regBtn.prop("disabled",true)
		        }
		    });
		});
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