<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<!DOCTYPE>
<html>
  <head>
	<title>"我的ICU"微小说投票</title>  

    <meta name="viewport" content="initial-scale=1, maximum-scale=1, user-scalable=no, minimal-ui">

    <!-- Makes your prototype chrome-less once bookmarked to your phone's home screen -->
    <meta name="apple-mobile-web-app-capable" content="yes">
    <meta name="apple-mobile-web-app-status-bar-style" content="black">

	<jsp:include page="../common.jsp"></jsp:include>
	
	<link href="weixin/css/event.css" rel="stylesheet">
  </head>
  <body>
    <div class="content votdContent">
  		<ul id="tp_list" class="tp_list"></ul>	  	
	</div>
  	<nav class="bar bar-tab">
		<div class="tp_subArea">
			<a id="tp_subBtn" class="tp_subBtn">确认投票</a>
			<p class="tp_subInfo">每人限投3票！</p>
		</div>
	</nav>
	<script src="weixin/js/jweixin-1.0.0.js"></script>
	<script src="weixin/js/zepto.min.js"></script>
	<script>
		$(function(){
			var addimg=$.Params.create();
		    addimg.addParams("state",3); 
	    	addimg.ajax(getIP()+"eventdocuments.action?list",function(data){
				var html="";
				var rankNum="";
				$.each(data.rows,function(i,val){
					if((i+1)>9){
						rankNum = "No.0"+val.filed1;
					}else{
						rankNum = "No.00"+val.filed1;
					}
					html+="<li eventId='"+val.id+"' class='tp_option'><div class='tp_option_head'><img src='data/member/headImg/"+val.headImg+"' alt='加载失败'/>"+
						  "<div class='tp_option_head_author'><span class='tp_option_head_authorName'>"+val.name+"</span>"+
						  "<span class='tp_option_rankNum'>"+rankNum+"</span><p class='tp_option_hospitalName'>"+val.hospitalName+"</p>"+
					      "</div></div><p class='tp_option_content'>"+val.content+"</p><a class='tp_selected' onclick='sendTicket(this)'>选择</a></li>";
				});	
				$("#tp_list").html(html);
			});
		   
		   	//提交投票
			$("#tp_subBtn").on("click",function(){
				var params=[];
				var createTime = getNowDateTime();
				$("li[selected]").each(function(){
					var id = getUUID();
					var eventId=$(this).attr("eventId");
					
					var param="{\"id\":\""+id+"\",\"eventId\":\""+eventId+"\",\"memberId\":\""+memberId+"\",\"createTime\":\""+createTime+"\"}";
					params.push(param);
				});
				var params1="["+params+"]";
				var add=$.Params.create();
			    add.addParams("params",params1); 
		    	add.ajax(getIP()+"eventvote.action?addMoreVote",function(data){
		    		if(data.success){
		    			window.location.href="weixin/event/votedList.jsp";
		    		}else{
		    			alert(data.msg);
		    			return;
		    		}
		    	})
			})
					
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

		});
		
		/**
		 * 微信网页事件
		 */
		wx.ready(function () {
		  wx.checkJsApi({
		      jsApiList: [
		        'getNetworkType',
		        'previewImage',
		        'onMenuShareTimeline'
		      ],
		      success: function (res) {
		        alert(JSON.stringify(res));
		      }
		    });
		    
		    //分享朋友圈
		    wx.onMenuShareTimeline({
			    title: '云ICU微小说征文大赛', //分享标题
		      	link: 'http://test.s4s.com.cn/ychz/weixin/event/vote.jsp',
			    imgUrl: 'http://test.s4s.com.cn/ychz/weixin/images/app.jpg',
			    success: function () { 
			        // 用户确认分享后执行的回调函数
			    },
			    cancel: function () { 
			        // 用户取消分享后执行的回调函数
			    }
			});
			
		    //分享给朋友
		    wx.onMenuShareAppMessage({
			  title: '云ICU微小说征文大赛', //分享标题
		      desc: '',
		      link: 'http://test.s4s.com.cn/ychz/weixin/event/vote.jsp',
			  imgUrl: 'http://test.s4s.com.cn/ychz/weixin/images/app.jpg',
		      trigger: function (res) {
		        // 不要尝试在trigger中使用ajax异步请求修改本次分享的内容，因为客户端分享操作是一个同步操作，这时候使用ajax的回包会还没有返回
		        alert('用户点击发送给朋友');
		      },
		      success: function (res) {
		      },
		      cancel: function (res) {
		      },
		      fail: function (res) {
		        alert(JSON.stringify(res));
		      }
		    });	 
		    
		    //分享到QQ
		    wx.onMenuShareQQ({
			    title: '云ICU微小说征文大赛', //分享标题
			  	desc: '', // 分享描述
		      	link: 'http://test.s4s.com.cn/ychz/weixin/event/vote.jsp',
			    imgUrl: 'http://test.s4s.com.cn/ychz/weixin/images/app.jpg',
			    success: function () { 
			       // 用户确认分享后执行的回调函数
			    },
			    cancel: function () { 
			       // 用户取消分享后执行的回调函数
			    }
			});  	 
			
			//分享到QQ空间
			wx.onMenuShareQZone({
			    title: '云ICU微小说征文大赛', //分享标题
			    desc: '', // 分享描述
		      	link: 'http://test.s4s.com.cn/ychz/weixin/event/vote.jsp',
			    imgUrl: 'http://test.s4s.com.cn/ychz/weixin/images/app.jpg',
			    success: function () { 
			       // 用户确认分享后执行的回调函数
			    },
			    cancel: function () { 
			        // 用户取消分享后执行的回调函数
			    }
			});   
			
			//分享到腾讯微博
			wx.onMenuShareWeibo({
			    title: '云ICU微小说征文大赛', //分享标题
			    desc: '', // 分享描述
		      	link: 'http://test.s4s.com.cn/ychz/weixin/event/vote.jsp',
			    imgUrl: 'http://test.s4s.com.cn/ychz/weixin/images/app.jpg',
			    success: function () { 
			       // 用户确认分享后执行的回调函数
			    },
			    cancel: function () { 
			        // 用户取消分享后执行的回调函数
			    }
			});
		});
	    //点击投票选择按钮	
    	function sendTicket(obj){
			if($(obj).attr("class") == "tp_selected"){
					if($("li[selected]").length >= 3 ){
						alert("最多只能投3票！");
						return;
					}else{
						$(obj).attr("class","tp_unselected");
						$(obj).parent().attr("selected","selected");
						$(obj).html("取消选择");
					}
			}else{
				$(obj).attr("class","tp_selected");
				$(obj).parent().removeAttr("selected");
				$(obj).html("选择");
			}
		}
	</script>
  </body>
</html>