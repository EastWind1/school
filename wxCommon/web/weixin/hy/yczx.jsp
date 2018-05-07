<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<!DOCTYPE>
<html>
  <head>
	<title>远程咨询</title>
	<jsp:include page="../common.jsp"></jsp:include>
  </head>
  
  <body>
    <div class="content">
     <a href="/data/app/ashe.apk">点击下载apk</a><br/>
      <a id="ipadetail">ios</a><br/>
 	</div>
  </body>
  <script type="text/javascript">
  $(function(){
  	$("#ipadetail").on("click",function(){
  		alert("");
  		window.location.href="https://itunes.apple.com/cn/app/wo-de-da-xue/id789644892?mt=8";
  	})
  	
  })
  </script>
</html>
