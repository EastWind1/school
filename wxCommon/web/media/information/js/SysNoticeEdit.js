$(function(){
	var eid=GetQueryString("eid");
	
	if(eid != null){
		var p=$.Params.create();
		p.addParams("id",eid); 
		p.ajax(getIP()+"sysNotice.action?list",function(data){
			var html="";
			var val=data.rows[0];	
		    $("#id").val(eid);
			$("#content").val(val.content);	
			 
		})
	}	
	/**
	 * 添加和修改
	 */
	$("#modifyVal").on("click",function(){
		var id="";  
		 id=$("#id").val();
		 $("#publicNo").val(brandId);
		 var publicNo=$("#publicNo").val();
		
   		var content=$("#content").val();
   		var edit=$.Params.create();
   		if(content==""){
   			alert("公告内容不能为空");
   			return false;
   		}
   		edit.addParams("content",content);
   		edit.addParams("publicNo",publicNo);
   			//1.定义一个url变量2.判断id等于null或者是为赋值状态 为添加操作，否则为修改。
 		var url="";
   		if(id == "" || id == undefined){
   			
   			url=getIP()+"sysNotice.action?add";
   		}else{
   			edit.addParams("id",id);
   			url=getIP()+"sysNotice.action?update";
   		}
   		//执行ajax.
   		edit.ajax(url,function (data){
			if(data.success){			
			alert(data.msg);
			window.location.href="media/information/SysNoticeList.jsp";
			}
			})
		
	})
	
})
	   	   