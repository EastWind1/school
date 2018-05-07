$(function(){
	/*var sysNotice=$.Params.create();
	sysNotice.addParams("page",0);
	sysNotice.addParams("rows",5);
	sysNotice.ajax(getIP()+"sysNotice.action?list",function(data){
		var html="";
		$.each(data.rows,function(i,val){
			html+="<li onclick='getDetailNotice(\""+val.id+"\")'><a class='index_gonggaoListContent hasPointer'>"+subStr(val.content)+"</a><span class='index_gonggaoListTime'>"+splitStr(val.createDate)+"</span></li>";
		});
		 $(".index_gonggaoList").html(html);
	});*/
	
	var information=$.Params.create();
	information.addParams("page",0);
	information.addParams("rows",5);
	information.addParams("type",1);
	information.ajax(getIP()+"information.action?list",function(data){
		var html="";
		$.each(data.rows,function(i,val){		
			html+="<li><a onclick='getDetaila(\""+val.pkid+"\")' class='index_gonggaoListContent hasPointer'>"+subStr(val.informationTitle)+"</a><span class='index_gonggaoListTime'>"+splitStr(val.createTime)+"</span></li>";
		});
		 $("#newinde").html(html);
	});
	
	function splitStr(str){
		return str.split(" ",1);
	}
});
function getDetaila(id){
	window.location.href=getIP()+"PC/information_zxDetails.jsp?eid="+id;
}