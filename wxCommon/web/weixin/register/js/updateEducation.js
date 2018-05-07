$(function(){
 	$("ul li").on("click",function(){
 		var education=$(this).text();
 			var id=window.localStorage.getItem("id");
 			var update=$.Params.create();
 			update.addParams("id",id);
 			update.addParams("education",education);
 			update.ajax(getIP()+"member.action?update",function(data){
 				if(data.success){
 					window.location.href="weixin/register/Info.jsp";
 				}
 			})
 	})
 	
})