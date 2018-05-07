<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
 <html lang="en">
 <head>
     <meta charset="utf-8" />
     <title>后台管理平台</title>
     <base href ="<%=basePath%>">
     <meta content="width=device-width, initial-scale=1.0" name="viewport" />
     <meta content="" name="description" />
     <meta content="" name="author" />
     <link href="media/media/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
     <link href="media/media/css/bootstrap-responsive.min.css" rel="stylesheet" type="text/css"/>
     <link href="media/media/css/font-awesome.min.css" rel="stylesheet" type="text/css"/>
     <link href="media/media/css/style-metro.css" rel="stylesheet" type="text/css"/>
     <link href="media/media/css/style.css" rel="stylesheet" type="text/css"/>
     <link href="media/media/css/style-responsive.css" rel="stylesheet" type="text/css"/>
     <link href="media/media/css/default.css" rel="stylesheet" type="text/css" id="style_color"/>
     <link href="media/media/css/uniform.default.css" rel="stylesheet" type="text/css"/>
     <link href="media/media/css/timeline.css" rel="stylesheet" type="text/css"/>
     <link rel="stylesheet" type="text/css" href="media/media/css/select2_metro.css" />
    
     <link rel="stylesheet" type="text/css" href="media/media/css/login.css" />
     <link href="media/css/media.css" rel="stylesheet" type="text/css"/>
     <!-- 去掉a下划线 -->
     <style>
         a:link { text-decoration: none;}
         a:active { text-decoration:none;}
         a:hover { text-decoration:none;}
         a:visited { text-decoration: none;}

         body{background-color:#383b47 !important;}
         .login .content{
		  	background-color: rgba(56, 109, 187, 0.6);
		    width: 287px;
		    margin: 0 auto; 
		    /*margin:0!important;*/
		    /* margin: 150px auto 0px; */
		    padding: 30px;
		    /* padding-top: 20px; */
		    /* padding-bottom: 15px; 
		    padding: 20px 60px 15px 33px;*/
		    border-radius: 6px !important;
         }
         .login .content h3{color:#fff!important;}
         .btn.green.daslogin{background-color:#48a745!important;}
     </style>
     <script src="media/media/js/jquery-1.10.1.min.js" type="text/javascript"></script>
     <script src="media/media/js/jquery-migrate-1.2.1.min.js" type="text/javascript"></script>
     <script src="media/media/js/jquery-ui-1.10.1.custom.min.js" type="text/javascript"></script>
     <script src="media/media/js/bootstrap.min.js" type="text/javascript"></script>
     <script src="media/media/js/excanvas.min.js"></script>
     <script src="media/media/js/respond.min.js"></script>
     <script src="media/media/js/jquery.slimscroll.min.js" type="text/javascript"></script>
     <script src="media/media/js/jquery.blockui.min.js" type="text/javascript"></script>
     <script src="media/media/js/jquery.cookie.min.js" type="text/javascript"></script>
     <script src="media/media/js/jquery.uniform.min.js" type="text/javascript" ></script>
     <script src="media/media/js/app.js"></script>
     <script src="media/js/ian.js" type="text/javascript"></script>
     <script src="js/getIp.js" type="text/javascript"></script>
     <link href="media/media/css/login.css" rel="stylesheet" type="text/css" />
     <script src="media/media/js/jquery.validate.min.js" type="text/javascript"></script>
     <script type="text/javascript" src="media/js/login.js"></script>
<body class="login">
<div style=" height: 100px;line-height: 100px;margin: 0 10%;">
  <span style="font-size:26px;color:#63d029;">后台管理平台</span>
</div>
		<div class="content" style="text-align: center;">
		<!-- BEGIN LOGIN FORM -->
            <img src="media/images/bg1.jpg" style="margin-bottom: 10px;width: 100px;height:100px;border-radius: 50%;"> 
			<div id="errorCue" class="alert alert-error hide">
				<button class="close" data-dismiss="alert"></button>
				<span>用户名/密码 输入错误！</span>
			</div>
			<div class="control-group">
				<!--ie8, ie9 does not support html5 placeholder, so we just show field title for that-->
				<label class="control-label visible-ie8 visible-ie9">Username</label>
				<div class="controls">
					<div class="input-icon left">

						<i class="icon-user"></i>

						<input class="m-wrap placeholder-no-fix" type="text" placeholder="用户名" value="" name="username">

					</div>
					<label id="usernameCue" for="username" class="help-inline help-small no-left-padding hide">用户名不能为空！</label>
				</div>

			</div>

			<div class="control-group">

				<label class="control-label visible-ie8 visible-ie9">Password</label>

				<div class="controls">

					<div class="input-icon left">

						<i class="icon-lock"></i>

						<input class="m-wrap placeholder-no-fix" type="password" value="" placeholder="密码" name="password">

					</div>
					<label id="passwordCue" for="password" class="help-inline help-small no-left-padding hide">密码不能为空！</label>
				</div>

			</div>

			<div class="form-actions">
				<button id="submit" type="button" class="btn green pull-right daslogin">
				登 录 <i class="m-icon-swapright m-icon-white"></i>
				</button>            
			</div>
 
</div>

</div>
</body>

</html>