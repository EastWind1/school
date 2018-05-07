var sel=$.Params.create();
var pageList=window.localStorage.getItem("pageList");
if(pageList==null||pageList=="null"){
	pageList=0;
}
$(function(){
	
    getData();
    
    /**
     * 查询
     */

    $("#searchList").on("click",function(){
    	var onlineNo=$("#onlineNo").val();
    	if(onlineNo != ""){
    		sel.addParams("onlineNo",onlineNo);
    	}else{
    		sel.addParams("onlineNo",null);
    	}
    	
    	getData();
    })
    
    /**
     * 添加
     */
    $("#addbutton").on("click",function(){
    	window.location.href="media/meetId/meetIdAdd.jsp";
    })
    
     $("#delbutton").on("click",function(){
    	var params=getcheckdata();
    	if(params == ""){
    		alert("请选择记录");
    		return false;
    	}
    	if(confirm("确定要删除吗？")){
    		var del=$.Params.create();
        	del.addParams("id",params);
        	del.ajax(getIP()+"meetid.action?delMore",function(data){
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
	   	sel.addParams("page",pageList);
	   	sel.addParams("rows",rows);
	   	getPageData(sel,getIP()+"meetid.action?list",function(data){
	   		if(data.success){
	   			var len=data.total;
	   			window.localStorage.setItem("pageList",pageList);
		   		var html="";
				if(len >0){
					$.each(data.rows,function(i,val){
						var capacity=val.capacity;
						if(capacity==null || capacity=="null"){
							capacity="";
						}
						html+="<tr>" +
								"<td><input id='"+val.id+"' name='checkbox' type='checkbox'></td>" +
								"<td>"+val.loginName+"</td>" +
								"<td>"+val.password+"</td>" +
								"<td>"+val.onlineNo+"</td>" +
								"<td>"+capacity+"</td>"+
								"<td>"+val.operator+"</td>"+
								"<td>"+val.remark+"</td>"+
								"<td>"+val.createTime+"</td>"+
								"<td>"+
								"<span onclick='getRecord(\""+val.onlineNo+"\")' class='checkDetailsBtn'>查看记录</span>"+
								"<span onclick='update(\""+val.id+"\")' class='checkDetailsBtn'>修改</span>"+
								"</tr>";
					})
				}else{
					html="<tr><td colspan='9'>暂无数据</td></tr>";
				}
				$("table tbody").html(html);
				App.init();
	   		}else{
	   			alert(data.msg);
	   		}
	   		
	   	});
	}
    
    
   
})

function getRecord(onlineNo){
	window.location.href="media/meetId/meetIdRecordList.jsp?eid="+onlineNo;
}
function update(id){
	window.location.href="media/meetId/meetIdModify.jsp?eid="+id;
}


