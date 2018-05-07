
getData();
function getData(){
	var p=$.Params.create();
	var fenleiValue=window.localStorage.getItem("wxdb_fenlei");
	var fenleiText=window.localStorage.getItem("wxdb_fenleiValue");
	if(fenleiValue==null || fenleiValue=="null" || fenleiValue=="0"){
		fenleiText="全部分类";
		p.addParams("filed5",null); 
	}else{
		p.addParams("filed5",fenleiText); 
	}
	$("#typeList").html(fenleiText+" >");
	p.addParams("publicNo",brandId); 
	p.addParams("memberId",memberId); 
	p.ajax(getIP()+"courseDb.action?getCourseDb",function(data){
		var html="";
		$("label").html(data.total);
		$.each(data.rows,function(i,val){	
			var courseTitle=val.title;
			if(courseTitle.length>24){
				courseTitle=courseTitle.substring(0,22)+"...";
			}
			var htmlbutton="";
			if(memberId == ""){
				htmlbutton="<img onclick='collect(\""+val.id+"\",\""+val.expertOpenid+"\",this)' src='weixin/images/demand_collect0.png' />("+val.collectNum+")";
			}else{
				if(val.collnum > 0  && memberId !=""){
				htmlbutton="<img onclick='canclecollect(\""+val.id+"\",\""+val.expertOpenid+"\",this)' src='weixin/images/demand_collect1.png' />("+val.collectNum+")";
				}else{
					htmlbutton="<img onclick='collect(\""+val.id+"\",\""+val.expertOpenid+"\",this)' src='weixin/images/demand_collect0.png' />("+val.collectNum+")";
				}
			}
			
			
			var czanButton="";
			if(val.czannum>0 && memberId !=""){
				czanButton="<img src='weixin/images/demand_praise1.png' />("+val.zanNum+")";
			}else{
				czanButton="<img onclick='zan(\""+val.id+"\",\""+val.expertOpenid+"\",this)' src='weixin/images/demand_praise0.png' />("+val.zanNum+")";
			}
//		    html+="<div class='card listsz'><ul class='table-view' style='margin-left:0px;'>"+
//		  		  "<li class='table-view-cell titleclass'><i><img src='weixin/images/demand_title.png' /></i><span>"+val.title+"</span></li>"+
//		  		  "<li class='table-view-cell classIn noBr'><p><span>开课专家："+val.name+"</span></p></li>" +
//		  		  "<li class='table-view-cell footbar'><p>"+czanButton+"</p>" +
//		  		  "<p>"+htmlbutton+"</p><p onclick='getExpert(\""+val.id+"\")'>查看详情</p></li>"+
//		  		  "</ul></div>"; 	
//		    
			html+="<div class='card listsz'><ul class='table-view' style='margin-left:0px;'>" +
			"<li style='padding:5px;' onclick='getExpert(\""+val.id+"\")' class='table-view-cell media'>" +
			"<img style='width:100px;height:100px' id='detail' class='media-object pull-left' src='data/course/"+val.filed2+"'>" +
			"<div class='media-body expertInfo'><p class='costitle'>"+courseTitle+"</p><p>"+val.name+"</p><p>"+val.doctorCertificate+"</p></div></li>" +
			 "<li class='table-view-cell footbar'><p>"+czanButton+"</p>" +
	  		  "<p>"+htmlbutton+"</p><p onclick='gofeedback(\""+val.id+"\",2)'>评论</p></li>"+
			"</ul></div>";
		})
		if(html == ""){
			html="<span style='padding-left:10px;'>您好，此分类下暂无课程，敬请期待！</span>";
		}
		$("#videoClass_list").html(html);
		getPosition();
	})
}


//$("#typeList").on("click",function(){
//	$("#typedigle").show();
//})

/*点击显示分类*/
$("#typeList").on("click",function(){
	$("#citydigle").show();
	//window.localStorage.removeItem("wxExpert_scrollDistance");
	//window.location.href="weixin/hy/expertProvince.jsp";
})
/***
 * 点击省份列表的空白区域，隐藏省份列表 
 */
