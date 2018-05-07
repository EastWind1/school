var sel=$.Params.create();
$(function(){
	var type=GetQueryString("type");
	
	var name="";
	var tel="";
	getMember(name,tel);
	
	$("#searchList").on("click",function(){
   		name=$("#name").val().trim();
   		tel=$("#tel").val().trim();
   		getMember(name,tel);
   	})
   	
   	
   	function getMember(name,tel){
		if(name!=""){
   			sel.addParams("name",name);
   		}else{
   			sel.addParams("name",null);
   		}
   		if(tel!=""){
   			sel.addParams("tel",tel);
   		}else{
   			sel.addParams("tel",null);
   		}
   		sel.addParams("publicNo",brandId);
   		sel.addParams("page",0);
	   	sel.addParams("rows",rows);
   		getPageData(sel,getIP()+"member.action?list",function(data){
   	   		if(data.success){
   	   			var len=data.total;
   	   			html="";
   	   			if(len>0){
   	   				$.each(data.rows,function(i,val){
   	   					var tel=val.tel;
   	   					var hospitalName=val.hospitalName;
   	   					if(hospitalName==null || hospitalName=="null"){
   	   						hospitalName="";
	   					}
   	   					if(tel==null || tel=="null"){
   	   						tel="";
   	   					}
   	   					html+="<tr>" +
   	   							"<td>"+val.name+"</td>" +
   	   							"<td>"+hospitalName+"</td>" +
   	   							"<td>"+tel+"</td>" +
   	   							"<td><span id='getRecord' onclick ='memberAdd(\""+val.id+"\",\""+val.name+"\",\""+hospitalName+"\",\""+tel+"\")' class='checkDetailsBtn' style='width:40%'>添加</span></td>"+
   	   							"</tr>";
   	   				})
   	   			}else{
   	   				html="暂无数据！";
   	   			}
   	   			$("#qkList1").html(html);
   	   		}
   	   	})
   		}
   	
	$("#modifyVal").on("click",function(){
		var publicNo=brandId;
		var name="";
		var memberOpenid="";
		var hospital="";
		var tel="";
		$("#qkList2 tr").each(function(){
			memberOpenid=$(this).find("td[name='memberOpenid']").text();
			name=$(this).find("td[name='name']").text();
			hospital=$(this).find("td[name='hospital']").text();
			tel=$(this).find("td[name='tel']").text();
			
		})
		if(memberOpenid==""){
			alert("请选择用户");
			return false;
		}
		var onlineNo=$("#onlineNo").val();
		if(onlineNo==""){
			alert("请填写会议ID");
			return false;
		}
		var add=$.Params.create();
		add.addParams("onlineNo",onlineNo);
		add.addParams("memberId",memberOpenid);
		add.addParams("name",name);
		add.addParams("type",type);
		add.addParams("state",0);
		add.ajax(getIP()+"memberrole.action?addMember",function(data){
			if(data.success){
				alert(data.msg);
				if(type==2){
				window.location.href="media/member/memberHighUserList.jsp";
				}else if(type==7){
					window.location.href="media/member/memberFamilyUserList.jsp";
				}else{
					window.location.href="media/member/memberSuperUserList.jsp";

				}
			}else{
				alert(data.msg);
				return false;
			}
		})
		
		
		
	})
	
	
})

function memberAdd(id,name,hospitalName,tel){
	var html1="";
	html1+="<tr>" +
			"<td name='memberOpenid' style='display:none'>"+id+"</td>"+
			"<td name='name'>"+name+"</td>" +
			"<td name='hospital'>"+hospitalName+"</td>" +
			"<td name='tel'>"+tel+"</td>" +
			"<td><span onclick ='del(this)' class='checkDetailsBtn' style='width:40%'>删除</span></td>"+
			"</tr>";
	$("#qkList2").html(html1);
}
function del(obj){
	$(obj).parent().parent().remove();
}