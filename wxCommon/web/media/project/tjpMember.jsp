<%@page language="java" pageEncoding="UTF-8"%>
<!DOCTYPE html>
 <html lang="en">
<head>
	<meta charset="utf-8" />
 	<jsp:include page="../media.jsp"></jsp:include>
 	<script type="text/javascript" src="media/js/pageMedia.js"></script>
 </head>

<body class="page-header-fixed" >
<div class="tab-content contents"> 
	<h3 class="form-section">项目人员工时统计</h3>
	<div class="row-fluid">
		<div class="span12">
	 <div class="portlet-body list">
		<table class="table table-striped tableshort" id="listtable">
	           <thead>
	               <tr>
	                   <th style="width:50%;">姓名</th>
	                   <th style="width:50%;">总工时</th>
	               </tr>
	           </thead>
				<tbody id="qkList">
				<tr>
					<td colspan="10">暂无数据</td>
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
		var pid=GetQueryString("pid");
		var sel=$.Params.create();
		sel.addParams("pid",pid);
	   	sel.ajax(getIP()+"time.action?projectMembertj",function(data){
	   		if(data.success){
	   		var html;
	   			$.each(data.rows,function(i,val){
	   				var times=val.time;
	   				if(times == null){
	   					times=0;
	   				}
						html+="<tr>" +
								"<td>"+val.name+"</td>" +
								"<td>"+parseFloat(times).toFixed(1)+"</td></tr>";
					})
				$("table tbody").html(html);
	   		}else{
	   			alert(data.msg);
	   		}
	   		
	   	});
</script>
</html>