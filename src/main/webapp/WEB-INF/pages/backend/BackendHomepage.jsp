<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html lang="zh-Hant-TW">

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width,initial-scale=1">
    <title>InHouse</title>
    <!-- Favicon icon -->
    <link rel="icon" type="image/png" sizes="16x16" href="/images/favicon.png">
    <link href="/vendor/pg-calendar/css/pignose.calendar.min.css" rel="stylesheet">
    <link href="/vendor/chartist/css/chartist.min.css" rel="stylesheet">
    <link href="/css/style.css" rel="stylesheet">
    <link rel="stylesheet" type="text/css"
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css">
<link rel="icon" href="/images/logo.ico" type="image/x-icon">
<link rel="stylesheet" type="text/css"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css">
    
    
    <link href="css/style.css" rel="stylesheet">
</head>


<body>

	<!--*******************
        Preloader start
    ********************-->
	<div id="preloader">
		<div class="sk-three-bounce">
			<div class="sk-child sk-bounce1"></div>
			<div class="sk-child sk-bounce2"></div>
			<div class="sk-child sk-bounce3"></div>
		</div>
	</div>
	<!--*******************
        Preloader end
    ********************-->


	<!--**********************************
        Main wrapper start
    ***********************************-->
	<div id="main-wrapper">

		<!--**********************************
            Nav header start
        ***********************************-->
		<div class="nav-header">
			<a href="/backend/home" class="brand-logo"> <img class="logo-abbr" src="/images/logo.png" alt=""> 
                <img class="logo-compact" src="/images/logo-text.png" alt=""> 
                <img class="brand-title"src="/images/logo-text.png" alt="">
			</a>

			<div class="nav-control">
				<div class="hamburger">
					<span class="line"></span><span class="line"></span><span
						class="line"></span>
				</div>
			</div>
		</div>
		<!--**********************************
            Nav header end
        ***********************************-->

		<!--**********************************
            Header start
        ***********************************-->
		<div class="header">
			<div class="header-content">
				<nav class="navbar navbar-expand">
					<div class="collapse navbar-collapse justify-content-between">
						<div class="header-left">

							<div class="search_bar dropdown">
								<span class="search_icon p-3 c-pointer" data-toggle="dropdown">
									<!-- <i class="mdi mdi-magnify"></i> -->
								</span>
								<div class="dropdown-menu p-0 m-0">
									<form>
										<input class="form-control" type="search" placeholder=""
											aria-label="Search">
									</form>
								</div>
							</div>
						</div>

						<ul class="navbar-nav header-right">

							<li class="nav-item dropdown header-profile"><a
								class="nav-link" href="#" role="button" data-toggle="dropdown">
									<i class="mdi mdi-account"></i>
							</a>
								<div class="dropdown-menu dropdown-menu-right">
									<a href="./app-profile.html" class="dropdown-item"> <i
										class="icon-user"></i> <span class="ml-2">Profile </span>
									</a> <a href="./email-inbox.html" class="dropdown-item"> <i
										class="icon-envelope-open"></i> <span class="ml-2">Inbox
									</span>
									</a> 
<!-- 									<a href="/backend/message" class="dropdown-item" onclick="conectWebSocket()"> <i class="bi bi-chat-dots"></i> <span class="ml-2">Message</span> -->
<%-- 									<input type="hidden" id="nickname" value="${pageContext.request.userPrincipal.name}" /></a> --%>
									<a href="/backend/logout" class="dropdown-item"> <i
										class="icon-key"></i> <span class="ml-2">Logout </span>
									</a>
								</div></li>
								</div></li>
						</ul>
					</div>
				</nav>
			</div>
		</div>
		<!--**********************************
            Header end ti-comment-alt
        ***********************************-->

		<!--**********************************
            Sidebar start
        ***********************************-->
        <%@include file="../backend/left.jsp"%>
<!-- 		<div class="quixnav"> -->
<!-- 			<div class="quixnav-scroll"> -->
<!-- 				<ul class="metismenu" id="menu"> -->
  

<%-- 				<li><a  href="<c:url value="/backend/member/memberqueryAction.controller"/>" aria-expanded="false"> --%>
<!-- 							<i class="icon icon-single-04"></i> <span class="nav-text">????????????</span> -->
<!-- 					</a></li> -->
					
