<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>My WebSocket</title>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>

</head>
<body>
<!-- 	<div id="chatView" style=" position:fixed;bottom:100px;width:400px;height:300px;right:50px;margin-bottom:50px;z-index:9999;display:none"> -->
<!-- 	<div class="panel panel-default" style="bottom:0px;margin-bottom:0px"> -->
<!-- 	<div class="panel-heading"></div> -->
<%-- 	<button onclick="conectWebSocket()">目前使用者為:${pageContext.request.userPrincipal.name}</button> --%>
<%-- <%-- 	<a href="#" onclick="conectWebSocket()"  style="text-decoration:none;color:black;">目前使用者為:${pageContext.request.userPrincipal.name}</a> --%> --%>
	
	
<!-- 	<div id="message" style="margin-top:40px; border:1px solid gray; padding:20px;heignt:220px;overflow:scroll;" class="panel-body"></div><br/> -->
	
<!-- 	<hr style="margin-bottom:0px;margin-top:0px"> -->

	
<!-- 	消息: <input id="text" type="text" style="width:260px" placeholder="提出問題" onkeydown='id(event.keyCode==13){$(sendMessage).click()}'/> -->
<!-- 	<button id="sendMessage" onclick="send()">發送消息</button>  <button onclick="closeWebSocket()">結束</button><br/><br/> -->
<%-- 	<input type="hidden" id="nickname" value="${pageContext.request.userPrincipal.name}" readonly/> --%>
<!-- 	</div> -->
<!-- 	</div> -->

		<div class="container">
					<div class="chatbox">
						<div id="chatView" class="chatbox__support">
							<div class="chatbox__header">
								<div class="chatbox__image--header">
									<img src="/images${employee.employee_photo}" alt="image"
										style="width: 70px; height: 70px; border-radius: 50%;">
								</div>
								<div class="chatbox__content--header">
									<h4 class="chatbox__heading--header">線上客服</h4>
									<p onclick="conectWebSocket()" class="chatbox__description--header">${pageContext.request.userPrincipal.name}歡迎來到InHouse，<br/>請輸入想要問的問題~</p>
									
								</div>
							</div>
							<div class="chatbox__messages">
								<div id="message">
<!-- 									<p>歡迎使用線上客服</p> -->
<!-- 									<div class="messages__item messages__item--visitor">Can -->
<!-- 										you let me talk to the support?</div> -->
<!-- 									<div class="messages__item messages__item--operator"> -->
<!-- 										Sure!</div> -->
<!-- 									<div class="messages__item messages__item--visitor">Need -->
<!-- 										your help, I need a developer in my site.</div> -->
<!-- 									<div class="messages__item messages__item--operator"> -->
<!-- 										Hi... What is it? I'm a front-end developer, yay!</div> -->
<!-- 									<div class="messages__item messages__item--typing"> -->
<!-- 										<span class="messages__dot"></span> <span -->
<!-- 											class="messages__dot"></span> <span class="messages__dot"></span> -->
<!-- 									</div> -->
								</div>
							</div>
							<div class="chatbox__footer">
								<input id="text" type="text" placeholder="Write a message...">
								<a class="chatbox__send--footer" onclick="send()">Send</a>
								<a class="chatbox__send--footer" onclick="closeWebSocket()"> X </a>
							</div>
						</div>
						<div class="chatbox__button  " >
							<button ></button>
							<input type="hidden" id="nickname" value="${pageContext.request.userPrincipal.name}" readonly />
						</div>
					</div>
				</div>
				
				<!-- 開關連線要再想過 -->
				

