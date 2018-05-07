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
  							<div class="row-fluid" style="margin: 40px 0">	
  								<jsp:include page="leftSection.jsp"></jsp:include>
								<div class="ol_contentRight">
									<span class="index_modelTitle ol_ClassTitle borderTopRadius">直播课堂</span>
									<div class="ol_ClassContainer borderBotRadius"></div>
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
			</div>
			<!--导航下内容部分  end-->	
			<!-- 底部  begin-->
			<div class="copyRight"></div> 	
			<!-- 底部  end -->
		</div>
	</div>
	<div id="responsive" class="modal hide fade" tabindex="-1" data-width="760">
		<div class="modal-header">
			<button type="button" class="close" data-dismiss="modal" aria-hidden="true"></button>
			<h3>友情提醒</h3>
		</div>
		<div class="modal-body">
			<div class="row-fluid">
				<div class="span12" id="modalcont"></div>
			</div>
		</div>
		<div class="modal-footer">
			<button type="button" data-dismiss="modal" class="btn">取消</button>
			<button id="subBtn" type="button" class="btn blue">确定</button>
		</div>
	</div>
 	<!-- 内容主体  end -->
	<script src="PC/js/pageMedia.js"></script>
    <script type="text/javascript" src="PC/newIndexjs/newcrouseClass.js"></script>
	<script src="PC/newIndexjs/leftSection.js" type="text/javascript" charset="utf-8"></script>
	<script>
		var currentNav = $(".nav_onlineClass");
		addBorder(currentNav,"nav_barBorder");
	</script>
	</body>
</html>