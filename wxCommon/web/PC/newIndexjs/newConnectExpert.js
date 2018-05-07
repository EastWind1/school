if(memberId==""){
	window.location.href=getIP()+"PC/newIndex.jsp";
}
var callExpBtn=$.Params.create();
 	var eid=GetQueryString("eid");
 	$(function(){
//		$("#callExpBtn").on("click",function(){	
//			$("#modalcont").html("确定要发送邮件吗？");
//			$("#responsive").modal('toggle');
//		})
		
		$("#callExpBtn").on("click",function(){
			var email=$.Params.create();
			var title=$("#title").val();
			var content=$("#content").val();
			if(content == ""){
				alert("请输入邮件内容！");
				return false;
			}
			email.addParams("title",title); 
			email.addParams("content",content);
			email.addParams("openId",openId); 
			email.addParams("publicNo",brandId); 
			email.addParams("filed1",kfemail); 
			email.addParams("filed4",place); 
			email.ajax(getIP()+"logEmail.action?add",function(data){
				setEmail(title,content);
			})
		})
		
		function setEmail(title,content){
			    var pl = new SOAPClientParameters();//方法参数对象
			    pl.add("in0", kfemail);//参数配置 in0是方法参数索引，in1，in2 。。。。
			    pl.add("in1",title);
			    pl.add("in2", content);
			    pl.add("in3", "");
			    var noteurl = xfServices.mailService;
			    var req = SOAPClient.request(noteurl, "sendMail", pl,
			            function (data) {
					//成功后回调
							if(data){
								alert("发送成功！");
							}
			            },function(e){
			            alert(e.responseText);
			        });
			    $.ajax(req);
			}
	})