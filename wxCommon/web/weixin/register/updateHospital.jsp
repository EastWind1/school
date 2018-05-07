i<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<!DOCTYPE>
<html>
  <head>
	<title>选择医院</title>
	<jsp:include page="../common.jsp"></jsp:include>
	
  </head>
  
  <body>
    <div class="content">
		<div class="card formgroup">
			<ul class="table-view meninfo" id="hospitalName" >
			  <li id="li1" class="table-view-cell hosname"><a><input id="searchosinp" type="text" placeholder="在此处输入医院名称"><img id="sousuo" src="weixin/images/search.png" /></a></li>
			</ul>
 		</div>
 	</div>
  </body>
  <script type="text/javascript" src="weixin/register/js/updatehospital.js"> </script>
  <script type="text/javascript" src="js/city.js" ></script>
</html>
