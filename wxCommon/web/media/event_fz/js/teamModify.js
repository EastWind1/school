
$(function(){
	var eid=GetQueryString("eid");
	
	
	 /*
     * 加载分组
     */
    var p=$.Params.create();
    p.ajax(getIP()+"eventgagroup.action?list",function(data){
    	if(data.success){
    		var html="<option value='0' groupId='0'>请选择分组</option>";
    		$.each(data.rows,function(i,val){
    			html+="<option value='"+val.groupName+"' groupId='"+val.id+"'>"+val.groupName+"</option>";
    		})
    		$("#group").html(html);
    	}
    })
	
	
	var sel=$.Params.create();
	sel.addParams("id",eid);
	sel.ajax(getIP()+"eventgateam.action?list",function(data){
		if(data.success){
			var val=data.rows[0];
			$("#img").attr("src","data/eventfz/"+val.headImg);
			$("#group").val(val.groupName);
			$("#hospitalName").val(val.hospitalName);
		
			
		}
		
	})
	
	  $("#modifyVal").on("click",function(){
		  
	
	
	var groupId=$("#group").find("option:selected").attr("groupId");
	
	var groupName=$("#group").find("option:selected").text();
	
	
	var hospitalName=$("#hospitalName").val().trim();
	
	$("#groupId").val(groupId);
	$("#eid").val(eid);

	if(groupId=="0"){
		alert("请选择分组！");
		return false;
	}
	
	if(hospitalName==""){
		alert("请填所在单位！");
		return false;
	}
	
	$("#commentForm").attr("action",getIP()+"eventgateam.action?updateImg");
	$("#commentForm").submit();
	
	  })
	
})