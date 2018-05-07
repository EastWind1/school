
$(function(){
	 /*
     * 加载分组
     */
    var p=$.Params.create();
    p.ajax(getIP()+"eventgagroup.action?list",function(data){
    	if(data.success){
    		var html="<option value='0' groupId='0'>请选择分组</option>";
    		$.each(data.rows,function(i,val){
    			html+="<option value='"+val.groupName+"' groupId='"+val.id+"' >"+val.groupName+"</option>";
    		})
    		$("#group").html(html);
    	}
    })
    $("#modifyVal").on("click",function(){

    var groupId=$("#group").find("option:selected").attr("groupId");
    
    var groupName=$("#group").find("option:selected").text();
	
	var hospitalName=$("#hospitalName").val().trim();
	
	if(groupId=="0"){
		alert("请选择分组名称！");
		return false;
	}
	
	if(hospitalName==""){
		alert("请填写所在单位");
		return false;
	}
    $("#groupId").val(groupId);
	$("#commentForm").attr("action",getIP()+"eventgateam.action?addImage");
	$("#commentForm").submit();
	
    })
})