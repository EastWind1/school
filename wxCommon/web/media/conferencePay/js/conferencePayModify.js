$(function(){	
	var eid=GetQueryString("eid");
	
	
	var p=$.Params.create();
	
	p.addParams("id",eid); 
	
	p.ajax(getIP()+"conferencepayment.action?list",function(data){
		var html="";
		var val=data.rows[0];
		$("#title").val(val.title);
		$("#doctorPay").val(val.doctorPay);
		$("#nursePay").val(val.nursePay);
		$("#studentPay").val(val.studentPay);
   		})
		
	
	
	
	/*详情页修改事件*/
	$("#modifyVal").on("click",function(){
		var title=$("#title").val();
		var doctorPay=$("#doctorPay").val();
		var nursePay=$("#nursePay").val();
		var studentPay=$("#studentPay").val();
		if(title==""){
			alert("请填写会议标题！");
			return false;
		}
		if(doctorPay==""){
			alert("请填写医生缴费金额！");
			return false;
		}
		if(nursePay==""){
			alert("请填写护士缴费金额！");
			return false;
		}
		if(studentPay==""){
			alert("请填写学生缴费金额！");
			return false;
		}
	
	
		var add=$.Params.create();
		add.addParams("id",eid);
		add.addParams("title",title);
		add.addParams("doctorPay",doctorPay);
		add.addParams("nursePay",nursePay);
		add.addParams("studentPay",studentPay);
		add.ajax(getIP()+"conferencepayment.action?update",function(data){
			if(data.success){
				window.location.href="media/conferencePay/conferencePayList.jsp";
			}else{
				alert(data.msg);
				return false;		
			}
		});
	})
		
		
		

	
})