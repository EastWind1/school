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
						<div class="content_one">
							<div class="container conTen" style="margin: 40px auto;">
								<div class="row-fluid">
									<span class="index_modelTitle zx_infomationTitle borderTopRadius">内容详情</span>
									<div class="zx_container borderBotRadius"></div>
								</div>
							</div>
						</div>
						<!--导航下内容部分  end-->
					</div>
				</div>
			</div>
			<!-- 底部  begin-->
			<div class="copyRight"></div> 	
			<!-- 底部  end -->
		</div>
	</div>
	<script type="text/javascript">
	var p=$.Params.create();
	$(function(){
		var eid=GetQueryString("eid");
		addInformation(eid);
		p=$.Params.create();
	    getData();
	    function getData(){
			p.addParams("pkid",eid); 
			if(openId != ""){
				p.addParams("memberId",memberId);
				
			}
			
		   	p.ajax(getIP()+"information.action?getById",function(data){
				var val=data.rows[0];
				var html='';
				html="<h3 class='information_zxDetailsTitle'>"+val.informationTitle+"</h3><p>"+val.informationDescription+"</p>";
		   		$(".zx_container").html(html);
		   	});
		};
	
	});
	</script>
	</body>
</html>