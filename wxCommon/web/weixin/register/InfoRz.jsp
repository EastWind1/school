<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<!DOCTYPE>
<html>
  <head>
	<title>医生认证</title>
	<jsp:include page="../common.jsp"></jsp:include>
	<style>
		ul span{
			background-color: rgb(70, 70, 215);
			float: right;
			border-radius: 5px;
			padding: 5px 24px 5px 24px;
			color: #fff;
		}
	</style>
	
  </head>
  
  <body>
    <div class="content rzcon">
		<div class="card formgroup">
			<ul class="table-view">
				<li class="table-view-cell table-view-divider">
		        	<span id="checkRecord" >我的审核记录</span>
		        </li>
		        <li class="table-view-cell table-view-divider">
		        	请上传至少一个证件照
		        	<p>请确保姓名、编号、执业范围等信息清晰可见。上传资料仅作认证，患者及第三方不可见</p>
		        </li>
		        <li class="table-view-cell">
		          工作证
		           <p class="titl">请上传本人手持工作证照片，保证证件照和本人样貌清晰</p>
		           <p name="yb" yb="yb1" class="ck">参考样板>></p>
		          <a name="cardImg" ctype="1" class="btn btn-outlined btn-positive"><img src="weixin/images/uprz.png" /></a>
		        </li>
		        <li class="table-view-cell">
		          执业证
		          <p class="titl">请上传有本人姓名医师执业证页</p>
		          <p  name="yb" yb="yb2"class="ck">参考样板>></p>
		           <a name="cardImg" ctype="2" class="btn btn-outlined btn-positive"><img src="weixin/images/uprz.png" /></a>
		        </li>
		        <li class="table-view-cell">
		          资格证
		          <p class="titl">请上传有本人姓名的医师资格证页</p>
		          <p name="yb" yb="yb3" class="ck">参考样板>></p>
		           <a name="cardImg" ctype="3" class="btn btn-outlined btn-positive"><img src="weixin/images/uprz.png" /></a>
		        </li>
	        </ul>
 		</div>
 	</div>
 	
  </body>
  <script type="text/javascript" src="weixin/js/jweixin-1.0.0.js"> </script>
  <script type="text/javascript" src="weixin/register/js/infoRz.js"> </script>
</html>
