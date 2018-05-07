<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<!DOCTYPE>
<html>
  <head>
	<title>专题列表</title>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content=" initial-scale=1, maximum-scale=1, user-scalable=yes, minimal-ui">
<meta name="apple-mobile-web-app-capable" content="yes">
<meta name="apple-mobile-web-app-status-bar-style" content="black">
<meta name="format-detection" content="telephone=no">
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
			padding:10px 10px !important;
			font-size: 1.2rem;    
			border-radius: 5px;
			background: deepskyblue;
			color: #fff !important;
			float:right;
		}
		ul{padding:0px;}
		ul li{padding-right:10px !important}
		
		
		
	</style>
  	</head>
  	<body>
	    <div class="content">
	    	<div class="card" style="height: 35px; line-height: 35px; background: deepskyblue;">
	    		<p style="font-size: 1.5rem; text-align: center; color: #fff;">9月10日 15:30-15:40 面对面讨论专题</p>
	    	</div>
			<div class="card nonemagin">
				<ul id="expertList" class="table-view checkExpert_content_ul">
					<li class="table-view-cell media">
						<h3 class="zt_title">What’s the Current Status of EGDT？</h3>
	    				<div class="media-body expertInfo">
						<a class="tw" id="zt_1">提问</a>
	    					<p>讲者：于凯江（哈尔滨）</p>
	    					<p>9月10日 13:30-14:00</p>
	    				</div>
	    				
					</li>
					<li class="table-view-cell media">
						<h3 class="zt_title">重症医学未来发展的趋势</h3>
	    				<div class="media-body expertInfo">
						<a class="tw" id="zt_2">提问</a>
	    					<p>讲者：邱海波（南京）</p>
	    					<p>9月10日 14:00-14:30</p>
	    				</div>
	    				
					</li>
					<li class="table-view-cell media">
						<h3 class="zt_title">重症医学2014-2015</h3>
	    				<div class="media-body expertInfo">
						<a class="tw" id="zt_3">提问</a>
	    					<p>讲者：管向东（广州）</p>
	    					<p>9月10日 14:30-15:00</p>
	    				</div>
	    				
					</li>
					<li class="table-view-cell media">
						<h3 class="zt_title">重症血流动力学治疗的十件事</h3>
	    				<div class="media-body expertInfo">
						<a class="tw" id="zt_4">提问</a>
	    					<p>讲者：刘大为（北京）</p>
	    					<p>9月10日 15:00-15:30</p>
	    				</div>
	    				
					</li>
					<li class="table-view-cell media" style="height: 35px;line-height: 35px; background: deepskyblue; padding: 0!important;">
		    		<p style="font-size: 1.5rem; text-align: center; color: #fff;">9月10日 17:20-17:30 面对面讨论专题</p>
					</li>
					<li class="table-view-cell media">
						<h3 class="zt_title">ICU Telemedicine:从理论到实践</h3>
	    				<div class="media-body expertInfo">
						<a class="tw" id="zt_5">提问</a>
	    					<p>讲者：席修明（北京）</p>
	    					<p>9月10日 15:50-16:20</p>
	    				</div>
	    				
					</li>
					<li class="table-view-cell media">
						<h3 class="zt_title">我眼中重症医学的未来</h3>
	    				<div class="media-body expertInfo">
						<a class="tw" id="zt_6">提问</a>
	    					<p>讲者：杜斌（北京）</p>
	    					<p>9月10日 16:20-16:50</p>
	    				</div>
	    				
					</li>
					<li class="table-view-cell media">
						<h3 class="zt_title">未来ICU信息化发展—我的十个梦</h3>
	    				<div class="media-body expertInfo">
						<a class="tw" id="zt_7" >提问</a>
	    					<p>讲者：王春亭（济南）</p>
	    					<p>9月10日 16:50-17:20</p>
	    				</div>
	    				
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
				var ztTile_id=$(this).attr("id");
				
    			window.location.href="ask.jsp?eid="+ztTile_id+"&openId="+openId;
			})
			
    	</script>
	</body>
</html>