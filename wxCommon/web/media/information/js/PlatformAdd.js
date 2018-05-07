function f1(){
	var platform=$("#platform").val();
	if(platform!=""){
		$("#platform1").html("");
	}
}

$(function(){
	var eid=GetQueryString("eid");
	if(eid != null){
		var p=$.Params.create();
		p.addParams("id",eid); 
		p.ajax(getIP()+"platform.action?list",function(data){
			var html="";
			var val=data.rows[0];	
		    $("#id").val(eid);
		    $("#platformuser").val(userName);
			$("#platform").val(val.platform);	
		})
	}	
	/**
	 * 添加和修改
	 */

      




	$("#platformuser").val(userName);

	$("#modifyVal").on("click",function(){
	
		var eid="";  
		eid=$("#id").val();
		
		
		var platformuser=$("#platformuser").val();
		var platform=$("#platform").val();
		if(platform==""){
			$("#platform1").html("简介不能为空");
			return;
		}
		
   		var edit=$.Params.create();
   		edit.addParams("platformuser",platformuser);
   		edit.addParams("platform",platform);


   	

   			//1.定义一个url变量2.判断id等于null或者是为赋值状态 为添加操作，否则为修改。
 		var url="";
 		
   		if(eid == "" || eid == undefined){
   			
   			url=getIP()+"platform.action?add";
   		}else{
   			
   			edit.addParams("id",eid);
   			url=getIP()+"platform.action?update";
   		}
   		
   		//执行ajax.
   		edit.ajax(url,function (data){
			if(data.success){			
			alert(data.msg);
			window.location.href="media/information/PlatformList.jsp";
			}
			})
	})
	
})
	   	   