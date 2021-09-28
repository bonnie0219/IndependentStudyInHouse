<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
.time {
    background: rgb(12, 12, 12);
    color: #fff;
    border: 3px solid rgb(255, 252, 252);
    box-shadow: 0 2px 10px 0 rgba(0,0,0,0.16), 0 2px 10px 0 rgba(0,0,0,0.12);
    
    text-align: center;
    width: 250px;
}
.hms {
    
    font-size: 25pt;
    font-weight: 200;
}
.ampm {
    font-size: 20pt;
}
.date {
    font-size: 15pt;
}

</style>
</head>
<body>
<div class="quixnav">
			<div class="quixnav-scroll">
				<ul class="metismenu" id="menu">
    
    			
                    <c:if test="${employee.employee_status=='boss' || employee.employee_status=='user'}">
				    <li><a  href="<c:url value="/backend/member/memberqueryAction.controller"/>" aria-expanded="false">
							<i class="icon icon-single-04"></i> <span class="nav-text">會員管理</span>
					</a></li></c:if>
					 <c:if test="${employee.employee_status=='boss' || employee.employee_status=='user'}">
					<li><a  href="<c:url value="/backend/designer/designerqueryAction.controller"/>" aria-expanded="false">
							<i class="icon icon-single-04"></i> <span class="nav-text">設計師管理</span>
					</a></li></c:if>
					 <c:if test="${employee.employee_status=='boss' || employee.employee_status=='user'}">
					<li><a class="" href="/backend/portfolio/portfolioqueryAction.controller" aria-expanded="false">
							<i class="bi bi-images"></i> <span class="nav-text">作品集管理</span>
					</a></li></c:if>
                    <c:if test="${employee.employee_status=='boss' || employee.employee_status=='user'}">
					<li><a href="<c:url value="/backend/article/articlequeryAction.controller"/>" aria-expanded="false">
							<i class="bi bi-file-richtext"></i> <span class="nav-text">專欄管理</span>
					</a></li></c:if>
                    <c:if test="${employee.employee_status=='boss' || employee.employee_status=='user'}">
					<li><a href="<c:url value="/backend/product/AllProduct"/>" class="" aria-expanded="false">
							<i class="bi bi-bag"></i> <span class="nav-text">商品管理</span>
					</a></li></c:if>
                    <c:if test="${employee.employee_status=='boss' || employee.employee_status=='user'}">
					<li><a href="<c:url value="/backend/shopcart/shopcarlist.controller"/>" aria-expanded="false">
							<i class="bi bi-cart"></i> <span class="nav-text">訂單管理</span>
					</a></li></c:if>
                    <c:if test="${employee.employee_status=='boss' || employee.employee_status=='user'}">
					<li><a href="<c:url value="/backend/coupon/couponqueryAction.controller"/>" aria-expanded="false">
							<i class="bi bi-gift"></i> <span class="nav-text">優惠券管理</span>
					</a></li></c:if>
                    <c:if test="${employee.employee_status=='boss' || employee.employee_status=='user'}">
					<li><a class="" href="/backend/reserve/allReserve" aria-expanded="false">
							<i class="bi bi-calendar-check"></i> <span class="nav-text">預約管理</span>
					</a></li></c:if>
                    <c:if test="${employee.employee_status=='boss'}">
					<li><a class="" href="/backend/employee/employeequeryAction.controller" aria-expanded="false">
							<i class="icon icon-single-04"></i> <span class="nav-text">員工管理</span>
					</a></li></c:if>
				    <c:if test="${employee.employee_status=='boss' || employee.employee_status=='user'}">	
					<li><a class="" href="/backend/allecharts" aria-expanded="false">
							<i class="icon icon-globe-2"></i> <span class="nav-text">數據管理</span>
					</a></li></c:if>
					<c:if test="${employee.employee_status=='boss' || employee.employee_status=='user'}">
					<li><a class="" href="/backend/message" aria-expanded="false">
							<i class="icon icon-globe-2"></i> <span class="nav-text">客服系統</span>
					</a></li></c:if>
        <div >
        
        <div class="time">
        <span class="hms"></span>
        <span class="ampm"></span>
        <br>
        <span class="date"></span>
        </div>
       
        </div>
				</ul>
		

<script>

function updateTime() {
	  var dateInfo = new Date();

	  /* time */
	  var hr,
	    _min = (dateInfo.getMinutes() < 10) ? "0" + dateInfo.getMinutes() : dateInfo.getMinutes(),
	    sec = (dateInfo.getSeconds() < 10) ? "0" + dateInfo.getSeconds() : dateInfo.getSeconds(),
	    ampm = (dateInfo.getHours() >= 12) ? "PM" : "AM";

	  // replace 0 with 12 at midnight, subtract 12 from hour if 13–23
	  if (dateInfo.getHours() == 0) {
	    hr = 12;
	  } else if (dateInfo.getHours() > 12) {
	    hr = dateInfo.getHours() - 12;
	  } else {
	    hr = dateInfo.getHours();
	  }

	  var currentTime = hr + ":" + _min + ":" + sec;

	  // print time
	  document.getElementsByClassName("hms")[0].innerHTML = currentTime;
	  document.getElementsByClassName("ampm")[0].innerHTML = ampm;

	  /* date */
	  var dow = [
	      "Sunday",
	      "Monday",
	      "Tuesday",
	      "Wednesday",
	      "Thursday",
	      "Friday",
	      "Saturday"
	    ],
	    month = [
	      "January",
	      "February",
	      "March",
	      "April",
	      "May",
	      "June",
	      "July",
	      "August",
	      "September",
	      "October",
	      "November",
	      "December"
	    ],
	    day = dateInfo.getDate();

	  // store date
	  var currentDate = dow[dateInfo.getDay()] + ", " + month[dateInfo.getMonth()] + " " + day;

	  document.getElementsByClassName("date")[0].innerHTML = currentDate;
	};

	// print time and date once, then update them every second
	updateTime();
	setInterval(function() {
	  updateTime()
	}, 1000);
	
</script>
			</div>
		
</div>
		
</body>
</html>