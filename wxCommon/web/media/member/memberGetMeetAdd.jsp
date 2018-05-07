<%@page language="java" pageEncoding="UTF-8"%>
<!DOCTYPE html>
 <html lang="en">
<head>
	<meta charset="utf-8" />
 	<jsp:include page="../media.jsp"></jsp:include>
 	<script type="text/javascript" src="media/media/datepicker/WdatePicker.js"></script>
 	<script type="text/javascript" src="media/js/pageMedia.js"></script>
 	<script type="text/javascript" src="media/member/js/memberGetMeetAdd.js"></script>
 	<script type="text/javascript" src="media/js/uuid.js"></script>
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
 		
 		ul li{
 			margin-bottom:10px;
 		}
 	</style>
 </head>

<body class="page-header-fixed" >
<div class="tab-content contents"> 
	<h3 class="form-section">会议人员管理</h3>
	<div class="row-fluid">
		
	 <div class="portlet-body list mbModify">
		<form class="form-horizontal m-t" id="commentForm" novalidate="novalidate">
            <div class="control-group">
                <label class="control-label">会议ID：</label>
                <div class="controls">
                    <input id="onlineNo" minlength="2" type="text" class="form-control" required="" aria-required="true">
                </div>
            </div>
           </form>
          </div>
          </div>
          <div class="row-fluid">
             <div class="control-group">
         	
               <div class="span6">
               <label class="control-label">选择参与人员：</label>
               <div class="btn-group listsearch horizontal">
               <input id="name" type="text" placeholder="按会员姓名查询"/>
               <input id="tel" type="text" placeholder="按手机号查询"/>
               <button id="searchList" class="btn blue form_button short">查询</button>
	     	</div>
               <div class="portlet-body list">
				<table class="table table-striped tableshort" id="listtable2">
	           <thead>
	               <tr>
	                   <th style="width:20%;">姓名</th>
	                   <th style="width:20%;">所在医院</th>
	                   <th style="width:20%;">手机号</th>
	                   <th style="width:20%;">操作</th>
						</tr>
	           </thead>
				<tbody id="qkList1">
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
            
              <div class="span6">
               <label class="control-label">已选择的参与人员：</label>
               <div class="portlet-body list">
				<table class="table table-striped tableshort" id="listtable1">
	           <thead>
	               <tr>
	                   <th style="width:20%;">姓名</th>
	                   <th style="width:20%;">所在医院</th>
	                   <th style="width:20%;">手机号</th>
	                   <th style="width:20%;">操作</th>
						</tr>
	           </thead>
				<tbody id="qkList2">
				</tbody>
	       </table>
             </div>
              </div>
               </div>
       
       
	      
		</div>
		     
         <div class="form-actions" style="text-align: center">
				<button id="modifyVal" type="button" class="btn blue">保存</button>
		</div>
		
	</div>
			
</body>
<script type="text/javascript">
 App.init();

</script>
</html>