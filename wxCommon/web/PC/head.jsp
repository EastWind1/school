<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<script type="text/javascript">
$(function(){
	/*if(openId == "" || openId == null){
		var opid=window.localStorage.getItem("openId");
		if(opid != null && opid != "null" && opid != "undefined" && opid != undefined){
			$("#loginRegin").hide();
			$("#myanback").show();
		}else{
			$("#loginRegin").show();
			$("#myanback").hide();
		}
		
	}*/
	
	if(memberId == "" || memberId == null){
		$("#loginRegin").show();
		$("#myanback").hide();
	}else{
		$("#loginRegin").hide();
		$("#myanback").show();
		
	}
	$('#logout').on("click",function () {
		$("#modalcont1").html("确定要退出吗？");
		$("#responsive1").modal('toggle');
    });
    $("#subBtn1").on("click",function(){
		//if (confirm("您确认要退出系统吗？")) {
    	 var back = $.Params.create();
       	 back.ajax("member.action?logOut", function (data) {
       	 	if(data.success){
				$("#responsive1").modal('hide');
				window.localStorage.removeItem("openId");
       	 		window.localStorage.setItem("openId",null);
       	 		window.location.href=getIP()+"PC/newIndex.jsp";
       	 		
       	 	}
       	 })
    	//}
	})
    $("#myhome").on("click",function(){
    	if(memberId == ""){
			//alert("请先登录！");
			window.localStorage.setItem("htmlurl","newMyData.jsp");
			window.location.href=getIP()+"PC/login.jsp";
		}else if(openId == "" || openId == null){
			window.location.href=getIP()+"PC/newErweimaLog.jsp";
		}else{
			window.location.href=getIP()+"PC/newMyData.jsp";
		}
    })
    
    $(".nav_gr a").on("click",function(){
    	if(memberId == ""){
			//alert("请先登录！");
			window.localStorage.setItem("htmlurl","newMyData.jsp");
			window.location.href=getIP()+"PC/login.jsp";
		}
		else if(openId == "" || openId == null){
			window.location.href=getIP()+"PC/newErweimaLog.jsp";
		}else{
			//$(".nav_gr a").attr("href","PC/newMyData.jsp");
			window.location.href=getIP()+"PC/newMyData.jsp";
		}
    })
    
})
</script>
<div class="header navbar navbar-inverse navbar-fixed-top navShadow">
		<div class="container-fluid">
				<div class="row-fluid" style="height: 100%; vertical-align: middle;">
					<div class="span1"></div>
  					<div class="span3">
						<div class="logo">
							<span style="font-size: 20px; color: #0F308A;font-family:华文行楷">云<font style="font-family:Calibri Bold;font-weight:800">ICU</font> &nbsp; 我的<font style="font-family:Calibri Bold;font-weight:800">ICU</font></span>
						</div>
  					</div>
  					<div class="span3"></div>
  					<div class="span4">
  						<div style=" height:100%;line-height: 70px; float: right;  text-align: right;">
							<span class="head_phone">4008554120</span>
							<span id="loginRegin" style="display: none;">
								<a style="font-size:14px;color: #0F308A;" href="PC/login.jsp">登录</a>/
								<a style="font-size: 14px; color: #0F308A;" href="PC/registerFirst.jsp">注册</a>
							</span>
							<span id="myanback">
								<a style="font-size: 14px; color: #0F308A;" id="myhome" class="hasPointer">欢迎您：${member.name}</a>
								<a style="font-size: 14px; color: #0F308A;" id="logout" class="hasPointer">退出</a>
							</span>
							<!-- <div class="search-section" style="display: inline-block;">
			    				<input class="search-text" style="width: 70%;border-radius: 20px; padding: 4px 30px 4px 10px;border: 1px solid #fff;color: #fff; background: none; " type="search" name="keyword" placeholder="搜索">
			    				<input type="submit" class="search-btn iconfont" value="" style="height: 30px;width: 24px;margin-top: -10px;margin-left: -37px;border-radius: 20px;background: transparent;border: none;outline: none;background: url(PC/image/fangdajing.png) center right no-repeat;">
							</div> -->
						</div>
					</div>
					<div class="span1"></div>
				</div>
		</div>
		<div class="container-fluid">
			<div class="row-fluid">
				<div class="span2"></div>
				<div class="span10">
					<ul class="nav">
						<li class="nav_index">
							<a href="PC/newIndex.jsp">首页</a>
						</li>
						<li class="nav_expert">
							<a href="PC/newExpertList.jsp">专家咨询</a>
						</li>
						<li class="nav_onlineClass">
							<a href="PC/newcrouseClass.jsp">直播课堂</a>
						</li>
						<li class="nav_videoClass">
							<a href="PC/newDbClass.jsp">在线点播</a>
						</li>
						<li class="nav_zx">
							<a href="PC/information_zx.jsp">新闻资讯</a>
						</li>
						<li class="nav_gr">
							<a>个人中心</a>
						</li>
						<li class="nav_aboutUs">
							<a href="PC/aboutUS.jsp">关于我们</a>
						</li>
					</ul>
				</div>
			</div>
		</div>
</div>
<div id="responsive1" class="modal hide fade" tabindex="-1" data-width="760">
	<div class="modal-header">
		<button type="button" class="close" data-dismiss="modal" aria-hidden="true"></button>
		<h3>友情提醒</h3>
	</div>
	<div class="modal-body">
		<div class="row-fluid">
			<div class="span12" id="modalcont1"></div>
		</div>
	</div>
	<div class="modal-footer">
		<button type="button" data-dismiss="modal" class="btn">取消</button>
		<button id="subBtn1" type="button" class="btn blue">确定</button>
	</div>
</div>