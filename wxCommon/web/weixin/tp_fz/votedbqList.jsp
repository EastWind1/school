<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<!DOCTYPE>
<html>
  <head>
	<title>绿色方舟第3季北区半决赛有奖竞猜</title>  
    <meta name="viewport" content="initial-scale=1, maximum-scale=1, user-scalable=no, minimal-ui">

    <!-- Makes your prototype chrome-less once bookmarked to your phone's home screen -->
    <meta name="apple-mobile-web-app-capable" content="yes">
    <meta name="apple-mobile-web-app-status-bar-style" content="black">
	<jsp:include page="../common.jsp"></jsp:include>
	<link href="weixin/css/event.css" rel="stylesheet">
	<style type="text/css">
		.tp_option_head_authorName{margin-top:12%}
		.vtList_ticketNum{margin-top:4%}
	</style>
  </head>
  <body>
 
  	<div class="content fz" style="margin-bottom:80px;">
	  	<ul id="tp_list" class="tp_list">
	  		 
	  	</ul>
	</div>
	 <nav class="bar bar-tab" style="background-color:rgba(255, 255, 255, 0)">
		<div class="tp_subArea" style="height:80px;">
			<a id="tp_subBtn" class="tp_subBtn">去抽奖</a>
		</div>
	</nav>
	<script src="weixin/js/jweixin-1.0.0.js"></script>
	<script src="weixin/js/zepto.min.js"></script>
	<script>
	var p=$.Params.create();
	p.addParams("filed1","votebq"); 
	p.ajax(getIP()+"eventgateam.action?list",function(data){
		if(data.success){
			var len=data.total;
			var html="";
			if(len>0){
				html1="<li class='titlefz' style='text-align:center'>北区半决赛冠军竞猜-甲组</li>";
				html2="<li class='titlefz' style='text-align:center'>北区半决赛冠军竞猜-乙组</li>";
				html3="";
				html4="";
				$.each(data.rows,function(i,val){
					if(val.groupName=="甲组"){
						html3+="<li class='tp_option' ><div class='tp_option_head'><img src='data/eventfz/"+val.headImg+"' alt='加载失败'/>"+
						 "<div class='tp_option_head_author'><span class='tp_option_head_authorName'>"+val.hospitalName+"</span>"+
						    "</div><a class='vtList_ticketNum'><i>"+val.count+"</i>票</a></div></li>";
					}else if(val.groupName=="乙组"){
						html4+="<li class='tp_option' ><div class='tp_option_head'><img src='data/eventfz/"+val.headImg+"' alt='加载失败'/>"+
						 "<div class='tp_option_head_author'><span class='tp_option_head_authorName'>"+val.hospitalName+"</span>"+
					    "</div><a class='vtList_ticketNum'><i>"+val.count+"</i>票</a></div></li>";
					}
				})
				html=html1+html3+html2+html4;
			}else{
				html="暂无数据";
			}
			$("#tp_list").html(html);
		}
	})
	
	$("#tp_subBtn").on("click",function(){
		window.location.href="weixin/game/shake/shakebq.jsp";
	})
	
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
		        //alert(JSON.stringify(res));
		      }
		    });
		    
		});
	</script>
  </body>
</html>
