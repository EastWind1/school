$(function(){
	
	getData();
	function getData(){
		var sel=$.Params.create();
		sel.addParams("page",0);
	   	sel.addParams("rows",rows);
	   	getPageData(sel,getIP()+"project.action?list",function(data){
	   		if(data.success){
	   			var len=data.total;
		   		var html="";
				if(len >0){
					$.each(data.rows,function(i,val){
						html+="<tr>" +
								"<td><input id='"+val.id+"' name='checkbox' type='checkbox'></td>" +
								"<td>"+val.name+"</td>" +
								"<td>"+showValue(val.filed1)+"</td>" +
								"<td>"+val.createTime+"</td>" +
								"<td>"+val.createUser+"</td>" +
								"<td onclick='update(\""+val.id+"\",\""+val.name+"\",\""+val.filed1+"\")'>修改</td></tr>";
					})
				}else{
					html="<tr><td colspan='8'>暂无数据</td></tr>";
				}
				$("table tbody").html(html);
				App.init();
	   		}else{
	   			alert(data.msg);
	   		}
	   		
	   	});
	}
	
   	
   	/**
   	 * 添加按钮
   	 */
   	$("#addbutton").on("click",function(){
   		$("#pmenuName").val("");
   		$("#pkid").val("");
   		$("#filed1").val("");
   		$("#responsive").modal('toggle');
   	})
   	
   	/**
   	 * 添加/修改菜单
   	 */
   	$("#pmenuAddButton").on("click",function(){
   		var menuName=$("#pmenuName").val();
   		var filed1=$("#filed1").val();
   		if(menuName == ""){
   			alert("菜单名不能为空！");
   			return false;
   		}
   		var id=$("#pkid").val();
   		var edit=$.Params.create();
   		edit.addParams("name",menuName);
   		edit.addParams("filed1",filed1);
   		var url="";
   		if(id == ""){
   			url=getIP()+"project.action?add";
   		}else{
   			edit.addParams("id",id);
   			url=getIP()+"project.action?update";
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
        	del.ajax(getIP()+"project.action?delMore",function(data){
        		alert(data.msg);
        		if(data.success){
        			getData();
        		}
        	})
    	}
    })
   	
})

/***修改***/
function update(mid,menuname,filed1){
	$("#pmenuName").val(menuname);
	$("#filed").val(filed1);
	$("#pkid").val(mid);
	$("#responsive").modal('toggle');
}


