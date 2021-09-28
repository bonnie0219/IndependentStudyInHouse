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
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@9"></script> 

<!-- **************step1.改你的管理名稱 -->
<title>訂單管理</title>


<!-- Favicon icon 
<link rel="icon" type="image/png" sizes="16x16"
	href="./images/favicon.png">-->
<!-- Datatable -->
<link href="/vendor/datatables/css/jquery.dataTables.min.css"
	rel="stylesheet">
<!-- Custom Stylesheet -->
<link href="/css/style.css" rel="stylesheet">


<link rel="stylesheet" type="text/css"
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css">

<link rel="stylesheet" type="text/css"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css">
<!-- ------------------------ :))) --------------------------- -->



<script	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script type="text/javascript">

// $(document).ready(function(){
// 	datatableFetch();
// });

// function datatableFetch() {
//     $('#example').DataTable({
//         destroy: true,
//         "ajax": {
//             "url": 'http://localhost:8080/backend/shopcart/shopcarqueryall.controller',
//             "type": "POST",
//             dataSrc: ''
//         },
//         "columns": [
//             {"data": "order_shopCartId"},
// //             {"data": "memberid.member_id"},
//             {"data": "order_shopOrderDate"},
//             {"data": "order_productToTalPrice"},
//             {"data": null, defaultContent: "",  orderable : false,},
//             {"data": null, defaultContent: "",  orderable : false,},
//         ],
//         "createdRow": function (row, data, index) {
//             $('td', row).eq(3).append($("<a href='#editProductModal'data-toggle='modal' class='btn btn-warning' onclick='upd("+data.order_shopCartId+")' ><i class='bi bi-pencil-square'></i></a>"));
//             $('td', row).eq(4).append($("<button type='button' class='btn btn-danger' onclick = 'del("+data.order_shopCartId+")'><i class='bi bi-trash'></i></button></td>"));
//         }
//     });
// }




// function add(){
// 	 var order = {};
//     var TypeName = "";
//     var statusSuccess="";
//     var statusError="";
//     //$('#btnaddmember').click(function(){ 		
//    		order.order_productName = $('#order_productName').val();
//    		order.order_productPrice = $('#order_productPrice').val();
//    		order.order_productCount= $('#order_productCount').val();
//    		order.order_shopOrderDate=$('#order_shopOrderDate').val();
//    		order.order_productToTalPrice=$('#order_productToTalPrice').val();
//           datatableFetch();
   	 
//    	 var orderObj = JSON.stringify(order);
//    	 $.ajax({
//    		 type:'post',
//    		 url:'/backend/shopcart/add',
//    		 data:orderObj,
//    		 contentType:'application/json;charset=utf-8',
//    		 success: function(){
//    			 alert("新增成功");
//    			datatableFetch();
//    			 reset();
//    		 },
//    		 error: function(){
//    			 alert("新增失敗")
//    		 }
//    	 })   
// }

// function update(){
// 	 var order = {};
//    var TypeName = "";
//    var statusSuccess="";
//    var statusError="";
//    //$('#btnaddmember').click(function(){
//  	order.order_shopCartId=$('#order_shopCartId_edit').val();
		
//   		order.order_productName = $('#order_productName_edit').val();
//   		order.order_productPrice = $('#order_productPrice_edit').val();
//   		order.order_productCount= $('#order_productCount_edit').val();
//   		order.order_shopOrderDate=$('#order_shopOrderDate_edit').val();
//   		order.order_productToTalPrice=$('#order_productToTalPrice_edit').val(); 		
//          datatableFetch();
//   	 var orderObj = JSON.stringify(order);
//   	 $.ajax({
//   		 type:'post',
//   		 url:'http://localhost:8080/backend/shopcart/update/'+order.order_shopCartId,
//   		 data:orderObj,
//   		 contentType:'application/json;charset=utf-8',
//   		 success: function(){
//   			 alert("修改成功");
//   			datatableFetch();
//   			 reset();
//   		 },
//   		 error: function(){
//   			 alert("修改失敗")
//   		 }
//   	 })
// }


