getData();
function getData(){
	var sel=$.Params.create();
   	sel.addParams("id",memberId);
   	sel.ajax(getIP()+"member.action?list",function(data){
   		var val=data.rows[0];
   		
   		$("#pct_userName").val(val.name);
   		$("#pct_userPhone").val(val.tel);
   		$("#pct_userBirthday").val(val.birthday);
   		$(".pct_sex img[sex="+val.sex+"]").attr("src","PC/image/sex1.png").attr("checked","checked");
   		$(".pct_sex img[sex="+val.sex+"]").siblings().attr("src","PC/image/sex0.png").removeAttr("checked");

   		$("#pct_userEmail").val(val.email);
   		$("#pct_userHospital").val(val.hospitalName);
   		$("#pct_userPost").val(val.jobTitle);
   	});
}
		
$("#pwd_newRe").on("focus",function(){
	var pwd=$("#pwd_old").val();
	var newPwd=$("#pwd_new").val();
	if(pwd != ""){
		if(pwd==newPwd){
			$(".newPwd").html("新密码与原密码一致");
		}else{
			$(".newPwd").html("");
		}
	}
})

$("#pct_infoUpdate").on("click",function(){
	$("#subBtn").show();
	var pwd=$("#pwd_old").val();
	var newPwd=$("#pwd_new").val();
	var pwd_newRe=$("#pwd_newRe").val();
	
	if(pwd == ""){
		$(".oldPwd").html("*密码不能为空！");
		return false;
	}
	if(newPwd == ""){
		$(".newPwd").html("*密码不能为空！");
		return false;
	}
	if(pwd_newRe == ""){
		$(".reNewPwd").html("*密码不能为空！");
		return false;
	}
	if(newPwd != pwd_newRe){
		$(".reNewPwd").html("*两次输入密码不一致！");
		return false;
	}
	var reg=/^[a-zA-Z0-9]{6,10}$/;
	if(!(reg.test(newPwd))){
		alert("密码请输入6-10位数字和字母");
		return false;
	}
	var p=$.Params.create();
	p.addParams("memberId",memberId);
	p.addParams("oldpwd",pwd);
	p.addParams("newpwd",newPwd);
	p.ajax(getIP()+"member.action?updatePwd",function(data){
		if(data.result == 0){
			$(".oldPwd").html("*原密码输入不正确");
		}else{
			var back = $.Params.create();
		   	back.ajax(getIP()+"member.action?logOut", function (data) {
		   		if(data.success){
		   	 		window.localStorage.setItem("openId",null);
		   	 		window.location.href=getIP()+"PC/newIndex.jsp";
		   	 	}
			})
		}
	});
	
})

