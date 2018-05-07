<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<!DOCTYPE>
<html>
  <head>
	<title>我要注册</title>
	<jsp:include page="../common.jsp"></jsp:include>
	<link href="common/mobiscroll/css/mobiscroll.custom-2.6.2.min.css"
			rel="stylesheet" type="text/css" />
		<script src="common/mobiscroll/js/mobiscroll.custom-2.6.2.min.js"
			type="text/javascript"></script>
	<script src="js/city.js" type="text/javascript"></script>
	
  </head>
  
  <body>
    <div class="content">
    <!-- <div class="card nonemagin">
    	<img class="bannerimg" src="weixin/images/zc_banner.png">
    </div> -->
		<div class="card cardmagin">
		<table class="reg">
			<!-- <tr>
				<td class="tdkey">会员类型：</td>
				<td class="tdval icon1_0" id="type"><img src="weixin/images/sex1.png" type="0"> 普通会员 <img src="weixin/images/sex0.png" type="1"> 医师</td>
			</tr> -->
			<tr>
				<td class="tdkey">所在省份：</td>
				<td class="tdval">
					<select name="province" id="province" style="hidden">
						<option value="00" selected="selected" value="">请选择省份</option>
					</select>
				</td>
			</tr>
			<tr>
				<td class="tdkey">所在城市：</td>
				<td class="tdval">
					<select name="city" id="city" >
					<option value="00" selected="selected" value="">请选择城市</option>
					</select>
				</td>
			</tr>
			<tr>
				<td class="tdkey">所在医院：</td>
				<td class="tdval">
				<select name="hospital_name" id="hospital_name" style="width:80%">
						<option  value="00" selected="selected">请选择医院</option>
					</select><a id="searchos">搜索</a>
				<!-- <input name="hospital_name" placeholder="请输入医院名称(汉字)"  /></td> -->
			</tr>
			<tr name="searchos" style="display:none">
				<td class="tdkey"></td>
				<td class="tdval"><input name="searchosinp" id="searchosinp" placeholder="请输入医院名称"  /></td>
			</tr>
			<tr name="hospitalName" style="display:none">
				<td class="tdkey">其他医院：</td>
				<td class="tdval"><input name="hospitalName" id="hospitalName" placeholder="请输入医院名称或公司名称"  /></td>
			</tr>
			<tr>
				<td class="tdkey">所在科室：</td>
				<td class="tdval">
				<select name="hospital_offices" id="hospital_offices" >
					<option selected="selected">请选择科室</option>
					<option value="">ICU</option>
					<option value="">PICU</option>
					<option value="">急诊科</option>
					<option value="">急诊ICU</option>
					<option value="">呼吸科</option>
					<option value="">麻醉科</option>
					<option value="">儿科</option>
					<option value="">产科</option>
					<option value="">外科</option>
					<option  id="officeOther" value="qt">其他</option>
				</select>
				</td>
			</tr>
			<tr name="officeName" style="display:none">
				<td class="tdkey">其他科室：</td>
				<td class="tdval"><input name="officeName" id="officeName" placeholder="请输入科室名称"  /></td>
			</tr>
			<tr>
				<td class="tdkey">姓名：</td>
				<td class="tdval"><input name="name" id="name" placeholder="请输入姓名"  /></td>
			</tr>
			<tr>
				<td class="tdkey">性别：</td>
				<td class="tdval icon1_0" id="sex"><img sex="1" src="weixin/images/sex1.png"> 男   <img sex="2" src="weixin/images/sex0.png"> 女</td>
			</tr>
			<tr>
				<td class="tdkey">职称：</td>
				<td class="tdval">
				<select name="job_title" id="job_title" >
					<option selected="selected">请选择职称</option>
					<option value="">主任医师</option>
					<option value="">副主任医师</option>
					<option value="">主治医师</option>
					<option value="">住院医师</option>
					<option value="">学生</option>
					<option value="">主任护师</option>
					<option value="">副主任护师</option>
					<option value="">主管护师</option>
					<option value="">护师</option>
					<option value="">护士</option>
				</select>
				
			</tr>
			<tr>
				<td class="tdkey">职务：</td>
				<td class="tdval">
				<select name="post" id="post" >
					<option selected="selected">请选择职务</option>
					<option value="" >科室主任</option>
					<option value="" >科室副主任</option>
					<option value="" >带组组长</option>
					<option value="" >医生</option>
					<option value="" >护士长</option>
					<option value="" >护士</option>
				</select>
				
			</tr>
			<tr>
				<td class="tdkey">学历：</td>
				<td class="tdval">
				<select name="education" id="education" >
					<option selected="selected">请选择学历</option>
					<option value="">博士</option>
					<option value="">硕士</option>
					<option value="">本科</option>
					<option >专科</option>
				</select>
				
			</tr>
			<tr>
				<td class="tdkey">手机号：</td>
				<td class="tdval"><input name="tel" id="tel" placeholder="请输入手机号"  /></td>
			</tr>
			<!-- <tr>
				<td class="tdkey">年龄：</td>
				<td class="tdval">
				<input id="birthday" size="16" type="text" placeholder="选择出生日期" readonly>
				</td>
			</tr> -->
			
			<tr>
				<td class="tdkey">邮箱地址：</td>
				<td class="tdval"><input id="email" name="email" placeholder="请输入邮箱地址"  /></td>
			</tr>
			<tr>
				<td class="tdkey">医师资格编码：</td>
				<td class="tdval"><input id="doctorNum" name="doctorNum" placeholder="请输入医师资格证"  /></td>
			</tr>
			
		</table>
		<div class="content-padded">
	      <a class="btn btn-primary btn-block" id="reg">注册</a>
	    </div> 
 		</div>
 	</div>
 	
  </body>
  <script type="text/javascript" src="weixin/hy/js/register.js"> </script>
</html>
