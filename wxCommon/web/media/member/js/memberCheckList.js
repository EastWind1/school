var sel=$.Params.create();
var pageCheck=window.localStorage.getItem("pageCheck");
if(pageCheck==null||pageCheck=="null"){
	 pageCheck=0;
}
$(function(){
	
	 var filed3=$("#filed3").val();
	    if(filed3=="3"){
	    	sel.addParams("filed3","0");
	    	 $("#filed3").val("0");
	    }
	    getData();
    
    /**
     * 查询
     */
   
    $("#searchList").on("click",function(){
    	var tel=$("#tel").val();
    	var userName=$("#userName").val();
    	 var filed3=$("#filed3").val();
    	if(userName != ""){
    		sel.addParams("name",userName);
    	}else{
    		sel.addParams("name",null);
    	}
    	if(tel != ""){
    		sel.addParams("tel",tel);
    	}else{
    		sel.addParams("tel",null);
    	}
    	if(filed3 != "3"){
    		sel.addParams("filed3",filed3);
    	}else{
    		if(userName==""&&tel==""){
    			sel.addParams("filed3","0");
    			$("#filed3").val("0");
    		}else{
    			sel.addParams("filed3",null);
    		}
    		
    	}
    	getData();
    })
    
    /**
     * 删除
     */
    $("#delbutton").on("click",function(){
    	var params=getcheckdata();
    	sel.addParams("id",params);
    	if(params == ""){
    		alert("请选择记录");
    		return false;
    	}
    	if(confirm("确定要删除吗？")){
    		var del=$.Params.create();
        	del.addParams("id",params);
        	del.ajax(getIP()+"member.action?delMore",function(data){
        		alert(data.msg);
        		if(data.success){
        			$("#queryCheckbox").removeAttr("checked");  
        			$("#queryCheckbox").parent().removeClass("checked");
        			getData();
        		}
        	})
    	}
    })
   
   
    function getData(){
	   	sel.addParams("page",pageCheck);
	   	sel.addParams("rows",rows);
	   	sel.addParams("publicNo",brandId);
		sel.addParams("deleteState",1);
	   	getPageData(sel,getIP()+"member.action?getCheck",function(data){
	   		if(data.success){
	   			var len=data.total;
		   		var html="";
		   		var buttonHtml="";
		   		window.localStorage.setItem("pageCheck",data.page);
				if(len >0){
					$.each(data.rows,function(i,val){
						var filed3=val.filed3;
						var card1=val.card1;
						var card2=val.card2;
						var card3=val.card3;
						if(card1==null||card1=="null"){
							card1="";
						}
						if(card2==null||card2=="null"){
							card2="";
						}
						if(card3==null||card3=="null"){
							card3="";
						}
						if(filed3=="0"){
							filed3="未审核"
							buttonHtml="<span onclick='update1(\""+val.id+"\",\""+val.openId+"\",\""+val.name+"\")' class='checkDetailsBtn' style='width:30%'>通过</span>"+
								"<span onclick='update2(\""+val.id+"\",\""+val.openId+"\",\""+val.name+"\")' class='checkDetailsBtn' style='width:30%'>不通过</span>" +
										"<span onclick='update3(\""+val.id+"\")' class='checkDetailsBtn' style='width:30%'>丢失</span></td>";
								
						}else if(filed3=="1"){
							filed3="通过";
							buttonHtml="<span onclick='update2(\""+val.id+"\",\""+val.openId+"\",\""+val.name+"\")' class='checkDetailsBtn' style='width:30%'>不通过</span>" +
									"<span onclick='update3(\""+val.id+"\")' class='checkDetailsBtn' style='width:30%'>丢失</span></td>";
						}else if(filed3 == "2"){
							filed3="不通过";
							buttonHtml="<span onclick='update1(\""+val.id+"\",\""+val.openId+"\",\""+val.name+"\")' class='checkDetailsBtn' style='width:30%'>通过</span>"+
							"<span onclick='getCause(\""+val.id+"\",\""+val.filed5+"\",\""+val.openId+"\",\""+val.name+"\")' class='checkDetailsBtn' style='width:30%'>原因</span>" +
									"<span onclick='update3(\""+val.id+"\")' class='checkDetailsBtn' style='width:30%'>丢失</span></td>";
						}else{
							filed3="图片丢失";
							buttonHtml="<span onclick='update1(\""+val.id+"\",\""+val.openId+"\",\""+val.name+"\")' class='checkDetailsBtn' style='width:30%'>通过</span>"+
							"<span onclick='update2(\""+val.id+"\",\""+val.openId+"\",\""+val.name+"\")' class='checkDetailsBtn' style='width:30%'>不通过</span></td>";
						}
						var imghtml="";
						if(card1 != ""){
							imghtml+="<img onclick='getImg(\""+card1+"\")' src='data/member/"+card1+"' />";
							
						}if(card2 != ""){
							imghtml+="<img onclick='getImg(\""+card2+"\")' src='data/member/"+card2+"' />";
							
						}if(card3 != ""){
							imghtml+="<img onclick='getImg(\""+card3+"\")' src='data/member/"+card3+"' />";
							
						}
						html+="<tr>" +
								"<td><input id='"+val.id+"' name='checkbox' type='checkbox'></td>" +
								"<td>"+val.name+"</td>" +
								"<td>"+val.tel+"</td>" +
								"<td>"+showValue(val.hospitalName)+"</td>"+
								"<td>"+showValue(val.hospitalOffices)+"</td>"+
								"<td>"+showValue(val.jobTitle)+"</td>"+
								"<td>"+imghtml+"</td>"+
								"<td>"+filed3+"</td>" +
								"<td>"+buttonHtml+
								"</tr>";
					})
				}else{
					html="<tr><td colspan='9'>暂无数据</td></tr>";
				}
				$("table tbody").html(html);
				App.init();
	   		}else{
	   			alert(data.msg);
	   		}
	   		
	   	});
	}
    
    /**
     * 专家认证
     */
   
})

