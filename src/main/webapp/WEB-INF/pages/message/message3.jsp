<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>My WebSocket</title>
<style>
	#message {
		margin-top:40px;
		border:1px solid gray;
		padding:20px;
	}
</style>
</head>
<body>
<%-- 	<button onclick="conectWebSocket()">目前使用者為:${pageContext.request.userPrincipal.name}</button> --%>
	<a href="#" onclick="conectWebSocket()"  style="text-decoration:none;color:black;">目前使用者為:${pageContext.request.userPrincipal.name}</a>
	
	<hr/>

	<div id="message"></div><br/>
	<input id="text" type="text" size="35" placeholder="請輸入欲查詢的問題">
	<button onclick="send()">發送消息</button>  <button onclick="closeWebSocket()">結束</button><br/><br/>
	<input type="hidden" id="nickname" value="${pageContext.request.userPrincipal.name}" readonly/>
	
</body>

<script type="text/javascript">

	var websocket=null;
	
	function conectWebSocket() {
		var nickname = document.getElementById("nickname").value;
		if(nickname==""){  
		       alert("請輸入名字");  
		       return;  
		}  
		
		//判斷是否支援WebSocker
		if('WebSocket'in window) {
			websocket = new WebSocket("ws://localhost:8080/websocket/"+nickname);
			//alert('成功')
			
		}else {
			alert('Not support WebSocket')
		}
		
		
		
		//連接發生錯誤的回調方法
		websocket.onerror = function() {
			setMessageInnerHTML("error");
			console.log("連接發生錯誤的回調方法錯誤");
		};

		//建立連接成功的方法
		websocket.onopen = function(event) {
			setMessageInnerHTML("歡迎使用線上客服");
		}

		//連接成功建立的回調方法
		websocket.onmessage = function(event) {
			setMessageInnerHTML(event.data);
		}

		//關閉連接的方法
		websocket.onclose = function() {
			websocket.close();
			setMessageInnerHTML("結束使用線上客服");
		}

		//監聽窗口關閉事件，當關閉時，主動去關閉websocket的連接，防止連接還沒斷開就關閉了，server端會拋出異常
		window.onbeforeunload = function() {
			websocket.close();
		}

	}

	// 將消息顯示在網頁上
	function setMessageInnerHTML(innerHTML) {
		document.getElementById('message').innerHTML += innerHTML + '<br/>';
	}

	//關閉連接
	function closeWebSocket() {
		websocket.close();
	}

	//發送消息
	function send() {
		var message = document.getElementById('text').value;
		websocket.send(message);
		reset();
	}
	
	//清空文字框內的值
	function reset() {
		$('#text').val('');

	}
</script>

</html>