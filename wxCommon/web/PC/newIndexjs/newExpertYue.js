getData();

function getData(){
	var sel=$.Params.create();
   	sel.addParams("page",0);
   	sel.addParams("rows",rows);
   	sel.addParams("memberOpenId",memberId);
	sel.addParams("deleteState",1);
   	getPageData(sel,getIP()+"memberOrder.action?list",function(data){
   		if(data.success){
   			var len = data.total;
	   		var html="";
			if(len >0){
				$.each(data.rows,function(i,val){	
					var zjHositail=val.zjHositail;
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
					if(zjHositail==null){
						zjHositail="";
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
					if(expertId == null || expertId=="null"){ 
						expertId = "";
					}  
					if(eids == null || eids == "null"){
						eids = "";
					}
					var expertIds=expertId.split(",");
					var exids=eids.split(",");
					
					
					var zjhtml="";
					if(val.state==3){
					for(var y=0;y<exids.length;y++){
						if(y==0){
							zjhtml+="<div class='input-row'>" +
			   				"<i>&gt;</i><label class='titlezj'>专家"+parseInt(y+1)+"：</label>" +
			   				"<label class='conte'>"+exids[y]+"</label></div>";
						}else{
							zjhtml+="<div class='input-row'>" +
			   				"<i>&gt;</i><label class='titlezj'>专家"+parseInt(y+1)+"：</label>" +
			   				"<label class='conte'>"+exids[y]+"</label></div>";
						}
						
					}
					}else{
						zjhtml+="<div class='input-row'>" +
		   				"<i>&gt;</i><label class='titlezj'>专家1：</label>" +
		   				"<label class='conte'>"+val.filed3+"</label></div>"
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
					html+="<div class='clasFB_record'>"+
					"<h3 class='classFB_className'>"+zjhtml+"</h3>"+
					"<p class='classDB_content'><lable>所在医院:</lable>"+zjHositail+"</p>"+
					"<p class='classDB_content'><lable>咨询时间:</lable>"+time+"</p>"+
					"<p class='classDB_content'><lable>预约状态:</lable>"+state+"</p>"+
					"<div class='classFB_del'><a class='classFB_deltailBtn' onclick='detail(\""+val.id+"\")'>查看详情</a><a class='classFB_delBtn' onclick='del(\""+val.id+"\")'>删除</a></div>"+
					"</div>";
			   		
//			   		html+="<li class='table-view-cell' style='padding:5px !important;margin-bottom:5px;'>" +zjhtml+
//			   				"<div class='input-row' style='height:48px;'><label class='titlezj'>所在医院：</label>" +
//			   				"<label class='conte'>"+val.zjHositail+"</label></div><div class='input-row'>" +
//			   				"<label class='titlezj'>咨询时间：</label>" +
//			   				"<label class='conte'>"+time+"</label></div>" +
//			   				"<div class='input-row last' style='padding-top:10px;padding-left:5px;'><span style='float:left'>预约状态："+state+"</span></div>"+
//							"<div class='input-row last' style='padding-top:10px;padding-left:5px;'><a onclick='detail(\""+val.id+"\")'>查看详情</a><a onclick='del(\""+val.id+"\")'>删除</a></div></li>";

				
			})
			
		
   		}else{
   			html="暂无数据";
   		}	
			$("#expertOrder").html(html);
   		}else{
   			alert(data.msg);
   		}
   	});
}
//function selRecord(id){
//	alert("待提供追加资料");return false;
//	window.location.href=getIP()+"PC/newUploadImg.jsp?id="+id;
//}	
//function sayRecord(ryId,sysId,yxId,qtId){
//	window.location.href=getIP()+"PC/newSayImg.jsp?ryId="+ryId+"&sysId="+sysId+"&yxId="+yxId+"&qtId="+qtId;
//}	
function detail(id){
	window.location.href="PC/newExpertYueDetails.jsp?orderId="+id;
}


function del(id){
	if(confirm("确定要删除吗？")){
		var del=$.Params.create();
		del.addParams("id",id);
		del.addParams("deleteState",0);
		del.ajax(getIP()+"memberOrder.action?updateAgree",function(data){
			if(data.success){
				window.location.href="PC/newExpertYue.jsp";
			}
			
		});
	}
}
