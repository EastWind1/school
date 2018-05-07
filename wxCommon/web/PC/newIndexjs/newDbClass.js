
var db_page=window.localStorage.getItem("db_page");

getData();
//当搜索框内容为空时，查询显示所有数据
$("#expSearchInput").on("input propertychange",function(){
	if($(this).val()==""){
		getData();
	}
})
function getData(){
	var sel=$.Params.create();
   	var title=$("#expSearchInput").val();
	var fenleiSelected=window.localStorage.getItem("fenlei_selected");
	if(title != ""){
		sel.addParams("title",title); 
	}else{
		sel.addParams("title",null); 
	}
//	if(fenleiSelected=null||fenleiSelected="null"){
//		$("#fenlei_change").text("全部");
//	}
//	if(fenleiSelected==""||fenleiSelected==null||fenleiSelected=="null"){
//		alert("aaa");
//		$("#fenlei_change").text("全部");
//	}
	if(fenleiSelected==null||fenleiSelected=="null"||fenleiSelected==""||fenleiSelected=="全部"){
		$("#fenlei_change").text("全部");
		sel.addParams("filed5",null); 
	}else{
		$("#fenlei_change").text(fenleiSelected);
		sel.addParams("filed5",fenleiSelected); 
	}
	
	
	if(db_page=="null"  || db_page==null){
		db_page=0;
	}
   	sel.addParams("page",db_page);
   	sel.addParams("rows",rows);
   	sel.addParams("type",1);
   	if(memberId != ""){
		sel.addParams("memberId",memberId);
	}
	sel.addParams("publicNo",brandId); 
	
   	getPageData(sel,getIP()+"courseDb.action?getCourseDb",function(data){
   		
   		if(data.success){
   			var len = data.total;
   			db_page=data.page;
	   		var html="";
	   		window.localStorage.setItem("db_page",db_page);
			if(len >0){
				$.each(data.rows,function(i,val){	
					var htmlbutton="<a onclick='collect(\""+val.id+"\",\""+val.expertOpenid+"\")' class='db_collectBtn active'>收藏</a>";
					var czanButton="<span onclick='zan(\""+val.id+"\",\""+val.expertOpenid+"\")' class='db_unzan hasPointer'>点赞("+val.zanNum+")</span>";
					//alert(val.collectNum);
					if(memberId != "" && openId != "" && openId != null){
						if(val.czannum>0){
							czanButton="<span class='db_zan hasPointer'>已赞("+val.zanNum+")</span>";
						}
						if(val.collnum > 0){
							htmlbutton="<a class='db_collectBtn' style='background-color:orange!important;' onclick='canclecollect(\""+val.id+"\",\""+val.expertOpenid+"\")'>取消收藏</a>";
						}
					}
//					var createTime=val.createTime;
//					if(createTime==null||createTime=="null"){
//						createTime="";
//					}
					var attachments="";
				     if(val.attachmentsType==1){
				   	 	attachments +="<img src='PC/image/shiping.png'/>";
				     }else{
				    	 attachments +="<img src='PC/image/PDF.png'/>";
				     }

			html+="<div class='db_ClassList'><div class='db_ClassImg'><img src='data/course/"+val.filed2+"' onclick='getDetail(\""+val.id+"\")'/></div>"+
				  "<ul class='db_ClassInfo' onclick='getDetail(\""+val.id+"\")'><li><label for='' class='db_ClassInfoTitle hasPointer' onclick='getDetail(\""+val.id+"\")'>"+val.title+"</label></li>"+
				  "<li><label for=''>专家姓名：</label><span class='db_expertName'>"+val.name+"</span></li>"+
				  "<li><label for=''>医院科室：</label><span class='db_createTime'>"+val.doctorCertificate+"</span></li></ul>"+
				  "<div class='db_playNum'><span>点播次数</span><div>"+val.reqnum+"</div></div>"+
				  htmlbutton+czanButton+"<a onclick='pinglun(this)' class='pct_CollectPinglun'>评论</a><textarea placeholder='期待您的想法' class='pinglun_box'></textarea><input onclick='addPl(this,\""+val.id+"\",\""+val.title+"\")' type='button' value='评论' class='pct_CollectPlBtn' /></div>";
				})
				$(".db_ClassContainer").css("paddingBottom","10%");
			}else{
				$(".db_ClassContainer").css("paddingBottom","2%");
				html="<span style='margin-left:30px;'>未查找到相关课程</span>";
			}
			$(".db_ClassContainer").html(html);
   		}else{
   			alert(data.msg);
   		}
   		
   	})
   	
 	$("#expSearchBtn").on("click",function(){
		//localStorage.removeItem("fenlei_selected");
		db_page=0;
 		getData();
 	})
 	
 	getPosition();
}

