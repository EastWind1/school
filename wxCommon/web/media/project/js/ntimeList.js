$(function(){
	getData();
	function getData(){
		var sel=$.Params.create();
		sel.addParams("page",0);
	   	sel.addParams("rows",rows);
	   	sel.addParams("name",userName);
	   	getPageData(sel,getIP()+"ntime.action?list",function(data){
	   		if(data.success){
	   			var len=data.total;
		   		var html="";
				if(len >0){
					$.each(data.rows,function(i,val){
						html+="<tr>" +
								"<td><input id='"+val.id+"' name='checkbox' type='checkbox'></td>" +
								"<td>"+val.name+"</td>" +
								"<td>"+val.pname+"</td>" +
								"<td>"+val.time+"</td>" +
								"<td>"+val.createTime+"</td>" +
								"<td onclick='update(\""+val.id+"\",\""+val.name+"\",\""+val.time+"\",\""+val.pid+"\")'>修改</td></tr>";
					})
				}else{
					html="<tr><td colspan='7'>暂无数据</td></tr>";
				}
				$("table tbody").html(html);
				App.init();
	   		}else{
	   			alert(data.msg);
	   		}
	   		
	   	});
	}
	
	/**
	 * 获取角色
	 */
	var listrole=$.Params.create();
	listrole.ajax(getIP()+"project.action?list",function (data){
		if(data.success){
			var html="<option>请选择项目</option>";
			$.each(data.rows,function(i,val){
				html+="<option value='"+val.id+"'>"+val.name+"</option>";
			})
			$("#roleId").html(html);
		}
	});
	
	
   	
   	/**
   	 * 添加按钮
   	 */
   	$("#addbutton").on("click",function(){
   		$("#time").val("");
   		$("#responsive").modal('toggle');
   	})
   	
   	/**
   	 * 添加/修改
   	 */
   	$("#pmenuAddButton").on("click",function(){
   		var name=$("#name").val();
   		var time=$("#time").val();
   		var roleId=$("#roleId").val();
   		
   		var id=$("#pkid").val();
   		var edit=$.Params.create();
   		edit.addParams("name",name);
   		edit.addParams("time",time);
   		edit.addParams("pid",roleId);
   		var url="";
   		if(id == ""){
   			url=getIP()+"ntime.action?add";
   		}else{
   			edit.addParams("id",id);
   			url=getIP()+"ntime.action?update";
   		}
   		edit.ajax(url,function (data){
			if(data.success){
				getData();
				$("#responsive").modal('hide');
			}
		});
   	})

   	/**
     * 删除
     */
    $("#delbutton").on("click",function(){
    	var params=getcheckdata();
    	if(params == ""){
    		alert("请选择记录");
    		return false;
    	}
    	if(confirm("确定要删除吗？")){
    		var del=$.Params.create();
        	del.addParams("id",params);
        	del.ajax(getIP()+"ntime.action?delMore",function(data){
        		alert(data.msg);
        		if(data.success){
        			getData();
        		}
        	})
    	}
    })
   	
})

/***修改***/
function update(mid,name,time,roleId){
	$("#name").val(loginName);
	$("#time").val(userName);
	$("#pkid").val(mid);
	$("#roleId").val(roleId);
	$("#responsive").modal('toggle');
}

/****查看子菜单****/
function cmenu(mid){
	window.location.href="media/power/cmenuList.jsp?mid="+mid;
}

