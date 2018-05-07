<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<!DOCTYPE>
<html>
  <head>
	<title>修改手机号</title>
	<jsp:include page="../common.jsp"></jsp:include>
	
  </head>
  
  <body>
    <div class="content">
		<div class="card formgroup">
			<form class="input-group formreg">
			  <div class="input-row">
			    <label>手机号</label>
			    <input id="tel" type="number" placeholder="请输入手机号">
			     <label id="getcode" class="hqyzm">获取验证码</label>
			  </div>
			  <div class="input-row">
			    <label>验证码</label>
			    <input id="code" type="number" placeholder="请输入4位验证码">
			  </div>
			</form>
		
 		</div>
 		<div class="content-padded">
	      <a class="btn btn-primary btn-block" id="regTel">保存</a>
	    </div> 
 	</div>
 	
  </body>
  <script type="text/javascript" src="weixin/register/js/update.js"> </script>
</html>
