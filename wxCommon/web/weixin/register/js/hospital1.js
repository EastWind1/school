$(function(){
	var cityName=window.localStorage.getItem("city");
 	var hos="";
 	for(var i=0;i<hospital.length;i++){
			if(cityName == hospital[i][0]){
				for(var y=1;y<hospital[i].length;y++){
					hos+="<li class='table-view-cell' value="+hospital[i][y]+"><a class='navigate-right'>"+hospital[i][y]+"</a></li>";
				}
				hos+="<li class='table-view-cell' value='qt'><a class='navigate-right'>其他</a></li>";
			}
			
		}
 	
 	
 	$("#hospitalName").append(hos);
 	
 	
 	$("#sousuo").on("click",function(){
 		$("#hospitalName li[id!='li1']").remove();
 		var searchHos=$("#searchosinp").val();
		var hos="";
		for(var i=0;i<hospital.length;i++){
			if(cityName == hospital[i][0]){
				for(var y=1;y<hospital[i].length;y++){
					if(hospital[i][y].indexOf(searchHos)!=-1){
						hos+="<li class='table-view-cell' value="+hospital[i][y]+"><a class='navigate-right'>"+hospital[i][y]+"</a></li>";
					}
					if(searchHos == ""){
						hos+="<li class='table-view-cell' value="+hospital[i][y]+"><a class='navigate-right'>"+hospital[i][y]+"</a></li>";
					}
				}
				hos+="<li class='table-view-cell' value='qt'><a class='navigate-right'>其他</a></li>";
				
			}
		}
		
	 	$("#hospitalName").append(hos);
	 	$("#hospitalName").find("li[id!='li1']").each(function(){
	 	 	$(this).on("click",function(){
	 	 		var hospitalName=$(this).text();
	 	 		var value=$(this).val();
	 	 		if(hospitalName=="其他"){
	 	 			window.location.href="weixin/register/hospitalName.jsp";
	 	 		}else{
	 	 		window.localStorage.setItem("hospitalName",hospitalName);
	 	 		window.location.href="weixin/register/checkHospitalOffices.jsp";
	 	 		}
	 	 	})
	 	 	})
 		
 	})
 	$("#hospitalName").find("li[id!='li1']").each(function(){
 	$(this).on("click",function(){
 		var hospitalName=$(this).text();
 		var value=$(this).val();
 		if(hospitalName=="其他"){
 			window.location.href="weixin/register/hospitalName.jsp";
 		}else{
 		window.localStorage.setItem("hospitalName",hospitalName);
 		window.location.href="weixin/register/checkHospitalOffices.jsp";
 		}
 	})
 	})
})