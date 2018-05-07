<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0, minimum-scale=1.0, maximum-scale=1.0">
	<title>云  ICU</title>
	<jsp:include page="media.jsp"></jsp:include>
	<link rel="stylesheet" type="text/css" href="PC/css/weixin1.css"/>
	<link rel="stylesheet" type="text/css" href="PC/css/ratchet.min.css"/>
	<link rel="stylesheet" type="text/css" href="PC/css/common1.css"/>
</head>
<body class="page-header-fixed page-full-width regPage">

	<!-- 顶部导航 begin-->
	<jsp:include page="head.jsp"></jsp:include>
	<!-- 顶部导航 end -->
 	<!-- 内容主体  begin-->
	<div class="page-container row-fluid">
		<div class="page-content no-min-height">
			<div class="container-fluid promo-page">
				<div class="row-fluid">
					<div class="span12">
						<div class="regBanner">
  							<div class="container">
  								会员注册
  							</div>
  						</div>
						<!--导航下内容部分  begin-->
						<form class="form-horizontal">
						<div class="content_one">
							<div class="container conTen">
								<div class="row-fluid containBox">
									<div class="card cardmagin">
										<table class="reg">
											<tr>
			  									<td colspan="2">
			  										<div class="span12 reg_title">注册
			  										<span style="color:#f00;font-size: 12px;"> * 如果已经通过微信注册，可直接<a href="PC/login.jsp">登录</a></span>
			  										</div>
			  									</td>
											</tr>
											<tr>
												<td class="tdkey">手机号：</td>
												<td class="tdval"><input style="margin-bottom:3px;" type="text" id="tel" name="tel" placeholder="请输入手机号" required><a id="getcode" style="background-color:#63a5d8;color:#fff;border-radius:5px;padding:7px;" class="hqyzm">获取验证码</a></td>
											</tr>
											<tr>
												<td class="tdkey">验证码：</td>
												<td class="tdval"><input type="text" id="code" name="code" placeholder="验证码" required></td>
											</tr>
											<tr>
												<td class="tdkey">密码：</td>
												<td class="tdval"><input style="width:50%" type="password" id="filed1" name="filed1" placeholder="请输入密码" required></td>
											</tr>
											
											
										</table>
										<div class="agree_tk">
											<img src="PC/image/type1.png" id="agree_box" checked="checked"> 
											<label for="agree_box"><a id="readys">我同意云ICU医生用户协议</a></label>
											<a name="reg_now" class="reg_now hasPointer active" id="reg" style="width: 200px; margin: 10px auto;">立即注册</a>
										</div>	
								 	</div>
								</div>
							</div>
						</div>
						<!--导航下内容部分  end-->
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
 	<!-- 内容主体  end-->
	<!-- 底部  begin-->
	<div class="copyRight"></div> 	
	<!-- 底部  end -->
	<script src="PC/newIndexjs/registerFirst.js" type="text/javascript" charset="utf-8"></script>
	<script src="PC/js/datepicker/WdatePicker.js" type="text/javascript" charset="utf-8"></script>
</body>
</html>