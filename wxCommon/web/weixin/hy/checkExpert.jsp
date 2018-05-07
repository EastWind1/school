<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<!DOCTYPE>
<html>
  <head>
	<title>专家简介</title>
	<jsp:include page="../common.jsp"></jsp:include>
	<style>
		.cityListInfo{
			width: 100%; 
			height: 88%;
			padding-left: 0; 
			margin: 0;
		}
		.cityListInfo li{
			list-style: none;
		    width: 25%;
		    height: 100%;
		    margin-top: 0;
		    text-align:center;
		    display: block;
		    float:left;
		}
		.cityListInfo li a{
			width:100%;
			margin:8px 0;
		}
	</style>
  </head>
  
  <body>
   <div class="bar bar-standard bar-header-secondary checkExpert_search">
   		<a id="expertProvince" style="display: inline-block; padding: 5% 0;">省市查找 ></a>
	     <ul class="table-view" style="width: 60%;float: right;">
  			<li class="table-view-cell"><input id="expertName" placeholder="请输入专家姓名"  />  <img id="search" src="weixin/images/ss.png" style='height:34px;'></li>
  		 </ul>
	</div>
	<div id="citydigle" class="digle" style="height:100%;padding-left:0;background:transparent;">
 		<div id="exp_cityList" style="width:100%;height:70%;background-color: #fff;">
 			<div onclick="getProvice(0)" style="padding: 5% 0 3% 8%;">全部</div>
 			<ul class="cityListInfo">
 				<li>
					 <a onclick="getProvice(&quot;国外&quot;)">国外</a>
					 <a onclick="getProvice(&quot;安徽&quot;)">安徽</a>
					 <a onclick="getProvice(&quot;北京&quot;)">北京</a>
					 <a onclick="getProvice(&quot;重庆&quot;)">重庆</a>
					 <a onclick="getProvice(&quot;福建&quot;)">福建</a>
					 <a onclick="getProvice(&quot;甘肃&quot;)">甘肃</a>
					 <a onclick="getProvice(&quot;广东&quot;)">广东</a>
					 <a onclick="getProvice(&quot;广西&quot;)">广西</a>
				</li>
				<li>
					 <a onclick="getProvice(&quot;贵州&quot;)">贵州</a>
					 <a onclick="getProvice(&quot;海南&quot;)">海南</a>
					 <a onclick="getProvice(&quot;河北&quot;)">河北</a>
					 <a onclick="getProvice(&quot;河南&quot;)">河南</a>
					 <a onclick="getProvice(&quot;黑龙江&quot;)">黑龙江</a>
					 <a onclick="getProvice(&quot;湖北&quot;)">湖北</a>
					 <a onclick="getProvice(&quot;湖南&quot;)">湖南</a>
					 <a onclick="getProvice(&quot;江苏&quot;)">江苏</a>
				</li>
				<li>
					<a onclick="getProvice(&quot;江西&quot;)">江西</a>
					<a onclick="getProvice(&quot;吉林&quot;)">吉林</a>
				  	<a onclick="getProvice(&quot;辽宁&quot;)">辽宁</a>
				  	<a onclick="getProvice(&quot;内蒙古&quot;)">内蒙古</a>
				 	<a onclick="getProvice(&quot;宁夏&quot;)">宁夏</a>
				  	<a onclick="getProvice(&quot;青海&quot;)">青海</a>
				 	<a onclick="getProvice(&quot;山东&quot;)">山东</a>
				  	<a onclick="getProvice(&quot;山西&quot;)">山西</a>
				</li>
				<li>
					<a onclick="getProvice(&quot;陕西&quot;)">陕西</a>
				  	<a onclick="getProvice(&quot;上海市&quot;)">上海</a>
					<a onclick="getProvice(&quot;四川&quot;)">四川</a>
					<a onclick="getProvice(&quot;天津市&quot;)">天津</a>
					<a onclick="getProvice(&quot;西藏&quot;)">西藏</a>
					<a onclick="getProvice(&quot;新疆&quot;)">新疆</a>
					<a onclick="getProvice(&quot;云南&quot;)">云南</a>
					<a onclick="getProvice(&quot;浙江&quot;)">浙江</a>
				</li>
 			</ul>
 		</div>
 		<div id="exp_cityListBottom" style="width: 100%;height:38%;background: rgba(0,0,0,0.5);"></div>
 	</div>
 	<input id="province" value="0" type="hidden" />
    <div class="content" id="content">
    <div id="wrapper">
		<div id="scroller">
		<div class="card nonemagin" id="gdt" >
			<ul id="expertList" class="table-view checkExpert_content_ul" style="margin-top:60px;">
     		</ul>
      </div>
      
    </div>
     </div>
    </div>
   
  </body>
   <script type="text/javascript" src="js/city.js" ></script>
  <script type="text/javascript" src="weixin/hy/js/checkExpert.js"></script>
</html>