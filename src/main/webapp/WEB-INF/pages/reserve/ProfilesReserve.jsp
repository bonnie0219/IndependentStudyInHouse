<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Reserve List</title>
<style type="text/css">
table {
	margin: auto;
	width: 70%
}

#ptitle {
	background-color: orange;
}

#productListTitle {
	margin: auto;
	font-size: 25px;
	font-weight: bold;
	text-align: center;
}
</style>
<!-- 加入Ajax函式庫 -->
<script	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script type="text/javascript">
// 顯示第一頁
var indexPage = 1;
$(document).ready(function(){
    load(indexPage);
});

function change(page){
   indexPage = page;
  load(indexPage);
}


function load(indexPage){
	//透過ajax送過去
$.ajax({
	
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
}
</script>
</head>
<body>
	<div id="productListTitle">ProductQuery</div>
	
<!-- 	利用json轉成table標籤 -->
	<table id="showproduct" border="1">
	</table>
	
	<table id="showpage">
		<tr>
			<td>Total Pages:${totalPages} Total Records:${totalElements}</td>
<!-- 			3個合併往左邊靠 -->
			<td colspan="3" align="right">Previous <c:forEach var="i"
					begin="1" end="${totalPages}" step="1">
					<button id="myPage" value="${i}" onclick="change(${i})">${i}</button>
				</c:forEach>Next
			</td>
		</tr>
	</table>
</body>
</html>