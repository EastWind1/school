<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<!DOCTYPE>
<html>
  <head>
	<title>在线点播</title>
	<jsp:include page="../common.jsp"></jsp:include>
  </head>
  
<body style="overflow-y: scroll" ontouchstart="">
<div class="bar bar-standard bar-header-secondary checkExpert_search">
   		<a id="typeList" style="display: inline-block; padding: 5% 0;" value="0">全部分类 ></a>
   		<span style="float:right;padding:5% 0;">共【<label>0</label>】个</span>
	</div>
	<div id="citydigle" class="digle" style="height:100%;padding-left:0;background:transparent;">
 		<div id="exp_cityList" style="width:100%;height:70%;background-color: #fff;">
 			<div id="all_fenlei" style="padding: 5% 0 1% 6%;" value="0">全部分类</div>
 			<ul class="cityListInfo vd_fenlei" style="padding-left:5%;margin-top:0px;">
 				<li>
					<a value="网站建设">脓毒症</a>
					<a value="10">重症超声</a>
					<a value="微信开发">重症感染</a>
					<a value="4">重症神经</a>
					<a value="9">出血与凝血</a>
					<a value="6">重症营养</a>
					<a value="7">重症创伤</a>
				</li>
				<li>
					<a value="11">镇痛镇静谵妄</a>
					<a value="12">重症儿科</a>
					<a value="13">重症护理</a>
					<a value="15">重症产科</a>
				</li>
				<li>
					<a value="8">重症心脏与血流动力学</a>
					<a value="5">重症肾脏与血液净化</a>
					<a value="APP开发">重症呼吸与机械通气</a>
					<a value="14">重症信息与互联网</a>
				</li>
				<li>
					<a value="16">其它</a>
				</li>
 			</ul>
 		</div>
 		<div id="exp_cityListBottom" style="width: 100%;height:38%;background: rgba(0,0,0,0.5);"></div>
 	</div>
	
	
	
	<!-- <div id="typedigle" class="digle">
 		<a>全部分类</a>
		<a>脓毒症</a>
		<a>重症感染</a>
		<a>重症神经</a>
		<a>重症营养</a>
		<a>重症创伤</a>
		<a>出血与凝血</a>
		<a>重症超声</a>
		<a>镇痛镇静谵妄</a>
		<a>重症儿科</a>
		<a>重症护理</a>
		<a>重症产科</a>
		<a style="width:49%">重症肾脏与血液净化</a>
		<a style="width:48%">重症呼吸与机械通气</a>
		<a style="width:49%">重症心脏与血流动力学</a>
		<a style="width:48%">重症信息与互联网</a>
		<a>其它</a>
 	</div> -->
	<div class="content cont" id="content">
	   <!-- <h4 value="0">全部分类</h4>  -->
		<div id="videoClass_list">
		
		
		</div> 
	</div> 

 <script type="text/javascript" src="weixin/hy/js/videoClass.js"></script> 
</body>
</html>
