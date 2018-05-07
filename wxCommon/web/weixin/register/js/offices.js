$(function(){
 	$("ul li").on("click",function(){
 		var hospitalOffices=$(this).text();
 		if(hospitalOffices=="其他"){
 			window.location.href="weixin/register/hospitalOffices.jsp";
 		}else{
 		window.localStorage.setItem("hospitalOffices",hospitalOffices);
 		window.location.href="weixin/register/checkJobTitle.jsp";
 		}
 	})
})