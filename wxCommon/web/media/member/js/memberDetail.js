$(function(){	
	var eid=GetQueryString("eid");

	var p=$.Params.create();
	p.addParams("id",eid); 
	p.ajax(getIP()+"member.action?list",function(data){
		var html="";
		var val=data.rows[0];
		$("#name").html(val.name);
		$("#tel").html(val.tel);
		$("[name=sex][value="+val.sex+"]").attr("checked","checked");
		$("#age").html(val.birthday);
		$("#email").html(val.email);
		$("#hospitalName").html(val.hospitalName);
		$("#hospitalOffices").html(val.hospitalOffices);
		$("#jobTitle").html(val.jobTitle);
		 
		App.init();  //初始化单选按钮
	})
		
		
//		$.each(data.rows,function(i,val){			  
////			html+="<ul class='table-view courseDbDetails_data'>"+
////			       "<li><label class='courseDbDetails_field'>姓名:</label>"+
////			       "<span class='courseDbDetails_fieldValue'>"+val.name+"</span></li>"+
////			       "<li><label class='courseDbDetails_field'>职称:</label>"+
////			       "<span class='courseDbDetails_fieldValue'>"+val.jobTitle+"</span></li>"+
////			       "<li><label class='courseDbDetails_field'>课程名称:</label>"+
////			       "<span class='courseDbDetails_fieldValue'>"+val.title+"</span></li>"+
////			       "<li><label class='courseDbDetails_field'>课程名称:</label>"+
////			       "<span class='courseDbDetails_fieldValue'>"+val.createTime+"</span></li></ul>";
////			       
//			       
//			html+="<div class='control-group'><label class='control-label'>姓名：</label>"+
//                "<div class='controls'><input id='name' minlength='2' type='text'"+
//                "required='' aria-required='true' value='"+val.name+"'>"+
//                "</div><input type='button' id='modifyVal' value='修改' /></div>";
//		})
//		$(".mbModify").html(html);
//  })
	
	

	/*详情页修改事件*/
	$("#modifyVal").on("click",function(){
		var name=$("#name").val();
		var tel=$("#tel").val();
		var age=$("#age").val();
		var email=$("#email").val();
		var sex=$("[name=sex],[checked=checked]").attr("value");
		var hospitalName=$("#hospitalName").val();
		var hospitalOffices=$("#hospitalOffices").val();
		var jobTitle=$("#jobTitle").val();
		
		var update=$.Params.create();
		update.addParams("publicNo",brandId);
		update.addParams("name",name);
		update.addParams("tel",tel);
		update.addParams("birthday",age);
		update.addParams("email",email);
		update.addParams("sex",sex);
		update.addParams("hospitalName",hospitalName);
		update.addParams("hospitalOffices",hospitalOffices);
		update.addParams("jobTitle",jobTitle);
		
		update.addParams("id",eid); 
		update.ajax(getIP()+"member.action?update",function (data){
			if(data.success){
				alert(data.msg);
				window.location.href="media/member/memberList.jsp";
			}
		});
	})
	
})