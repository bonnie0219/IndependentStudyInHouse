<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<link rel="icon" href="/images/logo.ico" type="image/x-icon">
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width,initial-scale=1">

<title>優惠券管理</title>

<!-- Datatable -->
<link href="/vendor/datatables/css/jquery.dataTables.min.css"
	rel="stylesheet">
<!-- Custom Stylesheet -->
<link href="/css/style.css" rel="stylesheet">


<link rel="stylesheet" type="text/css"
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css">

<link rel="stylesheet" type="text/css"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css">


<!--     <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css"> -->
<!-- <link rel="stylesheet" -->
<!-- 	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"> -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<!-- <script -->
<!-- 	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script> -->
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>


<!-- <script -->
<!-- 	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script> -->
<script type="text/javascript">




// step1.更改function
	$(document).ready(function(){
		datatableFetch();
	});
	
	function datatableFetch() {
        $('#example').DataTable({ 
            destroy: true, 
            "ajax": {
                "url": "/backend/coupon/all",
                "type": "POST",
                dataSrc: ''
            },
            //step2:對應你的欄位
            "columns": [
                {"data": "coupon_id"}, 
                {"data": "coupon_name"},
                {"data": "coupon_rule"},
                {"data": "coupon_type"},
                {"data": "coupon_status"},
                {"data": "coupon_starttime"},
                {"data": "coupon_endtime"},
                {"data": "coupon_count"},
                {"data": "coupon_addtime"},
                {"data": "coupon_photo"},
                
                {"data": "member.member_id"},
                
                {"data": null, defaultContent: "",  orderable : false,}, 
                {"data": null, defaultContent: "",  orderable : false,},
            ],
            
            //step3:修改刪除
            "createdRow": function (row, data, index) {//修改行显示的
             	                                 
//                 $('td', row).eq(10).append($('<a href="#editCouponModal" data-toggle="modal" onclick="upd(' + data.coupon_id + ')" >修改</a>'));
//                 $('td', row).eq(11).append($('<button onclick = " deleteCoupon(' + data.coupon_id + ')">刪除</button>'));
                
                
                $('td', row).eq(11).append($("<a href='#editCouponModal'data-toggle='modal' class='btn btn-warning' onclick='upd("+data.coupon_id+")' ><i class='bi bi-pencil-square'></i></a>"));
                $('td', row).eq(12).append($("<button type='button' class='btn btn-danger' onclick = 'deleteCoupon("+data.coupon_id+")'><i class='bi bi-trash'></i></button></td>"));
            },
            
            //step4:圖片
            "columnDefs":
                [{
                    "targets": 9, //第幾個欄位從0開始
                    "data": 'coupon_photo', //對你欄位名稱
                    "render": function (data, type) { 
                        return '<img src="' + data + '" alt="' + data + '"height="50" width="50"/>';
                    }
                }],
        });
    }
	
	function update(){ 
	      coupon_id =
	    	 $('#coupon_id_edit').val(); 
		     $("#coupon_id_edit").prop("disabled",false);
		     $("#coupon_photo_edit").prop("disabled",false);
	     		 
	     		var formData = new FormData($("#formdata_edit")[0]);
	     		console.log(coupon_id);
	     		
		     	datatableFetch(); //載入第一頁

	     	 $.ajax({ 
	     		 type:'post', 
	     		 url:'/backend/coupon/update2', 
	     		 data:formData, 
	     		 async:false, 
	     		 cache:false, 
	     		 contentType:false,  
     		 	 processData:false, 
	     		 success: function(){
	     			// alert("修改成功");
	     			 Swal.fire("修改成功");
	     			datatableFetch();
	     			 reset();  
	     		 },
	     		 error: function(){
	     			 //alert("修改失敗")
	     			 Swal.fire("修改失敗")
	     		 }
	     	 })

	}
//
function add(){ 
	     		//save	     		
	     		$("#coupon_id").prop("disabled",false);
     			$("#coupon_photo").prop("disabled",false);	     		
	     		var formData = new FormData($("#formdata_add")[0]);
		     	datatableFetch();
	     	    $.ajax({ 
	     		 type:'post', 
	     		 url:'/backend/coupon/add',
	     		 data:formData, 
	     		 async:false, 
	     		 cache:false, 
	     		 //contentType:'application/json;charset=utf-8',
	     		 contentType:false,  
     		 	 processData:false, 
	     		 success: function(){
	     			// alert("新增成功");
	     			 Swal.fire("新增成功");
	     			datatableFetch();
	     			 reset();  
	     		 },
	     		 error: function(){
	     			// alert("新增失敗")
	     			Swal.fire("新增失敗")
	     		 }
	     	 })

	}
