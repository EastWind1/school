$(function(){
	var eid=GetQueryString("eid");
	var p=$.Params.create();
	p.addParams("id",eid); 
    p.ajax(getIP()+"expert.action?list",function(data){
    	var val=data.rows[0];
    	var htmlqw="<li class='table-view-cell barbutton'><a onclick='order(\""+val.openId+"\",\""+val.id+"\")'>预约</a>";
    	//var htmlqw="";
    	if(type11 == 0){
    		htmlqw="<li class='table-view-cell barbutton'><a onclick='order(\""+val.openId+"\",\""+val.id+"\")'>预约</a>";
    	}
    	var html="<li class='table-view-cell topzj'><p class='head'><img src='data/expert/"+val.headImg+"' /></p>" +
    			"<p class='head'>"+val.name+"</p><p class='head'>"+val.jobTitle+"</p></li>"+
    			//"<li class='table-view-cell barbutton'><a href='tel:"+kftel+"'>咨询专家</a>"+
    			htmlqw+
    			"<li class='zjtitle' style='margin-top:5px;'>擅长</li>" +
    			"<li class='table-view-cell zjcont'><p>"+val.speciality+"</p></li>" +
    			"<li class='zjtitle'>简介</li>" +
    			"<li class='table-view-cell zjcont'><p>"+val.summary+"</p></li>"+
    			"<li class='table-view-cell' style='text-align:center;'>"+
    			//"<p style='float: left;text-align: right;padding-right: 10px;width: 50%;'><img onclick='sendEmail()' style='width:100px;' src='weixin/images/em.png' /></p>"+
    			"<p style='text-align:center;padding-left: 10px;width: 100%;'>"+
				"<a href='tel:400-855-4120'><img style='width:100px;' src='weixin/images/bh.png' /></a></p>"+
 				"</li>"+
    			/*"<li class='table-view-cell barbutton' onclick='setEmail()'><a>发送邮件</a>"+
    			"<a onclick='order(\""+val.openId+"\")'>预约</a>"+*/
    			"</li>";
    	$("#expertDetail").html(html);
    })
	
	 $("#kftel").attr("href","tel:"+kftel);
})

function sendEmail(){
	if(memberId == ""){
		window.location.href="weixin/register/register.jsp";
	}else{
		window.location.href="weixin/kf/email.jsp";
	}
}


function order(expertOpenId,expId){
	if(memberId == ""){
		alert("请先注册");
		window.location.href="weixin/register/register.jsp";
	}else{
		//window.location.href="weixin/hy/memberOrder.jsp?eid="+expertOpenId+"&expId="+expId;
		window.location.href="weixin/order/addOrder.jsp?eid="+expertOpenId+"&expId="+expId;
	}
	
//	var p=$.Params.create();
//	p.addParams("publicNo",brandId); 
//	p.addParams("expertOpenid",expertOpenId);
//	p.addParams("memberOpenid",openId);
//	p.ajax(getIP()+"memberOrder.action?add",function(data){
//		if(data.success){
//			alert("已提交预约请求，请等待客服联系！");
//		}
//	})
}
