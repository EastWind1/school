var sel=$.Params.create();
$(function(){
    getData();
   
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
        	del.ajax(getIP()+"feedBack.action?delMore",function(data){
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
	   	sel.addParams("type",3);
	   	getPageData(sel,getIP()+"feedBack.action?list",function(data){
	   		if(data.success){
	   			var len=data.total;
		   		var html="";
				if(len >0){
					$.each(data.rows,function(i,val){
						var content=val.content;
						if(content.length>=12){
							content=content.substr(0,12)+"......";
						}
						
						html+="<tr>" +
								"<td><input id='"+val.id+"' name='checkbox' type='checkbox'></td>" +
								"<td>"+val.filed2+"</td>" +
								//"<td>"+val.filed1+"</td>" +
								"<td>"+content+"</td>"+
								"<td>"+val.createTime+"</td>"+
								//"<td>"+
								"</tr>";
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