/*选择分类*/
$("#db_fenleiChange").on("mouseover",function(){
	$(".fenlei_list").addClass("fenlei_active").css("display","block");	
	$(".db_ClassContainer").css("marginTop","10%");
})
$("#db_fenleiChange").on("click",function(){
	localStorage.removeItem("fenlei_selected");
	getData();
	$(".fenlei_list").removeClass("fenlei_active").hide();	
	$(".db_ClassContainer").css("marginTop","0");
})
//$(".fenlei_list").on("mouseout",function(){
//	//$(".fenlei_list").addClass("fenlei_active");
//	$(".fenlei_list").removeClass("fenlei_active").css("display","none");	
//	$(".db_ClassContainer").css("marginTop","0%");
//	//alert("111");
//})

///选择分类有边框，所以会有突出的现象

//选择分类事件
$(".fenlei_list li a").on("click",function(){
	$(".fenlei_list").css("display","none");
	$(".db_ClassContainer").css("marginTop","0");
	var fenleiValue=$(this).text();
	$("#fenlei_change").text(fenleiValue)
	$("#expSearchInput").val("");
	if(fenleiValue=="全部"){
		fenleiValue="";
		$("#fenlei_change").text("全部");
	}
	window.localStorage.setItem("fenlei_selected",fenleiValue);
	db_page=0;
	getData();
	$(".fenlei_list").removeClass("fenlei_active").hide();	
})


/*收藏*/
function collect(cid,eid){
	$("#modalcont").html("确定要收藏吗？");
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

/*点赞*/
function zan(cid,eid,obj){
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

/*处理评论框*/
function pinglun(obj){
	if(memberId == ""){
		//alert("请先登录！");
		window.localStorage.setItem("htmlurl",htmlurl);
		window.location.href=getIP()+"PC/login.jsp";
	}
	else if(openId == "" || openId == null){
		window.location.href=getIP()+"PC/newErweimaLog.jsp";
	}else{
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
	add.addParams("type",2);
	add.addParams("place",place);
	add.ajax(getIP()+"feedBack.action?add",function(data){
   		if(data.success){
			$("#responsive").modal('hide');
			alert("评论成功！");
			window.location.href=getIP()+"PC/newDbClassDetails.jsp?eid="+courseId;
   		}
	})
}
function getDetail(id){
//	if(memberId == ""){
//		alert("请先登录！");
//		window.location.href=getIP()+"PC/newIndex.jsp";
//	}else if(openId == "" || openId == null){
//				window.location.href=getIP()+"PC/newErweimaLog.jsp";
//	}else{
		var scrollDistance=$(".page-container ").offset().top;  //当前滚动条距离顶部的距离
		var fenleiValue=$("#fenlei_change").text();
		window.localStorage.setItem("fenlei_selected",fenleiValue);
		setPosition(scrollDistance);
		window.location.href=getIP()+"PC/newDbClassDetails.jsp?eid="+id;
//	}
}

/**
 * 存储当前滚动条的位置
 * @param scrollTop  滚动条距离顶部距离
 * @return
 */
function setPosition(scrollTop){
	localStorage.setItem("db_scrollBar",scrollTop);
}

/**
 * 读取进入详情页前的列表位置
 * @return
 */
function getPosition(){
	var posi=localStorage.getItem("db_scrollBar");
	if(posi!=null || posi!= "null"){
		var srcollDistance=parseInt(-posi);
		$("#content").scrollTop(srcollDistance);
		return posi;
	}
}