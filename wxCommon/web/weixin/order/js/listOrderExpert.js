getData();	
	/*var p=$.Params.create();
		p.addParams("openId",openId); 
	    p.ajax(getIP()+"expert.action?list",function(data){
	    	var exId=data.rows[0].id;
	    	getData(exId);
	    })*/
	function getData(){
		var p=$.Params.create();
		p.addParams("filed2",openId); 
	    p.ajax(getIP()+"memberOrder.action?list",function(data){
	    	var html="";
	    	$.each(data.rows,function(i,val){	
	    		var state=val.state;
		   		if(state == "1"){
		   			state="<font color='#42CA85'>已同意</font>";
		   		}else if(state == "2"){
		   			state="预约成功";
		   		}else if(state == "0"){
		   			state="<font color='#CA4255'>已拒绝</font>";
		   		}else if(state == "3"){
		   			state="<font color='#0B77BF'>待处理</font>";
		   		}else{
		   			state="<font color='#ccc'>已关闭</font>";
		   		}
		   		var sex="";
		   		if(val.sex==1){
		   			sex="男";
		   		}else{
		   			sex="女";
		   		}
		   		var time="待确定";
		   		var startDate=val.consultationTime;
		   		var start="";
		   		if(startDate != "" && startDate != null){
		   			start=startDate.substring(0,startDate.lastIndexOf(":"));
		   		}
		   		var endDate=val.filed5;
		   		var end="";
				if(endDate != "" && endDate != null){
		   			end=endDate.substring(endDate.lastIndexOf(" ")+1,endDate.lastIndexOf(":"));
		   			time=start+"~"+end;
		   		}
				
		   		html+="<li class='table-view-cell' style='padding:5px !important;margin-bottom:5px;'><div class='input-row'>" +
		   				"<label class='titlezj'>医生：</label>" +
		   				"<label class='conte'>"+val.memberName+"</label></div>" +
		   				"<div class='input-row' style='height:48px;'><label class='titlezj'>所在医院：</label>" +
		   				"<label class='conte'>"+val.memberHospital+"</label></div>"+
		   				"<div class='input-row'><label class='titlezj'>咨询时间：</label>" +
		   				"<label class='conte'>"+time+"</label></div>" +
		   				"<div class='input-row'><label class='titlezj'>预约状态：</label>" +
		   				"<label class='conte'>"+state+"</label></div>" +
		   				"<div class='input-row last'><a onclick='getdetail(\""+val.id+"\")'>查看详情</a>" +
		   				"<a class='nozj' onclick='isagree(\""+val.id+"\",0)'>拒绝</a>" +
		   				"<a class='agree' onclick='isagree(\""+val.id+"\",1)'>同意</a></div></li>";
	    	})
	    	$("#content").html(html);
	    })
	}
	
	function getExpert(eid){
		window.location.href="weixin/hy/classOnlineDetails.jsp?eid="+eid;
	}
	

function orderfj(oid){
	window.location.href="weixin/order/listOrderDoctor.jsp";
}
function isagree(oid,isagree){
	var agree;
		if(isagree == 1){
			agree="同意";
		}else{
			agree="拒绝";
		}
		if(confirm("确定要"+agree+"吗？")){
			var agree=$.Params.create();
			agree.addParams("id",oid); 
			agree.addParams("state",isagree); 
		    agree.ajax(getIP()+"memberOrder.action?updateAgree",function(data){
		    	alert(data.msg);
		    	getData();	
		    })
	    }
}
function getdetail(id){
	window.location.href="weixin/order/orderDetailZj.jsp?id="+id;
}
$(function(){
	$("#myOrder").on("click",function(){
		window.location.href="weixin/order/listOrderDoctor.jsp";
	})
})