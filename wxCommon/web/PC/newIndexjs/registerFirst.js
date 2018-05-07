$(function(){

	$("#agree_box").on("click",function(){
		var regBtn=$(".reg_now");
		var checked=$(this).attr("checked");
		if(checked=="checked")
  		{
			regBtn.attr("disabled","disabled").removeClass("active");
			$(this).attr("src","PC/image/type0.png");
			$(this).removeAttr("checked");
			regBtn.unbind();
  		}
		else
		{
			regBtn.removeAttr("disabled").addClass("active");
			$(this).attr("src","PC/image/type1.png");
			$(this).attr("checked","checked");
			
			
			var reg=$(this).parent().find("a");
			openId=null;
		}
		})
	$("#readys").on("click",function(){
 		window.open(getIP()+"weixin/hy/registerpc.jsp");
 	})	
 	
 	var getcode="";
	getcode=1234;
	$("#getcode").on("click",function(){
		var sel=$.Params.create();
		var tel=$("#tel").val();
		if(!valPhone(tel)){
			alert("请输入正确的手机号");
			return false;
		}
		sel.addParams("tel",tel);
		sel.ajax(getIP()+"member.action?list",function(data){
			if(data.success){
				var len=data.rows.length;
				if(len>0){
					alert("已经注册了！");
				}else{
					//getcode=1234;
					//alert("测试期间，请用测试验证码【1234】，谢谢！");
					//return false;
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
				}
			}
		})
	
	})
	$("#reg").on("click",function(){
		var tel=$("#tel").val();
		var code=$("#code").val();
		var pwd=$("#filed1").val();
		var length=pwd.length;
		if($("#agree_box").attr("checked") != "checked"){
			alert("需要同意云ICU医生用户协议才能注册！");
			return false;
		}
		if(tel==""){
			alert("输入的手机号不能为空");
			return false;
		}
		if(!valPhone(tel)){
			alert("请输入正确手机号");
			return false;
		}
		if(code==""){
			alert("请输入正确的验证码");
			return false;
		}
		if(code!=getcode){
			alert("请输入正确的验证码");
			return false;
		}
		if(length<6||length>10){
			alert("请输入6-10位密码");
			return false;
		}
		var sel=$.Params.create();
		sel.addParams("tel",tel)
		sel.ajax(getIP()+"member.action?telsel",function(data){
			if(data.success){
				window.localStorage.setItem("tel",tel);
				window.localStorage.setItem("code",code);
				window.localStorage.setItem("pwd",pwd);
				window.location.href="PC/register.jsp";
			}else{
				alert(data.msg);
				return false;
			}
		})
		
		
	})
	
})