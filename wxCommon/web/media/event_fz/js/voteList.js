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
    	var group=$("#group").val().trim();
    	if(group!="0"){
    		sel.addParams("groupId",group);
    	}else{
    		sel.addParams("groupId",null);
    	}
    	getData();
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
								"<td>"+val.groupName+"</td>" +
								"<td>"+val.hospitalName+"</td>" +
								"<td>"+val.createTime+"</td>"+
								"<td>"+val.count+"</td>" +
								"</tr>";
					})
				}else{
					html="<tr><td colspan='5'>暂无数据</td></tr>";
				}
				$("table tbody").html(html);
				App.init();
	   		}else{
	   			alert(data.msg);
	   		}
	   		
	   	});
	}
   

})




