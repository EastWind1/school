<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<!DOCTYPE>
<html>
  <head>
	<title>填写科室名称</title>
	<jsp:include page="../common.jsp"></jsp:include>
	
  </head>
  
  <body>
    <div class="content">
		<div class="card formgroup">
			<form class="input-group formreg">
			  <div class="input-row">
			    <label>科室</label>
			    <input id="hospitalOffices2" type="text" placeholder="请输入科室名称">
			  </div>
			  
			</form>
		
 		</div>
 		<div class="content-padded">
	      <a class="btn btn-primary btn-block" id="regOffices">保存</a>
	    </div> 
 	</div>
 	
  </body>
  <script type="text/javascript" src="weixin/register/js/update.js"> </script>
</html>