// function upd(order_shopCartId){
// 	$.ajax({
// 		url:'http://localhost:8080/backend/shopcart/shopcarquery.controller/'+order_shopCartId,
// 		method:'post',
// 		dataType:'JSON',
// 		success: function (data) {
// 			console.log(data.order_shopCartId);
// 			console.log("==================");
// 			var json = JSON.stringify(data, null, 4);
// 			console.log(json);
// 			var order = JSON.parse(json);
// 			console.log("-------------reserve-----------");
// 			console.log(order);
// 			$('#order_shopCartId_edit').val(order.order_shopCartId);
			
// 			$('#order_productName_edit').val(order.order_productName);
// 			$('#order_productPrice_edit').val(order.order_productPrice);
// 			$('#order_productCount_edit').val(order.order_productCount);
// 			$('#order_shopOrderDate_edit').val(order.order_shopOrderDate);
// 			$('#order_productToTalPrice_edit').val(order.order_productToTalPrice);

			
			
			

			
//       },
//       error: function (error) {
//           alert("修改發生錯誤");
//       }
//   })
// }




	 function del(order_shopCartId) {
	//------------------------------ 
	        Swal.fire({
	            title: "操作確認",
	            icon: 'warning',
	            text: "您確定要刪除嗎?!",
	            showCancelButton: true}).then(function(result) {
	           if (result.value) {
	            Swal.fire({icon: 'success',
	                title: '訂單已經刪除',
	                 showConfirmButton: false,
	                 timer: 1500});
	 //-------------------------------           
  $.ajax({
      url: 'http://localhost:8080/backend/shopcart/delete/'+order_shopCartId,
      type: 'post',
      success: function () {
//           alert('刪除成功');
          Swal.fire('刪除成功');
          location.href="/backend/shopcart/shopcarlist.controller";
      },
      error: function (error) {
    	  
      
          alert('刪除失敗'+error);
      }
  })       
	 //--------------------------------          
	           }
	           else {
	               Swal.fire({icon: 'error',
	                title: '您取消了操作',
	                 showConfirmButton: false,
	                 timer: 1500});
	           }
	        });
	    }

// function reset(){
// 	$('#order_shopCartId').val('');
	
// 	$('#order_productName').val('');
// 	$('#order_productPrice').val('');
// 	$('#order_productCount').val('');
// 	$('#order_shopOrderDate').val('');
// 	$('#order_productToTalPrice').val('');
// 	$('#btnaddmember').text("新增");
// }

</script>
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
			<a href="/backend/home" class="brand-logo"> <img class="logo-abbr"
				src="/images/logo.png" alt=""> <img class="logo-compact"
				src="/images/logo-text.png" alt=""> <img class="brand-title"
				src="/images/logo-text.png" alt="">
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
									</a> <a href="/backend/logout" class="dropdown-item"> <i
										class="icon-key"></i> <span class="ml-2">Logout </span>
									</a>
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

		<!--**********************************
            Sidebar end
        ***********************************-->

		<!--**********************************
            Content body start
        ***********************************-->
		<div class="content-body">
			<div class="container-fluid">
				<div class="row page-titles mx-0">
					<div class="col-sm-6 p-md-0">
						<div class="welcome-text">
							  <h4>Hi, welcome back! </h4>
                            <h2>${pageContext.request.userPrincipal.name}</h2>
							
							
							
<!-- 							step3. ****************改名稱 -->
						</div>
					</div>
					<div
						class="col-sm-6 p-md-0 justify-content-sm-end mt-2 mt-sm-0 d-flex">
						<ol class="breadcrumb">
							<li class="breadcrumb-item"><a href="javascript:void(0)">首頁</a></li>
							<li class="breadcrumb-item active"><a
								href="javascript:void(0)">訂單管理</a></li>
						</ol>
					</div>
				</div>
				<!-- row -->




<!-- ////////////整夜table -->
				<div class="row">
					<div class="col-12">
						<div class="card">
							<div class="card-header">
								<h6 class="card-title">所有訂單列表</h6>
								