//
	function upd(coupon_id){ 
		$.ajax({
			url:'/backend/coupon/findById/' + coupon_id, 
			method:'post',
			dataType:'JSON',
			contentType:'application/json', 
			success: function (data){
				console.log(data.coupont_id);
				console.log("==================");
				var json = JSON.stringify(data, null, 4);
				console.log(json);
				var coupon = JSON.parse(json);
				console.log(coupon.coupon_id);
				$('#coupon_id_edit').val(coupon.coupon_id);
				$('#coupon_name_edit').val(coupon.coupon_name);
				$('#coupon_rule_edit').val(coupon.coupon_rule);
				$('#coupon_type_edit').val(coupon.coupon_type);
				$('#coupon_status_edit').val(coupon.coupon_status);
				$('#coupon_starttime_edit').val(coupon.coupon_starttime);
				$('#coupon_endtime_edit').val(coupon.coupon_endtime);
				$('#coupon_count_edit').val(coupon.coupon_count);
				$('#coupon_addtime_edit').val(coupon.coupon_addtime);
				$('#coupon_photo_edit').val(coupon.coupon_photo);
				
				$('#member_edit').val(coupon.member.member_id);
				
			},     
			error: function (){
				//alert("修改失敗");
				 Swal.fire("修改失敗");
			}

			
		});
	}	
	