<script src="/js_r/app.js"></script>					
<script type="text/javascript">

	var websocket=null;
	
	function conectWebSocket() {
		//$("#chatView").show();
		//$("#chatView").show();
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
		//document.getElementById('message').innerHTML +=  innerHTML +"<br/>" ;
		//document.getElementById('message').innerHTML += "<div class='messages__item messages__item--visitor'>" + innerHTML + "</div>";
				
		var nickname1 = document.getElementById("nickname").value;
		
		let nickname2 = innerHTML.substring(0,innerHTML.indexOf('：'));
		
		if (nickname1 === nickname2){
			document.getElementById('message').innerHTML += "<div class='messages__item messages__item--operator'>" + innerHTML + "</div>";
		} else {
			document.getElementById('message').innerHTML += "<div class='messages__item messages__item--visitor'>" + innerHTML + "</div>";
		}
		
		
		//document.getElementById('message').innerHTML += "<div>" + "<img src='/images${member.member_photo}' alt='image' style='width: 50px; height: 50px; border-radius: 50%;'>" + innerHTML + "<hr/>" +"</div>";

	}

	//關閉連接
	function closeWebSocket() {
		websocket.close();
		//$("#chatView").hide();
	}

	//發送消息
	function send() {
		var message = + document.getElementById('text').value;
		//var message = "<div class='messages__item messages__item--operator'>"+ document.getElementById('text').value + "</div>";
		websocket.send(message);
		document.getElementById('text').value="";
	}
</script>
		
</body>

<!-- <script type="text/javascript"> -->

<!-- // 	var websocket=null; -->
	
<!-- // 	function conectWebSocket() { -->
<!-- // 		$("#chatView").show(); -->
<!-- // 		var nickname = document.getElementById("nickname").value; -->
<!-- // 		if(nickname==""){   -->
<!-- // 		       alert("請輸入名字");   -->
<!-- // 		       return;   -->
<!-- // 		}   -->
		
<!-- // 		//判斷是否支援WebSocker -->
<!-- // 		if('WebSocket'in window) { -->
<!-- // 			websocket = new WebSocket("ws://localhost:8081/websocket/"+nickname); -->
<!-- // 			alert('成功') -->
			
<!-- // 		}else { -->
<!-- // 			alert('Not support WebSocket') -->
<!-- // 		} -->
		
		
		
<!-- // 		//連接發生錯誤的回調方法 -->
<!-- // 		websocket.onerror = function() { -->
<!-- // 			setMessageInnerHTML("error"); -->
<!-- // 			console.log("連接發生錯誤的回調方法錯誤"); -->
<!-- // 		}; -->

<!-- // 		//建立連接成功的方法 -->
<!-- // 		websocket.onopen = function(event) { -->
<!-- // 			setMessageInnerHTML("歡迎使用線上客服"); -->
<!-- // 		} -->

<!-- // 		//連接成功建立的回調方法 -->
<!-- // 		websocket.onmessage = function(event) { -->
<!-- // 			setMessageInnerHTML(event.data); -->
<!-- // 		} -->

<!-- // 		//關閉連接的方法 -->
<!-- // 		websocket.onclose = function() { -->
<!-- // 			websocket.close(); -->
<!-- // 			setMessageInnerHTML("結束使用線上客服"); -->
<!-- // 		} -->

<!-- // 		//監聽窗口關閉事件，當關閉時，主動去關閉websocket的連接，防止連接還沒斷開就關閉了，server端會拋出異常 -->
<!-- // 		window.onbeforeunload = function() { -->
<!-- // 			websocket.close(); -->
<!-- // 		} -->

<!-- // 	} -->

<!-- // 	// 將消息顯示在網頁上 -->
<!-- // 	function setMessageInnerHTML(innerHTML) { -->
<!-- // 		document.getElementById('message').innerHTML += innerHTML + '<br/>'; -->
<!-- // 		var content = document.getElementById('message'); -->
<!-- // 		content.scrollTop = content.scrollHeight; -->
<!-- // 	} -->

<!-- // 	//關閉連接 -->
<!-- // 	function closeWebSocket() { -->
<!-- // 		websocket.close(); -->
<!-- // 		$("#chatView").hide(); -->
<!-- // 	} -->

<!-- // 	//發送消息 -->
<!-- // 	function send() { -->
<!-- // 		var message = document.getElementById('text').value; -->
<!-- // 		websocket.send(message); -->
<!-- // 		document.getElementById('text').value=""; -->
<!-- // 	} -->
<!-- </script> -->

</html>