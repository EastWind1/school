$(function(){
 	$("ul li").on("click",function(){
 		var jobTitle=$(this).text();
 		if(jobTitle=="其他"){
 			window.location.href="weixin/register/title.jsp";
 		}else{
 		window.localStorage.setItem("jobTitle",jobTitle);
 		window.location.href="weixin/register/addInfo.jsp";
 		}
 	})
})