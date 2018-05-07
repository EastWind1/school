var sel=$.Params.create();
var pageList=window.localStorage.getItem("pageList");
if(pageList==null||pageList=="null"){
	pageList=0;
}
$(function(){
	var eid=GetQueryString("eid");
    getData();
    
    /**
     * 查询
     */
//
//    $("#searchList").on("click",function(){
//    	var onlineNo=$("#onlineNo").val();
//    	if(onlineNo != ""){
//    		sel.addParams("onlineNo",onlineNo);
//    	}else{
//    		sel.addParams("onlineNo",null);
//    	}
//    	
//    	getData();
//    })
    
    /**
     * 添加
     */
//    $("#addbutton").on("click",function(){
//    	window.location.href="media/meetId/meetIdAdd.jsp";
//    })
    
//     $("#delbutton").on("click",function(){
//    	var params=getcheckdata();
//    	if(params == ""){
//    		alert("请选择记录");
//    		return false;
//    	}
//    	if(confirm("确定要删除吗？")){
//    		var del=$.Params.create();
//        	del.addParams("id",params);
//        	del.ajax(getIP()+"meetid.action?delMore",function(data){
//        		alert(data.msg);
//        		if(data.success){
//        			$("#queryCheckbox").removeAttr("checked");
//        			$("#queryCheckbox").parent().removeClass("checked");
//        			getData();
//        		}
//        	})
//    	}
//    })
    
   
    function getData(){
	   	sel.addParams("page",pageList);
	   	sel.addParams("rows",rows);
	   	sel.addParams("onlineNo",eid);
	   	getPageData(sel,getIP()+"logmeetidcourse.action?list",function(data){
	   		if(data.success){
	   			var len=data.total;
	   			window.localStorage.setItem("pageList",pageList);
		   		var html="";
				if(len >0){
					$.each(data.rows,function(i,val){
						html+="<tr>" +
								"<td>"+val.courseTitle+"</td>" +
								"<td>"+val.startTime+"</td>" +
								"<td>"+val.endTime+"</td>" +
								"</tr>";
					})
				}else{
					html="<tr><td colspan='3'>暂无数据</td></tr>";
				}
				$("table tbody").html(html);
				App.init();
	   		}else{
	   			alert(data.msg);
	   		}
	   		
	   	});
	}
    
    
   
})




