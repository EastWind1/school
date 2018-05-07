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
	    	<div class="card" style="height: 35px; line-height: 35px; background: deepskyblue;">
	    		<p style="font-size: 1.5rem; text-align: center; color: #fff;">9月13日 08:50-09:00 面对面专题讨论 </p> 
	    	</div>
			<div class="card nonemagin">
				<ul id="expertList" class="table-view checkExpert_content_ul">
					<li class="table-view-cell media">
						<h3 class="zt_title" id="zt_59">EGDT，何去何从？</h3>
	    				<div class="media-body expertInfo">
	    					<p>讲者：李建国（武 汉）</p>
	    					<p>9月13日 08:00-08:25</p>
	    				</div>
	    				<a class="tw">提问</a>
					</li>
					<li class="table-view-cell media">
						<h3 class="zt_title" id="zt_60">免疫球蛋白与脓毒症</h3>
	    				<div class="media-body expertInfo">
	    					<p>讲者：周丽华（呼和浩特）</p>
	    					<p>9月13日 08:25-08:50</p>
	    				</div>
	    				<a class="tw">提问</a>
					</li>
					<li class="table-view-cell media" style="height: 35px;line-height: 35px; background: deepskyblue; padding: 0!important;">
		    		<p style="font-size: 1.5rem; text-align: center; color: #fff;">9月13日 10:10-10:20 面对面专题讨论 </p>
					</li>
					<li class="table-view-cell media">
						<h3 class="zt_title" id="zt_61">POCT专题会（PBL病例）</h3>
	    				<div class="media-body expertInfo">
	    					<p>讲者：欧阳彬（广州）、吴铁军、陈晓梅（济 南）、郭志军（济 南）、丁敏(护士长)</p>
	    					<p>9月13日 9:00-10:00</p>
	    				</div>
	    				<a class="tw">提问</a>
					</li>
					<li class="table-view-cell media">
						<h3 class="zt_title" id="zt_66">From CT to POCT</h3>
	    				<div class="media-body expertInfo">
	    					<p>讲者：欧阳彬（广州）</p>
	    					<p>9月13日 10:00-10:10</p>
	    				</div>
	    				<a class="tw">提问</a>
					</li>
					<li class="table-view-cell media" style="height: 35px;line-height: 35px; background: deepskyblue; padding: 0!important;">
		    		<p style="font-size: 1.5rem; text-align: center; color: #fff;">9月13日 10:55-11:00 面对面专题讨论 </p>
					</li>
					<li class="table-view-cell media">
						<h3 class="zt_title" id="zt_67">〈中华危重病急救医学杂志〉关于论文设计和投稿的要求</h3>
	    				<div class="media-body expertInfo">
	    					<p>讲者：李银平（天津）</p>
	    					<p>9月13日 10:30-10:55</p>
	    				</div>
	    				<a class="tw">提问</a>
					</li>
					<li class="table-view-cell media" style="height: 35px;line-height: 35px; background: deepskyblue; padding: 0!important;">
		    		<p style="font-size: 1.5rem; text-align: center; color: #fff;">9月13日 12:10-12:20 面对面专题讨论 </p>
					</li>
					<li class="table-view-cell media">
						<h3 class="zt_title" id="zt_68">院感控专题会（PBL病例）</h3>
	    				<div class="media-body expertInfo">
	    					<p>讲者：许强宏（杭州）、周  敏、杨丽娟、张淑香、李  琛</p>
	    					<p>9月13日 11:10-12:10</p>
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