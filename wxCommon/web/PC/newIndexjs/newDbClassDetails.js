//if(memberId==""){
//	window.location.href=getIP()+"PC/newIndex.jsp";
//}
var eid=GetQueryString("eid");
var p=$.Params.create();
var cid;
var eoid;
var flag=false;
 			
getData();
function getData(){
	p.addParams("id",eid); 
	if(memberId != ""){
		p.addParams("memberId",memberId);
	}
	p.ajax(getIP()+"courseDb.action?getCourseDb",function(data){
		var val=data.rows[0];
		var html='';
		
		
		cid = val.id;
		eoid = val.expertOpenid;
		
		var htmlbutton="<a class='db_collectBtn active' onclick='collect(\""+val.id+"\",\""+val.expertOpenid+"\")'>收藏</a>";
		var czanButton="<a onclick='zan(\""+val.id+"\",\""+val.expertOpenid+"\")' class='db_unzan hasPointer'>点赞("+val.zanNum+")</a>";
		if(memberId != "" && openId != "" && openId != null){
			if(val.collnum > 0){
				htmlbutton="<a class='db_collectBtn' onclick='canclecollect(\""+val.id+"\",\""+val.expertOpenid+"\")'>取消收藏</a>";
			}
			if(val.czannum>0){
				czanButton="<a class='db_zan hasPointer'>已赞("+val.zanNum+")</a>";
			}
		}
		

		
		
		var video=val.attachments1;
		var pdf=val.attachments2;
		var jobTitle=val.jobTitle;
		if(jobTitle=="" || jobTitle == null ||jobTitle=="null"){
			jobTitle="暂无";
		}
		var zj_profile="";
		if(val.summary==""){
			zj_profile="<div class='exp_summary'><h3 class='exp_summaryTitle db_ClassTitle'>专家简介</h3><p class='dbClass_profilet'>暂无简介内容</p></div>";
		}else{
			zj_profile="<div class='exp_summary'><h3 class='exp_summaryTitle db_ClassTitle'>专家简介</h3><p class='dbClass_profilet'>"+val.summary+"</p></div>";
		}
		if(pdf!="" && pdf!=null && video!="" && video!=null){
			html="<div class='db_ClassList db_ClassDetails'><div class='db_ClassImg'><img src='data/course/"+val.filed2+"'>"+
			  "</div><ul class='db_ClassInfo'><li><label for='' class='db_ClassInfoTitle  noPointer'>"+val.title+
			  "</label></li><li><label for=''>专家姓名：</label><span class='db_expertName'>"+val.name+"</span></li><li>"+
		      "<li><label for=''>职称：</label><span class='db_createTime'>"+jobTitle+"</span></li>"+
		      "<li><label for=''>医院科室：</label><span class='db_createTime'>"+val.doctorCertificate+"</span></li>"+
		      "</ul>"+
			  "<div class='db_playNum'><span>点播次数</span><div>"+val.reqnum+"</div></div>"+
			  htmlbutton+czanButton+
			  "</div></div>"+zj_profile+"<div class='exp_summary'><h3 class='exp_summaryTitle db_ClassTitle'>课程简介</h3>"+
			  "<p class='dbClass_profilet'>"+val.profile+"</p></div>";	
			
			
			if(flag==false){
				$(".playPdf").prepend("<div class='play_PDForVideo playVideo' style='text-align:center;float: left;position: relative;height: 314px;;width: 49%;vertical-align: middle;'>" +
					  			  "<a onclick='vediodetail(\""+val.attachments2+"\",\""+val.id+"\",\""+val.expertOpenid+"\")'  style='display: block; padding:0px; height: 100%;color:#fff;border: 1px solid #ccc;'><img style='height:100%' src='data/course/"+val.filed2+"' /></a>" +
					  			  "</div></div>");
				
				$(".playSinge").addClass("db_singe");
				flag=true;
			}
			
			
			$("#video1").html("<source id='videoSrc' src='data/video/"+val.attachments1+"' type='video/mp4' />");
			$(".exp_expDetails").html(html);
		}else{
			var attachments=val.attachmentsType;
			if(attachments == "1"){
				$("#video1").css("width","50%");
				$("#video1").html("<source id='videoSrc' src='data/video/"+val.attachments1+"' type='video/mp4' />");
			}else{
				attachments="<a  onclick='vediodetail(\""+val.attachments2+"\",\""+val.id+"\",\""+val.expertOpenid+"\")'  style='height:100%;display: inline-block;background-color: #000;filter: alpha(opacity=50);opacity: 0.5;'>"+
				"<img style='width:50%' class='dbClass_PDF'src='data/course/"+val.filed2+"' />"+
				"</a><a  onclick='vediodetail(\""+val.attachments2+"\",\""+val.id+"\",\""+val.expertOpenid+"\")'  class='pdfPlay'></a>";
				$(".play_PDForVideo").html(attachments);
			}
		
		
//		var attachments=val.attachmentsType;
//		if(attachments == "1"){
//			$("#video1").html("<source id='videoSrc' src='data/video/"+val.attachments1+"' type='video/mp4' />");
//		}else{
//			attachments="<a  onclick='vediodetail(\""+val.attachments2+"\",\""+val.id+"\",\""+val.expertOpenid+"\")'  style='height:100%;display: inline-block;background-color: #000;filter: alpha(opacity=50);opacity: 0.5;'>"+
//			"<img class='dbClass_PDF'src='data/course/"+val.filed2+"' />"+
//			"</a><a  onclick='vediodetail(\""+val.attachments2+"\",\""+val.id+"\",\""+val.expertOpenid+"\")'  class='pdfPlay'></a>";
//			$(".play_PDForVideo").html(attachments);
//		}
//		
		var zj_profile="";
		if(val.summary==""){
			zj_profile="<div class='exp_summary'><h3 class='exp_summaryTitle db_ClassTitle'>专家简介</h3><p class='dbClass_profilet'>暂无简介内容</p></div>";
		}else{
			zj_profile="<div class='exp_summary'><h3 class='exp_summaryTitle db_ClassTitle'>专家简介</h3><p class='dbClass_profilet'>"+val.summary+"</p></div>";
		}
		html+="<div class='db_ClassList db_ClassDetails'><div class='db_ClassImg'><img src='data/course/"+val.filed2+"'>"+
			  "</div><ul class='db_ClassInfo'><li><label for='' class='db_ClassInfoTitle  noPointer'>"+val.title+
			  "</label></li><li><label for=''>专家姓名：</label><span class='db_expertName'>"+val.name+"</span></li><li>"+
		      "<li><label for=''>职称：</label><span class='db_createTime'>"+jobTitle+"</span></li>"+
		      "<li><label for=''>医院科室：</label><span class='db_createTime'>"+val.doctorCertificate+"</span></li>"+
		      "</ul>"+
			  "<div class='db_playNum'><span>点播次数</span><div>"+val.reqnum+"</div></div>"+
			  htmlbutton+czanButton+
			  "</div></div>"+zj_profile+"<div class='exp_summary'><h3 class='exp_summaryTitle db_ClassTitle'>课程简介</h3>"+
			  "<p class='dbClass_profilet'>"+val.profile+"</p></div>";	

				$(".exp_expDetails").html(html);
		}
	})
	getPinglun();
}

