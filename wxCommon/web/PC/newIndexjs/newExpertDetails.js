
$(function(){	
			var eid=GetQueryString("eid");
			
			var p=$.Params.create();
			p.addParams("id",eid); 
			p.ajax(getIP()+"expert.action?list",function(data){
				var html="";
				var val=data.rows[0];
				/*var status="";
				if(val.busyStatus==1){
					status="<span class='exp_expertStatus'>忙碌</span>";
				}else{
					status="<span class='exp_expertStatus active'>在线</span>";
				}*/
				
				html="<div class='exp_expert exp_expertDetails'><div class='exp_expertImg'><img src='data/expert/"+val.headImg+"' alt=''>"+
					 "</div><ul class='exp_expertInfo'><li><h3 class='exp_expertName'>"+val.name+"</h3>"+status+
					 "</li><li><label for=''>职称：</label><span class='exp_jobTitle'>"+val.jobTitle+"</span></li>"+
					 "<li><label for=''>职务：</label><span class='exp_expertPost'>"+val.filed1+"</span></li><li><label for=''></label>"+
					 "<span class='exp_expertOffice'>"+val.doctorCertificate+"</span></li><a onclick='orderExpert(\""+val.openId+"\",\""+val.id+"\")' class='exp_expertSummary hasPointer'>在线预约</a>"+
					// "<a onclick='callExpert(\""+val.id+"\")' class='exp_expertConnect hasPointer'>发送邮件</a>
					 "</ul></div>"+
					 "<div class='exp_expGoodAt'><h3 class='exp_GoodAtTitle'>擅长</h3><p class='exp_GoodAtContent'>"+val.speciality+"</p></div>"+
					 "<div class='exp_summary'><h3 class='exp_summaryTitle'>简介</h3><p class='exp_summaryContent'>"+val.summary+"</p></div>";
				$(".expDetailsContainer").html(html);
			})
			
			$("#backExpertList").on("click",function(){
				
				window.location.href="PC/newExpertList.jsp";
			})

		})
			function callExpert(id){
		if(memberId == ""){
			//alert("请先登录！");
			window.localStorage.setItem("htmlurl",htmlurl);
			window.location.href=getIP()+"PC/login.jsp";
		}else if(openId == "" || openId == null){
			window.location.href=getIP()+"PC/newErweimaLog.jsp";
		}else{
			window.location.href=getIP()+"PC/newConnectExpert.jsp?eid="+id;
		}
	}
	
	function getDetail(id){
		window.location.href=getIP()+"PC/newExpertDetails.jsp?eid="+id;
	}
	function orderExpert(expertOpenId,expId){
		if(memberId == ""){
			//alert("请先登录！");
			window.localStorage.setItem("htmlurl",htmlurl);
			window.location.href=getIP()+"PC/login.jsp";
		}else if(openId == "" || openId == null){
			window.location.href=getIP()+"PC/newErweimaLog.jsp";
		}else{
			window.location.href=getIP()+"PC/newExpertSummary.jsp?eid="+expertOpenId+"&expId="+expId;
		}
		
	}