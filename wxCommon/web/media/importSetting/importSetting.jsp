<%@page language="java" pageEncoding="UTF-8"%>
<!DOCTYPE html>
 <html lang="en">
<head>
	<meta charset="utf-8" />
 	<jsp:include page="../media.jsp"></jsp:include>
 	<script type="text/javascript" src="media/importSetting/js/importSetting.js"></script>
 </head>

<body class="page-header-fixed" >
<div class="tab-content contents">
	<h3 class="form-section">导入设置</h3>
     <div class="btn-group pull-right listsearch">
        <button id="sample_editable_1_new" class="btn blue form_button shortmin" >新增一列</button>
        <button class="btn blue form_button short" onclick="save()">保存</button>
	</div>
 <div class="portlet-body list">
 <form id="editform">
 <input type="hidden"  name="columNm" id="columNm"/>
	<table class="table table-striped tableshort" id="sample_editable_1">
           <thead>
               <tr>
                   <th colspan="3" style="height:30px;"></th>
               </tr>
           </thead>
			<tbody>
			</tbody>

       </table>
	</form>
</div>

</body>

</html>