function getPinglun(){
	var pl=$.Params.create();
	pl.addParams("courseId",eid); 
	pl.addParams("page",0); 
	pl.addParams("rows",rows); 
	getPageData(pl,getIP()+"feedBack.action?getpl",function(data){
		if(data.success){
   			var len = data.total;
	   		var html="";
			if(len >0){
				$("#pagination").show();
				$.each(data.rows,function(i,val){
					html+="<p class='tit'>["+val.hospitalName+"] "+val.name+"：<a>"+val.createTime+"</a></p><p class='con'>"+val.content+"</p>";
				})
				$(".ol_classDetailsTitle").html("课程评论（共"+len+"条）");
			}else{
				$("#pagination").hide();
				html="暂无评论";
		   		$(".ol_classDetailsTitle").html("课程评论（共0条）");
			}
			$("#feedBackList").html(html);
		}
	})
}

$("#backDbList").on("click",function(){
	window.location.href="PC/newDbClass.jsp";
})



var playBtn=document.getElementById('videoPlayBtn');
var video=document.getElementById('video1');

$("#videoPlayBtn").on("click",function(){
	playBtn.style.display='none';
	video.play();
	addDbEvent(cid,eoid);
})

video.onclick=function(){                          
	if(video.paused){
		playBtn.style.display='none';
		video.play();
		addDbEvent(cid,eoid);
		
	}else{
		playBtn.style.display='block';
		video.pause();
	}
}


