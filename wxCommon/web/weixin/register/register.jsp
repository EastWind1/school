<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<!DOCTYPE>
<html>
  <head>
	<title>我要注册</title>
	<jsp:include page="../common.jsp"></jsp:include>
	
  </head>
  
  <body>
    <div class="content">
		<div class="card formgroup">
			<form class="input-group formreg">
			  <div class="input-row">
			    <label>手机号</label>
			    <input id="tel" type="tel" placeholder="请输入11位手机号">
			     <label id="getcode" class="hqyzm">获取验证码</label>
			  </div>
			  <div class="input-row">
			    <label>验证码</label>
			    <input style="width:55%" id="code" type="number" placeholder="请输入正确的验证码">
			  </div>
			  <div class="input-row">
			    <label>密&nbsp;&nbsp;&nbsp;码</label>
			    <input id="pwd" type="password" placeholder="请输入6-10位密码">
			  </div>
			  <div class="ystk"><input id="check" type="checkbox"  name="agree_box" id="agree_box" checked="checked"  /> <a id="iagree">我同意云ICU医生用户协议</a></div>
			</form>
			
 		</div>
 		<div class="content-padded">
	      <a class="btn btn-primary btn-block" id="reg1">立即注册</a>
	    </div> 
 	</div>
 	
  </body>
  <script type="text/javascript" src="weixin/register/js/register.js"> </script>
  <script type="text/javascript" > 
  window.localStorage.removeItem("province");
  window.localStorage.removeItem("city");
  window.localStorage.removeItem("hospitalName");
  window.localStorage.removeItem("hospitalOffices");
  window.localStorage.removeItem("jobTitle");
  window.localStorage.removeItem("tel");
  window.localStorage.removeItem("pwd");
  window.localStorage.removeItem("name");
  </script>
</html>
