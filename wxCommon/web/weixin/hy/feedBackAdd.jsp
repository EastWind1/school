<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<!DOCTYPE>
<html>
  <head>
	<title>课程反馈</title>
	<jsp:include page="../common.jsp"></jsp:include>
  </head>
  <body>
    <div class="content">
		<div class="card cardmagin">
		<table>
			<tr>
				<td class="tdval" style="padding-left:5px;">请输入评论内容：</td>
			</tr>
			<tr>
				<td class="tdval" style="padding-left:5px;"><textarea style="width:100%;height:122px;" id="contents" placeholder="请输入200字内评论"></textarea></td>
			</tr>
		</table>
		<div class="content-padded">
	      <a class="btn btn-primary btn-block" id="reg">提交</a>
	    </div> 
 		</div>
 		<div class="card feedback">
 			<h2 id="plCount" ></h2>
 			<ul class="table-view wx_fedBack" id="plList" >
 			</ul>
 		</div>
 	</div>
  </body>
  <script type="text/javascript" src="weixin/hy/js/feedBackAdd.js"></script>
</html>