$("#exp_cityListBottom").on("click",function(){
	$("#citydigle").hide();
})

$(".vd_fenlei li a, #all_fenlei").on("click",function(){
	var selValue=$(this).attr("value");
	var selText=$(this).text();
	window.localStorage.setItem("wxdb_fenlei",selValue);
	window.localStorage.setItem("wxdb_fenleiValue",selText);
	window.localStorage.removeItem("wx_scrollBar");
//	window.location.href="weixin/hy/videoClass.jsp";
	getData();
	$("#citydigle").hide();
})


/**
 * 查看详情
 * @param eid
 * @return
 */
function getExpert(eid){
	var scrollDistance=$("#videoClass_list").offset().top;  //当前滚动条距离顶部的距离
	var fenlei=$("#typeList").text();
	var fenleiValue=$("#typeList").attr("value");
	if(fenleiValue=="0" || fenleiValue=="null" || fenleiValue==null || fenleiValue == undefined || fenleiValue == "undefined"){
		//$("#typeList").attr("value","0");
		fenleiValue=0;
		localStorage.setItem("wxdb_fenlei",fenleiValue);
		//$("#typeList").text("全部分类");
	}
	window.localStorage.setItem("wxdb_fenleiValue",fenlei);
	setPosition(scrollDistance-65);
	window.location.href="weixin/hy/videoClassDetails.jsp?eid="+eid;
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
		var scrollDistance=$("#videoClass_list").offset().top-65;  //当前滚动条距离顶部的距离
		var fenleiValue=$("#typeList").attr("value");
		window.localStorage.setItem("wxdb_fenlei",fenleiValue);
		if(fenleiValue=="0"||fenleiValue=="null"||fenleiValue==null){
			$("#typeList").attr("value","0");
			$("#typeList").text("全部分类");
		}
		
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
	window.localStorage.removeItem("wx_dbscrollBar");
	window.localStorage.setItem("wx_dbscrollBar",scrollTop);
}

/**
 * 读取进入详情页前的列表位置、分类
 * @return
 */
function getPosition(){
	var posi=window.localStorage.getItem("wx_dbscrollBar");
	var fenlei=window.localStorage.getItem("wxdb_fenlei");
	var selText=window.localStorage.getItem("wxdb_fenleiValue");
	window.localStorage.removeItem("wx_dbscrollBar");
	$("#typeList").attr("value",fenlei);
	$("#typeList").text(selText)
	if(fenlei=="0"||fenlei=="null"||fenlei==null){
		$("#typeList").attr("value","0");
		$("#typeList").text("全部分类");
	}
	//localStorage.removeItem("wxdb_fenlei");
	if(posi!=null || posi!= "null"){
		var srcollDistance=(-posi);
		$("#content").scrollTop(srcollDistance);
		return posi;
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
	add.addParams("type",2); 
	add.addParams("filed4",place); 
	add.ajax(getIP()+"logczan.action?add",function(data){
		getData();	
		var scrollDistance=$("#videoClass_list").offset().top-65;  //当前滚动条距离顶部的距离
		setPosition(scrollDistance);
	})
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
					var scrollDistance=$("#videoClass_list").offset().top-65;  //当前滚动条距离顶部的距离
					setPosition(scrollDistance);
					getData();	
				}else{
					alert("你已经收藏了");
					return false;
				}
			})
		}
	}
}
	
/*****取消收藏******/
function canclecollect(cid,eid,col){
	if(confirm("确定要取消收藏吗？")){
		$(col).attr("src","weixin/images/demand_collect0.png");
		var update=$.Params.create();
		update.addParams("courseId",cid);  
		update.addParams("memberId",memberId); 
		update.addParams("filed1","1"); 
		update.ajax(getIP()+"logcollect.action?deleteByelements",function(data){
			if(data.success== false){
				alert(data.msg);
			}
			var scrollDistance=$("#videoClass_list").offset().top-65;  //当前滚动条距离顶部的距离
			setPosition(scrollDistance);
			getData();
		})
	}
}