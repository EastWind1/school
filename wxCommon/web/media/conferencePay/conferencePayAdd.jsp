<%@page language="java" pageEncoding="UTF-8"%>
<!DOCTYPE html>
 <html lang="en">
<head>
	<meta charset="utf-8" />
 	<jsp:include page="../media.jsp"></jsp:include>
 	<script type="text/javascript" src="media/media/datepicker/WdatePicker.js"></script>
 	<script type="text/javascript" src="media/conferencePay/js/conferencePayAdd.js"></script>
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
	<h3 class="form-section">会议支付管理</h3>
	<div class="row-fluid">
		<div class="span12">
	 <div class="portlet-body list mbModify">
		<form class="form-horizontal m-t" id="commentForm" novalidate="novalidate">
           <div class="control-group">
                <label class="control-label">标题：</label>
                <div class="controls">
                    <textarea id="title"  minlength="2" type="text" class="form-control" required="" aria-required="true"></textarea>
                </div>
            </div>
            <div class="control-group" >
                <label class="control-label">医生缴费金额：</label>
                <div class="controls">
                    <input id="doctorPay"  minlength="2" type="text" class="form-control" required="" aria-required="true">元
                </div>
            </div>
            <div class="control-group" >
               <label class="control-label">护士缴费金额：</label>
                <div class="controls">
                    <input id="nursePay"  minlength="2" type="text" class="form-control" required="" aria-required="true">元
                </div>
            </div>
            <div class="control-group" >
                <label class="control-label">学生缴费金额：</label>
                <div class="controls">
                    <input id="studentPay"  minlength="2" type="text" class="form-control" required="" aria-required="true">元
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