<%@page language="java" pageEncoding="UTF-8"%>
<!DOCTYPE html>
 <html lang="en">
<head>
	<meta charset="utf-8" />
 	<jsp:include page="../media.jsp"></jsp:include>
 	<script type="text/javascript" src="media/media/datepicker/WdatePicker.js"></script>
 	<script src="media/js/pageMedia.js"></script>
 	<script type="text/javascript" src="media/log/js/loginLogList.js"></script>
 </head>
<body>
	<input type="button" name="search" id="search" value="查询" />
	<table>
		<thead>
			<tr>
				<th>[]</th>
				<th>姓名</th>
				<th>电话</th>
				<th>性别</th>
				<th>年龄</th>
				<th>邮箱</th>
				<th>科室</th>
				<th>职称</th>
				<th>医院</th>
				<th>操作</th>
			</tr>
		</thead>
		<tbody>
			<tr>
				<td>[]</td>
				<td>aiyoufu</td>
			</tr>
		</tbody>
	</table>
</body>
<script type="text/javascript">
var sel=$.Params.create();
$(function(){
 	
  $("#search").on("click",function(){
  	getData();
  })
  function getData(){
	   	sel.addParams("page",0);
	   	sel.addParams("rows",rows);
	   	getPageData(sel,getIP()+"logLogin.action?listLogLogin",function(data){
	   		if(data.success){
	   			var len=data.total;
		   		var html="";
				if(len >0){
					$.each(data.rows,function(i,val){
						var type;
						if(val.type == 1){
							type="服务端";
						}else{
							type="移动端";
						}
						html+="<tr>" +
								"<td>[]</td>" +
								"<td>"+val.name+"</td>" +
								"<td>"+val.tel+"</td>" +
								"<td>"+val.sex+"</td>" +
								"<td>"+val.birthday+"</td>" +
								"<td>"+val.email+"</td>" +
								"<td>"+val.hospitalOffices+"</td>" +
								"<td>"+val.jobTitle+"</td>" +
								"<td>"+val.hospitaoName+"</td></tr>";
					})
				}else{
					html="<tr><td colspan='4'>暂无数据</td></tr>";
				}
				$("table tbody").html(html);
				App.init();
	   		}else{
	   			alert(data.msg);
	   		}
	   		
	   	});
	}
   });
</script>
</html>