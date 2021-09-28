<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>	
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width,initial-scale=1">
<link rel="icon" href="/images/logo.ico" type="image/x-icon">
<title>數據管理</title>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@9"></script> 
<script src="https://cdn.bootcss.com/echarts/4.6.0/echarts.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
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
// 	$(document).ready(function(){
// 		datatableFetch();
// 	});
	
// 	function datatableFetch() {
//         $('#example').DataTable({
//             destroy: true,
//             "ajax": {
//                 "url": "/backend/employee/queryAll",
//                 "type": "POST",
//                 dataSrc: ''
//             },
               //step2:對應你的欄位
//             "columns": [
//                 {"data": "employee_id"},
//                 {"data": "employee_name"},
//                 {"data": "employee_password"},
//                 {"data": "employee_gender"},
//                 {"data": "employee_phone"},
//                 {"data": "employee_email"},
//                 {"data": "employee_address"},
//                 {"data": "employee_onboarddate"},
//                 {"data": "employee_birthday"},
//                 {"data": "employee_status"},
//                 {"data": "employee_photo"},
//                 {"data": null, defaultContent: "",  orderable : false,},
//                 {"data": null, defaultContent: "",  orderable : false,},
//             ],
            
               //step3:修改刪除
//             "createdRow": function (row, data, index) {
             
//             	$('td', row).eq(11).append($("<a href='#editEmployeeModal'data-toggle='modal' class='btn btn-warning' onclick='upd("+data.employee_id +")' ><i class='bi bi-pencil-square'></i></a>"));
//                 $('td', row).eq(12).append($("<button type='button' class='btn btn-danger' onclick = 'deleteEmployee("+data.employee_id +")'><i class='bi bi-trash'></i></button></td>"));
                   
            	
//                 $('td', row).eq(11).append($('<a href="#editProductModal" data-toggle="modal" onclick="upd(' + data.employee_id + ')" ><i class="bi bi-pencil-square"></i>修改</a>'));
//                 $('td', row).eq(12).append($('<button onclick = " deleteEmployee(' + data.employee_id + ')">刪除</button>'));
                
//             },
            
            //step4:圖片
//             "columnDefs":
//                 [{
//                     "targets": 10, //第幾個欄位從0開始
//                     "data": 'employee_photo', //對你欄位名稱
//                     "render": function (data, type) {
//                         return '<img src="' + data + '" alt="' + data + '"height="50" width="50"/>';
//                     }
//                 },{
//                     "targets": [2],//要減少字數的欄位
                  
//                        "render": function (data, type, full, meta) {
//                         console.log('data',data)
//                            if (data) {
//                                if (data.length > 1) {
//                                    return data.substr(0,3) + "...";
//                                }else{
//                                    return data;
//                                }
//                            }else {
//                                    return "";
//                            }
//                        }
                    
//                    }],
//         });
//     }
	
// 	function add(){
     		
// 	     		$("#employee_id").prop("disabled",false);
//      			$("#employee_photo").prop("disabled",false);
//      			$("#employee_status").prop("disabled",false);
	     		
// 	     		var formData = new FormData($("#formdata_add")[0]);
	     		
// 		     	datatableFetch();
	     	 
// 	     	 $.ajax({
// 	     		 type:'post',
// 	     		 url:'/backend/employee/add',
// 	     		 data:formData,
// 	     		 async:false,
// 	     		 cache:false,
// 	     		 //contentType:'application/json;charset=utf-8',
// 	     		 contentType:false,
//      		 	 processData:false,
// 	     		 success: function(){
// 	     			 alert("新增成功");
// 	     			datatableFetch();
// 	     			 reset();
// 	     		 },
// 	     		 error: function(){
// 	     			 alert("新增失敗");
// 	     		 }
// 	     	 })
// 	}

// 	function update(){
		
// 	     	employee_id = $('#employee_id_edit').val();
	     	
// 		     	$("#employee_id_edit").prop("disabled",false);
// 		        $("#employee_photo_edit").prop("disabled",false);
	     		 
// 	     		var formData = new FormData($("#formdata_edit")[0]);
// 	     		console.log(employee_id);
// 	     		//update
 	
