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
  									<jsp:include page="leftSection.jsp"></jsp:include>
									<div class="zx_contentRight" id="zjzx">
										<span class="index_modelTitle zx_infomationTitle borderTopRadius">新闻资讯</span>
										<div class="zx_container borderBotRadius"></div>
									</div>
									<div class="pagination" id="pagination">
										<div class="float_right padding5 paging">
											<div id="divFood" class="float_left padding_top4">
												<span float="left">每页<font id="rowscount">0</font>条/共<font id="allcount">0</font>条 第<font id="nowpage">0</font>页/共<font id="allpage">0</font>页</span>
												<span onclick="firstPage()" float="left" class="pagefl hasPointer"><a>首页</a></span>
												<span onclick="prePage()" float="left" class="pagefl hasPointer"><a>上一页</a></span>
												<span onclick="nextPage()" float="left" class="pagefl hasPointer"><a>下一页</a></span>
												<span onclick="lastPage()" float="left" class="pagefl hasPointer"><a>末页</a></span>
												<span display="" float="left" class="pagefl">跳转到第 
													<select onchange="jumpPage(this)">
														<option selected="selected" value="0">1</option>
													</select> 页
												</span>
											</div>
										</div>
										<div class="clear"></div>
									</div>
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
	<script type="text/javascript" src="PC/newIndexjs/information_zx.js"></script> 
	<script type="text/javascript" src="PC/js/pageMedia.js"></script>
	<script src="PC/newIndexjs/leftSection.js" type="text/javascript" charset="utf-8"></script>
	<script>
		var currentNav = $(".nav_zx");
		addBorder(currentNav,"nav_barBorder");
	</script>
	</body>
</html>