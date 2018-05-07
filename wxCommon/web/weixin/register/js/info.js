$(function(){
	var p=$.Params.create();
	p.addParams("openId",openId);
    p.ajax(getIP()+"member.action?list",function(data){
    	var val=data.rows[0];
    	var id=val.id;
    	var post=val.post;
    	var email=val.email;
    	var filed3=val.filed3;
    	var education=val.education;
    	$("#memberName").html(val.name);
    	var sex=val.sex;
    	if(sex == "1"){
    		sex="男";
    	}else if(sex=="2"){
    		sex="女";
    	}else{
    		sex="未填写";
    	}
    	if(post=="null"||post==null){
    		post="未填写";
    	}
    	if(email==null||email=="null"){
    		email="未填写";
    	}
    	if(filed3=="1"){
    		filed3="已认证";
    	}else{
    		filed3="未认证";
    	}
    	if(education=="null" || education==null){
    		education="未填写";
    	}
    	$("#expertRz").html(filed3);
    	$("#sex").html(sex);
    	$("#hospital").html(val.hospitalName);
    	$("#offices").html(val.hospitalOffices);
    	$("#jobTitle").html(val.jobTitle);
    	$("#post").html(post);
    	$("#email").html(email);
    	$("#tel").html(val.tel);
    	$("#education").html(education);
    	window.localStorage.setItem("id",id);
    	window.localStorage.setItem("name",val.name);
    	window.localStorage.setItem("hospital",val.hospitalName);
    	window.localStorage.setItem("offices",val.hospitalOffices);
    	window.localStorage.setItem("post",val.post);
    	window.localStorage.setItem("email",val.email);
    	window.localStorage.setItem("tel",val.tel);
    	window.localStorage.setItem("sex",val.sex);
    	
    })
    $("#xingbie").on("click",function(){
    	window.location.href="weixin/register/updateSex.jsp";
    	
    })
    $("#xingming").on("click",function(){
    	window.location.href="weixin/register/updateName.jsp";
    	
    })
    $("#youxiang").on("click",function(){
    	window.location.href="weixin/register/updateEmail.jsp";
    	
    })
    $("#shouji").on("click",function(){
    	window.location.href="weixin/register/updateTel.jsp";
    	
    })
    $("#pwd").on("click",function(){
    	window.location.href="weixin/register/updatePwd.jsp";
    	
    })
    $("#yiyuan").on("click",function(){
    	window.location.href="weixin/register/updateProvince.jsp";
    	
    })
     $("#keshi").on("click",function(){
    	window.location.href="weixin/register/updateHospitalOffices.jsp";
    	
    })
    
    $("#zhicheng").on("click",function(){
    	window.location.href="weixin/register/updateJobTitle.jsp";
    	
    })
	/* $("#zhiwu").on("click",function(){
    	window.location.href="weixin/register/updateZwTitle.jsp";
    	
    })*/
     $("#zhiwu").on("click",function(){
    	window.location.href="weixin/register/updatePost.jsp";
    	
    })
    $("#zhiwu").on("click",function(){
    	window.location.href="weixin/register/updatePost.jsp";
    	
    })
      $("#xueli").on("click",function(){
    	window.location.href="weixin/register/updateEducation.jsp";
    	
    })
    
    
    //认证
    $("#rzCard").on("click",function(){
    	window.location.href="weixin/register/InfoRz.jsp?id=0";
    })
    
    
})