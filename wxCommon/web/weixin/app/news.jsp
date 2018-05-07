<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<!DOCTYPE>
<html>
  <head>
	<title>最新资讯</title>
	<jsp:include page="../common.jsp"></jsp:include>
	<script type="text/javascript" src="common/iscroll.js"></script>
  </head>
  <style>
  	a:hover{text-decoration:none;}
  </style>
  <body>
  <header class="bar bar-nav" style="background-color:#38ABEA">
  <h1 class="title" style="color:#fff"></h1>
</header>
    <div class="content" style="margin-top:44px;">
    <div id="wrapper">
	<div id="scroller">
	<div class="card" style="margin: 0!important;">
		<ul class="table-view" id="newcon" style="margin-left: 0!important;"></ul>
		</div>
	</div>
	</div>
 	</div>
  </body>
   	<script src="weixin/app/new.js"></script>
</html>
