$(function(){
//	  $("#zc_title").focus(function(){
//		 $(".reg_zhicheng").show();
//	  });
//	  $("#zc_title").blur(function(){
//		  $(".reg_zhicheng").hide();
//	  });
	
	 
 	/**
 	 * 省份
 	 */
var chinacity=china.length;
	var province="<option selected='selected'>请选择省份</option>";
	for(var i=0;i<china.length;i++){
		province+="<option value="+i+">"+china[i][0]+"</option>";
	}
	$("#province").html(province);
	/**
	 * 城市
	 */
	$("#province").on("change",function(){
		var provinceId=$(this).val();
		var city="<option selected='selected'>请选择城市</option>";
		for(var y=1;y<china[provinceId].length;y++){
	 		city+="<option value="+china[provinceId][y]+">"+china[provinceId][y]+"</option>";
	 	}
		$("#city").html(city);
//		alert()
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
				hos+="<option id='sel_other'>其他</option>";
			}
			
		}
		$("#hospital_name").html(hos);
//		var hos="";
//		for(var y=1;y<china[provinceId].length;y++){
//	 		city+="<option value="+y+">"+china[provinceId][y]+"</option>";
//	 	}
//		$("#city").html(city);
	})
	var hosNameFlag=false;
	var hosOfficeFlag=false;
	var jobtitleFlag=false;
	$("#sel_other").live("click",function(){
		$("#searchHos").show();
		$("#searchHos").focus();
		hosNameFlag=true;
	})
	
	//searchJobtitle
	$("#jb_title").on("change",function(){
		if($(this).val()=="其他"){
			$("#searchJobtitle").show();
			$("#searchJobtitle").focus();
			jobtitleFlag=true;
		}
	})
	
	$("#hospital_offices").on("change",function(){
		if($(this).val()=="其他"){
			$("#searchOffice").show();
			$("#searchOffice").focus();
			hosOfficeFlag=true;
		}
	})
	
	/*同意条款*/
//	 $("#agree_box").on("click",function(){
//			var regBtn=$(".reg_now");
//			var checked=$(this).attr("checked");
//			if(checked=="checked")
//	  		{
//				regBtn.attr("disabled","disabled").removeClass("active");
//				$(this).attr("src","PC/image/type0.png");
//				$(this).removeAttr("checked");
//				regBtn.unbind();
//	  		}
//			else
//			{
				var regBtn=$(".reg_now");
				regBtn.removeAttr("disabled").addClass("active");
