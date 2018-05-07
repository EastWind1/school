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
  								<div class="row-fluid sysNoticePage" style="margin: 40px 0">		
  									<jsp:include page="leftSection.jsp"></jsp:include>
  									<div class="exp_contentRight">
			  							<span class="index_modelTitle index_gonggaoTitle  borderTopRadius">系统公告</span>
  										<div class="db_ClassContainer borderBotRadius  noPointer">
  										
  										</div>

  									    <div class="pagination" id="pagination">
						                    <div class="float_right padding5 paging">
						                        <div id="divFood" class="float_left padding_top4">
						                        <span float="left">每页<font id="rowscount">0</font>条/共<font id="allcount">0</font>条 第<font id="nowpage">0</font>页/共<font id="allpage">0</font>页</span>
						                        <span onclick="firstPage()" float="left" class="pagefl"><a>首页</a></span>
						                        <span onclick="prePage()" float="left" class="pagefl"><a>上一页</a></span>
						                        <span onclick="nextPage()" float="left" class="pagefl"><a>下一页</a></span>
						                        <span onclick="lastPage()" float="left" class="pagefl"><a>末页</a></span>
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
	<script src="PC/newIndexjs/leftSection.js" type="text/javascript" charset="utf-8"></script>
	<script type="text/javascript" src="PC/js/pageMedia.js"></script>
 	<!-- 内容主体  end -->
	<script>
		
 		 $(".tdval img").on("click",function(){
			if($(this).attr("type"))
			{ 
				type=$(this).attr("type");
				//alert(type);
			}
			if($(this).attr("sex"))
			{
	 		 	sex=$(this).attr("sex");
	 		 	//alert(sex);
			}
	 		 $(this).attr("src","image/sex1.png");
	 		 $(this).siblings().attr("src","image/sex0.png");
	 	})
	</script> 
	<script type="text/javascript">
		var id=GetQueryString("eid");
		var sysNotice=$.Params.create();
		
		sysNotice.addParams("page",0);
	   	sysNotice.addParams("rows",rows);
	 	//sysNotice.addParams("id",id);
		getPageData(sysNotice,getIP()+"sysNotice.action?list",function(data){
			var html="";
			$.each(data.rows,function(i,val){
				html+="<div class='nt_news noPointer'>"+
				        "<p class='control-label systemcon zx_detailsContent' name='content' id='content'>"+val.content+"</p>"+
				        "<p class='control-label systemcon zx_detailsTime'>"+val.createDate+"</p>"+
						"</div>";
			});
			$(".db_ClassContainer").html(html);
		});
	</script>
	
	</body>
</html>