<%@page language="java" pageEncoding="UTF-8"%>
<!DOCTYPE html>
 <html lang="en">
<head>
	<meta charset="utf-8" />
 	<jsp:include page="../media.jsp"></jsp:include>
 	<script src="media/media/js/jquery.fancybox.pack.js"></script>   
	<script type="text/javascript" src="media/media/js/chosen.jquery.min.js"></script>
 	<script type="text/javascript" src="media/media/datepicker/WdatePicker.js"></script>
 	<script type="text/javascript" src="media/js/pageMedia.js"></script>
 	<script type="text/javascript" src="media/member/js/memberCheckList.js"></script>
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
	<h3 class="form-section">会员认证管理</h3>
	<div class="row-fluid">
		<div class="span12">
		 	<div class="btn-group listsearch horizontal">
			<input id="userName" class="m-wrap span12 inputsearch" type="text" placeholder="请输入姓名" />
			<input id="tel" class="m-wrap span12 inputsearch" type="text" placeholder="请输入手机号" />
	   		<!--<select id="filed3">
	   			<option value="3" selected="selected">请选择审核状态</option>
	   			<option value="0">未审核</option>
	   			<option value="1">通过</option>
	   			<option value="2">未通过</option>
	   		</select>-->
	        <button id="searchList" class="btn blue form_button short">查询</button>
	     </div> 
	     <div class="btn-group pull-right listsearch">
	      <!-- <button id="delbutton" class="btn blue form_button short">删除</button> -->
		</div>
	 <div class="portlet-body list">
		<table class="table table-striped tableshort" id="listtable">
	           <thead>
	               <tr>
	                   <th style="width:5%;"><input type="checkbox"  id="queryCheckbox"  name="queryCheckbox" value=""></th>
	                   <th style="width:10%;">姓名</th>
	                   <th style="width:10%;">电话</th>
	                   <th style="width:10%;">所在医院</th>
	                   <th style="width:10%;">科室</th>
	                   <th style="width:10%;">职称</th>
	                   <th style="width:15%;">证件缩略图</th>
	                   <th style="width:10%;">状态</th>
	                   <th style="width:20%;">操作</th>
	               </tr>
	           </thead>
				<tbody id="qkList">
				<tr>
					<td colspan="9">暂无数据</td>
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
<input id="pkid" type="hidden" class="span12 m-wrap">
<div class="tab-content contents modal hide fade" id="renzheng" > 
	<h3 class="form-section">认证图片</h3>
		<div id="renzhengtp">
		
		</div>
		<div class="modal-footer">
		<button type="button" data-dismiss="modal" class="btn">关闭</button>
	</div>
</div>
<div id="responsive" class="modal hide fade" tabindex="-1" data-width="760">
	<div class="modal-header">
		<button type="button" class="close" data-dismiss="modal" aria-hidden="true"></button>
		<h3>会员认证管理</h3>
	</div>
	<div class="modal-body">
		<div class="row-fluid">
			<div class="span12" id="span12">
			
			     
			</div>
		</div>
	</div>
	<div class="modal-footer">
		<button type="button" data-dismiss="modal" class="btn">取消</button>
		<button id="pmenuAddButton" type="button" class="btn blue">保存</button>
	</div>
</div>
</body>
<script type="text/javascript">
 App.init();
</script>
</html>