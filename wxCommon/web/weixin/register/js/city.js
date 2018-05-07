$(function(){
	var provinceId=GetQueryString("value");
 	var city="";
 	for(var y=1;y<china[provinceId].length;y++){
 		city+="<li class='table-view-cell' value="+china[provinceId][y]+"><a class='navigate-right'>"+china[provinceId][y]+"</a></li>";
	 	}
 	$("#city").html(city);
 	
 	$("ul li").on("click",function(){
 		var city=$(this).text();
 		window.localStorage.setItem("city",city);
 		window.location.href="weixin/register/checkHospital.jsp";
 	})

	
})