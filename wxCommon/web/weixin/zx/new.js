$(function(){
 		var p=$.Params.create();
		p.addParams("brandId",brandId); 
		p.addParams("type","1");
		//$("#hy_news").html("");
	    p.ajax(getIP()+"information.action?list",function(data){
	    	var html="";
	    	$.each(data.rows,function(i,val){
	    		
	    		/*html+="<div class='card zxobj' onclick='getExpert(\""+val.pkid+"\",\""+val.field4+"\")'><ul class='table-view zxul'><li class='table-view-cell'>"+
	 			      "<span>"+val.informationTitle+"</span><p>"+val.createTime+"</p>"+
	 				  "<p class='zxcon'><img src='data/material/"+val.informationImage+"' /></p><hr />"+
	 			      "<p class='zxcon'>阅读全文</p></li></ul></div>";*/
	 			      
	 			html+="<li style='padding:5px;' class='table-view-cell media' onclick='getExpert(\""+val.pkid+"\",\""+val.field4+"\")'>" +
	 					"<a data-transition='slide-in'>" +
	 					"<img style='width:100px;height:100px; margin:5px;' class='media-object pull-left' src=data/material/"+val.informationImage+" >" +
	 					"<span style='color:#000;'>"+val.informationTitle+"</span></a><p>"+val.createTime+"</p></li>";

	    	})
	    	$("#newcon").html(html);
	    },function (){
       },3000000);
       
       var myScroll;
	function loaded() {
		myScroll = new IScroll('wrapper',{checkDOMChanges: true });
	}
	document.addEventListener('DOMContentLoaded', loaded, false);
 	})
 	var u = navigator.userAgent, app = navigator.appVersion;
	var isAndroid = u.indexOf('Android') > -1 || u.indexOf('Linux') > -1;
	var isiOS = !!u.match(/\(i[^;]+;( U;)? CPU.+Mac OS X/);
	function getExpert(eid,filed){
		window.location.href="weixin/zx/informationDetails.jsp?eid="+eid;
//		if(filed != "0"){
//			window.location.href=filed;
//			/*if(isiOS){
//				window.location.href=filed;
//			}else{
//				window.location.href="weixin/zx/newsd.jsp?wurl="+filed;
//			}*/
//			
//		}else{
//			window.location.href="weixin/zx/informationDetails.jsp?eid="+eid;
//		}
		
	}
	
	
	
	
	
	
	