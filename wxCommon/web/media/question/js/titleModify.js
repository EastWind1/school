$(function(){	
	var eid=GetQueryString("eid");
	
	
	var p=$.Params.create();
	
	p.addParams("id",eid); 
	
	p.ajax(getIP()+"questiontable.action?list",function(data){
		var html="";
		var val=data.rows[0];
		$("#question").val(val.question);
   		})
		
	
	
	
	/*详情页修改事件*/
	$("#modifyVal").on("click",function(){
		var question=$("#question").val();
				var update=$.Params.create();
				update.addParams("question",question);
				update.addParams("id",eid); 
				update.ajax(getIP()+"questiontable.action?update",function (data){
					if(data.success){
						alert(data.msg);
						window.location.href="media/question/titleList.jsp";
					}else{
						alert(data.msg);
						return false;
					}

				});
						
		})
		
		
		

	
})