$(function(){
    getData();
    function getData(){
    	var sel=$.Params.create();
    	sel.addParams("page",0);
	   	sel.addParams("rows",rows);
	   	sel.addParams("type","1");
	   	getPageData(sel,getIP()+"information.action?list",function(data){
	   		if(data.success){
	   			var len=data.total;
		   		var html=""; 
				if(len >0){
					$.each(data.rows,function(i,val){

						html+="<div class='zx_list'><div class='zx_img ol_ClassImg hasPointer'><img onclick='getDetail(\""+val.pkid+"\")' src='data/material/"+val.informationImage+"' alt=''class='infomationimg'/></div>"+
							  "<div class='zx_info'><span class='zx_infoTitle hasPointer' onclick='getDetail(\""+val.pkid+"\")'>"+val.informationTitle+"</span>"+
							  "<p class='hasPointer'></p><p class='zx_infoTime'>"+val.createTime+"</p></div></div>";
					})
				}else{
					html="暂无数据";
				}
				$(".zx_container").html(html);	
	   		}else{
	   			alert(data.msg);
	   		}
	   	});
	};
});

function getDetail(id){
	window.location.href=getIP()+"PC/information_zxDetails.jsp?eid="+id;
}



