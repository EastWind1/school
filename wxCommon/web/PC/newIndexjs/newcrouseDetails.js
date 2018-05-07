var eid=GetQueryString("eid");
			var p=$.Params.create();
			getData();
			function getData(){
				p.addParams("id",eid); 
				if(memberId != ""){
					p.addParams("memberId",memberId);
				}
				p.ajax(getIP()+"course.action?getCourse",function(data){
					if(data.success){
						var len = data.rows.length;
						var html="";
						if(len >0){
							$.each(data.rows,function(i,val){	
								var htmlbutton="";
								var time;
								var startTime=val.filed3;
								var endTime=val.filed5;
								var coureTime=startTime+"~"+endTime;
								if(val.price == 0){
									time=val.startDate;
									htmlbutton="<div class='ol_baomingNum'><span>报名人数</span><div>"+val.signNum+"/"+val.setNum+"</div></div>"+"<a class='ol_baomingBtn active' onclick='signup(\""+val.id+"\",\""+val.expertOpenid+"\")'>报名</a>";
								}else{
									
									var startDate=val.startDate;
									var start=startDate.substring(0,startDate.lastIndexOf(":"));
									var endDate=val.endDate;
									var end=endDate.substring(endDate.lastIndexOf(" ")+1,endDate.lastIndexOf(":"));
									time=start+"~"+end;
									var date = new Date()
									var timestamp1=date.getTime();
									var dt = new Date(endDate.replace(/-/,"/")) 
									var timestamp2=dt.getTime();
									if(timestamp1>timestamp2){
										htmlbutton="<div class='ol_baomingNum'><span>报名人数</span><div>"+val.signNum+"/"+val.setNum+"</div></div>"+"<a style='background-color:#ccc !important' class='ol_baomingBtn'>已结束</a>";
									}else{
										htmlbutton="<div class='ol_baomingNum'><span>报名人数</span><div>"+val.signNum+"/"+val.setNum+"</div></div>"+"<a class='ol_baomingBtn active' onclick='signup(\""+val.id+"\",\""+val.expertOpenid+"\")'>报名</a>";
									}
								}
									
								var czanButton="<a onclick='zan(\""+val.id+"\",\""+val.expertOpenid+"\")' class='ol_unzan hasPointer'>点赞("+val.zanNum+")</a>";
								if(memberId != "" && openId != "" && openId != null){
									if(val.signnum == 1){
										htmlbutton="</ul><div class='ol_baomingNum'><span>报名人数</span><div>"+val.signNum+"/"+val.setNum+"</div></div>"+"<a class='ol_baomingBtn' onclick='cancleuppc(\""+val.id+"\",\""+val.expertOpenid+"\")'>取消报名</a>";
									}else if(val.signNum >= val.setNum){
										htmlbutton="</ul><div class='ol_baomingNum'><span>报名人数</span><div>"+val.setNum+"/"+val.setNum+"</div></div>"+"<a class='ol_baomingBtn meym'>名额已满</a>";
									}    
									if(val.czannum>0){
										czanButton="<a class='ol_zan hasPointer'>已赞("+val.zanNum+")</a>";
									}
								}else{
									if(val.signNum >= val.setNum){
										htmlbutton="</ul><div class='ol_baomingNum'><span>报名人数</span><div>"+val.setNum+"/"+val.setNum+"</div></div>"+"<a class='ol_baomingBtn meym'>名额已满</a>";
									}
								}		  
									  
								html+="<div class='ol_ClassImg noPointer'>"+
  									  "<img src='data/course/"+val.filed2+"' class='noPointer'></div><ul class='ol_ClassInfo noPointer'>"+
  									  "<li><label for='' class='ol_ClassInfoTitle noPointer'>"+val.title+"</label></li>"+
  									  "<li><label for='' class='noPointer'>专家姓名：</label><span class='ol_expertName'>"+val.name+"</span></li>"+
  									  "<li><label for='' class='noPointer'>开课时间：</label><span class='ol_createTime'>"+coureTime+"</span></li>"+
  									  //"</ul><div class='ol_baomingNum'><span>报名人数</span><div>"+val.signNum+"/"+val.setNum+"</div></div>"+
  									  htmlbutton+czanButton+"</ul>";
//  										"<h3 class='ol_classDetailsTitle'>课程简介</h3><p class='ol_classDetailsContent'>"+val.profile+"</p>" +
//  										"<h3 class='ol_classDetailsTitle feedback'>课程评论（共2条）</h3>" +
//  										"<p class='tit'>【北京医院】艾希：<a>2015-12-13 12:00:21</a></p><p class='con'>这是我的评论内容这是我的评论内容这是我的评论内容这是我的评论内容这是我的评论内容这是我的评论内容</p>" +
//  										"<p class='tit'>【北京医院】艾希：<a>2015-12-13 12:00:21</a></p><p class='con'>这是我的评论内容这是我的评论内容这是我的评论内容这是我的评论内容这是我的评论内容这是我的评论内容</p>";
								$("#profilehtml").html(val.profile);
								$("#summaryhtml").html(val.summary);
							})
						}else{
							html="暂无数据";
						}
						
				$("#crouseDet").html(html);
			}else{
				alert(data.msg);
			}
		})
		getPl();
	}
		
			
		/**
		 * 评论功能
		 */
			function getPl(){
			var sel=$.Params.create();
			sel.addParams("page",0);
			sel.addParams("rows",rows);
			sel.addParams("courseId",eid);
			getPageData(sel,getIP()+"feedBack.action?getpl",function(data){
				if(data.success){
					var len=data.total;
					$("#plCount").text("课程评论(共"+len+"条)");
					var html="";
					if(len >0){
						$.each(data.rows,function(i,val){
							html+="<p class='tit'>【"+val.hospitalName+"】"+val.name+"：<a>"+val.createTime+"</a></p><p class='con'>"+val.content+"</p>";
						})	
					}else{
						html="<p class='con'>暂无评论</p>";
					}	
					$("#feedBackList").html(html);
				}
			})
			}
			

			/**
			 * 添加评论
			 */
			var sel1=$.Params.create();
			var courseName="";
			sel1.addParams("id",eid);
			sel1.ajax(getIP()+"course.action?getCourse",function(data){
				courseName=data.rows[0].title;
			})
			$("#sumClass").on("click",function(){
			if(memberId == ""){
				//alert("请先登录！");
				window.localStorage.setItem("htmlurl",htmlurl);
				window.location.href=getIP()+"PC/login.jsp";
			}else if(openId == "" || openId == null){
				window.location.href=getIP()+"PC/newErweimaLog.jsp";
			}else{
				var plContent=$("#contents").val().trim();
				var length=plContent.length;
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
				add.addParams("courseId",eid);
				add.addParams("filed1",courseName);
				add.addParams("content",plContent);
				add.addParams("filed2",userName);
				add.addParams("memberId",memberId);
				add.addParams("type",1);
				add.addParams("place",place);
				add.ajax(getIP()+"feedBack.action?add",function(data){
			   		if(data.success){
						$("#responsive").modal('hide');
						//alert("评论成功");
						$("#contents").val("");
						getData();
			   		}
				})
				}
			})

		/**
		 * 报名
		 * @param cid
		 * @param eid
		 * @return
		 */
		function signup(cid,eid){
			$("#modalcont2").html("确定要报名吗？");
			if(memberId == ""){
				//alert("请先登录！");
				window.localStorage.setItem("htmlurl",htmlurl);
				window.location.href=getIP()+"PC/login.jsp";
			}else if(openId == "" || openId == null){
				window.location.href=getIP()+"PC/newErweimaLog.jsp";
			}else{
				$("#responsive2").modal('toggle');
				//$("#modalcont").html("确定要报名吗？");
//					var add=$.Params.create();
//					add.addParams("courseId",cid); 
//					add.addParams("expertId",eid); 
//					add.addParams("memberId",memberId); 
//					add.addParams("filed4",place); 
//					add.ajax(getIP()+"logcsign.action?add",function(data){
//						getData();
//					})
			}
			
			
			$("#subBtn2").off("click");
			$("#subBtn2").on("click",function(){
				//baoming(cid,eid);
				var add=$.Params.create();
				add.addParams("courseId",cid); 
				add.addParams("expertId",eid); 
				add.addParams("memberId",memberId); 
				add.addParams("filed1","1"); 
				add.addParams("filed4",place); 
				add.ajax(getIP()+"logcsign.action?add",function(data){
					if(data.success){
					getData();
					$("#responsive2").modal('hide');
					}else{
						alert(data.msg);
						return false;
					}
				})
			})
		
		}
		$("#backClassList").on("click",function(){
			window.location.href="PC/newcrouseClass.jsp";
		})
		function zan(cid,eid){
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
				add.addParams("type",1); 
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



		/**
		 * 确定是否取消
		 */
		function cancleuppc(cid,eid){
			$("#modalcont2").html("确定要取消报名吗？");
			if(memberId == ""){
				window.location.href=getIP()+"PC/newIndex.jsp";
			}
			else{
		   		$("#responsive2").modal('toggle');
		
			}
			$("#subBtn2").off("click");
			$("#subBtn2").on("click",function(){
				quxiaobaoming(cid,eid);
			})
		
			
		}
		
		
		/**
		 * 取消报名
		 * @param {Object} cid
		 * @param {Object} eid
		 */
		function quxiaobaoming(cid,eid){
		//	alert(cid+"......"+eid)
			var update=$.Params.create();
			update.addParams("courseId",cid);  
			update.addParams("memberId",memberId); 
			update.addParams("filed1","1"); 
			update.ajax(getIP()+"logcsign.action?deleteByelements",function(data){
				getData();
				$("#responsive2").modal('hide');
			})
		}


