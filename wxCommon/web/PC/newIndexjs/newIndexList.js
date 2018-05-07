
$(function(){	
	var newrows=5;
	if(memberId == ""){
		$("#indexlogin").show();
		
	}else{
		newrows=10;
	$("#indexlogin").hide();
		//$(".userLogInfo").show();
		//getUserData();
	}
	
	var course=$.Params.create();
	course.addParams("page",0);
	course.addParams("rows",4);
	course.addParams("deleteState",1);
	course.ajax(getIP()+"course.action?getCourse",function(data){
		var html="";
		$.each(data.rows,function(i,val){
			html+="<li><a onclick='getDetail(\""+val.id+"\")' class='index_onlineClassContent hasPointer'>"+val.title+"</a></li>";
		})
		$(".index_onlineClassList").html(html);
	});

	var courseDb=$.Params.create();
	courseDb.addParams("page",0);
	courseDb.addParams("rows",4);
	courseDb.ajax(getIP()+"courseDb.action?getCourseDb",function(data){
		var html="";
		$.each(data.rows,function(i,val){
			html+="<li><a onclick='getDetails(\""+val.id+"\")' class='index_videoClassContent hasPointer'>"+val.title+"</a></li>";
		});
		$(".index_videoClassList").html(html);
	});
//新闻资讯
	var information=$.Params.create();
	information.addParams("page",0);
	information.addParams("rows",newrows);
	information.addParams("type",1);
	information.ajax(getIP()+"information.action?list",function(data){
		var html="";
		$.each(data.rows,function(i,val){		
			html+="<li><a onclick='getDetaila(\""+val.pkid+"\")' class='index_zxListContent hasPointer'>"+subStr(val.informationTitle)+"</a><span class='index_zxListTime'>"+splitStr(val.createTime)+"</span></li>";
		});
		 $(".index_zxList").html(html);
	});
//系统公告
	/*var sysNotice=$.Params.create();
	sysNotice.addParams("page",0);
	sysNotice.addParams("rows",5);
	sysNotice.ajax(getIP()+"sysNotice.action?list",function(data){
		var html="";
		$.each(data.rows,function(i,val){
			html+="<li onclick='getDetailNotice(\""+val.id+"\")'><a class='index_gonggaoListContent hasPointer'>"+subStr(val.content)+"</a><span class='index_gonggaoListTime'>"+splitStr(val.createDate)+"</span></li>";
		});
		 $(".index_gonggaoList").html(html);
	});*/
	//专家

	/*var expert=$.Params.create();
	expert.ajax(getIP()+"expert.action?list",function(data){
		if(data.success){
		var val=data.rows[0];
				$("#headImg img").attr("src","data/expert/"+val.headImg);
				$("#name").html(val.name);
				$("#jobTitle").html("职称："+val.jobTitle);
				$("#filed1").html("职务："+val.filed1);
				$("#filed3").html("科室："+val.filed3);
				
		};
		
	});*/
	
	
	function getUserData(){
		var sel=$.Params.create();
		sel.addParams("id",memberId);
		sel.ajax(getIP()+"member.action?list",function(data){
			var val=data.rows[0];
	   		
	   		$(".user_logName").html(val.name);
	   		$(".user_logTitle").html(val.jobTitle);
			//$(".pct_sex img[sex="+val.sex+"]").attr("src","PC/image/sex1.png").attr("checked","checked");
	   		$(".user_logHospitalName").html(val.hospitalName);
	   		$(".user_logOffice").html(val.hospitalOffices);
		});
	}
	
	/**
	 * 网站登录
	 */
	$("#logLayout_btn").on("click",function(){
		var email=$("#login_email").val();
		var pwd=$("#login_pwd").val();
		if(email == "" || pwd == ""){
			$("#modalcont").html("用户名或密码为空！");
			$("#responsive").modal('toggle');
			return false;
		}
		if(!checkEmail(email) && !valPhone(email)){
			$("#modalcont").html("请输入正确的手机号或者邮箱登录！");
			$("#responsive").modal('toggle');
			return false;
		}

		var login=$.Params.create();
		login.addParams("email",email);
		login.addParams("filed1",pwd);
		login.addParams("type",place);
		login.ajax(getIP()+"member.action?login",function(data){
				if(data.success){
					if(data.openId == null || data.openId == ""){
						window.location.href=getIP()+"PC/newErweimaLog.jsp?tel="+email+"&pwd="+pwd;
					}else{
						window.location.href=getIP()+"PC/newIndex.jsp";
					}
					
				}else{
					$("#modalcont").html("用户名或密码错误！");
					$("#responsive").modal('toggle');
				}
			
		});
	})
	
	$("#subBtn").on("click",function(){
		$("#responsive").modal('hide');
	})
	
	$("#exp1").animate({ opacity: "1"},800);
	$("#exp2").animate({  opacity: "1"},800);
	$("#exp3").animate({opacity: "1"},800);
	$("#exp4").animate({  opacity: "1"},800);
	$("#exp5").animate({  opacity: "1"},800);
	$("#exp6").animate({ opacity: "1"},800);
	
	setInterval(function(){
		$("#exp1, #exp5").fadeOut(1300).fadeIn(1300);
		$("#exp2, #exp6").fadeIn(1300).fadeOut(1300);
		$("#exp3, #exp4").fadeOut(1300).fadeIn(1300);
	},3200);
});
	function getDetail(id){
		window.location.href=getIP()+"PC/newcrouseDetails.jsp?eid="+id;
		/*if(memberId == ""){
			alert("请先登录！");
			window.location.href=getIP()+"PC/newIndex.jsp";
		}
		else if(openId == "" || openId == null){
			window.location.href=getIP()+"PC/newErweimaLog.jsp";
		}else{
			window.location.href=getIP()+"PC/newcrouseDetails.jsp?eid="+id;
		}*/
	}
	function getDetails(id){
		window.location.href=getIP()+"PC/newDbClassDetails.jsp?eid="+id;
		/*if(memberId == ""){
			alert("请先登录！");
			window.location.href=getIP()+"PC/newIndex.jsp";
		}
		else if(openId == "" || openId == null){
			window.location.href=getIP()+"PC/newErweimaLog.jsp";
		}else{
			window.location.href=getIP()+"PC/newDbClassDetails.jsp?eid="+id;
		}*/
	}
	function getDetaila(id){
		window.location.href=getIP()+"PC/information_zxDetails.jsp?eid="+id;
	}
	function getDetailNotice(id){
			window.location.href=getIP()+"PC/sysNotice_zx.jsp?eid="+id;
	}
	//checkIEVersion();
	function checkIEVersion() {   
		if(navigator.appName.indexOf("Microsoft") != -1)  {
			alert("ie");
		}else{
			alert("----------");
		}
	}  

	/*
	 * 修复ie不支持placehoder
	 * jQuery placeholder, fix for IE6,7,8,9
	 * @author JENA
	 * @since 20131115.1504
	 * @website ishere.cn
	 */
	var JPlaceHolder = {
	    //检测
	    _check : function(){
	        return 'placeholder' in document.createElement('input');
	    },
	    //初始化
	    init : function(){
	        if(!this._check()){
	            this.fix();
	        }
	    },
	    //修复
	    fix : function(){
	        jQuery(':input[placeholder]').each(function(index, element) {
	            var self = $(this), txt = self.attr('placeholder');
	            self.wrap($('<div></div>').css({position:'relative', zoom:'1', border:'none', background:'none', padding:'none', margin:'none'}));
	            var pos = self.position(), h = self.outerHeight(true), paddingleft = self.css('padding-left');
	            var holder = $('<span></span>').text(txt).css({position:'absolute', left:pos.left+5, top:pos.top+13, height:h, lienHeight:h, paddingLeft:paddingleft, color:'#A4A4A4'}).appendTo(self.parent());
	            self.focusin(function(e) {
	                holder.hide();
	            }).focusout(function(e) {
	                if(!self.val()){
	                    holder.show();
	                }
	            });
	            holder.click(function(e) {
	                holder.hide();
	                self.focus();
	            });
	        });
	    }
	};
	//执行
	jQuery(function(){
	    JPlaceHolder.init();    
	});
	