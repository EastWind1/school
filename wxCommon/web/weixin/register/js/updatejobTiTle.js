$(function(){
 	$("ul li").on("click",function(){
 		var jobTitle=$(this).text();
 		if(jobTitle=="其他"){
 			window.location.href="weixin/register/updateTitle.jsp";
 		
 		}else{
 			var id=window.localStorage.getItem("id");
 			var update=$.Params.create();
 			update.addParams("id",id);
 			update.addParams("jobTitle",jobTitle);
 			update.ajax(getIP()+"member.action?update",function(data){
 				if(data.success){
 					window.location.href="weixin/register/Info.jsp";
 				}
 			})
 		
 		}
 	})
 	
})