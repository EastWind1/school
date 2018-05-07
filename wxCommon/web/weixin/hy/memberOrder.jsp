<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<!DOCTYPE>
<html>
  <head>
	<title>预约专家</title>
	<jsp:include page="../common.jsp"></jsp:include>
	<link href="common/mobiscroll/css/mobiscroll.custom-2.6.2.min.css" rel="stylesheet" type="text/css" />
	<script src="common/mobiscroll/js/mobiscroll.custom-2.6.2.min.js" type="text/javascript"></script>
  </head>
  
  <body>
    <div class="content">
		<div class="card cardmagin">
		<table>
			<tr>
				<td class="tdkey">专家1：</td>
				<td class="tdval memberOrder_sel">
					<select id="expertId1">
						<option>请选择专家</option>
					</select>
					<a class="yue_qingchu">清除</a>
				</td>
			</tr>
			
			<tr>
				<td class="tdkey">专家2：</td>
				<td class="tdval memberOrder_sel">
					<select id="expertId2">
						<option>请选择专家</option>
					</select>
					<a class="yue_qingchu">清除</a>
				</td>
			</tr>
			<tr>
				<td class="tdkey">专家3：</td>
				<td class="tdval memberOrder_sel">
					<select id="expertId3">
						<option>请选择专家</option>
					</select>
					<a class="yue_qingchu">清除</a>
				</td>
			</tr>
			<tr>
				<td class="tdkey">性别：</td>
				<td class="tdval icon1_0" id="sex"><img sex="1" src="weixin/images/sex1.png"> 男   <img sex="2" src="weixin/images/sex0.png"> 女</td>
			</tr>
			<tr>
				<td class="tdkey">年龄：</td>
				<td class="tdval">
				<input id="birthday" placeholder="请输入年龄"></input>
				<!-- <input id="birthday"  size="16" type="text" placeholder="选择出生日期" readonly></input> -->
				</td>
			</tr>
			<tr>
				<td class="tdkey">身高(cm)：</td>
				<td class="tdval"><input id="height"></input></td>
			</tr>
			<tr>
				<td class="tdkey">体重(kg)：</td>
				<td class="tdval"><input id="weight"></input></td>
			</tr>
			<tr>
				<td class="tdkey">职业：</td>
				<td class="tdval"><input id="occaption"></input></td>
			</tr>
			<tr>
				<td class="tdkey">入院时间：</td>
				<td class="tdval"><input id="admissionTime"  size="16" type="text" placeholder="选择入院时间" readonly></input></td>
			</tr>
			<tr>
				<td class="tdkey">主诉：</td>
				 <td class="tdval"><textarea id="chiefComplaint"></textarea></td>
			</tr>
			<tr>
				<td class="tdkey">现病史：</td>
			    <td class="tdval"><textarea id="illPrenent"></textarea></td>
			</tr>
			<tr>
				<td class="tdkey">既往史：</td>
				<td class="tdval"><textarea id="illPost"></textarea></td>
			</tr>
			<tr>
				<td class="tdkey">个人史：</td>
				<td class="tdval"><textarea id="illPersonal"></textarea></td>
			</tr>
			<tr>
				<td class="tdkey">家族史：</td>
				<td class="tdval"><textarea id="illFamily"></textarea></td>
			</tr>
			<tr>
				<td class="tdkey">药物食物过敏史：</td>
				<td class="tdval"><textarea id="allergryHistory"></textarea></td>
			</tr>
			<tr>
				<td class="tdkey" >入院查体：</td>
				<td class="tdval"><textarea id="admissionCheck"></textarea></td>
			</tr>
			<!-- <tr>
				<td class="tdkey" ></td>
				<td class="tdval"><button id="sumSubmit" filed4="1" name="ryct" type="button" class="btn blue" style= "padding: 15px 18px;display: inline-block;"  >上传</button></td>
			</tr> -->
			<tr>
				<td class="tdkey">实验室检查：</td>
				<td class="tdval"><textarea id="labCheck"></textarea></td>
			</tr>
			<!-- <tr>
				<td class="tdkey" ></td>
				<td class="tdval"><button id="sumSubmit1" filed4="2" name="sysjc" type="button" class="btn blue" style= "padding: 15px 18px;display: inline-block;"  >上传</button></td>
			</tr> -->
			<tr>
				<td class="tdkey">影像学检查：</td>
				<td class="tdval"><textarea id="imgCheck"></textarea></td>
			</tr>
			<!-- <tr>
				<td class="tdkey" ></td>
				<td class="tdval"><button id="sumSubmit2" filed4="3" name="yxxjc" type="button" class="btn blue" style= "padding: 15px 18px;display: inline-block;"  >上传</button></td>
			</tr> -->
			<tr>
				<td class="tdkey">其他辅助检查：</td>
				<td class="tdval"><textarea id="otherCheck"></textarea></td>
			</tr>
			<!-- <tr>
				<td class="tdkey" ></td>
				<td class="tdval"><button id="sumSubmit3" filed4="4" name="qtfzjc" type="button" class="btn blue" style= "padding: 15px 18px;display: inline-block;" >上传</button></td>
			</tr> -->
			<tr>
				<td class="tdkey">初步诊断：</td>
				<td class="tdval"><textarea id="preDiagnosis"></textarea></td>
			</tr>
			<tr>
				<td class="tdkey">治疗方案：</td>
				<td class="tdval"><textarea id="treatPlan"></textarea></td>
			</tr>
			<!-- <tr>
				<td class="tdkey">病情恶化：</td> 
				<td class="tdval"><textarea id="illSerious"></textarea></td>
			</tr> -->
			<tr>
				<td class="tdkey">病情描述：</td> 
				<td class="tdval"><textarea id="remark"></textarea></td>
			</tr>
		</table>
		<div class="content-padded">
	      <a class="btn btn-primary btn-block" id="reg">提交</a>
	    </div> 
 		</div>
 	</div>
 	
  </body>
  <script src="weixin/js/uuid.js"></script>
  <script type="text/javascript" src="weixin/hy/js/memberOrder.js"> </script>
</html>
