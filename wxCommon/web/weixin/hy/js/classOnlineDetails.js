	var eid=GetQueryString("eid");
	getData();
	function getData(){
			var p=$.Params.create();
			p.addParams("id",eid); 
			p.addParams("memberId",memberId); 
		    p.ajax(getIP()+"course.action?getCourse",function(data){
		    	var html="";
		    	$.each(data.rows,function(i,val){	
		    		var htmlbutton="";
		    		var time;
		    		var startTime=val.filed3;
					var endTime=val.filed5;
					if(endTime == null || endTime=="null"){
						endTime="";
					}else{
						endTime="~"+endTime;
					}
					var coureTime=startTime+endTime;
					if(val.price == 0){
						time=val.startDate;
						if(val.signnum == 1){
							htmlbutton="<a style='color:#e8b20c' class='btn btn-primary btn-block' onclick='cancleup(\""+val.id+"\",\""+val.expertOpenid+"\")'>取消报名("+val.signNum+"/"+val.setNum+")</a>";
						}else if(val.signNum == val.setNum){
							htmlbutton="<a class='btn btn-primary btn-block'>名额已满("+val.signNum+"/"+val.setNum+")</a>";
						}else{
							htmlbutton="<a class='btn btn-primary btn-block' onclick='signup(\""+val.id+"\",\""+val.expertOpenid+"\")'>报名("+val.signNum+"/"+val.setNum+")</a>";
						}
						
					}else{
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
							htmlbutton="<span style='color:#ccc'>已结束</span>";
						}else{ 
							if(val.signnum == 1){
								htmlbutton="<a class='btn btn-primary btn-block' onclick='cancleup(\""+val.id+"\",\""+val.expertOpenid+"\")'>取消报名("+val.signNum+"/"+val.setNum+")</a>";
							}else if(val.signNum == val.setNum){
								htmlbutton="<a class='btn btn-primary btn-block'>名额已满("+val.signNum+"/"+val.setNum+")</a>";
							}else{
								htmlbutton="<a class='btn btn-primary btn-block' onclick='signup(\""+val.id+"\",\""+val.expertOpenid+"\")'>报名("+val.signNum+"/"+val.setNum+")</a>";
							}
						}
					}
					var hedimg=val.headImg;
		    		if(hedimg == "" || hedimg == null){
		    			hedimg="default.jpg";
		    		}
		    		var jobTitle=val.jobTitle;
		    		if(jobTitle == "null" || jobTitle == null ){
		    			jobTitle="";
		    		}
		    		var doctorCertificate=val.doctorCertificate;
		    		if(doctorCertificate == "null" || doctorCertificate == null ){
		    			doctorCertificate="";
		    		}
		    		html+="<div class='card nonemagin'><ul class='table-view classdetail'><li class='table-view-cell classTitle'>"+val.title+"</li>"+
	 				      "<li class='table-view-cell classtop'>"+coureTime+"<span>报名人数：<font color='#00c53c'>"+val.signNum+"/"+val.setNum+"</font></span></li>"+
	 				      "<li class='table-view-cell media'><img style='width:100px;border-radius:50%;' class='media-object pull-left' src='data/expert/"+hedimg+"' />"+
	 				      "<div class='media-body expertInfo'>"+val.name+"<p>"+jobTitle+"</p><p>"+doctorCertificate+"</p></div></li>"+
	 				      "<li class='table-view-cell classInfo' bs='0' onClick='checkExportInfo(this)'>专家介绍<img style='width:18px;float:right;' src='weixin/images/zk0.png' /></li>"+
	 				      "<li id='exportInfo' class='table-view-cell classInfo_content' style='display:none'>"+val.summary+"</li>"+
	 				      "<li class='table-view-cell classInfo'>课程简介</li>"+
	 					  "<li class='table-view-cell classInfo_content'>"+val.profile+"</li></ul><div class='content-padded'>"+
	 					  htmlbutton+"</div></div>";
		    	})
		    	$("#content").html(html);
		    })
		 }
		/**
		 * 报名
		 * @param cid
		 * @param eid
		 * @return
		 */
		function signup(cid,eid){
			if(memberId == ""){
				alert("请先注册");
				window.location.href="weixin/register/register.jsp";
			}else{
					if(confirm("确定要报名吗？")){
				var add=$.Params.create();
				add.addParams("courseId",cid); 
				add.addParams("expertId",eid); 
				add.addParams("memberId",memberId); 
				add.addParams("filed1","1"); 
				add.addParams("filed4",place); 
				add.ajax(getIP()+"logcsign.action?add",function(data){
					if(data.success){
						getData();
						}else{
							alert("你已经报名了");
							return false;
						}
				})
			}
		}
			}
		
		
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
		
		