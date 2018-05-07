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
  							<div class="row-fluid" style="margin: 4% 0px 10%; padding: 1% 0 10%;">
								<div class="control-group">
					                <div class="controls">
										<h3 class="expErweimaLog">扫描二维码，完成注册！</h3>
										<div class="expErweimaContain"><img id="qrCode" class="expErweimaImg" src="PC/image/zx_erweima.png" /></div>
					                </div>
					            </div>
  							</div>
						</div>
				</div>
			</div>
			<!--导航下内容部分  end-->
							

		</div>
	</div>
		<!-- 底部  begin-->
	<div class="copyRight"></div> 	
	<!-- 底部  end -->
			
	<script src="PC/js/pageMedia.js"></script>
	<script src="PC/js/xfServices.js" type="text/javascript"></script>
	<script src="PC/js/xfSoapClient.js" type="text/javascript"></script>
	<script src="PC/newIndexjs/newErweimaLog.js"></script>
	</body>
</html>