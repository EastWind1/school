<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<!DOCTYPE>
<html>
  <head>
	<title>我的微小说</title>  

	<jsp:include page="../common.jsp"></jsp:include>
	<link href="weixin/css/event.css" rel="stylesheet">
  </head>
  <body>
	  	<div id="zw_details" class="zw_details">
			<div class="zw_details_head">
				<img class="zw_details_headImg" />
			</div>
			<p class="zw_details_headName"></p>
			<p class="zw_details_headHospatial"></p>
			<div id="zw_details_contentContainer"></div>
			<div class="zw_details_succInfo">
				<p><i class="zw_details_succInfoArrow">></i>感谢您对“我的ICU”微小说大赛的关注！</p>
				<p><i class="zw_details_succInfoArrow">></i>您的作品如通过审核，将获得云ICU送出的心意礼包；如评为优秀作品将进入网络投票，更将有机会赢得云ICU准备的ThinkPad、iPhone6s、iPad等丰厚奖品。</p>
				<p><i class="zw_details_succInfoArrow">></i>更多精彩请留意云ICU服务号。</p>
			</div>
		</div>
	<script>
		$(function(){
			var addimg=$.Params.create();
		    addimg.addParams("memberId",memberId); 
	    	addimg.ajax(getIP()+"eventdocuments.action?list",function(data){
	    		var html="";
				if(data.success){
					var val = data.rows[0];
					$(".zw_details_headImg").attr("src","data/member/headImg/"+val.headImg);
					$(".zw_details_headName").html(val.name);
					$(".zw_details_headHospatial").html(val.hospitalName);
					$.each(data.rows,function(i,val){
						html+="<p class='zw_details_contentNum'>作品"+(i+1)+"</p><p class='zw_details_content'>"+val.content+"</p>";
					})	
					
					$("#zw_details_contentContainer").html(html);
				}
			});
		});
	</script>
	
  </body>
</html>
