$(function(){
 getData();
	function getData(){
		var sel=$.Params.create();
		sel.addParams("memberId",memberId); 
		sel.ajax(getIP()+"logcheckmember.action?list",function(data){
			var html="";
			$.each(data.rows,function(i,val){	
				var htmlbutton="";
				var type=val.type;
				if(type==1){
					type="已通过";
				}else{
					type="未通过";
					htmlbutton+=
    		  		     "<li class='table-view-cell classIn'>未通过原因："+val.cause+"</li>";
				}
				html+="<div class='card listsz'><ul class='table-view' style='margin-left:0px;margin-right:5px;'>"+
      		  		   "<li class='table-view-cell classIn'>姓名:"+val.memberName+"</li>"+
      		  		"<li class='table-view-cell classIn'>审核状态："+type+"</li>"+
		  		     "<li class='table-view-cell classIn'>审核时间："+val.createTime+"</li>"+
      		  		   htmlbutton+
				"</ul></div>";
			})
			if(html=="")
			{
				html="暂无数据";
			}
			//alert(html);
			$("#videoClass_list").html(html);
		})
	} 
});
     

function orderfj(oid){
	window.location.href="weixin/hy/memberOrderfj.jsp?orderId="+oid;
}
	

	
