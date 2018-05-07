<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<!DOCTYPE>
<html>
	<head>
	<title>在线提问</title>
	<meta charset="UTF-8"/>
	<meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1,maximum-scale=1,user-scalable=no" />
	<jsp:include page="../common.jsp"></jsp:include>
	<style type="text/css">
		.nonemagin{ border: none !important;}
		.emailpage textarea{
			height: 300px;
			margin-bottom: 0;
			resize: none;
		}
		.emailpage li{ border: none;}
		.card .table-view-cell:last-child {
		    border-bottom: none !important;
		}
	</style>
  </head>
  <body>
    <div class="content">
		<div class="card nonemagin">
 			<ul class="table-view emailpage">
 				<li class="table-view-cell" style="text-align: center;">在此处输入问题</li>
 				<li class="table-view-cell"><textarea id="content" rows="" cols="" placeholder="最多输入200字"></textarea> </li>
 			</ul>
 		</div>
 		<div class="content-padded">
	    	<a class="btn btn-primary btn-block" id="addQuestion">提交</a>
		</div> 
 	</div>
  </body>

  	<script type="text/javascript">
	  	$(function(){
  			var ztTile_id=GetQueryString("eid");
  			alert(openId);
  			$("#addQuestion").on("click",function(){
  				var content=$("#content").val();
  				if(content==''){
  	  				alert("提问内容不能为空");
  					return false;
  				}
  				var experName="";
 				if(ztTile_id=="zt_69"){
	  	  			experName="李培军教授、王春亭教授";
	  	  		}else if(ztTile_id=="zt_70"){
	  	  			experName="李培军教授、王春亭教授";
	  	  		}else if(ztTile_id=="zt_71"){
	  	  			experName="John P. Kress";
	  	  		}else if(ztTile_id=="zt_72"){
	  	  			experName="李双玲教授";
	  	  		}
				
  				var add=$.Params.create();
  				
			    add.addParams("openId",openId); 
			    add.addParams("titleId",ztTile_id);
			    add.addParams("question",content);
			    add.addParams("filed2",experName);
			    add.ajax(getIP()+"questiontable.action?add",function(data){
					if(data.success){
						alert("提交成功！");
						$("#content").val("");
					}
				})
			})
	  	})
	</script>
</html>
