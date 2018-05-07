<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0, minimum-scale=1.0, maximum-scale=1.0">
	<title>云  ICU</title>
	<jsp:include page="media.jsp"></jsp:include>
	<script type="text/javascript" src="PC/newIndexjs/newIndexList.js"></script>
	<!--[if (gte IE 8)|!(IE)]>
		<style>
			.mt{margin-top:150px !important;}
		</style>
	<![endif]-->
</head>
<body class="page-header-fixed page-full-width">
		<!-- 顶部导航 begin-->
	<jsp:include page="head.jsp"></jsp:include>
	<!-- 顶部导航 end -->
 	<!-- 内容主体  begin-->
	<div class="page-header-fixed page-container">
		<div class="row-fluid mt">
			<div class="span12">
				<div class="index_banner">
					
				</div>
				<div class="container-fluid index_content">
					<div class="index_contentLeft">
						<div class="index_login" id="indexlogin">
							<span class="index_modelTitle index_loginTitle">登录</span>
							<div class="logContainer">
								<div class="unLogin">
									<input type="text" placeholder="请输入手机号或邮箱" name="index_UserName" id="login_email" />
			 						<input type="password" placeholder="请输入密码" name="index_UserPwd" id="login_pwd" />
			 						<a id="logLayout_btn" class="index_logBtn hasPointer">登录</a><a href="PC/registerFirst.jsp">注册</a>
								</div>
								<!-- <div class="userLogInfo">
									<div class="user_log user_logDetails">
										<div class="user_logImg">
											<img src="data/expert/head_img_20150717084857.png" alt="">
										</div>
								  		<ul class="user_logInfo">
								  			<li><h3 class="user_logName"></h3></li>
								  			<li>
								  				<label for="">职称：</label>
								  				<span class="user_logTitle"></span>
								  			</li>
								  			<li>
								  				<label for="">医院：</label>
								  				<span class="user_logHospitalName"></span>
								  			</li>
								  			<li>
								  				<label for="">科室：</label>
								  				<span class="user_logOffice"></span>
								  			</li>
								  		</ul>
								  	</div>
								</div> -->
							</div>
						</div>
						<div class="index_zx">
							<span class="index_modelTitle index_zxTitle borderTopRadius">
								新闻资讯
								<a href="PC/information_zx.jsp" class="index_bkMore">More</a>
							</span>
							<ul class="index_zxList  borderBotRadius"></ul>
						</div>
					</div>
					<div class="index_contentCenter">
						<div class="index_onlineClass">
								<span class="index_modelTitle index_onlineClassTitle borderTopRadius">
									直播课程
									<a href="PC/newcrouseClass.jsp" class="index_bkMore">More</a>
								</span>
								<div class="index_onlineClassContainer borderBotRadius">	
									<div class="index_onlineClassImg">
										<img src="PC/image/course.png" alt="无法显示"/>
									</div>
									<ul class="index_onlineClassList"></ul>
								</div>
						</div>
						<div class="index_videoClass">
							<span class="index_modelTitle index_videoClassTitle borderTopRadius">
								点播课程
								<a href="PC/newDbClass.jsp" class="index_bkMore">More</a>
							</span>
							<div class="index_videoClassContainer borderBotRadius">	
								<div class="index_videoClassImg">
									<img src="PC/image/videoClass.png" alt="无法显示"/>
								</div>
								<ul class="index_videoClassList"></ul>
							</div>
						</div>					
					</div>
					<div class="index_contentRight">
						
						<a class="index_erweima">
							<img src="PC/image/apnet_erweima.png" class="index_erweima">
							<p>微信关注胰腺炎平台</p>
							<p>随时随地获取最新消息</p>
						</a>
						<div></div>
						<a href="http://www.pgyer.com/hOzL" style="display:block;">
							<img src="PC/image/ios_download.png" style="margin-top: 5px;">
						</a>
						<a href="http://www.pgyer.com/WuGS" target="blank" style="display:block;">
							<img src="PC/image/Android_download.png"  style="margin-top: 5px;">
						</a>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="indexCopyRight">©2016南京优屏生物科技有限公司</div> 	
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
	<script>
		var currentNav = $(".nav_index");
		addBorder(currentNav,"nav_barBorder");
	</script>
	</body>
</html>