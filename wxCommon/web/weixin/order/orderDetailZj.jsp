<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<!DOCTYPE>
<html>
  <head>
	<title>我的预约</title>
	<jsp:include page="../common.jsp"></jsp:include>
	<link href="common/mobiscroll/css/mobiscroll.custom-2.6.2.min.css" rel="stylesheet" type="text/css" />
	<script src="common/mobiscroll/js/mobiscroll.custom-2.6.2.min.js" type="text/javascript"></script>
	<script type="text/javascript" src="weixin/js/jweixin-1.0.0.js"> </script>
  </head>
  
  <body>
    <div class="content">
     <div id="wrapper">
	<div id="scroller">
		<div class="card formgroup chec">
			<form class="input-group formreg">
			<ul class="table-view meninfo ord">
			<li class="table-view-cell allorderitle">
				病人信息
			  </li>
			  <li class="table-view-cell orderinput">
				<div class="input-row sex" id="hzsex">
					<label class="titlezj">性别：</label>
					<label class="conte" id="sex"></label>
				  </div>
				 <div class="input-row">
					<label>年龄：</label>
					<label class="conte" id="birthday"></label>
				  </div>
				  <div class="input-row">
					<label>身高(cm)：</label>
					<label class="conte" id="height"></label>
				  </div>
				  <div class="input-row">
					<label>体重(kg)：</label>
					<label class="conte" id="weight"></label>
				  </div>
				  <div class="input-row">
					<label>职业：</label>
					<label class="conte" id="occaption"></label>
				  </div>
				  <div class="input-row">
					<label>入院时间：</label>
					<label class="conte" id="admissionTime"></label>
				  </div>
				  <div class="input-row text">
					<label>主诉：</label>
					<label class="conte" id="chiefComplaint"></label>
				  </div>
				  <div class="input-row text">
					<label>现病史：</label>
					<label class="conte" id="illPrenent"></label>
				  </div>
				  <div class="input-row text">
					<label>既往史：</label>
					<label class="conte" id="illPost"></label>
				  </div>
				  <div class="input-row text">
					<label>个人史：</label>
					<label class="conte" id="illPersonal"></label>
				  </div>
				  <div class="input-row text">
					<label>家族史：</label>
					<label class="conte" id="illFamily"></label>
				  </div>
				  <div class="input-row text">
					<label>药物食物过敏史：</label>
					<label class="conte" id="allergryHistory"></label>
				  </div>
				  <div class="input-row text">
					<label>入院查体：</label>
					<label class="conte" id="admissionCheck"></label>
				  </div>
				  <p id="ryctimg">
				  </p>
				  <div class="input-row text">
					<label>实验室检查：</label>
					<label class="conte" id="labCheck"></label>
				  </div>
				  <p id="sysjcimg">
				  </p>
				  <div class="input-row text">
					<label>影像学检查：</label>
					<label class="conte" id="imgCheck"></label>
				  </div>
				  <p id="yxxjcimg">
				  </p>
				  <div class="input-row text">
					<label>其他辅助检查：</label>
					<label class="conte" id="otherCheck"></label>
				  </div>
				  <p id="otherimg">
				  </p>
				  <div class="input-row text">
					<label>初步诊断：</label>
					<label class="conte" id="preDiagnosis"></label>
				  </div>
				  <div class="input-row text">
					<label>治疗方案：</label>
					<label class="conte" id="treatPlan"></label>
				  </div>
				  <div class="input-row text">
					<label>病情描述：</label>
					<label class="conte" id="remark"></label>
				  </div>
			  </li>
			</ul>
			</form>
 		</div>
 	</div>
	</div>
 	</div>
  </body>
  <script src="weixin/js/uuid.js"></script>
  <script type="text/javascript" src="weixin/order/js/orderDetailDoctorZj.js"> </script>
</html>
