<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<!DOCTYPE>
<html>
  <head>
	<title>发送邮件</title>
	<jsp:include page="../common.jsp"></jsp:include>
	<script src="weixin/kf/js/xfServices.js" type="text/javascript"></script>
	<script src="weixin/kf/js/xfSoapClient.js" type="text/javascript"></script>
  </head>
  
  <body>
    <div class="content">
		<div class="card nonemagin">
 			<ul class="table-view emailpage">
 				<li class="table-view-cell">收件人：云ICU</li>
 				<li class="table-view-cell">主题：<input id="title" /></li>
 				<li class="table-view-cell">内容：<textarea id="content" rows="" cols=""></textarea> </li>
 			</ul>
 		</div>
 		 <div id="sendEmail" class="content-padded">
	      <a class="btn btn-primary btn-block">发送</a>
	    </div> 
 	</div>
  </body>
  <script type="text/javascript">
  	$(function(){
  			$("#sendEmail").on("click",function(){
  				var email=$.Params.create();
  				var title=$("#title").val();
  				var content=$("#content").val();
  				if(title==""){
					alert("主题能为空");
					return false;
  	  			}
  	  			if(content==""){
					alert("内容不能为空");
					return false;
  	  	  		}
			    email.addParams("title",title); 
			    email.addParams("content",content);
			    email.addParams("openId",openId); 
			    email.addParams("publicNo",brandId); 
			    email.addParams("filed1",kfemail); 
			    email.ajax(getIP()+"logEmail.action?add",function(data){
					setEmail(title,content);
				})
  	})
  			
  	function setEmail(title,content){
  		var pl = new SOAPClientParameters();//方法参数对象
	    pl.add("in0", kfemail);//参数配置 in0是方法参数索引，in1，in2 。。。。
	    pl.add("in1",title);
	    pl.add("in2", content);
	    pl.add("in3", "");
	    var noteurl = xfServices.mailService;
	    var req = SOAPClient.request(noteurl, "sendMail", pl,
	            function (data) {
			//成功后回调
					if(data){
						alert("发送成功！");
						window.location.href="weixin/kf/callkf.jsp"
					}
	            },function(e){
	            alert(e.responseText);
	        });
	    $.ajax(req);
  		}
  	})
  </script>
</html>