// 		     	datatableFetch();

// 	     	 $.ajax({
// 	     		 type:'post',
// 	     		 url:'/backend/employee/update/',
// 	     		 data:formData,
// 	     		 async:false,
// 	     		 cache:false,
// 	     		 //contentType:'application/json;charset=utf-8',
// 	     		 contentType:false,
//    		 	 processData:false,
// 	     		 success: function(){
// 	     			 alert("修改成功");
// 	     			datatableFetch();
// 	     			 reset();
// 	     		 },
// 	     		 error: function(){
// 	     			 alert("修改失敗")
// 	     		 }
// 	     	 })
// 	}
	
// 	function upd(employee_id){
// 		$.ajax({
// 			url:'/backend/employee/query/' + employee_id,
// 			method:'post',
// 			dataType:'JSON',
// 			contentType:'application/json',
// 			success: function (data){
// 				console.log(data.employee_id);
// 				console.log("==================");
// 				var json = JSON.stringify(data, null, 4);
// 				console.log(json);
// 				var employee = JSON.parse(json);
// 				console.log(employee.employee_id);
// 				$('#employee_id_edit').val(employee.employee_id);
// 				$('#employee_name_edit').val(employee.employee_name);
// 				$('#employee_password_edit').val(employee.employee_password);
// 				$('#employee_gender_edit').val(employee.employee_gender);
// 				$('#employee_phone_edit').val(employee.employee_phone);
// 				$('#employee_email_edit').val(employee.employee_email);
// 				$('#employee_address_edit').val(employee.employee_address);
// 				$('#employee_onboarddate_edit').val(employee.employee_onboarddate);
// 				$('#employee_birthday_edit').val(employee.employee_birthday);
// 				$('#employee_status_edit').val(employee.employee_status);
// 				$('#employee_photo_edit').val(employee.employee_photo);
// 				$("#image_edit").attr("src",employee.employee_photo);
// 			},     
// 			error: function (){
// 				alert("修改失敗");
// 			}

			
// 		});
// 	}	
	
// 	function deleteEmployee(employee_id){
//         $.ajax({
//             url: '/backend/employee/delete/' + employee_id,
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
	
// 	function reset(){
// 		$('#employee_id').val('');
// 		$('#employee_name').val('');
// 		$('#employee_password').val('');
// 		$('#employee_gender').val('');
// 		$('#employee_phone').val('');
// 		$('#employee_email').val('');
// 		$('#employee_address').val('');
// 		$('#employee_onboarddate').val('');
// 		$('#employee_birthday').val('');
// 		$('#employee_status').val('');
// 		$('#employee_photo').val('');
		
// 	}
	
// 	  function loadImageFile_add(event){ 
// 	        var image = document.getElementById('image_add'); 
// 	        image.src = URL.createObjectURL(event.target.files[0]); 
// 	  };
// 	  function loadImageFile_edit(event){ 
// 	        var image = document.getElementById('image_edit'); 
// 	        image.src = URL.createObjectURL(event.target.files[0]); 
// 	  };
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
								href="/backend/allecharts">數據管理</a></li>
						</ol>
					</div>
				</div>
				<!-- row -->


				<div class="row">
					<div class="col-12">
						<div class="card">
							<div class="card-header">
								<h6 class="card-title">所有數據圖表</h6>

<!-- 								<a href="#addProductModal" class="btn btn-success" -->
<!-- 									data-toggle="modal" ><i class="material-icons">&#xE147;</i> <span>新增</span></a> -->
									
<!-- 								<a href="#addProductModal"  class="btn btn-success" data-toggle="modal"><i -->
<!-- 									class="bi bi-plus-square"></i> <span>新增員工</span></a> -->
									
							</div>
							<div class="card-body">
								<div class="table-responsive">
									<table id="example" class="display" style="min-width: 845px">
