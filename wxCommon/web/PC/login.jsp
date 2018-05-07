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
<body class="page-header-fixed page-full-width loginPage">

	<!-- 顶部导航 begin-->
	<jsp:include page="head.jsp"></jsp:include>
	<!-- 顶部导航 end -->
	
 	<!-- 内容主体  begin-->
	<div class="page-container row-fluid mt0">
		<div class="page-content no-min-height">
			<div class="container-fluid promo-page">
				<div class="row-fluid">
					<div class="span12">
						<div class="loginBanner">
  							<div class="container">会员登录</div>
  						</div>
						<!--导航下内容部分  begin-->
						<div class="content_one"  >
							<div class="container conTen">
								<div class="row-fluid containBox">
									<div class="card cardmagin">
										<table class="reg">
											<tr>
			  									<td>
			  										<div class="span12 lg_title">
			  											登录
			  											<span style="color:#f00;font-size: 12px;"> * 已注册的用户，初始密码是111111</span>
			  										</div>
			  									</td>
			  									<td></td>
											</tr>
											<tr>
												<td></td>
												<td></td>
											</tr>
											<tr>
												<td class="tdkey" style="height: 50px;">账号：</td>
												<td class="tdval" style="height: 50px;"><input type="text" id="login_email" style="height: 100%;width:100%" placeholder="请输入手机号或邮箱"></td>
											</tr>
											<tr style="display:none;">
												<td class="tdkey" style="height:14px;line-height:14px;"></td>
												<td id="showMsg" class="tdval" style="height:14px;line-height:14px;font-size:14px;color:#f00;display:none;"></td>
											</tr>
											<tr>
												<td style="height: 30px;"></td>
												<td style="height: 30px;"></td>
											</tr>
											<tr>
												<td class="tdkey" style="height: 50px;">密码：</td>
												<td class="tdval" style="height: 50px;"><input type="password" id="login_pwd" style="height: 100%;" placeholder="请输入密码"></td>
											</tr>
											<tr>
												<td style="width: 20%;"></td>
												<td><a name="reg_now" class="reg_now active" id="logLayout_btn" style="width: 100px; height: 36px; line-height: 36px; display: block; text-align: center; color: #fff; margin: 10px auto; background: -webkit-gradient(linear,0 50%,100% 50%,from(#7ebe20),to(#90d62a));background: -webkit-linear-gradient(0deg, #7ebe20, #90d62a);background: -o-linear-gradient(0deg, #7ebe20, #90d62a); float: left;">登录</a></td>
											</tr>
											<tr>
												<td style="width: 15%; "></td>
												<td><a href="PC/registerFirst.jsp" style="font-size: 14px; color: #46A1D5;">注册 </a></td>
											</tr>
										</table>
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

 	<!-- 内容主体  end -->
	<script>
		/**
	 * 网站登录
	 */
	$("#logLayout_btn").on("click",function(){
		var email=$("#login_email").val();
		var pwd=$("#login_pwd").val();
		if(email == "" || pwd == ""){
			$("#showMsg").parent().show();
			$("#showMsg").html("用户名或密码为空！");
			$("#showMsg").show();
			return false;
		}
		if(!checkEmail(email) && !valPhone(email)){
			$("#showMsg").parent().show();
			$("#showMsg").html("请输入正确的手机号或者邮箱登录！");
			$("#showMsg").show();
			return false;
		}

		var login=$.Params.create();
		login.addParams("email",email);
		login.addParams("filed1",pwd);
		login.addParams("type",place);
		login.ajax(getIP()+"member.action?login",function(data){
				if(data.success){
					if(data.openId == null || data.openId == ""){
						window.location.href=getIP()+"PC/newErweimaLog.jsp?tel="+email+"&pwd="+pwd;
					}else{
						var url=window.localStorage.getItem("htmlurl");
						if(url == null || url == "null"){
							window.location.href=getIP()+"PC/newIndex.jsp";
						}else{
							window.location.href=getIP()+"PC/"+url;
						}				
					}	
				}else{
					$("#showMsg").parent().show();
					$("#showMsg").html("用户名或者密码错误");
					$("#showMsg").show();
					return false;
				}
			
		});
	})
	</script>
	</body>
</html>