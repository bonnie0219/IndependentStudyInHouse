
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE HTML>
<html>
<head>
<title>Access Denied</title>
<meta http-equiv="refresh" content="5; url=/backend/home">
<style>
body{
	
	background:url("/images/403.gif") no-repeat;
/* 	background-size: cover; */
    background-position:50% 50%;
    background-attachment:fixed
}
.div1{
position: fixed;
top: 70%;
left: 28%;
}
.box{
    width:800px;
    height:600px;
    position:absolute;
    left:50%;
    top:50%;
    margin-top:-300px;
    margin-left:-400px;

}
</style>
</head>
 
<body>

    <div class="box">
    <div class="box " style="top:750px;left:520px">
        <c:if test="${message != null}"> 
		<label ><strong>${message}</strong></label>
		</c:if> 
                                        
        <br>
        
        <c:if test="${userInfo != null}"> 
		<label ><strong>原因: ${userInfo}</strong></label>
		</c:if> 
    </div>
    </div>
</body>
 
</html>