var sel=$.Params.create();
$(function(){
	
    getData();
    /*
     * 加载分组
     */
    var p=$.Params.create();
    p.ajax(getIP()+"eventgagroup.action?list",function(data){
    	if(data.success){
    		var html="<option value='0'>请选择分组</option>";
    		$.each(data.rows,function(i,val){
    			html+="<option value='"+val.id+"'>"+val.groupName+"</option>";
    		})
    		$("#group").html(html);
    	}
    })
    
  
    /*查询*/
    $("#searchList").on("click",function(){
    	var group=$("#group").val();
    	if(group!="0"){
    		sel.addParams("groupId",group);
    	}else{
    		sel.addParams("groupId",null);
    	}
    	getData();
    })
    
    
    /*添加*/
    $("#addbutton").on("click",function(){
    	window.location.href="media/event_fz/teamAdd.jsp";
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
        	del.ajax(getIP()+"eventgateam.action?delMore",function(data){
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
	   	getPageData(sel,getIP()+"eventgateam.action?list",function(data){
	   		if(data.success){
	   			var len=data.total;
		   		var html="";
				if(len >0){
					$.each(data.rows,function(i,val){
						
						html+="<tr>" +
								"<td><input id='"+val.id+"' name='checkbox' type='checkbox'></td>" +
								"<td><img src='data/eventfz/"+val.headImg+"' /></td>" +
								"<td>"+val.groupName+"</td>" +
								"<td>"+val.hospitalName+"</td>" +
								"<td>"+val.createTime+"</td>"+
								"<td>" +
								"<span onclick='update(\""+val.id+"\")' class='checkDetailsBtn' style='width:30%;'>修改</span></td></tr>";
					})
				}else{
					html="<tr><td colspan='6'>暂无数据</td></tr>";
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
	window.location.href="media/event_fz/teamModify.jsp?eid="+id;
}

