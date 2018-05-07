$(function(){	
	var eid=GetQueryString("eid");
	var type=GetQueryString("type");
	
	var p=$.Params.create();
	
	p.addParams("id",eid); 
	
	p.ajax(getIP()+"memberrole.action?getList",function(data){
		var html="";
		var val=data.rows[0];
		var email=val.email;
		if(email==null || email=="null"){
			email="";
		}
		$("#name").val(val.name);
		$("#tel").val(val.tel);
		$("#email").val(email);
		$("#onlineNo").val(val.onlineNo);
		$("#memberId").val(val.memberId);
				
   		})
		
	
	
	
	/*详情页修改事件*/
	$("#modifyVal").on("click",function(){
		var name=$("#name").val();
		var tel=$("#tel").val();
		var email=$("#email").val();
		var onlineNo=$("#onlineNo").val();
		var memberId=$("#memberId").val();
		
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

				var update=$.Params.create();
				update.addParams("memberId",memberId);
				update.addParams("name",name);
				update.addParams("tel",tel);
				update.addParams("email",email);
				update.addParams("onlineNo",onlineNo);
				update.addParams("id",eid); 
				update.ajax(getIP()+"memberrole.action?update",function (data){
					if(data.success){
						alert(data.msg);
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