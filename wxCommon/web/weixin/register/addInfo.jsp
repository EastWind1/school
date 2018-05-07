<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<!DOCTYPE>
<html>
  <head>
	<title>完善信息</title>
	<jsp:include page="../common.jsp"></jsp:include>
	<script type="text/javascript" src="weixin/js/jweixin-1.0.0.js"> </script>
	<script type="text/javascript" src="weixin/js/weixinjs.js"> </script>
  </head>
  
  <body>
    <div class="content">
		<div class="card formgroup">
			<ul class="table-view meninfo">
			  <li class="table-view-cell">
				<a>
				  <span class="badge mename"><input id="name" type="text" placeholder="请填写真实姓名" /></span>
				  姓名
				</a>
			  </li>
			  <li class="table-view-cell" id="hospitalName1">
				<a class="navigate-right" >
				<span class="badge" id="yiyuan"></span>
				  医院
				</a>
			  </li>
			  <li class="table-view-cell" id="hospitalOffices1">
				<a class="navigate-right">
				<span class="badge" id="keshi"></span>
				  科室
				</a>
			  </li>
			  <li class="table-view-cell" id="jobTitle1">
				<a class="navigate-right">
				<span class="badge" id="zhicheng"></span>
				  职称
				</a>
			  </li>
			</ul>
 		</div>
 		<div class="content-padded">
	      <a class="btn btn-primary btn-block" id="reg">完成</a>
	    </div> 
 	</div>
 	
  </body>
  <script type="text/javascript" src="weixin/register/js/register.js"> </script>
</html>
