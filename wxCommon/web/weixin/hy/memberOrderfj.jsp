<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<!DOCTYPE>
<html>
  <head>
	<title>预约记录</title>
	<jsp:include page="../common.jsp"></jsp:include>
	<script type="text/javascript" src="weixin/js/jweixin-1.0.0.js"> </script>
<script type="text/javascript"src="weixin/hy/js/orderListFj.js"></script>
  </head>
  
<body>
	<div class="content cont" id="blList" style="height:1000px;">
		<div class='card listsz'>
			<h4>入院检查<a id="chooseImage1" typeNo="1" style="border: 1px solid;border-radius: 5px;color: #fff;background-color: #008000;padding: 5px;">上传图片</a></h4>
			<ul class='table-view' style='margin-left:0px;padding-right:5px;' id="content1">
			</ul>
		</div>
		<div class='card listsz'>
			<h4>实验室检查<a id="chooseImage2" typeNo="2" style="border: 1px solid;border-radius: 5px;color: #fff;background-color: #008000;padding: 5px;">上传图片</a></h4>
			<ul class='table-view' style='margin-left:0px;' id="content2">
			</ul>
		</div>
		<div class='card listsz'>
			<h4>影像学检查<a id="chooseImage3" typeNo="3" style="border: 1px solid;border-radius: 5px;color: #fff;background-color: #008000;padding: 5px;">上传图片</a></h4>
			<ul class='table-view' style='margin-left:0px;' id="content3">
			</ul>
		</div>
		<div class='card listsz'>
			<h4>其他辅助检查<a id="chooseImage4" typeNo="4" style="border: 1px solid;border-radius: 5px;color: #fff;background-color: #008000;padding: 5px;">上传图片</a></h4>
			<ul class='table-view' style='margin-left:0px;' id="content4">
			</ul>
		</div>
		<div class="content-padded">
	      <a class="btn btn-primary btn-block" id="regbl">提交</a>
	    </div> 
	</div> 

</body>

</html>
