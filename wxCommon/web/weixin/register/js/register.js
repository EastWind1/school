$(function(){
	$("#check").on("click",function(){
		var check=$("#check").attr("checked")
		if(check=="checked"){
			$("#check").attr("checked",false);
		}else{
			$("#check").attr("checked",true);
		}
		})
	
	$("#iagree").on("click",function(){
		window.location.href="weixin/hy/register.jsp";
	})
	
	var getcode="";
	//getcode=1234;
	$("#getcode").on("click",function(){
		//alert("测试期间，请用测试验证码【1234】，谢谢！");
		//getcode=1234;
		//return false;
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
	
	
	$("#reg1").on("click",function(){
		var check=$("#check").attr("checked")
		var tel=$("#tel").val();
		var code=$("#code").val();
		var pwd=$("#pwd").val();
		var length=pwd.length;
		if(tel==""){
			alert("输入的手机号不能为空");
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
		if(length<6||length>10){
			alert("请输入6-10位密码");
			return false;
		}
		if(check!="checked"){
			alert("同意云ICU医生用户协议后才能注册");
			return false;
		}
		var sel=$.Params.create();
		sel.addParams("tel",tel)
		sel.ajax(getIP()+"member.action?telsel",function(data){
			if(data.success){
				window.localStorage.setItem("tel",tel);
				window.localStorage.setItem("code",code);
				window.localStorage.setItem("pwd",pwd);
				window.location.href="weixin/register/addInfo.jsp";
			}else{
				alert(data.msg);
				return false;
			}
		})
		
		
	})
	
	$("#hospitalName1").on("click",function(){
		var name=$("#name").val();
		if(name==""){
			alert("姓名不能为空");
			return false;
		}
		window.localStorage.setItem("name",name);
		window.location.href="weixin/register/checkProvince.jsp";
	})
	var province=window.localStorage.getItem("province");
	var city=window.localStorage.getItem("city");
	var hospitalName=window.localStorage.getItem("hospitalName");
	var hospitalOffices=window.localStorage.getItem("hospitalOffices");
	var jobTitle=window.localStorage.getItem("jobTitle");
	var tel=window.localStorage.getItem("tel");
	var pwd=window.localStorage.getItem("pwd");
	var name=window.localStorage.getItem("name");
	$("#hospitalOffices1").on("click",function(){
		if(hospitalOffices==null||hospitalOffices=="null"){
			alert("选择医院后才能选择科室");
		}else{
			window.location.href="weixin/register/checkHospitalOffices.jsp";
		
		}
	})
	$("#jobTitle1").on("click",function(){
		if(jobTitle=="null"||jobTitle==null){
			alert("选择医院后才能选择职称");
			
		}else{
			window.location.href="weixin/register/checkJobTitle.jsp";
		
		}
	})
	$("#reg2").on("click",function(){
		var hospitalName=$("#hospitalName3").val();
		if(hospitalName==""){ 
			alert("医院不能为空");
			return false;
		}
		window.localStorage.setItem("hospitalName",hospitalName);
		window.location.href="weixin/register/checkHospitalOffices.jsp";
	})
	$("#reg3").on("click",function(){
		var hospitalOffices2=$("#hospitalOffices2").val();
		if(hospitalOffices2==""){
			alert("科室不能为空");
			return false;
		}
		window.localStorage.setItem("hospitalOffices",hospitalOffices2);
		window.location.href="weixin/register/checkJobTitle.jsp";
	})
	$("#reg4").on("click",function(){
		var jobTitle=$("#jobTitle3").val();
		if(jobTitle==""){
			alert("职称不能为空");
			return false;
		}
		window.localStorage.setItem("jobTitle",jobTitle);
		window.location.href="weixin/register/addInfo.jsp";
	})
	
	
	$("#yiyuan").html(hospitalName);
	$("#keshi").html(hospitalOffices);
	$("#zhicheng").html(jobTitle);
	$("#name").val(name);

	$("#reg").on("click",function(){
		var hospital=$("#yiyuan").text();
		var Name=$("#name").val();
		if(Name==""){
			alert("请填写真实姓名");
			return false;
		}
		
		if(hospital==""){
			alert("请选择医院");
			return false;
		}
		var p=$.Params.create();
		p.addParams("publicNo",brandId); 
		p.addParams("openId",openId);
		p.addParams("province",province); 
		p.addParams("name",name);
		p.addParams("city",city);
		p.addParams("hospitalName",hospitalName); 
		p.addParams("hospitalOffices",hospitalOffices);
		p.addParams("jobTitle",jobTitle);
		p.addParams("tel",tel);
		p.addParams("filed1",pwd);
		p.ajax(getIP()+"member.action?add",function(data){
			if(data.success){
				//alert("注册成功");
				//window.location.href="weixin/event/zhenggao.jsp";
				wx.closeWindow();
			}
		})
	})
	
})

