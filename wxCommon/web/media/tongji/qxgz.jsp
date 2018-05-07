<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<jsp:include page="../media.jsp"></jsp:include>
<link rel="stylesheet" href="media/media/css/DT_bootstrap.css" />
<link rel="stylesheet" href="media/media/datepicker/skin/WdatePicker.css" type="text/css">
<link rel="stylesheet" href="media/media/datepicker/skin/default/datepicker.css" type="text/css">
<div class="tab-content contents"> 
	<h3 class="form-section">取消关注人数统计</h3>
<div class="row-fluid">
<!-- 图表start -->
 <div class="span12 listleft" id="tongjiCont">
	
<!-- 统计图start -->
<div class="tbtitle">趋势图</div>
<div id="container" style="min-width:800px;height:400px;"></div>

<hr class="tongjihr" />
<!-- 表格start -->
<div class="tbtitle">详细数据</div>
<table  class="table table-striped table-bordered table-hover table-full-width" id="sample_2">
    <thead>
    <tr>
        <th>
            转发途径
        </th>
        <th>
            转发数量
        </th>
    </tr>
    </thead>
    <tbody id="tbodys">

    </tbody>
</table>
 </div>
</div>
</div>
<!-- 表格开始 -->
<script type="text/javascript" src="media/media/js/select2.min.js"></script>
<script type="text/javascript" src="media/media/js/jquery.dataTables.js"></script>
<script type="text/javascript" src="media/media/js/DT_bootstrap.js"></script>
<script src="media/js/table-advanced.js"></script>
<!-- 表格结束 -->
<script type="text/javascript" src="media/media/datepicker/WdatePicker.js"></script>
<script src="media/js/util.js"></script>
<script type="text/javascript" src="media/tongji/js/qxgz.js"></script>









