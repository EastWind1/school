var sel=$.Params.create();
$(function(){
	
    getData();

  
    
    /*添加*/
    $("#addbutton").on("click",function(){
    	window.location.href="media/conferencePay/conferencePayAdd.jsp";
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
        	del.ajax(getIP()+"conferencepayment.action?delMore",function(data){
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
	   	getPageData(sel,getIP()+"conferencepayment.action?list",function(data){
	   		if(data.success){
	   			var len=data.total;
		   		var html="";
				if(len >0){
					$.each(data.rows,function(i,val){
					var htm="";
					var type="";
					if(val.type==1){
						type+="<font color='#BF0B53'>开启</font>";
						htm="<span onclick='update1(\""+val.id+"\",2)' class='checkDetailsBtn' style='width:30%'>关闭</span>";
						
					}
					if(val.type==2){
						type="关闭";
						htm="<span onclick='update1(\""+val.id+"\",1)' class='checkDetailsBtn' style='width:30%;'>开启</span>";
					}
					
						html+="<tr>" +
								"<td><input id='"+val.id+"' name='checkbox' type='checkbox'></td>" +
								"<td>"+val.title+"</td>" +
								"<td>"+val.doctorPay+"元</td>" +
								"<td>"+val.nursePay+"元</td>" +
								"<td>"+val.nursePay+"元</td>" +
								"<td>"+type+"</td>"+
								"<td>"+val.createTime+"</td>"+
								"<td>" +htm+
								"<span onclick='update(\""+val.id+"\")' class='checkDetailsBtn' style='width:30%;'>修改</span></td></tr>";
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


function update1(id,type){
	var update=$.Params.create();
	update.addParams("id",id); 
	update.addParams("type",type); 
	update.ajax(getIP()+"conferencepayment.action?update",function (data){
		if(data.success){
				window.location.href="media/conferencePay/conferencePayList.jsp";
		}
	});
}
function update(id){
	window.location.href="media/conferencePay/conferencePayModify.jsp?eid="+id;
	
}