// 	function deleteCoupon(coupon_id){
//         $.ajax({
//             url: '/backend/coupon/delete/' + coupon_id,
//             type: 'POST',
//             success: function () {
//                 alert('刪除成功');	
//                 datatableFetch();
//             },
//             error: function (error) {
//                 alert('刪除失敗');
//             }
//         })
//     }
	
	 //------------------------------ 
 function deleteCoupon(coupon_id){
//------------------------------ 
        Swal.fire({
            title: "操作確認",
            icon: 'warning',
            text: "您確定要刪除嗎?!",
            showCancelButton: true}).then(function(result) {
           if (result.value) {
            Swal.fire({icon: 'success',
                title: '優惠券已經刪除',
                 showConfirmButton: false,
                 timer: 1500});
 //-------------------------------           
            $.ajax({
               url: '/backend/coupon/delete/' + coupon_id,
               type: 'POST',
               success: function () {
                   datatableFetch();
               },
               error: function (error) {
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
	
	function reset(){
		$('#coupon_id').val('');
		$('#coupon_name').val('');
		$('#coupon_rule').val('');
		$('#coupon_type').val('');
		$('#coupon_status').val('');
		$('#coupon_starttime').val('');
		$('#coupon_endtime').val('');
		$('#coupon_count').val('');
		$('#coupon_addtime').val('');
		$('#coupon_photo').val('');
	}
		
	
	
	//step5.確認有沒有code有打錯的~~
	
	
	function getvalues(){ 
		
		
		 $('#coupon_name').val("沙發打5折");
		    $('#coupon_rule').val("凡購買沙發類商品，該商品5折");
		    $('#coupon_type').val("折扣券");
		    $('#coupon_status').val("未啟用");
		    $('#coupon_starttime').val("1911-02-06");
		    $('#coupon_endtime').val("1911-02-08")
		    $('#coupon_count').val("1");
		    $('#coupon_addtime').val("1911-02-06");
		    $('#coupon_photo').val("/coupon/沙發打5折.png");
		    $('#file').val("");			   
		    $('#member').val("2");
		   
// 		  function ccc()
			
			var name= $('#coupon_name').val();  
			var rule= $('#coupon_rule').val();  
			var type= $('#coupon_type').val();   
			var status=$('#coupon_status').val();    
//				var name=document.getElementById("coupon_name").value;  
//				var name=document.getElementById("coupon_name").value;  
//				var name=document.getElementById("coupon_name").value;  
//				var name=document.getElementById("coupon_name").value;  
			  
//			    var name=document.getElementById("coupon_name").value;  

		    if( name!=="" &&  rule!=="" && type!==""  && status!==""){
		        //console.log("acc:"+acc)
		        console.log("222")
		       var abb= $("#AddCouponBtn")
		        abb.prop("disabled",false)

		    }
		    else{
		        var abb= $("#AddCouponBtn")
		        abb.prop("disabled",true)
		        }


		}
			
	
	
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
			<a href="/backend/home" class="brand-logo"> <img
				class="logo-abbr" src="/images/logo.png" alt=""> <img
				class="logo-compact" src="/images/logo-text.png" alt=""> <img
				class="brand-title" src="/images/logo-text.png" alt="">
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
<!-- 		<div class="quixnav"> -->
<!-- 			<div class="quixnav-scroll"> -->
<!-- 				<ul class="metismenu" id="menu"> -->
  

<%-- 				<li><a  href="<c:url value="/backend/member/memberqueryAction.controller"/>" aria-expanded="false"> --%>
<!-- 							<i class="icon icon-single-04"></i> <span class="nav-text">會員管理</span> -->
<!-- 					</a></li> -->
					
<%-- 					<li><a  href="<c:url value="/backend/designer/designerqueryAction.controller"/>" aria-expanded="false"> --%>
<!-- 							<i class="icon icon-single-04"></i> <span class="nav-text">設計師管理</span> -->
<!-- 					</a></li> -->
					
<!-- 					<li><a class="" href="#" aria-expanded="false"> -->
<!-- 							<i class="bi bi-images"></i> <span class="nav-text">作品集管理</span> -->
<!-- 					</a></li> -->

<%-- 					<li><a href="<c:url value="/backend/article/articlequeryAction.controller"/>" aria-expanded="false"> --%>
<!-- 							<i class="bi bi-file-richtext"></i> <span class="nav-text">專欄管理</span> -->
<!-- 					</a></li> -->

<%-- 					<li><a href="<c:url value="/backend/product/AllProduct"/>" class="" aria-expanded="false"> --%>
<!-- 							<i class="bi bi-bag"></i> <span class="nav-text">商品管理</span> -->
<!-- 					</a></li> -->

<%-- 					<li><a href="<c:url value="/backend/shopcart/shopcarlist.controller"/>" aria-expanded="false"> --%>
<!-- 							<i class="bi bi-cart"></i> <span class="nav-text">訂單管理</span> -->
<!-- 					</a></li> -->

<%-- 					<li><a href="<c:url value="/backend/coupon/couponqueryAction.controller"/>" aria-expanded="false"> --%>
<!-- 							<i class="bi bi-gift"></i> <span class="nav-text">優惠券管理</span> -->
<!-- 					</a></li> -->

<!-- 					<li><a class="" href="/backend/reserve/allReserve" aria-expanded="false"> -->
<!-- 							<i class="bi bi-calendar-check"></i> <span class="nav-text">預約管理</span> -->
<!-- 					</a></li> -->

<!-- 					<li><a class="" href="/backend/employee/employeequeryAction.controller" aria-expanded="false"> -->
<!-- 							<i class="icon icon-globe-2"></i> <span class="nav-text">員工管理</span> -->
<!-- 					</a></li> -->
<!-- 					<li><a class="" href="/backend/allecharts" aria-expanded="false"> -->
<!-- 							<i class="icon icon-globe-2"></i> <span class="nav-text">數據管理</span> -->
<!-- 					</a></li> -->
<!-- 						<li><a class="" href="/backend/message" aria-expanded="false"> -->
<!-- 							<i class="icon icon-globe-2"></i> <span class="nav-text">客服系統</span> -->
<!-- 					    </a></li> -->


<!-- 				</ul> -->
<!-- 			</div> -->
<!-- 		</div> -->
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
						</div>
					</div>
					<div
						class="col-sm-6 p-md-0 justify-content-sm-end mt-2 mt-sm-0 d-flex">
						<ol class="breadcrumb">
							<li class="breadcrumb-item"><a href="javascript:void(0)">首頁</a></li>
							<li class="breadcrumb-item active"><a
								href="javascript:void(0)">優惠劵管理</a></li>
						</ol>
					</div>
				</div>
				<!-- row -->


				<div class="row">
					<div class="col-12">
						<div class="card">
							<div class="card-header">
								<h6 class="card-title">所有優惠券列表</h6>
								<!-- 直接A 的ID連結到彈跳新增跟編輯表單 -->
								<!-- 								<a href="#addCouponModal" class="btn btn-success"   -->
								<!-- 									data-toggle="modal" ><i class="material-icons">&#xE147;</i> <span>新增</span></a> -->

								<a href="#addCouponModal" class="btn btn-success"
									data-toggle="modal"><i class="bi bi-plus-square"></i> <span>新增優惠券</span></a>

							</div>
							<div class="card-body">
								<div class="table-responsive">
									<table id="example" class="display" style="min-width: 845px">
										<thead>
											<tr>
												<th>ID</th>
												<th>名稱</th>
												<th>規則</th>
												<th>種類</th>
												<th>狀態</th>
												<th>開始時間</th>
												<th>結束時間</th>
												<th>數量</th>
												<th>創立時間</th>												
												<th>圖片</th>
												
												<th>會員ID</th>
												
												<th>修改</th>
												<th>刪除</th>
											</tr>
										</thead>

									</table>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>


		<!-- step6 新增的表單		 -->
		<div id="addCouponModal" class="modal fade">
			<div class="modal-dialog">
				<div class="modal-content">
					<form id="formdata_add">
						<div class="modal-header">
							<h4 class="modal-title" style="align: center">新增優惠券</h4>   <input type="button" onclick="getvalues()" value="一鍵輸入"> 
							<button type="button" class="close" data-dismiss="modal"
								aria-hidden="true">&times;</button>
						</div>
						<div class="modal-body">
							<div class="form-group">
								<label>編號</label> <input name="coupon_id" id="coupon_id"
									type="text" class="form-control" disabled>
							</div>
							<div class="form-group">
								<label>名稱</label> <input name="coupon_name" id="coupon_name"
									type="text" class="form-control" required   onblur="name12()" >
							</div>

							<div class="form-group">
								<label>規則</label> <input name="coupon_rule" id="coupon_rule"
									type="text" class="form-control" required onblur="rule()">
							</div>

							<div class="form-group">
								<label>類型</label> <input name="coupon_type" id="coupon_type"
									type="text" class="form-control" required onblur="type12()">
							</div>

							<div class="form-group">
								<label>狀態</label> <input name="coupon_status" id="coupon_status"
									type="text" class="form-control" required onblur="status()">
							</div>

							<div class="form-group">
								<label>開始時間</label> <input name="coupon_starttime"
									id="coupon_starttime" type="date" class="form-control" required>
							</div>


							<div class="form-group">
								<label>結束時間</label> <input name="coupon_endtime"
									id="coupon_endtime" type="date" class="form-control" required>
							</div>

							<div class="form-group">
								<label>數量</label> <input name="coupon_count" id="coupon_count"
									type="text" class="form-control" required onblur="count()">
							</div>

							<div class="form-group">
								<label>創立時間</label> <input name="coupon_addtime"
									id="coupon_addtime" type="date" class="form-control" required >
							</div>



							<div class="form-group">
								<label>圖片</label> <input type="text" id="coupon_photo"
									name="coupon_photo" disabled>
							</div>
							<div class="form-group">
								<label>請選擇檔案</label> <input type="file" id="file" name="file">
							</div>

	<!--123  -->
								<div class="form-group">
								<label>會員ID</label> <input name="member" id="member"
									type="text" class="form-control"  onblur="mem12()">
							</div>		


						</div>
						<div class="modal-footer">
							<input id="AddCouponBtn" type="button" onclick="add()"
								class="btn btn-success" value="新增" data-dismiss="modal" disabled="true">
							<input type="button" class="btn btn-default" data-dismiss="modal"
								value="取消">
						</div>
					</form>
				</div>
			</div>
		</div>


		<!-- step7 編輯的表單		 -->

		<div id="editCouponModal" class="modal fade">
			<div class="modal-dialog">
				<div class="modal-content">
					<form id="formdata_edit">
						<div class="modal-header">
							<h4 class="modal-title" style="align: center">修改優惠券</h4>
							<button type="button" class="close" data-dismiss="modal"
								aria-hidden="true">&times;</button>
						</div>
						<div class="modal-body">
							<div class="form-group">
								<label>ID</label> <input name="coupon_id_edit"
									id="coupon_id_edit" type="text" class="form-control" disabled>
							</div>
							<div class="form-group">
								<label>名稱</label> <input name="coupon_name_edit"
									id="coupon_name_edit" type="text" class="form-control" required>
								<!-- 以下複製 可檢查-->

							</div>
							<div class="form-group">
								<label>規則</label> <input name="coupon_rule_edit"
									id="coupon_rule_edit" type="text" class="form-control" required>
							</div>

							<div class="form-group">
								<label>類型</label> <input name="coupon_type_edit"
									id="coupon_type_edit" type="text" class="form-control" required>
							</div>

							<div class="form-group">
								<label>狀態</label> <input name="coupon_status_edit"
									id="coupon_status_edit" type="text" class="form-control"
									required>
							</div>

							<div class="form-group">
								<label>開始時間</label> <input name="coupon_starttime_edit"
									id="coupon_starttime_edit" type="date" class="form-control"
									required>
							</div>


							<div class="form-group">
								<label>結束時間</label> <input name="coupon_endtime_edit"
									id="coupon_endtime_edit" type="date" class="form-control"
									required>
							</div>

							<div class="form-group">
								<label>數量</label> <input name="coupon_count_edit"
									id="coupon_count_edit" type="text" class="form-control"
									required>
							</div>

							<div class="form-group">
								<label>創立時間</label> <input name="coupon_addtime_edit"
									id="coupon_addtime_edit" type="date" class="form-control"
									required>
							</div>



							<div class="form-group">
								<label>圖片</label> <input type="text" id="coupon_photo_edit"
									name="coupon_photo_edit" disabled>
							</div>
							<div class="form-group">
								<label>請選擇檔案</label> <input type="file" id="file_edit"
									name="file_edit">
							</div>
							
								<div class="form-group">
								<label>會員ID</label> <input name="member_edit"
									id="member_edit" type="text" class="form-control"
									>
							</div>
							
							
							
						</div>
						<div class="modal-footer">
							<input id="editCouponBtn" type="button" onclick="update()"
								class="btn btn-success" value="確認" data-dismiss="modal">
							<input type="button" class="btn btn-default" data-dismiss="modal"
								value="取消">
						</div>
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

		console.log("start")
	//$('#example').DataTable();
		
		
		//function ccc(){
			
			
		//function ccc()
		function name12(){
			
			 var that = $('#coupon_name').val();
			if(that==""){
				var abb= $("#AddCouponBtn")
		        abb.prop("disabled",true)
		        console.log("good")
		       //  alert("名稱請勿空值")
		        Swal.fire("名稱請勿空值")
			} else{
		        var abb= $("#AddCouponBtn")
		        abb.prop("disabled",false)
		        }
		
		}
		
		function rule(){
			
			 var that = $('#coupon_rule').val();
			if(that==""){
				var abb= $("#AddCouponBtn")
		        abb.prop("disabled",true)
		        console.log("good")
		       //  alert("規則請勿空值")
		       Swal.fire("規則請勿空值")
			} else{
		        var abb= $("#AddCouponBtn")
		        abb.prop("disabled",false)
		        }
		
		}
		
		function type12(){
			
			 var that = $('#coupon_type').val();
			if(that==""){
				var abb= $("#AddCouponBtn")
		        abb.prop("disabled",true)
		        console.log("good")
		         //alert("種類請勿空值")
		         Swal.fire("種類請勿空值")
			} else{
		        var abb= $("#AddCouponBtn")
		        abb.prop("disabled",false)
		        }
		
		}
		function status(){
			
			 var that = $('#coupon_status').val();
			if(that==""){
				var abb= $("#AddCouponBtn")
		        abb.prop("disabled",true)
		        console.log("good")
		        // alert("狀態請勿空值")
		         Swal.fire("狀態請勿空值")
			} else{
		        var abb= $("#AddCouponBtn")
		        abb.prop("disabled",false)
		        }
		
		}
		
		function count(){
			
			 var that = $('#coupon_count').val();
			if(that==""){
				var abb= $("#AddCouponBtn")
		        abb.prop("disabled",true)
		        console.log("good")
		        // alert("數量請勿空值")
		         Swal.fire("數量請勿空值")
			} else{
		        var abb= $("#AddCouponBtn")
		        abb.prop("disabled",false)
		        }
		
		}
		
		function mem12(){
			
			 var that = $('#member').val();
			 console.log("good"+that)
			if(that==""){
				var abb= $("#AddCouponBtn")
		        abb.prop("disabled",true)
		        console.log("good")
		       // alert("會員ID請勿空值")
		        Swal.fire("會員ID請勿空值")
		        
			} else{
		        var abb= $("#AddCouponBtn")
		        abb.prop("disabled",false)
		        }
		
		}
		
			
			function ccc(){
			
			
				
				console.log("111")
				  //  if( acc==""){
					  
					var name=document.getElementById("coupon_name").value;  
					var rule=document.getElementById("coupon_rule").value;  
					var type=document.getElementById("coupon_type").value;  
					var status=document.getElementById("coupon_status").value;  
//	 				var name=document.getElementById("coupon_name").value;  
//	 				var name=document.getElementById("coupon_name").value;  
//	 				var name=document.getElementById("coupon_name").value;  
//	 				var name=document.getElementById("coupon_name").value;  
					  
//	 			    var name=document.getElementById("coupon_name").value;  

				    if( name!=="" &&  rule!=="" && type!==""  && status!==""){
				        //console.log("acc:"+acc)
				        console.log("222")
				       var abb= $("#AddCouponBtn")
				        abb.prop("disabled",false)

				    }
				    else{
				        var abb= $("#AddCouponBtn")
				        abb.prop("disabled",true)
				        }


				}
		
	</script>

<script src="https://cdn.jsdelivr.net/npm/sweetalert2@9"></script> 

</body>

</html>