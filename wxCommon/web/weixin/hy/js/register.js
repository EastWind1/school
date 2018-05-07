$(function(){
	
	var opt = {};
	opt.date = {
		preset : 'date',
		//   minDate : new Date(2014, 7, 10),
		maxDate : new Date()
	};
	opt.datetime = {
		preset : 'datetime',
		minDate : new Date(2012, 3, 10, 9, 22),
		maxDate : new Date(2014, 7, 30, 15, 44),
		stepMinute : 5
	//分钟间隔
	};
	opt.time = {
		preset : 'time',
		minDate : new Date(2012, 3, 10, 9, 22),
		maxDate : new Date(2012, 3, 10, 15, 44),
		stepMinute : 2
	//分钟间隔
	};

	$('#birthday').scroller('destroy').scroller($.extend(opt['date'], {
		theme : 'default',//主题
		mode : 'scroller',
		display : 'bottom',//显示位置
		dateOrder : 'yymmdd',//显示格式
		lang : 'zh',//显示语言
		dateFormat: 'yy-mm-dd' // 日期格式
	}));
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
	 		 $(this).attr("src","weixin/images/sex1.png");
	 		 $(this).siblings().attr("src","weixin/images/sex0.png");
	 	})
	 
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
 		hos+="<option value='qt' id='sel_other'>其他</option>";
 		$("#hospital_name").html(hos);
 		
// 		var hos="";
// 		for(var y=1;y<china[provinceId].length;y++){
// 	 		city+="<option value="+y+">"+china[provinceId][y]+"</option>";
// 	 	}
// 		$("#city").html(city);
 	})
 	
 	$("#hospital_name").on("change",function(){
 		if($(this).val()=="qt"){
 			$("#searchosinp").val("");
 			$("[name=hospitalName]").show();
 		}
	})
	
	$("#hospital_offices").on("change",function(){
 		if($(this).val()=="qt"){
 			$("[name=officeName]").show();
 		}
	})
	
	$("#searchos").on("click",function(){
		$("[name=searchos]").show();
	})
	
	$("#searchosinp").on("input",function(){
		var searchHos=$(this).val();
		var cityName=$("#city").val();
		var hos="";
		for(var i=0;i<hospital.length;i++){
			if(cityName == hospital[i][0]){
				for(var y=1;y<hospital[i].length;y++){
					if(hospital[i][y].indexOf(searchHos) > 0){
						hos+="<option value="+hospital[i][y]+">"+hospital[i][y]+"</option><option value="+hospital[i][y]+">"+hospital[i][y]+"</option>";
					}
					if(searchHos == ""){
					}
				}
				
			}
		}
		hos+="<option value='qt' id='sel_other'>其他</option>";
		$("#hospital_name").html(hos);
	})
 	
 	$("#reg").on("click",function(){
 		//var type=$("#type img[src='weixin/images/sex1.png']").attr("type");
 		var sex=$("#sex img[src='weixin/images/sex1.png']").attr("sex");
 		
 		
 		var name=$("#name").val();
 	 	var tel=$("#tel").val();
 	 	//var birthday=$("#birthday").val();
 	 	var email=$("#email").val();
 	 	var hospital_name=$("#hospital_name").find("option:selected").text();
 	 	if(hospital_name == "其他"){
 	 		hospital_name=$("#hospitalName").val();
 	 	}
 	 	var hospital_offices=$("#hospital_offices").find("option:selected").text();
 	 	if(hospital_offices == "其他"){
 	 		hospital_offices=$("#officeName").val();
 	 	}
 	 	var jb_title=$("#job_title").find("option:selected").text();
 	 	var province= $("#province").find("option:selected").text();
 	 	var city= $("#city").find("option:selected").text();
 	 	var post=$("#post").find("option:selected").text();
 	 	var education=$("#education").find("option:selected").text();
 	 	var doctorNum=$("#doctorNum").val();
 	 	if(province=="请选择省份"){
 	 		alert("请选择省份");
 	 		return false;
 	 	}
 	 	if(city=="请选择城市"){
 	 		alert("请选择城市");
 	 		return false;
 	 	}
 	 	if(hospital_name == "请选择医院"){
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
		if(jb_title== "请选择职称"){
 	 		alert("请选择职称");
			return false;
 	 	}
		if(post == "请选择职务"){
 	 		alert("请选择职务");
			return false;
 	 	}
		if(hospital_offices== "请选择科室"){
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
		p.addParams("openId",openId);
		//p.addParams("type",type);
		p.addParams("sex",sex);
		p.addParams("name",name);
		p.addParams("tel",tel);
		//p.addParams("birthday",birthday);
		p.addParams("email",email);
		p.addParams("hospitalName",hospital_name);
		p.addParams("hospitalOffices",hospital_offices);
		p.addParams("jobTitle",jb_title);
		p.addParams("province",province);
		p.addParams("city",city);
		p.addParams("post",post);
		p.addParams("education",education);
		p.addParams("doctorNum",doctorNum);
		p.addParams("filed4",place);
	    p.ajax(getIP()+"member.action?add",function(data){
	    	if(data.success){
	    	alert("注册成功！");
	    	window.location.href="weixin/hy/registerDetail.jsp";
	    	}else{
			alert(data.msg);
			return false;				
			}
	    	
	    })
 	 	
 	})

})	