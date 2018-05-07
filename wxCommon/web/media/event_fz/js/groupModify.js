
$(function(){
	var eid=GetQueryString("eid");
	var sel=$.Params.create();
	sel.addParams("id",eid);
	sel.ajax(getIP()+"eventgagroup.action?list",function(data){
		if(data.success){
			var val=data.rows[0];
			$("#group").val(val.groupName);

		}
		
	})
	

	
	
	$("#modifyVal").on("click",function(){
		var group=$("#group").val().trim();
		if(group==""){
			alert("请填写分组！");
			return false;
		}
		
	
	
		var update=$.Params.create();
		update.addParams("groupName",group);
		update.addParams("id",eid);
		update.ajax(getIP()+"eventgagroup.action?update",function(data){
			if(data.success){
				window.location.href="media/event_fz/groupList.jsp";
			}else{
				alert(data.msg);
				return false;		
			}
		});
		
	})
	
})