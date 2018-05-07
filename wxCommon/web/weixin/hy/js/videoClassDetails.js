var cid;
var exid;
var eid=GetQueryString("eid");
getData();
function getData(){
		var p=$.Params.create();
		p.addParams("id",eid); 
		p.addParams("memberId",memberId); 
	 	//p.addParams("publicNo",brandId); 
	    p.ajax(getIP()+"courseDb.action?getCourseDb",function(data){
	    	var html="";
	    	$.each(data.rows,function(i,val){	
	    		var attachments="";
	    		cid=val.id;
			    exid=val.expertOpenid;
			    var pdfatta=val.attachments2;
			    var videoatta=val.attachments1;
			    if(pdfatta != null && pdfatta != ""){
	    			attachments+="<li class='classImg_show'><a><img height='106px' onclick='vediodetail(\""+val.attachments2+"\")' src='data/course/"+val.filed2+"' /></a><p>课件</p></li>";
	    		}
	    		if(videoatta != null && videoatta != ""){
	    			//attachments+="<li class='classImg_show'><video onclick='videodetail()' width='100%' height='106px' style='margin-top:15px;'><source src='data/video/"+val.attachments1+"' type='video/mp4' /></video><p>讲课视频</p></li>";
	    			attachments+="<li class='classImg_show'><a href='"+val.attachments1+"'><img height='106px' onclick='videodetail()' src='weixin/images/videoimg.png' /></a><p>讲课视频</p></li>";
	    		}
	    		
	    		var hedimg=val.headImg;
	    		if(hedimg == "" || hedimg == null){
	    			hedimg="default.jpg";
	    			
	    		}
	    		var jobTitle=val.jobTitle;
	    		if(jobTitle == null){
	    			jobTitle="";
	    		}
	    		var htmlbutton="";
	    		if(memberId == ""){
					htmlbutton="<a class='btn btn-primary btn-block' onclick='collect(\""+val.id+"\",\""+val.expertOpenid+"\",this)'>收藏</a>";
				}else{
					if(val.collnum > 0){
						htmlbutton="<a class='btn btn-primary btn-block' onclick='canclecollect(\""+val.id+"\",\""+val.expertOpenid+"\",this)'>取消收藏</a>";
					}else{
						htmlbutton="<a class='btn btn-primary btn-block' onclick='collect(\""+val.id+"\",\""+val.expertOpenid+"\",this)'>收藏";
					}
				}
	    		html+="<div class='card nonemagin'><ul class='table-view classdetail'><li class='table-view-cell classTitle'>"+val.title+"</li>"+
 				      "<li class='table-view-cell media'><img style='width:100px;height:100px;' class='media-object pull-left' src='data/expert/"+hedimg+"' />"+
 				      "<div class='media-body expertInfo'>"+val.name+"</div><div class='media-body expertInfo'>"+jobTitle+
 				      "</div><div class='media-body expertInfo'>"+val.doctorCertificate+"</div>"+
 				     // "<div class='media-body expertPost'>"+val.filed1+"</div><div class='media-body expertHospital'>"+val.filed5+"</div>"+
 				      "</li>"+
 				      "<li class='table-view-cell classInfo' bs='0' onClick='checkExportInfo(this)'>专家介绍<img style='width:18px;float:right;' src='weixin/images/zk0.png' /></li>"+
	 				  "<li id='exportInfo' class='table-view-cell classInfo_content' style='display:none'>"+val.summary+"</li>"+
 				      "<li class='table-view-cell classInfo'>课程简介</li>"+
 					  attachments+
 					  "<li class='table-view-cell classInfo_content'>"+val.profile+"</li></ul><div class='content-padded'>"+
	 					  htmlbutton+"</div></div>";
 					  
	    		
	    	})
	    	$("#content").html(html);
	    })
	}
		
var u = navigator.userAgent, app = navigator.appVersion;
var isAndroid = u.indexOf('Android') > -1 || u.indexOf('Linux') > -1;
var isiOS = !!u.match(/\(i[^;]+;( U;)? CPU.+Mac OS X/);

function vediodetail(pdf){
   //alert("");
   //alert(getIP()+"data/pdf/yl20150518.pdf");
  // window.location.href="http://ychz.s4s.com.cn/ychz/weixin/pdf2.jsp";
   //return false;
  // alert(exid);
   addDbEvent(cid,exid);
  // window.location.href="data/pdf/"+pdf;
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
	window.location.href=getIP()+"weixin/pdf.jsp?count="+count+"&num="+num;
}

/*function videodetail(){
	addDbEvent(cid,eid);
}*/

//
//function addClass(id){
//		var w=$.Params.create();
//		w.addParams("courseId",id); 
//		w.addParams("memberId",openId);
//	    w.ajax(getIP()+"memberCourse.action?add",function(data){
//	    	alert(data.msg);
//	    })
//	}

//查看专家介绍
function checkExportInfo(obj){
	var bs=$(obj).attr("bs");
	if(bs == "0"){
		$(obj).attr("bs","1");
		$(obj).find("img").attr("src","weixin/images/zk1.png");
		$("#exportInfo").show();
	}else{
		$(obj).attr("bs","0");
		$(obj).find("img").attr("src","weixin/images/zk0.png");
		$("#exportInfo").hide();
	}
	
	
}	



/**
 * 收藏
 * @param cid
 * @param eid
 * @return
 */
function collect(cid,eid,col){
	if(memberId == ""){
		alert("请先注册");
		window.location.href="weixin/register/register.jsp";
	}else{
		if(confirm("确定要收藏吗？")){
			$(col).attr("src","weixin/images/demand_collect1.png");
			var add=$.Params.create();
			add.addParams("courseId",cid); 
			add.addParams("expertId",eid); 
			add.addParams("memberId",memberId); 
			add.addParams("filed1","1");
			add.addParams("filed4",place); 
			add.ajax(getIP()+"logcollect.action?add",function(data){
				if(data.success){
					getData();
					}else{
						alert("你已经收藏了");
						return false;
					}
			})
		}
	
	}
}