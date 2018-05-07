<%@page language="java" pageEncoding="UTF-8"%>
<!DOCTYPE html>
 <html lang="en">
<head>
	<meta charset="utf-8" />
 	<jsp:include page="../media.jsp"></jsp:include>
 	<link href="media/media/css/bootstrap-fileupload.css" rel="stylesheet" type="text/css"/>
 	<script type="text/javascript" src="media/media/js/bootstrap-fileupload.js"></script>
	<script type="text/javascript" src="media/import/js/upload.js"></script>
	<script type="text/javascript" src="media/import/js/ajaxfileupload.js"></script>
	<!--<link href="media/import/js/jquery.loadmask.css" rel="stylesheet" type="text/css" />
		<script type="text/javascript" src="http://code.jquery.com/jquery-latest.pack.js"></script>
		<script type='text/javascript' src='media/import/js/jquery.loadmask.js'></script>
	<script type="text/javascript" src="media/import/js/loadmask.js"></script>
	-->
	<script type="text/javascript" src="media/import/js/ajaxfileupload.js"></script>
	<style>
			body{font-size:11px;font-family:tahoma;}
			#content { padding:5px;width:200px; }
			#buttons { padding-left:40px; }
		</style>
		<script>
			/**$(document).ready(function(){
				$("#upload").bind("click", function () {
					$("#content").mask("Waiting...");
				});
				
				$("#upload").bind("click", function () {
					$("#content").unmask();
				});
			});*/
		</script>
</head>

<body class="page-header-fixed" >
<div class="tab-content contents" >
	<h3 class="form-section">Excel导入</h3>
	<div class="btn-group listsearch" >
		<div class="fileupload fileupload-new" data-provides="fileupload" style="display:inline-block">
	<form id="formSubmit" method="post" enctype="multipart/form-data">
		<div class="input-append"  >
			<div class="uneditable-input">
				<i class="icon-file fileupload-exists"></i> 
				<span class="fileupload-preview"></span>
			</div>
			<span class="btn btn-file">
			<span class="fileupload-new">选择</span>
			<span class="fileupload-exists">选择</span>
			<input type="file" class="default" id="fileName"  name="uploadFile"/>
			</span>
			<a href="#" class="btn fileupload-exists" data-dismiss="fileupload">取消</a>
		</div>
    </form>
	</div>
     <button class="btn blue form_button" id="upload"  style="display:inline-block;margin-bottom:10px;">导入</button><%--
     <button  class="btn blue form_button" id="okButton" style="display:inline-block;margin-bottom:10px;" >导入数据确认</button>
     --%><!--
     <button class="btn blue form_button" id="export"  style="display:inline-block;margin-bottom:10px;">导出</button>
     --></div>
     <div style="display:inline-block;margin-left:280px;">共导入成功<font color="#001EFF"><span id="gh">0</span></font>笔资产信息,失败<font color="red"><span id="fa">0</span></font>笔</div>
     <div class="btn-group pull-right listsearch"><!--
        <button class="btn blue form_button short">删除</button>
        -->
	</div>
 <div  >
	<!--<table class="table table-striped tableshort">
           <thead>
               <tr>
                   <th style="width:5%"><input id="queryCheckbox" name ="queryCheckbox" type="checkbox" value=""></th>
                   <th style="width:10%">资产编码</th>
                   <th style="width:10%">固资名称</th>
                   <th style="width:10%">制造厂商</th>
                   <th style="width:10%">规格型号</th>
                   <th style="width:10%">原值(总价)</th>
                   <th style="width:17%">保管部门</th>
                   <th style="width:10%">入库日期</th>
                   <th style="width:10%">分类名称</th>
                   <th style="width:8%">资产来源</th>
                   
                   
               </tr>
           </thead>
			<tbody>
			<tr>
				<td><input id="queryCheckbox" name ="queryCheckbox" type="checkbox" value=""></td>
				<td>20030502</td>
				<td>联想计算机 </td>
				<td>联系</td>
				<td>M6100T</td>
				<td>4892.31</td>
				<td>科技部（研究院）</td>
				<td>2011-07-01</td>
				<td>生产管理用工 器具\电子设备</td>
				<td>研究院</td>
			</tr>
			<tr>
				<td><input id="queryCheckbox" name ="queryCheckbox" type="checkbox" value=""></td>
				<td>20030502</td>
				<td>联想计算机 </td>
				<td>联系</td>
				<td>M6100T</td>
				<td>4892.31</td>
				<td>科技部（研究院）</td>
				<td>2011-07-01</td>
				<td>生产管理用工 器具\电子设备</td>
				<td>研究院</td>
			</tr>
			</tbody>

       </table>
	--></div>
</div>
</body>
<script>

		jQuery(document).ready(function() {    

		   // initiate layout and plugins

		   App.init();

		   FormSamples.init();

		});

	</script>

</html>