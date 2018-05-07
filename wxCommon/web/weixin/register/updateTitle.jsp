<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<!DOCTYPE>
<html>
  <head>
	<title>修改职称</title>
	<jsp:include page="../common.jsp"></jsp:include>
	
  </head>
  
  <body>
    <div class="content">
		<div class="card formgroup">
			<form class="input-group formreg">
			  <div class="input-row">
			    <label>职称</label>
			    <input id="jobTitle1" type="text" placeholder="请输入职称">
			  </div>
			  
			</form>
		
 		</div>
 		<div class="content-padded">
	      <a class="btn btn-primary btn-block" id="regTitle">保存</a>
	    </div> 
 	</div>
 	
  </body>
  <script type="text/javascript" src="weixin/register/js/update.js"> </script>
</html>
