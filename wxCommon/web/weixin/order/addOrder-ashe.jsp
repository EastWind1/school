<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<!DOCTYPE>
<html>
  <head>
	<title>预约专家</title>
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
				请选择专家
			  </li>
			  <li class="table-view-cell checkzj" id="zjcheck">
				<div class="input-row">
					<label>专家1：</label>
					<select id="expertId1">
						<option>请选择专家</option>
					</select>
					 <label class="delezj">清除</label>
				  </div>
				 <div class="input-row">
					<label>专家2：</label>
					<select id="expertId2">
						<option>请选择专家</option>
					</select>
					 <label class="delezj">清除</label>
				  </div>
				  <div class="input-row">
					<label>专家3：</label>
					<select id="expertId3">
						<option>请选择专家</option>
					</select>
					 <label class="delezj">清除</label>
				  </div>
			  </li>
			<li class="table-view-cell allorderitle">
				请填写病人信息（资料越详细，预约越快）
			  </li>
			  <li class="table-view-cell orderinput">
				<div class="input-row sex" id="hzsex">
					<label>性别(<font color="#FF0101">必填</font>):</label>
					<img class="se" sex="1" src="weixin/images/sex1.png"> 男   <img sex="2" class="se" src="weixin/images/sex0.png"> 女
				  </div>
				 <div class="input-row">
					<label>年龄(<font color="#FF0101">必填</font>):</label>
					<input id="birthday" type="text" />
				  </div>
				  <div class="input-row">
					<label>身高(cm):</label>
					<input id="height" type="text" />
				  </div>
				  <div class="input-row">
					<label>体重(kg):</label>
					<input id="weight" type="text" />
				  </div>
				  <div class="input-row">
					<label>职业:</label>
					<input id="occaption" type="text" />
				  </div>
				  <div class="input-row">
					<label>入院时间:</label>
					<input style="margin-top:0px;" id="admissionTime" type="text" />
				  </div>
				  <div class="input-row text">
					<label>主诉(<font color="#FF0101">必填</font>):</label>
					<textarea id="chiefComplaint"></textarea>
				  </div>
				  <div class="input-row text">
					<label>现病史:</label>
					<textarea id="illPrenent"></textarea>
				  </div>
				  <div class="input-row text">
					<label>既往史:</label>
					<textarea id="illPost"></textarea>
				  </div>
				  <div class="input-row text">
					<label>个人史:</label>
					<textarea id="illPersonal"></textarea>
				  </div>
				  <div class="input-row text">
					<label>家族史:</label>
					<textarea id="illFamily"></textarea>
				  </div>
				  <div class="input-row text">
					<label>药物食物过敏史:</label>
					<textarea id="allergryHistory"></textarea>
				  </div>
				  <div class="input-row text">
					<label>入院查体:</label>
					<textarea id="admissionCheck"></textarea>
					 <label typeNo="1" id="upimg" class="deleimg"><img src="weixin/images/up0.png" /></label>
				  </div>
				  <div class="input-row text">
					<label>上传查体结果:</label>
					<!-- <img id="checkOrderimg" src="weixin/images/up.png" style="width:80px;height:80px;" /> -->
				  </div>
				  <p id="upimg1">
				  </p>
				  <div class="input-row text">
					<label>实验室检查:</label>
					<textarea id="labCheck"></textarea>
					<label typeNo="2" id="upimg" class="deleimg"><img src="weixin/images/up0.png" /></label>
				  </div>
				  <p id="upimg2">
				  </p>
				  <div class="input-row text">
					<label>影像学检查:</label>
					<textarea id="imgCheck"></textarea>
					<label typeNo="3" id="upimg" class="deleimg"><img src="weixin/images/up0.png" /></label>
				  </div>
				   <p id="upimg3">
				  </p>
				  <div class="input-row text">
					<label>其他辅助检查:</label>
					<textarea id="otherCheck"></textarea>
					<label typeNo="4" id="upimg" class="deleimg"><img src="weixin/images/up0.png" /></label>
				  </div>
				   <p id="upimg4">
				  </p>
				  <div class="input-row text">
					<label>初步诊断:</label>
					<textarea id="preDiagnosis"></textarea>
				  </div>
				  <div class="input-row text">
					<label>治疗方案:</label>
					<textarea id="treatPlan"></textarea>
				  </div>
				  <div class="input-row text">
					<label>病情描述:</label>
					<textarea id="remark"></textarea>
				  </div>
				   <div class="ystk"><img src="weixin/images/up0.png" style="width:30px;" /><a style="color:#FF0101">点击上传相关检查结果</a></div>
			  </li>
			</ul>
			</form>
 		</div>
 		<div class="content-padded">
	      <a class="btn btn-primary btn-block" id="reg">预约</a>
	    </div> 
 		</div>
 	</div>
 </div>
	<div id="uporderImg" class="modeldigo" style="display: none">
	
		<ul class="table-view" style="overflow-y:auto " id="content">
			<li class="table-view-cell allorderitle">
				上传资料<a style="float:right">关闭</a>
			  </li>
			<li class="table-view-cell">
			<img id="checkOrderimg" src="weixin/images/up.png" style="width:200px;height:200px;" />
			</li>
			<div class="content-padded">
		      <a class="btn btn-primary btn-block" id="regbl">提交</a>
		       <a class="btn btn-primary btn-block closebut" id="closeup">关闭</a>
		    </div> 
		</ul>
		
	</div>
	
  </body>
  <script src="weixin/js/uuid.js"></script>
  <script type="text/javascript" src="weixin/order/js/addOrder.js"> </script>
</html>
