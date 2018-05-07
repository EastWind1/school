$(function(){
	getData();

	function getData(){
		var sel=$.Params.create();
		var eidhtml="";
		sel.addParams("memberOpenId",memberId); 
		sel.addParams("deleteState",1);
		sel.ajax(getIP()+"memberOrder.action?list",function(data){
			var html="";
			if(data.rows.length>0){
				$.each(data.rows,function(i,val){	
					var state=val.state;
					var filed5=val.filed5;
					var date = new Date()
					var timestamp1=date.getTime();
					
					var dt = new Date(filed5.replace(/-/,"/")) 
					var timestamp2=dt.getTime();
					if(filed5==null || filed5==""){
						state="<font color='#42CA85'>处理中</font>";
					}else{
					  if(timestamp1>timestamp2){
						  state="<font color='#ccc'>已结束</font>";
					  }else{
						  state="预约成功";
					  }
					
					}
//			   		if(state == "1"){
//			   			state="<font color='#42CA85'>处理中</font>";
//			   		}else if(state == "2"){
//			   			state="预约成功";
//			   		}else if(state == "0"){
//			   			state="<font color='#CA4255'>处理中</font>";
//			   		}else if(state == "3"){
//			   			state="<font color='#0B77BF'>待处理</font>";
//			   		}else{
//			   			state="<font color='#ccc'>已关闭</font>";
//			   		}
					
					var eids=val.filed1;
					var expertId=val.expertOpenid;
					var expertIds=expertId.split(",");
					var exids=eids.split(",");
					
					var zjhtml="";
					if(val.state==3){
					for(var y=0;y<exids.length;y++){
						if(y==0){
							zjhtml+="<div class='input-row'>" +
			   				"<label class='titlezj'>专家"+parseInt(y+1)+"：</label>" +
			   				"<label class='conte'>"+exids[y]+"</label></div>"
						}else{
							zjhtml+="<div class='input-row'>" +
			   				"<label class='titlezj'>专家"+parseInt(y+1)+"：</label>" +
			   				"<label class='conte'>"+exids[y]+"</label></div>"
						}
						
					}
					}else{
						zjhtml+="<div class='input-row'>" +
		   				"<label class='titlezj'>专家1：</label>" +
		   				"<label class='conte'>"+val.filed3+"<span style='float:right'>"+state+"</span></label></div>"
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
			   		
			   		
			   		html+="<li class='table-view-cell' style='padding:5px !important;margin-bottom:5px;'>" +zjhtml+
			   				"<div class='input-row' style='height:48px;'><label class='titlezj'>所在医院：</label>" +
			   				"<label class='conte'>"+val.zjHositail+"</label></div><div class='input-row'>" +
			   				"<label class='titlezj'>咨询时间：</label>" +
			   				"<label class='conte'>"+time+"</label></div>" +
			   				"<div class='input-row last' style='padding-top:10px;padding-left:5px;'><span style='float:left'>预约状态："+state+"</span></div>"+
							"<div class='input-row last' style='padding-top:10px;padding-left:5px;'><a onclick='detail(\""+val.id+"\")'>查看详情</a><a onclick='del(\""+val.id+"\")'>删除</a></div></li>";

				
			})
			}else{
				html="您还没有预约记录！";
			}
			$("#orderDoctor").html(html);
		})
	}
				
		
				
	
})

function detail(id){
			window.location.href="weixin/order/orderDetail.jsp?id="+id;
		}

function del(id){
	if(confirm("确定要删除吗？")){
	var del=$.Params.create();
	del.addParams("id",id);
	del.addParams("deleteState",0);
	del.ajax(getIP()+"memberOrder.action?updateAgree",function(data){
		if(data.success){
			window.location.href="weixin/order/listOrderDoctor.jsp";
		}
		
	});
	}
}