<!-- 										<thead> -->
<!-- 											<tr> -->
<!-- 												<th>員工編號</th> -->
<!-- 												<th>員工名字</th> -->
<!-- 												<th>員工密碼</th> -->
<!-- 												<th>員工性別</th> -->
<!-- 												<th>員工電話</th> -->
<!-- 												<th>員工信箱</th> -->
<!-- 												<th>員工地址</th> -->
<!-- 												<th>員工報到日</th> -->
<!-- 												<th>員工生日</th> -->
<!-- 												<th>員工狀態</th> -->
<!-- 												<th>員工照片</th> -->
<!-- 												<th>修改</th> -->
<!-- 												<th>刪除</th> -->
<!-- 											</tr> -->
<!-- 										</thead> -->
										
	<div id="main" style="width: 600px;height:400px;"></div>
	<script type="text/javascript">
    // 初始化ECharts组件到id为main的元素上
    $(document).ready(function(){
    var myChart = echarts.init(document.getElementById('main'),'light');
    // 定义图标的配置项
    myChart.setOption ({
        title: {
            text: '產品剩餘數量'
        },
        tooltip: {
        	      trigger: 'axis',
        	      axisPointer: {    
        	        type: 'shadow'   
        	      },
        },
        legend: {
        	data:['數量']
        },
        // x轴配置
        xAxis: {
            data: []
        },
        // y轴配置
        yAxis: {},
        series: [{
        	"name":"數量",
            // 数据集（也可以从后端的Controller中传入）
            data: [],
            // 图表类型，这里使用line，为折线图
            type: 'bar'
        }]
    });
    myChart.showLoading(); //上部分為echarts基本實現,下部分為ajax不同步獲取數據
    var names=[];
    var nums=[];
    $.ajax({
    	type:'post',
        async:true,
        url:'/backend/echartsproduct',
        data:{},
        dataType:"json",
        success:function(result){
              if(result){
            	  for(var i=0;i<result.length;i++){
            		  names.push(result[i].product_name);
            	  }
            	  for(var i=0;i<result.length;i++){
            		  nums.push(result[i].product_quantity);
            	  }
            	  myChart.hideLoading();
            	  myChart.setOption({
            		  xAxis: {data: names},
            		  series: [{
            			    name:"數量",
            	            data: nums
            	        }]
            	  })
                
              }
        },	
        error:function(errorMsg){
        	//請求失敗執行該函數
//         	alert("");
        	Swal.fire("圖表數據請求失敗");
        	myChart.hideLoading();
        }	
        
    });
    });
</script>
<div id="main1" style="width: 600px;height:400px;"></div>
	<script type="text/javascript">
    // 初始化ECharts组件到id为main的元素上
    $(document).ready(function(){
    var myChart = echarts.init(document.getElementById('main1'));
    // 定义图标的配置项
    myChart.setOption ({
        title: {
            text: '文章推文次數'
        },
        tooltip: {
        	      trigger: 'axis',
        	      axisPointer: {    
        	        type: 'shadow'   
        	      },
        },
        legend: {
        	data:['次數']
        },
        // x轴配置
        xAxis: {
            data: []
        },
        // y轴配置
        yAxis: {},
        series: [{
        	"name":"次數",
            // 数据集（也可以从后端的Controller中传入）
            data: [],
            // 图表类型，这里使用line，为折线图
            type: 'bar',
            itemStyle:{
        		color:'green'
        	}
        }]
    });
    myChart.showLoading(); //上部分為echarts基本實現,下部分為ajax不同步獲取數據
    var names=[];
    var nums=[];
    $.ajax({
    	type:'post',
        async:true,
        url:'/backend/echartsarticle',
        data:{},
        dataType:"json",
        success:function(result){
              if(result){
            	  for(var i=0;i<result.length;i++){
            		  names.push(result[i].article_id);
            	  }
            	  for(var i=0;i<result.length;i++){
            		  nums.push(result[i].article_like);
            	  }
            	  myChart.hideLoading();
            	  myChart.setOption({
            		  xAxis: {data: names},
            		  series: [{
            			    name:"次數",
            	            data: nums
            	        }]
            	  })
                
              }
        },	
        error:function(errorMsg){
        	//請求失敗執行該函數
//         	alert("");
        	Swal.fire("圖表數據請求失敗");
        	myChart.hideLoading();
        }	
        
    });
    });
