<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<!DOCTYPE>
<html>
  <head>
	<title>在线点播</title>
	<jsp:include page="../common.jsp"></jsp:include>
	<style>
	</style>
  </head>
  
<body style="overflow-y: scroll" ontouchstart="">
	<div>
	<ul class="table-view meninfo" id="expProvince1">
		<li class="table-view-cell" value="0" ><a class="navigate-right">全部分类</a></li>
		<li class="table-view-cell" value="1" ><a class="navigate-right">脓毒症</a></li>
		<li class="table-view-cell" value="2" ><a class="navigate-right">重症呼吸与机械通气</a></li>
		<li class="table-view-cell" value="3" ><a class="navigate-right">重症感染</a></li>
		<li class="table-view-cell" value="4" ><a class="navigate-right">重症神经</a></li>
		<li class="table-view-cell" value="5" ><a class="navigate-right">重症肾脏与血液净化</a></li>
		<li class="table-view-cell" value="6" ><a class="navigate-right">重症营养</a></li>
		<li class="table-view-cell" value="7" ><a class="navigate-right">重症创伤</a></li>
		<li class="table-view-cell" value="8" ><a class="navigate-right">重症心脏与血流动力学</a></li>
		<li class="table-view-cell" value="9" ><a class="navigate-right">出血与凝血</a></li>
		<li class="table-view-cell" value="10" ><a class="navigate-right">重症超声</a></li>
		<li class="table-view-cell" value="11" ><a class="navigate-right">镇痛镇静谵妄</a></li>
		<li class="table-view-cell" value="12" ><a class="navigate-right">重症儿科</a></li>
		<li class="table-view-cell" value="13" ><a class="navigate-right">重症护理</a></li>
		<li class="table-view-cell" value="14" ><a class="navigate-right">重症信息与互联网</a></li>
		<li class="table-view-cell" value="15" ><a class="navigate-right">重症产科</a></li>
		<li class="table-view-cell" value="16" ><a class="navigate-right">其它</a></li>
	</ul>
	</div>
	<script>
	$("ul li").on("click",function(){
		var selValue=$(this).attr("value");
		var selText=$(this).text();
		window.localStorage.setItem("wxdb_fenlei",selValue);
		window.localStorage.setItem("wxdb_fenleiValue",selText);
		window.localStorage.removeItem("wx_scrollBar");
		window.location.href="weixin/hy/videoClass.jsp";
	})
	</script>
</body>
</html>
