$(function(){
	
	var chinacity=china.length;
 	var province="";
 	for(var i=0;i<china.length;i++){
 		province+="<li class='table-view-cell' value="+i+"><a class='navigate-right'>"+china[i][0]+"</a></li>";
 	}
 	$("#province").html(province);
 	
 	$("ul li").on("click",function(){
 		var province=$(this).text();
 		var value=$(this).val();
 		window.localStorage.setItem("province",province);
 		window.location.href="weixin/register/updateCity.jsp?value="+value;
 	})

	
})