<%@page language="java" pageEncoding="UTF-8"%>
<!DOCTYPE html>
 <html lang="en">
<head>
	<meta charset="utf-8" />
 	<jsp:include page="../media.jsp"></jsp:include>
 	<script type="text/javascript" src="media/media/datepicker/WdatePicker.js"></script>
 	<script type="text/javascript" src="media/member/js/memberAdd.js"></script>
 	<script type="text/javascript" src="js/city.js"></script>
 	<style>
 		li{ list-style: none;}
 		.courseDbDetails{
 			width: 100%;
 			height: 100%;
 		}
 		
 		.courseDbDetails_data li{
 			height: 40px;
 			line-height: 40px;
 			background-color:#CACAD2;
 			margin-bottom:10px;
 		}
 		/*字段名*/
 		.courseDbDetails_data .courseDbDetails_field{
 			width: 10%;
 			height: 100%;
 			padding-right:10px;
 			line-height:40px;
 			text-align:right;
 			float: left;
 			display: block;
 		}
 		/*字段值*/
 		.courseDbDetails_data .courseDbDetails_fieldValue{
 			width: 20%;
 			height: 100%;
 			text-align: left;
 			float:left;
 			display: block;
 		}
 	</style>
 </head>

<body class="page-header-fixed" >
<div class="tab-content contents"> 
	<h3 class="form-section">会员管理</h3>
	<div class="row-fluid">
		<div class="span12">
	 <div class="portlet-body list mbModify">
		<form class="form-horizontal m-t" id="commentForm" novalidate="novalidate">
            <div class="control-group">
                <label class="control-label">姓名：</label>
                <div class="controls">
                    <input id="name" minlength="2" type="text" class="form-control" required="" aria-required="true">
                </div>
            </div>
            <div class="control-group">
                <label class="control-label">性别：</label>
                <div class="controls">
                	<label class="radio"><input id="sex" type="radio" name="sex" value="1" />男</label>
					<label class="radio"><input id="sex" type="radio" name="sex" value="2" />女</label> 
                </div>
            </div> 
             <div class="control-group">
                <label class="control-label">手机号：</label>
                <div class="controls">
                	<input id="tel" minlength="2" type="text" class="form-control" required="" aria-required="true">
                </div>
            </div>
             <div class="control-group">
                <label class="control-label">邮箱：</label>
                <div class="controls">
                	<input type="text"  id="email" />
                </div>
            </div>
            <div class="control-group">
                <label class="control-label">所在省：</label>
                <div class="controls">
                    <select id="province" minlength="2"  class="form-control" required="" aria-required="true">
                    
                    </select>
                </div>
            </div>
            <div class="control-group">
                <label class="control-label">所在市：</label>
                <div class="controls">
                    <select id="city" minlength="2"  class="form-control" required="" aria-required="true">
                    
                    </select>
                </div>
            </div>
              <div class="control-group">
                <label class="control-label">所在医院：</label>
                <div class="controls">
                    <select id="hospitalName" minlength="2"  class="form-control" required="" aria-required="true">
                    
                    </select>
                     <input id="searchHospital" style="width:200px;right:41px;background-color:rgba(255, 255, 255, 0);box-shadow:none;display:none;" type="text" placeholder="请输入医院" />
                </div>
            </div> 
          <div class="control-group">
                <label class="control-label">科室：</label>
                <div class="controls">
                	<select id="hospitalOffices" >
                		<option>请选择科室</option>
						<option>ICU</option>
						<option>PICU</option>
						<option>急诊科</option>
						<option>急诊ICU</option>
						<option>呼吸科</option>
						<option>麻醉科</option>
						<option>儿科</option>
						<option>产科</option>
						<option>外科</option>
						<option value="其他" >其他</option>
                	</select>
                	<input id="searchOffice" style="width:200px;right:41px;background-color:rgba(255, 255, 255, 0);box-shadow:none;display:none;" type="text" placeholder="请输入科室" />
                </div>
            </div>
            <div class="control-group">
                <label class="control-label">职称：</label>
                <div class="controls">
                	<select id="jobTitle">
                		<option>请选择职称</option>
						<option>主任医师</option>
						<option>副主任医师</option>
						<option>主治医师</option>
						<option>住院医师</option>
						<option>学生</option>
						<option>主任护师</option>
						<option>副主任护师</option>
						<option>主管护师</option>
						<option>护师</option>
						<option value="其他" >其他</option>
                	</select>
                	<input id="searchJobtitle" style="width:200px;right:41px;background-color:rgba(255, 255, 255, 0);box-shadow:none;display:none;" type="text" placeholder="请输入职称" />
                </div>
            </div>
             <div class="control-group">
                <label class="control-label">职务：</label>
                <div class="controls">
                	<select id="post">
                		<option>请选择职务</option>
						<option>院长</option>
						<option>副院长</option>
						<option>科室主任</option>
						<option>科室副主任</option>
						<option>带组组长</option>
						<option>医生</option>
						<option>护士长</option>
						<option>护士</option>
						<option value="其他" >其他</option>
                	</select>
                	<input id="searchPost" style="width:200px;right:41px;background-color:rgba(255, 255, 255, 0);box-shadow:none;display:none;" type="text" placeholder="请输入职务" />
                </div>
            </div>
              <div class="control-group">
                <label class="control-label">网站和app登录密码：</label>
                <div class="controls">
                	<input id="filed1" minlength="2" type="text" class="form-control" required="" aria-required="true">
                </div>
            </div>
            <div class="form-actions">
				<button id="modifyVal" type="button" class="btn blue">保存</button>
			</div>
         </form>
	      
		</div>
		</div>
	</div>
</div>

</body>
<script type="text/javascript">
 App.init();

</script>
</html>