/**
 * 评论
 */

$("#summDb").on("click",function(){
	var obj=$(this);
	var courseName=$(".db_ClassInfoTitle").html();
	addPl(obj,eid,courseName);
})

/**
 * 评论功能
 * @param obj
 * @param courseId
 * @param courseName
 * @return
 */
function addPl(obj,courseId,courseName){
	if(memberId == ""){
		//alert("请先登录！");
		window.localStorage.setItem("htmlurl",htmlurl);
		window.location.href=getIP()+"PC/login.jsp";
	}else if(openId == "" || openId == null){
		window.location.href=getIP()+"PC/newErweimaLog.jsp";
	}else{
		var plContent=$(obj).parent().prev().val().trim();
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
		add.addParams("type",2);
		add.addParams("place",place);
		add.ajax(getIP()+"feedBack.action?add",function(data){
	   		if(data.success){
				$("#responsive").modal('hide');
				//alert("评论成功！");
				$("#pinglun_box").val("");
				getData();
	   		}
		})
	}
}


/**
 * 播放pdf
 * */
function vediodetail(pdf,cid,exid){
	//addDbEvent(cid,eid);
	//window.open("data/pdf/"+pdf);
	   addDbEvent(cid,exid);
	   var num=pdf.split(".")[0];
		var count=0;
		if(num == 6){
			count=39;
		}else if(num == 7){
			count=36;
		}else if(num == 8){
			count=51;
		}else{
			count=33;
		}
		window.open(getIP()+"weixin/pdf.jsp?count="+count+"&num="+num);
}

/*收藏*/
function collect(cid,eid){
	$("#modalcont").html("确定要收藏吗？");
	if(memberId == ""){
		//alert("请先登录！");
		window.localStorage.setItem("htmlurl",htmlurl);
		window.location.href=getIP()+"PC/login.jsp";
	}
	else if(openId == "" || openId == null){
		window.location.href="PC/newErweimaLog.jsp";
	}
	else{
   		$("#responsive").modal('toggle');
	}
	$("#subBtn").off("click");
	$("#subBtn").on("click",function(){
		collectIng(cid,eid);
	})
}
				
function collectIng(cid,eid){
	var add=$.Params.create();
	add.addParams("courseId",cid); 
	add.addParams("expertId",eid); 
	add.addParams("memberId",memberId); 
	add.addParams("filed1","1"); 
	add.addParams("filed4",place); 
	add.ajax(getIP()+"logcollect.action?add",function(data){
		if(data.success){
		getData();
		$("#responsive").modal('toggle');
		}else{
			alert(data.msg);
			return false;
		}
	})
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
	update.addParams("memberId",memberId); 
	update.addParams("filed1","1");  
	update.ajax(getIP()+"logcollect.action?deleteByelements",function(data){
		getData();
		$("#responsive").modal('toggle');
	})
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
		add.addParams("type",2); 
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