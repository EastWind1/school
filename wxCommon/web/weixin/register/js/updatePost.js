$(function(){
	var id=window.localStorage.getItem("id");
 	$("ul li").on("click",function(){
 		var post=$(this).text();
 		if(post=="其他"){
 			window.location.href="weixin/register/updatePostqt.jsp";
 		}else{
 			var update=$.Params.create();
 			update.addParams("id",id);
 			update.addParams("post",post);
 			update.ajax(getIP()+"member.action?update",function(data){
 				if(data.success){
 					window.location.href="weixin/register/Info.jsp";
 				}
 			})
 		}
 	})
 	
})