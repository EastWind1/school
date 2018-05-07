
$(function(){
	var sel=$.Params.create();
	sel.ajax(getIP()+"sysNotice.action?list",function(data){
		if(data.success){
			var val=data.rows[0];
			$(".exp_gonggaoContent").html(val.content);
		}

	});
	
});



$(function(){	
	var p=$.Params.create();
	p.ajax(getIP()+"course.action?list",function(data){
		var html="";	
		$.each(data.rows,function(i,val){	
			html+="<li>&gt;&nbsp;<a onclick='getDetail(\""+val.id+"\")'>"+val.title+"</a></li>";
		})
		$(".exp_onlineClassList").html(html);
	});
});


function getDetail(id){
	window.location.href="PC/newcrouseDetails.jsp?eid="+id;
}


//var sel=$.Params.create();
//$(function(){
//	getData();
//	 
// 	 function getData(){
//	   	sel.addParams("page",0);
//	   	sel.addParams("rows",rows);
//	   	getPageData(sel,getIP()+"sysNotice.action?list",function(data){
//	   		if(data.success){
//	   			var val=data.rows[0];
//				$("#name").html(val.name);
//				$("#jobTitle").html(val.jobTitle);
//				$("#title").html(val.title);
//				$("#price").html(val.price);
//				$("#profile").html(val.profile);	
//	   		}else{
//	   			alert(data.msg);
//	   		}
//	   		
//	   	});
//	}
//})
//
//
