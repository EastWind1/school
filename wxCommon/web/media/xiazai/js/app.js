
$(function(){
	
	   var sel=$.Params.create();
	   sel.ajax(getIP()+"logLogin.action?getApp",function(data){
	   		if(data.success){
	   			var len=data.total;
		   		var html="";
		   		var type="";
				if(len >0){
					$.each(data.rows,function(i,val){
						if(val.column01=="1"){
							type="IOS端下载";
							html+="<tr>" +
							"<td>"+type+"</td>" +
							"<td>"+val.number+"</td>" +
							"</tr>";
						}
						if(val.column01=="2"){
							type="Android端下载";
							html+="<tr>" +
							"<td>"+type+"</td>" +
							"<td>"+val.number+"</td>" +
							"</tr>";
						}
					
						
					})
				}else{
					html="<tr><td colspan='2'>暂无数据</td></tr>";
				}
				$("table tbody").html(html);
				App.init();
	   		}else{
	   			alert(data.msg);
	   		}
	   		
	   	});
   

})



