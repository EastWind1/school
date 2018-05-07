
$(function(){
	var update=$.Params.create();
	var id=window.localStorage.getItem("id");
	var hospitalName=window.localStorage.getItem("hospital");
	var hospitalOffices=window.localStorage.getItem("offices");
	var post=window.localStorage.getItem("post");
	var email=window.localStorage.getItem("email");
	var tel=window.localStorage.getItem("tel");
	var name=window.localStorage.getItem("name");
	var sex=window.localStorage.getItem("sex");
	if(post=="null"||post==null){
		post="";
	}
	if(email==null||email=="null"){
		email="";
	}
	$("#name").val(name);
	$("#email").val(email);
	$("#tel").val(tel);
	$("#hospitalName3").val(hospitalName);
	$("#hospitalOffices2").val(hospitalOffices);
	$("#post").val(post);
	$("#sex img[sex="+sex+"]").attr("src","weixin/images/sex1.png");
	$("#sex img[sex="+sex+"]").siblings().attr("src","weixin/images/sex0.png").removeAttr("checked");
	$("#reg").on("click",function(){
	var name=$("#name").val();
		if(name==""){
			alert("姓名不能为空");
			return false;
		}
		update.addParams("id",id);
		update.addParams("name",name);
		update.ajax(getIP()+"member.action?update",function(data){
			if(data.success){
				window.location.href="weixin/register/Info.jsp";
			}
		})
	})
	
	$("#sex img").on("click",function(){
		if($(this).attr("sex"))
		{
 		 	sex=$(this).attr("sex");
 		 	//alert(sex);
		}
 		 $(this).attr("src","weixin/images/sex1.png");
 		 $(this).siblings().attr("src","weixin/images/sex0.png");
 	})
	$("#regSex").on("click",function(){
		
		var sex=$("#sex img[src='weixin/images/sex1.png']").attr("sex");
		update.addParams("id",id);
		update.addParams("sex",sex);
		update.ajax(getIP()+"member.action?update",function(data){
			if(data.success){
				window.location.href="weixin/register/Info.jsp";
			
			}
		})
	})
	var getcode=1234;
	$("#getcode").on("click",function(){
		alert("测试期间，请用测试验证码【1234】，谢谢！");
		getcode=1234;
		return false;
		var tel=$("#tel").val();
		if(!valPhone(tel)){
			alert("请输入正确的手机号");
			return false;
		}
		var p=$.Params.create();
		p.addParams("tel",tel);
		p.ajax(getIP()+"member.action?sendCode",function(data){
			if(data.success){
				getcode=data.code;
				alert("验证码获取成功，稍后会发送到您的手机上，请注意查收");
			}else{
				alert("验证码获取失败，5分钟后重新获取");
				//$("#bingsucc").html("验证码获取失败，5分钟后重新获取");
				//alert("验证码获取失败，5分钟后重新获取")
			}
		})
	})
	
	
		
	$("#regEmail").on("click",function(){
		var email=$("#email").val();
		if(email==""){
			alert("邮箱不能为空");
			return false;
		}
		if(!checkEmail(email)){
			alert("邮箱格式不正确！");
			return false;
		}
		update.addParams("id",id);
		update.addParams("email",email);
		update.ajax(getIP()+"member.action?update1",function(data){
			if(data.success){
				window.location.href="weixin/register/Info.jsp";
			}else{
				alert(data.msg);
				return false;
			}
		})
	})
	
	$("#regTel").on("click",function(){
		var tel=$("#tel").val();
		var code=$("#code").val();
		if(tel==""){
			alert("手机号不能为空");
			return false;
		}
		if(!valPhone(tel)){
			alert("请输入正确手机号");
			return false;
		}
		if(code==""){
			alert("请输入验证码");
			return false;
		}
		if(code!=getcode){
			alert("请输入正确的验证码");
			return false;
		}
		update.addParams("id",id);
		update.addParams("tel",tel);
		update.ajax(getIP()+"member.action?update",function(data){
			if(data.success){
				window.location.href="weixin/register/Info.jsp";
			}
		})
	})
	
	$("#pwd2").on("blur",function(){
		var pwd1=$("#pwd1").val();
		var pwd2=$("#pwd2").val();
	if(pwd1 != ""){
		if(pwd1==pwd2){
			alert("新密码与原密码一致");
		}
	}
})
	$("#regPwd").on("click",function(){
		var pwd1=$("#pwd1").val();
		var pwd2=$("#pwd2").val();
		var pwd3=$("#pwd3").val();
		var len1=pwd2.length;
		var len2=pwd3.length;
			if(pwd1==""){
				alert("原密码不能为空");
				return false;
			}
			if(pwd2==""){
				alert("新密码不能为空");
				return false;
			}
			if(len1<6||len1>10){
				alert("请输入6-10位密码");
				return false;
			}
			if(len2<6||len2>10){
				alert("请输入6-10位密码");
				return false;
			}
			if(pwd3==""){
				alert("确认密码不能为空");
				return false;
			}
			if(pwd2!=pwd3){
				alert("确认密码不正确");
				return false;
			}
			update.addParams("memberId",id);
			update.addParams("oldpwd",pwd1);
			update.addParams("newpwd",pwd3);
			update.ajax(getIP()+"member.action?updatePwd",function(data){
				if(data.result==1){
					alert("密码修改成功！");
					window.location.href="weixin/register/Info.jsp";
				}else{
					alert("原密码输入错误");
					return false;
				}
			})
		})
		
		$("#regHospitalName").on("click",function(){
		var hospitalName=$("#hospitalName3").val();
		var id=window.localStorage.getItem("id");
		var province=window.localStorage.getItem("privince");
		var city=window.localStorage.getItem("city")
		if(hospitalName==""){
			alert("医院名称不能为空");
			return false;
		}
		
		update.addParams("id",id);
		update.addParams("HospitalName",hospitalName);
		update.addParams("province",province);
		update.addParams("city",city);
		update.ajax(getIP()+"member.action?update",function(data){
			if(data.success){
				window.location.href="weixin/register/Info.jsp";
			}
		})
	})
	
	$("#regOffices").on("click",function(){
		var id=window.localStorage.getItem("id");
		var hospitalOffices=$("#hospitalOffices2").val();
		if(hospitalOffices==""){
			alert("科室不能为空");
			return false;
		}
		
		update.addParams("id",id);
		update.addParams("hospitalOffices",hospitalOffices);
		update.ajax(getIP()+"member.action?update",function(data){
			if(data.success){
				window.location.href="weixin/register/Info.jsp";
			}
		})
	})
	

	$("#regTitle").on("click",function(){
		var jobTitle=$("#jobTitle1").val();
		var id=window.localStorage.getItem("id");
		if(jobTitle==""){
			alert("职称不能为空");
			return false;
		}
		update.addParams("id",id);
		update.addParams("jobTitle",jobTitle);
		update.ajax(getIP()+"member.action?update",function(data){
			if(data.success){
				window.location.href="weixin/register/Info.jsp";
			}
		})
	})
	
	$("#regPostqt").on("click",function(){
		var post=$("#postqt").val();
		var id=window.localStorage.getItem("id");
		if(post==""){
			alert("职务不能为空");
			return false;
		}
		update.addParams("id",id);
		update.addParams("post",post);
		update.ajax(getIP()+"member.action?update",function(data){
			if(data.success){
				window.location.href="weixin/register/Info.jsp";
			}
		})
	})
})