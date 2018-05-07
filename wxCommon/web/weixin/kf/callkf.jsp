<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<!DOCTYPE>
<html>
  <head>
	<title>联系我们</title>
	<jsp:include page="../common.jsp"></jsp:include>
  </head>
  
  <body>
    <div class="content">
    <div class="card nonemagin" style="border:0px;">
    	<img class="bannerimg" src="weixin/images/kf_banner.png">
    </div>
    <div class="card nonemagin zjdeobj">
 			<ul class="table-view callkf">
 				 <li class="table-view-cell">
 				<p><a href='tel:400-855-4120'><img  src="weixin/images/bh.png" /></a></p>
 				</li>
 				<li style="text-align:center;padding-left:10px;">
 				<p>申请专家咨询、在线学习等服务<br />请点击上面的拨号按钮，联系我们！</p>
 				</li>
 				<!-- <li class="table-view-cell barbutton">
 					<a id="closeWindow">微信</a><a id="email">邮件</a>
 				</li> -->
 				<!-- <li class="table-view-cell">
 				  <video id="video1" width="420" style="margin-top:15px;">
				    <source src="data/video/yl.mp4" type="video/mp4" />
				  </video>
 				</li> -->
 			</ul>
 			<!-- <div class="card cardmagin">
 			<ul class="table-view callkf">
 			<li class="tdval" style="padding-left:5px;">请输入反馈问题：</li>
 				 <li class="tdval" style="padding-left:5px;"><textarea style="width:100%;height:122px;" id="contents"></textarea></li>
 				</ul>
 			<div class="content-padded">
	      <a class="btn btn-primary btn-block" id="reg">提交</a>
	    	</div>  -->
	    </div>
	</div>		
  </body>
  <script type="text/javascript" src="weixin/js/jweixin-1.0.0.js"></script>
  <script type="text/javascript" src="weixin/kf/js/callkf.js"></script>
  <script type="text/javascript">
var myVideo=document.getElementById("video1");

function playPause(){ 
	if (myVideo.paused) 
	  myVideo.play(); 
	else 
	  myVideo.pause(); 
	} 

</script> 
</html>
