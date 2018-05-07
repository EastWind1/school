<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<!DOCTYPE>
<html>
  <head>
	<title>在线面对面</title>
	<meta charset="UTF-8"/>
	 <!--<meta name="viewport" content="initial-scale=1, maximum-scale=1, user-scalable=no, minimal-ui">
    <meta name="apple-mobile-web-app-capable" content="yes">-->
    <!--<meta name="apple-mobile-web-app-status-bar-style" content="black">-->
    	
	<meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1,maximum-scale=1,user-scalable=no" />
	<!--<link href="https://cdn.bootcss.com/ratchet/2.0.2/css/ratchet.min.css" rel="stylesheet">-->
	<link rel="stylesheet" type="text/css" href="../../common/css/ratchet.min.css"/>
	<link rel="stylesheet" type="text/css" href="../css/animate.css"/>
	<style type="text/css">
		/*清零*/
		body,ul,ol,li,p,h1,h2,h3,h4,h5,h6,form,fieldset,table,td,img,div,dl,dt,dd,input{margin:0;padding:0;}
		body,html{ font-size: 62.5%;}
		img{border:none;}
		li{list-style:none;}
		input,select,textarea{outline:none;}
		textarea{resize:none;}
		a{text-decoration:none; outline:none;}
		ul{ margin: 0; padding: 0;}
		.navigate-right:after,
		.push-right:after{ content: "";}/*清除右边三角*/
		.bgTouming{background-color: transparent !important;}
		.bgTouming li{ border-bottom: 1px solid #0088CC;}
		.qesList{background-color: transparent!important; border: none; background: #fff !important; padding: 1% 0;}
		.qesList li{  padding: 11px 30px;}   /*如果有问题，去掉padding*/
		.qesList li img{ width: 5%;}
		/*主体*/
		.content{ background: url(../images/beijing2.png) left top no-repeat; background-size: cover;}
		.qesList{ margin:2% 26% 0 1%}
		
		/*顶部*/
		.qesHead{ 
	    padding: 10px 0;
	    color: #fff;
	    background: transparent !important;
	    border: none;
	    position: relative;
		}
		.qesHead p:first{ margin-top: 10px;}
		.qesHead p{ 
			min-width: 500px;
			text-align: center; 
			font-size: 3.6rem !important; 
			color: #fff; 
			margin-bottom: 5px;
			/*-webkit-box-reflect: below 0 -webkit-gradient(linear, left top, left bottom, from(transparent), to(rgba(255, 255, 255, 0.31)));*/
		}
		.qesHead span{
			width: 200px; 
			height: 200px;
			line-height: 200px; 
			display: inline-block; 
			vertical-align: middle; 
			font-size: 1.8rem;
		}
		.qesHead img{
			width: 316px; 
			height: auto;  
			background-size: contain; 
			vertical-align: middle;
		}
		/*用户昵称*/
		.qesNickname{ font-size: 1.6rem !important; color: #507EB1;}
		.qesNickname span{ font-size: 2.3rem; display: block; color: #FF0000;}
		/*问题*/
		.qesConten{font-size: 2.5rem; font-weight: bold; padding: 8px 0;background-color: #fff; color:#000;line-height:28px;}
		
		
		@font-face {
			font-family: 'hwxk';
	    src: url(../font/hwxk.ttf); /* IE9*/
	    /*src: url(../font/华文行楷.eot?#iefix') format('embedded-opentype'), /* IE6-IE8 */
	    /*url(../font/华文行楷.woff') format('woff'), /* chrome、firefox */
	}
	
	
	.iconfont{
    font-family:"hwxk" !important;
    font-style:normal;
    -webkit-font-smoothing: antialiased;
    -webkit-text-stroke-width: 0.2px;
    -moz-osx-font-smoothing: grayscale;
    }
    
 /*---滚动条默认显示样式--*/  
::-webkit-scrollbar-thumb{  
   background-color:#fff;  
   height:50px;  
   outline-offset:0px;  
   outline:0px solid #ccc;  
   -webkit-border-radius:4px;  
   border: 0px solid #ccc;  
}  
 
/*---鼠标点击滚动条显示样式--*/  
::-webkit-scrollbar-thumb:hover{  
   background-color:#FB4446;  
   height:50px;  
   -webkit-border-radius:1px;  
}  
 
/*---滚动条大小--*/  
::-webkit-scrollbar{  
   width:0px;  
   height:8px;  
}  
 
/*---滚动框背景样式--*/  
::-webkit-scrollbar-track-piece{  
   background-color:#fff;  
   -webkit-border-radius:0;  
}
	</style>
  	</head>
  	<body>
	<div class="content qesMain">
  <img src="../images/beijing_yiyao.jpg" style="position: fixed; right: 1%; top: 35%; width: 220px !important; height: 220px !important;">
				<div style="position: fixed; right: 0; top: 66%; width: 220px !important; height: 220px !important;">
				<p style="font-size: 1.8rem; padding: 10px 0; text-align: center; color: #fff;">
	    		<span class="iconfont">云</span>
	    		<span style="font-size: 1.5rem;">ICU</span> · <span class="iconfont">我的</span>
	    		<span style="font-size: 1.5rem;">ICU</span>
	   	</p>
				</div>
				<div class="card qesHead">
					<!--<img src="../images/ICU_logo.png" alt="加载失败" />
					<span>云ICU · 我的ICU</span>-->
					<div style="padding-top: 10px; float: left; line-height: 30px;overflow: hidden;">
						<img src="../images/left_logo.png" style="/* float: left; */width: 240px;/* height: 100px; */">
						<p style="padding-top: 4%;text-align: center;">ICU 镇静中美国际论坛</p>
						<p style="text-align: center;font-size: 2rem !important;">CHINA-U.S FORUM OF SEDATION IN ICU</p>
					</div>
					<div style="margin-right: 0%; float: right; position: relative;/* overflow: hidden; */">
						<img src="../images/right_logo.png">
  					
					</div>
				</div>
				<div class="card qesList" style="overflow: scroll;height: 480px;">
					<ul class="table-view bgTouming" id="qesList">
					  
					</ul>
				</div>
		    <p style="font-size: 1.8rem; padding: 5px 0; text-align: center; color: #fff;">
		    		<span style="font-size: 1.5rem;">2015.9.16</span>
		    		<span style="font-size: 1.5rem;">中国</span>
		    	  <span style="font-size: 1.5rem;">北京</span>
		   	</p>
		   	<p style="font-size: 1.8rem;  text-align: center; color: #fff;">
		   			<span style="font-size: 1.5rem;">16 setp 2015</span>
		    		<span style="font-size: 1.5rem;">BeiJing</span>
		    	  <span style="font-size: 1.5rem;">China</span>
		   	</p>
		    </div>
	    <!--<script src="http://libs.baidu.com/jquery/1.11.1/jquery.min.js" type="text/javascript" charset="utf-8"></script>-->
	    <script src="../../common/jquery-1.9.1.min.js" type="text/javascript" charset="utf-8"></script>
	    <script src="../../common/ian.js" type="text/javascript" charset="utf-8"></script>
	   	<script src="../../js/getIp.js" type="text/javascript" charset="utf-8"></script>
	    <script type="text/javascript">

	    	getData();
	    	
	    	
	    	var startInterval;
	    	clearInterval(startInterval);
	    	startInterval=setInterval("getData()",3000);
//	    	var count=10;
//		    var clickNum=0;
//		    var preClikNum=0;
//		  	var pageNum=$("#qesList li").length/10;
//				var pageNum=0;
	    	
//	    	$(".qesList").on("click",next);
//	    	
//	    	function next(){
//	    		if(pageNum-clickNum==1 && pageNum>=clickNum){
//	    				return false;	
//	    		}else{
//	    				clickNum+=1;
//							$("#qesList li").hide();
//							$("#qesList li").slice(count,count+10).show().addClass("bounceInDown animated");
//							
//			    		if($("#qesList li").length%10>1){
//			    			pageNum=Math.ceil($("#qesList li").length/10);
//			    		}
//	    			
//	    			count+=10;
//	    		}
//	    	}
//	    		
//	    	
//	    	$(".qesHead").on("click",prev);
//	    	
//	    	
//	    	function prev(){
//	    		if(preClikNum>=pageNum || count==10){
//	    				return false;	
//	    		}else{
//	    				preClikNum+=1;
//			    		$("#qesList li").hide();
//							$("#qesList li").slice(count-20,count).show().addClass("bounceInDown animated");
//	    				count-=10;
//	    				$(".qesList").on("click",next);
//		   		}
//	    	}
	    	
	    	function getData(){
					var p=$.Params.create();
					p.ajax(getIP()+"questiontable.action?sel",function(data){
						var html="";
						$.each(data.rows,function(i,val){	
						 var headimg=val.imgUrl;
						 if(headimg == "" || headimg == null){
							headimg=getIP()+"data/expert/default.jpg";
						 }
						    html+="<li class='table-view-cell media'>"+
					      		  "<img class='media-object pull-left' src='"+headimg+"'>"+
					      			"<div class='media-body qesNickname'><span>"+val.nickName+"</span><p class='qesConten'>【"+val.filed2+"】"+val.question+"</p></li>"; 	
						})
						$("#qesList").html(html);
						//$("#qesList li").hide();
						//$("#qesList li").slice(0,count).show();
					})
				}
	    </script>
	</body>
	<style>
		
/*---滚动条默认显示样式--*/  
::-webkit-scrollbar-thumb{  
   background-color:#fff;  
   height:50px;  
   outline-offset:0px;  
   outline:0px solid #ccc;  
   -webkit-border-radius:4px;  
   border: 0px solid #ccc;  
}  
 
/*---鼠标点击滚动条显示样式--*/  
::-webkit-scrollbar-thumb:hover{  
   background-color:#FB4446;  
   height:50px;  
   -webkit-border-radius:1px;  
}  
 
/*---滚动条大小--*/  
::-webkit-scrollbar{  
   width:0px;  
   height:8px;  
}  
 
/*---滚动框背景样式--*/  
::-webkit-scrollbar-track-piece{  
   background-color:#fff;  
   -webkit-border-radius:0;  
}
		
	</style>
</html>