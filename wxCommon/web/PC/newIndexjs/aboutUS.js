$(function(){	
	var p=$.Params.create();
	p.ajax(getIP()+"platform.action?list",function(data){
		var val=data.rows[0]
		var html="";
		
		html+="<div class='span6 margin-bottom-20 ab_pingtaiInfo'>"+
		"<pre class='ab_pingtaiContent'>"+val.platform+"</pre>"+
		"</div><div class='ab_pingtaiImg'><img src='PC/image/pingtai_info.png'/></div>";
		
		//$("#newindex").html(html);
	})
	
	var sel=$.Params.create();
	sel.addParams("page",0);
   	sel.addParams("rows","4");
   	sel.addParams("type","2");
   	getPageData(sel,getIP()+"information.action?list",function(data){
   		if(data.success){
   			var len=data.total;
	   		var html="";
			if(len >0){
				$.each(data.rows,function(i,val){
					html+="<div class='zx_list' onclick='getDetail(\""+val.pkid+"\")'><div class='zx_img ol_ClassImg'>" +
							"<img  src='data/material/"+val.informationImage+"' class='infomationimg'></div>" +
							"<div class='zx_info'><span class='zx_infoTitle hasPointer'>"+val.informationTitle+"</span>" +
							"<p class='hasPointer'></p><p class='zx_infoTime'>"+val.createTime+"</p></div></div>"
				})
			}else{
				html="<tr><td colspan='8'>暂无数据</td></tr>";
			}
			$("#dsjList").html(html);
   		}else{
   			alert(data.msg);
   		}
   	});
})

function getDetail(id){
	window.location.href=getIP()+"PC/information_zxDetails.jsp?eid="+id;
}