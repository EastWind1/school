var sel=$.Params.create();
$(function(){
	
	
    
    getData();
    
    /**
     * 查询
     */
    $("#searchList").on("click",function(){
    	var userName=$("#userName").val();
    	if(userName != ""){
    		sel.addParams("userName",userName);
    	}else{
    		sel.addParams("userName",null);
    	}
    	getData();
    })
    
    
    $("#addbutton").on("click",function(){
    	window.location.href="media/information/dsjAdd.jsp";
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
        	del.ajax(getIP()+"information.action?delMore",function(data){
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
	   	sel.addParams("type","2");
	   	getPageData(sel,getIP()+"information.action?list",function(data){
	   		if(data.success){
	   			var len=data.total;
		   		var html="";
				if(len >0){
					$.each(data.rows,function(i,val){
						html+="<tr>" +
								"<td><input id='"+val.pkid+"' name='checkbox' type='checkbox'></td>" +
								"<td><img src='data/material/"+val.informationImage+"'/></td>" +
								"<td>"+val.informationTitle+"</td>" +
								"<td>"+val.createTime+"</td>" +
								//"<td onclick='getDetail(\""+val.pkid+"\")'>查看详情</td>" +
								"</tr>";
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
   

})

function getDetail(id){
	window.location.href="media/expert/expertDetail.jsp?eid="+id;
}


