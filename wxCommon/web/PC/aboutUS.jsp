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
						<!--导航下内容部分  begin-->
						<div class="content_one">
							<div class="container conTen" style="margin: 40px auto;">
								<div class="row-fluid">
  									<jsp:include page="leftSection.jsp"></jsp:include>
									<div class="ab_contentRight" id="zjzx">
										<span class="index_modelTitle ab_infomationTitle borderTopRadius">关于我们</span>
										<div class="ab_container borderBotRadius">
											<!-- <span class="ab_pingtaiTitle">平台简介</span>-->
											<div class="ab_pingtaiContainer" id="newindex">
												<div class="ab_pingtaiInfo">
													<!-- <h3 style="text-align:center; color:#000; font-weight:bold;">云ICU介绍</h3> -->
													<p style="text-indent:2em;color:#333;margin-top:10px;">云ICU是面向全球的重症医学交流平台，汇聚全球顶尖专家，提供重症医学咨询、在线教育、在线会议、学术讨论等服务。</p>
													<p class="ab_pingtaiInfoTitle">1、云ICU平台创立的背景：</p>
													<ul style="color:#333">
														<li>(1)	国家大力支持“互联网+医疗”项目。</li>
														<li>(2)	政策支持与政府号召实行分级诊疗。</li>
														<li>(3)	国家投入建设的远程医疗中心，已部分实现医疗资源下基层。但现有平台无法满足需求，且投入大，实用性较低。</li>
													</ul>
													<p class="ab_pingtaiInfoTitle">2、目的与意义：</p>
													<ul style="color:#333">
														<li>目的：实现全球互联互通，ICU交流平台。</li>
														<li>意义：服务ICU，惠民医疗，医、教、研、商同步发展。</li>
													</ul>
													<p class="ab_pingtaiInfoTitle">3、云ICU平台特点：</p>
													<ul style="color:#333">
														<li>(1)	即时性，无延迟，适应复杂的网络环境。</li>
														<li>(2)	PC、PAD、手机均可接入，可无限扩展各种医疗系统。</li>
														<li>(3)	操作简单明了。</li>
													</ul>
													<p class="ab_pingtaiInfoTitle">4、给医生带来的意义：</p>
													<ul style="color:#333">
														<li>(1)	全天候提供顶级专家咨询服务，解决棘手难题。</li>
														<li>(2)	提供个性化课程，随时学习与讨论，提高疾病诊断。</li>
													</ul>
													
												</div>
												<div class="ab_pingtaiImg">
													<img src="PC/image/pingtai2.png" alt="" style="margin-bottom:5px;border:1px solid #ccc;border-radius:26px;max-width:99%"/>
													<p class="ab_pingtaiInfoTitle" style="margin: 5px;text-align:center;">国际化在线交流</p>
													<img src="PC/image/pingtai3.png" alt=""/>
													<p class="ab_pingtaiInfoTitle">云ICU致力于重症领域的医学交流与提升，一起共建属于我们的云ICU！</p>
												</div>
											</div>
											<!--<div class="ab_pingtaiInfo_erweima">
												<img src="PC/image/pingtai1.jpg" alt="" />
												<span style="font-size: 20px; color: #0F308A;">云ICU &nbsp; 我的ICU</span>
											</div>-->
											<span class="ab_bigEventTitle" style="margin:0px">大事记</span>
											<div class="ab_bigEventContainer">
												<div class="ab_bigEvent" id="dsjList">
													<div class="zx_list">
														<div class="zx_img ol_ClassImg" haspointer="">
															<img  src="data/material/material_20150722040105572036.jpg" alt="无法显示" class="infomationimg">
														</div>
														<div class="zx_info">
															<span class="zx_infoTitle hasPointer">移动医疗切入慢性病细分市场 信息准确性亟待提升</span>
															<p class="hasPointer"></p><p class="zx_infoTime">2015-07-23 15:23:22</p>
														</div>
													</div>
												</div>
												<div class="ab_bigEventImg">
													<img src="PC/image/big_Event.png">
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
			</div>
			<!-- 底部  begin-->
			<div class="copyRight"></div> 	
			<!-- 底部  end -->
		</div>
	</div>
	<script src="PC/js/pageMedia.js"></script>
	<script type="text/javascript" src="PC/newIndexjs/aboutUS.js"></script>
	<script src="PC/newIndexjs/leftSection.js" type="text/javascript" charset="utf-8"></script>
	<script>
		var currentNav = $(".nav_aboutUs");
		addBorder(currentNav,"nav_barBorder");
	</script>
	</body>
</html>