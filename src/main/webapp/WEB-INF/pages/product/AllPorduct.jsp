<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width,initial-scale=1">

<title>商品管理</title>
<link rel="icon" href="/images/logo.ico" type="image/x-icon">
<!-- Datatable -->
<link href="/vendor/datatables/css/jquery.dataTables.min.css"
	rel="stylesheet">
<!-- Custom Stylesheet -->
<link href="/css/style.css" rel="stylesheet">


<link rel="stylesheet" type="text/css"
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css">

<link rel="stylesheet" type="text/css"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css">
	

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>

<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
	
<script type="text/javascript">

	$(document).ready(function(){
		datatableFetch();
	});
	
	function datatableFetch() {
        $('#example').DataTable({
            destroy: true,
            "ajax": {
                "url": "/backend/product/all",
                "type": "POST",
                dataSrc: ''
            },
            "columns": [
                {"data": "product_id"},
                {"data": "product_name"},
                {"data": "product_type"},
                {"data": "product_color"},
                {"data": "product_price"},
                {"data": "product_size",  orderable : false,},
                {"data": "product_quantity"},
                {"data": "product_picture",  orderable : false,},
                {"data": "product_descrip",  orderable : false,},
                {"data": "product_updatetime"},
                {"data": null, defaultContent: "",  orderable : false,},
                {"data": null, defaultContent: "",  orderable : false,},
            ],
            
            "createdRow": function (row, data, index) {
//                 $('td', row).eq(10).append($('<a href="#editProductModal" data-toggle="modal" onclick="upd(' + data.product_id + ')" >修改</a>'));
//                 $('td', row).eq(11).append($('<button onclick = " deleteProduct(' + data.product_id + ')">刪除</button>'));
                $('td', row).eq(8).append($('<a href="#showProductModal" data-toggle="modal" onclick="show(' + data.product_id + ')" style="text-decoration:none;color:black;">...</a>'));
                $('td', row).eq(10).append($("<a href='#editProductModal'data-toggle='modal' class='btn btn-warning' onclick='upd("+data.product_id +")' ><i class='bi bi-pencil-square'></i></a>"));
                $('td', row).eq(11).append($("<button type='button' class='btn btn-danger' onclick = 'deleteProduct("+ data.product_id+")'><i class='bi bi-trash'></i></button></td>"));
            },
            "columnDefs":
            	[{
                	//圖片
                    "targets": 7,
                    "data": 'product_picture',
                    "render": function (data, type) {
                        return '<img src="' + data + '" alt="' + data + '"height="50" width="50"/>';
                    }
                },
                {
                	//要減少字數的欄位
                	"targets": [8],
                	"data": 'product_descrip',
  	                  "render": function (data, type, full, meta) {
  	                   //console.log('data',data)
  	                   console.log('data',product_id)
  	                      if (data) {
  	                          if (data.length > 1) {
  	                            //return data.substr(39,43);
  	                            return data.substr(4,16);
  	                            console.log(data.product_id)
  	                          }else{
  	                              return data;
  	                          }
  	                      }else {
  	                              return "";
  	                      }
  	                  }
                  
  	              },
  	              ],
        });
    }
	
	function add(){
	
		$("#product_id").prop("disabled", false);
		$("#product_picture").prop("disabled", false);
		
		$('textarea[name=product_descrip]').val();
	    CKEDITOR.instances.product_descrip.updateElement();

		var formData = new FormData($("#formdata_add")[0]);

		datatableFetch();
// 		dynamicURL = '/backend/product/add';
// 		TypeName = 'post';
// 		statusSuccess = "新增成功";
// 		statusError = "新增失敗";

		$.ajax({
			type : 'post',
			url : '/backend/product/add',
			data : formData,
			async : false,
			cache : false,
			contentType : false,
			processData : false,
			success : function() {
				alert("新增成功");
				datatableFetch();
				reset();
			},
			error : function() {
				alert("新增失敗")
			}
		})

	}

	
	function update() {
		
		$('textarea[name=product_descrip_edit]').val();
	    CKEDITOR.instances.product_descrip_edit.updateElement();

		product_id = $('#product_id_edit').val();

		$("#product_id_edit").prop("disabled", false);
		$("#product_picture_edit").prop("disabled", false);

		var formData = new FormData($("#formdata_edit")[0]);
		console.log(product_id);

// 		dynamicURL = '/backend/product/update/' + product_id;
// 		TypeName = 'post';
// 		statusSuccess = "修改成功";
// 		statusError = "修改失敗";

		datatableFetch();

		$.ajax({
			type : 'post',
			url : '/backend/product/update/' + product_id,
			data : formData,
			async : false,
			cache : false,
			contentType : false,
			processData : false,
			success : function() {
				alert("修改成功");
				datatableFetch();
				reset();
			},
			error : function() {
				alert("修改失敗")
			}
		})

	}

	function upd(product_id) {
		$.ajax({
			url : '/backend/product/findById/' + product_id,
			method : 'post',
			dataType : 'JSON',
			contentType : 'application/json',
			success : function(data) {
				console.log(data.product_id);
				console.log("==================");
				var json = JSON.stringify(data, null, 4);
				console.log(json);
				var product = JSON.parse(json);
				console.log(product.product_id);
				$('#product_id_edit').val(product.product_id);
				$('#product_name_edit').val(product.product_name);
				$('#product_type_edit').val(product.product_type);
				$('#product_color_edit').val(product.product_color);
				$('#product_price_edit').val(product.product_price);
				$('#product_size_edit').val(product.product_size);
				$('#product_quantity_edit').val(product.product_quantity);
				$('#product_picture_edit').val(product.product_picture);
				$("#image_edit").attr("src",product.product_picture);
				$('#product_descrip_edit').val(product.product_descrip);
				CKEDITOR.instances.product_descrip_edit.setData(product.product_descrip);
			},
			error : function() {
				alert("修改失敗");
			}

		});
	}