</script>
<div id="main2" style="width: 600px;height:400px;"></div>
	<script type="text/javascript">
    // 初始化ECharts组件到id为main的元素上
    $(document).ready(function(){
    var myChart = echarts.init(document.getElementById('main2'));
    // 定义图标的配置项
    myChart.setOption ({
        title: {
            text: '作品集推文次數'
        },
        tooltip: {
        	      trigger: 'axis',
        	      axisPointer: {    
        	        type: 'shadow'   
        	      },
        },
        legend: {
        	data:['次數']
        },
        // x轴配置
        xAxis: {
            data: []
        },
        // y轴配置
        yAxis: {},
        series: [{
        	"name":"次數",
            // 数据集（也可以从后端的Controller中传入）
            data: [],
            // 图表类型，这里使用line，为折线图
            type: 'bar',
            itemStyle:{
        		color:'green'
        	}
        }]
    });
    myChart.showLoading(); //上部分為echarts基本實現,下部分為ajax不同步獲取數據
    var names=[];
    var nums=[];
    $.ajax({
    	type:'post',
        async:true,
        url:'/backend/echartsportfolio',
        data:{},
        dataType:"json",
        success:function(result){
              if(result){
            	  for(var i=0;i<result.length;i++){
            		  names.push(result[i].portfolio_id);
            	  }
            	  for(var i=0;i<result.length;i++){
            		  nums.push(result[i].portfolio_like);
            	  }
            	  myChart.hideLoading();
            	  myChart.setOption({
            		  xAxis: {data: names},
            		  series: [{
            			    name:"次數",
            	            data: nums
            	        }]
            	  })
                
              }
        },	
        error:function(errorMsg){
        	//請求失敗執行該函數
//         	alert("");
        	Swal.fire("圖表數據請求失敗");
        	myChart.hideLoading();
        }	
        
    });
    });
</script>
<div id="main3" style="width: 600px;height:400px;"></div>
	<script type="text/javascript">
    // 初始化ECharts组件到id为main的元素上
    $(document).ready(function(){
    var myChart = echarts.init(document.getElementById('main3'),'dark');
    // 定义图标的配置项
    myChart.setOption ({
        title: {
            text: '每日總營收'
        },
        tooltip: {
        	      trigger: 'axis',
        	      axisPointer: {    
        	        type: 'shadow'   
        	      },
        },
        legend: {
        	data:['總營收']
        },
        // x轴配置
        xAxis: {
            data: []
        },
        // y轴配置
        yAxis: {},
        series: [{
        	"name":"總營收",
            // 数据集（也可以从后端的Controller中传入）
            data: [],
            // 图表类型，这里使用line，为折线图
            type: 'line'
        }]
    });
    myChart.showLoading(); //上部分為echarts基本實現,下部分為ajax不同步獲取數據
    var names=[];
    var nums=[];
    $.ajax({
    	type:'post',
        async:true,
        url:'/backend/echartsorder',
        data:{},
        dataType:"json",
        success:function(result){
        	 if(result){
           	  for(var i=0;i<result.length;i++){
           		  names.push(result[i].date);
           		  console.log(result[0])
           		  console.log(result[1])
           		  console.log(result[2])
           	  }
           	  for(var i=0;i<result.length;i++){
           		  nums.push(result[i].revenue);
           	  }
            	  myChart.hideLoading();
            	  myChart.setOption({
            		  xAxis: {data: names},
            		  series: [{
            			    name:"總營收",
            	            data: nums
            	        }]
            	  })
                
              }
        },	
        error:function(errorMsg){
        	//請求失敗執行該函數
//         	alert("");
        	Swal.fire("圖表數據請求失敗");
        	myChart.hideLoading();
        }	
        
    });
    });
</script>
									</table>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		
		
