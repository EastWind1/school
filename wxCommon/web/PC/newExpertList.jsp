<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>  
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0, minimum-scale=1.0, maximum-scale=1.0"><link rel="stylesheet" type="text/css" href="css/pc.css"/>
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
  							<div class="row-fluid" style="margin: 40px 0">
  								<jsp:include page="leftSection.jsp"></jsp:include>
								<div class="exp_contentRight">
									<!--<div class="exp_expContent">暂无数据</div>-->
									<div class="exp_expertContent">
										<span class="index_modelTitle exp_expertContentTitle borderTopRadius">专家咨询</span>
										<div class="expSearchBar">
										<span id="exp_cityChange" class="fenlei_title hasPointer" style="color:#0D638F">按省市查找  &gt;</span>
										<span id="fenlei_change" class="fenlei_title"></span>
										  	<input type="text" class="expSearchInput" id="expSearchInput" placeholder="请输入专家姓名">
										    <a class="expSearchBtn" id="expSearchBtn">搜索</a>
										    <ul class="fenlei_list">
											<li>
												<a>全部</a>
												<a>国外</a>
												<a>安徽</a>
												<a>北京</a>
												<a>重庆</a>
												<a>福建</a>
												<a>甘肃</a>
												<a>广东</a>
												<a>广西</a>
												<a>贵州</a>
												<a>海南</a>
												<a>河北</a>
												<a>河南</a>
												<a>黑龙江</a>
												<a>湖北</a>
												<a>湖南</a>
												<a>江苏</a>
												<a>江西</a>
												<a>吉林</a>
												<a>辽宁</a>
												<a>内蒙</a>
												<a>宁夏</a>
												<a>青海</a>
												<a>山东</a>
												<a>山西</a>
												<a>陕西</a>
												<a>上海</a>
												<a>四川</a>
												<a>天津</a>
												<a>西藏</a>
												<a>新疆</a>
												<a>云南</a>
												<a>浙江</a>
											</li>
										</ul>
										  </div>
										<div class="exp_expertList borderBotRadius"></div>
									</div>
								</div>
  								<div class="pagination" id="pagination">
				                    <div class="float_right padding5 paging">
				                        <div id="divFood" class="float_left padding_top4">
				                        <span float="left">每页<font id="rowscount">0</font>条/共<font id="allcount">0</font>条 第<font id="nowpage">0</font>页/共<font id="allpage">0</font>页</span>
				                        <span onclick="firstPage()" float="left" class="pagefl hasPointer"><a>首页</a></span>
				                        <span onclick="prePage()" float="left" class="pagefl hasPointer"><a>上一页</a></span>
				                        <span onclick="nextPage()" float="left" class="pagefl hasPointer"><a>下一页</a></span>
				                        <span onclick="lastPage()" float="left" class="pagefl hasPointer"><a>末页</a></span>
				                       <!--  <span display="" float="left" class="pagefl" style="margin-right:10px;">跳转到第 <input style="width:20px;height:15px;margin-top:6px;" type="text" /> 页</span> -->
				                       <span display="" float="left" class="pagefl">跳转到第 
				                       		<select onchange="jumpPage(this)">
				                       			<option selected="selected" value="0">1</option>
				                       		</select> 页</span>
				                       
				                        </div>
				                    </div>
						        	<div class="clear"></div>
	           					</div>
							</div>
  						</div>
					</div>
				</div>
			</div>
			<!--导航下内容部分  end-->
			<!-- 底部  begin-->
			<div class="copyRight"></div> 	
			<!-- 底部  end -->
		</div>
	</div>
 	<!-- 内容主体  end -->
	<script src="PC/js/pageMedia.js"></script>
	<script src="PC/newIndexjs/leftSection.js" type="text/javascript" charset="utf-8"></script>
	<script src="PC/newIndexjs/newExpertList.js"></script>
	<script>
		var currentNav = $(".nav_expert");
		addBorder(currentNav,"nav_barBorder");
	</script>
	</body>
</html>