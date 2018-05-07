getData();

/**
 * 获取课程
 */
function getData(){
	var sel=$.Params.create();
	sel.addParams("publicNo",brandId); 
	sel.addParams("memberId",memberId); 
	sel.addParams("deleteState",1); 
	sel.addParams("price","0"); 
	sel.addParams("timestamp",new Date().getTime()); 
	sel.ajax(getIP()+"course.action?getCourse",function(data){
		var html="";
		$.each(data.rows,function(i,val){	
			var htmlbutton="";
			var time;
			
		/*	if(val.price == 0){
				time=val.startDate;
				if(val.signnum == 1 && memberId !=""){
					htmlbutton="<span style='color:#e8b20c' onclick='cancleup(\""+val.id+"\",\""+val.expertOpenid+"\",this)'>取消报名</span>";
				}else if(val.signNum >= val.setNum){
					htmlbutton="<span style='color:#FF7A32'>名额已满</span>";
				}else{
					htmlbutton="<span style='color:#5BA2FF' onclick='signup(\""+val.id+"\",\""+val.expertOpenid+"\",this)'><font>报名</font>("+val.signNum+"/"+val.setNum+")</span>";
				}
				
			}else{*/
				
				var startTime=val.filed3;
				var endTime=val.filed5;
				if(endTime == null || endTime=="null"){
					endTime="";
				}else{
					endTime="~"+endTime;
				}
				var coureTime=startTime+endTime;
				
				var startDate=val.startDate;
				var start=startDate.substring(0,startDate.lastIndexOf(":"));
				var endDate=val.endDate;
				var end=endDate.substring(endDate.lastIndexOf(" ")+1,endDate.lastIndexOf(":"));
				time=start+"~"+end;
				var date = new Date()
				var timestamp1=date.getTime();
				var dt = new Date(endDate.replace(/-/g,"/")); 
				var timestamp2=dt.getTime();
				if(timestamp1>timestamp2){
					htmlbutton="<span style='color:#ccc'>已结束</span>";
				}else{ 
					if(val.signnum == 1 && memberId !=""){
						htmlbutton="<span style='color:#e8b20c' onclick='cancleup(\""+val.id+"\",\""+val.expertOpenid+"\",this)'>取消报名</span>";
					}else if(val.signNum >= val.setNum){
						htmlbutton="<span style='color:#FF7A32'>名额已满</span>";
					}else{
						htmlbutton="<span style='color:#777' onclick='signup(\""+val.id+"\",\""+val.expertOpenid+"\",this)'><font>报名</font>("+val.signNum+"/"+val.setNum+")</span>";
					}
			/*	}*/
			}
			
			if(val.id=="46f75234938e47699840c96486d8f88a"){
				time="2015-12-18 13:00 ~ 12-20 17:30"
			}
			
			var czanButton="";
			if(val.czannum>0  && memberId !="" ){
				czanButton="<img src='weixin/images/demand_praise1.png' />("+val.zanNum+")";
			}else{
				czanButton="<img onclick='zan(\""+val.id+"\",\""+val.expertOpenid+"\",\""+val.signnum+"\",\""+val.setNum+"\",this)' src='weixin/images/demand_praise0.png' />("+val.zanNum+")";
			}
			
			html+="<div class='card listsz'><ul class='table-view' style='margin-left:0px;'>" +
					"<li style='padding:5px;' onclick='getExpert(\""+val.id+"\")' class='table-view-cell media'>" +
					"<img style='width:100px;height:100px' id='detail' class='media-object pull-left' src='data/course/"+val.filed2+"'>" +
					"<div class='media-body expertInfo'><p class='costitle'>"+val.title+"</p><p>"+val.name+"</p><p>"+coureTime+"</p></div></li>" +
					 "<li class='table-view-cell footbar'><p>"+czanButton+"</p>" +
			  		  "<p>"+htmlbutton+"</p><p onclick='gofeedback(\""+val.id+"\",1)'>评论</p></li>"+
					"</ul></div>";
			
//			 html+="<div class='card listsz'><ul class='table-view' style='margin-left:0px;'>"+
//	  		  "<li class='table-view-cell titleclass'><i><img src='weixin/images/demand_title.png' /></i><span>"+val.title+"</span></li>"+
//	  		  "<li class='table-view-cell classIn noBr'><p style='width:90%'><span>开课专家："+val.name+"</span></p></li>" +
//	  		"<li class='table-view-cell classIn noBr'><p style='width:90%'><span>开课时间："+val.startDate+"</span></p></li>" +
//	  		  "<li class='table-view-cell footbar'><p>"+czanButton+"</p>" +
//	  		  "<p>"+htmlbutton+"</p><p onclick='getExpert(\""+val.id+"\")'>查看详情</p></li>"+
//	  		  "</ul></div>"; 
		})
		if(html == ""){
			html="暂无数据";
		}
		$("#yjk").html(html);
		getPosition();
	})
}

		
/**
 * 详情
 * @param eid
 * @return
 */
