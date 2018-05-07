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
				// 8.7 关闭当前窗口
			  /*document.querySelector('#closeWindow').onclick = function () {
			    
			  };*/
			  wx.onMenuShareAppMessage(shareData);
  wx.onMenuShareTimeline(shareData);
			})