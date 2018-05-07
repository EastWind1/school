<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<html>
<head>
    <title>绿色方舟第3季南区半决赛有奖竞猜</title>
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
    .lsfz_titimg.foot{color:#FE9B04}
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
		<p class="yyyyyyy"><img src="weixin/images/yyyy.gif" /></p>
		<!-- <p id="wzjl" class="lsfz_zjimg"><img src="weixin/images/lsfz_zj.png" /></p> -->
		<p id="msgcjcs" class="msgerr">剩余<label>5</label>次抽奖机会</p>
		<p id="msg" class="msgerr"></p>
		<p class="lsfz_titimg foot">绿色方舟第3季南区半决赛有奖竞猜<br/>本场竞猜将抽出20个幸运儿送出精美礼品</p> 
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
    window.localStorage.setItem("wzj","0");
    window.localStorage.setItem("yjzcbd","5");
    var wzjlast=window.localStorage.getItem("wzj");
    var SHAKE_THRESHOLD = 900;
    var last_update = 0;
    var x = y = z = last_x = last_y = last_z = 0;
	
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
            	judgeGame();
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
   
  
   	/*var wzjmsg=window.localStorage.getItem("wzj");
   	if(wzjmsg == "1"){
   		$("[name=yyyz]").hide();
    $("#wzjl").show();
   	}else{
   		$("[name=yyyz]").show();
    	$("#wzjl").hide();
   	}*/
   	
    function doResult() {
    	//$("#mpYyy").trigger('play');
    	if(wzjlast=="1"){
    	 $("#msgcjcs label").html(0);
    	 $(".yyyyyyy").css("top","54%");
    	 $("#msgcjcs").html("");
        	$("#msg").html("恭喜您中奖了！客服人员会尽快与您联系。");
        }else{
        	var rando=getRandom(10);
	    	//rando=9;
	    	if(rando == 9 || rando == 2){
	    		addShake("1");
	    	}else{
	    		addShake("0");
	    		//$("#msg").html("您还有抽奖机会，继续摇吧，少年！");
	    	}
       }
    	
	   
    }
    //查询活动状态 是否开启
    function judgeGame() {
    	var sel=$.Params.create();
    	sel.addParams("brandId",brandId);
    	sel.ajax(getIP()+"gameShake.action?list",function(data){
    		var wzjmsg=window.localStorage.getItem("wzj");
			if(data.rows[0].state==1){//游戏开启
				window.localStorage.removeItem("wzj");
    			//$("[name=yyyz]").show();
    			$("#msg").html("");
    			$("#wzjl").hide();
    			if(wzjlast=="0" || yjcsbd<5){//摇奖中
    				autoPlay();
    				$(".yyyyyyy").css("top","54%");
            		//alert("摇奖次数用完，或者已经中奖了");
            	}else{
            		
            	}
    			doResult();
			}
			else if(data.rows[0].state==2){//已结束
				if(wzjmsg != "1"){
					 $("#msgcjcs label").html(0);
					 $(".yyyyyyy").css("top","54%");
					$("#msg").html("很遗憾，您没有中奖，谢谢参与！");
				}else{
					//$("[name=yyyz]").hide();
					$(".yyyyyyy").css("top","54%");
	    			//$("#msg").html("恭喜你，中奖啦！");
	    		//	$("#wzjl").show();
	    			autoPlayZj();
				}
			}else{
    			$("#wzjl").hide();
    			window.localStorage.removeItem("wzj");
				$("#msg").html("游戏尚未开启！");
			}
		});
		 
    }
    /******完善资料*****/
    $("#subButton").on("click",function(){
    	var userName=$("#userName").val();
    	var userTel=$("#userTel").val();
    	var userHos=$("#userHos").val();
    	if(userName == "" || userTel=="" || userHos == ""){
    		alert("请完善资料，谢谢！");
    		return false;
    	}
    	if(!valPhone(userTel)){
    		alert("请输入正确的手机号");
    		return false;
    	}
    	window.localStorage.setItem("userName",userName);
    	window.localStorage.setItem("userTel",userTel);
    	window.localStorage.setItem("userHos",userHos);
    	addShake("0");
    })
    
    $("#wzjl,#wzj2").on("click",function(){
    	window.localStorage.removeItem("userName");
		window.localStorage.removeItem("userTel");
		window.localStorage.removeItem("userHos");
		window.localStorage.removeItem("wzj");
    })
    
    
    /**
    添加摇奖记录
    **/
    function addShake(state){
    	var add=$.Params.create();
    //	add.addParams("customerName",memberName);
    	add.addParams("customerId",openId);
    	//add.addParams("filed2",userHos);
    	add.addParams("brandId",brandId);
    	add.addParams("number",state);
    	add.ajax(getIP()+"gameshakeprize.action?addlsfzPrizeTwo",function(data){
    		if(data.zj == "1"){//中奖了
    			window.localStorage.setItem("wzj","1");
    			wzjlast="1";
    			$("#msgcjcs").html("");
	    		autoPlayZj();
    		}else{//没中奖
    			wzjlast="00";
    		}
    		var chishu=5-data.yjcs;
    		yjcsbd=chishu;
    		window.localStorage.setItem("yjzcbd",yjcsbd);
    		$("#msgcjcs label").html(chishu);
    	
    		$("#msg").html(data.msg);
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