<!-- 								step4.**********注意路徑 -->
<!-- 								<a href="#addProductModal"  class="btn btn-success" data-toggle="modal"><i -->
<!-- 									class="bi bi-plus-square"></i> <span>新增訂單</span></a> -->
							
									
							</div>
							<div class="card-body">
								<div class="table-responsive">
									<table id="example" class="display" style="min-width: 845px">
									<thead>
											<tr>
												<th>購物車ID</th>
												<th>會員ID</th>
												<th>訂單資訊</th>
												<th>訂單日期</th>
												<th>商品總價</th>
												<th>刪除</th>
											</tr>
									</thead>
									<tbody>
											<c:forEach var="allOrder" items="${allOrder}">
												<tr >
													<td>${allOrder.order_shopCartId}</td>
<%-- 													<c:forEach var="member" items="${allOrder.member}"> --%>
<%-- 													<td>${member.memberid}</td> --%>
<%-- 													<td>${allOrder.member}</td> --%>
<%-- 													</c:forEach> --%>
<%-- 													<c:forEach var="shopCartOrderItem" items="${allOrder.shopCartOrderItem}"> --%>
<%-- 													<td>${shopCartOrderItem.orderItem_productName}</td> --%>
													<td id="${allOrder.order_shopCartId}memberid"></td>
													<td id="${allOrder.order_shopCartId}productname"></td>
<%-- 													</c:forEach> --%>
													<td>${allOrder.order_shopOrderDate}</td>

													<td>${allOrder.order_productToTalPrice}</td>
													<td><button type='button' class='btn btn-danger' onclick = 'del("${allOrder.order_shopCartId}")'><i class='bi bi-trash'></i></button></td>

												</tr>
												<script>
// 												var data = '';
												var shopcartid = ${allOrder.order_shopCartId};
// 												console.log(shopcartid);
												$.ajax({
													type : 'POST',
													url : 'http://localhost:8080/backend/shopcart/shopcartDetail',
													data:{shopcartid:shopcartid},
// 													contentType : 'application/json',
													success : function(data){

														console.log("success");

														for(let i=0; i<data.length; i++){
															var productName = data[i].orderItem_productName;
															console.log(productName);
															$('#'+${allOrder.order_shopCartId}+'productname').append(productName+'<br>');
														}
														
													},
													error : function(){
														console.log("error");
													}
												});
												$.ajax({
													type : 'post',
													url : 'http://localhost:8080/backend/shopcart/getmemberid',
													data:{shopcartid:shopcartid},
													success : function(data){
														$('#'+${allOrder.order_shopCartId}+'memberid').append(data);
													
														},
														error : function(){
															console.log("error")
														}
														
													
												
												});
												

											</script>
											</c:forEach>
										</tbody>
									
									</table>


		

								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		
		
		
<!-- 		//////////////新增 -->
		
		
		<div id="addProductModal" class="modal fade">
		<div class="modal-dialog">
			<div class="modal-content">
				<form>
					<div class="modal-header">
						<h4 class="modal-title" style="align:center">新增商品</h4>
						<button type="button" class="close" data-dismiss="modal"
							aria-hidden="true">&times;</button>
					</div>
					
					
      <table style="margin: 30px; border-collapse:separate; border-spacing:0px 10px; ">
      
      	<tr >
            <td>ID</td>
            <td><input type="text" id="order_shopCartId" disabled ></td>
        </tr>
        
        <tr>
            <td>1. 商品名稱</td>
            <td><input type="text"  class="form-control form-control-sm" style="width: 200px; height: 30PX;" name="order_productName" id="order_productName" ></td>
        </tr>
        <tr>
            <td>2. 商品單價</td>
            <td><input type="text"  class="form-control form-control-sm" style="width: 200px; height: 30PX;" name="order_productPrice" id="order_productPrice" ></td>
        </tr>
        <tr>
            <td>3. 購買數量</td>
            <td><input type="text"  class="form-control form-control-sm" style="width: 200px; height: 30PX;" name="order_productCount" id="order_productCount" ></td>
        </tr>
        <tr>
            <td>4. 訂單日期</td>
            <td><input type="text"  class="form-control form-control-sm" style="width: 200px; height: 30PX;" name="order_shopOrderDate" id="order_shopOrderDate" ></td>
        </tr>
        <tr>
            <td>5. 商品總價</td>
            <td><input type="text"  class="form-control form-control-sm" style="width: 200px; height: 30PX;" name="order_productToTalPrice" id="order_productToTalPrice" ></td>
        </tr>
       

        
        <tr>
			 <td><button id="btnaddmember"  class="btn btn-success" value="add" onclick = "add()">新增</button></td>
		</tr>
    </table>
	</form>    
    </div>
    
		</div>
	</div>

