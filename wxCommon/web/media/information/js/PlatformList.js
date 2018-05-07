var sel=$.Params.create();//创建对象
$(function(){	
       getData(); 
   //删除
    $("#delbutton").on("click",function(){
    	var params=getcheckdata();
    	if(params == ""){
    		alert("请选择记录");
    		return false;
    	}
    	if(confirm("确定要删除吗？")){
    		var del=$.Params.create();
        	del.addParams("id",params);
        	del.ajax(getIP()+"platform.action?delMore",function(data){
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
    	window.location.href="media/information/PlatformAdd.jsp";
    })

 
    function getData(){   	
	   	sel.addParams("page",0);
	   	sel.addParams("rows",rows);
	   	getPageData(sel,getIP()+"platform.action?list",function(data){
	   		if(data.success){
	   			var len=data.total;
		   		var html=""; 
				if(len >0){
					$("#addbutton").hide();
					$.each(data.rows,function(i,val){
						var platform=val.platform;
						if(platform.length>=12){
							platform=platform.substr(0,12)+"......";
						}
						html+="<tr>" +
								"<td><input id='"+val.id+"' name='checkbox' type='checkbox'></td>" +
								"<td>"+platform+"</div></td>" +
								"<td>"+userName+"</td>" +
								"<td>"+val.platformtime+"</td>" +
								"<td><span onclick='update(\""+val.id+"\")' class='checkDetailsBtn'>修改</span></td>"+
								"</tr>";
					})
				}else{
					html="<tr><td colspan='8'>暂无数据</td></tr>";
					$("#addbutton").show();
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
	window.location.href="media/information/PlatformAdd.jsp?eid="+id;
}