<%-- 					<li><a  href="<c:url value="/backend/designer/designerqueryAction.controller"/>" aria-expanded="false"> --%>
<!-- 							<i class="icon icon-single-04"></i> <span class="nav-text">???????????????</span> -->
<!-- 					</a></li> -->
					
<!-- 					<li><a class="" href="#" aria-expanded="false"> -->
<!-- 							<i class="bi bi-images"></i> <span class="nav-text">???????????????</span> -->
<!-- 					</a></li> -->

<%-- 					<li><a href="<c:url value="/backend/article/articlequeryAction.controller"/>" aria-expanded="false"> --%>
<!-- 							<i class="bi bi-file-richtext"></i> <span class="nav-text">????????????</span> -->
<!-- 					</a></li> -->

<%-- 					<li><a href="<c:url value="/backend/product/AllProduct"/>" class="" aria-expanded="false"> --%>
<!-- 							<i class="bi bi-bag"></i> <span class="nav-text">????????????</span> -->
<!-- 					</a></li> -->

<%-- 					<li><a href="<c:url value="/backend/shopcart/shopcarlist.controller"/>" aria-expanded="false"> --%>
<!-- 							<i class="bi bi-cart"></i> <span class="nav-text">????????????</span> -->
<!-- 					</a></li> -->

<%-- 					<li><a href="<c:url value="/backend/coupon/couponqueryAction.controller"/>" aria-expanded="false"> --%>
<!-- 							<i class="bi bi-gift"></i> <span class="nav-text">???????????????</span> -->
<!-- 					</a></li> -->

<!-- 					<li><a class="" href="/backend/reserve/allReserve" aria-expanded="false"> -->
<!-- 							<i class="bi bi-calendar-check"></i> <span class="nav-text">????????????</span> -->
<!-- 					</a></li> -->

<!-- 					<li><a class="" href="/backend/employee/employeequeryAction.controller" aria-expanded="false"> -->
<!-- 							<i class="icon icon-globe-2"></i> <span class="nav-text">????????????</span> -->
<!-- 					</a></li> -->
<!-- 					<li><a class="" href="/backend/allecharts" aria-expanded="false"> -->
<!-- 							<i class="icon icon-globe-2"></i> <span class="nav-text">????????????</span> -->
<!-- 					</a></li> -->
<!-- 						<li><a class="" href="/backend/message" aria-expanded="false"> -->
<!-- 							<i class="icon icon-globe-2"></i> <span class="nav-text">????????????</span> -->
<!-- 					    </a></li> -->