function getExpert(eid){
	var scrollDistance=$("#yjk").scrollTop();  //当前滚动条距离顶部的距离
	setPosition(scrollDistance);
	window.location.href="weixin/hy/classOnlineDetails.jsp?eid="+eid;
}

/**
 * 进入课程反馈
 * @param eid
 * @return
 */
function gofeedback(cid,ctype){
	if(memberId == ""){
		alert("请先注册");
		window.location.href="weixin/register/register.jsp";
	}else{
		var scrollDistance=$("#yjk").scrollTop();  //当前滚动条距离顶部的距离
		setPosition(scrollDistance);
		window.location.href="weixin/hy/feedBackAdd.jsp?cid="+cid+"&ctype="+ctype;
	}
}

/**
 * 存储当前滚动条的位置
 * @param scrollTop  滚动条距离顶部距离
 * @return
 */
function setPosition(scrollTop){
	localStorage.setItem("wx_zbScrollBar",scrollTop);
}

/**
 * 读取进入详情页前的列表位置、分类
 * @return
 */
function getPosition(){
	var posi=localStorage.getItem("wx_zbScrollBar");
	if(posi!=null || posi!= "null"){
		var srcollDistance=posi;
		$("#yjk").scrollTop(srcollDistance);
		return posi;
	}
}


/**
 * 报名
 * @param cid
 * @param eid
 * @return
 */
function signup(cid,eid,obj){
	if(memberId == ""){
		alert("请先注册");
		window.location.href="weixin/register/register.jsp";
	}else{
		if($(obj).find("font").html() =="取消报名"){
			return false;
		}else{
			if(confirm("确定要报名吗？")){
				$(obj).html("<font color='#e8b20c'>取消报名</font>");
				var add=$.Params.create();
				add.addParams("courseId",cid); 
				add.addParams("expertId",eid); 
				add.addParams("memberId",memberId); 
				add.addParams("filed1","1"); 
				add.addParams("filed4",place); 
				add.ajax(getIP()+"logcsign.action?add",function(data){
					if(data.success){
						var scrollDistance=$("#yjk").scrollTop();  //当前滚动条距离顶部的距离
						setPosition(scrollDistance);
						getData();
					}else{
						alert("你已经报名了");
						return false;
					}
				})
			}
		}
	}
	
}

/**
 * 点赞
 * @param cid
 * @param eid
 * @return
 */
function zan(cid,eid,za){
	if(memberId == ""){
		alert("请先注册");
		window.location.href="weixin/register/register.jsp";
	}else{
	$(za).attr("src","weixin/images/demand_praise1.png");
	var add=$.Params.create();
	add.addParams("courseId",cid); 
	add.addParams("expertId",eid); 
	add.addParams("memberId",memberId); 
	add.addParams("type",1); 
	add.addParams("filed4",place); 
	add.ajax(getIP()+"logczan.action?add",function(data){
		var scrollDistance=$("#yjk").scrollTop();  //当前滚动条距离顶部的距离
		setPosition(scrollDistance);
		getData();
	})
	}
}


	
