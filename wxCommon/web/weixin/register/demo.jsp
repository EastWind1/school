<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<!DOCTYPE>
<html>
  <head>
	<title>保险</title>
	<jsp:include page="../common.jsp"></jsp:include>
	<script>
		$(function(){
			$("h3").on("click",function(){
				window.location.href="http://mp.weixin.qq.com/s?__biz=MzAxMDIzODcxMQ==&mid=400493268&idx=1&sn=6d3e0c9bccb70dc388c9c32dd7fa3ee6&scene=18#wechat_redirect";
			})
		})
	</script>
  </head>
  
  <body>
    <div class="content">
		<div class="card formgroup" style="margin-top:0px;">
			<ul class="table-view meninfo">
				<li><img style="height:200px;width:100%" src="weixin/images/demo.png" /></li>
				<li>保险</li>
			</ul>
		</div>
		<div class="card">
			<ul class="table-view meninfo">
				<li style="background-color:#ccc;padding:5px;">简介</li>
				<li>保险简介保险简介保险简介保险简介保险简介保险简介保险简介保险简介保险简介保险简介</li>
			</ul>
		</div>
		<h3 style="background-color:#fff;margin:12px;padding:5px;border-radius:5px;font-size:16px;">查看详情<a style="float:right;color:#ccc">></a></h3>
		<div class="card">
			<form class="input-group formreg">
			  <div class="input-row">
			    <label style="width:40%;text-align:right">姓名：</label>
			    <input id="code" type="text" placeholder="">
			  </div>
			  <div class="input-row">
			    <label style="width:40%;text-align:right">手机号码：</label>
			    <input id="code" type="text" placeholder="">
			  </div>
			  <div class="input-row">
			    <label style="width:40%;text-align:right">企业名称：</label>
			    <input id="code" type="text" placeholder="">
			  </div>
			  <div class="input-row">
			    <label style="width:40%;text-align:right">经营地址：</label>
			    <input id="code" type="text" placeholder="">
			  </div>
			  <div class="input-row">
			    <label style="width:40%;text-align:right">贷款类型：</label>
			    <input id="code" type="text" placeholder="">
			  </div>
			  <div class="input-row">
			    <label style="width:40%;text-align:right">贷款金额：</label>
			    <input id="code" type="text" placeholder="">
			  </div>
			  <div class="input-row">
			    <label style="width:40%;text-align:right">资金用途：</label>
			    <input id="code" type="text" placeholder="">
			  </div>
			  <div class="input-row">
			    <label style="width:40%;text-align:right">所在区域：</label>
			    <input id="code" type="text" placeholder="">
			  </div>
			</form>
			
 		</div>
 		<div class="content-padded">
	      <a class="btn btn-primary btn-block" id="reg1">提交</a>
	    </div> 
 	</div>
 	
  </body>
  <script type="text/javascript" src="weixin/register/js/register.js"> </script>
  <script type="text/javascript" > 
  window.localStorage.removeItem("province");
  window.localStorage.removeItem("city");
  window.localStorage.removeItem("hospitalName");
  window.localStorage.removeItem("hospitalOffices");
  window.localStorage.removeItem("jobTitle");
  window.localStorage.removeItem("tel");
  window.localStorage.removeItem("pwd");
  window.localStorage.removeItem("name");
  </script>
</html>
