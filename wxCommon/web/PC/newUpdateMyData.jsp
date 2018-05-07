<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0, minimum-scale=1.0, maximum-scale=1.0">
	<title>云  ICU</title>	
	<jsp:include page="media.jsp"></jsp:include>
</head>
<body class="page-header-fixed page-full-width">
		<!-- 顶部导航 begin-->
	<jsp:include page="head.jsp"></jsp:include>
	<!-- 顶部导航 end -->
	
 	<!-- 内容主体  begin-->
	<div class="page-container row-fluid">
		<div class="page-content no-min-height">
			<div class="container-fluid promo-page">
				<div class="row-fluid">
					<div class="span12">
						<div class="userBanner">
  							<div class="container">个人中心</div>
  						</div>
						<!--导航下内容部分  begin-->
  							<div class="container">
  								<div class="row-fluid" style="margin-top: 20px;">				
									<jsp:include page="pct_left.jsp"></jsp:include>
  									<div class="pct_contentRight" id="updateMydata">
  										<div class="pct_content">
  											<h3 class="pct_contentTitle">修改个人信息</h3>
  											<form action="" method="post" class="pct_myInfo pct_update">
												<div class="control-group">
												    <label class="control-label noPointer">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;姓名：</label>
												    <div class="controls">
												    	<input type="text" id="pct_userName" name="pct_userName"  maxlength="18"/>
												    </div>
												</div>
												<div class="control-group">
												    <label class="control-label noPointer">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;性别：</label>
												    <div class="controls pct_sex" >
												    	<img src="PC/image/sex0.png" id="sex1" sex="1" style="width: 25px; height: 25px;"/>&nbsp;<label for="sex1">男</label>
												    	<img src="PC/image/sex1.png" id="sex2" sex="2" style="width: 25px; height: 25px;"/>&nbsp;<label for="sex2">女</label>
												    </div>
												</div>
												<div class="control-group">
												    <label class="control-label noPointer">所在地区：</label>
												    <div class="controls update_mydata">
														<select id="province" style="width: 15%;border:1px solid #ddd;"></select>
														<select id="city" style="width: 25%;border:1px solid #ddd;"></select>
												    </div>
												</div>
												<div class="control-group">
												    <label class="control-label noPointer">医院：</label>
												    <div class="controls update_mydata">
												   	<select id="hospital_name" style="width: 50%;border:1px solid #ddd;"></select> 
												   <input id="searchHos" style="width:200px;right:41px;background-color:rgba(255, 255, 255, 0);box-shadow:none;display:none;" type="text" placeholder="请输入科室" />
												    </div>
												</div>
												<div class="control-group">
												    <label class="control-label noPointer">科室：</label>
												    <div class="controls update_mydata">
												    	<select id="hospital_offices" style="width: 50%;border:1px solid #ddd;">
															<option>请选择科室</option>
															<option>ICU</option>
															<option>PICU</option>
															<option>急诊科</option>
															<option>急诊ICU</option>
															<option>呼吸科</option>
															<option>麻醉科</option>
															<option>儿科</option>
															<option>产科</option>
															<option>外科</option>
															<option value="其他" >其他</option>
														</select>
														<input id="searchOffice" style="width:200px;right:41px;background-color:rgba(255, 255, 255, 0);box-shadow:none;display:none;" type="text" placeholder="请输入科室" />
												    </div>
												</div>
												<div class="control-group">
												    <label class="control-label noPointer">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;职称：</label>
												    <div class="controls update_mydata">
														<select id="pct_jobTitle" style="width: 50%;border:1px solid #ddd;">
															<option>请选择职称</option>
															<option>主任医师</option>
															<option>副主任医师</option>
															<option>主治医师</option>
															<option>住院医师</option>
															<option>学生</option>
															<option>主任护师</option>
															<option>副主任护师</option>
															<option>主管护师</option>
															<option>护师</option>
															<option value="其他" >其他</option>
														</select>
														<input id="searchTitle" style="width:200px;right:41px;background-color:rgba(255, 255, 255, 0);box-shadow:none;display:none;" type="text" placeholder="请输入职称" />
												    </div>
												</div>
												
												<div class="control-group">
												    <label class="control-label noPointer">职务：</label>
												    <div class="controls update_mydata">
														<select id="pct_userPost" style="width: 50%;border:1px solid #ddd;">
															<option>请选择职务</option>
															<option value="医师">院长</option>
															<option value="医师">副院长</option>
															<option value="医师">科室主任</option>
															<option value="医师">科室副主任</option>
															<option value="护士">带组组长</option>
															<option value="护士">医生</option>
															<option value="护士">护士长</option>
															<option value="护士">护士</option>
															<option value="其他" >其他</option>
														</select>
														<input id="searchPost" style="width:200px;right:41px;background-color:rgba(255, 255, 255, 0);box-shadow:none;display:none;" type="text" placeholder="请输入职务" />
												    </div>
												</div>
												
												<!-- <div class="control-group">
												    <label class="control-label noPointer">出生日期：</label>
												    <div class="controls">
												    	<input type="text" id="pct_userBirthday" name="pct_userBirthday" placeholder="选择出生日期" onClick="WdatePicker()" />
												    </div>
												</div> -->
												
												<div class="control-group">
												    <label class="control-label noPointer">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;邮箱：</label>
												    <div class="controls">
												    	<input type="text" id="pct_userEmail" name="pct_userEmail"/>
												    </div>
												</div>
												<div class="control-group">
												    <label class="control-label noPointer">&nbsp;&nbsp;&nbsp;&nbsp;手机号：</label>
												    <div class="controls">
												    	<input type="text" id="pct_userPhone" name="pct_userPhone"/>
												    </div>
												</div>
												<!-- <div class="control-group">
												    <label class="control-label noPointer">资格证编码：</label>
												    <div class="controls">
												    	<input type="text" id="doctorNum" name="doctorNum" />
												    </div>
												</div>
												<div class="control-group">
												    <label class="control-label noPointer">学历：</label>
												    <div class="controls">
												    	<select id="educational" style="width: 50%;border:1px solid #ddd;">
															<option>请选择学历</option>
															<option>博士</option>
															<option>硕士</option>
															<option>本科</option>
															<option>专科</option>
														</select>
												    </div>
												</div> -->
												<a id="pct_infoUpdate">修改</a>
  											</form>
  										</div>
  									</div>
								</div>
  							</div>
					</div>
				</div>
			</div>
			<!--导航下内容部分  end-->			
			<!-- 底部  begin-->
			<div class="copyRight"></div> 	
			<!-- 底部  end -->
		</div>
	</div>	
	<div id="responsive" class="modal hide fade" tabindex="-1" data-width="760">
		<div class="modal-header">
			<button type="button" class="close" data-dismiss="modal" aria-hidden="true"></button>
			<h3>友情提醒</h3>
		</div>
		<div class="modal-body">
			<div class="row-fluid">
				<div class="span12" id="modalcont"></div>
			</div>
		</div>
		<div class="modal-footer">
			<button type="button" data-dismiss="modal" class="btn">取消</button>
			<button id="subBtn" type="button" class="btn blue">确定</button>
		</div>
	</div>
 	<!-- 内容主体  end -->
	<script src="PC/js/datepicker/WdatePicker.js" type="text/javascript"></script>
	<script src="PC/js/pageMedia.js"></script>
	<script src="js/city.js" type="text/javascript" charset="utf-8"></script>
 	<script>
 		//添加边框
 		var currentNav = $(".nav_gr");
		var sildeBar = $(".pct_updateFile");
		addBorder(currentNav,"nav_barBorder");
		addBorder(sildeBar,"pct_slideNavBar");
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
	})
		var sel=$.Params.create();

 		getData();
		function getData(){
		   	sel.addParams("id",memberId);
		   	getPageData(sel,getIP()+"member.action?list",function(data){
		   		var val=data.rows[0];
		   		var post=val.post;
		   		var educational=val.educational;
		   		var doctorNum=val.doctorNum;
		   		var email=val.email;
		   		if(email==null||email=="null"){
		   			email="";
			   	}
		   		if(post==null||post=="null"){
					post="请选择职务";
			   	}

		   		if(educational==null||educational=="null"){
		   			educational="";
			   	}

		   		if(doctorNum==null||doctorNum=="null"){
		   			doctorNum="";
			   	}
		   	
			   	
		   		
		   		$("#pct_userName").val(val.name);
		   		$("#pct_userPhone").val(val.tel);
		   		$("#pct_userBirthday").val(val.birthday);
		   		$(".pct_sex img[sex="+val.sex+"]").attr("src","PC/image/sex1.png").attr("checked","checked");
		   		$(".pct_sex img[sex="+val.sex+"]").siblings().attr("src","PC/image/sex0.png").removeAttr("checked");
		   		$("#pct_userEmail").val(email);
		   		
		   		
		   		
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
						var hos="<option selected='selected'>请选择医院</option>";
						for(var i=0;i<hospital.length;i++){
							if(cityName == hospital[i][0]){
								for(var y=1;y<hospital[i].length;y++){
									hos+="<option value="+hospital[i][y]+">"+hospital[i][y]+"</option>";
								}
								hos+="<option id='sel_other' value='其他'>其他</option>";
							}
						}
						$("#hospital_name").html(hos);
						$("#hospital_name option").each(function(){
							if($(this).text()==val.hospitalName){
								$(this).attr("selected",true);
							}else{
								$("#hospital_name").find("option:first").text(val.hospitalName);
								}
						})
	   			}
		   		})
		   		
		   		$("#hospital_offices option").each(function(){
		   			var $this=$(this);
		   			if($this.text()==val.hospitalOffices){
		   				$(this).attr("selected",true);
		   			}else{
		   				$("#hospital_offices").find("option:first").text(val.hospitalOffices);
			   		}
		   		})
		   		$("#pct_jobTitle option").each(function(){
		   			var $this=$(this);
		   			if($this.text()==val.jobTitle){
		   				$(this).attr("selected",true);
		   			}else{
		   				$("#pct_jobTitle").find("option:first").text(val.jobTitle);
			   			}
		   		})
		   		$("#pct_userPost option").each(function(){
		   			var $this=$(this);
		   			if($this.text()==val.post){
		   				$(this).attr("selected",true);
		   			}else{
		   				$("#pct_userPost").find("option:first").text(post);
			   			}
		   		})
		   		$("#doctorNum").val(val.doctorNum);
		   		$("#educational option").each(function(){
		   			var $this=$(this);
		   			if($this.text()==val.education){
		   				$(this).attr("selected",true);
		   			}
		   		})
		   		//$("#province").find("option[text='"+val.province+"']").attr("selected",true);
		   		//$("#city").find("option[text='"+val.city+"']").attr("selected",true);
		   		
		   		//$("#hospital_name option:first").text(val.hospitalName);
		   		//$("#hospital_offices option:first").text(val.hospitalOffices);
		   		//$("#pct_jobTitle option:first").text(val.jobTitle);
		   		//$("#pct_userPost option:first").text(val.post);
				
			    //$("#educational option:first").text(val.education);
		   	});
		}
		
		$(".pct_updateFile").on("click",function(){
			$(".pct_contentTitle").html("修改资料");
			$(".pct_content input[type=text]").removeAttr("disabled").css("background",'#fff');
			$(".pct_content input[type=text]").filter(":first").focus();
			$("#pct_infoUpdate").show();
		});
		
		$(".pct_sex img").on("click",function(){
	 		 $(this).attr("src","PC/image/sex1.png").attr("checked","checked");
	 		 $(this).siblings().attr("src","PC/image/sex0.png").removeAttr("checked");
	 	})
		
	/*	$("#pct_infoUpdate").on("click",function(){
			$("#modalcont").html("确认修改吗？");
			$("#responsive").modal('toggle');
		})*/
		/*	if(openId == ""){
			$("#loginRegin").show();
			$("#myanback").hide();
		}else{
			$("#loginRegin").hide();
			$("#myanback").show();*/

			var hosNameFlag=false;
			var hosOfficeFlag=false;
			var jobtitleFlag=false;
			var postFlag=false;
			
	
			$("#hospital_name").on("change",function(){
				var hospital=$(this).val();
				if(hospital=="其他"){
					$("#searchHos").show();
					$("#searchHos").focus();
					hosNameFlag=true;
				}
			})
	//		$("#sel_other").live("click",function(){
		//		alert("123");
			//	$("#searchHos").show();
			//  $("#searchHos").focus();
		//		hosNameFlag=true;
	//		})
			
			//searchJobtitle
			$("#pct_jobTitle").on("change",function(){
				if($(this).val()=="其他"){
					$("#searchTitle").show();  
					$("#searchTitle").focus();
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
			
			$("#pct_userPost").on("change",function(){
				if($(this).val()=="其他"){
					$("#searchPost").show();
					$("#searchPost").focus();
					postFlag=true;
				}
			})
			

				 
 
		$("#pct_infoUpdate").on("click",function(){
			var name=$("#pct_userName").val();
			var tel=$("#pct_userPhone").val();
			var birthday=$("#pct_userBirthday").val();
			var sex=$(".pct_sex img[checked]").attr("sex");
			var email=$("#pct_userEmail").val();
			var province=$("#province").find("option:selected").text();
			var city=$("#city").find("option:selected").text();
			//var hospitalName=$("#hospital_name").find("option:selected").text();
			//var hospitalOffices=$("#hospital_offices").find("option:selected").text();
			//var jobTitle=$("#pct_jobTitle").find("option:selected").text();
			//var post=$("#pct_userPost").find("option:selected").text();
			var doctorNum=$("#doctorNum").val();
			var educational=$("#educational").find("option:selected").text();

			if(hosNameFlag && $("#hospital_name").val() =="其他"){
				if($("#searchHos").val()==""){
					alert("所属医院不能为空!");
					$("#searchHos").focus();
					return false;
				}else{
					var hospitalName=$("#searchHos").val();
				}
			}else{
				var hospitalName=$("#hospital_name").find("option:selected").text();
			}
			var hospitalOffices;
			if(hosOfficeFlag && $("#hospital_offices").val() =="其他"){
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
			var jobTitle;
			if(jobtitleFlag && $("#pct_jobTitle").val() =="其他"){
				if($("#searchTitle").val()==""){
					alert("职称不能为空!");
					$("#searchTitle").focus();
					return false;
				}else{
					jobTitle=$("#searchTitle").val();
				}
			}else{
				jobTitle=$("#pct_jobTitle").find("option:selected").text();
			}

			var post;
			if(postFlag && $("#pct_userPost").val() =="其他"){
				if($("#searchPost").val()==""){
					alert("职称不能为空!");
					$("#searchPost").focus();
					return false;
				}else{
					post=$("#searchPost").val();
				}
			}else{
				post=$("#pct_userPost").find("option:selected").text();
			}
			
			if(name==""||hospitalOffices==""||hospitalName==""||jobTitle==""){
				alert("所填内容不能为空");
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
			if(confirm("确定要修改吗!")){
			var update=$.Params.create();
			update.addParams("publicNo",brandId);
			update.addParams("name",name);
			update.addParams("tel",tel);
			update.addParams("birthday",birthday);
			update.addParams("sex",sex);
			update.addParams("email",email);
			update.addParams("province",province);
			update.addParams("city",city);
			update.addParams("hospitalName",hospitalName);
			update.addParams("hospitalOffices",hospitalOffices);
			update.addParams("jobTitle",jobTitle);
			update.addParams("post",post);
			update.addParams("doctorNum",doctorNum);
			update.addParams("education",educational);
			update.addParams("id",memberId); 
			update.ajax(getIP()+"member.action?update1",function (data){
				if(data.success){	
					alert("修改成功！");
					window.location.href="PC/newUpdateMyData.jsp";
					/*var back = $.Params.create();
				   	back.ajax(getIP()+"member.action?logOut", function (data) {
				   		if(data.success){
				   	 		window.localStorage.setItem("openId",null);
				   	 		window.location.href=getIP()+"PC/newIndex.jsp";
							$("#responsive").modal('hide');
				   	 	}
					})	*/
				}else{
					alert(data.msg);
					return false;
				}
			});
			}
		})		
 	</script>
	</body>
</html>