getData();

function getData(){
	var sel=$.Params.create();
   	sel.addParams("page",0);
   	sel.addParams("rows",rows);
   	sel.addParams("memberId",memberId)
	getPageData(sel,getIP()+"feedBack.action?list",function(data){
   		if(data.success){
   			var len = data.total;
	   		var html="";
			if(len >0){
				$.each(data.rows,function(i,val){	
					html+="<div class='clasFB_record'>"+
							"<h3 class='classFB_className'><i>&gt;</i> "+val.filed1+"</h3>"+
							"<p class='classDB_content'>"+val.content+"</p>"+
							"<p class='classDB_content'><lable>反馈时间:</lable>"+val.createTime+"</p>"+
							"<div class='classFB_del'><a class='classFB_delBtn' onclick='delClassFB(\""+val.id+"\")'>删除</a></div>"+
							"</div>";
				})
			}else{
				html="暂无数据";
			}
			$(".pct_fadeBackContent").html(html);
   		}else{
   			alert(data.msg);
   		}
   	});
}
		
/*function delClassFB(id){
	$("#modalcont").html("确定删除吗？");
	$("#responsive").modal('toggle');
	
	$("#subBtn").on("click",function(){
		del(id);
	})	
}*/

function delClassFB(id){
	if(confirm("确定要删除吗？")){
		var del=$.Params.create();
		del.addParams("id",id);
		del.ajax(getIP()+"feedBack.action?delMore",function(data){
	  		if(data.success){
	  			getData();
			}
		})
	}
	
}


