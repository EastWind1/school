var page2=window.localStorage.getItem("page2");
 if(page2==null||page2=="null"){
	 page2=0;
 }
getData();
/**
 * 获取课程
 */
function getData(){
	var sel=$.Params.create();
	sel.addParams("publicNo",brandId); 
	sel.addParams("page",page2);
	sel.addParams("rows",rows);
	if(memberId != ""){
		sel.addParams("memberId",memberId);
	}
	sel.addParams("deleteState","1"); 
	sel.addParams("price","0"); 
	getPageData(sel,getIP()+"course.action?getCourse",function(data){
		if(data.success){
			var len = data.total;
			//var len=data.rows.length
			page2=data.page;
			window.localStorage.setItem("page2",page2);
			var html="";
			if(len >0){
				$.each(data.rows,function(i,val){	
					var htmlbutton="";
					var time;
					/*if(val.price == 0){
					time=val.startDate;
					htmlbutton="<div class='ol_baomingNum'><span>报名人数</span><div>"+val.signNum+"/"+val.setNum+"</div></div>"+"<a class='ol_baomingBtn active' onclick='signup(\""+val.id+"\",\""+val.expertOpenid+"\")'>报名</a>";
				}else{*/
						var startTime=val.filed3;
						var endTime=val.filed5;
						var coureTime=startTime+"~"+endTime;
						
						var startDate=val.startDate;
						var start=startDate.substring(0,startDate.lastIndexOf(":"));
						var endDate=val.endDate;
						var end=endDate.substring(endDate.lastIndexOf(" ")+1,endDate.lastIndexOf(":"));
						time=start+"~"+end;
						var date = new Date()
						var timestamp1=date.getTime();
						
						var dt = new Date(endDate.replace(/-/,"/")) 
						var timestamp2=dt.getTime();
						if(timestamp1>timestamp2){
							htmlbutton="<div class='ol_baomingNum'><span>报名人数</span><div>"+val.signNum+"/"+val.setNum+"</div></div>"+"<a style='background-color:#ccc' class='ol_baomingBtn'>已结束</a>";
						}else{
							htmlbutton="<div class='ol_baomingNum'><span>报名人数</span><div>"+val.signNum+"/"+val.setNum+"</div></div>"+"<a class='ol_baomingBtn active' onclick='signup(\""+val.id+"\",\""+val.expertOpenid+"\")'>报名</a>";
						}
				/*	}*/
					
				
					var czanButton="<a onclick='zan(\""+val.id+"\",\""+val.expertOpenid+"\")' class='ol_unzan hasPointer'>点赞("+val.zanNum+")</a>";
					if(memberId != "" && openId != "" && openId != null){
						if(val.signnum == 1){
							htmlbutton="<div class='ol_baomingNum'><span>报名人数</span><div>"+val.signNum+"/"+val.setNum+"</div></div>"+"<a class='ol_baomingBtn' onclick='cancleuppc(\""+val.id+"\",\""+val.expertOpenid+"\")'>取消报名</a>";
						}else if(val.signNum >= val.setNum){
							htmlbutton="<div class='ol_baomingNum'><span>报名人数</span><div>"+val.setNum+"/"+val.setNum+"</div></div>"+"<a class='ol_baomingBtn meym'>名额已满</a>";
						}    
						if(val.czannum>0){
							czanButton="<a class='ol_zan hasPointer'>已赞("+val.zanNum+")</a>";
						}

					}else{
						if(val.signNum >= val.setNum){
							htmlbutton="<div class='ol_baomingNum'><span>报名人数</span><div>"+val.setNum+"/"+val.setNum+"</div></div>"+"<a class='ol_baomingBtn meym'>名额已满</a>";
						}
					}
					html+="<div class='ol_ClassList'><div class='ol_ClassImg'><img src='data/course/"+val.filed2+"' onclick='getDetail(\""+val.id+"\")'/></div>"+
							  "<ul class='ol_ClassInfo'><li><label onclick='getDetail(\""+val.id+"\")' class='ol_ClassInfoTitle hasPointer'>"+val.title+"</label></li>"+
							  "<li><label for=''>专家姓名：</label><span class='ol_expertName'>"+val.name+"</span></li>"+
							  "<li><label for=''>开课时间：</label><span class='ol_createTime'>"+coureTime+"</span></li></ul>"+
							 // "<div class='ol_baomingNum'><span>报名人数</span><div>"+val.signNum+"/"+val.setNum+"</div></div>"+
							  htmlbutton+czanButton+"<a onclick='pinglun(this)' class='pct_CollectPinglun'>评论</a><textarea placeholder='请输入评论内容' class='pinglun_box'></textarea><input onclick='addPl(this,\""+val.id+"\",\""+val.title+"\")' type='button' value='评论' class='pct_CollectPlBtn' /></div>";

				})
			}else{
				html="暂无数据";
			}
			$(".ol_ClassContainer").html(html);
		}else{
			alert(data.msg);
		}
	});
}
/**
 * 确定是否报名
 * @param cid
 * @param eid
 * @return
 */
