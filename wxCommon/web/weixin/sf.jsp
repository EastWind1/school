<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<html><head>
    <title></title>
    <style type="text/css">
        div.pinch-zoom,
        div.pinch-zoom img{
            width: 100%;
            -webkit-user-drag: none;
        }

    </style>
    <link rel="stylesheet" href="style.css">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
    <meta name="apple-mobile-web-app-capable" content="yes">
    
    <!-- pinchzoom requires: jquery and underscore -->
    <script type="text/javascript" src="../common/jquery-1.9.1.min.js"></script>
     <script type="text/javascript" src="../common/ian.js"></script>
     <script type="text/javascript" src="../js/getIp.js"></script>
    <script type="text/javascript" src="../weixin/js/underscore.js"></script>
    <script type="text/javascript" src="../weixin/js/pinchzoom.js"></script>
    <script type="text/javascript">
        $(function () {
            $('div.pinch-zoom').each(function () {
                new RTP.PinchZoom($(this), {});
            });
            function GetQueryString(name){
			    var reg = new RegExp("(^|&)"+ name +"=([^&]*)(&|$)");
			    var r = window.location.search.substr(1).match(reg);
			    if (r!=null) {
			    	return unescape(r[2]);
			    }else{
			    	return null;
			    }
			}
			var type=GetQueryString("type");
			var imname=GetQueryString("imgname");
			var id=GetQueryString("id");//附件id
			var orderId=GetQueryString("orderId");
			if(id=="0"){//专家查看医师预约详情的时候，不能删除病例，所以隐藏删除按钮
				$("#delbutton").hide();
			}
			if(type == "1"){//样版
				$("#imgname").attr("src","images/"+imname+".png");
				$("#delbutton").hide();
			}else if(type == "2"){
			//alert();
				var remark=window.localStorage.getItem("remarkCon");
				$("#remark").html(remark);
				$("#imgname").attr("src","../data/order/"+imname);
			}
			$("#delbutton").on("click",function(){
				if(confirm("确定要删除吗!")){
				var del=$.Params.create();
				del.addParams("id",id);
				del.addParams("filed5","0");
				del.ajax(getIP()+"medicalRecord.action?update",function(data){
					if(data.success){
						window.location.href="order/orderDetail.jsp?id="+orderId;
						}

					})
			}

				})
			//alert(type+""+imname);
        })
    </script>
</head>
<body>

    <div class="page">
        <div class="pinch-zoom-container" style="overflow: hidden; position: relative;">
        <div class="pinch-zoom" style="transform-origin: 0% 0% 0px; position: absolute; transform: scale(1, 1) translate(0px, 0px);">
            <img id="imgname" src="../weixin/images/2.png">
        </div></div>
        <a id="remark" class="image"></a>
        <p id="delbutton" style="background-color:#BF3131;padding:10px;border-radius:5px;text-align:center;color:#fff">删除</p>
    </div>


</body></html>