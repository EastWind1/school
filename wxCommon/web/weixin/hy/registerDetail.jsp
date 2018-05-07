<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<!DOCTYPE>
<html>
  <head>
	<title>我的信息</title>
	<jsp:include page="../common.jsp"></jsp:include>
	<link href="common/mobiscroll/css/mobiscroll.custom-2.6.2.min.css" rel="stylesheet" type="text/css" />
	<script src="common/mobiscroll/js/mobiscroll.custom-2.6.2.min.js" type="text/javascript"></script>
	<script src="js/city.js" type="text/javascript"></script>
	<script type="text/javascript" src="weixin/hy/js/registerDetail.js"></script>
		<script type="text/javascript">
	$(function() {
		var opt = {};
		opt.date = {
			preset : 'date',
			//   minDate : new Date(2014, 7, 10),
			maxDate : new Date()
		};
		opt.datetime = {
			preset : 'datetime',
			minDate : new Date(2012, 3, 10, 9, 22),
			maxDate : new Date(2014, 7, 30, 15, 44),
			stepMinute : 5
		//分钟间隔
		};
		opt.time = {
			preset : 'time',
			minDate : new Date(2012, 3, 10, 9, 22),
			maxDate : new Date(2012, 3, 10, 15, 44),
			stepMinute : 2
		//分钟间隔
		};

		$('#birthday').scroller('destroy').scroller($.extend(opt['date'], {
			theme : 'default',//主题
			mode : 'scroller',
			display : 'bottom',//显示位置
			dateOrder : 'yymmdd',//显示格式
			lang : 'zh',//显示语言
			dateFormat: 'yy-mm-dd' // 日期格式
		}));

	});
</script>
  </head>
  
  <body>
    <div class="content">
    <div class="card nonemagin">
    	<img class="bannerimg" src="weixin/images/zc_banner.png">
    </div>
		<div class="card cardmagin">
		<table class="reg">
			<!--  <tr>
				<td class="tdkey">会员类型：</td>
				<td class="tdval icon1_0" id="type"></td>
			</tr>-->
			<tr>
				<td class="tdkey">所在省份：</td>
				<td class="tdval">
					<select name="province" id="province" style="hidden">
						
					</select>
				</td>
			</tr>
			<tr>
				<td class="tdkey">所在城市：</td>
				<td class="tdval">
					<select name="city" id="city" >
						
					</select>
				</td>
			</tr>
			<tr>
				<td class="tdkey">所在医院：</td>
				<td class="tdval">
				<select name="hospitalName" id="hospitalName" >
						<option selected="selected">请选择医院</option>
						<option >北京医院</option>
					</select>
				<!-- <input name="hospital_name" placeholder="请输入医院名称(汉字)"  /></td> -->
			</tr>
			<tr>
				<td class="tdkey">所在科室：</td>
				<td class="tdval">
				<select name="hospitalOffices" id="hospitalOffices" >
					<option selected="selected">请选择科室</option>
					<option value="ICU">ICU</option>
					<option value="PICU">PICU</option>
					<option value="急诊科">急诊科</option>
					<option value="急诊ICU">急诊ICU</option>
					<option value="呼吸科">呼吸科</option>
					<option value="麻醉科">麻醉科</option>
					<option value="儿科">儿科</option>
					<option value="产科">产科</option>
					<option value="外科">外科</option>
				</select>
				</td>
			</tr>
			<tr>
				<td class="tdkey">姓名：</td>
				<td class="tdval"><input name="name" id="name" placeholder="请输入姓名"  /></td>
			</tr>
			<tr>
				<td class="tdkey">性别：</td>
				<td class="tdval icon1_0" id="sex"><img sex="1" src="weixin/images/sex0.png"> 男   <img sex="2" src="weixin/images/sex0.png"> 女</td>
			</tr>
			<tr>
				<td class="tdkey">职称：</td>
				<td class="tdval">
				<select name="jobTitle" id="jobTitle" >
					<option selected="selected">请选择职称</option>
					<option value="主任医师">主任医师</option>
					<option value="副主任医师">副主任医师</option>
					<option value="主治医师">主治医师</option>
					<option value="住院医师">住院医师</option>
					<option value="学生">学生</option>
					<option value="主任护师">主任护师</option>
					<option value="副主任护师">副主任护师</option>
					<option value="主管护师">主管护师</option>
					<option value="护师">护师</option>
					<option value="护士">护士</option>
				</select>
				
			</tr>
			<tr>
				<td class="tdkey">职务：</td>
				<td class="tdval">
				<select name="post" id="post" >
					<option selected="selected">请选择职务</option>
					<option value="科室主任">科室主任</option>
					<option value="科室副主任">科室副主任</option>
					<option value="带组组长">带组组长</option>
					<option value="医生">医生</option>
					<option value="护士长">护士长</option>
					<option value="护士">护士</option>
				</select>
				
			</tr>
			<tr>
				<td class="tdkey">学历：</td>
				<td class="tdval">
				<select name="education" id="education" >
					<option selected="selected">请选择学历</option>
					<option value="博士">博士</option>
					<option value="硕士">硕士</option>
					<option value="本科">本科</option>
					<option  value="专科">专科</option>
				</select>
				
			</tr>
			<tr>
				<td class="tdkey">手机号：</td>
				<td class="tdval"><input name="tel" id="tel" placeholder="请输入手机号"  /></td>
			</tr>
			<!-- <tr>
				<td class="tdkey">出生日期：</td>
				<td class="tdval"><input id="birthday" size="16" type="text" placeholder="选择出生日期" readonly></td>
			</tr> -->
			
			<tr>
				<td class="tdkey">邮箱地址：</td>
				<td class="tdval"><input id="email" name="email" placeholder="请输入邮箱地址"  /></td>
			</tr>
			
			<tr>
				<td class="tdkey">医师资格编码：</td>
				<td class="tdval"><input id="doctorNum" name="doctorNum" placeholder="请输入医师资格证"  /></td>
			</tr>
			
			<tr>
				<td class="tdkey">注册时间：</td>
				<td class="tdval" id="createTime"></td>
			</tr>
		</table>
		<div class="content-padded">
	      <a class="btn btn-primary btn-block" id="reg">提交</a>
	    </div> 
 		</div>
 	</div>
 	
  </body>
  
</html>
