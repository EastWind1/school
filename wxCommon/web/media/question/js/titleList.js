var sel=$.Params.create();
$(function(){
	
    getData();

  
    
    /*添加*/
    $("#addbutton").on("click",function(){
    	window.location.href="media/question/titleAdd.jsp";
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
        	del.ajax(getIP()+"questiontable.action?delMore",function(data){
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
	   	sel.addParams("filed4","1");
	   	getPageData(sel,getIP()+"questiontable.action?list",function(data){
	   		if(data.success){
	   			var len=data.total;
		   		var html="";
				if(len >0){
					$.each(data.rows,function(i,val){
					var htm="";
					var state="";
					if(val.state==1){
						state+="<font color='#BF0B53'>开启</font>";
						htm="<span onclick='update2(\""+val.id+"\",2)' class='checkDetailsBtn' style='width:30%'>关闭</span>";
						
					}
					if(val.state==2){
						state="关闭";
						htm="<span onclick='update1(\""+val.id+"\",1)' class='checkDetailsBtn' style='width:30%;'>开启</span>";
					}
					
						html+="<tr>" +
								"<td><input id='"+val.id+"' name='checkbox' type='checkbox'></td>" +
								"<td>"+val.question+"</td>" +
								"<td>"+val.filed1+"</td>" +
								"<td>"+state+"</td>"+
								"<td>" +htm+
								"<span onclick='update(\""+val.id+"\")' class='checkDetailsBtn' style='width:30%;'>修改</span></td></tr>";
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

function update1(id,state){
		var update=$.Params.create();
		update.addParams("id",id); 
		update.addParams("state",state); 
		update.ajax(getIP()+"questiontable.action?update",function (data){
			if(data.success){
				var updateBegin=$.Params.create();
				updateBegin.addParams("id",id);
				updateBegin.addParams("state",2);
				updateBegin.addParams("filed4","1");
				updateBegin.ajax(getIP()+"questiontable.action?updateBegin",function (data){
					if(data.success){
						window.location.href="media/question/titleList.jsp";
					}
					   
				});
			}
			   
		});
		
	
}

function update2(id,state){
	var update=$.Params.create();
	update.addParams("id",id); 
	update.addParams("state",state); 
	update.ajax(getIP()+"questiontable.action?update",function (data){
		if(data.success){
				window.location.href="media/question/titleList.jsp";
		}
	});
}
function update(id){
	window.location.href="media/question/titleModify.jsp?eid="+id;
	
}