<!-- step6 新增的表單		 -->
<!-- 		<div id="addProductModal" class="modal fade"> -->
<!-- 		<div class="modal-dialog"> -->
<!-- 			<div class="modal-content"> -->
<!-- 				<form id="formdata_add"> -->
<!-- 					<div class="modal-header"> -->
<!-- 						<h4 class="modal-title" style="align:center">新增商品</h4> -->
<!-- 						<button type="button" class="close" data-dismiss="modal" -->
<!-- 							aria-hidden="true">&times;</button> -->
<!-- 					</div> -->
<!-- 					<div class="modal-body"> -->
<!-- 						<div class="form-group"> -->
<!-- 							<label>員工編號</label><input  id="employee_id" name="employee_id" type="text" disabled > -->
<!-- 						</div> -->
<!-- 						<div class="form-group"> -->
<!-- 							<label>員工名稱</label> <input name="employee_name" id="employee_name" type="text" class="form-control" -->
<!-- 								 required> -->
<!-- 						</div> -->
<!-- 						<div class="form-group"> -->
<!-- 							<label>員工密碼</label> <input name="employee_password" id="employee_password" type="password" class="form-control" -->
<!-- 								 required> -->
<!-- 						</div> -->
<!-- 						<div class="form-group"> -->
<!-- 							<label>員工性別</label> <select class="form-control form-control-sm" -->
<!-- 								name="employee_gender" id="employee_gender" required> -->
<!-- 								<option value=""></option> -->
<!-- 								<option value="男">男</option> -->
<!-- 								<option value="女">女</option> -->
							
<!-- 							</select> -->
<!-- 						</div> -->
<!-- 						<div class="form-group"> -->
<!-- 							<label>員工電話</label> <input name="employee_phone" id="employee_phone" type="text" class="form-control" -->
<!-- 								 required> -->
<!-- 						</div> -->
<!-- 						<div class="form-group"> -->
<!-- 							<label>員工信箱</label> <input name="employee_email" id="employee_email" type="text" class="form-control" -->
<!-- 								 required> -->
<!-- 						</div> -->
<!-- 						<div class="form-group"> -->
<!-- 							<label>員工地址</label> <input name="employee_address" id="employee_address" type="text" class="form-control" -->
<!-- 								 required> -->
<!-- 						</div> -->
<!-- 						<div class="form-group"> -->
<!-- 							<label>員工報到日</label> <input name="employee_onboarddate" id="employee_onboarddate" type="date" class="form-control" -->
<!-- 								 required> -->
<!-- 						</div> -->
<!-- 						<div class="form-group"> -->
<!-- 							<label>員工生日</label> <input name="employee_birthday" id="employee_birthday" type="date" class="form-control" -->
<!-- 								 required> -->
<!-- 						</div> -->
<!-- 						<div class="form-group"> -->
<!-- 								<label>員工狀態</label> <input name="employee_status" id="employee_status" type="text" value="deactivated" class="form-control" -->
<!-- 								 required disabled > -->
<!-- 						</div> -->
<!-- 						<div class="form-group"> -->
<!-- 							<label>員工照片</label><br><img id="image_add" alt="尚未選擇圖片" src="" style="height:100%;width:300px"><input name="employee_photo" id="employee_photo" type="hidden" required disabled> -->
<!-- 						</div> -->
<!-- 						<div class="form-group"> -->
<!-- 							<label>檔案</label> <input name="file" id="file" type="file" required onchange="loadImageFile_add(event)"> -->
<!-- 						</div>			 -->
<!-- 					</div> -->
<!-- 					<div class="modal-footer"> -->
<!-- 						<input id="AddEmployeeBtn" type="button" onclick="add()" class="btn btn-success" value="新增" data-dismiss="modal"> -->
<!-- 						<input type="button" class="btn btn-default" data-dismiss="modal" -->
<!-- 							value="取消">  -->
<!-- 					</div> -->
<!-- 				</form> -->
<!-- 			</div> -->
<!-- 		</div> -->
<!-- 	</div> -->
	


<!-- step7 編輯的表單		 -->
		
