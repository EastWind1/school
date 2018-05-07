<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<!DOCTYPE>
<html>
  <head>
	<title>公告</title>
	<jsp:include page="../common.jsp"></jsp:include>
  </head>
  
  <body>
    <div class="content hy_sys_notice">
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
 	<script>
 	getData();
	function getData(){
		var p=$.Params.create();
		p.addParams("publicNo",brandId); 
		if(userType == "1"){
			p.addParams("state","1"); 
		}else{
			p.addParams("state","2"); 
		}
		
	    p.ajax(getIP()+"sysNotice.action?list",function(data){
	    	var html="";
	    	$.each(data.rows,function(i,val){					
	    		html+="<div class='card zxobj'><ul class='table-view zxul'><li class='table-view-cell'>"+
	 			"<p class='zxcon'>"+val.content+"</p><span>"+val.createDate+"</span></li></ul></div>";		
	    		
	    		$(".hy_sys_notice").html(html);
	    	})
	    })
	}
 	</script>
  </body>
</html>
