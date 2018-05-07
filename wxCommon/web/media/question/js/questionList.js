var sel=$.Params.create();

$(function(){
    getData();
    
  
    /*清空*/
    $("#removebutton").on("click",function(){
    	var params=getcheckdata();
    	if(params == ""){
    		alert("请选择记录");
    		return false;
    	}
    	if(confirm("是否要清除！")){
    		var update=$.Params.create();
    		update.addParams("id",params);
    		update.addParams("state",3);
    		update.ajax(getIP()+"questiontable.action?updMore",function(data){
    			if(data.success){
    				alert("清除成功");
    				getData();
    			}
    		})
    	}
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
    	var question="";
    	var sel1=$.Params.create();
    	sel1.addParams("filed4","1");
    	sel1.addParams("state",1);
    	sel1.ajax(getIP()+"questiontable.action?list",function(data1){
    		if(data1.success){
    			if(data1.total>0){
    			var val1=data1.rows[0];
    			question=val1.question;
    			}
    			sel.addParams("page",0);
    		   	sel.addParams("rows",rows);
    		   	sel.addParams("state",3);
    		   	sel.addParams("filed4","2");
    		   	getPageData(sel,getIP()+"questiontable.action?getSel",function(data){
    		   		if(data.success){
    		   			var len=data.total;
    			   		var html="";
    					if(len >0){
    						$.each(data.rows,function(i,val){
    						var htm="";
    						if(val.state=="1"){
    							state="<font color='#BF0B53'>通过</font>";
    							htm="<span onclick='update(\""+val.id+"\",2)' class='checkDetailsBtn' style='width:30%'>不通过</span>";
    							
    						}
    						if(val.state=="0"){
    							state="未审核";
    							htm="<span onclick='update1(\""+val.id+"\",1)' class='checkDetailsBtn' style='width:30%;'>通过</span>"+
    							"<span onclick='update(\""+val.id+"\",2)' class='checkDetailsBtn' style='width:30%;'>不通过</span>";
    							
    						}
    						if(val.state=="2"){
    							state="没通过";
    							htm="<span onclick='update1(\""+val.id+"\",1)' class='checkDetailsBtn' style='width:30%;'>通过</span>";
    							
    						}
    						html+="<tr>" +
							"<td><input id='"+val.id+"' name='checkbox' type='checkbox'></td>" +
							"<td>"+question+"</td>" +
							"<td>"+val.question+"</td>" +
							"<td>"+val.questionTime+"</td>" +
							"<td>"+state+"</td>"+
							"<td>" +htm+
							"</td></tr>";
    							
    						})
    					}else{
    						html="<tr><td colspan='6'>暂无数据</td></tr>";
    					}
    					$("table tbody").html(html);
    					App.init();
    		   		}else{
    		   			alert(data.msg);
    		   		}
    		   	})
    		}
    	})
    			
    		   

    }
})


function update1(id,state){
		var update=$.Params.create();
		update.addParams("id",id); 
		update.addParams("state",state); 
		update.ajax(getIP()+"questiontable.action?update1",function (data){
			if(data.success){
				window.location.href="media/question/questionList.jsp";
			}
		});
	
}
function update(id,state){
	var update=$.Params.create();
	update.addParams("id",id); 
	update.addParams("state",state); 
	update.ajax(getIP()+"questiontable.action?update",function (data){
		if(data.success){
			window.location.href="media/question/questionList.jsp";
		}
	});
	
}

