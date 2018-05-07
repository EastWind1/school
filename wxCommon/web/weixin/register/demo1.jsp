<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<!DOCTYPE>
<html>
  <head>
	<title>1元看电影</title>
	<jsp:include page="../common.jsp"></jsp:include>
	<script>
		$(function(){
			$("#reg1").on("click",function(){
				alert("点击链接到手机APP");
				})
		})
	</script>
  </head>
  
  <body>
   <img style="width:100%" src="weixin/images/demo1.jpg" />
   <div class="content-padded">
	      <a class="btn btn-primary btn-block" id="reg1">参加活动</a>
	    </div> 
  </body>
  
</html>
