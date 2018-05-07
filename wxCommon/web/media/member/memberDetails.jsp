<%@page language="java" pageEncoding="UTF-8"%>
<!DOCTYPE html>
 <html lang="en">
<head>
	<meta charset="utf-8" />
 	<jsp:include page="../media.jsp"></jsp:include>
 	<script type="text/javascript" src="media/media/datepicker/WdatePicker.js"></script>
 	<script type="text/javascript" src="media/member/js/memberDetail.js"></script>
 	<link href="media/media/css/bootstrap-fileupload.css" rel="stylesheet" type="text/css"/>
 	<script type="text/javascript" src="media/media/js/bootstrap-fileupload.js"></script>
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
                   <label id="name" class="form-control" ></label>
                </div>
            </div>
            <div class="control-group">
                <label class="control-label">电话：</label>
                <div class="controls">
                 <label id="tel" class="form-control" ></label>
                </div>
            </div>
            <div class="control-group">
                <label class="control-label">年龄：</label>
                <div class="controls">
                	  <label id="age" class="form-control" ></label>
                </div>
            </div>
            <div class="control-group">
                <label class="control-label">邮箱：</label>
                <div class="controls">
                	<label id="email" class="form-control" ></label>
                </div>
            </div>
            <div class="control-group">
                <label class="control-label">性别：</label>
                <div class="controls">
                	<label class="radio"><input id="sex" type="radio" name="sex" value="1" checked/>男</label>
					<label class="radio"><input id="sex" type="radio" name="sex" value="2"  />女</label> 
                </div>
            </div>
            <div class="control-group">
                <label class="control-label">医院：</label>
                <div class="controls">
                	<label id="hospitalName" class="form-control" ></label>
                </div>
            </div>
            <div class="control-group">
                <label class="control-label">科室：</label>
                <div class="controls">
                	<label id="hospitalOffices" class="form-control" ></label>
                </div>
            </div>
            <div class="control-group">
                <label class="control-label">职称：</label>
                <div class="controls">
                	<label id="jobTitle" class="form-control" ></label>
                </div>
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