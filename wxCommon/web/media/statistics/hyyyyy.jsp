<%@page language="java" pageEncoding="UTF-8"%>
<!DOCTYPE html>
 <html lang="en">
<head>
	<meta charset="utf-8" />
 	<jsp:include page="../media.jsp"></jsp:include>
 	<script type="text/javascript" src="media/media/datepicker/WdatePicker.js"></script>
 	<script type="text/javascript" src="media/js/pageMedia.js"></script>
 	<script type="text/javascript" src="media/statistics/js/hyyyyy.js"></script>
 	<style type="text/css">
	 	#qkList .checkDetailsBtn{
	 		  width: 25%;
			  height: 26px;
			  line-height: 26px;
			  font-size:0.7rem;
			  display:inline-block;
			  cursor: pointer;
			  color: #fff;
			  background-color: #0B77BF;
			  margin: 0 2px;
		  }
 	</style>
 </head>

<body class="page-header-fixed" >
<div class="tab-content contents"> 
	<h3 class="form-section">会员预约医院统计</h3>
	<div class="row-fluid">
		<div class="span12">
			<!-- <div class="btn-group listsearch horizontal">
			<input id="name" class="m-wrap span12 inputsearch" type="text" placeholder="请输入专家姓名" />
	        <button id="searchList" class="btn blue form_button short">查询</button>
	     </div>
	     <div class="btn-group pull-right listsearch">
	    	<button id="addbutton" class="btn blue form_button short">添加</button>
	        <button id="delbutton" class="btn blue form_button short">删除</button>
		 </div> -->
	 <div class="portlet-body list">
		<table class="table table-striped tableshort" id="listtable">
	           <thead>
	               <tr>
	                  <!--  <th style="width:10%;"><input type="checkbox"  id="queryCheckbox"  name="queryCheckbox" value=""></th> -->
	                   <th style="width:50%;">医院名称</th>
	                   <th style="width:50%;">预约人数</th>
	                  <!-- <th style="width:15%;">职称</th>
	                   <th style="width:10%;">职务</th>
	                   <th style="width:15%;">所在科室</th>
	                   <th style="width:10%;">位置排序</th>
	                   <th style="width:30%;">操作</th> -->
	                  
	               </tr>
	           </thead>
				<tbody id="qkList">
				<tr>
					<td colspan="2">暂无数据</td>
				</tr>
				</tbody>
	
	       </table>
	       <div class="pagination" id="pagination">
	                    <div class="float_right padding5 paging">
	                        <div id="divFood" class="float_left padding_top4">
	                        <span float="left">每页<font id="rowscount">0</font>条/共<font id="allcount">0</font>条 第<font id="nowpage">0</font>页/共<font id="allpage">0</font>页</span>
	                        <span onclick="firstPage()" float="left" class="pagefl"><a>首页</a></span>
	                        <span onclick="prePage()" float="left" class="pagefl"><a>上一页</a></span>
	                        <span onclick="nextPage()" float="left" class="pagefl"><a>下一页</a></span>
	                        <span onclick="lastPage()" float="left" class="pagefl"><a>末页</a></span> 
	                       <!--  <span display="" float="left" class="pagefl" style="margin-right:10px;">跳转到第 <input style="width:20px;height:15px;margin-top:6px;" type="text" /> 页</span> -->
	                       <span display="" float="left" class="pagefl">跳转到第 
	                       		<select onchange="jumpPage(this)">
	                       			<option selected="selected" value="0">1</option>
	                       		</select> 页</span>
	                       
	                        </div>
	                    </div>
	                    <div class="clear"></div>
	           </div>
		</div>
		</div>
	</div>
</div>

</body>
<script type="text/javascript">
 App.init();
</script>
</html>