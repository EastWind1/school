<%@page language="java" pageEncoding="UTF-8"%>
<!DOCTYPE html>
 <html lang="en">
<head>
	<meta charset="utf-8" />
 	<jsp:include page="../media.jsp"></jsp:include>
 	<script type="text/javascript" src="media/media/datepicker/WdatePicker.js"></script>
 	<script type="text/javascript" src="media/meetId/js/meetIdAdd.js"></script>
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
	<h3 class="form-section">会议ID管理</h3>
	<div class="row-fluid">
		<div class="span12">
	 <div class="portlet-body list mbModify">
		<form class="form-horizontal m-t" id="commentForm" novalidate="novalidate">
            <div class="control-group">
                <label class="control-label">登录账号：</label>
                <div class="controls">
                    <input id="loginName" minlength="2" type="text" class="form-control" required="" aria-required="true">
                </div>
            </div>
            <div class="control-group">
                <label class="control-label">密码：</label>
                <div class="controls">
                	<input id="password" minlength="2" type="text" class="form-control" required="" aria-required="true">
                </div>
            </div>
           <div class="control-group">
                <label class="control-label">会议ID：</label>
                <div class="controls">
                	<input id="onlineNo" minlength="2" type="text" class="form-control" required="" aria-required="true">
                </div>
            </div>
              <div class="control-group">
                <label class="control-label">容量：</label>
                <div class="controls">
                	<input id="capacity" minlength="2" type="text" class="form-control" required="" aria-required="true">
                </div>
            </div>
            <div class="control-group">
                <label class="control-label">备注：</label>
                <div class="controls">
                	<textarea id="remark" minlength="2" type="text" class="form-control" required="" aria-required="true"></textarea>
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