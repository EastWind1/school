$(function(){	
	var eid=GetQueryString("eid");
	
	
	var p=$.Params.create();
	
	p.addParams("id",eid); 
	
	p.ajax(getIP()+"meetid.action?list",function(data){
		var html="";
		var val=data.rows[0];
		$("#loginName").val(val.loginName);
		$("#password").val(val.password);
		$("#onlineNo").val(val.onlineNo);
		$("#capacity").val(val.capacity);
		$("#remark").val(val.remark);
	})
	
	/*详情页修改事件*/
	$("#modifyVal").on("click",function(){
		var loginName=$("#loginName").val();
		var password=$("#password").val();
		var onlineNo=$("#onlineNo").val();
		var capacity=$("#capacity").val();
		var remark=$("#remark").val();

		var update=$.Params.create();
		update.addParams("loginName",loginName);
		update.addParams("password",password);
		update.addParams("onlineNo",onlineNo);
		update.addParams("capacity",capacity);
		update.addParams("remark",remark);
		update.addParams("id",eid);
				update.ajax(getIP()+"meetid.action?update",function (data){
					if(data.success){
						alert(data.msg);
						window.location.href="media/meetId/meetIdList.jsp";
					}else{
						alert(data.msg);
						return false;
					}

				});
						
		})
		
		
		

	
})