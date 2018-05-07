$(function(){
	var chinacity=china.length;
 	var province="";
 	for(var i=0;i<china.length;i++){
 		province+="<li class='table-view-cell' value="+i+"><a class='navigate-right'>"+china[i][0]+"</a></li>";
 	}
 	$("#expProvince1").append(province);
 	$("ul li").on("click",function(){
 		var expProvince=$(this).text();
 		window.localStorage.setItem("expProvince",expProvince);
 		window.location.href="weixin/hy/checkExpert.jsp";
 	})
	
})