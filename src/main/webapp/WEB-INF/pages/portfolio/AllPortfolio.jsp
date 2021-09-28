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

<title>作品集管理</title>

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

<style>
a {
    text-decoration:none;
    color:black;
}
</style>
<!-- <script -->
<!-- 	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script> -->
<script type="text/javascript">

function selectmessageinone(portfolio_id) {
    $('#example12').DataTable({
        destroy: true,
        "ajax": {
            "url": "/backend/portfolio/selectmessage/"+portfolio_id,
            "type": "POST",
            dataSrc: ''
        },
        //step2:對應你的欄位
   
        "columns": [
        	  {"data": "idpm"},
        	  {"data": "portfolio_id"},
	            {"data": "member_name"},
	            {"data": "portfolio_in"},
	            {"data": "portfoliomember_like"},
	            {"data": "portfolio_intime"},
            {"data": null, defaultContent: "",  orderable : false,},
          
        ],
        
        "createdRow": function (row, data, index) {
     //   $('td', row).eq(6).append($("<a href='#'data-toggle='modal' class='btn btn-warning' onclick='#'>"+data.article_id+"<i class='bi bi-pencil-square'></i></a>"));
        $('td', row).eq(6).append($("<button type='button' class='btn btn-danger' onclick = 'deletemessageone("+data.idpm+","+data.portfolio_id+")' ><i class='bi bi-trash'></i></button></td>"));
         }
        
  
    });
}

function deletemessageone(idpm,portfolio_id){
    Swal.fire({
        title: "操作確認",
        icon: 'warning',
        text: "您確定要刪除嗎?!",
        showCancelButton: true}).then(function(result) {
       if (result.value) {
    	   Swal.fire({icon: 'success',
          	 title: '留言已經刪除',
          	  showConfirmButton: false,
          	  timer: 1500});
    	   $.ajax({
    	        url: '/backend/portfolio/deletemessageone/'+idpm,
    	        type: 'POST',
    	        success: function () {
    	       console.log(portfolio_id);
    	       console.log(idpm);
    	       
    	          selectmessageinone(portfolio_id);
    	          selectmessage();
    	        },
    	        error: function (error) {
    	        }
    	    })             
       }
       else {
           Swal.fire({icon: 'error',
          	 title: '您取消了操作',
          	  showConfirmButton: false,
          	  timer: 1500});
       }
    });
}

/*
提醒一:application.properties要加 ,classpath:/static/
提醒二:所有load(1)改成datatableFetch();
提醒三:id要是example
以下分為7步驟
*/
// 留言訊息--N
function alldeletemessageone(idpm){
    Swal.fire({
        title: "操作確認",
        icon: 'warning',
        text: "您確定要刪除嗎?!",
        showCancelButton: true}).then(function(result) {
       if (result.value) {
    	   Swal.fire({icon: 'success',
          	 title: '留言已經刪除',
          	  showConfirmButton: false,
          	  timer: 1500});
    	   $.ajax({
    	        url: '/backend/portfolio/deletemessageone/'+idpm,
    	        type: 'POST',
    	        success: function () {
    	       console.log(portfolio_id);
    	       console.log(idpm);
    	            selectmessage();
    	        },
    	        error: function (error) {
    	        }
    	    })             
       }
       else {
           Swal.fire({icon: 'error',
          	 title: '您取消了操作',
          	  showConfirmButton: false,
          	  timer: 1500});
       }
    });
}







