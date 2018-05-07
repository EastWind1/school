var sel=$.Params.create();//创建对象
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
        	del.ajax(getIP()+"sysNotice.action?delMore",function(data){
        		alert(data.msg);
        		if(data.success){
        			$("#queryCheckbox").removeAttr("checked");
        			$("#queryCheckbox").parent().removeClass("checked");
        			getData();
        		}
        	})
    	}
    })
   
    	
    //添加
  $("#addbutton").on("click",function(){
    	window.location.href="media/information/SysNoticeAdd.jsp";
    })

 
    function getData(){   	
	   	sel.addParams("page",0);
	   	sel.addParams("rows",rows);
	   	getPageData(sel,getIP()+"sysNotice.action?list",function(data){
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
								"<td>"+content+"</td>" +
								"<td>"+val.createDate+"</td>" +
								"<td><span onclick='update(\""+val.id+"\")' class='checkDetailsBtn'>修改</span></td>"+
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



function update(id){
	window.location.href="media/information/SysNoticeAdd.jsp?eid="+id;
}

