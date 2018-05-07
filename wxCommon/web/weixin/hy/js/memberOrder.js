$(function(){
	$("#sumSubmit,#sumSubmit1,#sumSubmit2,#sumSubmit3").on("click",function(){
		var filed4=$(this).attr("filed4");
		var uuid=getUUID();
		window.location.href=getIP()+"weixin/hy/memberOrderfj.jsp?filed4="+filed4+"&filed2="+uuid;
	})
//	function upload(){
//		alert("123");
//		window.location.href=getIP()+"weixin/hy/memberOrderfj.jsp";
//		
//	}
	var expertOpenId=GetQueryString("eid");
	var expId=GetQueryString("expId");
	var listrole=$.Params.create();
	listrole.addParams("type","1");
	listrole.addParams("publicNo",brandId); 
	listrole.ajax(getIP()+"expert.action?list",function (data){
		if(data.success){
			var html="<option value='0'>请选择专家</option>";
			$.each(data.rows,function(i,val){
				html+="<option openId='"+val.openId+"' value='"+val.id+"'>"+val.name+"</option>";
			})
			$("#expertId1").html(html);
			$("#expertId1").val(expId);
			$("#expertId1").next().css("display","inline-block");
			$("#expertId2").html(html);
			$("#expertId3").html(html);
		}
	}); 	
	
	$(".tdval select").each(function(){
		if($(this).find("option:selected").text()!="请选择专家"){
			$(this).next().css("display","inline-block");
		}else{
			$(this).next().css("display","none");
		}
	})
	
	$(".tdval select").on("change",function(){
		if($(this).find("option:selected").text()!="请选择专家"){
			$(this).next().css("display","inline-block");
		}else{
			$(this).next().css("display","none");
		}
	})
	
	$(".yue_qingchu").on("click",function(){
		//$(this).prev().find("option:first").attr("selected",true);
		$(this).prev().val("0");
		$(this).css("display","none");
	})
	
	
	/**
	 * 发起预约
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
//	var admissionCheckId=$("#admi").val();
//	var labCheckId=
//	var imgCheckId=
//	var otherCheckId=
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
	
	var ryjcId=getUUID();
	var sysjcId=getUUID();
	var yxxjcId=getUUID();
	var otherId=getUUID();
	add.addParams("admissionCheckId",ryjcId);
	add.addParams("labCheckId",sysjcId);
	add.addParams("imgCheckId",yxxjcId);
	add.addParams("otherCheckId",otherId);
	
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
			add.ajax(getIP()+"memberOrder.action?add",function(data){
				//alert("您的信息已成功受理，请至专家预约记录中查看处理情况!");
				window.location.href=getIP()+"weixin/hy/memberOrderfj.jsp?orderId="+data.orderId+"&ryjcId="+ryjcId+"&sysjcId="+sysjcId+"&yxxjcId="+yxxjcId+"&otherId="+otherId;
		    })
 	})
 	/**
	 * 发起预约
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
	/*$('#birthday').scroller('destroy').scroller($.extend(opt['date'], {
		theme : 'default',//主题
		mode : 'scroller',
		display : 'bottom',//显示位置
		dateOrder : 'yymmdd',//显示格式
		lang : 'zh',//显示语言
		dateFormat: 'yy-mm-dd' // 日期格式
	}));*/
	$(".tdval img").on("click",function(){
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
})	