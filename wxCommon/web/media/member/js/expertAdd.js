
$(function(){
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
	var hosOfficeFlag=false;
	var jobtitleFlag=false;
	var postFlag=false;
	$("#hospitalName").on("change",function(){
		if($(this).val()=="其他"){
		$("#searchHospital").show();
		$("#searchHospital").focus();
		hosNameFlag=true;
		}else{
			$("#searchHospital").hide();
		}
	})
	
	$("#jobTitle").on("change",function(){
		if($(this).val()=="其他"){
			$("#searchJobtitle").show();
			$("#searchJobtitle").focus();
			jobtitleFlag=true;
		}else{
			$("#searchJobtitle").hide();
		}
	})
	
	$("#hospitalOffices").on("change",function(){
		if($(this).val()=="其他"){
			$("#searchOffice").show();
			$("#searchOffice").focus();
			hosOfficeFlag=true;
		}else{
			$("#searchOffice").hide();
			
		}
	})
	
	$("#post").on("change",function(){
		if($(this).val()=="其他"){
			$("#searchPost").show();
			$("#searchPost").focus();
			postFlag=true;
		}else{
			$("#searchPost").hide();
		}
	})
	
	var listrole=$.Params.create();
		listrole.addParams("type",1);
		listrole.addParams("publicNo",brandId);
		listrole.ajax(getIP()+"expert.action?list",function (data){
			if(data.success){
				var html="<option>请选择专家</option>";
				$.each(data.rows,function(i,val){
					html+="<option value='"+val.id+"'>"+val.name+"</option>";
				})
				$("#name").html(html);
			}
		})
	$("#name").on("change",function(){
		var id=$(this).val();
		var p=$.Params.create();
		p.addParams("id",id);
		p.ajax(getIP()+"expert.action?list",function (data){
			if(data.success){
				var val=data.rows[0];
				$("#openId").val(val.openId);
				$("#province option").each(function(){
			   		var $this=$(this);
			   			if($this.text()==val.createUser){
			   				$this.attr("selected",true);
			   				
					   		var provinceId=$(this).val();
							var city="<option selected='selected'>请选择城市</option>";
							for(var y=1;y<china[provinceId].length;y++){
						 		city+="<option value="+china[provinceId][y]+">"+china[provinceId][y]+"</option>";
						 	}
							$("#city").html(city);
							$("#city option").each(function(){
								if($(this).text()==val.city){
									$(this).attr("selected",true);
								}
								
							})
							var cityName=$("#city").val();
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
						 			
						 			$("#hospitalName option").each(function(){
										if($(this).text()==val.doctorCertificate){
											$(this).attr("selected",true);
										}else{
											$("#hospitalName").find("option:first").text(val.doctorCertificate);
										}
									})
						 		}
						 	})
							
						}
			   		})
				
				
				$("#hospitalOffices option").each(function(){
					if($(this).text()==val.filed3){
						$(this).attr("selected",true);
					}else{
						$("#hospitalOffices").find("option:first").text(val.filed3);
					}
				})
				
				$("#jobTitle option").each(function(){
					if($(this).text()==val.jobTitle){
						$(this).attr("selected",true);
					}else{
						$("#jobTitle").find("option:first").text(val.jobTitle);
					}
				})
				 $("#post option").each(function(){
					if($(this).text()==val.filed1){
						$(this).attr("selected",true);
					}else{
						$("#post").find("option:first").text(val.filed1);
					}
				})
				
				
				
			}
		})
	})	
	
	
	$("#modifyVal").on("click",function(){
		
		var openId=$("#openId").val();
		var tel=$("#tel").val();
		var filed1=$("#filed1").val();
		var name=$("#name").find("option:selected").text();
		var email=$("#email").val()
		var length=filed1.length;
		var sex=$("[name=sex]:checked").val();
		var province=$("#province").find("option:selected").text();

		if(name=="请选择专家"){
			alert("请选择专家！");
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
		if(email!=""){
			if(!checkEmail(email)){
				alert("邮箱格式不正确！");
				return false;
			}
		}
//		if(province=="请选择省份"){
//			alert("请选择省份");
//			return false;
//		}
//		if(hospitalName==""){
//			alert("请填写医院");
//			return false;
//		}
		if(filed1==""){
			alert("请填写密码");
			return false;
		}
		if(length<6||length>10){
			alert("请输入6-10位密码");
			return false;
		}
		var city=$("#city").find("option:selected").text();
//		if(tel==""){
//
//		var city=$("#city").find("option:selected").text();
//		if(name==""){
//			alert("姓名不能为空，请输入！");
//			return false;
//		}
//		if(tel==""){
//
//			alert("输入的手机号不能为空");
//			return false;
//		}
//		if(!valPhone(tel)){
//			alert("请输入正确手机号");
//			return false;
//		}
//		if(length<6||length>10){
//			alert("请输入6-10位密码");
//			return false;
//		}
//		if(province=="请选择省份"){
//			alert("请选择省份");
//			return false;
//		}
		//var hospitalName=$("#hospitalName").val();
		var hospitalName=$("#hospitalName").find("option:selected").text();
		var hospitalOffices=$("#hospitalOffices").find("option:selected").text();
		var jobTitle=$("#jobTitle").find("option:selected").text();
		var post=$("#post").find("option:selected").text();
		
//		if(city=="请选择城市"){
//			alert("请选择城市");
//			return false;
//		}
//		if(hospitalName=="请选择医院"){
//			alert("请选择医院");
//			return false;
//		}
		
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
		
		
		if((hosOfficeFlag &&  hospitalOffices=="其他")   || hospitalOffices == null){
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
		
		if((jobtitleFlag &&  jobTitle=="其他")   ||  jobTitle == null ){
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
		
		if((postFlag &&  post=="其他")   ||  post == null ){
			if($("#searchPost").val()==""){
				alert("职称不能为空!");
				$("#searchPost").focus();
				return false;
			}else{
				post=$("#searchPost").val();
			}
		}else{
			post=$("#post").find("option:selected").text();
		}
		
		if(hospitalOffices=="请选择科室"){
			hospitalOffices="";
		}
		if(jobTitle=="请选择职称"){
			jobTitle="";
		}
		if(post=="请选择职务"){
			post="";
		}
		var add=$.Params.create();
		add.addParams("publicNo",brandId);
		add.addParams("filed1",filed1);
		add.addParams("name",name);
		add.addParams("sex",sex);
		add.addParams("tel",tel);
		add.addParams("email",email);
		add.addParams("province",province);
		add.addParams("city",city);
		add.addParams("filed4","3");
		add.addParams("hospitalName",hospitalName);
		add.addParams("jobTitle",jobTitle);
		add.addParams("hospitalOffices",hospitalOffices);
		add.addParams("post",post);
		add.addParams("openId",openId);
		add.addParams("type",1);
		add.ajax(getIP()+"member.action?addExpert",function(data){
			if(data.success){
				var expertId=$("#name").val();
				var update=$.Params.create();
				update.addParams("id",expertId);
				update.addParams("filed5",1);
				update.ajax(getIP()+"expert.action?updateType",function (data){
					if(data.success){
						window.location.href="media/member/memberExpList.jsp";
					}
				})
			}else{
				alert(data.msg);
				return false;		
			}
		});
		
	})
	
})