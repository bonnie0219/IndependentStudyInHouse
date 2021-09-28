<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<header class="main-header navbar-light header-sticky header-sticky-smart position-absolute fixed-top">
        <div class="sticky-area">
            <div class="container container-xxl">
                <nav class="navbar navbar-expand-xl px-0 py-2 py-xl-0 d-block">
                    <div class="d-none d-xl-block">
                        <div class="row align-items-center">
                            <div class="col-2">
<!--                                 <div class="position-relative"> -->
<!--                                     <a href="#search-popup" data-gtf-mfp="true" -->
<!--                                         data-mfp-options='{"type":"inline","focus": "#keyword","mainClass": "mfp-search-form mfp-move-from-top mfp-align-top"}' -->
<!--                                         class="nav-search d-flex align-items-center"><i class="far fa-search"></i><span -->
<!--                                             class="d-none d-xl-inline-block ml-2 font-weight-500">Search</span></a> -->
<!--                                 </div> -->
                            </div>
                            <div class="col-xl-8 mx-auto position-static">
                                <div class="d-flex mt-3 mt-xl-0 align-items-center w-100 justify-content-center">
                                    <ul class="navbar-nav hover-menu main-menu px-0 mx-xl-n4">
                                        <li aria-haspopup="true" aria-expanded="false"
                                            class="nav-item dropdown-item-home dropdown py-2 py-xl-5 px-0 px-xl-2">
                                            <a class="nav-link dropdown-toggle p-0" href="#"
                                                data-toggle="dropdown"  style="color:black">
                                                關於
                                                <span class="caret"></span>
                                            </a>
                                            <ul class="dropdown-menu pt-3 pb-0 pb-xl-3 x-animated x-fadeInUp">
                                                <li class="dropdown-item">
                                                    <a class="dropdown-link" href="/inhouse/about" style="color:black">
                                                        品牌故事
                                                    </a>
                                                </li>
<!--                                                 <li class="dropdown-item"> -->
<!--                                                     <a class="dropdown-link" href="#" style="color:black"> -->
<!--                                                         社會責任 -->
<!--                                                     </a> -->
<!--                                                 </li> -->
<!--                                                 <li class="dropdown-item"> -->
<!--                                                     <a class="dropdown-link" href="#" style="color:black"> -->
<!--                                                         企業理念 -->
<!--                                                     </a> -->
<!--                                                 </li> -->
<!--                                                 <li class="dropdown-item"> -->
<!--                                                     <a class="dropdown-link" href="#" style="color:black"> -->
<!--                                                         相關影片 -->
<!--                                                     </a> -->
<!--                                                 </li> -->
                                                <li class="dropdown-item">
                                                    <a class="dropdown-link" href="/inhouse/reserve/StoreCLI" style="color:black">
                                                        直營門市
                                                    </a>
                                                </li>
                                            </ul>
                                        </li>
                                        
                                        <li aria-haspopup="true" aria-expanded="false"
                                            class="nav-item dropdown-item-pages dropdown py-2 py-xl-5 px-0 px-xl-2">
                                            <a class="nav-link dropdown-toggle p-0" href="/inhouse/activity" data-toggle="dropdown"  style="color:black">
                                                最新消息
                                                <span class="caret"></span>
                                            </a>
                                            <ul class="dropdown-menu pt-3 pb-0 pb-xl-3 x-animated x-fadeInUp">
                                                <li class="dropdown-item">
                                                    <a class="dropdown-link" href="/inhouse/activity" style="color:black">
                                                        新聞
                                                    </a>
                                                </li>
                                                <li class="dropdown-item dropdown dropright">
                                                    <a class="dropdown-link" href="/inhouse/coupon" style="color:black">
                                                        活動訊息(優惠券)
                                                    </a>
                                                </li>
<!--                                                 <li class="dropdown-item"> -->
<!--                                                     <a class="dropdown-link" href="#" style="color:black"> -->
<!--                                                         相關連結 -->
<!--                                                     </a> -->
<!--                                                 </li> -->
                                            </ul>
                                        </li>
                                        <li aria-haspopup="true" aria-expanded="false"
                                            class="nav-item dropdown py-2 py-xl-5 px-0 px-xl-2">
                                            <a class="nav-link  p-0" href="/inhouse/designer" style="color:black">
                                                設計師簡介
                                                <span class="caret"></span>
                                            </a>
                                        </li>
                                        <li aria-haspopup="true" aria-expanded="false"
                                            class="nav-item dropdown py-2 py-xl-5 px-0 px-xl-2">
                                            <a class="nav-link  p-0" href="/inhouse/portfolio/portfolioView/getall" style="color:black">
                                                客戶分享
                                                <span class="caret"></span>
                                            </a>
                                        </li>
