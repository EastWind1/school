
$(function(){
	var type=GetQueryString("type");
	
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

	})
	/**
	 * 医院
	 */
	$("#city").on("change",function(){
		var cityName=$(this).val();
		var sel=$.Params.create();
	 	sel.addParams("city",cityName);
	 	sel.ajax(getIP()+"memberhospital.action?list",function(data){
	 		if(data.success){
	 			var len=data.total;
	 			var hos="<option selected='selected'>请选择医院</option>"; 
	 			if(len>0){
	 				$.each(data.rows,function(i,val){
	 					hos+="<option value="+val.name+">"+val.name+"</option>";
	 				})
	 			}else{
	 				hos+="<option value='暂无数据'>暂无数据</option>";
	 			}
	 			hos+="<option id='sel_other' value='其他'>其他</option>";
	 			$("#hospitalName").html(hos);
	 		}
	 	})

	})
	var hosNameFlag=false;
	$("#hospitalName").on("change",function(){
		if($(this).val()=="其他"){
		$("#searchHospital").show();
		$("#searchHospital").focus();
		hosNameFlag=true;
		}else{
			$("#searchHospital").hide();
		}
	})
	if(type==5){
		$("#name").val("医疗车");
		$("#name").attr("readOnly",true);
	}else{
		$("#name").val("会议室");
		$("#name").attr("readOnly",true);
	}
	
	$("#modifyVal").on("click",function(){
		var filed1=$("#filed1").val();
		var length=filed1.length;
		var name=$("#name").val();
		var email=$("#email").val()
		var province=$("#province").find("option:selected").text();
		var city=$("#city").find("option:selected").text();
		var hospitalName=$("#hospitalName").find("option:selected").text();
		
		if(email==""){
			alert("请输入邮箱");
			return fasle;
		}
		if(email!=""){
			if(!checkEmail(email)){
				alert("邮箱格式不正确！");
				return false;
			}
		}
		
		if(filed1==""){
			alert("请输入密码");
			return false;
		}
		if(length<6||length>10){
			alert("请输入6-10位密码");
			return false;
		}
		/*if(tel==""){
			alert("输入的手机号不能为空");
			return false;
		}
		
		if(length<6||length>10){
			alert("请输入6-10位密码");
			return false;
		}
		if(name==""){
			alert("姓名不能为空，请输入！");
			return false;
		}
		if(province=="请选择省份"){
			alert("请选择省份");
			return false;
		}
		var hospitalName=$("#hospitalName").val();
		//var hospitalName=$("#hospitalName").find("option:selected").text();
		var hospitalOffices=$("#hospitalOffices").find("option:selected").text();
		var jobTitle=$("#jobTitle").find("option:selected").text();
		
		/*if(city=="请选择城市"){
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
		}*/
		if((hosNameFlag &&  hospitalName=="其他")  || hospitalName == null){
			if($("#searchHospital").val()==""){
				alert("所属医院不能为空!");
				$("#searchHospital").focus();
				return false;
			}else{
				 hospitalName=$("#searchHospital").val();
			}
		}else{
			 hospitalName=$("#hospitalName").find("option:selected").text();
		}
		
		if(province=="请选择省份"){
			province="";
		}
		if(city=="请选择城市"){
			city="";
		}
		if(hospitalName=="请选择医院"){
			hospitalName="";
		}
		/*if((hosOfficeFlag &&  hospitalOffices=="其他")  || hospitalOffices=="请选择科室" || hospitalOffices == null){
			if($("#searchOffice").val()==""){
				alert("所属科室不能为空!");
				$("#searchOffice").focus();
				return false;
			}else{
				hospitalOffices=$("#searchOffice").val();
			}
		}else{
			hospitalOffices=$("#hospitalOffices").find("option:selected").text();
		}
		
		if((jobtitleFlag &&  jobTitle=="其他")   || jobTitle=="请选择职称" || jobTitle == null ){
			if($("#searchJobtitle").val()==""){
				alert("职称不能为空!");
				$("#searchJobtitle").focus();
				return false;
			}else{
				jobTitle=$("#searchJobtitle").val();
			}
		}else{
			jobTitle=$("#jobTitle").find("option:selected").text();
		}
		
		*/
		var add=$.Params.create();
		add.addParams("publicNo",brandId);
		add.addParams("filed1",filed1);
		add.addParams("name",name);
		add.addParams("email",email);
		add.addParams("province",province);
		add.addParams("city",city);
		add.addParams("filed4","3");
		add.addParams("hospitalName",hospitalName);
		add.addParams("type",type);
		//add.addParams("hospitalOffices",hospitalOffices);
		//add.addParams("jobTitle",jobTitle);
		add.ajax(getIP()+"member.action?addSpecialUser",function(data){
			if(data.success){
				if(type==5){
					window.location.href="media/member/memberTuiCheUserList.jsp";
				}else{
					window.location.href="media/member/memberWindowUserList.jsp";
				}
				
			}else{
				alert(data.msg);
				return false;		
			}
		});
		
	})
	
})