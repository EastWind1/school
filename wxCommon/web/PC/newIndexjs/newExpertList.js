
var sel=$.Params.create();
var page1=window.localStorage.getItem("page1");
 	$(function(){
 		
 		getData();
		 
	 	 function getData(){
	 		 var name=window.localStorage.getItem("name");
	 		if(name == ""||name==null||name=="null"){
				$("#expSearchInput").val("");
				sel.addParams("name",null); 
			}else{
				$("#expSearchInput").val(name);
				sel.addParams("name",name);
			}
			if(page1=="null"  || page1==null){
				 page1=0;
			}
			var shengfen=window.localStorage.getItem("shengfen");
			if(shengfen==null||shengfen=="null"||shengfen=="全部"){
				$("#fenlei_change").text("全部");
				sel.addParams("createUser",null);
			}else{
				$("#fenlei_change").text(shengfen);
				sel.addParams("createUser",shengfen);
			}
			
		   	sel.addParams("page",page1);
		   	sel.addParams("rows",rows);
		   	sel.addParams("publicNo",brandId); 
		   	sel.addParams("type",1);
			//sel.addParams("filed5","1");
		   	getPageData(sel,getIP()+"expert.action?list",function(data){
		   		if(data.success){
		   			var len=data.total;
		   			window.localStorage.setItem("page1",data.page);
			   		var html="";
					if(len >0){
						$.each(data.rows,function(i,val){
							var status="";
						/*	if(val.busyStatus==1){
								status="<span class='exp_expertStatus'>忙碌</span>";
							}else{
								status="<span class='exp_expertStatus active'>在线</span>";
							}*/
							
						
							html+="<div class='exp_expert'>"+
								  "<div class='exp_expertImg hasPointer'><img onclick='getDetail(\""+val.id+"\")' src='data/expert/"+val.headImg+"' alt='' hasPointer></div>"+
								  "<ul class='exp_expertInfo'><li><h3 onclick='getDetail(\""+val.id+"\")' class='exp_expertName hasPointer'>"+val.name+"</h3>"+status+"</li>"+
								  "<li><label for='' class='noPointer'>职称：</label><span class='exp_jobTitle  noPointer'>"+val.jobTitle+"</span></li>"+
								  "<li><label for='' class='noPointer'>职务：</label><span class='exp_expertPost  noPointer'>"+val.filed1+"</span></li>"+
								  "<li><label for='' class='noPointer'></label><span class='exp_expertOffice  noPointer'>"+val.doctorCertificate+"</span></li>"+
								  "<a onclick='orderExpert(\""+val.openId+"\",\""+val.id+"\")' class='exp_expertSummary hasPointer'>在线预约</a>"+
								  //"<a onclick='callExpert(\""+val.id+"\")' class='exp_expertConnect hasPointer'>发送邮件</a>"+
								  "</ul></div>";	
							$(".exp_expertList").css("paddingBottom","10%");
							
						})
					}else{
						$(".exp_expertList").css("paddingBottom","2%");
						html="<span style='margin-left:30px;'>未查找到相关专家</span>";
					}	
					$(".exp_expertList").html(html);
				//	App.init();
		   		}else{
		   			alert(data.msg);
		   		}
		   		
		   	});
		}
	 	 
	 	$("#expSearchBtn").on("click",function(){
	 		var name=$("#expSearchInput").val();
			window.localStorage.setItem("name",name);
	 		page1=0;
	 		getData(); 
	 	})
	 	 
	 	/*选择分类*/
$("#exp_cityChange").on("mouseover",function(){
	$(".fenlei_list").addClass("fenlei_active").css("display","block");	
	$(".exp_expertList").css("marginTop","14%");
})

$("#exp_cityChange").on("click",function(){
//	sel.addParams("createUser",null);
	localStorage.removeItem("name");
	localStorage.removeItem("shengfen");
	getData();
	$(".fenlei_list").removeClass("fenlei_active").hide();	
	$(".exp_expertList").css("marginTop","0");
})
//$("#fenlei_change, .fenlei_list").on("mouseout",function(){
//	//$(".fenlei_list").addClass("fenlei_active");
//	$(".fenlei_list").removeClass("fenlei_active").css("display","none");	;	
//	$(".exp_expertList").css("marginTop","0%");
//	//alert("111");
//})

///选择分类有边框，所以会有突出的现象

//选择分类事件
$(".fenlei_list li a").on("click",function(){
	$(".fenlei_list").removeClass("fenlei_active").css("display","none");
	$(".exp_expertList").css("marginTop","0%");
	var fenleiValue=$(this).text();
	window.localStorage.setItem("shengfen",fenleiValue);
	$("#expSearchInput").val("");
	var name=$("#expSearchInput").val();
	window.localStorage.setItem("name",name);
	page1=0;
	getData();
	$(".fenlei_list").removeClass("fenlei_active").hide();	
})
	 	 
//	 	 function getData(){
//		var name=$("#expertName").val();
//		if(name != ""){
//			p.addParams("name",name); 
//		}else{
//			p.addParams("name",null); 
//		}
//		p.addParams("publicNo",brandId); 
//		p.addParams("type","1");
//	    p.ajax(getIP()+"expert.action?list",function(data){
//	    	var html="";
//	    	$.each(data.rows,function(i,val){
//	    		html+="<li onclick='getExpert(\""+val.id+"\")' class='table-view-cell media'>" +
//	    				//"<img onclick='getExpert(\""+val.id+"\")' id='detail' class='media-object pull-left' src='data:image/png;base64,"+val.headImg+"'>" +
//	    				"<img id='detail' class='media-object pull-left' src='data/expert/"+val.headImg+"'>" +
//	    				"<div class='media-body expertInfo'>"+val.name+"<p>职称："+val.jobTitle+"</p>" +"<p>职务："+val.filed1+"</p>"+"<p>科室："+val.filed3+"</p>"
//	    				//"<p class='iconimg'><a href='tel:"+kftel+"'><img src='weixin/images/bh1.png' /></a></p>"+
//	    				"</div></li>";
//	    	})
//	    	$("#expertList").html(html);
//	    })
//	}
	
	$("#search").on("click",function(){
		getData();
	})
})
	function callExpert(id){
		if(memberId == ""){
			//alert("请先登录！");
			window.localStorage.setItem("htmlurl",htmlurl);
			window.location.href=getIP()+"PC/login.jsp";
		}
		else if(openId == "" || openId == null){
			window.location.href=getIP()+"PC/newErweimaLog.jsp";
		}
		else{
			window.location.href=getIP()+"PC/newConnectExpert.jsp?eid="+id;
		}
	}
	
	function getDetail(id){
		window.location.href=getIP()+"PC/newExpertDetails.jsp?eid="+id;
	}
	function orderExpert(expertOpenId,expId){
		if(memberId == ""){
			//alert("请先登录!");
			window.localStorage.setItem("htmlurl",htmlurl);
			window.location.href=getIP()+"PC/login.jsp";
		}else if(openId == "" || openId == null){
			window.location.href=getIP()+"PC/newErweimaLog.jsp";
		}else{
			window.location.href=getIP()+"PC/newExpertSummary.jsp?eid="+expertOpenId+"&expId="+expId;
		}
		
	}