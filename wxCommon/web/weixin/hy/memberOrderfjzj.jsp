<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<!DOCTYPE>
<html>
  <head>
	<title>预约记录</title>
	<jsp:include page="../common.jsp"></jsp:include>
  </head>
  
<body style="overflow-y: scroll" ontouchstart="">
	<div class="content cont">
		<div class='card listsz'>
			<h4>入院检查</h4>
			<ul class='table-view' style='margin-left:0px;' id="content1">
			</ul>
		</div>
		<div class='card listsz'>
			<h4>实验室检查</h4>
			<ul class='table-view' style='margin-left:0px;' id="content2">
			</ul>
		</div>
		<div class='card listsz'>
			<h4>影像学检查</h4>
			<ul class='table-view' style='margin-left:0px;' id="content3">
			</ul>
		</div>
		<div class='card listsz'>
			<h4>其他辅助检查</h4>
			<ul class='table-view' style='margin-left:0px;' id="content4">
			</ul>
		</div>
	</div> 

<script type="text/javascript" src="weixin/js/jweixin-1.0.0.js"> </script>
<script type="text/javascript"src="weixin/hy/js/orderListFj.js"></script>

</body>
</html>
