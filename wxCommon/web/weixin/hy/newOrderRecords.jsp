<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<!DOCTYPE>
<html>
  <head>
	<title>预约记录</title>
	<jsp:include page="../common.jsp"></jsp:include>
	<style>
		*{margin:0;padding:0;}
		li{list-style:none;}
		.blue{color:#86B0ED;}
		
		
		.odRecord{
			margin: 10px;
    		background-color: #fff;
    		border: 1px solid #ddd;
    		border-radius: 6px;
		}
		.odRecord li{line-height:35px;position:relative;}
		
		.odRec_left{width:36%;display:inline-block;text-align:right;float:left;}
		.odRec_right{width:55%;display:inline-block;}
		.odRec_nameHeight, .odRec_ageWeight{width:50%;display:inline-block;text-align:center;}
		.odRec_ageWeight{float:left;}
		
		.odRec_toImg{width:53%;display:inline-block;float:left;}
		.odRec_toSeeImg{width:30px;height:32px;background: url(weixin/images/seeImg.png) no-repeat;display:inline-block;float:left;}
		.odRec_upArrow{width: 48px;height: 48px;background:url(weixin/images/topArrow.png) no-repeat;position: absolute;right: -5px;top: -47px;}
		.odRec_ryct, 
		.odRec_sysct,
		.odRec_yxxct,
		.odRec_other{
			width: 96%;margin: 0 2%;background-color: #fff;position: absolute;right: 0;border: 1px solid #ccc;text-align: center;z-index: 99;box-shadow: 0 0 10px #CCC;display:none;
		}
		.odRec_ryct{position: absolute;right: 0;top: 70px;}
		.odRec_sysct{position: absolute;right: 0;top: 176px;}
		.odRec_yxxct{position: absolute;right: 0;top: 280px;}
		.odRec_other{position: absolute;right: 0;top: 350px;}
		
		.odRec_qtctLeft{width:38%;display:inline-block;float:left;}
		.odRec_qtctRight{width:51%;display:inline-block;float:left;}
	</style>
  </head>
<body style="overflow-y: scroll" ontouchstart="">
	<div class="content cont" id="content">
		<ul class="odRecord">
			<li>
				<span class="odRec_left blue">专家1：</span>
				<span class="odRec_right blue">Prof.John Kellum</span>
			</li>
			<li>
				<span class="odRec_left blue">专家2：</span>
				<span class="odRec_right blue">王春亭教授</span>
			</li>
			<li>
				<span class="odRec_left blue">专家3：</span>
				<span class="odRec_right blue">杜斌教授</span>
			</li>
			<li>
				<span class="odRec_nameHeight">性别：<i style="font-style:normal;">男</i></span>
				<span class="odRec_ageWeight">年龄：<i style="font-style:normal;">25</i></span>
			</li>
			<li>
				<span class="odRec_nameHeight">身高(cm)：<i style="font-style:normal;">175</i></span>
				<span class="odRec_ageWeight">体重(kg)：<i style="font-style:normal;">60</i></span>
			</li>
			<li>
				<span class="odRec_left">职业：</span>
				<span class="odRec_right">工人</span>
			</li>
			<li>
				<span class="odRec_left">入院时间：</span>
				<span class="odRec_right">2015-08-10</span>
			</li>
			<li>
				<span class="odRec_left">主诉：</span>
				<span class="odRec_right">外伤后头疼头晕伴左下肢疼痛1小时余。</span>
			</li>
			<li>
				<span class="odRec_left">现病史：</span>
				<span class="odRec_right">患者诉于1小时前被机动车撞伤，伤后感头痛头晕，左下肢头痛，无恶心呕吐，无心慌不适，遂到我院就诊，门诊行X线片示：左膝关节骨质未见明显改变，颅脑CT未见
					明显异常。为求进一步治疗，门诊以"下肢外伤"收入院，患者一般状况良好，神志清，精神可，大小便正常。
				</span>
			</li>
			<li>
				<span class="odRec_left">既往史：</span>
				<span class="odRec_right">平素体健，否认肝炎及结核病史，无重大外伤手术史，无药物过敏史。</span>
			</li>
			<li>
				<span class="odRec_left">个人史：</span>
				<span class="odRec_right">出生于本地，无外地就居住史，无不良嗜好。</span>
			</li>
			<li>
				<span class="odRec_left">家族史：</span>
				<span class="odRec_right">否认家族中遗传病及传染病病史。</span>
			</li>
			<li>
				<span class="odRec_left">药物过敏史：</span>
				<span class="odRec_right">无药物过敏史</span>
			</li>
			<li>
				<span class="odRec_left">入院查体：</span>
				<span class="odRec_toImg">患者老年男性，发育正常，营养中等，神志清楚，精神可。</span>
				<i class="odRec_toSeeImg"></i>
				<div class="odRec_ryct">
					<img src="weixin/images/3.png" style="max-width:180px;">
	 				<textarea placeholder=""></textarea>
				  	<i class="odRec_upArrow"></i>
				</div>
			</li>
			<li>
				<span class="odRec_left">实验室查体：</span>
				<span class="odRec_toImg">患者神志清，精神可，双瞳孔等大等圆，直径约3mm对光反应灵敏</span>
				<i class="odRec_toSeeImg"></i>
				<div class="odRec_sysct">
					<img src="weixin/images/3.png" style="max-width:180px;">
	 				<textarea placeholder=""></textarea>
				  	<i class="odRec_upArrow"></i>
				</div>
			</li>
			<li>
				<span class="odRec_left">影像学检查：</span>
				<span class="odRec_toImg">X线片示，左膝关节骨质未见明显改变</span>
				<i class="odRec_toSeeImg"></i>
				<div class="odRec_yxxct">
					<img src="weixin/images/3.png" style="max-width:180px;">
	 				<textarea placeholder=""></textarea>
				  	<i class="odRec_upArrow"></i>
				</div>
			</li>
			<li>
				<span class="odRec_qtctLeft">其他辅助检查：</span>
				<span class="odRec_qtctRight">颅脑CT显示：颅脑CT未见明显改变</span>
				<i class="odRec_toSeeImg"></i>
				<div class="odRec_other">
					<img src="weixin/images/3.png" style="max-width:180px;">
	 				<textarea placeholder=""></textarea>
				  	<i class="odRec_upArrow"></i>
				</div>
			</li>
			<li>
				<span class="odRec_left">初步诊断：</span>
				<span class="odRec_right">左下肢软组织损伤</span>
			</li>
			<li>
				<span class="odRec_left">治疗方案：</span>
				<span class="odRec_right">抗感染及对症支持治疗</span>
			</li>
			<li>
				<span class="odRec_left">病情恶化：</span>
				<span class="odRec_right">无</span>
			</li>
		</ul>
	</div> 
<script type="text/javascript"src="weixin/hy/js/newOrderRecords.js"></script>
</body>
</html>
