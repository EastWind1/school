var orderId=GetQueryString("id");
$(function(){
	
	
	getDataImg();
	getzhuanjia();
	
	/**
	给专家赋值
	**/
	function getzhuanjia(){
		var seldetail=$.Params.create();
		seldetail.addParams("id",orderId); 
		seldetail.ajax(getIP()+"memberOrder.action?list",function(data){
			var html="";
			$.each(data.rows,function(i,val){	
				var sex=val.sex;
				if(sex == "1"){
					sex="男";
				}else{
					sex="女";
				}
				$("#sex").html(sex);
				$("#birthday").html(val.birthday);
				$("#height").html(val.height);
				$("#weight").html(val.weight);
				$("#occaption").html(val.occaption);
				$("#admissionTime").html(val.admissionTime);
				$("#chiefComplaint").html(val.chiefComplaint);
				$("#illPrenent").html(val.illPrenent);
				$("#illPost").html(val.illPost);
				$("#illPersonal").html(val.illPersonal);
				$("#illFamily").html(val.illFamily);
				$("#admissionCheck").html(val.admissionCheck);
				$("#imgCheck").html(val.imgCheck);
				$("#otherCheck").html(val.otherCheck);
				$("#preDiagnosis").html(val.preDiagnosis);
				$("#treatPlan").html(val.treatPlan);
				$("#remark").html(val.remark);
				$("#allergryHistory").html(val.allergryHistory);
				$("#labCheck").html(val.labCheck);
		   	})
		})
	}
	   
	
	function getDataImg(){
		var sel=$.Params.create();
		sel.addParams("orderId",orderId); 
		sel.addParams("filed5","1");
		sel.ajax(getIP()+"medicalRecord.action?list",function(data){
			var html1="";var html2="";var html3="";var html4="";
			$.each(data.rows,function(i,val){
				var remark=val.filed3;
				if(remark == null){
					remark="";
				}
				if(val.filed4 == "1"){
					html1+="<img onclick='getSelImg(\""+val.name+"\",\""+remark+"\")' src='data/order/"+val.name+"' />";
				}else if(val.filed4 == "2"){
					html2+="<img onclick='getSelImg(\""+val.name+"\",\""+remark+"\")' src='data/order/"+val.name+"' />";
				}else if(val.filed4 == "3"){
					html2+="<img onclick='getSelImg(\""+val.name+"\",\""+remark+"\")' src='data/order/"+val.name+"' />";
				}else{
					html4+="<img onclick='getSelImg(\""+val.name+"\",\""+remark+"\")' src='data/order/"+val.name+"' />";
				}
				
			})
			$("#ryctimg").html(html1);
			$("#sysjcimg").html(html2);
			$("#yxxjcimg").html(html3);
			$("#otherimg").html(html4);
		})
	} 
	
	
 $("#zjcheck select").each(function(){
		if($(this).find("option:selected").text()!="请选择专家"){
			$(this).next().css("display","inline-block");
		}else{
			$(this).next().css("display","none");
		}
	})
	
	$("#zjcheck select").on("change",function(){
		if($(this).find("option:selected").text()!="请选择专家"){
			$(this).next().css("display","inline-block");
		}else{
			$(this).next().css("display","none");
		}
	})
	$(".se img").on("click",function(){
			if($(this).attr("type"))
			{ 
				type=$(this).attr("type");
				//alert(type);
			}
			if($(this).attr("sex"))
			{
	 		 	sex=$(this).attr("sex");
	 		 	//alert(sex);
			}
	 		 $(this).attr("src","weixin/images/sex1.png");
	 		 $(this).siblings().attr("src","weixin/images/sex0.png");
	 	})
	$(".delezj").on("click",function(){
		//$(this).prev().find("option:first").attr("selected",true);
		$(this).prev().val("0");
		$(this).css("display","none");
	})
	
	
	/**
	 * 打开上传窗口
	 */
	$("[id=upimg]").on("click",function(){
		var typeNo=$(this).attr("typeNo");
		$("#checkOrderimg").attr("checkTypeNo",typeNo);
		$("#uporderImg").show();
		getData(typeNo);
		
	})
	
	/**
	 * 关闭上传窗口
	 */
	$("#closeup").on("click",function(){
		$("#uporderImg").hide();
		
	})
	
	/**
	 * 点击选择图片
	 */
	$("#checkOrderimg").on("click",function(){
		var checkTypeNo=$(this).attr("checkTypeNo");//4中类型 1、2、3、4
		var typeorder;
		if(checkTypeNo == "1"){
			typeorder=admissionChecksj;
		}else if(checkTypeNo == "2"){
			typeorder=labChecksj;
		}else if(checkTypeNo == "3"){
			typeorder=imgChecksj;
		}else{
			typeorder=otherChecksj;
		}
		chooseImage(typeorder,checkTypeNo);
	})
	
	/**
	 * 确认上传资料
	 */
	$("#regbl").on("click",function(){
		var paramsAss="";
		$("#content").find("textarea").each(function(i,val){
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
	    		alert("提交成功，请继续填写其他资料！");
	    		$("#uporderImg").hide();
	    	}
		})
		//alert(paramsAss);
	})
	
	
	
	
	
	
	/**
	 * 提交预约
	 */
	$("#reg").on("click",function(){
 		var expertId1=$("#expertId1").val();
		var expertId2=$("#expertId2").val();
		var expertId3=$("#expertId3").val();
		var remark=$("#remark").val();
		var expertName1=$('#expertId1 option:selected').text();
		var expertName2=$('#expertId2 option:selected').text();
		var expertName3=$('#expertId3 option:selected').text();
		var eopenId=expertId1;
		var sex=$("#sex img[src='weixin/images/sex1.png']").attr("sex");
		var birthday=$("#birthday").val();
		var height=$("#height").val();
		var weight=$("#weight").val();
		var occapation=$("#occapation").val();
		var admissionTime=$("#admissionTime").val();
		var chiefComplaint=$("#chiefComplaint").val();
		var illPrenent=$("#illPrenent").val();
		var illPost=$("#illPost").val();
		var illPersonal=$("#illPersonal").val();
		var illFamily=$("#illFamily").val();
		
		var weight=$("#weight").val();
		var occaption=$("#occaption").val();
		var allergryHistory=$("#allergryHistory").val();
		//var remark=$("#remark").val();
		var allergyHistory=$("#allergyHistory").val();
		var admissionCheck=$("#admissionCheck").val();
		var labCheck=$("#labCheck").val();
		var imgCheck=$("#imgCheck").val();
		var otherCheck=$("#otherCheck").val();
		var preDiagnosis=$("#preDiagnosis").val();
		var treatPlan=$("#treatPlan").val();
		var illSerious=$("#remark").val();

		var expertOpenId="";
		var expertName="";
		if(expertId1 != "0"){
			expertOpenId=expertId1+",";
			expertName=expertName1+",";
		}
		if(expertId2 != "0"){
			expertOpenId+=expertId2+",";
			expertName+=expertName2+",";
		}
		if(expertId3 != "0"){
			expertOpenId+=expertId3+",";
			expertName+=expertName3+",";
		}
					
		expertOpenId=expertOpenId.substring(0,expertOpenId.length-1);
		if(expertOpenId == ""){
			alert("请选择专家！");
			return false;
		}
		if((expertName1==expertName2 && expertId1 !=0 && expertId2 !=0) ||
			(expertName1==expertName3 && expertId1 !=0 && expertId3 !=0) || 
			(expertName2==expertName3 && expertId2 !=0 && expertId3 !=0)){
			alert("专家有重复,请另选专家");
			return false;
		}
		/*if(remark==""){
			alert("请描述病情");
			return false;
		}*/
		if(birthday == ""){
			alert("请填写病人年龄");
			return false;
		}
		if(chiefComplaint == ""){
			alert("请填写主诉");
			return false;
		}
		expertName=expertName.substring(0,expertName.length-1);
		var add=$.Params.create();
		add.addParams("expertOpenid",expertOpenId);
		add.addParams("memberOpenid",memberId);
		add.addParams("publicNo",brandId); 
		add.addParams("sex",sex);
		add.addParams("birthday",birthday);
		add.addParams("height",height);
		add.addParams("weight",weight);
		add.addParams("occapation",occapation);
		add.addParams("admissionTime",admissionTime);
		add.addParams("chiefComplaint",chiefComplaint);
		add.addParams("illPrenent",illPrenent);
		add.addParams("illPost",illPost);
		add.addParams("illPersonal",illPersonal);
		add.addParams("illFamily",illFamily);
		

		add.addParams("admissionCheckId",admissionChecksj);
		add.addParams("labCheckId",labChecksj);
		add.addParams("imgCheckId",imgChecksj);
		add.addParams("otherCheckId",otherChecksj);
		
		add.addParams("admissionCheck",admissionCheck);
		add.addParams("labCheck",labCheck);
		add.addParams("imgCheck",imgCheck);
		add.addParams("otherCheck",otherCheck);
		
		add.addParams("weight",weight);
		add.addParams("occaption",occaption);
		add.addParams("allergryHistory",allergryHistory);
		//add.addParams("remark",remark);
		
		add.addParams("preDiagnosis",preDiagnosis);
		add.addParams("treatPlan",treatPlan);
		add.addParams("remark",remark);
		add.addParams("filed1",expertName); 
		add.addParams("eopenId",eopenId);
		add.addParams("expertName1",expertName1);
		add.addParams("filed4",place); 
		add.addParams("id",orderId);
		add.ajax(getIP()+"memberOrder.action?update",function(data){
			alert("您的信息已成功受理，请至专家预约记录中查看处理情况!");
			//window.location.href=getIP()+"weixin/hy/memberOrderfj.jsp?orderId="+data.orderId+"&ryjcId="+ryjcId+"&sysjcId="+sysjcId+"&yxxjcId="+yxxjcId+"&otherId="+otherId;
	    })
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
    
    
    
    /**
     * 日历控件
     */
    var opt = {};
	opt.date = {
		preset : 'date',
		//   minDate : new Date(2014, 7, 10),
		maxDate : new Date()
	};
	opt.datetime = {
		preset : 'datetime',
		minDate : new Date(2012, 3, 10, 9, 22),
		maxDate : new Date(2014, 7, 30, 15, 44),
		stepMinute : 5
	//分钟间隔
	};
	opt.time = {
		preset : 'time',
		minDate : new Date(2012, 3, 10, 9, 22),
		maxDate : new Date(2012, 3, 10, 15, 44),
		stepMinute : 2
	//分钟间隔
	};
	$('#admissionTime').scroller('destroy').scroller($.extend(opt['date'], {
		theme : 'default',//主题
		mode : 'scroller',
		display : 'bottom',//显示位置
		dateOrder : 'yymmdd',//显示格式
		lang : 'zh',//显示语言
		dateFormat: 'yy-mm-dd' // 日期格式
	}));

	$("#hzsex img").on("click",function(){
		if($(this).attr("type"))
		{ 
			type=$(this).attr("type");
			//alert(type);
		}
		if($(this).attr("sex"))
		{
 		 	sex=$(this).attr("sex");
 		 	//alert(sex);
		}
 		 $(this).attr("src","weixin/images/sex1.png");
 		 $(this).siblings().attr("src","weixin/images/sex0.png");
 	})
	 var myScroll;
	function loaded() {
		myScroll = new IScroll('wrapper',{checkDOMChanges: true });
	}
	document.addEventListener('DOMContentLoaded', loaded, false);
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
  * 获取已上传的图片
  * @return
  */
 function getData(typeNo){
 		$("#content").find("li[name=1]").remove();
		var sel=$.Params.create();
		sel.addParams("orderId",orderId); 
		sel.addParams("filed4",typeNo); 
		//alert(orderId);
		sel.ajax(getIP()+"medicalRecord.action?list",function(data){
			var html="";
			$.each(data.rows,function(i,val){
				var remark=val.filed3;
				if(remark == null){
					remark="";
				}
//				<li class="table-view-cell">
//				<img src="data/order/1.jpg" style="width:200px;height:200px;" />
//			    <textarea placeholder="请输入备注" id="remark"></textarea>
//				</li>
				html+="<li name='1' class='table-view-cell'>" +
						"<img src='data/order/"+val.name+"' style='width:200px;height:200px;' />" +
						"<textarea placeholder='请输入备注'  id='"+val.id+"'>"+remark+"</textarea></li>";
//				if(val.filed4 == "1"){
//					html1+="<li class='table-view-cell titleclass'><img style='width:50%;margin-bottom:5px;' src='data/order/"+val.name+"' /> <p>备注：</p><p><textarea id='"+val.id+"' style='width:100%'>"+remark+"</textarea></p></li>";
//				}else if(val.filed4 == "2"){
//					html2+="<li class='table-view-cell titleclass'><img style='width:50%;margin-bottom:5px;' src='data/order/"+val.name+"' /><p>备注：</p><p><textarea id='"+val.id+"' style='width:100%'>"+remark+"</textarea></p></li>";
//				}else if(val.filed4 == "3"){
//					html3+="<li class='table-view-cell titleclass'><img style='width:50%;margin-bottom:5px;' src='data/order/"+val.name+"' /><p>备注：</p><p><textarea id='"+val.id+"' style='width:100%'>"+remark+"</textarea></p></li>";
//				}else{
//					html4+="<li class='table-view-cell titleclass'><img style='width:50%;margin-bottom:5px;' src='data/order/"+val.name+"' /><p>备注：</p><p><textarea id='"+val.id+"' style='width:100%'>"+remark+"</textarea></p></li>";
//				}
			})
			$("#content li:eq(1)").after(html);
		})
	} 
 
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
	
	/**
	 * 上传到微信服务器
	 * @param typeorder
	 * @param typeNo
	 * @return
	 */
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
	
	/**
	 * 上传到本地数据库
	 * @param imgurl
	 * @param typeorder
	 * @param typeNo
	 * @return
	 */
	function getmediaId(imgurl,typeorder,typeNo){
  		 var addimg=$.Params.create();
	    addimg.addParams("orderId",orderId); 
	    addimg.addParams("name",imgurl); 
	    addimg.addParams("place",place); 
	    addimg.addParams("filed2",typeorder); 
	    addimg.addParams("filed4",typeNo); 
	    
	    addimg.ajax(getIP()+"medicalRecord.action?add",function(data){
	    	getData(typeNo);
		})
  }
	
	
	function getSelImg(name,remark){
	window.localStorage.setItem("remarkCon",remark);
	window.location.href="weixin/sf.jsp?type=2&imgname="+name+"&id=0";
}
	
	
	
	
	