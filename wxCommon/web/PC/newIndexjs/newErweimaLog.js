$(function(){
		var ticket=GetQueryString("ticket");
		//window.localStorage.setItem("tel",tel);
		//window.localStorage.setItem("pwd",pwd);
		if(ticket == null || ticket == "undefined" || ticket == undefined){
			var sel=$.Params.create();
			sel.addParams("sceneId",memberId+"_hy");
			sel.ajax(getIP()+"qrCodeInfo.action?list",function (data){
				if(data.success){
					ticket=data.rows[0].field2;
					$("#qrCode").attr("src","https://mp.weixin.qq.com/cgi-bin/showqrcode?ticket="+ticket);
					getTime();
				}
			});
		}else{
			$("#qrCode").attr("src","https://mp.weixin.qq.com/cgi-bin/showqrcode?ticket="+ticket);
			getTime();
		}
		
		
		 
				
		})
		
		
		function getTime(){
		var time=0;
			self.setInterval(function(){
			var tel=GetQueryString("tel");
			var pwd=GetQueryString("pwd");
        	var login=$.Params.create();
			login.addParams("email",tel);
			login.addParams("filed1",pwd);
			login.addParams("type",3);
			
			login.ajax(getIP()+"member.action?login",function(data){
				time++;
				if(time==12){
					window.location.href=getIP()+"PC/newIndex.jsp";
				}else{
					if(data.openId != "" && data.openId != null){
						window.localStorage.setItem("openId",data.openId);
						window.location.href=getIP()+"PC/newIndex.jsp";
					}
				}
				
			});
		 },5000);
		}