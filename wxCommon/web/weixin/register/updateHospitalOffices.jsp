<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<!DOCTYPE>
<html>
  <head>
	<title>选择科室</title>
	<jsp:include page="../common.jsp"></jsp:include>
	
  </head>
  
  <body>
    <div class="content">
		<div class="card formgroup chec">
			<ul class="table-view meninfo" id="hospitalOffices">
			   <li class="table-view-cell" value="1"><a class="navigate-right">ICU</a></li>
			  <li class="table-view-cell" value="2"><a class="navigate-right">PICU</a></li>
			  <li class="table-view-cell" value="3"><a class="navigate-right">急诊科</a></li>
			  <li class="table-view-cell" value="4"><a class="navigate-right">急诊ICU</a></li>
			  <li class="table-view-cell" value="5"><a class="navigate-right">呼吸内科</a></li>
			  <li class="table-view-cell" value="6"><a class="navigate-right">麻醉科</a></li>
			  <li class="table-view-cell" value="10"><a class="navigate-right">心内科</a></li>
			  <li class="table-view-cell" value="7"><a class="navigate-right">儿科</a></li>
			  <li class="table-view-cell" value="8"><a class="navigate-right">产科</a></li>
			  <li class="table-view-cell" value="11"><a class="navigate-right">感染科</a></li>
			  <li class="table-view-cell" value="12"><a class="navigate-right">烧伤科</a></li>
			  <li class="table-view-cell" value="13"><a class="navigate-right">神经内科</a></li>
			  <li class="table-view-cell" value="14"><a class="navigate-right">神经外科</a></li>
			  <li class="table-view-cell" value="9"><a class="navigate-right">普通外科</a></li>
			  <li class="table-view-cell" value="9"><a class="navigate-right">其他</a></li>
			</ul>
 		</div>
 	</div>
  </body>
   <script type="text/javascript" src="weixin/register/js/updateoffices.js"> </script>
 
</html>
