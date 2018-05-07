var sel=$.Params.create();
$(function(){
	
    getData();

  
    /*查询*/
    $("#searchList").on("click",function(){
    	var group=$("#group").val().trim();
    	if(group!=""){
    		sel.addParams("groupName",group);
    	}else{
    		sel.addParams("groupName",null);
    	}
    	getData();
    })
    
    
    /*添加*/
    $("#addbutton").on("click",function(){
    	window.location.href="media/event_fz/groupAdd.jsp";
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
        	del.ajax(getIP()+"eventgagroup.action?delMoreGroup",function(data){
        		alert(data.msg);
        		if(data.success){
        			$("#queryCheckbox").removeAttr("checked");
        			$("#queryCheckbox").parent().removeClass("checked");
        			getData();
        		}
        	})
    	}
    })
    
    function getData(){
	   	sel.addParams("page",0);
	   	sel.addParams("rows",rows);
	   	getPageData(sel,getIP()+"eventgagroup.action?list",function(data){
	   		if(data.success){
	   			var len=data.total;
		   		var html="";
				if(len >0){
					$.each(data.rows,function(i,val){
						var createTime=val.createTime;
						if(createTime==null || createTime=="null"){
							createTime="";
						}
						
						html+="<tr>" +
								"<td><input id='"+val.id+"' name='checkbox' type='checkbox'></td>" +
								"<td>"+val.groupName+"</td>" +
								"<td>"+createTime+"</td>"+
								"<td>" +
								"<span onclick='update(\""+val.id+"\")' class='checkDetailsBtn' style='width:30%;'>修改</span></td></tr>";
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
   

})


function update(id){
	window.location.href="media/event_fz/groupModify.jsp?eid="+id;
}

