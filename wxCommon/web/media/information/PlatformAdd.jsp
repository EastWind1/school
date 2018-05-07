<%@page language="java" pageEncoding="UTF-8"%>
<!DOCTYPE html>

 <html lang="en">
<head>
	<meta charset="utf-8" />
 	<jsp:include page="../media.jsp"></jsp:include>
 	<script type="text/javascript" src="media/media/datepicker/WdatePicker.js"></script>
 	<script type="text/javascript" src="media/information/js/PlatformAdd.js"></script>
 	<link href="media/media/css/bootstrap-fileupload.css" rel="stylesheet" type="text/css"/>
 	<script type="text/javascript" src="media/media/js/bootstrap-fileupload.js"></script>
 	<style>
 		#platform{
 		 width:200px		 
 		 float:left;
 		}
 	</style>
 </head>

<body class="page-header-fixed" >
<div class="tab-content contents"> 
	<h3 class="form-section">平台简介</h3>
	<div class="row-fluid">
		<div class="span12">
	 <div class="portlet-body list mbModify">
		<form class="form-horizontal m-t" id="commentForm" novalidate="novalidate">
             <div class="control-group">
                <!-- <label class="control-label">创建人：</label> -->
                <div class="controls">
                  <input type="hidden" id="id" value=""/> 
                  <input type="hidden" id="platformuser" name="platformuser"  />
                </div>
            </div> 
       <!--     <div class="control-group">
                <label class="control-label">创建时间：</label>
                <div class="controls">
                 <input type="text" id="platformtime" name="platformtime"  />
                </div>
            </div>  -->
            <div class="control-froup">
            	<label class="cntrol-label">平台简介:</label>
                <div calss="controls">
                	<textarea id="platform" name="platform" class="span10 m-wrap" rows="5" onblur="f1()"></textarea>
                	<span id="platform1" style="color:red"></span>
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