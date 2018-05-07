$(function(){


	var sel=$.Params.create();
	sel.addParams("memberId",memberId); 
	sel.addParams("deleteState","1"); 
	sel.ajax(getIP()+"memberCard.action?list",function(data){
		$.each(data.rows,function(i,val){
			var type=val.type;
			var card=val.card;
			$("a[name=cardImg][ctype="+type+"] img").attr("src","data/member/"+card);
		})
	})
	
	/**
	 * 审核记录
	 */
	
	$("#checkRecord").on("click",function(){
		window.location.href="weixin/hy/memberCheckList.jsp";
	})
	
	
	/**
	 * 点击选择图片
	 */
	$("[name=cardImg]").on("click",function(){
		var type=$(this).attr("ctype");//3种类型 1、2、3
		chooseImage(type);
	})
	
	
	//参考样版
	$("[name=yb]").on("click",function(){
		var yb=$(this).attr("yb");
		window.location.href="weixin/sf.jsp?type=1&imgname="+yb;
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
        //alert(JSON.stringify(res));
      }
    });
    
  wx.onMenuShareAppMessage(shareData);
  wx.onMenuShareTimeline(shareData);
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
	function chooseImage(typeNo){
		   	wx.chooseImage({
		      success: function (res) {
		        images.localId = res.localIds;
		       // alert(images.localId);
		       var imgurl=res.localIds[0];
		       upload(typeNo);
		       //var imgs="<img src='"+imgurl+"' />";
		      // $("#uploadimg").prepend(imgs);
		      
		       // $("#image").attr("src",images.localId);
		        //alert('å·²éæ© ' + res.localIds.length + ' å¼ å¾ç');
		      }
		    });
	   } 
	
	/**
	 * 上传到微信服务器
	 * @param typeorder
	 * @param typeNo
	 * @return
	 */
	function upload(typeNo) {
	  	var i = 0, length = images.localId.length;
	    images.serverId = [];
	      wx.uploadImage({
	        localId: images.localId[i],
	        success: function (res) {
	        	i++;
	        // alert('已上传：' + i + '/' + length);
	          images.serverId.push(res.serverId);
	          getmediaId(res.serverId,typeNo);
	        },
	        fail: function (res) {
	          alert(JSON.stringify(res));
	        }
	      });
	    }
	
	/**
	 * 上传到本地数据库
	 * @param imgurl
	 * @param typeorder
	 * @param typeNo
	 * @return
	 */
	function getmediaId(imgurl,typeNo){
  		var addimg=$.Params.create();
	    addimg.addParams("memberId",memberId); 
	    addimg.addParams("card",imgurl); 
	    addimg.addParams("type",typeNo); 
	    addimg.addParams("filed4",place); 
	    addimg.ajax(getIP()+"memberCard.action?add",function(data){
	    	var card=data.card;
	    	var type=data.type;
	    	$("a[name=cardImg][ctype="+type+"] img").attr("src","data/member/"+card);
	    	//getData(typeNo);
		})
  }
	
	
	
	
	
	
	
	