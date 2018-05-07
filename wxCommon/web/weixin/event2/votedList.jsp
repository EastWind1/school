<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<!DOCTYPE>
<html>
  <head>
	<title>票数列表</title>  
    <meta name="viewport" content="initial-scale=1, maximum-scale=1, user-scalable=no, minimal-ui">

    <!-- Makes your prototype chrome-less once bookmarked to your phone's home screen -->
    <meta name="apple-mobile-web-app-capable" content="yes">
    <meta name="apple-mobile-web-app-status-bar-style" content="black">
	<jsp:include page="../common.jsp"></jsp:include>
	<link href="weixin/css/event.css" rel="stylesheet">
  </head>
  <body>
  	<div class="content">
	  	<ul id="tp_list" class="tp_list"></ul>
	</div>
	<script>
		$(function(){
			var addimg=$.Params.create();
		    addimg.addParams("state",3); 
	    	addimg.ajax(getIP()+"eventdocuments.action?list",function(data){
				var html="";
				var rankNum="";
				$.each(data.rows,function(i,val){
					if((i+1)>9){
						rankNum = "No.0"+(i+1);
					}else{
						rankNum = "No.00"+(i+1);
					}
					html+="<li eventId='"+val.id+"' class='tp_option'><div class='tp_option_head'><img src='data/member/headImg/"+val.headImg+"' alt='加载失败'/>"+
						  "<div class='tp_option_head_author'><span class='tp_option_head_authorName'>"+val.name+"</span>"+
						  "<span class='tp_option_rankNum'>"+rankNum+"</span><p class='tp_option_hospitalName'>"+val.hospitalName+"</p>"+
					      "</div></div><p class='tp_option_content'>"+val.content+"</p><a class='vtList_ticketNum'><i>"+val.count+"</i>票</a></li>";
				});	
				$("#tp_list").html(html);
			});
		});
	</script>
  </body>
</html>
