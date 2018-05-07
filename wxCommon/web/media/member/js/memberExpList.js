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
    	window.location.href="media/member/expertAdd.jsp";
    })
    
     $("#delbutton").on("click",function(){
    	var params=getcheckdata();
    	if(params == ""){
    		alert("请选择记录");
    		return false;
    	}
    	if(confirm("确定要删除吗？")){
    		var del=$.Params.create();
        	del.addParams("id",params);
        	del.ajax(getIP()+"memberrole.action?delMore",function(data){
        		alert(data.msg);
        		if(data.success){
        			$("#queryCheckbox").removeAttr("checked");
        			$("#queryCheckbox").parent().removeClass("checked");
        			getData();
        		}
        	})
    	}
    })
    
    
    
   
    $("#rzbutton").on("click",function(){
    	var params=getcheckdata();
    	if(params == ""){
    		alert("请选择记录");
    		return false;
    	}
    	var openId=$("#"+params).attr("openId");
    	var hospitalName=$("#"+params).attr("hospitalName");
    	var province=$("#"+params).attr("province");
    	var listrole=$.Params.create();
		listrole.addParams("type",1);
		listrole.addParams("publicNo",brandId);
		listrole.ajax(getIP()+"expert.action?list",function (data){
			if(data.success){
				var html="<option>请选择专家</option>";
				$.each(data.rows,function(i,val){
					html+="<option value='"+val.id+"'>"+val.name+"</option>";
				})
			
				$("#expertId").html(html);
				$("#pkid").val(pkid);
				$("#responsive").modal('toggle');
				$("#pmenuAddButton").on("click",function(){
				var experId=$("#expertId").val();
				var update1=$.Params.create();
				
		    	update1.addParams("id",experId);
		    	update1.addParams("openId",openId);
		    	update1.addParams("filed4",params);
		    	update1.addParams("doctorCertificate",hospitalName);
		    	update1.addParams("createUser",province);
		    	update1.addParams("filed5","1");
		    	update1.ajax(getIP()+"expert.action?update1",function(data){
		    		if(data.success){
		    			alert("指定成功");
		    			window.location.href="media/member/memberExpList.jsp";	
		    		} 
		    	})
		    	
				})
				
			} 
		});
    	
    
    		
    })
   
    function getData(){
	   	sel.addParams("page",pageList);
	   	sel.addParams("rows",rows);
	   	sel.addParams("type",1);
	   	getPageData(sel,getIP()+"memberrole.action?getList",function(data){
	   		if(data.success){
	   			var len=data.total;
	   			window.localStorage.setItem("pageList",pageList);
		   		var html="";
				if(len >0){
					$.each(data.rows,function(i,val){
						var email=val.email;
						if(email==null || email=="null"){
							email="";
						}
						html+="<tr>" +
								"<td><input id='"+val.id+"' openId='"+val.openId+"' hospitalName='"+val.hospitalName+"' province='"+val.province+"' name='checkbox' type='checkbox'></td>" +
								"<td>"+val.name+"</td>" +
								"<td>"+val.tel+"</td>" +
								"<td>"+email+"</td>" +
								"<td>"+val.createTime+"</td>"+
								"<td>"+
								//"<span onclick='getDetail(\""+val.id+"\")' class='checkDetailsBtn'>查看详情</span>"+
								"<span onclick='update(\""+val.memberId+"\")' class='checkDetailsBtn'>修改</span></td>"+
								//"<td>审核</td>" +
								"</tr>";
					})
				}else{
					html="<tr><td colspan='10'>暂无数据</td></tr>";
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
    $("#rzbutton").on("click",function(){
    	
    })
   
})

function getDetail(id){
	window.location.href="media/member/memberDetails.jsp?eid="+id;
}
function update(memberId){
	window.location.href="media/member/memberModify.jsp?eid="+memberId;
}

