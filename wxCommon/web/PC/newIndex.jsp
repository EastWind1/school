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
	<style>

	</style>
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
					<div class="index_bannerMap">
						<img src="PC/image/dt.png" />
						<img id="exp1" class="animated zjHeadImg1" src="data/expert/pjk.jpg" />
						<img id="exp2" class="animated zjHeadImg2" src="data/expert/head_img_20151201121820.png" />
						<img id="exp3" class="animated zjHeadImg3" src="data/expert/head_img_20151201122002.png" />
						<img id="exp4" class="animated zjHeadImg4" src="data/expert/head_img_20151202010520547236.jpg" />
						<img id="exp5" class="animated zjHeadImg5" src="data/expert/wct.jpg" />
						<img id="exp6" class="animated zjHeadImg6" src="data/expert/yxy.jpg" />	
					</div>
					<div class="index_bannerInfo">
						<h3>汇集世界各地精英医学专家</h3>
						<h4>为您提供最专业的医学诊疗方案</h4>
						<a href="PC/newExpertList.jsp" class="checkExpert">查看专家库</a>
					</div>
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
						<!-- 
						<div class="index_gonggao">
							<span class="index_modelTitle index_gonggaoTitle borderTopRadius">
								系统公告
								<a href="PC/sysNotice_zx.jsp" class="index_bkMore">More</a>
							</span>
							<ul class="index_gonggaoList borderBotRadius"></ul>
						</div>
 						-->
 						<a  target="blank" style="padding: 30px 0;"><img src="PC/image/index_erweima.png" class="index_erweima">	</a>
						
						<a href="http://www.pgyer.com/hOzL" target="blank" style="padding: 30px 0;"><img src="PC/image/ipa.png" style="height: 90px; margin-top: 5px;"></a>
						<a href="http://www.pgyer.com/WuGS" target="blank" style="padding: 30px 0;"><img src="PC/image/apk.png"  style="height: 90px; margin-top: 5px;"></a>

					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="copyRight"></div> 	
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