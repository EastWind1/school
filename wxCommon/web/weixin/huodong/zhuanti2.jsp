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
	    		<p style="font-size: 1.5rem; text-align: center; color: #fff;">9月11日 11:50-12:00 面对面讨论专题 </p>
	    	</div>
			<div class="card nonemagin">
				<ul id="expertList" class="table-view checkExpert_content_ul">
					<li class="table-view-cell media">
						<h3 class="zt_title" id="zt_8">What Will "iCritical Care" Look Like?</h3>
	    				<div class="media-body expertInfo">
	    					<p>讲者：John Kellum(U.S.A)</p>
	    					<p>9月11日 8:00-9:00</p>
	    				</div>
	    				<a class="tw">提问</a>
					</li>		
					<li class="table-view-cell media">
						<h3 class="zt_title" id="zt_9">Telemedicine in ICU（A）</h3>
	    				<div class="media-body expertInfo">
	    					<p>讲者：Cooney(U.S.A)</p>
	    					<p>9月11日 09:00-09:30</p>
	    				</div>
	    				<a class="tw">提问</a>
					</li>			
					<li class="table-view-cell media">
						<h3 class="zt_title" id="zt_10">Telemedicine in ICU（B）</h3>
	    				<div class="media-body expertInfo">
	    					<p>讲者：Julius Gene S Latorre(USA)）</p>
	    					<p>9月11日 09:30-10:00</p>
	    				</div>
	    				<a class="tw">提问</a>
					</li>			
					<li class="table-view-cell media">
						<h3 class="zt_title" id="zt_11">Sedation in the ICU</h3>
	    				<div class="media-body expertInfo">
	    					<p>讲者：John P. Kress (U.S.A)</p>
	    					<p>9月11日 10:10-11:10</p>
	    				</div>
	    				<a class="tw">提问</a>
					</li>			
					<li class="table-view-cell media">
						<h3 class="zt_title" id="zt_12">机械通气专题会（PBL病例）</h3>
	    				<div class="media-body expertInfo">
	    					<p>讲者：章志丹（沈 阳）、孙文青（济 南）、王海波（潍 坊）</p>
	    					<p>9月11日 11:10-12:00</p>
	    				</div>
	    				<a class="tw">提问</a>
					</li>	
					<li class="table-view-cell media" style="height: 35px;line-height: 35px; background: deepskyblue; padding: 0!important;">
		    		<p style="font-size: 1.5rem; text-align: center; color: #fff;">9月11日 12:25-12:30 面对面讨论专题 </p>
					</li>
					<li class="table-view-cell media">
						<h3 class="zt_title" id="zt_16">ICU内POCT的质量控制</h3>
	    				<div class="media-body expertInfo">
	    					<p>讲者：李元忠（大 连）</p>
	    					<p>9月11日 12:00-12:25</p>
	    				</div>
	    				<a class="tw">提问</a>
					</li>
					<li class="table-view-cell media" style="height: 35px;line-height: 35px; background: deepskyblue; padding: 0!important;">
		    		<p style="font-size: 1.5rem; text-align: center; color: #fff;">9月11日 13:25-13:30 面对面讨论专题 </p>
					</li>
					<li class="table-view-cell media">
						<h3 class="zt_title" id="zt_17">肌松剂在重症患者的应用</h3>
	    				<div class="media-body expertInfo">
	    					<p>讲者：黄青青（昆 明）</p>
	    					<p>9月11日 13:00-13:25</p>
	    				</div>
	    				<a class="tw">提问</a>
					</li>
					<li class="table-view-cell media" style="height: 35px;line-height: 35px; background: deepskyblue; padding: 0!important;">
		    		<p style="font-size: 1.5rem; text-align: center; color: #fff;">9月11日 13:55-14:00 面对面讨论专题 </p>
					</li>
					<li class="table-view-cell media">
						<h3 class="zt_title" id="zt_18">肝素治疗脓毒症的理论与实践</h3>
	    				<div class="media-body expertInfo">
	    					<p>讲者：马晓春（沈 阳）</p>
	    					<p>9月11日 13:30-13:55</p>
	    				</div>
	    				<a class="tw">提问</a>
					</li>
					<li class="table-view-cell media" style="height: 35px;line-height: 35px; background: deepskyblue; padding: 0!important;">
		    		<p style="font-size: 1.5rem; text-align: center; color: #fff;">9月11日 15:10-15:20 面对面讨论专题 </p>
					</li>
					<li class="table-view-cell media">
						<h3 class="zt_title" id="zt_19">血流动力学专题会（PBL病历）</h3>
	    				<div class="media-body expertInfo">
	    					<p>讲者：隆  云（北 京）、田昭涛（济 南）、孙甲君（聊 城）、杜  明（德 州）、王春亭（济南）、胡晓波（USA）等</p>
	    					<p>9月11日 14:00-15:20</p>
	    				</div>
	    				<a class="tw">提问</a>
					</li>
					<li class="table-view-cell media" style="height: 35px;line-height: 35px; background: deepskyblue; padding: 0!important;">
		    		<p style="font-size: 1.5rem; text-align: center; color: #fff;">9月11日 15:45-15:50 面对面讨论专题 </p>
					</li>
					<li class="table-view-cell media">
						<h3 class="zt_title" id="zt_25">ARDS患者液体管理策略</h3>
	    				<div class="media-body expertInfo">
	    					<p>讲者：胡振杰（石家庄）</p>
	    					<p>9月11日 15:20-15:45</p>
	    				</div>
	    				<a class="tw">提问</a>
					</li>
					<li class="table-view-cell media" style="height: 35px;line-height: 35px; background: deepskyblue; padding: 0!important;">
		    		<p style="font-size: 1.5rem; text-align: center; color: #fff;">9月11日 16:15-16:20 面对面讨论专题 </p>
					</li>
					<li class="table-view-cell media">
						<h3 class="zt_title" id="zt_26">重症病人营养支持：多少能量合适？</h3>
	    				<div class="media-body expertInfo">
	    					<p>讲者：赵鹤龄（石家庄）</p>
	    					<p>9月11日 15:50-16:15</p>
	    				</div>
	    				<a class="tw">提问</a>
					</li>
					<li class="table-view-cell media" style="height: 35px;line-height: 35px; background: deepskyblue; padding: 0!important;">
		    		<p style="font-size: 1.5rem; text-align: center; color: #fff;">9月11日 16:55-17:00 面对面讨论专题 </p>
					</li>
					<li class="table-view-cell media">
						<h3 class="zt_title" id="zt_27">脓毒症与CRRT</h3>
	    				<div class="media-body expertInfo">
	    					<p>讲者：宋  青（北 京）</p>
	    					<p>9月11日 16:30-16:55</p>
	    				</div>
	    				<a class="tw">提问</a>
					</li>
					<li class="table-view-cell media" style="height: 35px;line-height: 35px; background: deepskyblue; padding: 0!important;">
		    		<p style="font-size: 1.5rem; text-align: center; color: #fff;">9月11日 17:25-17:30 面对面讨论专题 </p>
					</li>
					<li class="table-view-cell media">
						<h3 class="zt_title" id="zt_28">ICU重症XDR感染，何为恰当抗菌药物治疗？</h3>
	    				<div class="media-body expertInfo">
	    					<p>讲者：吴大玮（济 南）</p>
	    					<p>9月11日 17:00-17:25</p>
	    				</div>
	    				<a class="tw">提问</a>
					</li>
					<li class="table-view-cell media" style="height: 35px;line-height: 35px; background: deepskyblue; padding: 0!important;">
		    		<p style="font-size: 1.5rem; text-align: center; color: #fff;">9月11日 18:30-18:40 面对面讨论专题 </p>
					</li>
					<li class="table-view-cell media">
						<h3 class="zt_title" id="zt_29">CRRT 专题会（PBL病例）</h3>
	    				<div class="media-body expertInfo">
	    					<p>讲者：周飞虎（北 京）、周永勤（枣 庄）、刘鲁沂（烟 台）、李  云（济 南）</p>
	    					<p>9月11日 17:30-18:40</p>
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
				var ztTile_id=$(this).parent().find('.zt_title').attr("id");
				
    			window.location.href="ask.jsp?eid="+ztTile_id+"&openId="+openId;
			})
			
    	</script>
	</body>
</html>