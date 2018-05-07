	var sel=$.Params.create();
 		getData();
		function getData(){
		   	sel.addParams("id",memberId);
		   	getPageData(sel,getIP()+"member.action?list",function(data){
		   		var val=data.rows[0];
		   		var area="";
		   		if(val.province==val.city){
		   			area=val.province;
		   		}else{
		   			area=val.province+val.city;
		   		}
		   		
		   		$("#pct_userName").val(val.name);
		   		$("#pct_userPhone").val(val.tel);
		   		$("#pct_userBirthday").val(val.birthday);
		   		$(".pct_sex img[sex="+val.sex+"]").attr("src","PC/image/sex1.png").attr("checked","checked");
		   		$(".pct_sex img[sex="+val.sex+"]").siblings().attr("src","PC/image/sex0.png").removeAttr("checked");
		   		$("#pct_userEmail").val(val.email);
		   		$("#pct_area").val(area);
		   		$("#pct_userHospital").val(val.hospitalName);
		   		$("#pct_userOffices").val(val.hospitalOffices);
		   		$("#pct_userPost").val(val.jobTitle);
		   		$("#pct_jobTitle").val(val.post);
		   		$("#doctorNum").val(val.doctorNum);
		   		$("#educational").val(val.education);
		   	});
		}
		
		
		$(".pct_updateFile").on("click",function(){
			$(".pct_contentTitle").html("修改资料");
			$(".pct_content input[type=text]").removeAttr("disabled").css("background",'#fff');
			$(".pct_content input[type=text]").filter(":first").focus();
			$("#pct_infoUpdate").show();
		});
		
//		$(".pct_sex img").on("click",function(){
//	 		 $(this).attr("src","PC/image/sex1.png").attr("checked","checked");
//	 		 $(this).siblings().attr("src","PC/image/sex0.png").removeAttr("checked");
//	 	})