var orderId=GetQueryString("orderId");
var ryjcId=GetQueryString("ryjcId");
var sysjcId=GetQueryString("sysjcId");
var yxxjcId=GetQueryString("yxxjcId");
var otherId=GetQueryString("otherId");
$("#chooseImage1").attr("typeorder",ryjcId);
$("#chooseImage2").attr("typeorder",sysjcId);
$("#chooseImage3").attr("typeorder",yxxjcId);
$("#chooseImage4").attr("typeorder",otherId);
$(function(){
	getData();
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
	
	
	$("#chooseImage1,#chooseImage2,#chooseImage3,#chooseImage4").on("click",function(){
		var typeorder=$(this).attr("typeorder");
		var typeNo=$(this).attr("typeNo");
		chooseImage(typeorder,typeNo);
	})
	
	
	$("#regbl").on("click",function(){
		var paramsAss="";
		$("#blList").find("textarea").each(function(i,val){
			var remark=$(this).val();
			var blId=$(this).attr("id");
			if(remark != ""){
				if(paramsAss==""){
	            	paramsAss="[{\"id\":\""+blId+"\",\"filed3\":\""+remark+"\"}";
	            }else{
	            	paramsAss+=",{\"id\":\""+blId+"\",\"filed3\":\""+remark+"\"}";
	            }
			}
		})
		paramsAss=paramsAss+"]";
		var upmpre=$.Params.create();
	    upmpre.addParams("params",paramsAss); 
	    upmpre.ajax(getIP()+"medicalRecord.action?updateMore",function(data){
	    	if(data.success){
	    		alert("预约成功！");
	    	}
		})
		//alert(paramsAss);
	})
	
	
	//getconfig(timeStamp,nonceStr,"08b147a17a6ef5a4bf465e1c03ce66568d70d463");
	function getconfig(timestamp,nonceStr,signature){
    	//alert(timestamp+"-------------"+nonceStr+"-------"+signature)
    	wx.config({
	      debug: false,
	      appId: 'wx53ba6fa2a37a38f2',
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

function getData(){
	var sel=$.Params.create();
	sel.addParams("orderId",orderId); 
	sel.ajax(getIP()+"medicalRecord.action?list",function(data){
		var html1="";var html2="";var html3="";var html4="";
		$.each(data.rows,function(i,val){
			var remark=val.filed3;
			if(remark == null){
				remark="";
			}
			if(val.filed4 == "1"){
				html1+="<li class='table-view-cell titleclass'><img style='width:50%;margin-bottom:5px;' src='data/order/"+val.name+"' /> <p>备注：</p><p><textarea id='"+val.id+"' style='width:100%'>"+remark+"</textarea></p></li>";
			}else if(val.filed4 == "2"){
				html2+="<li class='table-view-cell titleclass'><img style='width:50%;margin-bottom:5px;' src='data/order/"+val.name+"' /><p>备注：</p><p><textarea id='"+val.id+"' style='width:100%'>"+remark+"</textarea></p></li>";
			}else if(val.filed4 == "3"){
				html3+="<li class='table-view-cell titleclass'><img style='width:50%;margin-bottom:5px;' src='data/order/"+val.name+"' /><p>备注：</p><p><textarea id='"+val.id+"' style='width:100%'>"+remark+"</textarea></p></li>";
			}else{
				html4+="<li class='table-view-cell titleclass'><img style='width:50%;margin-bottom:5px;' src='data/order/"+val.name+"' /><p>备注：</p><p><textarea id='"+val.id+"' style='width:100%'>"+remark+"</textarea></p></li>";
			}
		})
		$("#content1").html(html1);$("#content2").html(html2);$("#content3").html(html3);$("#content4").html(html4);
	})
} 
wx.ready(function () {
  // 1 å¤æ­å½åçæ¬æ¯å¦æ¯ææå® JS æ¥å£ï¼æ¯ææ¹éå¤æ­
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
function chooseImage(typeorder,typeNo){
	   	wx.chooseImage({
	      success: function (res) {
	        images.localId = res.localIds;
	       // alert(images.localId);
	       var imgurl=res.localIds[0];
	       upload(typeorder,typeNo);
	       //var imgs="<img src='"+imgurl+"' />";
	      // $("#uploadimg").prepend(imgs);
	      
	       // $("#image").attr("src",images.localId);
	        //alert('å·²éæ© ' + res.localIds.length + ' å¼ å¾ç');
	      }
	    });
   }    
  function upload(typeorder,typeNo) {
  	var i = 0, length = images.localId.length;
    images.serverId = [];
      wx.uploadImage({
        localId: images.localId[i],
        success: function (res) {
        	i++;
         // alert('已上传：' + i + '/' + length);
          images.serverId.push(res.serverId);
          getmediaId(res.serverId,typeorder,typeNo);
        },
        fail: function (res) {
          alert(JSON.stringify(res));
        }
      });
    }
    
   function getmediaId(imgurl,typeorder,typeNo){
   		 var addimg=$.Params.create();
	    addimg.addParams("orderId",orderId); 
	    addimg.addParams("name",imgurl); 
	    addimg.addParams("place",place); 
	    addimg.addParams("filed2",typeorder); 
	    addimg.addParams("filed4",typeNo); 
	    addimg.ajax(getIP()+"medicalRecord.action?add",function(data){
	    	getData();
		})
   }


	

	
