/**
 * Created by Mark on 2014/7/21.
 */
$(function(){
				$(document).keydown(function(event) {
					if(event.keyCode==13){
						login();
					}
					//alert(event.keyCode);
	            }); 
			$("#submit").on("click",function(){//登录提交
					login();
			});
			function login(){//登陆方法
				//window.location.href=getIP()+"media/index.jsp";
				var userName=$("input[name=username]").val();
				var passWord=$("input[name=password]").val();
				 nameEmpty (userName);
				 pwdEmpty(passWord);
				var p=$.Params.create();
				p.addParams("loginName",userName);
				p.addParams("password",passWord);
				p.ajax("powerUser.action?login",function(data){
					if(data.success){
                       window.location.href="media/index.jsp";
                   }else{
                       $("#errorCue").show();//密码错误提示
                   }
				});
			}
			function nameEmpty (userName){
				if(userName==""||userName==null){
					  $("#usernameCue").css({"color":"red"}); 
					  $("#usernameCue").show();
					  return;
				}else{
					  $("#usernameCue").hide();
				}
			}
			function pwdEmpty(passWord){
				 if(passWord==""||passWord==null){
					 $("#passwordCue").css({"color":"red"}); 
					  $("#passwordCue").show();
					  return;
				}else{
					  $("#passwordCue").hide();
				}
			}
			    $("input[name=username]").blur(function(){//非空验证
			    	var userName=$("input[name=username]").val();
			    	 nameEmpty (userName);
					
				 });
				 $("input[name=password]").blur(function(){//非空验证
					 var passWord=$("input[name=password]").val();
					 pwdEmpty(passWord)
				 });			
});