<!-- 	******************* -->
		
		<div id="editProductModal" class="modal fade">
		<div class="modal-dialog">
			<div class="modal-content">
				<form>
					<div class="modal-header">
						<h4 class="modal-title" style="align:center">修改</h4>
						<button type="button" class="close" data-dismiss="modal"
							aria-hidden="true">&times;</button>
					</div>
					
					
      <table  style="margin: 30px; border-collapse:separate; border-spacing:0px 10px;">
      	<tr >
            <td>購物車ID</td>
            <td><input type="text" id="order_shopCartId_edit" disabled ></td>
        </tr>
        
<!--         <tr> -->
<!--             <td>1. 商品名稱</td> -->
<!--             <td><input type="text"  class="form-control form-control-sm" style="width: 200px; height: 30PX;" name="order_productName_edit" id="order_productName_edit" ></td> -->
<!--         </tr> -->
<!--         <tr> -->
<!--             <td>2. 商品單價</td> -->
<!--             <td><input type="text"  class="form-control form-control-sm" style="width: 200px; height: 30PX;" name="order_productPrice_edit" id="order_productPrice_edit" ></td> -->
<!--         </tr> -->
<!--         <tr> -->
<!--             <td>3. 購買數量</td> -->
<!--             <td><input type="text"  class="form-control form-control-sm" style="width: 200px; height: 30PX;" name="order_productCount_edit" id="order_productCount_edit" ></td> -->
<!--         </tr> -->
        <tr>
            <td>1. 訂單日期</td>
            <td><input type="text"  class="form-control form-control-sm" style="width: 200px; height: 30PX;" name="order_shopOrderDate_edit" id="order_shopOrderDate_edit" ></td>
        </tr>
        <tr>
            <td>2. 商品總價</td>
            <td><input type="text"  class="form-control form-control-sm" style="width: 200px; height: 30PX;" name="order_productToTalPrice_edit" id="order_productToTalPrice_edit" ></td>
        </tr>
 
        <tr>
			 <td><button id="btneditmember" class="btn btn-light"  onclick = "update()">修改</button></td>
		</tr>
    </table>
	</form>    
    </div>
    
		</div>
	</div>
		
		
		
		
		<!--**********************************
            Content body end
        ***********************************-->


		<!--**********************************
            Footer start
        ***********************************-->
		<div class="footer">
			<div class="copyright">
				<p>
					Copyright © Designed &amp; Developed by <a href="#" target="_blank">2021中壢資策會EEIT129第六組</a>
					
                        
				</p> 
			</div>
		</div>
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
	
	
	<script>
		
		$(document).ready(function(){
			
		
			$('#example').DataTable({
				
				destory: true,
				"bDestroy": true,
				select: true,
// 				lengthMenu: [5,10],
		    	"language":{
					"zeroRecords":"沒有符合的結果",
					"info":"顯示第 _START_ 至 _END_ 項結果，共 _TOTAL_ 項",
					"infoEmpty":"顯示第 0 至 0 項結果，共 0 項",
					"infoFiltered":"(從 _MAX_ 項結果中過濾)",
					"infoPostFix":"",
					"search":"搜尋:",
					"lengthMenu": "顯示 _MENU_ 項結果",
					"paginate":{
						
						"first": "第一頁",
						"previous":"上一頁",
						"next":"下一頁",
						"last": "最後一頁"
					},
					
		    	}
// 	        "createdRow": function (row, data, index) {
// 	            $('td', row).eq(5).append($("<a href='#editProductModal'data-toggle='modal' class='btn btn-warning' onclick='upd("+data.order_shopCartId+")' ><i class='bi bi-pencil-square'></i></a>"));
// 	            $('td', row).eq(6).append($("<button type='button' class='btn btn-danger' onclick = 'del("+data.order_shopCartId+")'><i class='bi bi-trash'></i></button></td>"));
// 	        }
			});
			
		});
	</script>
	

</body>

</html>