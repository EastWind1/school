getData();

function getData(){
	var sel=$.Params.create();
   	sel.addParams("page",0);
   	sel.addParams("rows",rows);
   	sel.addParams("memberId",memberId);
   	getPageData(sel,getIP()+"logcheckmember.action?list",function(data){
   		if(data.success){
   			var len = data.total;
	   		var html="";
			if(len >0){
				$.each(data.rows,function(i,val){	
					var type=val.type;
					var htmlbutton="";
					if(type==1){
						type="已通过";
					}else{
						type="未通过";
						htmlbutton+=
						"<p class='classDB_content'><lable>未通过原因:</lable>"+val.cause+"</p>";
					}
					html+="<div class='clasFB_record'>"+
					"<h3 class='classFB_className'>"+val.memberName+"</h3>"+
					"<p class='classDB_content'><lable>审核状态:</lable>"+type+"</p>"+
					"<p class='classDB_content'><lable>审核时间:</lable>"+val.createTime+"</p>"+
					htmlbutton+
					"</div>";
				
			})
			
		
   		}else{
   			html="暂无数据";
   		}	
			$("#checkRecord").html(html);
   		}else{
   			alert(data.msg);
   		}
   	});
}

