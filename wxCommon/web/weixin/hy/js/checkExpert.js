	var p=$.Params.create();
	
	getData();
	function getData(){
//		var scrollDistance=$("#gdt").offset().top; 
    	//var expProvince=window.localStorage.getItem("expProvince");
    	//var name=window.localStorage.getItem("name");
    	var name=$("#expertName").val();
    	if(name==""||name==null||name=="null"){
    		$("#expertName").val("");
    		p.addParams("name",null);
    	}else{
    		p.addParams("name",name);
    		$("#expertName").val(name);
    	}
//    	if(expProvince=="null"||expProvince==null||expProvince=="全部"){
//    		$("#expertProvince").text("全部");
//    		p.addParams("createUser",null);
//    	}else{
//    		
//    		$("#expertProvince").text(expProvince);
//    		p.addParams("createUser",expProvince);
//    	}
    	var province=$("#province").val();
    	if(province == "0"){
    		$("#expertProvince").html("省市查找 >");
    		p.addParams("createUser",null);
    	}else{
    		$("#expertProvince").html(province+" >");
    		p.addParams("createUser",province);
    	}
		p.addParams("publicNo",brandId); 
		p.addParams("type","1");
	    p.ajax(getIP()+"expert.action?list",function(data){
	    	var html="";
	    	var len=data.total;
	    	if(len>0){
		    	$.each(data.rows,function(i,val){
		    		
		    		if(val.openId != null && val.openId != ""){
			    		html+="<li onclick='getExpert(\""+val.id+"\")' class='table-view-cell media'>" +
			    				//"<img onclick='getExpert(\""+val.id+"\")' id='detail' class='media-object pull-left' src='data:image/png;base64,"+val.headImg+"'>" +
			    				"<img id='detail' class='media-object pull-left' src='data/expert/"+val.headImg+"'>" +
			    				"<div class='media-body expertInfo'>"+val.name+"<p>职称："+val.jobTitle+"</p>" +"<p>职务："+val.filed1+"</p>"+"<p>"+val.doctorCertificate+"</p>"
			    				//"<p class='iconimg'><a href='tel:"+kftel+"'><img src='weixin/images/bh1.png' /></a></p>"+
			    				"</div></li>";
		    		}
		    	})
	    	}else{
    			html="暂无相关专家";
    		}
	    	$("#expertList").html(html);

	    	getPosition();
	    })
	}

	$("#search").on("click",function(){
		var name=$("#expertName").val();
		if(name != ""){
			p.addParams("name",name); 
			
		}else{
			p.addParams("name",null); 
		}
		getData();
	})
	
	$("#expertProvince").on("click",function(){
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
	
	

	/**
	 * 切换省份
	 */
//	var chinacity=china.length;
// 	var province="<a onclick='getProvice(0)'>全部</a><a onclick='getProvice(\"国外\")'>国外</a>";
// 	for(var i=0;i<china.length;i++){
// 		province+="<a onclick='getProvice(\""+china[i][0]+"\")'>"+china[i][0]+"</a>";
// 	}
// 	$("#exp_cityList").html(province);
// 	$("#expertList").scrollTop(0);
//	var myScroll;
//	function loaded() {
//		myScroll = new IScroll('wrapper',{checkDOMChanges: true });
//	}
//	document.addEventListener('DOMContentLoaded', loaded, false);

	
	

/**
 * 存储当前滚动条的位置
 * @param scrollTop  滚动条距离顶部距离
 * @return
 */
function setPosition(scrollDistance){
	window.localStorage.removeItem("wxExpert_scrollDistance");
	window.localStorage.setItem("wxExpert_scrollDistance",scrollDistance);
	var province=$("#expertProvince").text();
	window.localStorage.setItem("expProvince",province);
	//	var expProvince=window.localStorage.setItem("expProvince",province);
}

/**
 * 读取进入详情页前的列表位置
 * @return
 */
function getPosition(){
	var posi=window.localStorage.getItem("wxExpert_scrollDistance");
	window.localStorage.removeItem("expProvince");
	if(posi==null || posi== "null"){
		$("#expertList").scrollTop(0);
	}else{
		var srcollDistance=(-posi);
		$("#wrapper").scrollTop(srcollDistance);
		return posi;
	}
}

function getExpert(eid){
	var scrollDistance=$("#expertList").offset().top;  //当前滚动条距离顶部的距离
	setPosition(scrollDistance-61);  //在进入详情页的时候，减去距离顶部的距离
	window.location.href="weixin/hy/checkExpertDetail.jsp?eid="+eid;
}


function getProvice(provice){
	$("#province").val(provice);
	$("#expertName").val("");
//	if(provice == 0){
//		provice="全部";
//	}
	//$("#expertProvince").html(provice+" >");
	$("#citydigle").hide();
	getData();
}

