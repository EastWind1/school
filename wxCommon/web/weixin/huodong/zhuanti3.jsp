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
	    		<p style="font-size: 1.5rem; text-align: center; color: #fff;">9月12日 9:25-9:30 面对面讨论专题</p>
	    	</div>
			<div class="card nonemagin">
				<ul id="expertList" class="table-view checkExpert_content_ul">
					<li class="table-view-cell media">
						<h3 class="zt_title" id="zt_34">Sepsis: state of the Art 2015</h3>
	    				<div class="media-body expertInfo">
	    					<p>讲者：Craig Cooper simis(U.S.A)</p>
	    					<p>9月12日 8:00-9:00</p>
	    				</div>
	    				<a class="tw">提问</a>
					</li>
					<li class="table-view-cell media">
						<h3 class="zt_title" id="zt_35">Meta分析在急危重症领域的应用</h3>
	    				<div class="media-body expertInfo">
	    					<p>讲者：马岳峰（杭州）</p>
	    					<p>9月12日 9:00-9:25</p>
	    				</div>
	    				<a class="tw">提问</a>
					</li>
					<li class="table-view-cell media" style="height: 35px;line-height: 35px; background: deepskyblue; padding: 0!important;">
		    		<p style="font-size: 1.5rem; text-align: center; color: #fff;">9月12日 10:20-10:30 面对面专题讨论 </p>
					</li>
					<li class="table-view-cell media">
						<h3 class="zt_title" id="zt_36">重症超声专题会</h3>
	    				<div class="media-body expertInfo">
	    					<p>讲者：王春亭（济南）、吴铁军、王玉萍（护士长）、李生德、王  鹏</p>
	    					<p>9月12日 9:30-10:30</p>
	    				</div>
	    				<a class="tw">提问</a>
					</li>
					<li class="table-view-cell media" style="height: 35px;line-height: 35px; background: deepskyblue; padding: 0!important;">
		    		<p style="font-size: 1.5rem; text-align: center; color: #fff;">9月12日 11:30-11:40 面对面专题讨论 </p>
					</li>
					<li class="table-view-cell media">
						<h3 class="zt_title" id="zt_41">ICU常见易发感染的疾病及其诊疗思路</h3>
	    				<div class="media-body expertInfo">
	    					<p>讲者：曲  彦（青 岛）</p>
	    					<p>9月12日 10:40-11:05 </p>
	    				</div>
	    				<a class="tw">提问</a>
					</li>
					<li class="table-view-cell media">
						<h3 class="zt_title" id="zt_42">侵袭性念珠菌感染及指南变迁</h3>
	    				<div class="media-body expertInfo">
	    					<p>讲者：邢金燕</p>
	    					<p>9月12日 11:05-11:30</p>
	    				</div>
	    				<a class="tw">提问</a>
					</li>
					<li class="table-view-cell media" style="height: 35px;line-height: 35px; background: deepskyblue; padding: 0!important;">
		    		<p style="font-size: 1.5rem; text-align: center; color: #fff;">9月12日 12:50-13:00 面对面专题讨论 </p>
					</li>
					<li class="table-view-cell media">
						<h3 class="zt_title" id="zt_43">从一个重症肺炎病人说起</h3>
	    				<div class="media-body expertInfo">
	    					<p>讲者：刘  玲（南京）</p>
	    					<p>9月12日 11:40-11:50</p>
	    				</div>
	    				<a class="tw">提问</a>
					</li>
					<li class="table-view-cell media">
						<h3 class="zt_title" id="zt_44">聚焦肺部 关注曲霉</h3>
	    				<div class="media-body expertInfo">
	    					<p>讲者：陈德昌（上海）</p>
	    					<p>9月12日 11:50-12:15</p>
	    				</div>
	    				<a class="tw">提问</a>
					</li>
					<li class="table-view-cell media">
						<h3 class="zt_title" id="zt_45">MRSA治疗—新证据告诉我们什么？</h3>
	    				<div class="media-body expertInfo">
	    					<p>讲者：李连弟（青 岛）</p>
	    					<p>9月12日 12:15-12:40</p>
	    				</div>
	    				<a href="#" class="tw">提问</a>
					</li>
					<li class="table-view-cell media" style="height: 35px;line-height: 35px; background: deepskyblue; padding: 0!important;">
		    		<p style="font-size: 1.5rem; text-align: center; color: #fff;">9月12日 15:45-15:55 面对面专题讨论 </p>
					</li>
					<li class="table-view-cell media">
						<h3 class="zt_title" id="zt_46">ICU的信息化如何做？</h3>
	    				<div class="media-body expertInfo">
	    					<p>讲者：李  昂（北 京）</p>
	    					<p>9月12日 13:30-13:55</p>
	    				</div>
	    				<a class="tw">提问</a>
					</li>
					<li class="table-view-cell media">
						<h3 class="zt_title" id="zt_47">ICU质控中的信息化管理</h3>
	    				<div class="media-body expertInfo">
	    					<p>讲者：康  焰（成 都）</p>
	    					<p>9月12日 13:55-14:20</p>
	    				</div>
	    				<a class="tw">提问</a>
					</li>
					<li class="table-view-cell media">
						<h3 class="zt_title" id="zt_48">ICU查房流程的智能化</h3>
	    				<div class="media-body expertInfo">
	    					<p>讲者：彭志勇（武汉）</p>
	    					<p>9月12日 14:20-14:45</p>
	    				</div>
	    				<a class="tw">提问</a>
					</li>
					<li class="table-view-cell media">
						<h3 class="zt_title" id="zt_49">Telemedicine in the Cardiac Intensive Care Unit</h3>
	    				<div class="media-body expertInfo">
	    					<p>讲者：Alejandro J.López(U.S.A)</p>
	    					<p>9月12日 14:45-15:35</p>
	    				</div>
	    				<a class="tw">提问</a>
					</li>
					<li class="table-view-cell media">
						<h3 class="zt_title" id="zt_50">重症远程会诊</h3>
	    				<div class="media-body expertInfo">
	    					<p>讲者：王春亭（济 南）</p>
	    					<p>9月12日 15:35-15:45</p>
	    				</div>
	    				<a class="tw">提问</a>
					</li>
					<li class="table-view-cell media" style="height: 35px;line-height: 35px; background: deepskyblue; padding: 0!important;">
		    		<p style="font-size: 1.5rem; text-align: center; color: #fff;">9月12日 17:25-17:35 面对面专题讨论 </p>
					</li>
					<li class="table-view-cell media">
						<h3 class="zt_title" id="zt_51">ARDS 专题会（PBL病例）</h3>
	    				<div class="media-body expertInfo">
	    					<p>讲者：杨  毅（南 京）、杨海卫（济 宁）、王世富（淄 博）、王晓芝（滨 州）、王春亭（济南）</p>
	    					<p>9月12日 16:05-17:35</p>
	    				</div>
	    				<a class="tw">提问</a>
					</li>
					<li class="table-view-cell media">
						<h3 class="zt_title" id="zt_56">远程ARDS动物试验</h3>
	    				<div class="media-body expertInfo">
	    					<p>讲者：王春亭、王鹏、刘春利、郭鹏等</p>
	    					<p>9月12日 16:55-17:25</p>
	    				</div>
	    				<a class="tw">提问</a>
					</li>
					<li class="table-view-cell media" style="height: 35px;line-height: 35px; background: deepskyblue; padding: 0!important;">
		    		<p style="font-size: 1.5rem; text-align: center; color: #fff;">9月12日 18:25-18:35 面对面专题讨论 </p>
					</li>
					<li class="table-view-cell media">
						<h3 class="zt_title" id="zt_57">重症营养治疗—提高质量管理</h3>
	    				<div class="media-body expertInfo">
	    					<p>讲者：许  媛（北 京）</p>
	    					<p>9月12日 17:35-18:00</p>
	    				</div>
	    				<a class="tw">提问</a>
					</li>
					<li class="table-view-cell media">
						<h3 class="zt_title" id="zt_58">重症患者营养支持的热点与认识</h3>
	    				<div class="media-body expertInfo">
	    					<p>讲者：解  建（济 南）</p>
	    					<p>9月12日 18:00-18:25</p>
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