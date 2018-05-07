<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<html>
<head>
    <title>摇一摇</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no"/>
    <jsp:include page="../../common.jsp"></jsp:include>
    <style>
    * { margin: 0; padding: 0; }
    /****************绿色方舟摇一摇***************/
.lsfzyao{background: url(weixin/images/bg_choujiang.png) no-repeat;background-size:100%;}
img.lsfz_logo,.lsfz_titimg img{width:65%;margin-top:6px;}
.lsfz_titimg,.lsfz_zjimg{text-align: center;padding-top:30px;}
.lsfz_yaoyiyao img{width:80%;}
.lsfz_yaoyiyao{text-align: center;padding-top:10px;}

.digle{position: absolute;display:none;top:50%;left:50%;width:300px;height:310px;margin-left:-150px;margin-top:-150px;background-color: #8BC35E;border-radius:8px;}
.digle p{text-align: center;padding-left:10px;padding-right: 10px;font-size: 22px;color:#fff;padding-top:10px; }
.digle p input{margin-bottom: 0px;color:#000}
.digle a{background-color: #6EC6DC;color:#fff;display: inline-block;width:70%;padding-top:6px;padding-bottom:6px;border-radius:8px;}

.lsfz_zjimg img{width:90%;margin-top:10px;}
.msgerr{text-align:center;color:#ff0000 !important;font-size:16px !important;}

.opensh a{background-color: #5BC758;color:#fff;display: inline-block;width:50%;padding-top:20px;padding-bottom:20px;border-radius:8px;}
.opensh p{text-align:center;margin-top:80px;}
    
    </style> 
</head>

<body>
     <div class="content lsfzyao">
        <div id="wrapper">
	<div id="scroller" class="opensh">
		<p><a id="startButton">开始游戏</a></p>
		<p><a id="subButton">再来一轮</a></p>
 	</div>
 	</div>
 	 
    <script>
    var brandId="gh_8d5f9c073de7";
    /**
    	再来一轮startButton
    **/
    $("#subButton").on("click",function(){
    	var add=$.Params.create();
    	add.addParams("brandId",brandId);
    	add.ajax(getIP()+"gameshakeprize.action?updatelsfzPrize",function(data){
    		if(data.success){
    			alert("设置成功！");
    		}
    	})
    })
    
    /**
    	开启活动
    **/
    $("#startButton").on("click",function(){
    	var add=$.Params.create();
    	add.addParams("brandId",brandId);
    	add.ajax(getIP()+"gameshakeprize.action?startGame",function(data){
    		if(data.success){
    			alert("设置成功！");
    		}
    	})
    })
    </script>

</body>
</html>