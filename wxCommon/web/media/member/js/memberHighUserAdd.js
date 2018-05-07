
$(function(){
 
	var type=GetQueryString("type");
	
	$("#modifyVal").on("click",function(){
		var filed1=$("#filed1").val();
		var name=$("#name").val();
		var tel=$("#tel").val();
		var email=$("#email").val();
		var onlineNo=$("#onlineNo").val();
		if(name==""){
			alert("请输入姓名");
			return false;
		}
		if(tel==""){
			alert("请输入手机号");
			return false;
		}
		if(!valPhone(tel)){
			alert("请输入正确手机号");
			return false;
		}
		if(email!=""){
			if(!checkEmail(email)){
				alert("邮箱格式不正确！");
				return false;
			}
		}
		if(onlineNo==""){
			alert("请输入会议ID");
			return false;
		}
		if(filed1==""){
			alert("请输入密码");
			return false;
		}
		
		var add=$.Params.create();
		add.addParams("filed2",brandId);
		add.addParams("filed1",filed1);
		add.addParams("name",name);
		add.addParams("onlineNo",onlineNo);
		add.addParams("tel",tel);
		add.addParams("email",email);
		add.addParams("filed4","3");
		add.addParams("type",type);
		add.addParams("state",0);
		add.ajax(getIP()+"memberrole.action?add",function(data){
			if(data.success){
				if(type==2){
				window.location.href="media/member/memberHighUserList.jsp";
				}else if(type==7){
					window.location.href="media/member/memberFamilyUserList.jsp";
				}else{
					window.location.href="media/member/memberSuperUserList.jsp";
				}
			}else{
				alert(data.msg);
				return false;		
			}
		});
		
	})
	
})