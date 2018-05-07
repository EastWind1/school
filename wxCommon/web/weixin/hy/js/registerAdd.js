$(function(){
 		$(".tdval img").on("click",function(){
			if($(this).attr("type"))
			{ 
				type=$(this).attr("type");
				//alert(type);
			}
			if($(this).attr("sex"))
			{
	 		 	sex=$(this).attr("sex");
	 		 	//alert(sex);
			}
	 		 $(this).attr("src","weixin/images/sex1.png");
	 		 $(this).siblings().attr("src","weixin/images/sex0.png");
	 	})
	 	
 	$("#reg").on("click",function(){
 		var type=$("#type img[src='weixin/images/sex1.png']").attr("type");
 		var sex=$("#sex img[src='weixin/images/sex1.png']").attr("sex");
 		
 		
 		var name=$("input[name='name']").val();
 	 	var tel=$("input[name='tel']").val();
 	 	var birthday=$("#birthday").val();
 	 	var email=$("input[name='email']").val();
 	 	var hospital_name=$("input[name='hospital_name']").val();
 	 	var hospital_offices=$("input[name='hospital_offices']").val();
 	 	var jb_title=$("input[name='jb_title']").val();
 		
 	 	
 	 	/*验证手机号*/
		$(".tdval input[id!='birthday']").each(function(){
 			if($(this).val()==""){
 				$(this).focus();
 				return false;
 			}
			if(tel!=''&&tel.length != 11){
				$("input[name='tel']").focus();
				alert("格式错误，请输入11位！");
				$("input[name='tel']").val("");
				return false;
			} 
		})
 	 	
 	 	
//		var p=$.Params.create();
//		
//		p.addParams("publicNo",brandId); 
//		p.addParams("openId",openId);
//		p.addParams("type",type);
//		p.addParams("sex",sex);
//		p.addParams("name",name);
//		p.addParams("tel",tel);
//		p.addParams("birthday",birthday);
//		p.addParams("sex",sex);
//		p.addParams("email",email);
//		p.addParams("hospitalName",hospital_name);
//		p.addParams("hospitalOffices",hospital_offices);
//		p.addParams("jobTitle",jb_title);
//	    p.ajax(getIP()+"member.action?add",function(data){
//	    	alert(data.msg);
//	    })
 	 	
 	})


})	