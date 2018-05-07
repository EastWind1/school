<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0, minimum-scale=1.0, maximum-scale=1.0">
	<title>云  ICU</title>
	<jsp:include page="media.jsp"></jsp:include>
	<style type="text/css">


	</style>
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
  									<div class="pct_contentRight">
  										<div class="pct_content">
  											<h3 class="pct_contentTitle">个人信息</h3>
  											<form action="" method="post" class="pct_myInfo">
  												<!-- <div class="control-group">
												    <label class="control-label noPointer">医师认证：</label>
												    <div class="controls">
												    	未认证
												    </div>
												</div> -->
												<div class="control-group">
												    <label class="control-label noPointer">姓名：</label>
												    <div class="controls">
												    	<input type="text" id="pct_userName" name="pct_userName" disabled />
												    </div>
												</div>
												<div class="control-group">
												    <label class="control-label noPointer">性别：</label>
												    <div class="controls pct_sex" >
												    	<img src="PC/image/sex0.png" id="sex1" sex="1" style="width: 25px; height: 25px;"/>&nbsp;<label for="sex1">男</label>
												    	<img src="PC/image/sex1.png" id="sex2" sex="2" style="width: 25px; height: 25px;"/>&nbsp;<label for="sex2">女</label>
												    </div>
												</div>
												<!-- <div class="control-group">
												    <label class="control-label noPointer">地区：</label>
												    <div class="controls">
												    	<input type="text" id="pct_area" name="pct_area" disabled/>
												    </div>
												</div> -->
												<div class="control-group">
												    <label class="control-label noPointer">医院：</label>
												    <div class="controls">
												    	<input type="text" id="pct_userHospital" name="pct_userHospital" disabled/>
												    </div>
												</div>
												<div class="control-group">
												    <label class="control-label noPointer">科室：</label>
												    <div class="controls">
												    	<input type="text" id="pct_userOffices" name="pct_userOffices" disabled/>
												    </div>
												</div>
												<div class="control-group">
												    <label class="control-label noPointer">职称：</label>
												    <div class="controls">
												    	<input type="text" id="pct_userPost" name="pct_userPost" disabled/>
												    </div>
												</div>
												<div class="control-group">
												    <label class="control-label noPointer">职务：</label>
												    <div class="controls">
												    	<input type="text" id="pct_jobTitle" name="pct_jobTitle" disabled/>
												    </div>
												</div>
												<div class="control-group">
												    <label class="control-label noPointer">邮箱：</label>
												    <div class="controls">
												    	<input type="text" id="pct_userEmail" name="pct_userEmail" disabled/>
												    </div>
												</div>
												<div class="control-group">
												    <label class="control-label noPointer">手机号：</label>
												    <div class="controls">
												    	<input type="text" id="pct_userPhone" name="pct_userPhone" disabled/>
												    </div>
												</div>
											<!--	<div class="control-group">
												    <label class="control-label noPointer">出生日期：</label>
												    <div class="controls">
												    	<input type="text" id="pct_userBirthday" name="pct_userBirthday" disabled/>
												    </div>
												</div>
												
												 <div class="control-group">
												    <label class="control-label noPointer">资格证编码：</label>
												    <div class="controls">
												    	<input type="text" id="doctorNum" name="doctorNum" disabled/>
												    </div>
												</div>
												<div class="control-group">
												    <label class="control-label noPointer">学历：</label>
												    <div class="controls">
												    	<input type="text" id="educational" name="educational" disabled/>
												    </div>
												</div> -->
												<a id="pct_infoUpdate" style="display: none;">修改</a>
  											</form>
  										</div>
  									</div>
								</div>
  							</div>
					</div>
				</div>
			</div>
			<!--导航下内容部分  end-->
		</div>
	</div>	
	<!-- 底部  begin-->
	<div class="copyRight"></div> 	
	<!-- 底部  end -->
 	<!-- 内容主体  end -->
	<script src="PC/js/pageMedia.js"></script>
 	<script src="PC/newIndexjs/newMyData.js"></script>
	<script>
		var currentNav = $(".nav_gr");
		var sildeBar = $(".pct_myData");
		addBorder(currentNav,"nav_barBorder");
		addBorder(sildeBar,"pct_slideNavBar");
	</script>
	</body>
</html>