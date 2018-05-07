var sel=$.Params.create();
var pageList=window.localStorage.getItem("pageList");
if(pageList==null||pageList=="null"){
	pageList=0;
}
$(function(){
	/**
 	 * 省份
 	 */
var chinacity=china.length;
	var province="<option selected='selected'>请选择省份</option>";
	for(var i=0;i<china.length;i++){
		province+="<option value="+i+">"+china[i][0]+"</option>";
	}
	$("#province").html(province);
	/**
	 * 城市
	 */
	$("#province").on("change",function(){
		var provinceId=$(this).val();
		var province1=$(this).find("option:selected").text();
		var city="<option selected='selected'>请选择城市</option>";
		if(province1!="请选择省份"){
			for(var y=1;y<china[provinceId].length;y++){
		 		city+="<option value="+china[provinceId][y]+">"+china[provinceId][y]+"</option>";
			} 
		}
		$("#city").html(city);
	})
    getData();
    
    /**
     * 查询
     */

    $("#searchList").on("click",function(){
    	var userName=$("#userName").val();
    	var tel=$("#tel").val();
    	var province=$("#province").find("option:selected").text();
    	var city=$("#city").find("option:selected").text();
    	var hospitalName=$("#hospitalName").val();
    	var hospitalOffices=$("#hospitalOffices").find("option:selected").text();
    	var jobTitle=$("#jobTitle").find("option:selected").text();
    	
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
    	if(hospitalName != ""){
    		
    		sel.addParams("hospitalName",hospitalName);
    	}else{
    		sel.addParams("hospitalName",null);
    	}
    	if(province != "请选择省份"){
    		sel.addParams("province",province);
    	}else{
    		sel.addParams("province",null);
    	}
    	if(city != "请选择城市"){
    		sel.addParams("city",city);
    	}else{
    		sel.addParams("city",null);
    	}
    	if(hospitalOffices != "请选择科室"){
    		sel.addParams("hospitalOffices",hospitalOffices);
    	}else{
    		sel.addParams("hospitalOffices",null);
    	}
    	if(jobTitle != "请选择职称"){
    		sel.addParams("jobTitle",jobTitle);
    	}else{
    		sel.addParams("jobTitle",null);
    	}
    	
    	getData();
    })
    
    /**
     * 添加
     */
    $("#addbutton").on("click",function(){
    	window.location.href="media/member/memberAdd.jsp";
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
    
    
    
   
    $("#rzbutton").on("click",function(){
    	var params=getcheckdata();
    	
    	if(params == ""){
    		alert("请选择记录");
    		return false;
    	}
    	var sel1=$.Params.create();
    	sel1.addParams("id",params);
    	sel1.addParams("publicNo",brandId);
    	sel1.ajax(getIP()+"member.action?sel",function(data){
    		if(data.success){
    		
    		var openId=data.member.openId;
    		var hospitalName=data.member.hospitalName;
    		var province=data.member.province;
    		
    	var update=$.Params.create();
    	update.addParams("id",params);
    	update.addParams("type",1);
    	update.ajax(getIP()+"member.action?update",function(data){
    		if(data.success){
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
    			    	update1.addParams("doctorCertificate",hospitalName);
    			    	update1.addParams("createUser",province);
    			    	update1.addParams("filed5","1");
    			    	update1.ajax(getIP()+"expert.action?update1",function(data){
    			    		if(data.success){
    			    			alert("指定成功");
    			    			window.location.href="media/member/memberList.jsp";	
    			    		} 
    			    	})
    			    	
    					})
    					
    				} 
    			});
    			
    		}
    	});
    		}
		});
    		
    })
   
    function getData(){
	   	sel.addParams("page",pageList);
	   	sel.addParams("rows",rows);
	   	sel.addParams("publicNo",brandId);
	   	sel.addParams("type",0);
	   	getPageData(sel,getIP()+"member.action?list",function(data){
	   		if(data.success){
	   			var len=data.total;
	   			window.localStorage.setItem("pageList",pageList);
		   		var html="";
				if(len >0){
					$.each(data.rows,function(i,val){
						html+="<tr>" +
								"<td><input id='"+val.id+"' name='checkbox' type='checkbox'></td>" +
								"<td>"+val.name+"</td>" +
								"<td>"+val.tel+"</td>" +
								"<td>"+showSex(val.sex)+"</td>" +
								"<td>"+showValue(val.hospitalName)+"</td>"+
								"<td>"+showValue(val.hospitalOffices)+"</td>"+
								"<td>"+showValue(val.jobTitle)+"</td>"+
								"<td>"+val.createTime+"</td>"+
								"<td>"+
								//"<span onclick='getDetail(\""+val.id+"\")' class='checkDetailsBtn'>查看详情</span>"+
								"<span onclick='update(\""+val.id+"\")' class='checkDetailsBtn'>修改</span>"+
								"<span onclick='setPassword(\""+val.id+"\")' class='checkDetailsBtn'>重置密码</span></td>"+
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
function update(id){
	window.location.href="media/member/memberModify.jsp?eid="+id;
}

function setPassword(eid){
	var update=$.Params.create();
	update.addParams("id",eid);
	update.addParams("filed1","111111");
	update.ajax(getIP()+"member.action?updatezjPwd",function(data){
		if(data.success){
			alert("密码重置成功");
		}
	})
}