<!-- 	<div id="editEmployeeModal" class="modal fade"> -->
<!-- 		<div class="modal-dialog"> -->
<!-- 			<div class="modal-content"> -->
<!-- 				<form id="formdata_edit"> -->
<!-- 					<div class="modal-header"> -->
<!-- 						<h4 class="modal-title" style="align:center">修改員工</h4> -->
<!-- 						<button type="button" class="close" data-dismiss="modal" -->
<!-- 							aria-hidden="true">&times;</button> -->
<!-- 					</div> -->
<!-- 					<div class="modal-body"> -->
<!-- 						<div class="form-group"> -->
<!-- 							<label>員工編號</label><input  id="employee_id_edit" name="employee_id_edit" type="text"  disabled > -->
<!-- 						</div> -->
<!-- 						<div class="form-group"> -->
<!-- 							<label>員工名稱</label> <input name="employee_name_edit" id="employee_name_edit" type="text" class="form-control" -->
<!-- 								 required> -->
<!-- 						</div> -->
<!-- 						<div class="form-group"> -->
<!-- 							<label>員工密碼</label> <input name="employee_password_edit" id="employee_password_edit" type="password" class="form-control" -->
<!-- 								 required> -->
<!-- 						</div> -->
<!-- 						<div class="form-group"> -->
<!-- 							<label>員工性別</label> <select class="form-control form-control-sm" -->
<!-- 								name="employee_gender_edit" id="employee_gender_edit" required> -->
<!-- 								<option value=""></option> -->
<!-- 								<option value="男">男</option> -->
<!-- 								<option value="女">女</option> -->
							
<!-- 							</select> -->
<!-- 						</div> -->
<!-- 						<div class="form-group"> -->
<!-- 							<label>員工電話</label> <input name="employee_phone_edit" id="employee_phone_edit" type="text" class="form-control" -->
<!-- 								 required> -->
<!-- 						</div> -->
<!-- 						<div class="form-group"> -->
<!-- 							<label>員工信箱</label> <input name="employee_email_edit" id="employee_email_edit" type="text" class="form-control" -->
<!-- 								 required> -->
<!-- 						</div> -->
<!-- 						<div class="form-group"> -->
<!-- 							<label>員工地址</label> <input name="employee_address_edit" id="employee_address_edit" type="text" class="form-control" -->
<!-- 								 required> -->
<!-- 						</div> -->
<!-- 						<div class="form-group"> -->
<!-- 							<label>員工報到日</label> <input name="employee_onboarddate_edit" id="employee_onboarddate_edit" type="date" class="form-control" -->
<!-- 								 required> -->
<!-- 						</div> -->
<!-- 						<div class="form-group"> -->
<!-- 							<label>員工生日</label> <input name="employee_birthday_edit" id="employee_birthday_edit" type="date" class="form-control" -->
<!-- 								 required> -->
<!-- 						</div> -->
<!-- 						<div class="form-group"> -->
<!-- 								<label>員工狀態</label> <select class="form-control form-control-sm" -->
<!-- 								name="employee_status_edit" id="employee_status_edit" required> -->
<!-- 								<option value="deactivated">deactivated</option> -->
<!-- 								<option value="user">user</option> -->
<!-- 								<option value="boss">boss</option> -->
							
<!-- 							</select> -->
<!-- 						</div> -->
<!-- 						<div class="form-group"> -->
<!-- 							<label>員工照片</label><br><img id="image_edit" alt="尚未選擇圖片" src="" style="height:100%;width:300px"> <input name="employee_photo_edit" id="employee_photo_edit" type="hidden" required  disabled > -->
<!-- 						</div> -->
<!-- 						<div class="form-group"> -->
<!-- 							<label>檔案</label> <input name="file_edit" id="file_edit" type="file" required onchange="loadImageFile_edit(event)"> -->
<!-- 						</div>			 -->
<!-- 					</div> -->
<!-- 					<div class="modal-footer"> -->
<!-- 						<input id="editEmployeeBtn" type="button" onclick="update()" class="btn btn-success" value="確認" data-dismiss="modal"> -->
<!-- 						<input type="button" class="btn btn-default" data-dismiss="modal" -->
<!-- 							value="取消">  -->
<!-- 					</div> -->
<!-- 				</form> -->
<!-- 			</div> -->
<!-- 		</div> -->
<!-- 	</div> -->
		
		
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