function signup(cid,eid){
	$("#modalcont").html("确定要报名吗？");
	if(memberId == ""){
		//alert("请先登录！");
		window.localStorage.setItem("htmlurl",htmlurl);
		window.location.href=getIP()+"PC/login.jsp";
	}
	else if(openId == "" || openId == null){
		window.location.href=getIP()+"PC/newErweimaLog.jsp";
	}
	else{
   		$("#responsive").modal('toggle');

	}
	$("#subBtn").off("click");
	$("#subBtn").on("click",function(){
		baoming(cid,eid);
	})

	
}

/**
 * 报名
 * @param {Object} cid
 * @param {Object} eid
 */
function baoming(cid,eid){
	if(memberId == ""){
		//alert("请先登录！");
		window.localStorage.setItem("htmlurl",htmlurl);
		window.location.href=getIP()+"PC/login.jsp";
	}else if(openId == "" || openId == null){
		window.location.href=getIP()+"PC/newErweimaLog.jsp";
	}else{	
		var add=$.Params.create();
		add.addParams("courseId",cid); 
		add.addParams("expertId",eid); 
		add.addParams("memberId",memberId); 
		add.addParams("filed1","1");
		add.addParams("filed4",place); 
		add.ajax(getIP()+"logcsign.action?add",function(data){
			if(data.success){
				getData();
				$("#responsive").modal('toggle');
			}else{
				alert(data.msg);
				return false;
			}
		})
	}
}
/**
 * 点赞
 * @param cid
 * @param eid
 * @return
 */
function zan(cid,eid){
	if(memberId == ""){
		//alert("请先登录！");
		window.localStorage.setItem("htmlurl",htmlurl);
		window.location.href=getIP()+"PC/login.jsp";
	}else if(openId == "" || openId == null){
		window.location.href=getIP()+"PC/newErweimaLog.jsp";
	}else{
		var add=$.Params.create();
		add.addParams("courseId",cid); 
		add.addParams("expertId",eid); 
		add.addParams("memberId",memberId); 
		add.addParams("type",1); 
		add.addParams("filed1","1"); 
		add.addParams("filed4",place); 
		add.ajax(getIP()+"logczan.action?add",function(data){
			if(data.success){
			getData();
			}else{
				alert(data.msg);
				return false;
			}
		})
	}
}	

/**
 * 确定是否取消
 */
function cancleuppc(cid,eid){
	$("#modalcont").html("确定要取消报名吗？");
	if(memberId == ""){
		//alert("请先登录！");
		window.localStorage.setItem("htmlurl",htmlurl);
		window.location.href=getIP()+"PC/login.jsp";
	}
	else if(openId == "" || openId == null){
		window.location.href=getIP()+"PC/newErweimaLog.jsp";
	}
	else{
   		$("#responsive").modal('toggle');

	}
	$("#subBtn").off("click");
	$("#subBtn").on("click",function(){
		quxiaobaoming(cid,eid);
	})

	
}

/**
 * 取消报名
 * @param {Object} cid
 * @param {Object} eid
 */
function quxiaobaoming(cid,eid){
//	alert(cid+"......"+eid)
	var update=$.Params.create();
	update.addParams("courseId",cid);  
	update.addParams("memberId",memberId); 
	update.addParams("filed1","1");  
	update.ajax(getIP()+"logcsign.action?deleteByelements",function(data){
		getData();
		$("#responsive").modal('hide');
	})
}

/*处理评论框*/
function pinglun(obj){
if(memberId == ""){
		//alert("请先登录！");
		window.localStorage.setItem("htmlurl",htmlurl);
		window.location.href=getIP()+"PC/login.jsp";
	}else if(openId == "" || openId == null){
		window.location.href=getIP()+"PC/newErweimaLog.jsp";
	}
	else{
	if($(obj).parent().css("marginBottom")=="66px"){
		$(obj).parent().css("margin-bottom","0");
	}else{
		$(obj).parent().css("margin-bottom","66px");
	}
	var par=$(obj).parent().find(".pinglun_box, .pct_CollectPlBtn");
	$(obj).parent().find(".pinglun_box, .pct_CollectPlBtn").toggle();
	}
}
/*评论功能*/
function addPl(obj,courseId,courseName){
		var plContent=$(obj).parent().find("textarea").val().trim();
		var length=plContent.length;
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
	if(length>200){
		alert("请输入200字以内评论");
		return false;
	}
	var add=$.Params.create();
	add.addParams("courseId",courseId);
	add.addParams("filed1",courseName);
	add.addParams("content",plContent);
	add.addParams("filed2",userName);
	add.addParams("memberId",memberId);
	add.addParams("type",1);
	add.addParams("place",place);
	add.ajax(getIP()+"feedBack.action?add",function(data){
   		if(data.success){
			$("#responsive").modal('hide');
			//alert("评论成功");
			window.location.href=getIP()+"PC/newcrouseDetails.jsp?eid="+courseId;
   		}
	})
	
}
function getDetail(id){
//	if(memberId == ""){
//		alert("请先登录！");
//		window.location.href=getIP()+"PC/newIndex.jsp";
//	}
//	else if(openId == "" || openId == null){
//		window.location.href=getIP()+"PC/newErweimaLog.jsp";
//	}else{
		window.location.href=getIP()+"PC/newcrouseDetails.jsp?eid="+id;
//	}
}
