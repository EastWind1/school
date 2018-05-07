$(function(){
	
 	/**
 	 * 城市
 	 */
// 	$("#province").on("change",function(){
// 		var provinceId=$(this).val();
// 		var city="<option selected='selected'>请选择城市</option>";
// 		for(var y=1;y<china[provinceId].length;y++){
// 	 		city+="<option value="+china[provinceId][y]+">"+china[provinceId][y]+"</option>";
// 	 	}
// 		$("#city").html(city);
//// 		alert()
// 	})
// 	/**
// 	 * 医院
// 	 */
// 	$("#city").on("change",function(){
// 		var cityName=$(this).val();
// 		var hos="<option selected='selected'>请选择医院</option>";
// 		for(var i=0;i<hospital.length;i++){
// 			if(cityName == hospital[i][0]){
// 				for(var y=1;y<hospital[i].length;y++){
// 					hos+="<option value="+hospital[i][y]+">"+hospital[i][y]+"</option>";
// 				}
// 				
// 			}
// 			
// 		}
// 		$("#hospitalName").html(hos);
// 	})
 		$(".tdval img").on("click",function(){
			if($(this).attr("sex"))
			{
	 		 	sex=$(this).attr("sex");
	 		 	//alert(sex);
			}
	 		 $(this).attr("src","weixin/images/sex1.png");
	 		 $(this).siblings().attr("src","weixin/images/sex0.png");
	 	})
		var p=$.Params.create();
		p.addParams("openId",openId);
	    p.ajax(getIP()+"member.action?list",function(data){
	    	var val=data.rows[0];
	    	//$("#birthday").val(val.birthday);
	    	//$("#sex").html(showSex(val.sex));
	    	$(".tdval img[sex="+val.sex+"]").attr("src","weixin/images/sex1.png");
	    	
	    	var chinacity=china.length;
			 	var province="<option selected='selected'>请选择省份</option>";
			 	for(var i=0;i<china.length;i++){
				 	if(china[i][0] == val.province){
				 		province+="<option selected='true' value="+i+">"+china[i][0]+"</option>";
				 	}else{
				 		province+="<option value="+i+">"+china[i][0]+"</option>";
				 	}
			 		
			 	}
			 	$("#province").html(province);
	    		 var provinceId=$("#province").val();
		 		var city="<option selected='selected'>请选择城市</option>";
		 		for(var y=1;y<china[provinceId].length;y++){
		 			if(china[provinceId][y] == val.city){
				 		city+="<option selected='true' value="+china[provinceId][y]+">"+china[provinceId][y]+"</option>";
				 	}else{
				 		city+="<option value="+china[provinceId][y]+">"+china[provinceId][y]+"</option>";
				 	}
		 	 		
		 	 	}
				$("#city").html(city);
		    	
	    	var cityName=$("#city").val();
	 		var hos="<option selected='selected'>请选择医院</option>";
	 		for(var i=0;i<hospital.length;i++){
	 			if(cityName == hospital[i][0]){
	 				for(var y=1;y<hospital[i].length;y++){
	 					if(hospital[i][y] == val.hospitalName){
	 						hos+="<option selected='true' value="+hospital[i][y]+">"+hospital[i][y]+"</option>";
					 	}else{
			 				hos+="<option value="+hospital[i][y]+">"+hospital[i][y]+"</option>";
			 			}
	 					
	 				}
	 				
	 			}
	 			
	 		}
	 		$("#hospitalName").html(hos);
	    	
	    	$("#name").val(val.name);
	    	$("#tel").val(val.tel);
	    	$("#email").val(val.email);
	    	$("#jobTitle").val(val.jobTitle);
	    	$("#post").val(val.post);
	    	$("#education").val(val.education);
	    	$("#hospitalOffices").val(val.hospitalOffices);
	    	
	    	/*$("#jobTitle option").each(function(){
	    		if($(this).text()==val.jobTitle){
	    			$(this).attr("selected","selected");
	    		}
	    		
	    	})
	    	$("#post option").each(function(){
	    		if($(this).text()==val.post){
	    			$(this).attr("selected",true);
	    		}
	    		
	    	})
	    	$("#education option").each(function(){
	    		if($(this).text()==val.education){
	    			$(this).attr("selected",true);
	    		}
	    		
	    	})*/
	    	$("#doctorNum").val(val.doctorNum);
	    	$("#createTime").html(val.createTime);
	    })
	    
	    $("#province").on("change",function(){
 		var provinceId=$(this).val();
 		var city="<option selected='selected'>请选择城市</option>";
 		for(var y=1;y<china[provinceId].length;y++){
 	 		city+="<option value="+china[provinceId][y]+">"+china[provinceId][y]+"</option>";
 	 	}
 		$("#city").html(city);
// 		alert()
 	})
 	/**
 	 * 医院
 	 */
 	$("#city").on("change",function(){
 		var cityName=$(this).val();
 		var hos="<option selected='selected'>请选择医院</option>";
 		for(var i=0;i<hospital.length;i++){
 			if(cityName == hospital[i][0]){
 				for(var y=1;y<hospital[i].length;y++){
 					hos+="<option value="+hospital[i][y]+">"+hospital[i][y]+"</option>";
 				}
 				
 			}
 			
 		}
 		$("#hospitalName").html(hos);
 	})
	    $("#reg").on("click",function(){
	    	
	    	var name=$("#name").val();
	 	 	var tel=$("#tel").val();
	 	 	//var birthday=$("#birthday").val();
	 	 	var email=$("#email").val();
	 	 	var hospitalName=$("#hospitalName").find("option:selected").text();
	 	 	var hospitalOffices=$("#hospitalOffices").find("option:selected").text();
	 	 	var jobTitle=$("#jobTitle").find("option:selected").text();
	 	 	var province= $("#province").find("option:selected").text();
	 	 	var city= $("#city").find("option:selected").text();
	 	 	var post=$("#post").find("option:selected").text();
	 	 	var education=$("#education").find("option:selected").text();
	 	 	var doctorNum=$("#doctorNum").val();
	 	 	var sex=$("#sex img[src='weixin/images/sex1.png']").attr("sex");
	 	 	//alert(doctorNum+"--"+name+"--"+tel+"--"+birthday+"--"+email+"--"+hospitalName+"--"+hospitalOffices+"--"+jobTiTle+"--"+province+"--"+city+"--"+post+"--"+doctorNum+"--"+sex);
	 	 	if(province=="请选择省份"){
	 	 		alert("请选择省份");
	 	 		return false;
	 	 	}
	 	 	if(city=="请选择城市"){
	 	 		alert("请选择城市");
	 	 		return false;
	 	 	}
	 	 	if(hospitalName == "请选择医院"){
	 	 		alert("请选择医院");
				return false;
	 	 	}
			if(name == ""){
	 	 		alert("姓名不能为空！");
				return false;
	 	 	}
			if(tel == ""){
	 	 		alert("手机号不能为空！");
				return false;
	 	 	}
			/*if(birthday == ""){
	 	 		alert("出生日期不能为空！");
				return false;
	 	 	}*/
			if(email == ""){
	 	 		alert("邮箱不能为空！");
				return false;
	 	 	}
			if(!valPhone(tel)){
				alert("请输入正确手机号");
				return false;
			}
			
			if(post == "请选择职务"){
	 	 		alert("请选择职务");
				return false;
	 	 	}
			if(jobTitle== "请选择职称"){
	 	 		alert("请选择职称");
				return false;
	 	 	}
			if(hospitalOffices== "请选择科室"){
	 	 		alert("请选择科室");
				return false;
	 	 	}
			if(education == "请选择学历"){
	 	 		alert("请选择学历");
				return false;
	 	 	}
			if(!checkEmail(email)){
				alert("邮箱格式不正确！");
				return false;
			}
 	 	
		var p=$.Params.create();
		
		p.addParams("publicNo",brandId); 
//		p.addParams("openId",openId);
		//p.addParams("type",type);
		p.addParams("sex",sex);
		p.addParams("name",name);
		p.addParams("tel",tel);
		//p.addParams("birthday",birthday);
		p.addParams("id",memberId);
		p.addParams("email",email);
		p.addParams("hospitalName",hospitalName);
		p.addParams("hospitalOffices",hospitalOffices);
		p.addParams("jobTitle",jobTitle);
		p.addParams("province",province);
		p.addParams("city",city);
		p.addParams("post",post);
		p.addParams("education",education);
		p.addParams("doctorNum",doctorNum);
		
	    p.ajax(getIP()+"member.action?update1",function(data){
	    	if(data.success){
	    		alert(data.msg);
	    	}else{
	    		alert(data.msg);
	    		return false;
	    	}
	    	
	    	//window.location.href="weixin/hy/registerDetail.jsp";
	    })
 	 	
 	})
 	
 	
})	