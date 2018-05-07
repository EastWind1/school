<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0, minimum-scale=1.0, maximum-scale=1.0">
	<title>医生认证</title>
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
								<div class="pct_contentRight">
									<h3 class="pct_contentTitle">资格认证</h3>
									<div class="pct_baomingContent">
									 <div class="content rzcon">
										<div class="card formgroup">
											<ul class="table-view">
										        <li class="table-view-cell table-view-divider">
										        	请上传至少一个证件照
										        	<p>请确保姓名、编号、执业范围等信息清晰可见。上传资料仅作认证，患者及第三方不可见</p>
										        </li>
										        <li class="table-view-cell">
										          	工作证
										           <p class="titl">请上传本人手持工作证照片，保证证件照和本人样貌清晰</p>
										           <p name="yb" yb="yb1" class="ck">
										           		<span>参考样板>></span>
										           		<img src="PC/image/yb1.png" alt="加载失败" />
										           </p>
										          <a name="cardImg" ctype="1" id="yb1" class="btn btn-outlined btn-positive">
										          	<img src="weixin/images/uprz.png" />
										          	<i class="rz_removeImg">X</i>
										          </a>
										        </li>
										        <li class="table-view-cell">
										         	 执业证
										          <p class="titl">请上传有本人姓名医师执业证页</p>
										          <p name="yb" yb="yb2" class="ck">
										           		<span>参考样板>></span>
										           		<img src="PC/image/yb2.png" alt="加载失败" />
										           </p>
										           <a name="cardImg" ctype="2" id="yb2" class="btn btn-outlined btn-positive">
										           		<img src="weixin/images/uprz.png" />
										           		<i class="rz_removeImg">X</i>
										           </a>
										        </li>
										        <li class="table-view-cell">
										          	资格证
										          <p class="titl">请上传有本人姓名的医师资格证页</p>
										          <p name="yb" yb="yb3" class="ck">
										           		<span>参考样板>></span>
										           		<img src="PC/image/yb3.png" alt="加载失败" />
										           </p>
													<a name="cardImg" ctype="3" id="yb3" class="btn btn-outlined btn-positive">
										           		<img src="weixin/images/uprz.png" />
										           		<i id="rz_removeImg" class="rz_removeImg">X</i>
										           	</a>
										        </li>
									        </ul>
								 		</div>
								 	</div>
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
			<h3>上传图片</h3>
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
	<script src="PC/js/uuid.js"></script>
	<script src="PC/js/ajaxfileupload.js"></script>
	<script type="text/javascript" src="PC/newIndexjs/doctorRz.js"></script>
 	<script>
 	 	//添加边框
 		var currentNav = $(".nav_gr");
		var sildeBar = $(".pct_doctorRz");
		addBorder(currentNav,"nav_barBorder");
		addBorder(sildeBar,"pct_slideNavBar");
 	</script>
	</body>
</html>