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
			  <li class="table-view-cell checkzj" id="zjcheck" style="border-bottom:0px;">
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
			  <li class="table-view-cell orderinput newor" style="color:#ff0000;text-align:center;">
				<div class="input-row" style="height:50px;"> <label style="width:80% !important;padding-top:15px;">或者致电客服，让客服推荐专家</label>
				<a id="kftel"><img style="width:15%" src="weixin/images/call_03.png" /></a></div>
			 </li>
			<li class="table-view-cell allorderitle">
				请填写以下信息
			  </li>
			 <!--  <li class="table-view-cell orderinput newor">
				<div class="input-row sex" id="hzsex"> 
					<label style="width:30% !important">性别(<font color="#FF0101">必填</font>):</label>
					<img class="se" sex="1" src="weixin/images/sex1.png"> 男   <img sex="2" class="se" src="weixin/images/sex0.png"> 女
				  </div>
			 </li>
			 <li class="table-view-cell orderinput newor">
			 	<div class="input-row">
					<label>年龄(<font color="#FF0101">必填</font>):</label>
					</div>
			 </li>
			  <li class="table-view-cell orderinput newor">
			 	<div class="input-row">
					<input id="birthday" type="text" />
					</div>
			 </li>
			 <li class="table-view-cell orderinput newor">
			 	<div class="input-row"><label>身高(cm)：</label></div>
			 </li>
			 <li class="table-view-cell orderinput newor">
			 	<div class="input-row"><input id="height" type="text" /></div>
			 </li>
			 <li class="table-view-cell orderinput newor">
			 	<div class="input-row"><label>体重(kg)：</label></div>
			 </li>
			 <li class="table-view-cell orderinput newor">
			 	<div class="input-row"><input id="weight" type="text" /></div>
			 </li>
			 <li class="table-view-cell orderinput newor">
			 	<div class="input-row"><label>职业：</label></div>
			 </li>
			 <li class="table-view-cell orderinput newor">
			 	<div class="input-row"><input id="occaption" type="text" /></div>
			 </li>
			 <li class="table-view-cell orderinput newor">
			 	<div class="input-row"><label>入院时间：</label></div>
			 </li>
			 <li class="table-view-cell orderinput newor">
			 	<div class="input-row"><input style="margin-top:0px;" id="admissionTime" type="text" /></div>
			 </li> --> 
			 <li class="table-view-cell orderinput newor">
			 	<div class="input-row"><label>病人主诉：</label></div>
			 </li>
			 <li class="table-view-cell orderinput newor tex">
			 	<div class="input-row"><textarea id="chiefComplaint"></textarea></div>
			 </li>
			<!--  <li class="table-view-cell orderinput newor">
			 	<div class="input-row"><label>现病史：</label></div>
			 </li>
			 <li class="table-view-cell orderinput newor tex">
			 	<div class="input-row"><textarea id="illPrenent"></textarea></div>
			 </li>
			 <li class="table-view-cell orderinput newor">
			 	<div class="input-row"><label>既往史：</label></div>
			 </li>
			 <li class="table-view-cell orderinput newor tex">
			 	<div class="input-row"><textarea id="illPost"></textarea></div>
			 </li>
			 <li class="table-view-cell orderinput newor">
			 	<div class="input-row"><label>个人史：</label></div>
			 </li>
			 <li class="table-view-cell orderinput newor tex"> 
			 	<div class="input-row"><textarea id="illPersonal"></textarea></div>
			 </li>
			  <li class="table-view-cell orderinput newor">
			 	<div class="input-row"><label>家族史：</label></div>
			 </li>
			 <li class="table-view-cell orderinput newor tex">
			 	<div class="input-row"><textarea id="illFamily"></textarea></div>
			 </li>
			  <li class="table-view-cell orderinput newor">
			 	<div class="input-row"><label>药物食物过敏史：</label></div>
			 </li>
			 <li class="table-view-cell orderinput newor tex">
			 	<div class="input-row"><textarea id="allergryHistory"></textarea></div>
			 </li>
			 <li class="table-view-cell orderinput newor">
			 	<div class="input-row im"><label>入院查体：</label><img typeNo="1" id="upimg" src="weixin/images/up0.png" /></div>
			 </li>
			 <li class="table-view-cell orderinput newor tex">
			 	<div class="input-row"><textarea id="admissionCheck"></textarea></div>
			 </li>
			 <li class="table-view-cell orderinput newor">
			 	<label class="uploadimage" id="upimg1">
			 	</label>
			 </li>
			 <li class="table-view-cell orderinput newor">
			 	<div class="input-row im"><label>实验室检查：</label><img typeNo="2" id="upimg" src="weixin/images/up0.png" /></div>
			 </li>
			 <li class="table-view-cell orderinput newor tex">
			 	<div class="input-row"><textarea id="labCheck"></textarea></div>
			 </li>
			 <li class="table-view-cell orderinput newor">
			 	<label class="uploadimage" id="upimg2"></label>
			 </li>
			 <li class="table-view-cell orderinput newor">
			 	<div class="input-row im"><label>影像学检查：</label><img typeNo="3" id="upimg" src="weixin/images/up0.png" /></div>
			 </li>
			 <li class="table-view-cell orderinput newor tex">
			 	<div class="input-row"><textarea id="imgCheck"></textarea></div>
			 </li>
			 <li class="table-view-cell orderinput newor">
			 	<label class="uploadimage" id="upimg3"></label>
			 </li>
			  <li class="table-view-cell orderinput newor">
			 	<div class="input-row im"><label>其他辅助检查：</label><img typeNo="4" id="upimg" src="weixin/images/up0.png" /></div>
			 </li>
			 <li class="table-view-cell orderinput newor tex">
			 	<div class="input-row"><textarea id="otherCheck"></textarea></div>
			 </li>
			 <li class="table-view-cell orderinput newor">
			 	<label class="uploadimage" id="upimg4"></label>
			 </li> -->
			  <li class="table-view-cell orderinput newor">
			 	<div class="input-row"><label>初步诊断：</label></div>
			 </li>
			  <li class="table-view-cell orderinput newor tex">
			 	<div class="input-row"><textarea id="preDiagnosis"></textarea></div>
			 </li>
			<!-- <li class="table-view-cell orderinput newor">
			 	<div class="input-row"><label>治疗方案：</label></div>
			 </li>
			 <li class="table-view-cell orderinput newor tex">
			 	<div class="input-row"><textarea id="treatPlan"></textarea></div>
			 </li>
			 <li class="table-view-cell orderinput newor">
			 	<div class="input-row"><label>描述：</label></div>
			 </li>
			 <li class="table-view-cell orderinput newor tex">
			 	<div class="input-row"><textarea id="remark"></textarea></div>
			 </li> -->
			 <!-- <li class="table-view-cell orderinput">
				   <div class="ystk"><img src="weixin/images/up0.png" style="width:30px;" /><a style="color:#FF0101">点击上传相关检查结果</a></div>
			  </li> --> 
			   <li class="table-view-cell orderinput newor">
			 	<div class="input-row">
					<label>您所在的医院:</label>
					</div>
			 </li>
			  <li class="table-view-cell orderinput newor">
			 	<div class="input-row">
					<input id="hospital" type="text" />
					</div>
			 </li>
			 <li class="table-view-cell orderinput newor">
			 	<div class="input-row"><label>您的联系方式：</label></div>
			 </li>
			 <li class="table-view-cell orderinput newor">
			 	<div class="input-row"><input id="tel" type="text" /></div>
			 </li>
			</ul>
			</form>
 		</div>
 		<div class="content-padded">
	      <a class="btn btn-primary btn-block" id="reg">提交预约</a>
	    </div> 
 		</div>
 	</div>
 </div>
	<div id="uporderImg" class="modeldigo" style="display: none">
	
		<ul class="table-view" style="overflow-y:auto " id="content">
			<li class="table-view-cell allorderitle">
				上传资料<a style="float:right;background-image:linear-gradient(to bottom,#1091CF,#1091CF);color:#ff0000"  id="closeup">关闭</a>
			  </li>
			<li class="table-view-cell">
			<img id="checkOrderimg" src="weixin/images/up.png" style="width:200px;height:200px;" />
			<textarea id="remarkimg" placeholder="请输入备注"></textarea>
			</li>
			<div class="content-padded">
		      <a class="btn btn-primary btn-block" id="regbl">提交</a>
		       <a class="btn btn-primary btn-block closebut" id="delup">删除</a>
		    </div> 
		</ul>
		
	</div>
	
  </body>
  <script src="weixin/js/uuid.js"></script>
  <script type="text/javascript" src="weixin/order/js/addOrder.js"> </script>
</html>
