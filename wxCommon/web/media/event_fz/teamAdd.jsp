<%@page language="java" pageEncoding="UTF-8"%>
<!DOCTYPE html>
 <html lang="en">
<head>
	<meta charset="utf-8" />
 	<jsp:include page="../media.jsp"></jsp:include>
 	<script type="text/javascript" src="media/media/datepicker/WdatePicker.js"></script>
 	<script type="text/javascript" src="media/event_fz/js/teamAdd.js"></script>
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
	<h3 class="form-section">分组小队管理</h3>
	<div class="row-fluid">
		<div class="span12">
	 <div class="portlet-body list mbModify">
		<form class="form-horizontal m-t" id="commentForm" method="post" novalidate="novalidate" enctype="multipart/form-data" >
		<input type="hidden" id="groupId" name="groupId"/>
			 <div class="control-group">
				<label class="control-label">图像</label>
				<div class="controls">
					<!--<input type="file" id="headImg" name="headImg" />-->
					 <div class="fileupload fileupload-new" data-provides="fileupload">
						<div class="fileupload-new thumbnail" style="width: 200px; height: 150px;">
							<img src="" alt="" />
						</div>
						<div class="fileupload-preview fileupload-exists thumbnail" style="max-width: 200px; max-height: 150px; line-height: 20px;"></div>
						<div>
						<textarea id="imageStr" name='image' style="display:none"></textarea>
							<span class="btn btn-file"><span class="fileupload-new">请选择照片</span>
							<span class="fileupload-exists">重新选择</span>
							<input type="file" class="default" id="headImgs" name="headImgs" />
							</span>
							<a href="#" class="btn fileupload-exists" data-dismiss="fileupload">删除</a>
						</div>
					</div> 
				</div>

			</div>
		
		<div class="control-group">
                <label class="control-label">分组名称：</label>
                <div class="controls">
                    <select id="group" name="groupName">
                    
                    </select>
                </div>
            </div>
		 <div class="control-group">
                <label class="control-label">所在单位：</label>
                <div class="controls">
                    <input id="hospitalName" name="hospitalName" minlength="2" type="text" class="form-control" required="" aria-required="true">
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