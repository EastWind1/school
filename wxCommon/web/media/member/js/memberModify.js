$(function(){	
	var eid=GetQueryString("eid");
	
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
	$("#post").on("change",function(){
		if($(this).val()=="其他"){
			$("#searchPost").show();
			$("#searchPost").focus();
			postFlag=true;
		}else{
			$("#searchPost").hide();
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
	
	
	var p=$.Params.create();
	
	p.addParams("id",eid); 
	
	p.ajax(getIP()+"member.action?list",function(data){
		var html="";
		var val=data.rows[0];
		$("#name").val(val.name);
		$("#tel").val(val.tel);
		//$("[name=sex][value="+val.sex+"]").attr("checked","checked");
		$("[name=sex][value="+val.sex+"]").parent().addClass("checked");
		//App.init();
		$("#age").val(val.birthday);
		$("#email").val(val.email);
		var post=val.post;
		if(post==null||post=="null"){
			post="请选择职务";
		}

   		$("#province option").each(function(){
   		var $this=$(this);
   			if($this.text()==val.province){
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
							if($(this).text()==val.hospitalName){
								$(this).attr("selected",true);
							}else{
								$("#hospitalName").find("option:first").text(val.hospitalName);
							}
						})
			 		}
			 	})
				
			}
   		})
		
		
		$("#hospitalOffices option").each(function(){
			if($(this).text()==val.hospitalOffices){
				$(this).attr("selected",true);
			}else{
				$("#hospitalOffices").find("option:first").text(val.hospitalOffices);
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
			if($(this).text()==val.post){
				$(this).attr("selected",true);
			}else{
				$("#post").find("option:first").text(post);
			}
		})
	})
		/**
		 * 重置密码
		 */
	
	
	
	
	/*详情页修改事件*/
	$("#modifyVal").on("click",function(){
		var name=$("#name").val();
		var tel=$("#tel").val();
		var email=$("#email").val();
		var sex=$("[name=sex]:checked").val();
		var province=$("#province").find("option:selected").text();
		var city=$("#city").find("option:selected").text();
		var hospitalName=$("#hospitalName").find("option:selected").text();
		var hospitalOffices=$("#hospitalOffices").find("option:selected").text();
		var jobTitle=$("#jobTitle").find("option:selected").text();
		var post=$("#post").find("option:selected").text();
		
		if(name==""){
			alert("请填写姓名");
			return false;
		}
		if(tel==""){
			alert("请填写手机号");
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
//		if(city=="请选择城市"){
//			alert("请选择城市");
//			return false;
//		}
//		if(hospitalName=="请选择医院"){
//			alert("请选择医院");
//			return false;
//		}
//		if(hospitalOffices=="请选择科室"){
//			alert("请选择科室");
//			return false;
//		}
//		if(jobTitle=="请选择职称"){
//			alert("请选择职称");
//			return false;
//		}
		if((hosNameFlag &&  hospitalName=="其他") || hospitalName=="请选择医院" || hospitalName == null){
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
		
		
		if((hosOfficeFlag &&  hospitalOffices=="其他")  || hospitalOffices == null){
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
		
		if((jobtitleFlag &&  jobTitle=="其他")  || jobTitle == null ){
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
		
		if(postFlag &&  post=="其他"){
				post=$("#searchPost").val();
				if(post==""){
					post="请选择职务";
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
		if(post=="请选择职称"){
			post="";
		}
		var update=$.Params.create();
		update.addParams("id",eid);
		update.addParams("tel",tel);
		update.addParams("email",email);
		update.addParams("publicNo",brandId);
		update.addParams("name",name);
		update.addParams("tel",tel);
		update.addParams("email",email);
		update.addParams("sex",sex);
		update.addParams("province",province);
		update.addParams("city",city);
		update.addParams("hospitalName",hospitalName);
		update.addParams("hospitalOffices",hospitalOffices);
		update.addParams("jobTitle",jobTitle);
		update.addParams("post",post);
		update.ajax(getIP()+"member.action?update1",function(data){
			if(data.success){
				alert(data.msg);
				window.location.href="media/member/memberList.jsp";
			}else{
				alert(data.msg);
				return false;
			}
		})
		
		
		
	})
	
})