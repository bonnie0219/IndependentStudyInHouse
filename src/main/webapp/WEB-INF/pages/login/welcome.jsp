<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Welcome</title>
<script src="https://cdn.bootcss.com/echarts/4.6.0/echarts.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
</head>
<body>
welcome, amigo.${pageContext.request.userPrincipal.name}
${member.member_id}


<a href="/inhouse/logout">前端登出</a>
<a href="/backend/logout">後端登出</a>
<div id="main" style="width: 600px;height:400px;"></div>
<script type="text/javascript">
    // 初始化ECharts组件到id为main的元素上
    $(document).ready(function(){
    var myChart = echarts.init(document.getElementById('main'));
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
        	alert("圖表數據請求失敗");
        	myChart.hideLoading();
        }	
        
    });
    });
</script>

</body>
</html>