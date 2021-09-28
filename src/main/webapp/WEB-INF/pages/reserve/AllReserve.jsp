<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html lang="zh-Hant-TW">

<head>
<link rel="icon" href="/images/logo.ico" type="image/x-icon">
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width,initial-scale=1">

<!-- **************step1.改你的管理名稱 -->
<title>預約管理</title>


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

$(document).ready(function(){
	datatableFetch();
});

function datatableFetch() {
    $('#example').DataTable({
        destroy: true,
        "ajax": {
            "url": 'http://localhost:8080/backend/reserve/all',
            "type": "POST",
            dataSrc: ''
        },
        "columns": [
            {"data": "reserve_id"},
            {"data": "reserve_memberid.member_id"},
            {"data": "reserve_Date"},
            {"data": "reserve_branch"},
            {"data": "reserve_style"},
            {"data": "reserve_q1"},
            {"data": "reserve_q2"},
            {"data": "reserve_q3"},
            {"data": "reserve_q4"},
            {"data": "reserve_q5"},
            {"data": null, defaultContent: "",  orderable : false,},
            {"data": null, defaultContent: "",  orderable : false,},
        ],
        "createdRow": function (row, data, index) {
            $('td', row).eq(10).append($("<a href='#editProductModal'data-toggle='modal' class='btn btn-warning' onclick='upd("+data.reserve_id+")' ><i class='bi bi-pencil-square'></i></a>"));
            $('td', row).eq(11).append($("<button type='button' class='btn btn-danger' onclick = 'del("+data.reserve_id+")'><i class='bi bi-trash'></i></button></td>"));
        }
    });
}



	function add() {
		var reserve = {};
		var dynamicURL = "";
		var TypeName = "";
		var statusSuccess = "";
		var statusError = "";

		//reserve.reserve_id=$('#reserve_id_edit').val();

		//save
		dynamicURL = '/backend/reserve/add';
		TypeName = 'post';
		statusSuccess = "新增成功";
		statusError = "新增失敗";
		
		reserve.reserve_memberid={};
		reserve.reserve_memberid.member_id = $('#reserve_memberid').val();
		reserve.reserve_Date = $('#reserve_Date').val();
		reserve.reserve_branch = $('#reserve_branch').val();
		reserve.reserve_style = $('#reserve_style').val();
		reserve.reserve_q1 = $("input:radio[name=reserve_q1]:checked").val();
		reserve.reserve_q2 = $("input:radio[name=reserve_q2]:checked").val();
		reserve.reserve_q3 = $("input:radio[name=reserve_q3]:checked").val();
		reserve.reserve_q4 = $("input:radio[name=reserve_q4]:checked").val();
		reserve.reserve_q5 = $("input:radio[name=reserve_q5]:checked").val();

		//datatableFetch();

		var reserveObj = JSON.stringify(reserve);
		$.ajax({
			type : TypeName,
			url : dynamicURL,
			data : reserveObj,
			contentType : 'application/json;charset=utf-8',
			success : function() {
				alert(statusSuccess);
				datatableFetch();
				reset();
			},
			error : function() {
				alert(statusError)
			}
		})

	}

	function update() {
		var reserve = {};
		var dynamicURL = "";
		var TypeName = "";
		var statusSuccess = "";
		var statusError = "";

		reserve.reserve_id = $('#reserve_id_edit').val();

		//update
		dynamicURL = 'http://localhost:8080/backend/reserve/update/'
				+ reserve.reserve_id;
		TypeName = 'post';
		statusSuccess = "修改成功";
		statusError = "修改失敗";

		
		reserve.reserve_memberid={};
		
		
		reserve.reserve_memberid.member_id = $('#reserve_memberid_edit').val();
		reserve.reserve_Date = $('#reserve_Date_edit').val();
		reserve.reserve_branch = $('#reserve_branch_edit').val();
		reserve.reserve_style = $('#reserve_style_edit').val();
		reserve.reserve_q1 = $("input:radio[name=reserve_q1_edit]:checked").val();
		reserve.reserve_q2 = $("input:radio[name=reserve_q2_edit]:checked").val();
		reserve.reserve_q3 = $("input:radio[name=reserve_q3_edit]:checked").val();
		reserve.reserve_q4 = $("input:radio[name=reserve_q4_edit]:checked").val();
		reserve.reserve_q5 = $("input:radio[name=reserve_q5_edit]:checked").val();

		datatableFetch();

		var reserveObj = JSON.stringify(reserve);
		$.ajax({
			type : TypeName,
			url : dynamicURL,
			data : reserveObj,
			contentType : 'application/json;charset=utf-8',
			success : function() {
				alert(statusSuccess);
				datatableFetch();
				reset();
			},
			error : function() {
				alert(statusError)
			}
		})

	}

	// 2222222222  判斷if else
	function upd(reserve_id) {
		$.ajax({
			url : 'http://localhost:8080/backend/reserve/query/' + reserve_id,
			method : 'post',
			dataType : 'JSON',
			success : function(data) {
				console.log(data.reserve_id);
				console.log("==================");
				var json = JSON.stringify(data, null, 4);
				console.log(json);
				var reserve = JSON.parse(json);
				console.log("-------------reserve-----------");
				console.log(reserve);
				$('#reserve_id_edit').val(reserve.reserve_id);
				$('#reserve_memberid_edit').val(reserve.reserve_memberid.member_id);
				$('#reserve_Date_edit').val(reserve.reserve_Date);
				$('#reserve_branch_edit').val(reserve.reserve_branch);
				$('#reserve_style_edit').val(reserve.reserve_style);
				console.log("///////////////////");
				console.log(reserve.reserve_q1);

				$(
						'input[name=reserve_q1_edit][value="'
								+ reserve.reserve_q1 + '"]').prop('checked',
						true);
				$(
						'input[name=reserve_q2_edit][value="'
								+ reserve.reserve_q2 + '"]').prop('checked',
						true);
				$(
						'input[name=reserve_q3_edit][value="'
								+ reserve.reserve_q3 + '"]').prop('checked',
						true);
				$(
						'input[name=reserve_q4_edit][value="'
								+ reserve.reserve_q4 + '"]').prop('checked',
						true);
				$(
						'input[name=reserve_q5_edit][value="'
								+ reserve.reserve_q5 + '"]').prop('checked',
						true);

			},
			error : function(error) {
				alert("修改發生錯誤");
			}
		})
	}

	/*function del(reserve_id) {
		$.ajax({
			url : 'http://localhost:8080/backend/reserve/delete/' + reserve_id,
			type : 'post',
			success : function() {
				alert('刪除成功');
				datatableFetch();
			},
			error : function(error) {
				alert('刪除失敗' + error);
			}
		})
	}*/
	
	
	//------------------------------ 
	 function del(reserve_id) {
	//------------------------------ 
	        Swal.fire({
	            title: "操作確認",
	            icon: 'warning',
	            text: "您確定要刪除嗎?!",
	            showCancelButton: true}).then(function(result) {
	           if (result.value) {
	            Swal.fire({icon: 'success',
	                title: '此筆預約資料已經刪除',
	                 showConfirmButton: false,
	                 timer: 1500});
	 //-------------------------------           
	            $.ajax({
	               url: '/backend/reserve/delete/' + reserve_id,
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
	
	

	function reset() {
		$('#reserve_id').val('');
		$('#reserve_memberid').val('');
		$('#reserve_Date').val('');
		$('#reserve_branch').val('');
		$('#reserve_style').val('');
		$("input:radio[name=reserve_q1]:checked").val('');
		$("input:radio[name=reserve_q2]:checked").val('');
		$("input:radio[name=reserve_q3]:checked").val('');
		$("input:radio[name=reserve_q4]:checked").val('');
		$("input:radio[name=reserve_q5]:checked").val('');
		$('#btnaddmember').text("新增");
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
								href="javascript:void(0)">預約管理</a></li>
						</ol>
					</div>
				</div>
				<!-- row -->




<!-- ////////////整夜table -->
				<div class="row">
					<div class="col-12">
						<div class="card">
							<div class="card-header">
								<h6 class="card-title">所有預約列表</h6>
								


								<a href="#addProductModal"  class="btn btn-success" data-toggle="modal"><i
									class="bi bi-plus-square"></i> <span>新增預約</span></a>
							
									
							</div>
							<div class="card-body">
								<div class="table-responsive">
									<table id="example" class="display" style="min-width: 845px">
									<thead>
											<tr>
												<th>預約編號</th>
												<th>客戶ID</th>
												<th>預約日期</th>
												<th>預約門市</th>
												<th>風格偏好</th>
												<th>Q1</th>
												<th>Q2</th>
												<th>Q3</th>
												<th>Q4</th>
												<th>Q5</th>
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
		
		
		
<!-- 		//////////////新增 -->
		
		
		<div id="addProductModal" class="modal fade">
		<div class="modal-dialog">
			<div class="modal-content">
				<form>
					<div class="modal-header">
						<h4 class="modal-title" style="align:center">新增預約</h4>
						<button type="button" class="close" data-dismiss="modal"
							aria-hidden="true">&times;</button>
					</div>
					
					
      <table style="margin: 30px; border-collapse:separate; border-spacing:0px 10px; ">
      
      	<tr >
            <td>預約編號</td>
            <td><input type="text" id="reserve_id" disabled ></td>
        </tr>
        
        <tr>
            <td>1. 客戶_ID</td>
            <td><input type="text"  class="form-control form-control-sm" style="width: 200px; height: 30PX;" name="reserve_memberid" id="reserve_memberid" ></td>
        </tr>
       
        <tr>
            <td>2. 預約日期</td>
            <td><input type="date" class="form-control" style="width: 200px"  name="reserve_Date" id="reserve_Date"></td>
        </tr>
        <tr>
            <td>3. 預約門市</td>
            <td>
                <select class="form-control form-control-sm" style="width: 200px" name="reserve_branch" id="reserve_branch">
                    <option>中壢門市</option>
                    <option>基隆門市</option>
                    <option>台中門市</option>
                    <option>高雄門市</option>
                </select>
            </td>
        </tr>
        <tr>
            <td>4. 偏好風格</td>
            <td>
                <select class="form-control form-control-sm" style="width: 200px" name="reserve_style" id="reserve_style">
                    <option>簡約風</option>
                    <option>工業風</option>
                    <option>北歐風</option>
                    <option>古典風</option>
                    <option>自然風</option>
                    <option>現代風</option>
                </select>
            </td>
        </tr>
        <tr>
            <td>Q1 要進行改造的空間是否為10坪以上？(室內面積，不含陽台)</td>
            <td><div class="form-check">
                <input class="form-check-input" type="radio" name="reserve_q1" id="reserve_q1"
                    value="1">
                <label class="form-check-label" for="exampleRadios2">YES</label>
                <br>
                <input class="form-check-input" type="radio" name="reserve_q1" id="reserve_q1"
                    value="2">
                <label class="form-check-label" for="exampleRadios2">NO</label>
            </div>
        </td>
        </tr>
        <tr>
            <td>Q2 該空間是否沒有違章搭建<br>(或有意願拆除)？</td>
            <td>
                <div class="form-check">
                    <input class="form-check-input" type="radio" name="reserve_q2" id="reserve_q2"
                        value="1">
                    <label class="form-check-label" for="exampleRadios2">YES</label>
                    <br>
                    <input class="form-check-input" type="radio" name="reserve_q2" id="reserve_q2"
                        value="2">
                    <label class="form-check-label" for="exampleRadios2">NO</label>
                    <br>
                </div>
            </td>
        </tr>
        <tr>
            <td>Q3 工程及家具預算是否超過60萬元？</td>
            <td>
                <div class="form-check">
                    <input class="form-check-input" type="radio" name="reserve_q3" id="reserve_q3"
                        value="1">
                    <label class="form-check-label" for="exampleRadios2">YES</label>
                    <br>
                    <input class="form-check-input" type="radio" name="reserve_q3" id="reserve_q3"
                        value="2">
                    <label class="form-check-label" for="exampleRadios2">NO</label>
            	</div>
            </td>
        </tr>
        <tr>
            <td>Q4 是否能接受將有室裝審查與場勘丈量約6~10萬元的費用？</td>
            <td>
                <div class="form-check">
                    <input class="form-check-input" type="radio" name="reserve_q4" id="reserve_q4"
                        value="1">
                    <label class="form-check-label" for="exampleRadios2">YES</label>
                    <br>
                    <input class="form-check-input" type="radio" name="reserve_q4" id="reserve_q4"
                        value="2">
                    <label class="form-check-label" for="exampleRadios2">NO</label>
                </div>
            </td>
        </tr>
        <tr>
            <td>Q5 裝潢預計日期是否大於3個月?</td>
            <td>
                <div class="form-check">
                    <input class="form-check-input" type="radio" name="reserve_q5" id="reserve_q5"
                        value="1">
                    <label class="form-check-label" for="exampleRadios2">YES</label>
                    <br>
                    <input class="form-check-input" type="radio" name="reserve_q5" id="reserve_q5"
                        value="2">
                    <label class="form-check-label" for="exampleRadios2">NO</label>
            	</div>
            </td>
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
      	<tr>
            <td>預約編號</td>
            <td><input type="text" id="reserve_id_edit" disabled ></td>
        </tr>
        <tr>
            <td>1. 客戶_ID</td>
            <td><input type="text"  class="form-control form-control-sm" style="width: 200px; height: 30PX;" name="reserve_memberid_edit" id="reserve_memberid_edit" ></td>
        </tr>
        <tr>
            <td>2. 預約日期</td>
            <td><input type="date" class="form-control" style="width: 200px"  name="reserve_Date_edit" id="reserve_Date_edit"></td>
        </tr>
        <tr>
            <td>3. 預約門市</td>
            <td>
                <select class="form-control form-control-sm" style="width: 200px" name="reserve_branch_edit" id="reserve_branch_edit">
                    <option>中壢門市</option>
                    <option>基隆門市</option>
                    <option>台中門市</option>
                    <option>高雄門市</option>
                </select>
            </td>
        </tr>
        <tr>
            <td>4. 偏好風格</td>
            <td>
                <select class="form-control form-control-sm" style="width: 200px" name="reserve_style_edit" id="reserve_style_edit">
                    <option>簡約風</option>
                    <option>工業風</option>
                    <option>北歐風</option>
                    <option>古典風</option>
                    <option>自然風</option>
                    <option>現代風</option>
                </select>
            </td>
        </tr>
        <tr>
            <td>Q1 要進行改造的空間是否為10坪以上？(室內面積，不含陽台)</td>
            <td><div class="form-check">
                <input class="form-check-input" type="radio" name="reserve_q1_edit" id="reserve_q1_edit"
                    value="1">
                <label class="form-check-label" for="exampleRadios2">YES</label>
                <br>
                <input class="form-check-input" type="radio" name="reserve_q1_edit" id="reserve_q1_edit"
                    value="2">
                <label class="form-check-label" for="exampleRadios2">NO</label>
            </div>
        </td>
        </tr>
        
        <tr>
        
            <td>Q2 該空間是否沒有違章搭建<br>(或有意願拆除)？</td>
            <td>
            
                <div class="form-check">
                    <input class="form-check-input" type="radio" name="reserve_q2_edit" id="reserve_q2_edit"
                        value="1">
                    <label class="form-check-label" for="exampleRadios2">YES</label>
                    <br>
                    <input class="form-check-input" type="radio" name="reserve_q2_edit" id="reserve_q2_edit"
                        value="2">
                    <label class="form-check-label" for="exampleRadios2">NO</label>
                    <br>
                </div>
            </td>
        </tr>
        <tr>
            <td>Q3 工程及家具預算是否超過60萬元？</td>
            <td>
                <div class="form-check">
                    <input class="form-check-input" type="radio" name="reserve_q3_edit" id="reserve_q3_edit"
                        value="1">
                    <label class="form-check-label" for="exampleRadios2">YES</label>
                    <br>
                    <input class="form-check-input" type="radio" name="reserve_q3_edit" id="reserve_q3_edit"
                        value="2">
                    <label class="form-check-label" for="exampleRadios2">NO</label>
            	</div>
            </td>
        </tr>
        <tr>
            <td>Q4 是否能接受將有室裝審查與場勘丈量約6~10萬元的費用？</td>
            <td>
                <div class="form-check">
                    <input class="form-check-input" type="radio" name="reserve_q4_edit" id="reserve_q4_edit"
                        value="1">
                    <label class="form-check-label" for="exampleRadios2">YES</label>
                    <br>
                    <input class="form-check-input" type="radio" name="reserve_q4_edit" id="reserve_q4_edit"
                        value="2">
                    <label class="form-check-label" for="exampleRadios2">NO</label>
                </div>
            </td>
        </tr>
        <tr>
            <td>Q5 裝潢預計日期是否大於3個月?</td>
            <td>
                <div class="form-check">
                    <input class="form-check-input" type="radio" name="reserve_q5_edit" id="reserve_q5_edit"
                        value="1">
                    <label class="form-check-label" for="exampleRadios2">YES</label>
                    <br>
                    <input class="form-check-input" type="radio" name="reserve_q5_edit" id="reserve_q5_edit"
                        value="2">
                    <label class="form-check-label" for="exampleRadios2">NO</label>
            	</div>
            </td>
        </tr>
        <tr>
			 <td><button id="btneditmember" class="btn btn-light"  onclick = "update()">修改</button></td>
<!-- 			 111111 -->
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

<!-- sweetalert -->
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@9"></script>
 
 	<script src="/cdn.jsdelivr.net/npm/sweetalert2@11"></script> 
	<!--<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>-->

	<!-- Datatable -->
	<script src="/vendor/datatables/js/jquery.dataTables.min.js"></script>
	<script src="/js/plugins-init/datatables.init.js"></script>
	<!--  -->
	
	
	<script>
		
		$(function(){
			$('#showproduct').DataTable( {
		    	"language":{
					"zeroRecords":"沒有符合的結果",
					"info":"顯示第 _START_ 至 _END_ 項結果，共 _TOTAL_ 項",
					"infoEmpty":"顯示第 0 至 0 項結果，共 0 項",
					"infoFiltered":"(從 _MAX_ 項結果中過濾)",
					"infoPostFix":"",
					"search":"搜尋:",
					"lengthMenu": "顯示 _MENU_ 項結果",
					"paginate":{
						"previous":"上一頁",
						"next":"下一頁",
					}	
		    	},
				"destroy":true,
				"columnDefs": [
		            {
		                "targets": [7] ,
		                "render": function (data, type, full, meta) {
		                	console.log('data',data)
		                    if (data) {
		                        if (data.length > 10) {
		                            return data.substr(0, 7) + "...";
		                        }else{
		                            return data;
		                        }
		                    }else {
		                            return "";
		                    }
		                }
		            }
		        ]
			} );
			
		})
	</script>
	

</body>

</html>