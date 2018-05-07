<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0, minimum-scale=1.0, maximum-scale=1.0">
	<title>云  ICU</title>
	<jsp:include page="media.jsp"></jsp:include>
</head>
<body class="page-header-fixed page-full-width">
		<!-- 顶部导航 begin-->
	<jsp:include page="head.jsp"></jsp:include>
	<!-- 顶部导航 end -->
	
 	<!-- 内容主体  begin-->
	<div class="page-container row-fluid">
		<div class="page-content no-min-height">
			<div class="container-fluid promo-page">
				<div class="row-fluid">
					<div class="span12">
						<!--导航下内容部分  begin-->
  							<div class="container">
  								<div class="row-fluid" style="margin: 45px 0" id="hy_sys_notice">
  								
									 <div style="text-align: center; ">
										<span class="dbClass_title" id="informationTitle"></span>
									</div> 
									<!-- <ul class="exp_expDetailsInfo"> -->
  										
  									<!-- <div class="container exp_expDetails">
  										<div class="exp_expDetailsImg">
  											<img src="PC/image/zhuanjia_headImg.png" alt=""/>
  										</div>
  										
  											<li>
  												<label for="">点播次数：</label>
  												<span class="dbClass_dbNum">100次</span>
  											</li>
  											<li>
  												<label for="">发布时间：</label>
  												<span class="dbClass_startDate"></span>
  											</li>
  											<li>
  												<label for="">科室：</label>
  												<span class="exp_expDetailsOffice">重症监护室</span>
  											</li>
  										</ul>
 										<div style="width: 40%; height: 200px; float: left; position: relative;">
											<a class='dbClass_shoucang'>收藏</a>
											<a class='dbClass_zan'>（<i class="dbClass_zanNum"></i>）</a>
  										</div>		
  									</div> -->
									<div class="container exp_summary" id="hy_sys_notice">
										<p  id="informationDescription" class="informationDescription" ></p>
									</div>
									<!--<a href="#" class="exp_expHelp">请求帮助</a>-->
  								</div>
  							</div>
					</div>
				</div>
			</div>
			<!--导航下内容部分  end-->
							
			<!-- 底部  begin-->
			<div class="block-footer" style="height: 140px; background-color: #1B4A9D;color: #fff;"></div>
			<!-- 底部  end -->
		</div>
	</div>
 	<!-- 内容主体  end -->
 	<script type="text/javascript">
 	$(function(){
		var eid=GetQueryString("eid");
		var p=$.Params.create();
		getData();
		function getData(){
				p.addParams("pkid",eid); 
				p.ajax(getIP()+"information.action?getById",function(data){
					var val=data.rows[0];
					$("#informationDescription").html(val.informationDescription);
					$("#informationTitle").html(val.informationTitle);
				})
			}
	});
 	</script>
	</body>
</html>