<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<!DOCTYPE>
<html>
  <head>
	<title>资讯详情</title>
	<jsp:include page="../common.jsp"></jsp:include>
	<script type="text/javascript" src="common/iscroll.js"></script>
  </head>
  <style>
  p img{width:100%;margin:5px;}
  </style>
  <body>
  
    <div class="content hy_sys_notice">
    <div id="wrapper">
		<div id="scroller">
		<!--<div class="card zxobj">
 			<ul class="table-view">
 				<li class="table-view-cell">
	 			<span>系统公告</span>
	 			<p>2015-05-08 04:08:05</p>
	 			<p class="zxcon">5月15日  下午3点《医疗管理》讲堂开课啦~
	 			 马上报名！</p>
 				</li>
 			</ul>
 		</div>-->
 	</div>
 	</div>
 	</div>
 	<script>
 	$(function(){
 		var p=$.Params.create();
		var eid=GetQueryString("eid");
		addInformation(eid);
		p.addParams("pkid",eid);  
	    p.ajax(getIP()+"information.action?getById",function(data){
	    	var html="";
	    	var val=data.rows[0];
	    	html="<div class='card zxobj'><ul class='table-view zxul'><li class='table-view-cell'>"+
	 			"<span>"+val.informationTitle+"</span><br /><span class='xq_head'>"+val.createTime+"</span><p class='zxcon xq_content'>"+val.informationDescription+
	 			"</p></li></ul></div>";		
	    		$(".hy_sys_notice").html(html);
	    })
	    
	    var myScroll;
	function loaded() {
		myScroll = new IScroll('wrapper',{checkDOMChanges: true });
	}
	document.addEventListener('DOMContentLoaded', loaded, false);
 	})
 	</script>
  </body>
</html>
