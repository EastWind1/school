$(function(){
	var sel=$.Params.create();

		getData();

	function getData(){
	   	sel.addParams("memberId",memberId)
		sel.ajax(getIP()+"feedBack.action?list",function(data){
	   		if(data.success){
	   			var len = data.total;
		   		var html="";
				if(len >0){
					$.each(data.rows,function(i,val){	
						html+="<div class='card listsz' style='padding:5px;'>" +
						"<ul class='table-view' style='margin-left:0px;'>"+val.filed1+
						"<li class='table-view-cell titleclass'>评论时间："+val.createTime+"</li>"+
						"<li class='table-view-cell titleclass'>评论内容："+val.content+"</li>"+
//						"<li class='table-view-cell liimg' id='uploadimg'>"+
//						"<img onclick='chooseImage(\""+val.id+"\")' src='weixin/images/upload.png' /></li>" +
						"</ul></div>";
//						html+="<div class='clasFB_record'>"+
//								"<h3 class='classFB_className'><i>&gt;</i> "+val.filed1+"</h3>"+
//								"<p class='classDB_content'>"+val.content+"</p>"+
//								"<div class='classFB_del'><a class='classFB_delBtn' onclick='delClassFB(\""+val.id+"\")'>删除</a></div>"+
//								"</div>";
					})
				}else{
					html="暂无数据";
				}
				$("#videoClass_list").html(html);
			//	App.init();
	   		}else{
	   			alert(data.msg);
	   		}
	   		
	   	});
	}
});
     


	

	
