<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<!DOCTYPE>
<html>
  <head>
	<title>修改性别</title>
	<jsp:include page="../common.jsp"></jsp:include>
	
  </head>
  
  <body>
    <div class="content">
		<div class="card formgroup">
			<form class="input-group formreg">
			  <div class="input-row sex" id="sex" >
					<label>性别：</label>
					<img class="se" sex="1" src="weixin/images/sex1.png"> 男   <img sex="2" class="se" src="weixin/images/sex0.png"> 女
			  
			</form>
		
 		</div>
 		<div class="content-padded">
	      <a class="btn btn-primary btn-block" id="regSex">保存</a>
	    </div> 
 	</div>
 	
  </body>
  <script type="text/javascript" src="weixin/register/js/update.js"> </script>
</html>
