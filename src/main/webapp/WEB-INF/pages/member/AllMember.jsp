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
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@9"></script> 
<title>會員管理</title>

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

/*
提醒一:application.properties要加 ,classpath:/static/
提醒二:所有load(1)改成datatableFetch();
提醒三:id要是example
以下分為7步驟
*/

// step1.更改function
	$(document).ready(function(){
		datatableFetch();
	});
	
	function datatableFetch() {
        $('#example').DataTable({
            destroy: true,
            "ajax": {
                "url": "/backend/member/queryAll",
                "type": "POST",
                dataSrc: ''
            },
            //step2:對應你的欄位
            "columns": [
                {"data": "member_id"},
                {"data": "member_name"},
                {"data": "member_password"},
                {"data": "member_gender"},
                {"data": "member_email"},
                {"data": "member_phone"},
                {"data": "member_address"},
                {"data": "member_birthday"},
                {"data": "member_photo"},
                {"data": null, defaultContent: "",  orderable : false,},
                {"data": null, defaultContent: "",  orderable : false,},
            ],
            
            //step3:修改刪除
            "createdRow": function (row, data, index) {
             
//                 $('td', row).eq(9).append($('<a href="#editMemberModal" data-toggle="modal" onclick="upd(' + data.member_id + ')" >修改</a>'));
//                 $('td', row).eq(10).append($('<button onclick = " deleteMember(' + data.member_id + ')">刪除</button>'));
                
                $('td', row).eq(9).append($("<a href='#editMemberModal'data-toggle='modal' class='btn btn-warning' onclick='upd("+data.member_id+")' ><i class='bi bi-pencil-square'></i></a>"));
                $('td', row).eq(10).append($("<button type='button' class='btn btn-danger' onclick = 'deleteMember("+data.member_id+")'><i class='bi bi-trash'></i></button></td>"));
                
            
            },
            
            //step4:圖片
            "columnDefs":
                [{
                    "targets": 8, //第幾個欄位從0開始
                    "data": 'member_photo', //對你欄位名稱
                    "render": function (data, type) {
                        return '<img src="' + data + '" alt="' + data + '"height="50" width="50"/>';
                    }
                },{
                    "targets": [2],//要減少字數的欄位
                    
                    "render": function (data, type, full, meta) {
                     console.log('data',data)
                        if (data) {
                            if (data.length > 1) {
                                return data.substr(0,3) + "...";
                            }else{
                                return data;
                            }
                        }else {
                                return "";
                        }
                    }
                 
                }],
        });
    }
	
	function add(){
			     		
	     		$("#member_id").prop("disabled",false);
     			$("#member_photo").prop("disabled",false);
	     		
	     		var formData = new FormData($("#formdata_add")[0]);
	     		
		     	datatableFetch();
	     	 
	     	 $.ajax({
	     		 type:'post',
	     		 url:'/backend/member/add',
	     		 data:formData,
	     		 async:false,
	     		 cache:false,
	     		 contentType:false,
     		 	 processData:false,
	     		 success: function(){
// 	     			 alert("");
	     			 Swal.fire("新增成功");
	     			datatableFetch();
	     			 reset();
	     		 },
	     		 error: function(){
// 	     			 alert("")
	     			 Swal.fire("新增失敗");
	     		 }
	     	 })

	}

	function update(){
		
	      var statusSuccess="";
	      var statusError="";

	      member_id = $('#member_id_edit').val();
	     	
		  $("#member_id_edit").prop("disabled",false);
		  $("#member_photo_edit").prop("disabled",false);
	     		 
	     var formData = new FormData($("#formdata_edit")[0]);
	     console.log(member_id);
	     //update
	     			     	
		 datatableFetch();
	     		
	        $.ajax({
	     		 type:'post',
	     		 url:'/backend/member/update/',
	     		 data:formData,
	     		 async:false,
	     		 cache:false,
	     		 contentType:false,
   		 	 processData:false,
	     		 success: function(){
// 	     			 alert("");
	     			 Swal.fire("修改成功");
	     			datatableFetch();
	     			 reset();
	     		 },
	     		 error: function(){
// 	     			 alert("")
	     			Swal.fire("修改失敗");
	     		 }
	     	 })
	}
	

	function upd(member_id){
		$.ajax({
			url:'/backend/member/query/' + member_id,
			method:'post',
			dataType:'JSON',
			contentType:'application/json',
			success: function (data){
				console.log(data.member_id);
				console.log("==================");
				var json = JSON.stringify(data, null, 4);
				console.log(json);
				var member = JSON.parse(json);
				console.log(member.member_id);
				$('#member_id_edit').val(member.member_id);
				$('#member_name_edit').val(member.member_name);
				$('#member_password_edit').val(member.member_password);
				$('#member_gender_edit').val(member.member_gender);
				$('#member_email_edit').val(member.member_email);
				$('#member_phone_edit').val(member.member_phone);
				$('#member_address_edit').val(member.member_address);
				$('#member_birthday_edit').val(member.member_birthday);
				$('#member_photo_edit').val(member.member_photo);
				$("#image_edit").attr("src",member.member_photo);
			},     
			error: function (){
// 				alert("");
				Swal.fire("修改失敗");
			}

			
		});
	}	
	
	function deleteMember(member_id){
		//------------------------------ 
        Swal.fire({
            title: "操作確認",
            icon: 'warning',
            text: "您確定要刪除嗎?!",
            showCancelButton: true}).then(function(result) {
           if (result.value) {
            Swal.fire({icon: 'success',
                title: '會員已經刪除',
                 showConfirmButton: false,
                 timer: 1500});
        //-------------------------------
		$.ajax({
            url: '/backend/member/delete/' + member_id,
            type: 'POST',
            success: function () {
//                 alert('刪除成功');	
                datatableFetch();
            },
            error: function (error) {
//                 alert('');
                Swal.fire("刪除失敗");
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
		$('#member_id').val('');
		$('#member_name').val('');
		$('#member_password ').val('');
		$('#member_gender ').val('');
		$('#member_email ').val('');
		$('#member_phone ').val('');
		$('#member_address ').val('');
		$('#member_birthday ').val('');
		$('#member_photo ').val('');
	}
	
	function loadImageFile_add(event){ 
	        var image = document.getElementById('image_add'); 
	        image.style.display = 'block';
	        image.src = URL.createObjectURL(event.target.files[0]); 
	};
	function loadImageFile_edit(event){ 
	        var image = document.getElementById('image_edit'); 
	        image.src = URL.createObjectURL(event.target.files[0]); 
	};
	
function keyinAll(){
		
		$('#member_id').val('');
		$('#member_name').val('ohtani');
		$('#member_password').val('123');
		$('#member_gender').val('男');
		$('#member_email').val('10@gmail.com');
		$('#member_phone').val('0906900818');
		$('#member_address').val('桃園市中壢區中大路300號');
		$('#member_birthday').val('1980-03-31');
		$('#member_photo').val('/member/1.jpg');
		
		
// 		$('textarea[name=product_descrip]').val("8");
// 		CKEDITOR.instances.product_descrip.updateElement();
		//$('#product_descrip').val('8');
		
	}
	//step5.確認有沒有code有打錯的~~
	
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
								href="javascript:void(0)">會員管理</a></li>
						</ol>
					</div>
				</div>
				<!-- row -->


				<div class="row">
					<div class="col-12">
						<div class="card">
							<div class="card-header">
								<h6 class="card-title">所有會員列表</h6>

<!-- 								<a href="#addMemberModal" class="btn btn-success" -->
<!-- 									data-toggle="modal" ><i class="material-icons">&#xE147;</i> <span>新增</span></a> -->
									
<!-- 							<a href="#addMemberModal"  class="btn btn-success" data-toggle="modal"><i -->
<!-- 									class="bi bi-plus-square"></i> <span>新增會員</span></a> -->
							    <a href="/backend/member/exportpdf"  class="btn btn-success" style="position:absolute;right:290px;"
									 > <span>匯出pdf</span></a>		
							    <a href="/backend/member/exportexcel"  class="btn btn-success" style="position:absolute;right:150px;"
									 > <span>匯出excel</span></a>		
								<a href="#addMemberModal"  class="btn btn-success"
					                data-toggle="modal" ><span>新增會員</span></a>						

							</div>
							<div class="card-body">
								<div class="table-responsive">
									<table id="example" class="display" style="min-width: 845px">
										<thead>
											<tr>
												<th>會員編號</th>
												<th>會員帳號</th>
												<th>會員密碼</th>
												<th>會員性別</th>
												<th>會員信箱</th>
												<th>會員電話</th>
												<th>會員地址</th>
												<th>會員生日</th>
												<th>會員照片</th>
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
	<div id="addMemberModal" class="modal fade">
		<div class="modal-dialog">
			<div class="modal-content">
				<form id="formdata_add">
					<div class="modal-header">
						<h4 class="modal-title" style="align:center">新增會員</h4>
						<input type="button" onclick="keyinAll()" value="一鍵輸入">
						<button type="button" class="close" data-dismiss="modal"
							aria-hidden="true">&times;</button>
					</div>
					<div class="modal-body">
						<div class="form-group">
							<label>會員編號</label><input  id="member_id" name="member_id" type="text" disabled >
						</div>
						<div class="form-group">
							<label>會員帳號</label> <input name="member_name" id="member_name" type="text" class="form-control"
								 required>
						</div>
						<div class="form-group">
							<label>會員密碼</label> <input name="member_password" id="member_password" type="password" class="form-control"
								 required>
						</div>
						<div class="form-group">
							<label>會員性別</label> <select class="form-control form-control-sm"
								name="member_gender" id="member_gender" required>
								<option value=""></option>
								<option value="男">男</option>
								<option value="女">女</option>
							
							</select>
						</div>
						<div class="form-group">
							<label>會員信箱</label> <input name="member_email" id="member_email" type="text" class="form-control"
								 required>
						</div>
						<div class="form-group">
							<label>會員電話</label> <input name="member_phone" id="member_phone" type="text" class="form-control"
								 required>
						</div>
						<div class="form-group">
							<label>會員地址</label> <input name="member_address" id="member_address" type="text" class="form-control"
								 required>
						</div>
						<div class="form-group">
							<label>會員生日</label> <input name="member_birthday" id="member_birthday" type="date" class="form-control"
								 required>
						</div>
						<div class="form-group">
							<label>會員照片</label><br><img id="image_add" alt="尚未選擇圖片" src="" style="height:100%;width:300px;display:none"> <input name="member_photo" id="member_photo" type="hidden" class="form-control"
								 required disabled >
						</div>
						<div class="form-group">
							<label>檔案</label> <input name="file" id="file" type="file" class="form-control" required onchange="loadImageFile_add(event)">
						</div>
						
					</div>
					<div class="modal-footer">
						<input id="AddMemberBtn" type="button" onclick="add()" class="btn btn-success" value="新增" data-dismiss="modal">
						<input type="button" class="btn btn-default" data-dismiss="modal"
							value="取消"> 
					</div>
				</form>
			</div>
		</div>
	</div>
	
	

<!-- step7 編輯的表單		 -->
		
<div id="editMemberModal" class="modal fade">
		<div class="modal-dialog">
			<div class="modal-content">
				<form id="formdata_edit">
					<div class="modal-header">
						<h4 class="modal-title" style="align:center">修改會員</h4>
						<button type="button" class="close" data-dismiss="modal"
							aria-hidden="true">&times;</button>
					</div>
					<div class="modal-body">
						<div class="form-group">
							<label>會員編號</label><input  id="member_id_edit" name="member_id_edit" type="text" disabled>
						</div>
						<div class="form-group">
							<label>會員帳號</label> <input name="member_name_edit" id="member_name_edit" type="text" class="form-control"
								 required>
						</div>
						<div class="form-group">
							<label>會員密碼</label> <input name="member_password_edit" id="member_password_edit" type="password" class="form-control"
								 required>
						</div>
						<div class="form-group">
							<label>會員性別</label> <select class="form-control form-control-sm"
								name="member_gender_edit" id="member_gender_edit" required>
								<option value=""></option>
								<option value="男">男</option>
								<option value="女">女</option>
							
							</select>
						</div>
						<div class="form-group">
							<label>會員信箱</label> <input name="member_email_edit" id="member_email_edit" type="text" class="form-control"
								 required>
						</div>
						<div class="form-group">
							<label>會員電話</label> <input name="member_phone_edit" id="member_phone_edit" type="text" class="form-control"
								 required>
						</div>
						<div class="form-group">
							<label>會員地址</label> <input name="member_address_edit" id="member_address_edit" type="text" class="form-control"
								 required>
						</div>
						<div class="form-group">
							<label>會員生日</label> <input name="member_birthday_edit" id="member_birthday_edit" type="date" class="form-control"
								 required>
						</div>
						<div class="form-group">
							<label>會員照片</label><br><img id="image_edit" alt="尚未選擇圖片" src="" style="height:100%;width:300px"> <input name="member_photo_edit" id="member_photo_edit" type="hidden" class="form-control"
								 required disabled >
						</div>
						<div class="form-group">
							<label>檔案</label> <input name="file_edit" id="file_edit" type="file" class="form-control" required onchange="loadImageFile_edit(event)">
						</div>
					</div>
					<div class="modal-footer">
						<input id="editMemberBtn" type="button" onclick="update()" class="btn btn-success" value="確認" data-dismiss="modal">
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

		
	//$('#example').DataTable();
		
	</script>
	
	

</body>

</html>