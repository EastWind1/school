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
		.tp_option_head_author,.tp_selected{margin-top:4%;}
		
	</style>
  </head>
  <body>
    <div class="content votdContent fz">
  		<ul id="tp_list" class="tp_list">
  			
  		</ul>	  	
	</div>
  	<nav class="bar bar-tab" style="background-color:rgba(255, 255, 255, 0)">
		<div class="tp_subArea">
			<a id="tp_subBtn" class="tp_subBtn">确认投票</a>
			<p class="tp_subInfo">甲组、乙组各投1票！</p>
		</div>
	</nav>
	<script src="weixin/js/jweixin-1.0.0.js"></script>
	<script src="weixin/js/zepto.min.js"></script>
	<script>
		var isgz=0;
		$(function(){
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
								html3+="<li class='tp_option' teamId='"+val.id+"' groupName='"+val.groupName+"' ><div class='tp_option_head'><img src='data/eventfz/"+val.headImg+"' alt='加载失败'/>"+
								 "<div class='tp_option_head_author'><span class='tp_option_head_authorName'>"+val.hospitalName+"</span>"+
								    "</div><a class='tp_selected' onclick='sendTicket(this)' >选择</a></div></li>";
							}else if(val.groupName=="乙组"){
								html4+="<li class='tp_option' teamId='"+val.id+"' groupName='"+val.groupName+"' ><div class='tp_option_head'><img src='data/eventfz/"+val.headImg+"' alt='加载失败'/>"+
								 "<div class='tp_option_head_author'><span class='tp_option_head_authorName'>"+val.hospitalName+"</span>"+
							    "</div><a class='tp_selected' onclick='sendTicket(this)'  >选择</a></div></li>";
							}
						})
						html=html1+html3+html2+html4;
					}else{
						html="暂无数据";
					}
					$("#tp_list").html(html);
				}
			})



			
			
		   
		   	//提交投票
			$("#tp_subBtn").on("click",function(){
				var params=[];
				var createTime = getNowDateTime();
				$("li[selected]").each(function(){
					var id = getUUID();
					var teamId=$(this).attr("teamId");
					var groupName=$(this).attr("groupName");
					
					var param="{\"id\":\""+id+"\",\"openId\":\""+openId+"\",\"teamId\":\""+teamId+"\",\"groupName\":\""+groupName+"\",\"createTime\":\""+createTime+"\",\"filed1\":\"votebq\"}";
					params.push(param);
				});
				if(params.length<2){
					alert("甲组、乙组各投一票！");
					return false;
				}
				var params1="["+params+"]";
				var add=$.Params.create();
			    add.addParams("params",params1); 
		    	add.ajax(getIP()+"eventgavote.action?addMoreVote",function(data){
		    		if(data.success){
		    			window.location.href="weixin/tp_fz/votedbqList.jsp";
		    		}else{
		    			alert(data.msg);
		    			return;
		    		}
		    	})
			})
		
		var sel=$.Params.create();
		sel.addParams("openId",openId); 
		sel.addParams("subscribe",1); 
	    sel.ajax(getIP()+"wxUsers.action?list",function(data){
    		if(data.total>0){
    			isgz=1;
    		}
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
		        //alert(JSON.stringify(res));
		      }
		    });
		    
		    //分享朋友圈
		    wx.onMenuShareTimeline({
			    title: '绿色方舟第3季北区半决赛有奖竞猜', //分享标题
		      	link: 'http://weixin.yunicu.com/ychz/weixin/tp_fz/votebq.jsp',
			    imgUrl: 'http://weixin.yunicu.com/ychz/weixin/images/fz-zf.jpg',
			    success: function () { 
			        // 用户确认分享后执行的回调函数
			    },
			    cancel: function () { 
			        // 用户取消分享后执行的回调函数
			    }
			});
			
		    //分享给朋友
		    wx.onMenuShareAppMessage({
			  title: '绿色方舟第3季北区半决赛有奖竞猜', //分享标题
		      desc: '',
		      link: 'http://weixin.yunicu.com/ychz/weixin/tp_fz/votebq.jsp',
			  imgUrl: 'http://weixin.yunicu.com/ychz/weixin/images/fz-zf.jpg',
		      trigger: function (res) {
		        // 不要尝试在trigger中使用ajax异步请求修改本次分享的内容，因为客户端分享操作是一个同步操作，这时候使用ajax的回包会还没有返回
		        //alert('用户点击发送给朋友');
		      },
		      success: function (res) {
		      },
		      cancel: function (res) {
		      },
		      fail: function (res) {
		        //alert(JSON.stringify(res));
		      }
		    });	 
		    
		   
		});
	    //点击投票选择按钮	
    	function sendTicket(obj){
    		//判断是否关注服务号
    		if(isgz == 1){
    			if($(obj).attr("class") == "tp_selected" && $(obj).parent().parent().attr("groupName")=="甲组"){
        			var len1=$("li[selected][groupName='甲组']").length;
					if(len1>= 1 ){
						alert("甲组、乙组各投一票！");
						return;
					}else{
						$(obj).attr("class","tp_unselected");
						$(obj).parent().parent().attr("selected","selected");
						$(obj).html("取消选择");
					}
				}else if($(obj).attr("class") == "tp_selected" && $(obj).parent().parent().attr("groupName")=="乙组"){
					var len2=$("li[selected][groupName='乙组']").length;
					if(len2>= 1 ){
						alert("甲组、乙组各投一票！");
						return;
					}else{
						$(obj).attr("class","tp_unselected");
						$(obj).parent().parent().attr("selected","selected");
						$(obj).html("取消选择");
				   }
				}else{
					$(obj).attr("class","tp_selected");
					$(obj).parent().parent().removeAttr("selected");
					$(obj).html("选择");
				}
    		}else{//关注服务号的页面链接
    			window.location.href="http://mp.weixin.qq.com/s?__biz=MzAxODU0MzM0MA==&mid=402223022&idx=1&sn=e0c259f134b0cbe87933d703bdb71f06#rd";
    		}
			
		}
	</script>
  </body>
</html>