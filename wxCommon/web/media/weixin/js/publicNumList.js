var sel=$.Params.create();
$(function(){
	
    getData();
    
    /**
     * 条件查询
     */
    $("#publicType").on("change",function(){
    	getData();
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
        	del.ajax(getIP()+"wxPublic.action?delMore",function(data){
        		alert(data.msg);
        		if(data.success){
        			$("#queryCheckbox").removeAttr("checked");
        			$("#queryCheckbox").parent().removeClass("checked");
        			getData();
        		}
        	})
    	}
    })
    
    
    /**
     * 进入添加页面
     */
    $("#addbutton").on("click",function(){
    	window.location.href="media/weixin/addPublicNum.jsp";
    })
    
    
    /**
     * 获取数据
     */
    function getData(){
    	var type=$("#publicType").val();
	   	sel.addParams("type",type);
	   	sel.addParams("page",0);
	   	sel.addParams("rows",rows);
	   	getPageData(sel,getIP()+"wxPublic.action?list",function(data){
	   		if(data.success){
	   			var len=data.total;
		   		var html="";
				if(len >0){
					$.each(data.rows,function(i,val){
						var state=val.deleteState;
						if(state == "1"){
							state="<span class='label label-info'>接入</span>";
						}else{
							state="<span class='label label-success'>断开</span>";
						}
						html+="<tr>" +
								"<td><input id='"+val.id+"' name='checkbox' type='checkbox'></td>" +
								"<td>"+val.publicNo+"</td>" +
								"<td class='clickstyle'  onclick=\"gotoUpdate(\'"+ val.id+"\')\">"+val.name+"</td>" +
								"<td>查看粉丝</td>" +
								"<td>素材管理</td>" +
								"<td>群发消息</td>" +
								"<td>自定义菜单</td>" +
								"<td>自动回复</td>" +
								"<td>"+state+"</td></tr>";
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

/**
 * 进入修改页面
 */
function gotoUpdate(id){
	window.location.href="media/weixin/addPublicNum.jsp?id="+id;
}


