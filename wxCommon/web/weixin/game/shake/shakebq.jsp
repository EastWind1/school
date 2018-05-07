<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<html>
<head>
    <title>绿色方舟第3季北区半决赛有奖竞猜</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no"/>
    <jsp:include page="../../common.jsp"></jsp:include>
    <style>
    * { margin: 0; padding: 0; }
    /****************绿色方舟摇一摇***************/
	.lsfzyao{background: url(weixin/images/lsfz.jpg) no-repeat;background-size:cover;}
	img.lsfz_logo,.lsfz_titimg img{width:65%;}
	.lsfz_titimg,.lsfz_zjimg{text-align: center;padding-top:30px;}
	.lsfz_yaoyiyao img{width:80%;}
	.lsfz_yaoyiyao{text-align: center;padding-top:10px !important; position:relative;}
	
	.digle{position: absolute;display:none;top:50%;left:50%;width:300px;height:310px;margin-left:-150px;margin-top:-150px;background-color: #8BC35E;border-radius:8px;}
	.digle p{text-align: center;padding-left:10px;padding-right: 10px;font-size: 22px;color:#fff;padding-top:10px; }
	.digle p input{margin-bottom: 0px;color:#000}
	.digle a{background-color: #6EC6DC;color:#fff;display: inline-block;width:70%;padding-top:6px;padding-bottom:6px;border-radius:8px;}
	
	.lsfz_zjimg img{width:90%;margin-top:10px;}
	.msgerr{text-align:center;color:#ff0000 !important;font-size:16px !important;}
	
	.opensh a{background-color: #5BC758;color:#fff;display: inline-block;width:50%;padding-top:20px;padding-bottom:20px;border-radius:8px;}
	.opensh p{text-align:center;margin-top:80px;}
	.lsfz_titimg.foot img{width:90%}
    .yyyyyyy{
	    width: 100%;
	    position: absolute !important;
	    top: 57%;
	    /* left: 50%; */
	    /* left: 134px; */
	    /* transform: translateX(-50%); */
	    /* margin: 0 auto; */
	    text-align: center;
    	vertical-align:top;
    }
    .yyyyyyy img{
    	width:26%;
    	vertical-align:top !important;
    }
    .lsfz_titimg.foot{color:#FE9B04;padding-top:6px;}
    </style> 
</head>

<body>
     <div class="content lsfzyao">
        <div id="wrapper">
	<div id="scroller">
	<!-- <p class="lsfz_titimg" style="margin-top:15px;"><img src="weixin/images/title_choujiang.png" /></p> -->	
		<p name="yyyz" class="lsfz_titimg"><img src="weixin/images/dajiang_choujiang.png" /></p>
		<p id="wzj2" name="yyyz" class="lsfz_yaoyiyao">
			<img src="weixin/images/lihe1.png" />
		</p>
		<p class="yyyyyyy"><img src="weixin/images/yaoyiyao_choujiang.png" /></p>
		<!-- <p id="wzjl" class="lsfz_zjimg"><img src="weixin/images/lsfz_zj.png" /></p> 
		<p id="msgcjcs" class="msgerr">剩余<label>5</label>次抽奖机会</p>-->
		<p id="msg" class="msgerr">活动已结束，谢谢参与！</p>
		<p id="cleandata" class="lsfz_titimg foot">绿色方舟第3季北区半决赛有奖竞猜<br/>本场竞猜将抽出20个幸运儿送出精美礼品</p> 
 	</div>
 	</div>
 	
 	</div>
  <audio src="weixin/mp3/yyy.mp3" id="mpYyy" controls="controls"  hidden="true">
  </audio>
   <audio id="mpYzj"  src="weixin/mp3/yzj.mp3" controls="controls" hidden="true">
  </audio>
  <script src="weixin/js/jweixin-1.0.0.js"></script>
	<script src="weixin/js/zepto.min.js"></script>
  
    <script>
    
    
    $("#cleandata").on("click",function(){
    	window.localStorage.setItem("bqshakeZj","0");
    	window.localStorage.setItem("bqshakeCs","0");	
    	alert("本地数据已清除");
    })
    
    var wzjlast=window.localStorage.getItem("wzj");
    var SHAKE_THRESHOLD = 1500;
    var last_update = 0;
    var x = y = z = last_x = last_y = last_z = 0;
    var shakeZj=window.localStorage.getItem("bqshakeZj");
    var shakeCs=window.localStorage.getItem("bqshakeCs");
	
     //获取存在本地的摇奖次数
   var yjcsbd=window.localStorage.getItem("yjzcbd");
   if(yjcsbd == null){
   		yjcsbd=5;
   		window.localStorage.setItem("yjzcbd",yjcsbd);
   }else{
   		window.localStorage.setItem("yjzcbd",yjcsbd);
   }
    if (window.DeviceMotionEvent) {
        window.addEventListener('devicemotion', deviceMotionHandler, false);
    } else {
        alert('本设备不支持摇一摇功能');
    }
    $("#msgcjcs label").html(yjcsbd);
	
    function deviceMotionHandler(eventData) {
        var acceleration = eventData.accelerationIncludingGravity;
        var curTime = new Date().getTime();

        if ((curTime - last_update) > 100) {
            var diffTime = curTime - last_update;
            last_update = curTime;
            x = acceleration.x;
            y = acceleration.y;
            z = acceleration.z;
            var speed = Math.abs(x + y + z - last_x - last_y - last_z) / diffTime * 10000;
            var status = document.getElementById("status");

            if (speed > SHAKE_THRESHOLD) {
            	//judgeGame();//调用摇一摇逻辑处理方法
            	//doResult();
            	//getcount();
            }
            last_x = x;
            last_y = y;
            last_z = z;
        }
    }
    function autoPlay(){
		var myAuto = document.getElementById("mpYyy");
		myAuto.play();
		
	}
	function autoPlayZj(){
		var myAutoZj = document.getElementById("mpYzj");
		myAutoZj.play();
	}
	var selzj1=$.Params.create();
	   	selzj1.addParams("number","1");
	   	selzj1.addParams("batch","2");
	   	selzj1.ajax(getIP()+"gameshakeprize.action?list",function(data){
	   		shakezjcs=data.total;
	   	})
	var shakezjcs;
	function getcount(){
		
		var selzj=$.Params.create();
	   	selzj.addParams("number","1");
	   	selzj.addParams("batch","2");
	   	selzj.ajax(getIP()+"gameshakeprize.action?list",function(data){
	   		shakezjcs=data.total;
	   		doResult();
	   	})
	}
    
   
   	
   	//摇一摇获取随机数
   	 function doResult(){
   	 	var rando=getRandom(10);
   	 	if(shakezjcs == 8){
   	 		addShake("0");
   	 	}else{
   	 		if(rando == 9 || rando == 2){//中奖记录
	    		addShake("1");
	    	}else{//没中奖记录
	    		addShake("0");
	    		//$("#msg").html("您还有抽奖机会，继续摇吧，少年！");
	    	}
   	 	}
   	 	
   	 }
   	
 
    
    
   /* if(shakeZj == "1"){
    	$(".yyyyyyy img").attr("src","weixin/images/yaoyiyao_choujiang.png");
    	 $("#msg").html("恭喜您中奖了！客服人员会尽快与您联系。");
    	 $("#msgcjcs").html("");
    	 $(".yyyyyyy").css("top","53%");
	}
	if(shakeCs ==5){
	    	$(".yyyyyyy img").attr("src","weixin/images/yaoyiyao_choujiang.png");
	    	$("#msgcjcs label").html("0");
	    	$("#msg").html("很遗憾您没有中奖，谢谢参与！");
	    	$(".yyyyyyy").css("top","53%");
	    }else{
	    
	    	if(shakeZj != "1"){
	    		$("#msgcjcs label").html(5-shakeCs);
	    	$("#msg").html("");
	    	}
	    	
	    }
    
   */
    				
    				
    
    /**
    添加摇奖记录
    **/
    function addShake(state){
    	var add=$.Params.create();
    //	add.addParams("customerName",memberName);
    	add.addParams("customerId",openId);
    	add.addParams("brandId",brandId);
    	add.addParams("number",state);
    	add.addParams("batch","2");
    	add.ajax(getIP()+"gameshakeprize.action?addlsfzPrizeThree",function(data){
    		if(data.shakeZj == "1"){//中奖
    			//将标示存储到本地、播放中奖音乐
    			autoPlayZj();
    			//alert("是否中奖："+state);
    			$(".yyyyyyy img").attr("src","weixin/images/yaoyiyao_choujiang.png");
    			window.localStorage.setItem("bqshakeZj","1");
    			$("#msg").html("恭喜您中奖了！客服人员会尽快与您联系。");
    			$("#msgcjcs").html("");
    		}else{
    			//播放未中奖音乐
    			//alert(data.shakeCs);
    			if(data.shakeCs<4 || data.shakeCs==4){
    				$("#msg").html("您还有抽奖机会，摇起来！");
    				autoPlay();
    			}else{
    				$("#msg").html("很遗憾您没有中奖，谢谢参与！");
    				$(".yyyyyyy img").attr("src","weixin/images/yaoyiyao_choujiang.png");
    			}
    		}
    		//更新本地摇奖次数
    		window.localStorage.setItem("bqshakeCs",data.shakeCs);
    		$("#msgcjcs label").html(5-data.shakeCs);
    		$(".yyyyyyy").css("top","54%");
    	})
    }
    
    $(function(){
			/**
			 * 获取微信签名
			 */
			var createNonceStr = function() {
				return Math.random().toString(36).substr(2, 15);
			};
			var createTimeStamp = function () {
				return parseInt(new Date().getTime() / 1000) + '';
			};
			var nonceStr=createNonceStr();
		    var timeStamp=createTimeStamp();
		    var url=location.href.split('#')[0];
		    var token=$.Params.create();
		    token.addParams("timestamp",timeStamp); 
		    token.addParams("nonce",nonceStr); 
		    token.addParams("url",url); 
		    token.ajax(getIP()+"wxSignature.action?getTicket",function(data){
				var signature=data.signature;
				getconfig(timeStamp,nonceStr,signature);
			})
			
			/**
			 * 注册网页事件
			 */
			function getconfig(timestamp,nonceStr,signature){
		    	//alert(timestamp+"-------------"+nonceStr+"-------"+signature)
		    	wx.config({
			      debug: false,
			      appId: 'wx53ba6fa2a37a38f2',//微信号id
			      timestamp: timestamp,
			      nonceStr: nonceStr,
			      signature: signature,
			      jsApiList: [
			        'checkJsApi',
			        'onMenuShareTimeline',
			        'onMenuShareAppMessage',
			        'onMenuShareQQ',
			        'onMenuShareWeibo',
			        'hideMenuItems',
			        'showMenuItems',
			        'hideAllNonBaseMenuItem',
			        'showAllNonBaseMenuItem',
			        'translateVoice',
			        'startRecord',
			        'stopRecord',
			        'onRecordEnd',
			        'playVoice',
			        'pauseVoice',
			        'stopVoice',
			        'uploadVoice',
			        'downloadVoice',
			        'chooseImage',
			        'previewImage',
			        'uploadImage',
			        'downloadImage',
			        'getNetworkType',
			        'openLocation',
			        'getLocation',
			        'hideOptionMenu',
			        'showOptionMenu',
			        'closeWindow',
			        'scanQRCode',
			        'chooseWXPay',
			        'openProductSpecificView',
			        'addCard',
			        'chooseCard',
			        'openCard'
			      ]
			  });
		    }
			
	})
	
		
	/**
		 * 微信网页事件
		 */
		wx.ready(function () {
		  wx.checkJsApi({
		      jsApiList: [
		        'getNetworkType',
		        'previewImage'
		      ],
		      success: function (res) {
		       // alert(JSON.stringify(res));
		      }
		    });
		    
		     wx.hideMenuItems({
		      menuList: [
		        'menuItem:share:timeline', // 分享到朋友圈
		        'menuItem:share:appMessage', // 分享到朋友
		        'menuItem:share:qq', // 分享到qq
		        'menuItem:share:weiboApp', // 分享到微博
		        'menuItem:share:facebook', // 分享到微博
		        'menuItem:share:QZone', // 分享到微博
		        'menuItem:copyUrl', // 复制链接
		        'menuItem:openWithSafari', // safari
		        'menuItem:openWithQQBrowser' // qq浏览器
		      ],
		      success: function (res) {
		      },
		      fail: function (res) {
		        alert(JSON.stringify(res));
		      }
		    });
		    
		});
    </script>

</body>
</html>