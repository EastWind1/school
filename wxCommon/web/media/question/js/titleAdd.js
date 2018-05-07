
$(function(){
	$("#modifyVal").on("click",function(){
		var question=$("#question").val();
		if(question==""){
			alert("请填写问题内容！");
			return false;
		}
	
	
		var add=$.Params.create();
		add.addParams("question",question);
		add.addParams("filed4","1");
		add.addParams("state",2);
		add.addParams("openId","123456789");
		add.ajax(getIP()+"questiontable.action?add",function(data){
			if(data.success){
				window.location.href="media/question/titleList.jsp";
			}else{
				alert(data.msg);
				return false;		
			}
		});
		
	})
	
})