<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="Furniture Shop Html Template">
    <meta name="author" content="">
    <meta name="generator" content="Jekyll">
    <title>輪盤遊戲</title>
    <link rel="icon" href="/images/logo.ico" type="image/x-icon">
    <style>
        body,ul,ol,li,p,h1,h2,h3,h4,h5,h6,form,fieldset,table,td,img,div{margin:0;padding:0;border:0;}
        body{color:#333; font-size:12px;font-family:"Microsoft YaHei"}
        ul,ol{list-style-type:none;}
        select,input,img,select{vertical-align:middle;}
        input{ font-size:12px;}
        a{ text-decoration:none; color:#000;}
        a:hover{color:#c00; text-decoration:none;}
        .clear{clear:both;}

        /* 大转盘样式 */
        .banner{display:block;width:35%;margin-left:auto;margin-right:auto;margin-bottom: 20px;}
        .banner .turnplate{display:block;width:100%;position:relative;}
        .banner .turnplate canvas.item{width:100%;}
        .banner .turnplate img.pointer{position:absolute;width:31.5%;height:42.5%;left:34.6%;top:23%;}

    </style>



<link rel="stylesheet" href="/vendors/fontawesome-pro-5/css/all.css">
<link rel="stylesheet" href="/vendors/bootstrap-select/css/bootstrap-select.min.css">
<link rel="stylesheet" href="/vendors/slick/slick.min.css">
<link rel="stylesheet" href="/vendors/magnific-popup/magnific-popup.min.css">
<link rel="stylesheet" href="/vendors/jquery-ui/jquery-ui.min.css">
<link rel="stylesheet" href="/vendors/animate.css">
<link rel="stylesheet" href="/vendors/mapbox-gl/mapbox-gl.min.css">

<link rel="stylesheet" href="/css/themes.css">

    <link rel="icon" href="/images/favicon.ico">
    <meta name="twitter:card" content="summary">
    <meta name="twitter:site" content="@">
    <meta name="twitter:creator" content="@">
    <meta name="twitter:title" content="Home 01">
    <meta name="twitter:description" content="Furniture Shop Html Template">
    <meta name="twitter:image" content="/images/logo_01.png">

</head>
<body id="123">
    





<!--123-->

<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>   



    <img src="https://i.ibb.co/NWwK6t1/1.png" id="shan-img" style="display:none;" />
    <img src="https://i.ibb.co/FY8gstm/2.png" id="sorry-img" style="display:none;" />
    <div class="banner">
        <div class="turnplate" style="background-image:url(https://i.ibb.co/XDJmvHn/turnplate-bg.png);background-size:100% 100%;">
            <canvas class="item" id="wheelcanvas" width="422px" height="422px"></canvas>
            <img class="pointer" src="/images/開始.png"/>  <!-- 開始抽獎 -->
        </div>
    </div>
    
<!--     <div style="text-align:center"><button style="color:green;height:40px;width:140" > 回首頁</button></div> -->
 <div style="text-align:center"> <a href="/inhouse/ProfilesCoupon"><button type="button" class="btn btn-outline-secondary" style="border: 1px solid yellow; margin: 10px; width: 250px; text-align:center; color:yellow;font-size:25px">回優惠券管理</button></a></div>
  
  
  
<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
<script src="js/jquery.min.js"></script>
<script>


$('#123').css("background-image","url(/images/背景.jpg)");

//123
$(document).ready(function(){
	datatableFetch();
	});
	
	function datatableFetch() {
        $('#example').DataTable({ 
            destroy: true, 
            "ajax": {
             //   "url": "/backend/coupon/member2",
             url:'http://localhost:8080/inhouse/all/${member.member_id}' ,
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





    (function($) {
    var supportedCSS,styles=document.getElementsByTagName("head")[0].style,toCheck="transformProperty WebkitTransform OTransform msTransform MozTransform".split(" ");
    for (var a=0;a<toCheck.length;a++) if (styles[toCheck[a]] !== undefined) supportedCSS = toCheck[a];
    // Bad eval to preven google closure to remove it from code o_O
    // After compresion replace it back to var IE = 'v' == '\v'
    var IE = eval('"v"=="\v"');

    jQuery.fn.extend({
        rotate:function(parameters)
        {
            if (this.length===0||typeof parameters=="undefined") return;
                if (typeof parameters=="number") parameters={angle:parameters};
            var returned=[];
            for (var i=0,i0=this.length;i<i0;i++)
                {
                    var element=this.get(i);	
                    if (!element.Wilq32 || !element.Wilq32.PhotoEffect) {

                        var paramClone = $.extend(true, {}, parameters); 
                        var newRotObject = new Wilq32.PhotoEffect(element,paramClone)._rootObj;

                        returned.push($(newRotObject));
                    }
                    else {
                        element.Wilq32.PhotoEffect._handleRotation(parameters);
                    }
                }
                return returned;
        },
        getRotateAngle: function(){
            var ret = [];
            for (var i=0,i0=this.length;i<i0;i++)
                {
                    var element=this.get(i);	
                    if (element.Wilq32 && element.Wilq32.PhotoEffect) {
                        ret[i] = element.Wilq32.PhotoEffect._angle;
                    }
                }
                return ret;
        },
        stopRotate: function(){
            for (var i=0,i0=this.length;i<i0;i++)
                {
                    var element=this.get(i);	
                    if (element.Wilq32 && element.Wilq32.PhotoEffect) {
                        clearTimeout(element.Wilq32.PhotoEffect._timer);
                    }
                }
        }
    });

    // Library agnostic interface

    Wilq32=window.Wilq32||{};
    Wilq32.PhotoEffect=(function(){

        if (supportedCSS) {
            return function(img,parameters){
                img.Wilq32 = {
                    PhotoEffect: this
                };
                
                this._img = this._rootObj = this._eventObj = img;
                this._handleRotation(parameters);
            }
        } else {
            return function(img,parameters) {
                // Make sure that class and id are also copied - just in case you would like to refeer to an newly created object
                this._img = img;

                this._rootObj=document.createElement('span');
                this._rootObj.style.display="inline-block";
                this._rootObj.Wilq32 = 
                    {
                        PhotoEffect: this
                    };
                img.parentNode.insertBefore(this._rootObj,img);
                
                if (img.complete) {
                    this._Loader(parameters);
                } else {
                    var self=this;
                    // TODO: Remove jQuery dependency
                    jQuery(this._img).bind("load", function()
                    {
                        self._Loader(parameters);
                    });
                }
            }
        }
    })();

    Wilq32.PhotoEffect.prototype={
        _setupParameters : function (parameters){
            this._parameters = this._parameters || {};
            if (typeof this._angle !== "number") this._angle = 0 ;
            if (typeof parameters.angle==="number") this._angle = parameters.angle;
            this._parameters.animateTo = (typeof parameters.animateTo==="number") ? (parameters.animateTo) : (this._angle); 

            this._parameters.step = parameters.step || this._parameters.step || null;
            this._parameters.easing = parameters.easing || this._parameters.easing || function (x, t, b, c, d) { return -c * ((t=t/d-1)*t*t*t - 1) + b; }
            this._parameters.duration = parameters.duration || this._parameters.duration || 1000;
            this._parameters.callback = parameters.callback || this._parameters.callback || function(){};
            if (parameters.bind && parameters.bind != this._parameters.bind) this._BindEvents(parameters.bind); 
        },
        _handleRotation : function(parameters){
            this._setupParameters(parameters);
            if (this._angle==this._parameters.animateTo) {
                this._rotate(this._angle);
            }
            else { 
                this._animateStart();          
            }
        },

        _BindEvents:function(events){
            if (events && this._eventObj) 
            {
                // Unbinding previous Events
                if (this._parameters.bind){
                    var oldEvents = this._parameters.bind;
                    for (var a in oldEvents) if (oldEvents.hasOwnProperty(a)) 
                            // TODO: Remove jQuery dependency
                            jQuery(this._eventObj).unbind(a,oldEvents[a]);
                }

                this._parameters.bind = events;
                for (var a in events) if (events.hasOwnProperty(a)) 
                    // TODO: Remove jQuery dependency
                        jQuery(this._eventObj).bind(a,events[a]);
            }
        },

        _Loader:(function()
        {
            if (IE)
            return function(parameters)
            { 
                var width=this._img.width;     
                var height=this._img.height;
                this._img.parentNode.removeChild(this._img);
                                 
                this._vimage = this.createVMLNode('image');
                this._vimage.src=this._img.src;
                this._vimage.style.height=height+"px";
                this._vimage.style.width=width+"px";
                this._vimage.style.position="absolute"; // FIXES IE PROBLEM - its only rendered if its on absolute position!
                this._vimage.style.top = "0px";
                this._vimage.style.left = "0px";

                /* Group minifying a small 1px precision problem when rotating object */
                this._container =  this.createVMLNode('group');
                this._container.style.width=width;
                this._container.style.height=height;
                this._container.style.position="absolute";
                this._container.setAttribute('coordsize',width-1+','+(height-1)); // This -1, -1 trying to fix ugly problem with small displacement on IE
                this._container.appendChild(this._vimage);
                
                this._rootObj.appendChild(this._container);
                this._rootObj.style.position="relative"; // FIXES IE PROBLEM
                this._rootObj.style.width=width+"px";
                this._rootObj.style.height=height+"px";
                this._rootObj.setAttribute('id',this._img.getAttribute('id'));
                this._rootObj.className=this._img.className;			
                this._eventObj = this._rootObj;	
                this._handleRotation(parameters);	
            }
            else
            return function (parameters)
            {
                this._rootObj.setAttribute('id',this._img.getAttribute('id'));
                this._rootObj.className=this._img.className;
                
                this._width=this._img.width;
                this._height=this._img.height;
                this._widthHalf=this._width/2; // used for optimisation
                this._heightHalf=this._height/2;// used for optimisation
                
                var _widthMax=Math.sqrt((this._height)*(this._height) + (this._width) * (this._width));

                this._widthAdd = _widthMax - this._width;
                this._heightAdd = _widthMax - this._height;	// widthMax because maxWidth=maxHeight
                this._widthAddHalf=this._widthAdd/2; // used for optimisation
                this._heightAddHalf=this._heightAdd/2;// used for optimisation
                
                this._img.parentNode.removeChild(this._img);	
                
                this._aspectW = ((parseInt(this._img.style.width,10)) || this._width)/this._img.width;
                this._aspectH = ((parseInt(this._img.style.height,10)) || this._height)/this._img.height;
                
                this._canvas=document.createElement('canvas');
                this._canvas.setAttribute('width',this._width);
                this._canvas.style.position="relative";
                this._canvas.style.left = -this._widthAddHalf + "px";
                this._canvas.style.top = -this._heightAddHalf + "px";
                this._canvas.Wilq32 = this._rootObj.Wilq32;
                
                this._rootObj.appendChild(this._canvas);
                this._rootObj.style.width=this._width+"px";
                this._rootObj.style.height=this._height+"px";
                this._eventObj = this._canvas;
                
                this._cnv=this._canvas.getContext('2d');
                this._handleRotation(parameters);
            }
        })(),

        _animateStart:function()
        {	
            if (this._timer) {
                clearTimeout(this._timer);
            }
            this._animateStartTime = +new Date;
            this._animateStartAngle = this._angle;
            this._animate();
        },
        _animate:function()
        {
            var actualTime = +new Date;
            var checkEnd = actualTime - this._animateStartTime > this._parameters.duration;

            // TODO: Bug for animatedGif for static rotation ? (to test)
            if (checkEnd && !this._parameters.animatedGif) 
            {
                clearTimeout(this._timer);
            }
            else 
            {
                if (this._canvas||this._vimage||this._img) {
                    var angle = this._parameters.easing(0, actualTime - this._animateStartTime, this._animateStartAngle, this._parameters.animateTo - this._animateStartAngle, this._parameters.duration);
                    this._rotate((~~(angle*10))/10);
                }
                if (this._parameters.step) {
                    this._parameters.step(this._angle);
                }
                var self = this;
                this._timer = setTimeout(function()
                        {
                        self._animate.call(self);
                        }, 10);
            }

            // To fix Bug that prevents using recursive function in callback I moved this function to back
            if (this._parameters.callback && checkEnd){
                this._angle = this._parameters.animateTo;
                this._rotate(this._angle);
                this._parameters.callback.call(this._rootObj);
            }
        },

        _rotate : (function()
        {
            var rad = Math.PI/180;
            if (IE)
            return function(angle)
            {
                this._angle = angle;
                this._container.style.rotation=(angle%360)+"deg";
            }
            else if (supportedCSS)
            return function(angle){
                this._angle = angle;
                this._img.style[supportedCSS]="rotate("+(angle%360)+"deg)";
            }
            else 
            return function(angle)
            {
                this._angle = angle;
                angle=(angle%360)* rad;
                // clear canvas	
                this._canvas.width = this._width+this._widthAdd;
                this._canvas.height = this._height+this._heightAdd;
                            
                // REMEMBER: all drawings are read from backwards.. so first function is translate, then rotate, then translate, translate..
                this._cnv.translate(this._widthAddHalf,this._heightAddHalf);	// at least center image on screen
                this._cnv.translate(this._widthHalf,this._heightHalf);			// we move image back to its orginal 
                this._cnv.rotate(angle);										// rotate image
                this._cnv.translate(-this._widthHalf,-this._heightHalf);		// move image to its center, so we can rotate around its center
                this._cnv.scale(this._aspectW,this._aspectH); // SCALE - if needed ;)
                this._cnv.drawImage(this._img, 0, 0);							// First - we draw image
            }

        })()
    }

    if (IE)
    {
    Wilq32.PhotoEffect.prototype.createVMLNode=(function(){
    document.createStyleSheet().addRule(".rvml", "behavior:url(#default#VML)");
            try {
                !document.namespaces.rvml && document.namespaces.add("rvml", "urn:schemas-microsoft-com:vml");
                return function (tagName) {
                    return document.createElement('<rvml:' + tagName + ' class="rvml"/>');//嘗試斜線 尋找標籤格式
                };
            } catch (e) {
                return function (tagName) {
                    return document.createElement('<' + tagName + ' xmlns="urn:schemas-microsoft.com:vml" class="rvml"/>');
                };
            }		
    })();
    }
    })(jQuery);console.log("\u002f\u002a\u002a\u002a\u002a\u002a\u002a\u002a\u002a\u002a\u002a\u002a\u002a\u002a\u002a\u002a\u002a\u002a\u002a\u002a\u002a\u002a\u002a\u002a\u002a\u002a\u002a\u002a\u002a\u002a\u002a\u002a\u002a\u002a\u002a\u002a\u002a\u002a\u002a\u002a\u002a\u002a\u002a\u002a\u002a\u002a\u002a\u002a\u002a\u002a\u002a\u002a\u002a\u002a\u002a\u002a\u002a\u002a\u002a\u002a\u002a\u002a\u002a\u002a\u002a\u000d\u000a\u0020\u002a\u0009\u0009\u0009\u0009\u0009\u0009\u0009\u0009\u0009\u0009\u0009\u0009\u0009\u0009\u0009\u0009\u002a\u0009\u0009\u000d\u000a\u0020\u002a\u0020\u0009\u0009\u0009\u0009\u0009\u0009\u0020\u0020\u0020\u0020\u0020\u0020\u4ee3\u7801\u5e93\u0009\u0009\u0009\u0009\u0009\u0009\u0009\u002a\u000d\u000a\u0020\u002a\u0020\u0020\u0020\u0020\u0020\u0020\u0020\u0020\u0020\u0020\u0020\u0020\u0020\u0020\u0020\u0020\u0020\u0020\u0020\u0020\u0020\u0020\u0020\u0020\u0077\u0077\u0077\u002e\u0064\u006d\u0061\u006b\u0075\u002e\u0063\u006f\u006d\u0009\u0009\u0009\u0009\u0009\u0009\u0009\u002a\u000d\u000a\u0020\u002a\u0020\u0020\u0020\u0020\u0020\u0020\u0020\u0009\u0009\u0020\u0020\u52aa\u529b\u521b\u5efa\u5b8c\u5584\u3001\u6301\u7eed\u66f4\u65b0\u63d2\u4ef6\u4ee5\u53ca\u6a21\u677f\u0009\u0009\u0009\u002a\u000d\u000a\u0020\u002a\u0020\u0009\u0009\u0009\u0009\u0009\u0009\u0009\u0009\u0009\u0009\u0009\u0009\u0009\u0009\u0009\u0009\u002a\u000d\u000a\u002a\u002a\u002a\u002a\u002a\u002a\u002a\u002a\u002a\u002a\u002a\u002a\u002a\u002a\u002a\u002a\u002a\u002a\u002a\u002a\u002a\u002a\u002a\u002a\u002a\u002a\u002a\u002a\u002a\u002a\u002a\u002a\u002a\u002a\u002a\u002a\u002a\u002a\u002a\u002a\u002a\u002a\u002a\u002a\u002a\u002a\u002a\u002a\u002a\u002a\u002a\u002a\u002a\u002a\u002a\u002a\u002a\u002a\u002a\u002a\u002a\u002a\u002a\u002a\u002f");


    // 從這裡開始
    var turnplate={
            restaraunts:[],				//大转盘奖品名称
            colors:[],					//大转盘奖品区块对应背景颜色
            outsideRadius:192,			//大转盘外圆的半径
            textRadius:155,				//大转盘奖品位置距离圆心的距离
            insideRadius:68,			//大转盘内圆的半径
            startAngle:0,				//开始角度
            bRotate:false				//false:停止;ture:旋转
    };

    $(document).ready(function(){
        //动态添加大转盘的奖品与奖品区域背景颜色
        turnplate.restaraunts = ["折扣券A", "折價券", "感謝參與", "折扣券A", "贈禮金", "折價券", "折扣券B", "贈禮金", "感謝參與", "折扣券B"];
        turnplate.colors = ["#FFF4D6", "#FFFFFF", "#FFF4D6", "#FFFFFF","#FFF4D6", "#FFFFFF", "#FFF4D6", "#FFFFFF","#FFF4D6", "#FFFFFF"];
        
        
        var rotateTimeOut = function (){
            $('#wheelcanvas').rotate({
                angle:0,
                animateTo:2160,
                duration:8000,
                callback:function (){
                    alert('網路超時，請檢查網路是否通順！');
                }
            });
        };

        //旋转转盘 item:奖品位置; txt：提示语;
        var rotateFn = function (item, txt){
            var angles = item * (360 / turnplate.restaraunts.length) - (360 / (turnplate.restaraunts.length*2));
            if(angles<270){
                angles = 270 - angles; 
            }else{
                angles = 360 - angles + 270;
            }
            $('#wheelcanvas').stopRotate();
            $('#wheelcanvas').rotate({
                angle:0,
                animateTo:angles+1800,
                duration:8000,
                callback:function (){
                  //  alert(txt);
                    Swal.fire(txt);
                    turnplate.bRotate = !turnplate.bRotate;

                    // if(txt=="測試1"){
                    //     console.log("123:"+123)

                    // }
                    // else if(txt=="測試2"){
                    //     console.log("123:"+123)

                    // }
                    // else if(txt=="測試3"){
                    //     console.log("123:"+123)

                    // }
                    // else if(txt=="測試4"){
                    //     console.log("123:"+123)

                    // }
                    // else{
                    //     console.log("456:"+123)
                    // }
//123
switch (txt) {  
             case "折扣券A":
                 
            	 
            	 $('#coupon_name').val("沙發打5折");
 			    $('#coupon_rule').val("凡購買沙發類商品，該商品5折");
 			    $('#coupon_type').val("折扣券");
 			    $('#coupon_status').val("未啟用");
 			    $('#coupon_starttime').val("1911-02-06");
 			    $('#coupon_endtime').val("1911-02-08")
 			    $('#coupon_count').val("1");
 			    $('#coupon_addtime').val("1911-02-06");
 			    $('#coupon_photo').val("/coupon/沙發打5折.png");
 			  //  $('#file').val("");			   
 			    $('#member').val(${member.member_id});
            	 
 			   add()
            	 
          //   alert('新增成功') 
              break;
              case "折扣券B" :
            	  
            	  $('#coupon_name').val("沙發打6折");
   			    $('#coupon_rule').val("凡購買沙發類商品，該商品6折");
   			    $('#coupon_type').val("折扣券");
   			    $('#coupon_status').val("未啟用");
   			    $('#coupon_starttime').val("1911-02-06");
   			    $('#coupon_endtime').val("1911-02-08")
   			    $('#coupon_count').val("1");
   			    $('#coupon_addtime').val("1911-02-06");
   			    $('#coupon_photo').val("/coupon/沙發打6折.png");
   			//    $('#file').val("");			   
   			    $('#member').val(${member.member_id});
              	 
   			   add()
            	  
            	  
            	  
            //  alert('新增成功') 
              break;
              
              case "折價券" :  
            	  
            	  $('#coupon_name').val("桌子折扣50元");
     			    $('#coupon_rule').val("凡購買桌子類商品，該商品折價50元");
     			    $('#coupon_type').val("折價券");
     			    $('#coupon_status').val("未啟用");
     			    $('#coupon_starttime').val("1911-02-06");
     			    $('#coupon_endtime').val("1911-02-08")
     			    $('#coupon_count').val("1");
     			    $('#coupon_addtime').val("1911-02-06");
     			    $('#coupon_photo').val("/coupon/桌子折扣50元.png");
     			//    $('#file').val("");			   
     			    $('#member').val(${member.member_id});
                	 
     			   add()  
            	  
            	  
                //  alert('新增成功')  
                  break;
                  
              case "贈禮金" :  
            	  
            	  $('#coupon_name').val("100元禮金");
   			    $('#coupon_rule').val("新會員享有任一訂單折100元優惠一次");
   			    $('#coupon_type').val("會員贈禮");
   			    $('#coupon_status').val("未啟用");
   			    $('#coupon_starttime').val("1911-02-06");
   			    $('#coupon_endtime').val("1911-02-08")
   			    $('#coupon_count').val("1");
   			    $('#coupon_addtime').val("1911-02-06");
   			    $('#coupon_photo').val("/coupon/會員贈禮.png");
   			//    $('#file').val("");			   
   			    $('#member').val(${member.member_id});
              	 
   			   add()  
             //     alert('新增成功')  
                  break;    
   			   
// 				case "測試5" :  
            	  
//             	  $('#coupon_name').val("任一訂單折100元");
//    			    $('#coupon_rule').val("新會員享有任一訂單折100元優惠一次");
//    			    $('#coupon_type').val("會員贈禮");
//    			    $('#coupon_status').val("未啟用");
//    			    $('#coupon_starttime').val("1911-02-06");
//    			    $('#coupon_endtime').val("1911-02-08")
//    			    $('#coupon_count').val("1");
//    			    $('#coupon_addtime').val("1911-02-06");
//    			    $('#coupon_photo').val("/coupon/會員贈禮.png");
//    			    $('#file').val("");			   
//    			    $('#member').val("1");
              	 
//    			   add()  
//                   alert('新增成功')  
//                   break;   
   			   
// 				case "測試6" :  
	  
// 	 	 $('#coupon_name').val("任一訂單折100元");
// 	    $('#coupon_rule').val("新會員享有任一訂單折100元優惠一次");
// 	    $('#coupon_type').val("會員贈禮");
// 	    $('#coupon_status').val("未啟用");
// 	    $('#coupon_starttime').val("1911-02-06");
// 	    $('#coupon_endtime').val("1911-02-08")
// 	    $('#coupon_count').val("1");
// 	    $('#coupon_addtime').val("1911-02-06");
// 	    $('#coupon_photo').val("/coupon/會員贈禮.png");
// 	    $('#file').val("");			   
// 	    $('#member').val("1");
	 
// 	   add()  
//     alert('新增成功')  
//     break;   

//     case "測試7" :  
	  
// 	 	 $('#coupon_name').val("任一訂單折100元");
// 	    $('#coupon_rule').val("新會員享有任一訂單折100元優惠一次");
// 	    $('#coupon_type').val("會員贈禮");
// 	    $('#coupon_status').val("未啟用");
// 	    $('#coupon_starttime').val("1911-02-06");
// 	    $('#coupon_endtime').val("1911-02-08")
// 	    $('#coupon_count').val("1");
// 	    $('#coupon_addtime').val("1911-02-06");
// 	    $('#coupon_photo').val("/coupon/會員贈禮.png");
// 	    $('#file').val("");			   
// 	    $('#member').val("1");
	 
// 	   add()  
//     alert('新增成功')  
//     break;   

//     case "測試8" :  
	  
// 	 	 $('#coupon_name').val("任一訂單折100元");
// 	    $('#coupon_rule').val("新會員享有任一訂單折100元優惠一次");
// 	    $('#coupon_type').val("會員贈禮");
// 	    $('#coupon_status').val("未啟用");
// 	    $('#coupon_starttime').val("1911-02-06");
// 	    $('#coupon_endtime').val("1911-02-08")
// 	    $('#coupon_count').val("1");
// 	    $('#coupon_addtime').val("1911-02-06");
// 	    $('#coupon_photo').val("/coupon/會員贈禮.png");
// 	    $('#file').val("");			   
// 	    $('#member').val("1");
	 
// 	   add()  
//     alert('新增成功')  
//     break;   
//     case "測試9" :  
	  
// 	 	 $('#coupon_name').val("任一訂單折100元");
// 	    $('#coupon_rule').val("新會員享有任一訂單折100元優惠一次");
// 	    $('#coupon_type').val("會員贈禮");
// 	    $('#coupon_status').val("未啟用");
// 	    $('#coupon_starttime').val("1911-02-06");
// 	    $('#coupon_endtime').val("1911-02-08")
// 	    $('#coupon_count').val("1");
// 	    $('#coupon_addtime').val("1911-02-06");
// 	    $('#coupon_photo').val("/coupon/會員贈禮.png");
// 	    $('#file').val("");			   
// 	    $('#member').val("1");
	 
// 	   add()  
//     alert('新增成功')  
//     break;   
              
              default:
            //  alert('新增失敗')
                      }

//
                }
            });
        };


       



        //

        $('.pointer').click(function (){
            if(turnplate.bRotate)return;
            turnplate.bRotate = !turnplate.bRotate;
            //获取随机数(奖品个数范围内)
            var item = rnd(1,turnplate.restaraunts.length);
            //奖品数量等于10,指针落在对应奖品区域的中心角度[252, 216, 180, 144, 108, 72, 36, 360, 324, 288]
            rotateFn(item, turnplate.restaraunts[item-1]);
            console.log(item);
        });
    });

    function rnd(n, m){
        var random = Math.floor(Math.random()*(m-n+1)+n);
        return random;
        
    }



     //123
     function add()
 			    { 
		     		//save	     		
		     		
		     		 console.log("123=123")
		     		
// 		     		$("#coupon_id").prop("disabled",false);
// 	     			$("#coupon_photo").prop("disabled",false);	     		
		     		var formData = new FormData($("#formdata_add")[0]);
			     //	datatableFetch();
		     	    $.ajax({ 
		     		 type:'post', 
		     		// url:'/backend/coupon/add2',
		     		url:'/inhouse/add2',
		     		 data:formData, 
		     		 async:false, 
		     		 cache:false, 
		     		 //contentType:'application/json;charset=utf-8',
		     		 contentType:false,  
	     		 	 processData:false, 
		     		 success: function(){
		     			// alert("新增成功");
		     			Swal.fire("新增成功");
		     	//		datatableFetch();
		     	//		 reset();  
		     		 },
		     		 error: function(){
		     			// alert("新增失敗")
		     			Swal.fire("新增失敗");
		     		 }
		     	 })

		}


    //页面所有元素加载完毕后执行drawRouletteWheel()方法对转盘进行渲染
    window.onload=function(){
        drawRouletteWheel();
    };

    function drawRouletteWheel() {    
    var canvas = document.getElementById("wheelcanvas");    
    if (canvas.getContext) {
        //根据奖品个数计算圆周角度
        var arc = Math.PI / (turnplate.restaraunts.length/2);
        var ctx = canvas.getContext("2d");
        //在给定矩形内清空一个矩形
        ctx.clearRect(0,0,422,422);
        //strokeStyle 属性设置或返回用于笔触的颜色、渐变或模式  
        ctx.strokeStyle = "#FFBE04";
        //font 属性设置或返回画布上文本内容的当前字体属性
        ctx.font = '16px Microsoft YaHei';      
        for(var i = 0; i < turnplate.restaraunts.length; i++) {       
            var angle = turnplate.startAngle + i * arc;
            ctx.fillStyle = turnplate.colors[i];
            ctx.beginPath();
            //arc(x,y,r,起始角,结束角,绘制方向) 方法创建弧/曲线（用于创建圆或部分圆）    
            ctx.arc(211, 211, turnplate.outsideRadius, angle, angle + arc, false);    
            ctx.arc(211, 211, turnplate.insideRadius, angle + arc, angle, true);
            ctx.stroke();  
            ctx.fill();
            //锁画布(为了保存之前的画布状态)
            ctx.save();   
            
            //----绘制奖品开始----
            ctx.fillStyle = "#E5302F";
            var text = turnplate.restaraunts[i];
            var line_height = 17;
            //translate方法重新映射画布上的 (0,0) 位置
            ctx.translate(211 + Math.cos(angle + arc / 2) * turnplate.textRadius, 211 + Math.sin(angle + arc / 2) * turnplate.textRadius);
            
            //rotate方法旋转当前的绘图
            ctx.rotate(angle + arc / 2 + Math.PI / 2);
            
            /** 下面代码根据奖品类型、奖品名称长度渲染不同效果，如字体、颜色、图片效果。(具体根据实际情况改变) **/
            if(text.indexOf("M")>0){//流量包
                var texts = text.split("M");
                for(var j = 0; j<texts.length; j++){
                    ctx.font = j == 0?'bold 20px Microsoft YaHei':'16px Microsoft YaHei';
                    if(j == 0){
                        ctx.fillText(texts[j]+"M", -ctx.measureText(texts[j]+"M").width / 2, j * line_height);
                    }else{
                        ctx.fillText(texts[j], -ctx.measureText(texts[j]).width / 2, j * line_height);
                    }
                }
            }else if(text.indexOf("M") == -1 && text.length>6){//奖品名称长度超过一定范围 
                text = text.substring(0,6)+"||"+text.substring(6);
                var texts = text.split("||");
                for(var j = 0; j<texts.length; j++){
                    ctx.fillText(texts[j], -ctx.measureText(texts[j]).width / 2, j * line_height);
                }
            }else{
                //在画布上绘制填色的文本。文本的默认颜色是黑色
                //measureText()方法返回包含一个对象，该对象包含以像素计的指定字体宽度
                ctx.fillText(text, -ctx.measureText(text).width / 2, 0);
            }
            
            //添加对应图标
            if(text.indexOf("闪币")>0){
                var img= document.getElementById("shan-img");
                img.onload=function(){  
                    ctx.drawImage(img,-15,10);      
                }; 
                ctx.drawImage(img,-15,10);  
            }else if(text.indexOf("謝謝參加")>=0){
                var img= document.getElementById("sorry-img");
                img.onload=function(){  
                    ctx.drawImage(img,-15,10);      
                };  
                ctx.drawImage(img,-15,10);  
            }
            //把当前画布返回（调整）到上一个save()状态之前 
            ctx.restore();
            //----绘制奖品结束----
        }     
    } 
    }

</script>

<section>
    
    <!-- 123 -->
	<!-- step6 新增的表單		 -->
		<div id="addCouponModal" class="modal fade"> <!--modal fade-->
			<div class="modal-dialog">
				<div class="modal-content">
					<form id="formdata_add">
						<div class="modal-header">
							<h4 class="modal-title" style="align: center">新增優惠券</h4>
							<button type="button" class="close" data-dismiss="modal" value="${member.member_id}"
								aria-hidden="true">&times;</button>
						</div>
						<div class="modal-body">
							<div class="form-group">
								<label>編號</label> <input name="coupon_id" id="coupon_id"
									type="text" class="form-control" disabled>
							</div>
							<div class="form-group">
								<label>名稱</label> <input name="coupon_name" id="coupon_name"
									type="text" class="form-control" required>
							</div>

							<div class="form-group">
								<label>規則</label> <input name="coupon_rule" id="coupon_rule"
									type="text" class="form-control" required>
							</div>

							<div class="form-group">
								<label>類型</label> <input name="coupon_type" id="coupon_type"
									type="text" class="form-control" required>
							</div>

							<div class="form-group">
								<label>狀態</label> <input name="coupon_status" id="coupon_status"
									type="text" class="form-control" required>
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
									type="text" class="form-control" required>
							</div>

							<div class="form-group">
								<label>創立時間</label> <input name="coupon_addtime"
									id="coupon_addtime" type="date" class="form-control" required>
							</div>



							<div class="form-group">
								<label>圖片</label> <input type="text" id="coupon_photo"
									name="coupon_photo" >
							</div>
							<div class="form-group">
								<label>請選擇檔案</label> <input type="file" id="file" name="file">
							</div>

	
								
		
								<div class="form-group">
								<label>會員ID</label> <input name="member" id="member"
									type="text" class="form-control" >
							</div>		

						</div>
						<div class="modal-footer">
							<input id="AddCouponBtn" type="button" onclick="add()"
								class="btn btn-success" value="新增" data-dismiss="modal">
							<input type="button" class="btn btn-default" data-dismiss="modal"
								value="取消">
						</div>
					</form>
				</div>
			</div>
		</div>
    
    
    
    
    </section>


<!-- 取捨 -->
<!-- <footer class="pt-10 pb-9 footer bg-color-2"> -->
<!--     <div class="container container-xxl"> -->
<!--         <div class="row"> -->
<!--             <div class="col-lg mb-6 mb-lg-0"> -->
<!--                 <a href="#" class="footer-logo d-block" style="width: 120px ;"><img src="/images/logo.png" alt="Furnitor"></a> -->
<!--             </div> -->
<!--             <div class="col-sm-８ col-lg mb-８ mb-md-0"> -->
<!--                 <ul class="list-unstyled"> -->
<!--                     <li class="py-0"><a href="#" class="lh-213">關於我們</a> </li> -->
<!--                     <li class="py-0"><a href="#" class="lh-213">網站地圖</a> </li> -->
<!--                     <li class="py-0"><a href="#" class="lh-213">電話：(03)4257387</a> </li> -->
<!--                     <li class="py-0"><a href="#" class="lh-213">地址：320桃園市中壢區中大路300號 國立中央大學</a> </li> -->
<!--                     <li class="py-0"><a href="#" class="lh-213">(工程二館側面/資策會大樓)</a> </li> -->
<!--                 </ul> -->
<!--             </div> -->
<!--             <div class="col-sm-８ col-lg mb-８ mb-md-0"> -->
<!--                 <ul class="list-unstyled"> -->
<!--                     <li class="py-0"><a href="#" class="lh-213">第六組</a> </li> -->
<!--                     <li class="py-0"><a href="#" class="lh-213">組　長：李岳蓁</a> </li> -->
<!--                     <li class="py-0"><a href="#" class="lh-213">技術長：王淳弘</a> </li> -->
<!--                     <li class="py-0"><a href="#" class="lh-213">組　員：邱若綺</a> </li> -->
<!--                     <li class="py-0"><a href="#" class="lh-213">　　　　江彥勳</a> </li> -->
<!--                     <li class="py-0"><a href="#" class="lh-213">　　　　徐璟文</a> </li> -->
<!--                     <li class="py-0"><a href="#" class="lh-213">　　　　陳俊源</a> </li> -->
<!--                 </ul> -->
<!--             </div> -->
<!--                 <div class="col-sm-1 col-lg mb-1 mb-md-0"> -->
<!--                     <ul class="list-unstyled"> -->
<!--                     </ul> -->
<!--                 </div> -->
<!--                 <div class="col-sm-1 col-lg mb-1 mb-md-0"> -->
<!--                     <ul class="list-unstyled"> -->
<!--                     </ul> -->
<!--                 </div> -->
<!--                 <div class="col-sm-8 col-lg mb-8 mb-md-0"> -->
<!--                     <ul class="list-unstyled"> -->
<!--                     </ul> -->
<!--                 </div> -->
<!--             <div class="col-sm-6 col-lg"> -->
<!--                 <ul class="list-inline text-lg-right"> -->
<!--                     <li class="list-inline-item mr-4"><a href="#" class="fs-20"><i -->
<!--                                 class="fab fa-pinterest-p"></i></a></li> -->
<!--                     <li class="list-inline-item mr-4"><a href="#" class="fs-20"><i -->
<!--                                 class="fab fa-facebook-f"></i></a></li> -->
<!--                     <li class="list-inline-item mr-4"><a href="#" class="fs-20"><i class="fab fa-instagram"></i></a> -->
<!--                     </li> -->
<!--                     <li class="list-inline-item"><a href="#" class="fs-20"><i class="fab fa-twitter"></i></a></li> -->
<!--                 </ul> -->
<!--                 <p class="mb-0 text-gray text-lg-right">&copy; 2021.InHouse  -->
<!-- <!--                     <a　target="_blank" href="https://sc.chinaz.com/moban/">&#x7F51;&#x9875;&#x6A21;&#x677F;</a></p> --> 
<!--             </div> -->
<!--         </div> -->
<!--     </div> -->
<!-- </footer> -->

<!--刪掉就沒有反黃問題-->
<!-- <script src="/vendors/jquery-ui/jquery-ui.min.js"></script>
<script src="/vendors/bootstrap/bootstrap.bundle.js"></script>
<script src="/vendors/bootstrap-select/js/bootstrap-select.min.js"></script>
<script src="/vendors/slick/slick.min.js"></script>
<script src="/vendors/waypoints/jquery.waypoints.min.js"></script>
<script src="/vendors/counter/countUp.js"></script>
<script src="/vendors/magnific-popup/jquery.magnific-popup.min.js"></script>
<script src="/vendors/hc-sticky/hc-sticky.min.js"></script>
<script src="/vendors/jparallax/TweenMax.min.js"></script>
<script src="/vendors/mapbox-gl/mapbox-gl.js"></script> -->


<!-- <script src="/js/theme.js"></script> -->
    	

<!--以下DIV可嘗試刪-->
    <div class="position-fixed pos-fixed-bottom-right p-6 z-index-10">
        <a href="#"
            class="gtf-back-to-top bg-white text-primary hover-white bg-hover-primary shadow p-0 w-52px h-52 rounded-circle fs-20 d-flex align-items-center justify-content-center"
            title="Back To Top"><i class="fal fa-arrow-up"></i></a>
    </div>
    <div class="canvas-sidebar cart-canvas">
        <div class="canvas-overlay">
        </div>
        <form class="h-100">
            <div class="card border-0 pt-5 pb-7 h-100">
                <div class="px-6 text-right">
                    <span class="canvas-close d-inline-block fs-24 mb-1 ml-auto lh-1 text-primary"><i
                            class="fal fa-times"></i></span>
                </div>
                <div class="card-header bg-transparent py-0 px-6">
                    <h3 class="fs-24 mb-5">
                        Your Cart
                    </h3>
                    <p class="fs-15 text-primary"><span class="d-inline-block mr-2 fs-14"><i
                                class="far fa-check-circle"></i></span>
                        Your cart is saved for the next <span class="font-weight-500">4m34s</span></p>
                </div>
                <div class="card-body px-6 pt-7 overflow-y-auto">
                    <div class="mb-6 d-flex">
                        <a href="#" class="d-block mr-4"><i class="fal fa-times"></i></a>
                        <div class="media">
                            <div class="w-70px mr-4">
                                <img src="/images/cart-01.jpg" alt="Partridge Bar Stool">
                            </div>
                            <div class="media-body">
                                <p class="text-muted fs-12 mb-0 text-uppercase letter-spacing-05 lh-1 mb-1">chairs</p>
                                <a href="#" class="font-weight-bold mb-3 d-block">Partridge Bar Stool</a>
                                <div class="d-flex align-items-center">
                                    <div class="input-group position-relative">
                                        <a href="#" class="down position-absolute pos-fixed-left-center pl-2"><i
                                                class="far fa-minus"></i></a>
                                        <input type="number" class="w-100px px-6 text-center" value="1">
                                        <a href="#" class="up position-absolute pos-fixed-right-center pr-2"><i
                                                class="far fa-plus"></i>
                                        </a>
                                    </div>
                                    <p class="mb-0 ml-12 text-primary">$1250.00</p>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="mb-6 d-flex">
                        <a href="#" class="d-block mr-4"><i class="fal fa-times"></i></a>
                        <div class="media">
                            <div class="w-70px mr-4">
                                <img src="/images/cart-02.jpg" alt="Partridge Bar Stool">
                            </div>
                            <div class="media-body">
                                <p class="text-muted fs-12 mb-0 text-uppercase letter-spacing-05 lh-1 mb-1">Table</p>
                                <a href="#" class="font-weight-bold mb-3 d-block">Partridge Round Bar</a>
                                <div class="d-flex align-items-center">
                                    <div class="input-group position-relative">
                                        <a href="#" class="down position-absolute pos-fixed-left-center pl-2"><i
                                                class="far fa-minus"></i></a>
                                        <input type="number" class="w-100px px-6 text-center number" value="1">
                                        <a href="#" class="up position-absolute pos-fixed-right-center pr-2"><i
                                                class="far fa-plus"></i>
                                        </a>
                                    </div>
                                    <p class="mb-0 ml-12 text-primary">$1250.00</p>
                                </div>
                            </div>
                        </div>
                    </div>
                    <p class="fs-15 text-primary pt-1">
                        <span class="d-inline-block mr-2 fs-14"><i class="fas fa-info-circle"></i></span>
                        Special instruction for seller
                    </p>
                </div>
                <div class="card-footer mt-auto border-0 bg-transparent px-6 pb-0 pt-5">
                    <div class="d-flex align-items-center mb-4">
                        <span class="font-weight-bold text-primary">Subtotal</span>
                        <span class="d-block ml-auto text-primary">$2000.00</span>
                    </div>
                    <input type="text" class="form-control w-100 text-primary mb-4"
                        placeholder="Enter coupon code here">
                    <input type="submit" class="btn btn-primary btn-block mb-2" value="Check Out">
                    <a href="#" class="d-block fs-14 text-uppercase letter-spacing-05 text-center font-weight-bold">View
                        Cart</a>
                </div>
            </div>
        </form>
    </div>

 <!-- 首頁搜尋的地方 -->
 <div class="mfp-hide search-popup mfp-with-anim" id="search-popup">
    <form>
        <div class="input-group position-relative">
            <div class="input-group-prepend d-none d-md-block">
                <select class="selectpicker" name="category" id="region-01"
                    data-style="btn-lg letter-spacing-0 border-0 border-bottom border-2x bg-transparent text-white border-white fs-24 pl-0 shadow-none text-capitalize font-weight-normal">
                    <option value="" selected>所有商品</option>
                    <option value="chairs">桌椅系列</option>
                    <option value="stands">沙發系列</option>
                    <option value="tables">床架系列</option>
                    <option value="accessory">收納系列</option>
                    <option value="accessory">相關商品</option>
                </select>
            </div>
            <input type="text" id="keyword" name="keyword"
                class="form-control border-0 border-bottom border-2x bg-transparent text-white border-white fs-24 form-control-lg"
                placeholder="請輸入想尋找的商品名稱">
            <div class="input-group-append position-absolute pos-fixed-right-center">
                <button class="input-group-text bg-transparent border-0 text-white fs-30 px-0 btn-lg"
                    type="submit"><i class="far fa-search"></i></button>
            </div>
        </div>
    </form>
</div>

 <!-- 網頁縮小之後的功能列 -->
 <div class="sidenav canvas-sidebar bg-white">
    <div class="canvas-overlay">
    </div>
    <div class="pt-5 pb-7 card border-0 h-100">
        <div class="d-flex align-items-center card-header border-0 py-0 pl-8 pr-7 mb-9 bg-transparent">
            <a href="index.html" class="d-block w-52px">
                <img src="/images/short_logo.png" alt="Furnitor">
            </a>
            <span class="canvas-close d-inline-block text-right fs-24 ml-auto lh-1 text-primary"><i
                    class="fal fa-times"></i></span>
        </div>
        <div class="overflow-y-auto pb-6 pl-8 pr-7 card-body pt-0">
            <ul class="navbar-nav main-menu px-0">
                <li aria-haspopup="true" aria-expanded="false" class="nav-item dropdown py-1 px-0">
                    <a class="nav-link dropdown-toggle p-0" href="#" data-toggle="dropdown">
                        關於
                        <span class="caret"></span>
                    </a>
                    <ul class="dropdown-menu pt-3 pb-0 pb-xl-3">
                        <li class="dropdown-item">
                            <a class="dropdown-link" href="#">
                                品牌故事
                            </a>
                        </li>
                        <li class="dropdown-item">
                            <a class="dropdown-link" href="#">
                                社會責任
                            </a>
                        </li>
                        <li class="dropdown-item">
                            <a class="dropdown-link" href="#">
                                企業理念
                            </a>
                        </li>
                        <li class="dropdown-item">
                            <a class="dropdown-link" href="#">
                                相關影片
                            </a>
                        </li>
                        <li class="dropdown-item">
                            <a class="dropdown-link" href="#">
                                直營門市
                            </a>
                        </li>
                    </ul>
                </li>
                <li aria-haspopup="true" aria-expanded="false" class="nav-item dropdown py-1 px-0">
                    <a class="nav-link dropdown-toggle p-0" href="#" data-toggle="dropdown">
                        最新消息
                        <span class="caret"></span>
                    </a>
                    <ul class="dropdown-menu pt-3 pb-0 pb-xl-3">
                        <li class="dropdown-item">
                            <a class="dropdown-link" href="#">
                                活動訊息(優惠券)
                            </a>
                        </li>
                        <li class="dropdown-item">
                            <a class="dropdown-link" href="#">
                                新聞
                            </a>
                        </li>
                        <li class="dropdown-item">
                            <a class="dropdown-link" href="#">
                                相關連結
                            </a>
                        </li>
                    </ul>
                </li>
                <li aria-haspopup="true" aria-expanded="false" class="nav-item dropdown py-1 px-0">
                    <a class="nav-link p-0" href="#">
                        設計師簡介
                        <span class="caret"></span>
                    </a>
                </li>
                <li aria-haspopup="true" aria-expanded="false" class="nav-item dropdown py-1 px-0">
                    <a class="nav-link p-0" href="#">
                        作品集
                        <span class="caret"></span>
                    </a>
                </li>
                <li aria-haspopup="true" aria-expanded="false" class="nav-item dropdown py-1 px-0">
                    <a class="nav-link dropdown-toggle p-0" href="#" data-toggle="dropdown">
                        精選專欄
                        <span class="caret"></span>
                    </a>
                    <ul class="dropdown-menu pt-3 pb-0 pb-xl-3">
                        <li class="dropdown-item">
                            <a class="dropdown-link" href="#">
                                客戶心得分享
                            </a>
                        </li>
                        <li class="dropdown-item">
                            <a class="dropdown-link" href="#">
                                名人推薦
                            </a>
                        </li>
                    </ul>
                </li>
                <li aria-haspopup="true" aria-expanded="false" class="nav-item dropdown py-1 px-0">
                    <a class="nav-link dropdown-toggle p-0" href="#" data-toggle="dropdown">
                        服務流程
                        <span class="caret"></span>
                    </a>
                    <ul class="dropdown-menu pt-3 pb-0 pb-xl-3">
                        <li class="dropdown-item">
                            <a class="dropdown-link" href="#">
                                流程介紹
                            </a>
                        </li>
                        <li class="dropdown-item">
                            <a class="dropdown-link" href="#">
                                專案合作
                            </a>
                        </li>
                        <li class="dropdown-item">
                            <a class="dropdown-link" href="#">
                                預約(表單)
                            </a>
                        </li>
                    </ul>
                </li>
                <li aria-haspopup="true" aria-expanded="false" class="nav-item dropdown py-1 px-0">
                    <a class="nav-link p-0" href="#">
                        預約服務
                        <span class="caret"></span>
                    </a>
                </li>
                <li aria-haspopup="true" aria-expanded="false" class="nav-item dropdown py-1 px-0">
                    <a class="nav-link dropdown-toggle p-0" href="store.html" data-toggle="dropdown">
                        商品
                        <span class="caret"></span>
                    </a>
                    <!-- <div class="dropdown-menu p-0 dropdown-menu-listing x-animated x-fadeInUp">

                        <h4 class="dropdown-header text-dark fs-16 my-3">
                            Shop Pages
                        </h4>

                        <div class="dropdown-item">
                            <a class="dropdown-link" href="shop-page-01.html">
                                Shop Layout <sup>V1</sup>
                            </a>
                        </div>

                        <h4 class="dropdown-header text-dark fs-16 my-3">
                            Product Page
                        </h4>

                        <div class="dropdown-item">
                            <a class="dropdown-link" href="product-page-01.html">
                                Product Layout <sup>V1</sup>
                            </a>
                        </div>
                        <div class="dropdown-item">
                            <a class="dropdown-link" href="product-page-02.html">
                                Product Layout <sup>V2</sup>
                            </a>
                        </div>

                        <h4 class="dropdown-header text-dark fs-16 my-3">
                            Product Type
                        </h4>

                        <div class="dropdown-item">
                            <a class="dropdown-link" href="product-page-03.html">
                                Product Simple
                            </a>
                        </div>
                        <div class="dropdown-item">
                            <a class="dropdown-link" href="product-page-02.html">
                                Product Variable (Color/Size/etc.)
                            </a>
                        </div>
                        <div class="dropdown-item">
                            <a class="dropdown-link" href="product-page-07.html">
                                Product Time Limit
                            </a>
                        </div>
                        <div class="dropdown-item">
                            <a class="dropdown-link" href="product-page-06.html">
                                Product Grouped
                            </a>
                        </div>
                        <div class="dropdown-item">
                            <a class="dropdown-link" href="product-page-09.html">
                                Product External / Affiliate
                            </a>
                        </div>
                        <h4 class="dropdown-header text-dark fs-16 my-3">
                            Shop Page
                        </h4>

                        <div class="dropdown-item">
                            <a class="dropdown-link" href="cart.html">
                                Cart
                            </a>
                        </div>
                        <div class="dropdown-item">
                            <a class="dropdown-link" href="compare.html">
                                Compare
                            </a>
                        </div>
                        <div class="dropdown-item">
                            <a class="dropdown-link" href="stores.html">
                                Store
                            </a>
                        </div>
                        <div class="dropdown-item">
                            <a class="dropdown-link" href="wishlist.html">
                                Wishlist
                            </a>
                        </div>
                    </div> -->
                </li>
            </ul>
        </div>
<!-- <div class="card-footer bg-transparent border-0 mt-auto pl-8 pr-7 pb-0 pt-4">
                <ul class="list-inline d-flex align-items-center mb-3">
                    <li class="list-inline-item mr-4"><a href="#" class="fs-20 lh-1"><i
                                class="fab fa-pinterest-p"></i></a>
                    </li>
                    <li class="list-inline-item mr-4"><a href="#" class="fs-20 lh-1"><i
                                class="fab fa-facebook-f"></i></a></li>
                    <li class="list-inline-item mr-4"><a href="#" class="fs-20 lh-1"><i
                                class="fab fa-instagram"></i></a></li>
                    <li class="list-inline-item"><a href="#" class="fs-20 lh-1"><i class="fab fa-twitter"></i></a></li>
                </ul>
                <p class="mb-0 text-gray">Copyright &copy; 2021.Company name All rights reserved.<a target="_blank"
                        href="https://sc.chinaz.com/moban/">&#x7F51;&#x9875;&#x6A21;&#x677F;</a></p>
            </div> -->
        </div>
    </div>
    
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@9"></script> 
</body>
</html>