function getDetail(id){
	window.location.href="media/member/memberDetails.jsp?eid="+id;
}

function update3(id){
	var update3=$.Params.create();
	if(confirm("确定标记为图片丢失吗！")){
		update3.addParams("id",id);
		update3.addParams("filed3","3");
		update3.ajax(getIP()+"member.action?update",function(data){
		if(data.success){
			window.location.href="media/member/memberCheckList.jsp";
		}
	})
	}
	
}


function update1(id,openId,name){
	var update1=$.Params.create();
	if(confirm("确定通过吗！")){
	update1.addParams("id",id);
	update1.addParams("filed3","1");
	update1.addParams("openId",openId);
	update1.addParams("name",name);
	update1.ajax(getIP()+"member.action?updateCause",function(data){
		if(data.success){
			window.location.href="media/member/memberCheckList.jsp";
		}
	})
	}
	
}
function update2(id,openId,name){
	var update1=$.Params.create();
	if(confirm("确定要不通过吗！")){
	var htmlCause="<span>请输入不通过原因：</span><textarea id='filed5' ></textarea>";
	$("#span12").html(htmlCause);
	 $("#responsive").modal('toggle');
	 $("#pmenuAddButton").on("click",function(){
		var filed5=$("#filed5").val().trim();
		 if(filed5==""){
			 alert("请填写不通过的原因");
			 return false;
		 }
		 	update1.addParams("id",id);
			update1.addParams("filed3","2");
			update1.addParams("filed5",filed5);
			update1.addParams("openId",openId);
			update1.addParams("name",name);
			update1.ajax(getIP()+"member.action?updateCause",function(data){
				if(data.success){
					window.location.href="media/member/memberCheckList.jsp";
				}
			})
			 
	 })
	}
	
}

function getCause(id,filed5,openId,name){
	var update1=$.Params.create();
	var htmlCause="<span>不通过原因：</span><textarea id='filed5' ></textarea>";
	$("#span12").html(htmlCause);
	$("#filed5").val(filed5);
	 $("#responsive").modal('toggle');
	 $("#pmenuAddButton").on("click",function(){
			var filed5=$("#filed5").val().trim();
			 if(filed5==""){
				 alert("请填写不通过的原因");
				 return false;
			 }
			 	update1.addParams("id",id);
				update1.addParams("filed5",filed5);
				update1.addParams("filed3","2");
				update1.addParams("openId",openId);
				update1.addParams("name",name);
				update1.ajax(getIP()+"member.action?updateCause",function(data){
					if(data.success){
						window.location.href="media/member/memberCheckList.jsp";
					}
				})
				 
		 })
}

function getImg(card){
	var htmltp="";
	htmltp+="<img style='width:400px;height:350px;margin-left:80px;' src='data/member/"+card+"' />";
	$("#renzhengtp").html(htmltp);
	 $("#renzheng").modal('toggle');
}