$(function(){
 	$("ul li").on("click",function(){
 		var hospitalOffices=$(this).text();
 		if(hospitalOffices=="其他"){
 			window.location.href="weixin/register/updateOffices.jsp";
 		}else{
 				var id=window.localStorage.getItem("id");
 				var update=$.Params.create();
 				update.addParams("id",id);
 				update.addParams("hospitalOffices",hospitalOffices);
 				update.ajax(getIP()+"member.action?update",function(data){
 					if(data.success){
 						window.location.href="weixin/register/Info.jsp";
 					}
 				})
 			
 		}
 	})
})