<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<!DOCTYPE>
<html>
  <head>
	<title>"我的ICU"微小说投稿</title>  
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
	<jsp:include page="../common.jsp"></jsp:include>
	<link href="weixin/css/event.css" rel="stylesheet">
  </head>
  <body>
 	<div id="zw_container" class="zw_container">
		<div class="zw_head">
			<img src="weixin/images/tougao_bg.png"/>
			<!--<div class="zw_headImg">
				<img src="weixin/images/logo_bg.png" alt="加载失败"/>
				<img src="weixin/images/bg_sentence.png" alt="加载失败"/>
			</div>-->
		</div>
		<div class="zw_main">
			<textarea id="content" name="zw_content" rows="4" cols="4" placeholder="编辑小说内容"></textarea>
			<div class="zw_addHeadImg">
				<img id="uploadImg" src="weixin/images/addHeader.png" alt="加载失败"/>
				<div class="zw_uploadInfo">
					<span class="zw_uploadContent">添加头像<br>(请提供清晰的个人正面近照)</span>
				</div>
			</div>

			
		</div>
		<a id="subBtn" class="zw_submitBtn">提交</a>
		<p class="zw_requireInfo"><i>*</i>每人限投3篇，一经提交无法修改</p>	
		<div class="zw_requirement">
			<p>
				<span>主题</span>	以ICU为主题，讲述身边或有趣、或感人的故事，可以是亲人之间/医护之间/医患之间的故事。
			</p>
			<p><span>文体</span>		微小说，字数50字以内（含标点符号）。</p>
			<p><span>时间</span>		2016年3月21日至2016年4月30日。</p>
			<p><span>说明</span>		参赛作品必须为作者原创，且未经任何形式公开发表。</p>
		</div>
	</div>
	<script src="weixin/js/jweixin-1.0.0.js"></script>
	<script>
	var headImgUrl;
		$(function(){
			$("#subBtn").on("click",function(){
				var content = $("#content").val();
				if(content.length > 50){
					alert("超出字数限制，请检查!");
					return;
				}
				var addimg=$.Params.create();
			    addimg.addParams("memberId",memberId); 
			    addimg.addParams("headImg",headImgUrl); 
			    addimg.addParams("content",content); 
			    
			    
			    if(content==""){
					alert("内容不能为空");
					return;
				}
				if(headImgUrl == "" || headImgUrl == undefined || headImgUrl == "undefined"){
				    	alert("请上传头像");
				    	return;
			    }
			    if (confirm("每人限投3篇，您确定要提交吗？")) {
			    	addimg.ajax(getIP()+"eventdocuments.action?add",function(data){
			    		if(data.success){
				    		wx.closeWindow();
				    	}
					})
			    }


			})
		
		
			/**
			 * 点击选择图片
			 */
			$("#uploadImg").on("click",function(){
				chooseImage();
			})
			
			
			/***************************上传资料******************/
			
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
		      //  alert(JSON.stringify(res));
		      }
		    });
		    
		});
		var images = {
		  localId: [],
		  serverId: []
		};

	 	/**
	 	 * 拍照或者从相册选择图片
	 	 * @param typeorder
	 	 * @param typeNo
	 	 * @return
	 	 */
		function chooseImage(){
		   	wx.chooseImage({
		      success: function (res) {
		      images.localId = res.localIds;
		       var imgurl=res.localIds[0];
		       $("#uploadImg").attr("src",res.localIds);
		       $(".zw_addHeadImg span").hide();
		       upload();
		      }
		    });
		} 
	
		/**
		 * 上传到微信服务器
		 * @param typeorder
		 * @param typeNo
		 * @return
		 */
		function upload() {
		  	var i = 0, length = images.localId.length;
		    images.serverId = [];
		      wx.uploadImage({
		        localId: images.localId[i],
		        success: function (res) {
		        	i++;
		        // alert('已上传：' + i + '/' + length);
		          images.serverId.push(res.serverId);
		          getUrl(res.serverId);
		        },
		        fail: function (res) {
		          alert(JSON.stringify(res));
		        }
		    });
		}
		
		function getUrl(url){
			headImgUrl = url;
		}
	</script>
  </body>
</html>
