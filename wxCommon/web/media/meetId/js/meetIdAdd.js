
$(function(){
 
	
	$("#modifyVal").on("click",function(){
		var loginName=$("#loginName").val();
		var password=$("#password").val();
		var onlineNo=$("#onlineNo").val();
		var capacity=$("#capacity").val();
		var remark=$("#remark").val();

		var add=$.Params.create();
		add.addParams("loginName",loginName);
		add.addParams("password",password);
		add.addParams("onlineNo",onlineNo);
		add.addParams("capacity",capacity);
		add.addParams("operator",userName);
		add.addParams("filed4","3");
		add.addParams("remark",remark);
		add.ajax(getIP()+"meetid.action?add",function(data){
			if(data.success){
				window.location.href="media/meetId/meetIdList.jsp";
			}else{
				alert(data.msg);
				return false;		
			}
		});
		
	})
	
})