<%@page language="java" pageEncoding="UTF-8"%>
<!DOCTYPE html>
 <html lang="en">
<head>
	<meta charset="utf-8" />
 	<jsp:include page="../media.jsp"></jsp:include>
  <script type="text/javascript" src="media/print/js/labelPrintEdit.js"></script>
  <style type="text/css">
  .row-fluid [class*="span"] {
	display: block;
	float: left;
	width: 100%;
	min-height: 30px;
	margin-right:30px;
	margin-top:10px;
	-webkit-box-sizing: border-box;
	-moz-box-sizing: border-box;
	box-sizing: border-box;
	}
	.row-fluid [class*="span"]:first-child {
	}
	.row-fluid .span7.print {
	background-color: #fff;
	border-radius: 10px !important;
	}
	
.row-fluid .span7 {
width: 480px;;
}
	.span7 {
width: 460px;
}
div {
display: block;
}
[class*="span"] {
float: left;
min-height: 1px;
margin-left: 0px;
}
.row-fluid .span7.print table tr:first-child {
 border-bottom: 3px solid #02534A; 
}
.row-fluid .span7.print table tr:last-child {
border-top: 3px solid #02534A;
}
</style>
 </head>

<body class="page-header-fixed" >
<div class="tab-content contents">
	<h3 class="form-section">标签打印 </h3>
	<div style="display:inline-block;margin-left:780px;line-height:30px;">共打印<font color="#001EFF"><span id="line">1</span></font>份标签</div>
     <div class="btn-group pull-right listsearch">
     	<button class="btn blue form_button short" id="print" style="margin-right:15px;">打印</button>
     	<button class="btn blue form_button short" id="fanhui" style="margin-right:15px;">返回</button>
	</div>
 <div class="portlet-body" style="background-color:#F4F4F4">
 <form id="editform" action="#" class="form-horizontal">
 <div class="row-fluid" id="printDiv">

       
	</div>
	</from>
	</div>
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