<!--                                         <li aria-haspopup="true" aria-expanded="false" -->
<!--                                             class="nav-item dropdown py-2 py-xl-5 px-0 px-xl-2"> -->
<!--                                             <a class="nav-link  p-0" href="#" data-toggle="dropdown" style="color:black"> -->
<!--                                                 作品集 -->
<!--                                                 <span class="caret"></span> -->
<!--                                             </a> -->
<!--                                         </li> -->
                                    </ul>
                                    <a class="navbar-brand mx-5 mr-0 d-inline-block py-0" href="/inhouse/homepage">
                                        <img src="/images/logo.png" alt="Furnitor" style="width: 75px">
                                    </a>
                                    <ul class="navbar-nav hover-menu main-menu px-0 mx-xl-n4">
                                        
                                        <li aria-haspopup="true" aria-expanded="false"
                                            class="nav-item dropdown py-2 py-xl-5 px-0 px-xl-2">
                                            <a class="nav-link dropdown-toggle p-0" href="/inhouse/article/articleView/getall" style="color:black">
                                                精選專欄
                                                <span class="caret"></span>
                                            </a>
                                            <ul class="dropdown-menu pt-3 pb-0 pb-xl-3 x-animated x-fadeInUp">
                                                <li class="dropdown-item dropdown dropright">
                                                    <a class="dropdown-link" href="/inhouse/article/articleView/getall" style="color:black">
                                                        綜合討論
                                                        
                                                    </a>
                                                </li>		
<!--                                                 <li class="dropdown-item dropdown dropright"> -->
<!--                                                     <a class="dropdown-link" href="/inhouse/article/articleView/getalla1" style="color:black"> -->
<!--                                                         客戶分享 -->
<!--                                                     </a> -->
<!--                                                 </li> -->
                                                <li class="dropdown-item dropdown dropright">
                                                    <a class="dropdown-link" href="/inhouse/article/articleView/getalla2" style="color:black">
                                                        名人推薦
                                                    </a>
                                                </li>
                                            </ul>
                                        </li>
                                        
                                        <li aria-haspopup="true" aria-expanded="false"
                                            class="nav-item dropdown py-2 py-xl-5 px-0 px-xl-2">
                                            <a class="nav-link dropdown-toggle p-0" href="/inhouse/reserve/ServiceProcess" style="color:black">
                                                服務流程
                                                <span class="caret"></span>
                                            </a>
                                            <ul class="dropdown-menu pt-3 pb-0 pb-xl-3 x-animated x-fadeInUp">
                                                <li class="dropdown-item dropdown dropright">
                                                    <a class="dropdown-link" href="/inhouse/reserve/ServiceProcess"
                                                        style="color:black">
                                                        流程介紹
                                                    </a>
                                                </li>
                                                
                                                <li class="dropdown-item dropdown dropright">
                                                    <a class="dropdown-link" href="/inhouse/reserve/addReserveForm" style="color:black">
                                                        預約(表單)
                                                    </a>
                                                </li>
                                            </ul>
                                        </li>
                                        <li aria-haspopup="true" aria-expanded="false"
                                            class="nav-item dropdown py-2 py-xl-5 px-0 px-xl-2">
                                            <a class="nav-link  p-0" href="/inhouse/reserve/addReserveForm" style="color:black">
                                                預約服務
                                                <span class="caret"></span>
                                            </a>
                                        </li>
                                        <li aria-haspopup="true" aria-expanded="false"
                                            class="nav-item dropdown py-2 py-xl-5 px-0 px-xl-2">
                                            <a class="nav-link  p-0" href="/inhouse/shop/queryallbypage/1" style="color:black">
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
                                    <c:if test="${not empty member.member_id }">
  										<li class="nav-item">
                                        <a class="nav-link pr-3 py-0" href="/inhouse/ProfilesMember">
                                            <i class="far fa-user-check"></i>
                                        </a>
                                        </li>
									</c:if>
									<c:if test="${empty member.member_id}">
  										<li class="nav-item">
                                        <a class="nav-link pr-3 py-0" href="/inhouse/ProfilesMember">
                                            <i class="far fa-user-alt-slash"></i>
                                        </a>
                                        </li>
									</c:if>
                                    <li class="nav-item"><a onclick="countByMemberName()"
										class="nav-link position-relative px-3 py-0" ><i
											class="far fa-heart" data-canvas="true" data-canvas-options='{"container":"#keep"}'></i> <span
											class="position-absolute number"></span></a>
										<input type="hidden" id="member_name" value="${pageContext.request.userPrincipal.name}" />		
									</li>
                                    <li class="nav-item">
                                        <a class="nav-link position-relative px-3 menu-cart py-0" href="#"
                                            data-canvas="true" data-canvas-options='{"container":".cart-canvas"}'>
                                            <i class="far fa-shopping-basket"></i>
                                            <span class="position-absolute number my-cart-counter">0</span>
                                        </a>
                                    </li>
                                    <li class="nav-item">
                                        <a class="nav-link pr-3 py-0" href="/inhouse/logout">
                                            <i class="far fa-sign-out"></i>
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
                                <img src="/images/logo.png" alt="Furnitor">
                            </a></div>
                        <a href="#search-popup" data-gtf-mfp="true"
                            data-mfp-options='{"type":"inline","focus": "#keyword","mainClass": "mfp-search-form mfp-move-from-top mfp-align-top"}'
                            class="nav-search d-flex align-items-center"><i class="far fa-search"></i></a>
                    </div>
                </nav>
            </div>
        </div>
    </header>
</body>
</html>