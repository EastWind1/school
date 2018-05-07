$(function(){
	var cid=GetQueryString("cid");
	var courseType=GetQueryString("ctype");
	var cname;
	var url;
	var p=$.Params.create();
	p.addParams("id",cid); 
	if(courseType == "1"){
		url="course.action?getCourse";
	}else if(courseType="2"){
		url="courseDb.action?getCourseDb";
	}else{
		return true;
	}
    p.ajax(getIP()+url,function(data){
    	cname=data.rows[0].title;
    })
     getData()
    function getData(){
    var sel=$.Params.create();
    sel.addParams("courseId",cid);
    sel.addParams("type",courseType);
    sel.ajax(getIP()+"feedBack.action?getpl",function(data){
    	if(data.success){
    		var len=data.total;
    		$("#plCount").text("课程评论 (共"+len+"条)");
	   		var html="";
			if(len >0){
				$.each(data.rows,function(i,val){ 
					html+="<li class='table-view-cell media'><p>【"+val.hospitalName+"】<a>"+val.createTime+"</a></p><p style='padding-left:7px;'>"+val.name+"：</p>"+
 					"<p class='con'>"+val.content+"</p></li>"
				})
				
			}else{
				html="<li>暂无评论</li>";
			}
			$("#plList").html(html);
    	}
    	
    })
    }
	/**
	 * 发起预约
	 */
 	$("#reg").on("click",function(){
 		var contents=$("#contents").val().trim();
 		var length=contents.length;
 		var str=contents.split("<");
		var str1=contents.split(">");
		var le1=str.length;
		var le2=str1.length;
		if(le1>=2||le2>=2){
			alert("有非法字符，请重新输入");
			return false;
		}
 		if(contents == ""){
 			alert("请输入评论内容");
   			return false;
 		}
 		if(length>200){
 			alert("请输入200字以内评论");  
 			return false;
 		}
 		var add=$.Params.create();
 		add.addParams("courseId",cid);
 		add.addParams("filed1",cname);
 		add.addParams("content",contents);
 		add.addParams("filed2",memberName);
 		add.addParams("memberId",memberId);
 		add.addParams("type",courseType);
 		add.addParams("place",place);
 		add.ajax(getIP()+"feedBack.action?add",function(data){
 	   		if(data.success){
 				alert("提交评论成功！");
 				$("#contents").val("");
 				getData();
 				//window.location.href="weixin/hy/feedbackList.jsp";
 	   		}
 		})	
 	})
 	
 	
})	