//				$(this).attr("src","PC/image/type1.png");
//				$(this).attr("checked","checked");
				
				
				var reg=$(this).parent().find("a");
				openId=null;
				$(regBtn).on("click",function(){
				
					var name=$("#name").val();
					var tel=$("#tel").val();
					//var birthday=$("#birthday").val();
					var sex=$("#sex img[src='PC/image/sex1.png']").attr("sex");
					var email=$("#email").val();
					var province=$("#province").find("option:selected").text();
					var city=$("#city").find("option:selected").text();
					var hospitalName=$("#hospital_name").val();
					if((hosNameFlag &&  hospitalName=="其他") || hospitalName=="请选择医院" || hospitalName == null){
						if($("#searchHos").val()==""){
							alert("所属医院不能为空!");
							$("#searchHos").focus();
							return false;
						}else{
							 hospitalName=$("#searchHos").val();
						}
					}else{
						 hospitalName=$("#hospital_name").find("option:selected").text();
					}
					var hospitalOffices=$("#hospital_offices").val();
					if((hosOfficeFlag &&  hospitalOffices=="其他")  || hospitalOffices=="请选择科室" || hospitalOffices == null){
						if($("#searchOffice").val()==""){
							alert("所属科室不能为空!");
							$("#searchOffice").focus();
							return false;
						}else{
							hospitalOffices=$("#searchOffice").val();
						}
					}else{
						hospitalOffices=$("#hospital_offices").find("option:selected").text();
					}
					var jobTitle=$("#jb_title").val();
					if((jobtitleFlag &&  jobTitle=="其他")   || jobTitle=="请选择职称" || jobTitle == null ){
						if($("#searchJobtitle").val()==""){
							alert("职称不能为空!");
							$("#searchJobtitle").focus();
							return false;
						}else{
							jobTitle=$("#searchJobtitle").val();
						}
					}else{
						jobTitle=$("#jb_title").find("option:selected").text();
					}
//					var filed1=$("#filed1").val();
//					var jobPost=$("#jb_post").find("option:selected").text();
//					var educational=$("#educational").find("option:selected").text();
//					var doctorNum=$("#doctorNum").val();
					//if(name==""||tel==""||birthday==""||email==""){
					//	alert("有数据为空，请填写完整！");
					//	return false;
					//}
//					var items=$(".tdval input");
//					
//					
//					for (var i = 0, item; item = items[i++];) {
//    					if($(item).val()==''){
//    						alert("有数据为空，请填写完整！");
//    						item.focus();
//    						return false;
//    					}
//					}
//					
//					if(tel==""){
//						alert("手机号不能为空，请输入！");
//						return false;
//					}else if(!valPhone(tel)){
//						alert("请输入正确手机号");
//						return false;
//					}
//					if(filed1==""){
//						alert("密码不能为空，请输入");
//						return false;
//					}
					if(name==""){
						alert("姓名不能为空，请输入！");
						return false;
					}
					//if(birthday==""){
					//	alert("出生日期不能为空，请输入！");
					//	return false;
					//}
					if(province=="请选择省份"){
						alert("请选择省份");
						return false;
					}
					if(city=="请选择城市"){
						alert("请选择城市");
						return false;
					}
					if(hospitalName=="请选择医院"){
						alert("请选择医院");
						return false;
					}
					if(hospitalOffices=="请选择科室"){
						alert("请选择科室");
						return false;
					}
					if(jobTitle=="请选择职称"){
						alert("请选择职称");
						return false;
					}
//					if(jobPost=="请选择职务"){
//						alert("请选择职务");
//						return false;
//					}
					if(jobTitle=="请选择职称"){
						alert("请选择职称");
						return false;
					}
//					if(educational=="请选择学历"){
//						alert("请选择学历");
//						return false;
//					}
//					if(email==""){
//						alert("邮箱不能为空，请输入！");
//						return false;
//					}
//					if(email!=""){
//					if(!checkEmail(email)){
//						alert("邮箱格式不正确！");
//						return false;
//					}
//					}
				var tel=window.localStorage.getItem("tel");
				var code=window.localStorage.getItem("code");
				var filed1=window.localStorage.getItem("pwd");
					var add=$.Params.create();
					add.addParams("publicNo",brandId);
					add.addParams("filed1",filed1);
					//add.addParams("openId",openId);
					add.addParams("name",name);
					add.addParams("tel",tel);
					add.addParams("filed4","1");
//					add.addParams("sex",sex);
//					add.addParams("email",email);
					add.addParams("province",province);
					add.addParams("city",city);
					add.addParams("filed4",place);
					add.addParams("hospitalName",hospitalName);
					add.addParams("hospitalOffices",hospitalOffices);
					add.addParams("jobTitle",jobTitle);
//					add.addParams("post",jobPost);
//					add.addParams("education",educational);
//					add.addParams("doctorNum",doctorNum);
					//add.addParams("id",eid); 
					add.ajax(getIP()+"member.action?add",function (data){
						if(data.success){
							alert("注册成功，点击确定进入扫描二维码绑定微信页面。");
							window.location.href=getIP()+"PC/newErweimaLog.jsp?ticket="+data.ticket+"&tel="+tel+"&pwd="+filed1;
						}else{
							alert(data.msg);
							return false;
//							window.location.href=getIP()+"PC/newErweimaLog.jsp?ticket="+data.ticket;
						}
					});
				})
				
//	  		}
//		})
		
		
	$(".tdval img").on("click",function(){
		if($(this).attr("type"))
		{ 
			type=$(this).attr("type");
			//alert(type);
		}
		if($(this).attr("sex"))
		{
 		 	sex=$(this).attr("sex");
 		 	//alert(sex);
		}
 		 $(this).attr("src","PC/image/sex1.png");
 		 $(this).siblings().attr("src","PC/image/sex0.png");
 	})
 		
 	$("#readys").on("click",function(){
 		window.open(getIP()+"weixin/hy/registerpc.jsp");
 	})
 	
 	
 	$("#searchHos").on("input",function(){
	//$("#searchHos").keyup(function(e){
	//alert(e.keyCode);
	//if(!e) var e = window.event; 
    //if(e.keyCode==32){
 		var cityName=$("#city").val();
 		var searchHos=$("#searchHos").val();
		var hos="";
		for(var i=0;i<hospital.length;i++){
			if(cityName == hospital[i][0]){
			//console.log(hospital[i].length);
				for(var y=1;y<hospital[i].length;y++){
					//console.log(hospital[i][y]+"--------------"+searchHos);
					//console.log(hospital[i][y].indexOf(searchHos));
					if(hospital[i][y].indexOf(searchHos) > 0 || hospital[i][y].indexOf(searchHos) == 0){
						hos+="<option value="+hospital[i][y]+">"+hospital[i][y]+"</option>";
					}
					if(searchHos == ""){
						hos+="<option value="+hospital[i][y]+">"+hospital[i][y]+"</option>";
					}
					//console.log(hos);
				}
				hos+="<option id='sel_other'>其他</option>";
				
			}
		}
		$("#hospital_name").html(hos);
		//}
 	})
 	

});