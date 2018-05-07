<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<!DOCTYPE>
<html>
  <head>
	<title>资讯</title>
	<jsp:include page="../common.jsp"></jsp:include>
  </head>
  
  <body>
    <div class="content hy_information">
		<!--<div class="card zxxobj">
 			<ul class="table-view">
 				<li class="table-view-cell table-view-divider">中医药与养老服务结合试点延伸提供中医药健康养老服务</li>
 				<li class="table-view-cell">
 					5月7日，国务院办公厅发布了关于印发中医药健康服务发展规划(2015~2020年)的通知。记者获悉，此次发布的上述规划对我国中医药健康服务发展进行全...<label>阅读全文</label>
 				</li>
 				<li class="table-view-cell table-view-divider">中医药健康服务发展规划出台 借一带一路提升国际影响力</li>
 				<li class="table-view-cell">
 					中医药也叫汉族医药，它是中华民族的宝贵财富，为中华民族的繁衍昌盛做出了巨大贡献。相关数据显示，中医药市场规模巨大，2012年，我国仅中成药制...<label>阅读全文</label>
 				</li>
 				
 			</ul>
 		</div>-->
 	</div>
 		<script>
 	getData();
	function getData(){
		var p=$.Params.create();
		p.addParams("brandId",brandId); 
		p.addParams("type","1");
	    p.ajax(getIP()+"information.action?list",function(data){
	    	var html="";
	    	$.each(data.rows,function(i,val){	
	    		var con=val.informationDescription.substr(0,98);
	    		html+="<div class='card zxobj'><ul class='table-view zxul'><li class='table-view-cell'>"+
	 			"<span>"+val.informationTitle+"</span><p class='xq_head'>"+val.createTime+"</p><p class='zxcon xq_content'>"+con+
	 			"...</p><a href='javascript:void(0)' onclick='getExpert(\""+val.pkid+"\")' class='readMore'>阅读更多</a></li></ul></div>";	
 				      
 				
	    	})
    		$(".hy_information").html(html);
	    })
	}
	
	function getExpert(eid){
		window.location.href="weixin/zx/informationDetails.jsp?eid="+eid;
	}
 	</script>
  </body>
</html>