<!-- 				</ul> -->
<!-- 			</div> -->
<!-- 		</div> -->
		<!--**********************************
            Sidebar end
        ***********************************-->

      
        <div class="content-body">
            <div class="container-fluid">
                <div class="row page-titles mx-0">
                    <div class="col-sm-6 p-md-0">
                        <div class="welcome-text">
                            <h4>Hi, welcome back! </h4>
                            <h2>${pageContext.request.userPrincipal.name}</h2>
                        </div>
                    </div>
                    <div class="col-sm-6 p-md-0 justify-content-sm-end mt-2 mt-sm-0 d-flex">
                        <ol class="breadcrumb">
                            <li class="breadcrumb-item active"><a href="/backend/home">??????</a></li>
                        </ol>
                    </div>
                </div>


                <!-- ??????
                <div class="row"  >
                    <div class="col-lg-4">
                        <div class="card">
                            <div class="card-body">
                                <div class="year-calendar"></div>
                            </div>
                        </div>
                    </div>
                </div>  -->

        <div class="col-xl-4 col-lg-6 col-xxl-6 col-md-6"  style="float: left;">
            <div class="card">
                <div class="card-header">
                    <h4 class="card-title">Notice Board</h4>
                </div>
                <div class="card-body">
                    <div class="recent-comment m-t-15">

                        <div class="media">
                            <div class="media-left">
                                <a href="#"><img class="media-object mr-3" src="/images/avatar/2.png" alt="..."></a>
                            </div>
                            <div class="media-body">
                                <h4 class="media-heading text-success">?????????</h4>
                                <p>??????????????????......</p>
                                <p class="comment-date">1 hour ago</p>
                            </div>
                        </div>



                        <div class="media">
                            <div class="media-left">
                                <a href="#"><img class="media-object mr-3" src="/images/avatar/4.png" alt="..."></a>
                            </div>
                            <div class="media-body">
                                <h4 class="media-heading text-primary">?????????</h4>
                                <p>??????????????????......</p>
                                <p class="comment-date">10 min ago</p>
                            </div>
                        </div>

                        <div class="media">
                            <div class="media-left">
                                <a href="#"><img class="media-object mr-3" src="/images/avatar/2.png" alt="..."></a>
                            </div>
                            <div class="media-body">
                                <h4 class="media-heading text-success">?????????</h4>
                                <p>??????????????????......</p>
                                <p class="comment-date">1 hour ago</p>
                            </div>
                        </div>
                        
                        <div class="media">
                            <div class="media-left">
                                <a href="#"><img class="media-object mr-3" src="/images/avatar/4.png" alt="..."></a>
                            </div>
                            <div class="media-body">
                                <h4 class="media-heading text-primary">?????????</h4>
                                <p>??????????????????......</p>
                                <p class="comment-date">10 min ago</p>
                            </div>
                        </div>

                        <div class="media">
                            <div class="media-left">
                                <a href="#"><img class="media-object mr-3" src="/images/avatar/3.png" alt="..."></a>
                            </div>
                            <div class="media-body">
                                <h4 class="media-heading text-danger">?????????</h4>
                                <p>??????????????????......</p>
                                <div class="comment-date">Yesterday</div>
                            </div>
                        </div>

                        <div class="media no-border">
                            <div class="media-left">
                                <a href="#"><img class="media-object mr-3" src="/images/avatar/3.png" alt="..."></a>
                            </div>
                            <div class="media-body">
                                <h4 class="media-heading text-info">?????????</h4>
                                <p>?????????????????????.....</p>
                                <div class="comment-date">Yesterday</div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        

        <div class="col-xl-4 col-xxl-6 col-lg-6 col-sm-6"  style="float: left;" >
            <div class="card mb-3">
                <img class="card-img-top img-fluid" src="/images/card/1.png" alt="Card image cap">
                <div class="card-header">
                    <h5 class="card-title">????????????</h5>
                </div>
                <div class="card-body">
                    <p class="card-text">This is a wider card with supporting text below as a natural lead-in to additional content. This content is a little bit longer.</p>
                    <p class="card-text text-dark">Last updated 3 mins ago</p>
                </div>
            </div>
        </div>


        <div class="col-xl-4 col-xxl-6 col-lg-6 col-sm-6" style="float: left;">
            <div class="card mb-3">
                <img class="card-img-top img-fluid" src="/images/card/2.png" alt="Card image cap">
                <div class="card-header">
                    <h5 class="card-title">???~??????????????????????</h5>
                </div>
                <div class="card-body">
                    <p class="card-text">He lay on his armour-like back, and if he lifted his head a little
                    </p>
                </div>
                <div class="card-footer">
                    <p class="card-text d-inline">Card footer</p>
                    <a href="javascript:void()" class="card-link float-right">Card link</a>
                </div>
            </div>
        </div>
        



		<!--**********************************
            Content body end
        ***********************************-->


		<!--**********************************
            Footer start
        ***********************************-->
		
		<!--**********************************
            Footer end
        ***********************************-->

		<!--**********************************
           Support ticket button start
        ***********************************-->

		<!--**********************************
           Support ticket button end
        ***********************************-->


	</div>
	<!--**********************************
        Main wrapper end
    ***********************************-->

	<!--**********************************
        Scripts
    ***********************************-->
	<!-- Required vendors -->
	<script src="/vendor/global/global.min.js"></script>
	<script src="/js/quixnav-init.js"></script>
	<script src="/js/custom.min.js"></script>

	<script src="/cdn.jsdelivr.net/npm/sweetalert2@11"></script>
	<!--<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>-->

	<!-- Datatable -->
	<script src="/vendor/datatables/js/jquery.dataTables.min.js"></script>
	<script src="/js/plugins-init/datatables.init.js"></script>
	<!--  -->
   

    <script src="/vendor/chartist/js/chartist.min.js"></script>

    <script src="/vendor/moment/moment.min.js"></script>
    <script src="/vendor/pg-calendar/js/pignose.calendar.min.js"></script>


    <script src="/js/dashboard/dashboard-2.js"></script>

</body>

</html>