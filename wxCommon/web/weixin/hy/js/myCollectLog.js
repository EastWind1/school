
getData();

function getData(){
	var p=$.Params.create();
	p.addParams("publicNo",brandId); 
	p.addParams("memberId",memberId); 
	p.ajax(getIP()+"courseDb.action?getCourseDb",function(data){
		var html="";
		$.each(data.rows,function(i,val){	
			var htmlbutton="";
			if(val.collnum > 0){
				htmlbutton="<img onclick='canclecollect(\""+val.id+"\",\""+val.expertOpenid+"\",this)' src='weixin/images/demand_collect1.png' />("+val.collectNum+")";
				var czanButton="";
				if(val.czannum>0){
					czanButton="<img src='weixin/images/demand_praise1.png' />("+val.zanNum+")";
				}else{
					czanButton="<img onclick='zan(\""+val.id+"\",\""+val.expertOpenid+"\",this)' src='weixin/images/demand_praise0.png' />("+val.zanNum+")";
				}
//				html+="<div class='card listsz'><ul class='table-view' style='margin-left:0px;'>"+
//					  "<li class='table-view-cell titleclass'><i><img src='weixin/images/demand_title.png' /></i><span>"+val.title+"</span></li>"+
//					  "<li class='table-view-cell classIn noBr'><p><span>开课专家："+val.name+"</span></p></li>" +
//					  "<li class='table-view-cell footbar'><p>"+czanButton+"</p>" +
//					  "<p>"+htmlbutton+"</p><p onclick='gofeedback(\""+val.id+"\",2)'>评论</p></li>"+
//					  "<p>"+htmlbutton+"</p><p onclick='getExpert(\""+val.id+"\")'>查看详情</p></li>"+
// 					  czanButton+" "+htmlbutton+"<span class='onLineClass_play'>查看详情</span></li>"+
//					  "</ul></div>"; 
				
				
				html+="<div class='card listsz'><ul class='table-view' style='margin-left:0px;'>" +
				"<li style='padding-right:5px;' onclick='getExpert(\""+val.id+"\")' class='table-view-cell media'>" +
				"<img style='width:45%' id='detail' class='media-object pull-left' src='data/course/"+val.filed2+"'>" +
				"<div class='media-body expertInfo'><p>"+val.title+"</p><p>开课专家："+val.name+"</p><p>"+val.doctorCertificate+"</p></div></li>" +
				 "<li class='table-view-cell footbar'><p>"+czanButton+"</p>" +
		  		  "<p>"+htmlbutton+"</p><p onclick='gofeedback(\""+val.id+"\",2)'>评论</p></li>"+
				"</ul></div>";
			}	
		})
		if(html == ""){
			html="暂无数据";
		}
		$("#videoClass_list").html(html);
	})
}
/**
 * 进入课程反馈
 * @param eid
 * @return
 */
function gofeedback(cid,cname){
	//alert(cname);
	window.location.href="weixin/hy/feedBackAdd.jsp?cid="+cid+"&cname="+cname;
}

/**
 * 查看详情
 * @param eid
 * @return
 */
function getExpert(eid){
	window.location.href="weixin/hy/videoClassDetails.jsp?eid="+eid;
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
	add.addParams("type",2); 
	add.addParams("filed4",place); 
	add.ajax(getIP()+"logczan.action?add",function(data){
		getData();
	})
}

/**
 * 收藏
 * @param cid
 * @param eid
 * @return
 */
function collect(cid,eid,col){
	if(confirm("确定要取消收藏吗？")){
		$(col).attr("src","weixin/images/demand_collect1.png");
		var add=$.Params.create();
		add.addParams("courseId",cid); 
		add.addParams("expertId",eid); 
		add.addParams("memberId",memberId); 
		add.addParams("filed4",place); 
		add.ajax(getIP()+"logcollect.action?add",function(data){
			getData();
		})
	}
}
	
