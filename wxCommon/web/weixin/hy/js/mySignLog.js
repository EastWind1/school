getData();

/**
 * 获取课程
 */
function getData(){
	var sel=$.Params.create();
	sel.addParams("publicNo",brandId); 
	sel.addParams("memberId",memberId); 
	sel.ajax(getIP()+"course.action?getCourse",function(data){
		var html="";
		$.each(data.rows,function(i,val){	
			
			var htmlbutton="";
			if(val.signnum == 1){
				htmlbutton="<span onclick='cancleup(\""+val.id+"\",\""+val.expertOpenid+"\")'>取消报名</span>";
				var czanButton="";
				if(val.czannum>0){
					czanButton="<img src='weixin/images/demand_praise1.png' />("+val.zanNum+")";
				}else{
					czanButton="<img onclick='zan(\""+val.id+"\",\""+val.expertOpenid+"\",this)' src='weixin/images/demand_praise0.png' />("+val.zanNum+")";
				}
				
				 //html+="<div class='card listsz'><ul class='table-view' style='margin-left:0px;'>"+
				  //"<li class='table-view-cell titleclass' onclick='getExpert(\""+val.id+"\")'><i><img src='weixin/images/demand_title.png' /></i><span>"+val.title+"</span></li>"+
				  //"<li class='table-view-cell classIn noBr'><p><span>开课专家："+val.name+"</span></p></li>" +
				 //"<li class='table-view-cell classIn noBr'><p style='width:100%'><span>开课时间："+val.startDate+"</span></p></li>" +
				  //"<li class='table-view-cell footbar'><p>"+czanButton+"</p>" +
				  //"<p>"+htmlbutton+"</p><p onclick='gofeedback(\""+val.id+"\",1)'>评论</p></li>"+
				 // czanButton+" "+htmlbutton+"<span class='onLineClass_play'>查看详情</span></li>"+
				  //"</ul></div>"; 

				 /* html+="<div class='card listsz'><ul class='table-view' style='margin-left:0px;'>"+
					  "<li onclick='getExpert(\""+val.id+"\")' class='table-view-cell titleclass'><span>"+val.title+"</span></li>"+
					  "<li onclick='getExpert(\""+val.id+"\")' class='table-view-cell classIn noBr'><small>开课专家："+val.name+"</small></li>"+
					  "<li onclick='getExpert(\""+val.id+"\")' class='table-view-cell classIn noBr'><small>报名人数：<font color='#00c53c'>"+val.signNum+"/"+val.setNum+"</font></small></li>"+
					  "<li class='table-view-cell classIn'><small>开课时间："+val.startDate+"</small>"+
					  htmlbutton+" "+czanButton+"</li></ul></div>"; 	*/
				
				html+="<div class='card listsz'><ul class='table-view' style='margin-left:0px;'>" +
				"<li style='padding-right:5px;' onclick='getExpert(\""+val.id+"\")' class='table-view-cell media'>" +
				"<img style='width:45%' id='detail' class='media-object pull-left' src='data/course/"+val.filed2+"'>" +
				"<div class='media-body expertInfo'><p>"+val.title+"</p><p>开课专家："+val.name+"</p><p>开课时间："+val.createTime+"</p></div></li>" +
				 "<li class='table-view-cell footbar'><p>"+czanButton+"</p>" +
		  		  "<p>"+htmlbutton+"</p><p onclick='gofeedback(\""+val.id+"\",1)'>评论</p></li>"+
				"</ul></div>";
			}
			
			
		})
		if(html == ""){
			html="暂无数据";
		}
		$("#yjk").html(html);
	})
}

	
/**
 * 详情
 * @param eid
 * @return
 */
function getExpert(eid){
	window.location.href="weixin/hy/classOnlineDetails.jsp?eid="+eid;
}

/**
 * 进入课程反馈
 * @param eid
 * @return
 */
function gofeedback(cid,ctype){
	window.location.href="weixin/hy/feedBackAdd.jsp?cid="+cid+"&ctype="+ctype;
}

/**
 * 报名
 * @param cid
 * @param eid
 * @return
 */
function signup(cid,eid){
	var add=$.Params.create();
	add.addParams("courseId",cid); 
	add.addParams("expertId",eid); 
	add.addParams("memberId",openId); 
	add.ajax(getIP()+"logcsign.action?add",function(data){
		getData();
	})
}

/**
 * 点赞
 * @param cid
 * @param eid
 * @return
 */
function zan(cid,eid,za){
	$(za).attr("src","weixin/images/demand_praise1.png");
	var add=$.Params.create();
	add.addParams("courseId",cid); 
	add.addParams("expertId",eid); 
	add.addParams("memberId",memberId); 
	add.addParams("type",1); 
	add.ajax(getIP()+"logczan.action?add",function(data){
		getData();
	})
}


	