// 	function deleteProduct(product_id) {
// 		$.ajax({
// 			url : '/backend/product/delete/' + product_id,
// 			type : 'POST',
// 			success : function() {
// 				alert('刪除成功');
// 				datatableFetch();
// 			},
// 			error : function(error) {
// 				alert('刪除失敗');
// 			}
// 		})
// 	}
	
	//------------------------------ 
	 function deleteProduct(product_id) {
	//------------------------------ 
	        Swal.fire({
	            title: "操作確認",
	            icon: 'warning',
	            text: "您確定要刪除嗎?!",
	            showCancelButton: true}).then(function(result) {
	           if (result.value) {
	            Swal.fire({icon: 'success',
	                title: '商品已經刪除',
	                 showConfirmButton: false,
	                 timer: 1500});
	 //-------------------------------           
	            $.ajax({
           url: '/backend/product/delete/' + product_id,
           type: 'POST',
           success: function () {
               //alert('刪除成功');	
               datatableFetch();
           },
           error: function (error) {
               alert('刪除失敗');
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

	function show(product_id){
		$.ajax({
			url:'/backend/product/findById/' + product_id,
			method:'post',
			dataType:'JSON',
			contentType:'application/json',
			success: function (data){
				console.log(data.product_id);
				console.log("==================");
				var json = JSON.stringify(data, null, 4);
				console.log(json);
				var product = JSON.parse(json);
				console.log(product.product_id);
				$('#product_id_show').val(product.product_id);
				$('#product_name_show').val(product.product_name);
				$('#product_type_show').val(product.product_type);
				$('#product_color_show').val(product.product_color);
				$('#product_price_show').val(product.product_price);
				$('#product_size_show').val(product.product_size);
				$('#product_quantity_show').val(product.product_quantity);
				$('#product_picture_show').val(product.product_picture);
				CKEDITOR.instances.product_descrip_show.setData(product.product_descrip);
			},     
			error: function (){
				alert("查詢失敗");
			}

			
		});
	}	
	
	
	function reset() {
		$('#product_id').val('');
		$('#product_name').val('');
		$('#product_type').val('');
		$('#product_color').val('');
		$('#product_price').val('');
		$('#product_size').val('');
		$('#product_quantity').val('');
		$('#product_picture').val('');
		$('#product_descrip').val('');
		$('#image_add').val('');
	}
	
	//一鍵登入
	function keyinAll(){
		
		$('#product_id').val('');
		$('#product_name').val('高腳椅');
		$('#product_type').val('桌椅系列');
		$('#product_color').val('咖啡色');
		$('#product_price').val('1200');
		$('#product_size').val('寬60/高100');
		$('#product_quantity').val('5');
		$('#product_picture').val('/product-page-24.jpg');
		CKEDITOR.instances.product_descrip.setData('<h1 style="text-align:center;"><strong>高腳椅</strong><img alt="" src="/product-page-22.jpg" style="height:600px; width:1280px" /></h1><p style="text-align:center;">優勢在於簡潔的線條，</p><p style="text-align:center;">錐形腿的椅腳完美地與膠合板座椅相連，</p><p style="text-align:center;">無需增加任何支撐零件，</p><p style="text-align:center;">環繞式壓鑄鋁製腳凳，帶給您穩固的安全感。</p>');
		
	}
	
	//圖片顯示
	function loadImageFile_add(event){ 
		var image = document.getElementById('image_add'); 
		image.style.display = 'block';
		image.src = URL.createObjectURL(event.target.files[0]); 
	};
	function loadImageFile_edit(event){ 
		var image = document.getElementById('image_edit'); 
		image.src = URL.createObjectURL(event.target.files[0]); 
	};
	
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
							
							
							
<!-- 							step3. ****************改名稱 -->
						</div>
					</div>
					<div
						class="col-sm-6 p-md-0 justify-content-sm-end mt-2 mt-sm-0 d-flex">
						<ol class="breadcrumb">
							<li class="breadcrumb-item"><a href="javascript:void(0)">首頁</a></li>
							<li class="breadcrumb-item active"><a
								href="javascript:void(0)">商品管理</a></li>
						</ol>
					</div>
				</div>
				<!-- row -->


				<div class="row">
					<div class="col-12">
						<div class="card">
							<div class="card-header">
								<h6 class="card-title">所有商品列表</h6>
								
								
<!-- 								step4.**********注意路徑 -->
<!-- 								<a href="#addProductModal" class="btn btn-success" -->
<!-- 									data-toggle="modal" ><i class="material-icons">&#xE147;</i> <span>新增</span></a> -->
								<a href="#addProductModal"  class="btn btn-success" data-toggle="modal"><i
									class="bi bi-plus-square"></i> <span>新增商品</span></a>				
									
									
							</div>
							<div class="card-body">
								<div class="table-responsive">
									<table id="example" class="display" style="min-width: 845px">
										<thead>
											<tr>
												<th style="width:20px">ID</th>
												<th style="width:80px">商品名稱</th>
												<th style="width:70px">商品類型</th>
												<th style="width:50px">顏色</th>
												<th style="width:50px">價錢</th>
												<th style="width:80px">尺寸</th>
												<th style="width:50px">數量</th>
												<th style="width:50px">圖片</th>
												<th style="width:100px">商品描述</th>
												<th style="width:80px">修改時間</th>
												<th style="width:30px">修改</th>
												<th style="width:30px">刪除</th>
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
		
		
		<div id="addProductModal" class="modal fade">
		<div class="modal-dialog">
			<div class="modal-content" style="right:200px;width:900px">
				<form id="formdata_add">
					<div class="modal-header">
						<h4 class="modal-title" style="align:center">新增商品</h4>
						<input type="button" onclick="keyinAll()" value="一鍵輸入">
						<button type="button" class="close" data-dismiss="modal"
							aria-hidden="true">&times;</button>
					</div>
					<div class="modal-body">
						<div class="form-group">
							<label>ID</label> <input name="product_id" id="product_id" class="form-control" disabled>
						</div>
						<div class="form-group">
							<label>商品名稱<em>*</em><span id="check1"></span></label> 
							<input name="product_name" id="product_name" type="text" class="form-control" required>
						</div>
						<div class="form-group">
							<label>類型<em>*</em><span id="check2"></span></label> 
							<select class="form-control form-control-sm"
								name="product_type" id="product_type" required>
								<option value=""></option>
								<option value="桌椅系列">桌椅系列</option>
								<option value="沙發系列">沙發系列</option>
								<option value="床架系列">床架系列</option>
								<option value="收納系列">收納系列</option>
								<option value="相關商品">相關商品</option>
							</select>
						</div>
						<div class="form-group">
							<label>顏色<em>*</em><span id="check3"></span></label> 
							<select class="form-control form-control-sm"
								name="product_color" id="product_color" required>
								<option value=""></option>
								<option value="黑色">黑色</option>
								<option value="白色">白色</option>
								<option value="咖啡色">咖啡色</option>
								<option value="灰色">灰色</option>
								<option value="紅色">紅色</option>
							</select>
						</div>
						<div class="form-group">
							<label>價錢<em>*</em><span id="check4"></span></label> 
							<input name="product_price"  id="product_price" type="text" class="form-control"  required>
						</div>
						<div class="form-group">
							<label>尺寸<em>*</em><span id="check5"></span></label> 
							<input name="product_size" id="product_size" type="text" class="form-control"  required>
						</div>
						<div class="form-group">
							<label>數量<em>*</em><span id="check6"></span></label> 
							<input name="product_quantity" id="product_quantity" type="text" class="form-control" required>
						</div>
<!-- 						<div class="form-group"> -->
<!-- 							<label>商品圖片</label> <input type="text"  id="product_picture" name="product_picture" disabled> -->
<!-- 						</div> -->
						<div class="form-group">
							<img id="image_add" alt=" " src="" style="height:200px; width:200px;display:none">
							 <input type="hidden"  id="product_picture" name="product_picture"  disabled>
						</div>
						<div class="form-group">
							<label>請選擇檔案</label> 
							<input type="file" id="file" name="file" onchange="loadImageFile_add(event)">
						</div>
						<div class="form-group">
							<label>詳細說明<em>*</em><span id="check8"></span></label>
							<textarea  class="form-control" name="product_descrip" id="product_descrip" required>
							
							</textarea>
						</div>				
					</div>
					<div class="modal-footer">
						<input id="AddProductBtn" type="button" onclick="add()" class="btn btn-success" value="新增" data-dismiss="modal">
						<input type="button" class="btn btn-default" data-dismiss="modal"
							value="取消"> 
					</div>
				</form>
			</div>
		</div>
	</div>
	
	<div id="editProductModal" class="modal fade">
		<div class="modal-dialog">
			<div class="modal-content" style="right:200px;width:900px">
				<form id="formdata_edit">
					<div class="modal-header">
						<h4 class="modal-title" style="align:center">修改商品</h4>
						<button type="button" class="close" data-dismiss="modal"
							aria-hidden="true">&times;</button>
					</div>
					<div class="modal-body">
						<div class="form-group">
							<label>ID</label> <input name="product_id_edit" id="product_id_edit" type="text" class="form-control" disabled>
						</div>
						<div class="form-group">
							<label>商品名稱</label> <input name="product_name_edit" id="product_name_edit" type="text" class="form-control"
								required>
						</div>
						<div class="form-group">
							<label>類型</label> <select class="form-control form-control-sm"
								name="product_type_edit" id="product_type_edit" required>
								<option value=""></option>
								<option value="桌椅系列">桌椅系列</option>
								<option value="沙發系列">沙發系列</option>
								<option value="床架系列">床架系列</option>
								<option value="收納系列">收納系列</option>
								<option value="相關商品">相關商品</option>
							</select>
						</div>
						<div class="form-group">
							<label>顏色</label> <select class="form-control form-control-sm"
								name="product_color_edit" id="product_color_edit" required>
								<option value=""></option>
								<option value="黑色">黑色</option>
								<option value="白色">白色</option>
								<option value="咖啡色">咖啡色</option>
								<option value="灰色">灰色</option>
								<option value="紅色">紅色</option>
							</select>
						</div>
						<div class="form-group">
							<label>價錢</label> <input name="product_price_edit"  id="product_price_edit" type="text" class="form-control" required>
						</div>
						<div class="form-group">
							<label>尺寸</label> <input name="product_size_edit" id="product_size_edit" type="text" class="form-control" required>
						</div>
						<div class="form-group">
							<label>數量</label> <input name="product_quantity_edit" id="product_quantity_edit" type="text" class="form-control" required>
						</div>
<!-- 						<div class="form-group"> -->
<!-- 							<label>商品圖片</label> <input type="text"  id="product_picture_edit" name="product_picture_edit" disabled> -->
<!-- 						</div> -->
						<div class="form-group">
							<img id="image_edit" alt="尚未選擇圖片" src="" style="height:200px; width:200px">
							 <input type="hidden"  id="product_picture_edit" name="product_picture_edit"  disabled>
						</div>
						<div class="form-group">
							<label>請選擇檔案</label> <input type="file" id="file_edit" name="file_edit" onchange="loadImageFile_edit(event)">
						</div>
						<div class="form-group">
							<label>詳細說明</label>
							<textarea  class="form-control" name="product_descrip_edit" id="product_descrip_edit" required></textarea>
						</div>				
					</div>
					<div class="modal-footer">
						<input id="editProductBtn" type="button" onclick="update()" class="btn btn-success" value="確認" data-dismiss="modal">
						<input type="button" class="btn btn-default" data-dismiss="modal"
							value="取消"> 
					</div>
				</form>
			</div>
		</div>
	</div>
	
	
	<div id="showProductModal" class="modal fade">
		<div class="modal-dialog">
			<div class="modal-content" style="right:200px;width:900px;">
				<form id="formdata_edit">
					<div class="modal-header">
						<h4 class="modal-title" style="align:center">詳細資料</h4>
						<button type="button" class="close" data-dismiss="modal"
							aria-hidden="true">&times;</button>
					</div>
					<div class="modal-body">
						<div class="form-group">
							<input type="hidden" name="product_id_show" id="product_id_show" type="text" class="form-control" disabled>
						</div>
						<div class="form-group">
							<label>商品名稱</label> <input name="product_name_show" id="product_name_show" type="text" class="form-control"
								readonly>
						</div>
						<div class="form-group">
							<label>詳細說明</label>
							<textarea  class="form-control" name="product_descrip_show" id="product_descrip_show" readonly></textarea>
						</div>				
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
	
	<script src="https://cdn.ckeditor.com/4.7.3/standard-all/ckeditor.js"></script>
	<script>
		CKEDITOR.plugins
				.addExternal(
						"codesnippet",
						"https://cdnjs.cloudflare.com/ajax/libs/ckeditor/4.7.3/plugins/codesnippet/plugin.js",
						"");
		CKEDITOR.replace("product_descrip", {
			extraPlugins : "codesnippet",
			codeSnippet_theme : "solarized_dark"
		});
	</script>
	<script>
		CKEDITOR.plugins
				.addExternal(
						"codesnippet",
						"https://cdnjs.cloudflare.com/ajax/libs/ckeditor/4.7.3/plugins/codesnippet/plugin.js",
						"");
		CKEDITOR.replace("product_descrip_edit", {
			extraPlugins : "codesnippet",
			codeSnippet_theme : "solarized_dark"
		});
	</script>
	<script>
		CKEDITOR.plugins
				.addExternal(
						"codesnippet",
						"https://cdnjs.cloudflare.com/ajax/libs/ckeditor/4.7.3/plugins/codesnippet/plugin.js",
						"");
		CKEDITOR.replace("product_descrip_show", {
			extraPlugins : "codesnippet",
			codeSnippet_theme : "solarized_dark"
		});
	</script>
	
	<script src="/vendor/global/global.min.js"></script>
	<script src="/js/quixnav-init.js"></script>
	<script src="/js/custom.min.js"></script>

	<script src="https://cdn.jsdelivr.net/npm/sweetalert2@9"></script> 

 	<script src="/cdn.jsdelivr.net/npm/sweetalert2@11"></script> 
	<!--<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>-->

	<!-- Datatable -->
	<script src="/vendor/datatables/js/jquery.dataTables.min.js"></script>
	<script src="/js/plugins-init/datatables.init.js"></script>
	<script>
	document.getElementById("product_name").onblur=checkName;
    function checkName(){
        //取得物件
        let nameObj = document.getElementById("product_name");
        //取得物件值
        let nameObjVal = nameObj.value;
        //取得錯誤訊息物件
        let ne = document.getElementById("check1");
        //取得值的長度
        let nameObjValLen = nameObjVal.length;

        //判斷
        if(nameObjVal==""){
            ne.innerHTML="<img class='error' src='/image/error.png'>請勿空白";
        }else
            ne.innerHTML="<img class='right' src='/image/check.png'>"; 
    }
    
    document.getElementById("product_type").onblur=checkType;
    function checkType(){
        //取得物件
        let typeObj = document.getElementById("product_type");
        //取得物件值
        let typeObjVal = typeObj.value;
        //取得錯誤訊息物件
        let ne = document.getElementById("check2");
        //取得值的長度
        let typeObjValLen = typeObjVal.length;

        //判斷
        if(typeObjVal==""){
            ne.innerHTML="<img class='error' src='/image/error.png'>請選擇類型";
        }else
            ne.innerHTML="<img class='right' src='/image/check.png'>"; 
    }
    
    document.getElementById("product_color").onblur=checkColor;
    function checkColor(){
        //取得物件
        let colorObj = document.getElementById("product_color");
        //取得物件值
        let colorObjVal = colorObj.value;
        //取得錯誤訊息物件
        let ne = document.getElementById("check3");
        //取得值的長度
        let colorObjValLen = colorObjVal.length;

        //判斷
        if(typeObjVal==""){
            ne.innerHTML="<img class='error' src='/image/error.png'>請選擇類型";
        }else
            ne.innerHTML="<img class='right' src='/image/check.png'>"; 
    }
    
    document.getElementById("product_price").onblur=checkPrice;
    function checkPrice(){
        //取得物件
        let priceObj = document.getElementById("product_price");
        //取得物件值
        let priceObjVal = priceObj.value;
        //取得錯誤訊息物件
        let ne = document.getElementById("check4");
        //取得值的長度
        let priceObjValLen = priceObjVal.length;

        //判斷
        if(priceObjVal==""){
            ne.innerHTML="<img class='error' src='/image/error.png'>請勿空白";
        }else if (! (priceObjVal>="0" && priceObjVal<="9")){
       	 ne.innerHTML="<img class='error' src='/image/error.png'>只能輸入數字";
        }
        else
            ne.innerHTML="<img class='right' src='/image/check.png'>"; 
    }
    
    document.getElementById("product_size").onblur=checkSize;
    function checkSize(){
        //取得物件
        let sizeObj = document.getElementById("product_size");
        //取得物件值
        let sizeObjVal = sizeObj.value;
        //取得錯誤訊息物件
        let ne = document.getElementById("check5");
        //取得值的長度
        let sizeObjValLen = sizeObjVal.length;

        //判斷
        if(sizeObjVal==""){
            ne.innerHTML="<img class='error' src='/image/error.png'>請勿空白";
        }else
            ne.innerHTML="<img class='right' src='/image/check.png'>輸入正確"; 
    }
    
    document.getElementById("product_quantity").onblur=checkQquantity;
    function checkQquantity(){
        //取得物件
        let quantityObj = document.getElementById("product_quantity");
        //取得物件值
        let quantityObjVal = quantityObj.value;
        //取得錯誤訊息物件
        let ne = document.getElementById("check6");
        //取得值的長度
        let quantityObjValLen = quantityObjVal.length;

        //判斷
        if(quantityObjVal==""){
            ne.innerHTML="<img class='error' src='/image/error.png'>請勿空白";
        }else if (! (quantityObjVal>="0" && quantityObjVal<="9")){
       	 ne.innerHTML="<img class='error' src='/image/error.png'>只能輸入數字";
        }
        else
            ne.innerHTML="<img class='right' src='/image/check.png'>輸入正確"; 
    }
    
    document.getElementById("product_descrip").onblur=checkDescrip;
    function checkDescrip(){
        //取得物件
        let descripObj = document.getElementById("product_descrip");
        //取得物件值
        let descripObjVal = descripObj.value;
        //取得錯誤訊息物件
        let ne = document.getElementById("check8");
        //取得值的長度
        let descripObjValLen = descripObjVal.length;

        //判斷
        if(descripObjVal==""){
            ne.innerHTML="<img class='error' src='/image/error.png'>請勿空白";
        }else
            ne.innerHTML="<img class='right' src='/image/check.png'>輸入正確";
    }
    
    document.getElementById("product_picture").onblur=checkImg;
    function checkImg(){
        //取得物件
        let imgObj = document.getElementById("product_picture");
        //取得物件值
        let imgObjVal = imgObj.value;
        //取得錯誤訊息物件
        let ne = document.getElementById("check7");
        //取得值的長度
        let imgObjValLen = imgObjVal.length;

        //判斷
        if(colorObjVal==""){
            ne.innerHTML="<img class='error' src='/image/error.png'>請勿空白";
        }else
            ne.innerHTML="<img class='right' src='/image/check.png'>輸入正確";
    }

// 		$(function(){
// 			$('#example').DataTable( {
// 		    	"language":{
// 					"zeroRecords":"沒有符合的結果",
// 					"info":"顯示第 _START_ 至 _END_ 項結果，共 _TOTAL_ 項",
// 					"infoEmpty":"顯示第 0 至 0 項結果，共 0 項",
// 					"infoFiltered":"(從 _MAX_ 項結果中過濾)",
// 					"infoPostFix":"",
// 					"search":"搜尋:",
// 					"lengthMenu": "顯示 _MENU_ 項結果",
// 					"paginate":{
// 						"previous":"上一頁",
// 						"next":"下一頁",
// 					}	
// 		    	},
// 				"destroy":true,
				
// 			} );
			
// 		})
	</script>
	
	

</body>

</html>