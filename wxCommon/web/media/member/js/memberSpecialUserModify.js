$(function(){	
var eid=GetQueryString("eid");
var type=GetQueryString("type");
	
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
	$("#hospitalName").on("change",function(){
		if($(this).val()=="其他"){
		$("#searchHospital").show();
		$("#searchHospital").focus();
		hosNameFlag=true;
		}else{
			$("#searchHospital").hide();
		}
	})
	
	var p=$.Params.create();
	
	p.addParams("id",eid); 
	
	p.ajax(getIP()+"member.action?list",function(data){
		var html="";
		var val=data.rows[0];
		$("#name").val(val.name);
		$("#name").attr("readOnly",true);
		$("#email").val(val.email);
		
		$("#province option").each(function(){
	   		var $this=$(this);
	   			if($this.text()==val.province ){
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
		
	})
	
	
	/*详情页修改事件*/
	$("#modifyVal").on("click",function(){
		var name=$("#name").val();
		var email=$("#email").val();
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
		
		/*
		 
		if(name==""||hospitalName==""||age==""||sex==""||filed1==""){
			alert("有数据为空，请填写完整");
			return false;
		}
		if(!valPhone(tel)){
			alert("请输入正确手机号");
			return false;
		}
		if(!checkEmail(email)){
			alert("邮箱格式不正确！");
			return false;
		}*/
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
		if(province=="请选择省份"){
			province="";
		}
		if(city=="请选择城市"){
			city="";
		}
		if(hospitalName=="请选择医院"){
			hospitalName="";
		}
				var update=$.Params.create();
				update.addParams("name",name);
				update.addParams("email",email);
				update.addParams("province",province);
				update.addParams("city",city);
				update.addParams("hospitalName",hospitalName);
				update.addParams("id",eid); 
				update.ajax(getIP()+"member.action?updateEmail",function (data){
					if(data.success){
						alert(data.msg);
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