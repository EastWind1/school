var sel=$.Params.create();

$(function(){
    getData();
    
  
    $("#searchList").on("click",function(){
       	var name=$("#name").val();
       	var hospitalName=$("#hospitalName").val();
    	if(name != ""){
    		sel.addParams("name",name);
    	}else{
    		sel.addParams("name",null);
    	}
    	if(hospitalName != ""){
    		sel.addParams("hospitalName",hospitalName);
    	}else{
    		sel.addParams("hospitalName",null);
    	}
    	getData();
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
        	del.ajax(getIP()+"eventdocuments.action?delMore",function(data){
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
    	sel.addParams("state",3);
    	getPageData(sel,getIP()+"eventdocuments.action?list",function(data){
    		if(data.success){
    		   			var len=data.total;
    		   			$("#count").html("当前的精品数为："+len);
    			   		var html="";
    					if(len >0){
    						$.each(data.rows,function(i,val){
    						var htm="";
    						html+="<tr>" +
							"<td><input id='"+val.id+"' name='checkbox' type='checkbox'></td>" +
							"<td><img src='data/member/headImg/"+val.headImg+"' /></td>" +
							"<td>"+val.name+"</td>" +
							"<td>"+val.hospitalName+"</td>" +
							"<td>"+val.content+"</td>" +
							"<td>"+val.createTime+"</td>" +
							"<td>"+val.count+"</td>" +
							"<td><span onclick='update(\""+val.id+"\",0)' class='checkDetailsBtn' style='width:30%'>取消成精品</span>"+
							"</td></tr>";
    							
    						})
    					}else{
    						html="<tr><td colspan='7'>暂无数据</td></tr>";
    					}
    					$("table tbody").html(html);
    					App.init();
    		   		}else{
    		   			alert(data.msg);
    		   		}
    		   	})
   		   

    }
})


function update(id,state){
		var update=$.Params.create();
		update.addParams("id",id); 
		update.addParams("state",state); 
		update.ajax(getIP()+"eventdocuments.action?update",function (data){
			if(data.success){
				window.location.href="media/zhenggao/documentsHighList.jsp";
			}
		});
	
}

