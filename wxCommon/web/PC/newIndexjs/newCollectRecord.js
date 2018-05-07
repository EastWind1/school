//var page=0;
getData();
function getData(){
	var sel=$.Params.create();
	
	//sel.addParams("page",page);
	//sel.addParams("rows",rows);	
	sel.addParams("memberId",memberId);
	sel.ajax(getIP()+"courseDb.action?getCourseDb",function(data){
   		if(data.success){
   			var len = data.rows.length;
   			//var len =data.total;
   			//page=data.page;
	   		var html="";
			if(len >0){
				$.each(data.rows,function(i,val){	
					if(val.collnum > 0){
						var collectButton="<a id='dbClass_qxCollect' class='pct_CancelCollect' onclick='canclecollect(\""+val.id+"\",\""+val.expertOpenid+"\")'>&nbsp;&nbsp;&nbsp;取消收藏</a>";
					
						var czanButton="<a class='pctCollectClass_zan' onclick='zan(\""+val.id+"\",\""+val.expertOpenid+"\")'>("+val.zanNum+")<i style='margin: 0 -13px 0 7px;'>|</i></a>";
						
						if(val.czannum>0){
							czanButton="<a class='pctCollectClass_zan'>已赞("+val.zanNum+")<i style='margin: 0 -13px 0 7px;'>|</i></a>";
						}else{
							czanButton="<a onclick='zan(\""+val.id+"\",\""+val.expertOpenid+"\")' class='pctCollectClass_unzan'>（"+val.zanNum+"）|</a>";
						}
						var createTime=val.createTime;
						if(createTime==null||createTime=="null"){
							createTime="";
						}
					    html+="<div class='pct_vidoClass'><div class='pct_vidoClass_expImg'><img onclick='getDetail(\""+val.id+"\")' src='data/course/"+val.filed2+"' /></div>"+
							  "<ul class='pct_vidoClass_info'><li onclick='getDetail(\""+val.id+"\")'><h3 class='dbClass_name hasPointer'>"+val.title+"</li>"+
							  "<li><label for=''>收藏人数：</label><span>"+val.collectNum+"</span></li>"+
							  "<li><label for=''>发布时间：</label><span class='olClass_startDate'>"+createTime+"</span></li></ul>"+
							  czanButton+"<a onclick='pinglun(this)' class='pct_CollectPinglun'>评论 <i style='margin: 0 4px 0 0;'>|</i></a>"+
							  collectButton+"<textarea placeholder='期待您的想法' class='pinglun_box'></textarea><input onclick='addPl(this,\""+val.id+"\",\""+val.title+"\")' type='button' value='评论' class='pct_CollectPlBtn' /></div>";
					}
				})
			}
			if(html=="")
			{
				html="暂无数据";
			}
			$(".pct_CollectContent").html(html);
   		}else{
   			alert(data.msg);
   		}
   	});
}
		
		
function pinglun(obj){
	if($(obj).parent().css("marginBottom")=="66px"){
		$(obj).parent().css("margin-bottom","0");
	}else{
		$(obj).parent().css("margin-bottom","66px");
	}
	var par=$(obj).parent().find(".pinglun_box, .pct_CollectPlBtn");
	$(obj).parent().find(".pinglun_box, .pct_CollectPlBtn").toggle();
}
		
		
function addPl(obj,courseId,courseName){
	var plContent=$(obj).parent().find("textarea").val().trim();
	var courseId=courseId;
	var courseName=courseName;
	var str=plContent.split("<");
	var str1=plContent.split(">");
	var le1=str.length;
	var le2=str1.length;
	if(le1>=2||le2>=2){
		alert("有非法字符，请重新输入");
		return false;
	}
	if(plContent == ""){
		alert("评论内容不能为空！");
		return false;
	}
	var add=$.Params.create();
	add.addParams("courseId",courseId);
	add.addParams("filed1",courseName);
	add.addParams("content",plContent);
	add.addParams("filed2",userName);
	add.addParams("memberId",openId);
	add.addParams("type",2);
	add.addParams("place",place);
	add.ajax(getIP()+"feedBack.action?add",function(data){
   		if(data.success){
   			alert("评论成功");
			$("#responsive").modal('hide');
			getData();
   		}
	})
}
		
/*点赞 */
function zan(cid,eid){
	if(memberId == ""){
		window.location.href="PC/newIndex.jsp";
	}else if(openId == "" || openId == null){
		window.location.href=getIP()+"PC/newErweimaLog.jsp";
	}else{
		var add=$.Params.create();
		add.addParams("courseId",cid); 
		add.addParams("expertId",eid); 
		add.addParams("memberId",memberId); 
		add.addParams("type",2); 
		add.addParams("filed4",place); 
		add.ajax(getIP()+"logczan.action?add",function(data){
			getData();
		})
	}
}	

	
/*****取消收藏******/
function canclecollect(cid,eid){
	$("#modalcont").html("确定要取消收藏吗？");
	if(memberId == ""){
		window.location.href=getIP()+"PC/newIndex.jsp";
	}
	else{
   		$("#responsive").modal('toggle');
	}
	$("#subBtn").off("click");
	$("#subBtn").on("click",function(){
		canclecollectIng(cid,eid);
	})
}

function canclecollectIng(cid,eid){
//	$(col).attr("src","weixin/images/demand_collect0.png");
	var update=$.Params.create();
	update.addParams("courseId",cid); 
	//update.addParams("expertId",eid); 
	update.addParams("memberId",memberId); 
	update.addParams("filed1","1"); 
	//update.addParams("filed4",place); 
	update.ajax(getIP()+"logcollect.action?deleteByelements",function(data){
		getData();
		$("#responsive").modal('toggle');
	})
}	
function getDetail(id){
	window.location.href=getIP()+"PC/newDbClassDetails.jsp?eid="+id;
}
		