// step1.更改function
	$(document).ready(function(){
		selectmessage();
	});
	$(document).ready(function(){
		datatableFetch();
	});
	
	//所有的留言---N
	function selectmessage() {
        $('#example1').DataTable({
            destroy: true,
            "ajax": {
                "url": "/backend/portfolio/selectmessage",
                "type": "POST",
                dataSrc: ''
            },
            //step2:對應你的欄位
       
            "columns": [
            	  {"data": "idpm"},
            	  {"data": "portfolio_id"},
           // 	  {"data": "article_id"},
  	              {"data": "member_name"},
  	             {"data": "portfolio_in"},
  	        //    {"data": null, defaultContent: "",orderable : false,},
  	            {"data": "portfoliomember_like"},
  	            {"data": "portfolio_intime"},
	            {"data": null, defaultContent: "",  orderable : false,},
            ],
            
            //step3:修改刪除
            "createdRow": function (row, data, index) {
       //     $('td', row).eq(3).append($("<div class='box'><a href='/inhouse/portfolio/portfolioView/"+data.portfolio_id+"'<p>"+data.portfolio_in+"</a></div>"));
         //   $('td', row).eq(6).append($("<a href='#'data-toggle='modal' class='btn btn-warning' onclick='#'>"+data.article_id+"<i class='bi bi-pencil-square'></i></a>"));
            $('td', row).eq(6).append($("<button type='button' class='btn btn-danger'onclick='alldeletemessageone("+data.idpm+")'><i class='bi bi-trash'></i></button></td>"));
             }
            
      
        });
    }
	
	//分隔線---------------------直接帶入數據OK-----------------
	function datatableFetch() {
        $('#example').DataTable({
            destroy: true,
            "ajax": {
                "url": "/backend/portfolio/all",
                "type": "POST",
                dataSrc: ''
            },
            //step2:對應你的欄位
       
            "columns": [
                {"data": "portfolio_id"},
                {"data": "designer_id.designer_id"},
                {"data": "portfolio_like"},
                {"data": "portfolio_title"},
             // {"data": "portfoilo"},
                {"data": null, defaultContent: "",orderable : false,},
              //{"data": "article"},
              //{"data": "portfoilo"},
                {"data": "portfolio_image"},
                {"data": "portfolio_time"},
                {"data": null, defaultContent: "",  orderable : false,},
                {"data": null, defaultContent: "",  orderable : false,},
                {"data": null, defaultContent: "",  orderable : false,},
            ],
            //step3:修改刪除
            "createdRow": function (row, data, index) {
            //	  $('td', row).eq(4).append($("<a href='/backend/article/articleView/'"+data.article_id+""));
            //    $('td', row).eq(4).append($("<a href='#editArticleModal'"));
            //    $('td', row).eq(4).append($("<div class='box'><a href='/backend/article/articleView/"+data.article_id+"'<p>"+data.article.substr(4,16)+"</a></div>"));
                $('td', row).eq(4).append($("<div class='box'><a href='/inhouse/portfolio/portfolioView/"+data.portfolio_id+"'<p>"+data.portfolio.substr(3,15)+"</a></div>"));
                $('td', row).eq(7).append($("<a href='#deletemessageone'data-toggle='modal'  class='btn btn-outline-primary' onclick='selectmessageinone("+ data.portfolio_id +")'><i class='material-icons'>&#xE147;</i>留言區</a>"));
                $('td', row).eq(8).append($("<a href='#editArticleModal'data-toggle='modal' class='btn btn-warning' onclick='upd("+ data.portfolio_id +")' ><i class='bi bi-pencil-square'></i></a>"));
                $('td', row).eq(9).append($("<button type='button' class='btn btn-danger' onclick = 'deleteArticle("+ data.portfolio_id +")'><i class='bi bi-trash'></i></button></td>"));
               
             },
            
            //step4:圖片	
            "columnDefs":
                [{
                    "targets": 5, //第幾個欄位從0開始
                    "data": 'portfolio_image', //對你欄位名稱
                    "render": function (data, type) {
                        return '<img src="' + data + '" alt="' + data + '"height="50" width="50"/>';}
                    
                },
 	              {
 	                	"targets": 4,//要減少字數的欄位
 	 	                  "render": function (data, type, full, meta,portfolio_id) {
 	 	                   console.log('data',data)
 	 	                      if (data) {
 	 	                          if (data.length > 1) {
 	 	                         //   return data.substr(0,10) + "...";
 	 	                          return  data.substr(0,1) + "..."+'</a>';
 	 	                   //       return   '<a href="/backend/article/articleView/'+article_id+'">'+ data.substr(4,16) + "..."+'</a>';
 	 	                          //  return '<a href="blog-post-01.html" class="hover-shine card-img-top">';
 	 	                          }else{
 	 	                              return data;
 	 	                          }
 	 	                      }else {
 	 	                              return "";
 	 	                      }
 	 	                  }
 	                 
 	 	              }
 	              ],
                
              
        
        
        
        
        });
    }
	//新增一筆OK
	function add(){
 		//  var product = {};
 		//  var dynamicURL = "";
 	    //  var TypeName = "";
 	     
	      var statusSuccess="";
	      var statusError="";
	      //---------------------------------------------
	      $('textarea[name=portfolio]').val();
	      CKEDITOR.instances.portfolio.updateElement();
	      $('textarea[name=portfolio_edit]').val();
	      CKEDITOR.instances.portfolio_edit.updateElement();
	      havearticle = $('#portfolio_id').val();
	     
	      portfolio_id = $('#portfolio_id_edit').val();
	      console.log(portfolio_id);
	      
	    //  console.log(data.article_id_edit);
	     	
	     		//save
	     		console.log("======else============");
	     		$("#portfolio_id").prop("disabled",false);
     			$("#portfolio_image").prop("disabled",false);
     			$("#portfolio_like").prop("disabled",false);
     			
	     		var formData = new FormData($("#formdata_add")[0]);
	     		
	     		dynamicURL='/backend/portfolio/add';
	     		TypeName='post';
	     	//	statusSuccess="新增成功";
	     	//	statusError="新增失敗";
		     	datatableFetch();
	     	
	     	 $.ajax({
	     		 type:'post',
	     		 url:'/backend/portfolio/add',
	     		 data:formData,
	     		 async:false,
	     		 cache:false,
	     		 contentType:false,
     		 	 processData:false,
	     		 success: function(){
	     		//	 alert(statusSuccess);

	 	     		Swal.fire({icon: 'success',
	                 	 title: '新增成功!',
	                 	  showConfirmButton: false,
	                 	  timer: 1500});
	     			datatableFetch();
	     			 reset();
	     		 },
	     		 error: function(){
	     			Swal.fire({icon: 'error',
	                 	 title: '查無此設計師編號!',
	                 	  showConfirmButton: false,
	                 	  timer: 1500});
	     			datatableFetch();
	     			 reset();
	     		 }
	     	 })

	}
	//OK
	function update(){
 		//  var product = {};
 		//  var dynamicURL = "";
 	    //  var TypeName = "";
	      var statusSuccess="";
	      var statusError="";
	      //---------------------------------------------
	      $('textarea[name=portfolio]').val();
	      CKEDITOR.instances.portfolio.updateElement();
	      $('textarea[name=portfolio_edit]').val();
	      CKEDITOR.instances.portfolio_edit.updateElement();
	      haveportfolio = $('#portfolio_id').val();
	     
	      portfolio_id = $('#portfolio_id_edit').val();
	      console.log(portfolio_id);
	      
	    //  console.log(data.portfolio_id_edit);
	     	 if(portfolio_id){
		     	$("#portfolio_id_edit").prop("disabled",false);
		        $("#portfolio_image_edit").prop("disabled",false);
		        $("#portfolio_like_edit").prop("disabled",false); 
		       
		        
	     		
	     		var formData = new FormData($("#formdata_edit")[0]);
	     		console.log(portfolio_id);
	     		console.log(portfolio_id_edit);
	     		$('#portfolio_id_edit').val(null);
	     		
	     		//update
	     		dynamicURL='/backend/portfolio/update/'+ portfolio_id;
	     		TypeName='post';
	     	//	statusSuccess="修改成功";
	     	//	statusError="修改失敗";
	     		 	     		Swal.fire({icon: 'success',
	                 	 title: '修改成功!',
	                 	  showConfirmButton: false,
	                 	  timer: 1500});
       	     	datatableFetch();
	     		
	     	 }else{
	     		//save
	     		console.log("======else============");
	     		$("#portfolio_id").prop("disabled",false);
     			$("#portfolio_image").prop("disabled",false);
     			$("#portfolio_like").prop("disabled",false);
     			
	     		var formData = new FormData($("#formdata_add")[0]);
	     		dynamicURL='/backend/portfolio/add';
	     		TypeName='post';
	     //		statusSuccess="新增成功";
	     //		statusError="新增失敗";
		     	datatableFetch();
	     	 }
	     	 $.ajax({
	     		 type:TypeName,
	     		 url:dynamicURL,
	     		 data:formData,
	     		 async:false,
	     		 cache:false,
	     		 contentType:false,
     		 	 processData:false,
	     		 success: function(){
	     		//	 alert(statusSuccess);
	     			 	 Swal.fire({icon: 'success',
	                 	 title: '修改成功!',
	                 	  showConfirmButton: false,
	                 	  timer: 1500});
	     			datatableFetch();
	     			 reset();
	     		 },
	     		 error: function(){
	     		 	 Swal.fire({icon: 'error',
	                 	 title: '修改失敗!',
	                 	  showConfirmButton: false,
	                 	  timer: 1500});
	     			datatableFetch();
	     			 reset();
	     		 }
	     	 })

	}
	//修改OK
	function upd(portfolio_id){
		$.ajax({
			url:'/backend/portfolio/query/'+ portfolio_id,
			method:'post',
			dataType:'JSON',
			contentType:'application/json',
			success: function (data){
				console.log(portfolio_id);
				console.log(data.article_id);
				console.log("==================");
				var json = JSON.stringify(data, null, 4);
				console.log(json);
				var article = JSON.parse(json);
				console.log(article.portfolio_id);
				$('#portfolio_id_edit').val(article.portfolio_id);
				$('#portfolio_title_edit').val(article.portfolio_title);
				$('#portfolio_like_edit').val(article.portfolio_like);
				$('#designer_id_edit').val(article.designer_id.designer_id);
			    CKEDITOR.instances.portfolio_edit.setData(article.portfolio);
			    $('#portfolio_edit').val(article.portfolio);
			    $('#file_edit').val(portfolio.file);
				$('#portfolio_time_edit').val(article.portfolio_time);
				$('#portfolio_image_edit').val(article.portfolio_image);
				$("#image_edit").attr("src",article.portfolio_image);
				//reset();
			},     
			error: function (){
				alert("修改失敗");
			}

			
		});
	}	
	
	
	function deleteArticle(portfolio_id){ 
	    Swal.fire({
	        title: "操作確認",
	        icon: 'warning',
	        text: "您確定要刪除嗎?!",
	        showCancelButton: true}).then(function(result) {
	       if (result.value) {
	    	   Swal.fire({icon: 'success',
	          	 title: '作品集已經刪除',
	          	  showConfirmButton: false,
	          	  timer: 1500});
	    	   $.ajax({
	               url: '/backend/portfolio/delete/' + portfolio_id,
	               type: 'POST',
	               success: function () {
	                   datatableFetch();
	               },
	               error: function (error) {
	            	   Swal.fire({icon: 'error',
	      	          	 title: '刪除失敗',
	      	          	  showConfirmButton: false,
	      	          	  timer: 1500});
	               }
	           })             
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
		$('#portfolio_id_edit').val('');
		$('#portfolio_like_edit').val('');
		$('#portfolio_title_edit').val('');
		$('#designer_id_edit').val('');
		$('#designer_id').val('');
		$('#portfolio_edit').val('');
		$('#portfolio_id').val('');
		$('#portfolio_like').val('');
		$('#portfolio_title').val('');
		$('#portfolio_name').val('');
		CKEDITOR.instances.portfolio.setData('');
		$('#portfolio').val('');
		$('#portfolio_image').val('');
	} 
	//step5.確認有沒有code有打錯的~~
	
		function loadImageFile_add(event){ 
		var image = document.getElementById('image_add'); 
		image.style.display = 'block';
		image.src = URL.createObjectURL(event.target.files[0]); 
	};
	    function loadImageFile_edit(event){ 
		var image = document.getElementById('image_edit'); 
		image.src = URL.createObjectURL(event.target.files[0]); 
	};
	//一鍵登入
	function keyinAll(){			
			$('#portfolio_id').val('');
			$('#designer_id').val('1');
			$('#portfolio_title').val('簡單就是最美輕盈單椅設計');
			 CKEDITOR.instances.portfolio.setData('高機動性的拉門設計，常常是維持空間感的秘訣，在靈活滑動之間，造就隱現自如的格局型態。西班牙設計工作室 <a href="https://zooco.es/en/portfolio_page/pacos-house/" class="link2c" target="_blank">Zooco Estudio</a>  所分享的作品案例，即以滑門突破種種限制，取得開放與私隱的平衡點。<br><br><img src="https://decomyplace.com/img/blog/210518_zooco_1.jpg"><br><br>毫無斷點的穿透佈局，源自團隊簡化了各項設計元素，僅以石與木體現純粹二元形式，通過天然材料降低一切感官干擾，同步圍築一方明淨ㄇ形窗框，盛納一幅馬德里的城市天際光景。<br><br><img src="https://decomyplace.com/img/blog/210518_zooco_2.jpg"><br><br>串接樓梯同步導入懸浮設計，淨空視線迎來輕透感受，甫至二樓，將門扇全數採以置頂木拉門呈現，使寢室、廚房與衛浴退隱其後，搭配玻璃扶手創造純淨空氣感，依隨著生活自由調移住家輪廓。<br><br><img src="https://decomyplace.com/img/blog/210518_zooco_3.jpg"><br><br><img src="https://decomyplace.com/img/blog/210518_zooco_4.jpg"><br><br><img src="https://decomyplace.com/img/blog/210518_zooco_5.gif"><br><br><img src="https://decomyplace.com/img/blog/210518_zooco_6.jpg"><br><br><img src="https://decomyplace.com/img/blog/210518_zooco_7.jpg"><br><br><img src="https://decomyplace.com/img/blog/210518_zooco_8.jpg"><br><br><img src="https://decomyplace.com/img/blog/210518_zooco_9.gif"><br><br><img src="https://decomyplace.com/img/blog/210518_zooco_10.jpg"><br><br><img src="https://decomyplace.com/img/blog/210518_zooco_11.gif">');
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
								href="javascript:void(0)">作品集管理</a></li>
		
						</ol>
					</div>
				</div>
				<!-- row -->

				<div class="row">
					<div class="col-12">
						<div class="card">
							<div class="card-header">
								<h6 class="card-title">所有作品集列表</h6>
										

								<a href="#addArticleModal"  class="btn btn-success" style="position:absolute;right:200px;"
									data-toggle="modal" ><i class="material-icons">&#xE147;</i> <span>新增作品集</span></a>		
												<a href="#deletemessage"  class="btn btn-success"
					data-toggle="modal" 		><span>觀看所有留言</span></a>						
<!-- 							step5:欄位		 -->
									
							</div>
							<div class="card-body">
								<div class="table-responsive">
									<table id="example" class="display" style="min-width: 845px">	
										<thead>
											<tr>
												<th>作品編號</th>
												<th>設計師編號</th>
												<th>推文次數</th>
												<th>作品集標題</th>
												<th>作品集內文</th>
												<th>預覽圖片</th>
												<th>發文(更新)時間</th>
												<th>查看留言</th>
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
		<div id="addArticleModal" class="modal fade">
		<div class="modal-dialog" >
		           <!--增加一點寬度  -->
			<div class="modal-content" style="right:200px;width:900px">
				<form id="formdata_add">
					<div class="modal-header">
						<h4 class="modal-title" style="align:center">新增作品集</h4>
						<input type="button" onclick="keyinAll()" value="一鍵輸入">
						<button type="button" class="close" data-dismiss="modal"
							aria-hidden="true">&times;</button>
					</div>
					<div class="modal-body">
						<div class="form-group">
						<input type="hidden" name="portfolio_id"  id="portfolio_id"  class="form-control" 	disabled>
						</div>
						<div class="form-group">
					    <input type="hidden" name="portfolio_like"  id="portfolio_like"  class="form-control" 	disabled>
						</div>
	                    <div class="form-group">
							<label>設計師編號</label> <input name="designer_id" id="designer_id" type="text" class="form-control"
								 required>
						</div>
						<div class="form-group">
							<label>作品集標題</label> <input name="portfolio_title" id="portfolio_title" type="text" class="form-control"
								 required>
						</div>
						<div class="form-group">
							
							
						   	<img id="image_add" alt="尚未選擇圖片" src="" style="height:100%;width:600px;display:none">
							 <input type="hidden"  id="portfolio_image" name="portfolio_image"  disabled>
					
						</div>
						<div class="form-group">
							<label>請選擇檔案</label> <input type="file" id="file" name="file" onchange="loadImageFile_add(event)">
						</div>
						<div class="form-group">
							<label>作品集內文</label>
							<textarea  class="form-control" name="portfolio" id="portfolio" required></textarea>
					
						</div>				
					</div>
					<div class="modal-footer">
						<input id="AddArticleBtn" type="button" onclick="add()" class="btn btn-success" value="新增" data-dismiss="modal">
						<input type="button" class="btn btn-default" data-dismiss="modal"
							value="取消"> 
					</div>
				</form>
			</div>
		</div>
	</div>
	

<!-- step7 編輯的表單		 -->
		
	<div id="editArticleModal" class="modal fade">
		<div class="modal-dialog">
		<!-- 增加一點寬度 -->
			<div class="modal-content" style="right:200px;width:900px" >
				<form id="formdata_edit">
					<div class="modal-header">
						<h4 class="modal-title" style="align:center">修改文章</h4>
						<button type="button" class="close" data-dismiss="modal"
							aria-hidden="true">&times;</button>
					</div>
					<div class="modal-body">
						<div class="form-group">
						<label>作品集編號</label><input name="portfolio_id_edit" id="portfolio_id_edit"  class="form-control" disabled>
						</div>
	                    <div class="form-group">
							<label>設計師編號</label> <input name="designer_id_edit" id="designer_id_edit" type="text" class="form-control"
								 required>
						</div>
						<div class="form-group">
						<label>推文次數</label>
					    <input name="portfolio_like_edit" id="portfolio_like_edit"  class="form-control" 	disabled>
						</div>
						<div class="form-group">
							<label>作品集標題</label> <input name="portfolio_title_edit" id="portfolio_title_edit" type="text" class="form-control"
								 required>
						</div>
						<div class="form-group">
								<img id="image_edit" alt="尚未選擇圖片" src="" style="height:100%;width:600px;">	        	
							 <input type="hidden"  id="portfolio_image_edit" name="portfolio_image_edit" disabled>
						</div>
						<div class="form-group">
							<label>請選擇檔案</label> <input type="file" id="file_edit" name="file_edit" onchange="loadImageFile_edit(event)">
						</div>
						<div class="form-group">
							<label>作品集內文</label>
							<textarea  class="form-control"  name="portfolio_edit" id="portfolio_edit" required></textarea>
						</div>
					</div>
					<div class="modal-footer">
						<input id="editArticleBtn" type="button" onclick="update()" class="btn btn-success" value="修改" data-dismiss="modal">
						<input type="button" class="btn btn-default" data-dismiss="modal"
							value="取消"> 
					</div>
				</form>
			</div>
		</div>
	</div>
	
	<!-- 刪除留言 -->
				
<div id="deletemessage" class="modal fade">
		<div class="modal-dialog">
			<div class="modal-content" style="right:200px;width:900px" >
	
	<div class="row">
					<div class="col-12">
						<div class="card">
							<div class="card-header">
				
							</div>
							<div class="card-body">
								<div class="table-responsive">
									<table id="example1" class="display" style="min-width: 845px">
										<thead>
											<tr>
												<th>留言編號</th>
												<th>文章編號</th>
												<th>使用者</th>
												<th>留言</th>
												<th>留言案讚數</th>
												<th>留言時間</th>
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
	</div>
	
	<!-- ---- -->
	<div id="deletemessageone" class="modal fade">
		<div class="modal-dialog">
			<div class="modal-content" style="right:200px;width:900px" >
	
	<div class="row">
					<div class="col-12">
						<div class="card">
							<div class="card-header">
				
							</div>
							<div class="card-body">
								<div class="table-responsive">
									<table id="example12" class="display" style="min-width: 845px">
										<thead>
											<tr>
												<th>留言編號</th>
												<th>文章編號</th>
												<th>使用者</th>
												<th>留言</th>
												<th>留言案讚數</th>
												<th>留言時間</th>
												<th>刪除</th>
											
											</tr>
										</thead>
										
									</table>
								</div>
							</div>
						</div>
					</div>
				</div>
	
	<!-- ---- -->
		<!-- 增加一點寬度 -->
			
			</div>
		</div>
	</div>
		<!-- 增加一點寬度 -->
			
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
    CKEDITOR.plugins.addExternal("codesnippet", "https://cdnjs.cloudflare.com/ajax/libs/ckeditor/4.7.3/plugins/codesnippet/plugin.js", "");
    CKEDITOR.replace("portfolio", {
    extraPlugins: "codesnippet",
    codeSnippet_theme: "solarized_dark"
    });
    </script>
    <script>
    CKEDITOR.plugins.addExternal("codesnippet", "https://cdnjs.cloudflare.com/ajax/libs/ckeditor/4.7.3/plugins/codesnippet/plugin.js", "");
    CKEDITOR.replace("portfolio_edit", {
    extraPlugins: "codesnippet",
    codeSnippet_theme: "solarized_dark"
    });
    </script>
	<script src="/vendor/global/global.min.js"></script>
	<script src="/js/quixnav-init.js"></script>
	<script src="/js/custom.min.js"></script>
<!--使用這個-->
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@9"></script> 
<!--使用這個-->   
 	<script src="/cdn.jsdelivr.net/npm/sweetalert2@11"></script> 
	<!--<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>-->

	<!-- Datatable -->
	<script src="/vendor/datatables/js/jquery.dataTables.min.js"></script>
	<script src="/js/plugins-init/datatables.init.js"></script>
	<!--  -->


</body>

</html>