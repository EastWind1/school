<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<!DOCTYPE>
<html>
  <head>
	<title>最新资讯</title>
	<jsp:include page="../common.jsp"></jsp:include>
  </head>
  
  <body>
    <div class="content hy_news">
 	</div>
 	<script>
 	 $(document).ready(function(){
 	 	var url=GetQueryString("wurl");
 		$(".hy_news").load(url);
 	})
 	</script>
  </body>
</html>
