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
								<div class="pct_contentRight" id="changePwd">
									<div class="pct_content">
										<h3 class="pct_contentTitle">修改密码</h3>
										<form action="" method="post" class="pct_myInfo">
											<div class="control-group">
											    <label class="control-label">&nbsp;&nbsp;&nbsp;&nbsp;原密码：</label>
											    <div class="controls">
											    	<input type="password" id="pwd_old" name="pwd_old" placeholder="原密码"/>
											    	<label class="oldPwd"></label>
											    </div>
											</div>
											<div class="control-group">
											    <label class="control-label">&nbsp;&nbsp;&nbsp;&nbsp;新密码：</label>
											    <div class="controls">
											    	<input type="password" id="pwd_new" name="pwd_new" placeholder="新密码"/>
											    	<label class="newPwd"></label>
											    </div>
											</div>
											<div class="control-group">
											    <label class="control-label">确认密码：</label>
											    <div class="controls">
											    	<input type="password" id="pwd_newRe" name="pwd_newRe" placeholder="确认密码"/>
											    	<label class="reNewPwd"></label>
											    </div>
											</div>
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
			<button type="button" data-dismiss="modal" class="btn" id="qxBtn">取消</button>
			<button id="subBtn" type="button" class="btn blue">确定</button>
		</div>
	</div>
 	<!-- 内容主体  end -->
 	<script src="PC/newIndexjs/newChangePwd.js"></script>
 	<script>
 	 	//添加边框
 		var currentNav = $(".nav_gr");
		var sildeBar = $(".pct_changePwd");
		addBorder(currentNav,"nav_barBorder");
		addBorder(sildeBar,"pct_slideNavBar");
 	</script>
	</body>
</html>