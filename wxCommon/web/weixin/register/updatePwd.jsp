<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<!DOCTYPE>
<html>
  <head>
	<title>修改密码</title>
	<jsp:include page="../common.jsp"></jsp:include>
	
  </head>
  
  <body>
    <div class="content">
		<div class="card formgroup">
			<form class="input-group formreg">
			  <div class="input-row pwd">
			    <label>原密码</label>
			    <input id="pwd1" type="password" placeholder="请输入原密码">
			  </div>
			   <div class="input-row pwd">
			    <label>新密码</label>
			    <input id="pwd2" type="password" placeholder="请输入新密码">
			  </div>
			   <div class="input-row pwd">
			    <label>确认密码</label>
			    <input id="pwd3" type="password" placeholder="请确认密码">
			  </div>
			</form>
		
 		</div>
 		<div class="content-padded">
	      <a class="btn btn-primary btn-block" id="regPwd">保存</a>
	    </div> 
 	</div>
 	
  </body>
  <script type="text/javascript" src="weixin/register/js/update.js"> </script>
</html>
