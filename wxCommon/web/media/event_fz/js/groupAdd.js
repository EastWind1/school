
$(function(){
	$("#modifyVal").on("click",function(){
		var group=$("#group").val().trim();
		if(group==""){
			alert("请填写分组名称！");
			return false;
		}
		
	
		var add=$.Params.create();
		add.addParams("groupName",group);
		add.ajax(getIP()+"eventgagroup.action?add",function(data){
			if(data.success){
				window.location.href="media/event_fz/groupList.jsp";
			}else{
				alert(data.msg);
				return false;		
			}
		});
		
	})
	
	
})