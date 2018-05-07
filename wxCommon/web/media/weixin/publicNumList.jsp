<%@page language="java" pageEncoding="UTF-8"%>
<!DOCTYPE html>
 <html lang="en">
<head>
	<meta charset="utf-8" />
 	<jsp:include page="../media.jsp"></jsp:include>
 	<script type="text/javascript" src="media/media/datepicker/WdatePicker.js"></script>
 	<script src="media/js/pageMedia.js"></script>
 	<script type="text/javascript" src="media/weixin/js/publicNumList.js"></script>
 	<style type="text/css">
 	input[class*="span"].m-wrap.inputsearch.data{padding:0px !important;padding-left:8px !important;border-radius:5px !important;background:#cccccc;}
 	</style>
 </head>

<body class="page-header-fixed" >
<div class="tab-content contents"> 
	<h3 class="form-section">公众号管理</h3>
	<div class="btn-group listsearch horizontal">
	<select class="selectshort" id="publicType">
            <option value="1" selected="selected">认证的服务号</option>
            <option value="2">未认证的服务号</option>
            <option value="3">认证的订阅号</option>
             <option value="4">未认证的订阅号</option>
        </select>
       
     </div>
     <div class="btn-group pull-right listsearch">
      <button id="addbutton" class="btn blue form_button short">添加</button>
        <button id="delbutton" class="btn blue form_button short">删除</button>
	</div>
 <div class="portlet-body list">
	<table class="table table-striped tableshort" id="listtable">
           <thead>
               <tr>
                   <th style="width:10px;"><input type="checkbox"  id="queryCheckbox" name ="queryCheckbox" value=""></th>
                   <th style="width:10px;">ID</th>
                   <th style="width:20px;">公众号名称</th>
                   <th style="width:15px;">查看粉丝</th>
                   <th style="width:10px;">素材管理</th>
                   <th style="width:20px;">群发消息</th>
                   <th style="width:10px;">自定义菜单</th>
                   <th style="width:10px;">自动回复</th>
                   <th style="width:15px;">操作</th>
               </tr>
           </thead>
			<tbody id="qkList">
			<tr>
				<td colspan="4">暂无数据</td>
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

</body>
<script type="text/javascript">
 App.init();
</script>
</html>