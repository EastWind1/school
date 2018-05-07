$(function(){
	var id=GetQueryString("id");
	if(id != null){
		getDataById(id);
	}
	
	/**
	 * 添加
	 */
	$("#submitButton").on("click",function(){
		var url=getIP()+"wxPublic.action?add";
		var params=$("#editform").serialize();
		 $.ajax({
		 dataType:"json",
		 type:"post",
		 url:url,
		 data: params,
		 success:function(data){
			 alert(data.msg);
			 if(data.success){
				 window.location.href ="media/weixin/publicNumList.jsp";
			 }
		 },
		 error:function(){
			 alert("保存失败！");
		 }
		 });
	})
	
	/**
	 * 接入
	 */
	$("#accessButton").on("click",function(){
		var url=getIP()+"wxPublic.action?access";
		var params=$("#editform").serialize();
		 $.ajax({
		 dataType:"json",
		 type:"post",
		 url:url,
		 data: params,
		 success:function(data){
			 alert(data.msg);
			 if(data.success){
				 window.location.href ="media/weixin/publicNumList.jsp";
			 }
		 },
		 error:function(){
			 alert("保存失败！");
		 }
		 });
	})
	
	/**
	 * 根据id获取数据
	 */
	function getDataById(id){
		var sel=$.Params.create();
    	sel.addParams("id",id);
    	sel.ajax(getIP()+"wxPublic.action?list",function(data){
    		if(data.success){
    			var val=data.rows[0];
    			$("#id").val(id);
    			$("#publicType").val(val.type);
    			$("#url").val(val.url);
    			$("#wxToken").val(val.wxToken);
    			$("#publicNo").val(val.publicNo);
    			$("#name").val(val.name);
    			$("#appId").val(val.appId);
    			$("#appSecret").val(val.appSecret);
    			$("#loginName").val(val.loginName);
    			$("#loginPwd").val(val.loginPwd);
    		}else{
    			alert(data.msg);
    		}
    	})
	}
})