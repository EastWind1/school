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
	// 8.7 关闭当前窗口
  document.querySelector('#closeWindow').onclick = function () {
    wx.closeWindow();
  };
})

$(function(){
	/**
	 * 反馈问题
	 */
	
	$("#reg").on("click",function(){
		var edit=$.Params.create();
		var content=$("#contents").val();
 		if(content == ""){
 			alert("请输入评论内容");
   			return false;
 		}
		edit.addParams("content",content);
		edit.addParams("filed2",memberName);
		edit.addParams("memberId",openId);
		edit.addParams("type",3);
		edit.addParams("place",place);
		edit.ajax(getIP()+"feedBack.action?add",function(data){
				if(data.success){
					alert("提交反馈问题成功");
				}
			})
		
	});
	/**
	 * 发送邮件
	 */
	$("#email").on("click",function(){
		if(memberId == ""){
			window.location.href="weixin/hy/register.jsp";
		}else{
			window.location.href="weixin/kf/email.jsp";
		}
		
	})
	
	/*$("#pdfdetail").on("click",function(){
		window.location.href="data/pdf/yl20150518.pdf";
	})*/
	
	$("#vediodetail").on("click",function(){
		window.location.href="data/pdf/yl20150518.pdf";
	})
	
	//$("#kftel").attr("href","tel:"+kftel);
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
		//alert(location.href.split('#')[0]);
		//getconfig(timeStamp,nonceStr,"08b147a17a6ef5a4bf465e1c03ce66568d70d463");
		function getconfig(timestamp,nonceStr,signature){
	    	//alert(timestamp+"-------------"+nonceStr+"-------"+signature)
	    	wx.config({
		      debug: false,
		      appId: 'wx2ee7ef751af611e9',
		      timestamp: timestamp,
		      nonceStr: nonceStr,
		      signature: signature,
		      jsApiList: [
		        'checkJsApi',
		        'closeWindow'
		      ]
		  });
	    }
	
})
