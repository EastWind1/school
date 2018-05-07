getData();
function getData(){
	var sel=$.Params.create();

	sel.addParams("publicNo",brandId); 
//	sel.addParams("page",0);
//	sel.addParams("rows",rows);
	sel.addParams("memberId",memberId);

	sel.ajax(getIP()+"course.action?getCourse",function(data){
		if(data.success){
			var len = data.rows.length;
			var html="";
			if(len >0){
				$.each(data.rows,function(i,val){	
					var htmlbutton="";
					var czanButton="";
					if(val.signnum == 1){
						htmlbutton="<a class='ol_baomingRecBtn' onclick='cancleuppc(\""+val.id+"\",\""+val.expertOpenid+"\")'>取消报名</a>";
						czanButton="<a class='pctBaomingClass_unzan hasPointer' onclick='zan(\""+val.id+"\",\""+val.expertOpenid+"\")'>("+val.zanNum+")</a>";
						
						if(val.czannum>0){
							czanButton="<a class='pctBaomingClass_zan hasPointer'>("+val.zanNum+")</a>";
						}else if(val.signNum == val.setNum){
							htmlbutton="<a class='ol_baomingRecBtn'>名额已满</a>";
						}    
						if(val.czannum>0){
							czanButton="<a class='pctBaomingClass_zan hasPointer'>已赞("+val.zanNum+")</a>";
						}
						
						html+="<div class='ol_ClassList pct_course'><div class='ol_ClassImg'><img src='data/course/"+val.filed2+"' onclick='getDetail(\""+val.id+"\")'/></div>"+
					  "<ul class='ol_ClassInfo'><li><label onclick='getDetail(\""+val.id+"\")' for='' class='ol_ClassInfoTitle hasPointer'>"+val.title+"</label></li>"+
					  "<li><label for=''>专家姓名：</label><span class='ol_expertName'>"+val.name+"</span></li>"+
					  "<li><label for=''>开课时间：</label><span class='ol_createTime'>"+val.startDate+"</span></li></ul>"+
					  "<div class='ol_baomingNum'><span>报名人数</span><div>"+val.signNum+"/"+val.setNum+"</div></div>"+
					  htmlbutton+ "<a onclick='pinglun(this)' class='pctBaoming_pinglun hasPointer'>评论 </a><i style='position: absolute;right: 8%;bottom: 8%;color:#FFA861'>|</i>"+
					  "<i style='position: absolute;right: 15%; bottom: 8%;color:#FFA861'>|</i>"+czanButton+
					  "<textarea placeholder='期待您的想法' class='pinglun_box'></textarea><input onclick='addPl(this,\""+val.id+"\",\""+val.title+"\")' type='button' value='评论' class='pct_CollectPlBtn' /></div>";  //<a class='ol_baomingGetDetails' onclick='getDetail(\""+val.id+"\")'>查看详情</a>
					}
				})

			}
			if(html=="")
			{
				html="暂无数据";
			}
			$(".pct_baomingContent").html(html);
			//page=new Page(10);
		}else{
			alert(data.msg);
		}
	});
}

function cancleuppc(cid,eid){
	$("#modalcont").html("确定要取消报名吗？");
	if(memberId == ""){
		window.location.href=getIP()+"PC/newIndex.jsp";
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
	//update.addParams("expertId",eid); 
	update.addParams("memberId",memberId); 
	update.addParams("filed1","1"); 
	//update.addParams("filed4",place); 
	update.ajax(getIP()+"logcsign.action?deleteByelements",function(data){
		getData();
		$("#responsive").modal('hide');
	})
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
	add.addParams("type",1);
	add.addParams("place",place);
	add.ajax(getIP()+"feedBack.action?add",function(data){
   		if(data.success){
   			alert("评论成功");
			getData();
   		}
	})
}
		
/*点赞 */
function zan(cid,eid){
	if(memberId == ""){
		window.location.href="PC/newIndex.jsp";
	}else if(openId == "" || openId == null){
		window.location.href="PC/newErweimaLog.jsp";
	}else{
		var add=$.Params.create();
		add.addParams("courseId",cid); 
		add.addParams("expertId",eid); 
		add.addParams("memberId",memberId); 
		add.addParams("type",1); 
		add.addParams("filed4",place); 
		add.ajax(getIP()+"logczan.action?add",function(data){
			getData();
		})
	}
}	
	
function getDetail(id){
	window.location.href="PC/newcrouseDetails.jsp?eid="+id;
}