<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<!DOCTYPE>
<html>
  <head>
	<title>个人信息</title>
	<jsp:include page="../common.jsp"></jsp:include>
	
  </head>
  
  <body>
    <div class="content">
		<div class="card formgroup">
			<ul class="table-view meninfo">
			  <li class="table-view-cell" id="rzCard">
				<a class="navigate-right">
					<span class="badge rzys" id="expertRz" ></span>
				  医生认证
				</a>
			  </li>
			  <li class="table-view-cell" id="xingming">
				<a class="navigate-right">
					<span id="memberName" class="badge"></span>
				 姓名
				</a>
			  </li>
			  <li class="table-view-cell" id="xingbie">
				<a class="navigate-right">
					<span id="sex" class="badge">女</span>
				  性别
				</a>
			  </li>
			  <li class="table-view-cell" id="yiyuan">
				<a class="navigate-right">
					<span id="hospital" class="badge"></span>
				  医院
				</a>
			  </li>
			  <li class="table-view-cell" id="keshi">
				<a class="navigate-right">
					<span id="offices" class="badge"></span>
				  科室
				</a>
			  </li>
			  <li class="table-view-cell" id="zhicheng">
				<a class="navigate-right">
					<span id="jobTitle" class="badge"></span>
				  职称
				</a>
			  </li>
			  <li class="table-view-cell" id="zhiwu">
				<a class="navigate-right">
					<span id="post" class="badge"></span>
				  职务
				</a>
			  </li>
			  <li class="table-view-cell" id="youxiang">
				<a class="navigate-right">
					<span id="email" class="badge"></span>
				  邮箱
				</a>
			  </li>
			  <li class="table-view-cell" id="shouji" >
				<a class="navigate-right">
					<span id="tel" class="badge"></span>
				  手机号
				</a>
			  </li>
			   <li class="table-view-cell" id="xueli" >
				<a class="navigate-right">
					<span id="education" class="badge"></span>
				  学历
				</a>
			  </li>
			  <li id="pwd" class="table-view-cell">
				<a class="navigate-right">
					<span class="badge">修改</span>
				  修改密码
				</a>
			  </li>
			</ul>
 		</div>
 	</div>
 	
  </body>
  <script type="text/javascript" src="weixin/register/js/info.js"> </script>
</html>
