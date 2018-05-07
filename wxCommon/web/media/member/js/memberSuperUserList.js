var sel=$.Params.create();
var pageList=window.localStorage.getItem("pageList");
if(pageList==null||pageList=="null"){
	pageList=0;
}
$(function(){
	
	
    getData();
    
    /**
     * 查询
     */

    $("#searchList").on("click",function(){
    	var userName=$("#userName").val();
    	var tel=$("#tel").val();
    	if(tel != ""){
    		sel.addParams("tel",tel);
    	}else{
    		sel.addParams("tel",null);
    	}
    	if(userName != ""){
    		
    		sel.addParams("name",userName);
    	}else{
    		sel.addParams("name",null);
    	}
    	getData();
    })
    
    /**
     * 添加
     */
    $("#addbutton").on("click",function(){
    	window.location.href="media/member/memberHighUserAdd.jsp?type="+8;
    })
    
     $("#addMemberbutton").on("click",function(){
    	window.location.href="media/member/memberGetMeetAdd.jsp?type="+8;
    })
    
     $("#delbutton").on("click",function(){
    	var params=getcheckdata();
    	var paramT=getcheckotherdata();
    	if(params == ""){
    		alert("请选择记录");
    		return false;
    	}
    	if(confirm("确定要删除吗？")){
    		var del=$.Params.create();
        	del.addParams("id",params);
        	del.addParams("memberId",paramT);
        	del.ajax(getIP()+"memberrole.action?delMoreMember",function(data){
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
	   	sel.addParams("page",pageList);
	   	sel.addParams("rows",rows);
	   	sel.addParams("type",8);
	   	getPageData(sel,getIP()+"memberrole.action?getList",function(data){
	   		if(data.success){
	   			var len=data.total;
	   			window.localStorage.setItem("pageList",pageList);
		   		var html="";
				if(len >0){
					$.each(data.rows,function(i,val){
						var tel=val.tel;
						var email=val.email;
						var state=val.state;
						if(tel==null || tel=="null"){
							tel="";
						}
						if(email==null || email=="null"){
							email="";
						}
						if(state==0){
							state="离线";
						}else{
							state="在线";
						}
						
						html+="<tr>" +
								"<td><input id='"+val.id+"' name='checkbox' memberId='"+val.memberId+"' type='checkbox'></td>" +
								"<td>"+val.name+"</td>" +
								"<td>"+tel+"</td>" +
								"<td>"+email+"</td>" +
								"<td>"+val.onlineNo+"</td>"+
								"<td>"+state+"</td>"+
								"<td>"+
								"<span onclick='closeMeet(\""+val.memberId+"\",\""+val.id+"\")' class='checkDetailsBtn'>离开会议</span>"+
								"<span onclick='update(\""+val.id+"\")' class='checkDetailsBtn'>修改</span>"+
								"<span onclick='PasswordSet(\""+val.memberId+"\")' class='checkDetailsBtn'>重置密码</span></td>"+
								"</tr>";
					})
				}else{
					html="<tr><td colspan='7'>暂无数据</td></tr>";
				}
				$("table tbody").html(html);
				App.init();
	   		}else{
	   			alert(data.msg);
	   		}
	   		
	   	});
	}
    
   
})

function PasswordSet(memberId){
    	var update=$.Params.create();
		update.addParams("id",memberId);
		update.addParams("filed1","111111");
		update.ajax(getIP()+"member.action?updatezjPwd",function(data){
			if(data.success){
				alert("密码重置成功");
			}
		})
	
}
function update(id){
	window.location.href="media/member/memberHighUserModify.jsp?eid="+id+"&type="+8;
}

function closeMeet(eid,id){
	var p=$.Params.create();
	if(confirm("确认要离开会议吗！")){
	p.addParams("id",id);
	p.addParams("state",0);
	p.addParams("memberId",eid);
	p.addParams("filed2","6");
	p.ajax(getIP()+"memberrole.action?updateState",function(data){
		if(data.success){
			window.location.href="media/member/memberSuperUserList.jsp";
		}
	})
	}
}
