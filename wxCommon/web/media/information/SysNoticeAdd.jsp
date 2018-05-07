<%@page language="java" pageEncoding="UTF-8"%>
<!DOCTYPE html>

 <html lang="en">
<head>
	<meta charset="utf-8" />
 	<jsp:include page="../media.jsp"></jsp:include>
 	<script type="text/javascript" src="media/media/datepicker/WdatePicker.js"></script>
 	<script type="text/javascript" src="media/information/js/SysNoticeEdit.js"></script>
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
	<h3 class="form-section">系统公告</h3>
	<div class="row-fluid">
		<div class="span12">
	 <div class="portlet-body list mbModify">
		<form class="form-horizontal m-t" id="commentForm" novalidate="novalidate">
		  <input type="hidden" id="id" value=""/>
		  <input type="hidden" id="publicNo" name="publicNo"/>
            <div class="control-group">
             
                
            </div>
            <div class="control-group">
                <label class="control-label">公告内容：</label>
                <div class="controls">
                	<textarea id="content" name="content" class="span10 m-wrap" rows="5"></textarea>
                </div>
            </div>
            <div class="form-actions">
				<button id="modifyVal"  type="button" class="btn blue">保存</button>
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