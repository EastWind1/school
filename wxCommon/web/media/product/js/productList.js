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
    	getData();
    })
    
    /**
     * 添加
     */
    $("#addbutton").on("click",function(){
    	window.location.href="media/product/productAdd.jsp";
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
        	del.ajax(getIP()+"product.action?delMore",function(data){
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
	   	getPageData(sel,getIP()+"product.action?list",function(data){
	   		if(data.success){
	   			var len=data.total;
	   			window.localStorage.setItem("pageList",pageList);
		   		var html="";
				if(len >0){
					$.each(data.rows,function(i,val){
						html+="<tr>" +
								"<td><input id='"+val.id+"' name='checkbox' type='checkbox'></td>" +
								"<td>"+val.name+"</td>" +
								"<td>"+val.color+"</td>" +
								"<td>"+val.price+"</td>" +
								"<td>"+val.weight+"</td>"+
								"<td>"+
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


function update(id){
	window.location.href="media/product/productModify.jsp?eid="+id;
}


