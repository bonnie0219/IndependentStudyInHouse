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

<title>專欄管理</title>
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

function selectmessageinone(article_id) {
    $('#example12').DataTable({
        destroy: true,
        "ajax": {
            "url": "/backend/article/selectmessage/"+article_id,
            "type": "POST",
            dataSrc: ''
        },
        //step2:對應你的欄位
   
        "columns": [
        	  {"data": "idam"},
        	  {"data": "article_id"},
	            {"data": "member_name"},
	            {"data": "article_in"},
	            {"data": "articlemember_like"},
	            {"data": "article_intime"},
            {"data": null, defaultContent: "",  orderable : false,},
          
        ],
        
        "createdRow": function (row, data, index) {
     //   $('td', row).eq(6).append($("<a href='#'data-toggle='modal' class='btn btn-warning' onclick='#'>"+data.article_id+"<i class='bi bi-pencil-square'></i></a>"));
        $('td', row).eq(6).append($("<button type='button' class='btn btn-danger' onclick = 'deletemessageone("+data.idam+","+data.article_id+")' ><i class='bi bi-trash'></i></button></td>"));
         }
        
  
    });
}
function deletemessageone(idam,article_id){
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
    	        url: '/backend/article/deletemessageone/'+idam,
    	        type: 'POST',
    	        success: function () {
    	       console.log(article_id);
    	       console.log(idam);
    	       
    	          selectmessageinone(article_id);
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

function alldeletemessageone(idam){
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
    	        url: '/backend/article/deletemessageone/'+idam,
    	        type: 'POST',
    	        success: function () {
    	       console.log(article_id);
    	       console.log(idam);	
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
	
	//所有的留言
	function selectmessage() {
        $('#example1').DataTable({
            destroy: true,
            "ajax": {
                "url": "/backend/article/selectmessage",
                "type": "POST",
                dataSrc: ''
            },
            //step2:對應你的欄位
       
            "columns": [
            	  {"data": "idam"},
            	  {"data": "article_id"},
  	              {"data": "member_name"},
  	              {"data": "article_in"},
  	      //    {"data": null, defaultContent: "",orderable : false,},
  	            {"data": "articlemember_like"},
  	            {"data": "article_intime"},
	            {"data": null, defaultContent: "",  orderable : false,},
            ],
            
            //step3:修改刪除
            "createdRow": function (row, data, index) {
          //  $('td', row).eq(3).append($("<div class='box'><a href='/inhouse/article/articleView/"+data.article_id+"'<p>"+data.article_in.substr(0,14)+"</a></div>"));
         //   $('td', row).eq(6).append($("<a href='#'data-toggle='modal' class='btn btn-warning' onclick='#'>"+data.article_id+"<i class='bi bi-pencil-square'></i></a>"));
            $('td', row).eq(6).append($("<button type='button' class='btn btn-danger'onclick='alldeletemessageone("+data.idam+")'><i class='bi bi-trash'></i></button></td>"));
             }
            
      
        });
    }
	
	//分隔線--------------------------------------
	function datatableFetch() {
        $('#example').DataTable({
            destroy: true,
            "ajax": {
                "url": "/backend/article/all",
                "type": "POST",
                dataSrc: ''
            },
            //step2:對應你的欄位
       
            "columns": [
                {"data": "article_id"},
                {"data": "article_like"},
                {"data": "article_title"},
                {"data": "article_type"},
                {"data": null, defaultContent: "",orderable : false,},
              //  {"data": "article"},
                {"data": "article_image"},
                {"data": "article_time"},
                {"data": null, defaultContent: "",  orderable : false,},
                {"data": null, defaultContent: "",  orderable : false,},
                {"data": null, defaultContent: "",  orderable : false,},
            ],
            
            //step3:修改刪除
            "createdRow": function (row, data, index) {
            //	$('td', row).eq(4).append($("<a href='/backend/article/articleView/'"+data.article_id+""));
            //    $('td', row).eq(4).append($("<a href='#editArticleModal'"));
            //    $('td', row).eq(4).append($("<div class='box'><a href='/backend/article/articleView/"+data.article_id+"'<p>"+data.article.substr(4,16)+"</a></div>"));
                $('td', row).eq(4).append($("<div class='box'><a href='/inhouse/article/articleView/"+data.article_id+"'<p>"+data.article.substr(3,15)+"...</a></div>"));
                $('td', row).eq(7).append($("<a href='#deletemessageone'data-toggle='modal' class='btn btn-outline-primary' onclick='selectmessageinone("+ data.article_id +")'><i class='material-icons'>&#xE147;</i>留言區</a>"));
                $('td', row).eq(8).append($("<a href='#editArticleModal'data-toggle='modal' class='btn btn-warning' onclick='upd("+ data.article_id +")' ><i class='bi bi-pencil-square'></i></a>"));
                $('td', row).eq(9).append($("<button type='button' class='btn btn-danger' onclick = 'deleteArticle("+ data.article_id +")'><i class='bi bi-trash'></i></button></td>"));
               
             },
            
            //step4:圖片	
            "columnDefs":
                [{
                    "targets": 5, //第幾個欄位從0開始
                    "data": 'article_image', //對你欄位名稱
                    "render": function (data, type) {
                        return '<img src="' + data + '" alt="' + data + '"height="50" width="50"/>';}
                    
                },{
                	"targets": [2],//要減少字數的欄位
 	               //   "data": 'article',
 	                  "render": function (data, type, full, meta) {
 	                   console.log('data',data)
 	                      if (data) {
 	                          if (data.length > 1) {
 	                              return data.substr(0,6) + "...";
 	                          }else{
 	                              return data;
 	                          }
 	                      }else {
 	                              return "";
 	                      }
 	                  }
                 
 	              },
 	              {
 	                	"targets": 4,//要減少字數的欄位
 	 	                  "render": function (data, type, full, meta,article_id) {
 	 	                   console.log('data',data)
 	 	                      if (data) {
 	 	                          if (data.length > 1) {
 	 	                         //   return data.substr(0,10) + "...";
 	 	                          return  data.substr(0,16) + "..."+'</a>';
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
	
	function add(){
 		//  var product = {};
 		//  var dynamicURL = "";
 	    //  var TypeName = "";
 	     
	      var statusSuccess="";
	      var statusError="";
	      //---------------------------------------------
	      $('textarea[name=article]').val();
	      CKEDITOR.instances.article.updateElement();
	      $('textarea[name=article_edit]').val();
	      CKEDITOR.instances.article_edit.updateElement();
	      havearticle = $('#article_id').val();
	     
	      article_id = $('#article_id_edit').val();
	      console.log(article_id);
	      
	    //  console.log(data.article_id_edit);
	     	
	     		//save
	     		console.log("======else============");
	     		$("#article_id").prop("disabled",false);
     			$("#article_image").prop("disabled",false);
     			$("#article_like").prop("disabled",false);
     			
	     		var formData = new FormData($("#formdata_add")[0]);
	     		
	     		dynamicURL='/backend/article/add';
	     		TypeName='post';
	//     		statusSuccess="新增成功";
	//     		statusError="新增失敗";
		     	datatableFetch();
	     	
	     	 $.ajax({
	     		 type:'post',
	     		 url:'/backend/article/add',
	     		 data:formData,
	     		 async:false,
	     		 cache:false,
	     		 contentType:false,
     		 	 processData:false,
	     		 success: function(){
	     	 		Swal.fire({icon: 'success',
	                 	 title: '新增成功!',
	                 	  showConfirmButton: false,
	                 	  timer: 1500});
	     		//	 alert(statusSuccess);
	     			datatableFetch();
	     			 reset();
	     		 },
	     		 error: function(){
	     		//	 alert(statusError)
	     		 }
	     	 })

	}
	function update(){
 		//  var product = {};
 		//  var dynamicURL = "";
 	    //  var TypeName = "";
	      var statusSuccess="";
	      var statusError="";
	      //---------------------------------------------
	      $('textarea[name=article]').val();
	      CKEDITOR.instances.article.updateElement();
	      $('textarea[name=article_edit]').val();
	      CKEDITOR.instances.article_edit.updateElement();
	      havearticle = $('#article_id').val();
	     
	      article_id = $('#article_id_edit').val();
	      console.log(article_id);
	      
	    //  console.log(data.article_id_edit);
	     	 if(article_id){
		     	$("#article_id_edit").prop("disabled",false);
		        $("#article_image_edit").prop("disabled",false);
		        $("#article_like_edit").prop("disabled",false); 
		       
		        
	     		
	     		var formData = new FormData($("#formdata_edit")[0]);
	     		console.log(article_id);
	     		console.log(article_id_edit);
	     		$('#article_id_edit').val(null);
	     		
	     		//update
	     		dynamicURL='/backend/article/update/'+ article_id;
	     		TypeName='post';
	     		Swal.fire({icon: 'success',
	                 	 title: '修改成功!',
	                 	  showConfirmButton: false,
	                 	  timer: 1500});
	     //		 alert(statusSuccess);
	     		statusError="修改失敗";
       	     	datatableFetch();
	     		
	     	 }else{
	     		//save
	     		console.log("======else============");
	     		$("#article_id").prop("disabled",false);
     			$("#article_image").prop("disabled",false);
     			$("#article_like").prop("disabled",false);
     			
	     		var formData = new FormData($("#formdata_add")[0]);
	     		dynamicURL='/backend/article/add';
	     		TypeName='post';
	     		statusSuccess="新增成功";
	     		statusError="新增失敗";
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
	 	     		Swal.fire({icon: 'success',
	                 	 title: '修改成功!',
	                 	  showConfirmButton: false,
	                 	  timer: 1500});
	     			datatableFetch();
	     			 reset();
	     		 },
	     		 error: function(){
	     			 alert(statusError)
	     		 }
	     	 })

	}

	function upd(article_id){
		$.ajax({
			url:'/backend/article/query/'+ article_id,
			method:'post',
			dataType:'JSON',
			contentType:'application/json',
			success: function (data){
				console.log(article_id);
				console.log(data.article_id);
				console.log("==================");
				var json = JSON.stringify(data, null, 4);
				console.log(json);
				var article = JSON.parse(json);
				console.log(article.article_id);
				$('#article_id_edit').val(article.article_id);
				$('#article_title_edit').val(article.article_title);
				$('#article_like_edit').val(article.article_like);
				$('#article_type_edit').val(article.article_type);
			    CKEDITOR.instances.article_edit.setData(article.article);
			    $('#article_edit').val(article.article);
			    $('#file_edit').val(article.file);
				$('#article_time_edit').val(article.article_time);
				$('#article_image_edit').val(article.article_image);
				$("#image_edit").attr("src",article.article_image);
				//reset();
			},     
			error: function (){
				alert("修改失敗");
			}

			
		});
	}	
	
	function deleteArticle(article_id) {
        Swal.fire({
            title: "操作確認",
            icon: 'warning',
            text: "您確定要刪除嗎?!",
            showCancelButton: true}).then(function(result) {
           if (result.value) {
        	   Swal.fire({icon: 'success',
              	 title: '文章已經刪除',
              	  showConfirmButton: false,
              	  timer: 1500});
        	   $.ajax({
               url: '/backend/article/delete/' + article_id,
               type: 'POST',
               success: function () {
                   datatableFetch();
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
	function reset(){
		$('#article_id_edit').val('');
		$('#article_like_edit').val('');
		$('#article_title_edit').val('');
		$('#article_type_edit').val('');
		$('#article_edit').val('');
		$('#article_id').val('');
		$('#article_like').val('');
		$('#article_title').val('');
		$('#article_type').val('');
		CKEDITOR.instances.article.setData('');
		$('#article').val('');
		$('#article_image').val('');
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
		$('#article_id').val('');
		$('#article_title').val('居家空間到底該怎麼佈置才能舒服不單調？');
		$('#article_type').val('綜合討論');
		 CKEDITOR.instances.article.setData('高機動性的拉門設計，常常是維持空間感的秘訣，在靈活滑動之間，造就隱現自如的格局型態。西班牙設計工作室 <a href="https://zooco.es/en/portfolio_page/pacos-house/" class="link2c" target="_blank">Zooco Estudio</a>  所分享的作品案例，即以滑門突破種種限制，取得開放與私隱的平衡點。<br><br><img src="https://decomyplace.com/img/blog/210518_zooco_1.jpg"><br><br>毫無斷點的穿透佈局，源自團隊簡化了各項設計元素，僅以石與木體現純粹二元形式，通過天然材料降低一切感官干擾，同步圍築一方明淨ㄇ形窗框，盛納一幅馬德里的城市天際光景。<br><br><img src="https://decomyplace.com/img/blog/210518_zooco_2.jpg"><br><br>串接樓梯同步導入懸浮設計，淨空視線迎來輕透感受，甫至二樓，將門扇全數採以置頂木拉門呈現，使寢室、廚房與衛浴退隱其後，搭配玻璃扶手創造純淨空氣感，依隨著生活自由調移住家輪廓。<br><br><img src="https://decomyplace.com/img/blog/210518_zooco_3.jpg"><br><br><img src="https://decomyplace.com/img/blog/210518_zooco_4.jpg"><br><br><img src="https://decomyplace.com/img/blog/210518_zooco_5.gif"><br><br><img src="https://decomyplace.com/img/blog/210518_zooco_6.jpg"><br><br><img src="https://decomyplace.com/img/blog/210518_zooco_7.jpg"><br><br><img src="https://decomyplace.com/img/blog/210518_zooco_8.jpg"><br><br><img src="https://decomyplace.com/img/blog/210518_zooco_9.gif"><br><br><img src="https://decomyplace.com/img/blog/210518_zooco_10.jpg"><br><br><img src="https://decomyplace.com/img/blog/210518_zooco_11.gif">');
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
						</div>
					</div>
					<div
						class="col-sm-6 p-md-0 justify-content-sm-end mt-2 mt-sm-0 d-flex">
						<ol class="breadcrumb">
							<li class="breadcrumb-item"><a href="javascript:void(0)">首頁</a></li>
							<li class="breadcrumb-item active"><a
								href="javascript:void(0)">專欄管理</a></li>
		
						</ol>
					</div>
				</div>
				<!-- row -->

				<div class="row">
					<div class="col-12">
						<div class="card">
							<div class="card-header">
								<h6 class="card-title">所有文章列表</h6>
										

								<a href="#addArticleModal"  class="btn btn-success" style="position:absolute;right:200px;"
									data-toggle="modal" ><i class="material-icons">&#xE147;</i> <span>新增文章</span></a>		
												<a href="#deletemessage"  class="btn btn-success"
					data-toggle="modal" 		><span>觀看所有留言</span></a>						
<!-- 							step5:欄位		 -->
									
							</div>
							<div class="card-body">
								<div class="table-responsive">
									<table id="example" class="display" style="min-width: 845px">	
										<thead>
											<tr>
												<th>文章編號</th>
												<th>推文次數</th>
												<th>文章標題</th>
												<th>文章類型</th>
												<th>內文</th>
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
						<h4 class="modal-title" style="align:center">新增文章</h4>
						<input type="button" onclick="keyinAll()" value="一鍵輸入">
						<button type="button" class="close" data-dismiss="modal"
							aria-hidden="true">&times;</button>
					</div>
					<div class="modal-body">
						<div class="form-group">
						<input type="hidden" name="article_id"  id="article_id"  class="form-control" 	disabled>
						</div>
						<div class="form-group">
					    <input type="hidden" name="article_like"  id="article_like"  class="form-control" 	disabled>
						</div>
						<div class="form-group">
							<label>文章標題</label> <input name="article_title" id="article_title" type="text" class="form-control"
								 required>
						</div>
						<div class="form-group">
							<label>文章類型</label> <select class="form-control form-control-sm"
								name="article_type" id="article_type" required>								
				<option value="綜合討論">綜合討論</option>
				<option value="客戶分享">客戶分享</option>
				<option value="名人推薦">名人推薦</option>				
							</select>
						</div>
						<div class="form-group">
							
							
						   	<img id="image_add" alt="尚未選擇圖片" src="" style="height:100%;width:600px;display:none">
							 <input type="hidden"  id="article_image" name="article_image"  disabled>
					
						</div>
						<div class="form-group">
							<label>請選擇檔案</label> <input type="file" id="file" name="file" onchange="loadImageFile_add(event)">
						</div>
						<div class="form-group">
							<label>內文</label>
							<textarea  class="form-control" name="article" id="article" required></textarea>
					
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
						<label>ID</label><input name="article_id_edit" id="article_id_edit"  class="form-control" disabled>
						</div>
						<div class="form-group">
						<label>Like</label>
					    <input name="article_like_edit" id="article_like_edit"  class="form-control" 	disabled>
						</div>
						<div class="form-group">
							<label>文章標題</label> <input name="article_title_edit" id="article_title_edit" type="text" class="form-control"
								 required>
						</div>
						<div class="form-group">
							<label>文章類型</label> <select class="form-control form-control-sm"
								name="article_type_edit" id="article_type_edit" required>
								<option value=""></option>
				<option value="綜合討論">綜合討論</option>
				<option value="客戶分享">客戶分享</option>
				<option value="名人推薦">名人推薦</option>
				
							</select>
						</div>
						<div class="form-group">
								<img id="image_edit" alt="尚未選擇圖片" src="" style="height:100%;width:600px;">	        	
							 <input type="hidden"  id="article_image_edit" name="article_image_edit" disabled>
						</div>
						<div class="form-group">
							<label>請選擇檔案</label> <input type="file" id="file_edit" name="file_edit" onchange="loadImageFile_edit(event)">
						</div>
						<div class="form-group">
							<label>內文</label>
							<textarea  class="form-control"  name="article_edit" id="article_edit" required></textarea>
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
    CKEDITOR.replace("article", {
    extraPlugins: "codesnippet",
    codeSnippet_theme: "solarized_dark"
    });
    </script>
    <script>
    CKEDITOR.plugins.addExternal("codesnippet", "https://cdnjs.cloudflare.com/ajax/libs/ckeditor/4.7.3/plugins/codesnippet/plugin.js", "");
    CKEDITOR.replace("article_edit", {
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