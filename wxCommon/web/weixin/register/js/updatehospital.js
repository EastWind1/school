var cityName=window.localStorage.getItem("city");
$(function(){
	var hos="";
 	var sel=$.Params.create();
 	sel.addParams("city",cityName);
 	sel.ajax(getIP()+"memberhospital.action?list",function(data){
 		if(data.success){
   			var len=data.total; 
	   		var html="";
			if(len >0){
				$.each(data.rows,function(i,val){
					hos+="<li onclick='getHospital(\""+val.name+"\")' class='table-view-cell' value="+val.name+"><a class='navigate-right'>"+val.name+"</a></li>";
				})
				
			}
			hos+="<li onclick='getHospital(\"qt\")' class='table-view-cell' value='qt'><a class='navigate-right'>其他</a></li>";
			$("#hospitalName").append(hos);
 		}
 	})
 	
 	
 	$("#sousuo").on("click",function(){
 		$("#hospitalName li[id!='li1']").remove();
 		var searchHos=$("#searchosinp").val();
		var hos="";
		var sel1=$.Params.create();
	 	sel1.addParams("city",cityName);
	 	sel1.addParams("name",searchHos);
	 	sel1.ajax(getIP()+"memberhospital.action?list",function(data){
	 		if(data.success){
	   			var len=data.total;
				if(len >0){
					$.each(data.rows,function(i,val){
						hos+="<li onclick='getHospital(\""+val.name+"\")' class='table-view-cell' value="+val.name+"><a class='navigate-right'>"+val.name+"</a></li>";
					})
					hos+="<li onclick='getHospital(\"qt\")' class='table-view-cell' value='qt'><a class='navigate-right'>其他</a></li>";
				}else{
					hos+="<li class='table-view-cell' value='nothing'><a class='navigate-right'>暂无数据</a></li>";
				}
				$("#hospitalName").append(hos);
	 		}
	 	})	
 
 	})
})
function getHospital(hospitalName){
		if(hospitalName=="qt"){
			window.location.href="weixin/register/updatehospitalName.jsp";
		}else{
			var id=window.localStorage.getItem("id");
	 			var province=window.localStorage.getItem("province");
	 			var update=$.Params.create();
	 			update.addParams("id",id);
	 			update.addParams("hospitalName",hospitalName);
	 			update.addParams("province",province);
	 			update.addParams("city",cityName);
	 			update.ajax(getIP()+"member.action?update",function(data){
	 				if(data.success){
	 					window.location.href="weixin/register/Info.jsp";
	 				}
	 			})
		
		}
}