<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<!DOCTYPE>
<html>
  <head>
	<title>专题列表</title>
	<meta charset="UTF-8"/>
	<meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1,maximum-scale=1,user-scalable=no" />
	<!--<link href="https://cdn.bootcss.com/ratchet/2.0.2/css/ratchet.min.css" rel="stylesheet">-->
	<link rel="stylesheet" type="text/css" href="../../common/css/ratchet.min.css"/>
	<style type="text/css">
		body,html{ font-size: 62.5%;}
				li{ list-style: none;}
		.table-view-cell{ border: none !important;}
		.nonemagin{ border: none !important;}
		.zt_title{ font-size: 1.6rem;}
		.card p{ font-size: 1.2rem;}
		
		.expertInfo{ position: relative;}
		.tw{
			position: absolute !important;
			right: 4%;
			top: 50%;
			padding: 1px 10px !important;
			font-size: 1.2rem;
			border-radius: 5px;
			background: deepskyblue;
			color: #fff !important;
		}
	</style>
  	</head>
  	<body>
	    <div class="content">
	    	<div class="card" style="overflow: hidden;margin:0px;border-radius:0px;">
					<img src="../../weixin/images/azj.jpg" style="margin-left:10px;display: block;height: 25px;">
				 <!-- <p style="text-align: center;color: #000;font-size: 2rem;font-weight: bold; margin-top: 10px;">艾镇静，爱未来——<span style="font-size: 1.4rem;">中美专家面对面</span></p>-->
				 <p style="text-align: center;color: #02375A;font-size: 1.5rem;font-weight: bold; font-style: italic;margin-top: 10px;">
						<i style="color: #f00;font-size: 3rem;">艾</i>镇静，
						<i style="color: #f00;font-size: 3rem;">爱</i>未来——中美专家面对面
					</p>

					<p style="text-align: left;color: #000;font-size: 1.3rem;margin-top: 10px;padding-left:10px;">
						会议主题：
					</p>
					<p style="text-align: left;color: #000;font-size: 1.3rem;padding-left:10px;">
					《2013年ICU成人患者疼痛、躁动、谵妄处理临床实践指南》
					</p>
					<p style="text-align: left;color: #000;font-size: 1.3rem;padding-left:10px;">
						1、ICU的镇静是否必须？
					</p>
					<p style="text-align: left;color: #000;font-size: 1.3rem;padding-left:10px;">
						2、ICU镇静该如何开展及镇静方案大讨论
					</p>
					<p style="text-align: left;color: #000;font-size: 1.3rem;padding-left:10px;">提问有礼，期待您的问题。</p>
				</div>
	    	<div class="card" style="height: 35px; line-height: 35px; background: deepskyblue;">
	    		<p style="font-size: 1.5rem; text-align: center; color: #fff;">9月16日 15:00-15:25 面对面专题讨论 </p> 
	    	</div>
			<div class="card nonemagin">
				<ul id="expertList" class="table-view checkExpert_content_ul">
					<li class="table-view-cell media">
						<h3 class="zt_title" id="zt_71">Sedation in the ICU</h3>
	    				<div class="media-body expertInfo">
	    					<p>讲者：Pro.John P. Kress教授</p>
	    					<p>9月16日 14:10-15:00</p>
	    				</div>
	    				<a class="tw">提问</a>
					</li>
					<li class="table-view-cell media">
						<h3 class="zt_title" id="zt_69">ICU的镇静是否必须？</h3>
	    				<div class="media-body expertInfo">
	    					<p>主持：李培军教授、王春亭教授</p>
	    					<p>9月16日 15:00-15:25</p>
	    				</div>
	    				<a class="tw">提问</a>
					</li>
					
					<li class="table-view-cell media" style="height: 35px;line-height: 35px; background: deepskyblue; padding: 0!important;">
		    		<p style="font-size: 1.5rem; text-align: center; color: #fff;">9月16日 16:25-17:00 面对面专题讨论 </p>
					</li>
					<li class="table-view-cell media">
						<h3 class="zt_title" id="zt_72">右美托咪定在ICU镇静的临床特点及病例分享</h3>
	    				<div class="media-body expertInfo">
	    					<p>讲者：李双玲教授</p>
	    					<p>9月16日 16:25-17:00</p>
	    				</div>
	    				<a class="tw">提问</a>
					</li>
					<li class="table-view-cell media">
						<h3 class="zt_title" id="zt_70">ICU的镇静该如何开展？</h3>
	    				<div class="media-body expertInfo">
	    					<p>主持：李培军教授、王春亭教授</p>
	    					<p>9月16日 16:25-17:00</p>
	    				</div>
	    				<a class="tw">提问</a>
					</li>
	     		</ul>
	      	</div>
	    </div>
	    <!--<script src="http://libs.baidu.com/jquery/1.11.1/jquery.min.js" type="text/javascript" charset="utf-8"></script>-->
	    <script src="../../common/jquery-1.9.1.min.js" type="text/javascript" charset="utf-8"></script>
    	<script type="text/javascript">
			function GetQueryString(name)
			{
			    var reg = new RegExp("(^|&)"+ name +"=([^&]*)(&|$)");
			    var r = window.location.search.substr(1).match(reg);
			    if (r!=null) {
			    	return unescape(r[2]);
			    }else{
			    	return null;
			    }
			}
    		var openId=GetQueryString("openId");
			$(".tw").on("click",function () {
				var $this=$(this);
				var ztTile_id=$(this).parent().find('.zt_title').attr("id");
    			window.location.href="ask.jsp?eid="+ztTile_id+"&openId="+openId;
			})
    	</script>
	</body>
</html>