$(function(){
	
	var sel=$.Params.create();
	sel.ajax(getIP()+"powerMenu.action?getAllMenu",function(data){
		var html="";
		$.each(data.rows,function(i,val){
			html+="<dl><dt><input id="+val.id+" name='checkbox' type='checkbox'>"+val.menuName+"</dt><dd>";
			$.each(val.subMenuList,function(i,subMenu) {
                html += "<input id="+subMenu.id1+" name='checkbox' type='checkbox'> "+subMenu.menuName1 ;
            });
			html+="</dd></dl>"
		})
		$("#allmenu").html(html);
		App.init();
	})
	
	/**
	 * 添加角色
	 */
	$("#addSubmit").on("click",function(){
		var roleId=getUUID();
		var roleName=$("#roleName").val();
		var params=getcheckdataJson(roleId);
		var choice=$("#allmenu").find("input:checked").val();
		if(roleName==""){
			alert("角色名称不能为空");
			return false;
		}
		if(choice=="undefined"||choice==undefined){
			alert("请选择权限");
			return false;
		}
		var add=$.Params.create();
		add.addParams("addlist",params); 
		add.addParams("id",roleId); 
		add.addParams("roleName",roleName); 
		add.ajax(getIP()+"powerRole.action?add",function(data){
			alert(data.msg);
			window.location.href="media/power/roleList.jsp";
		})
	})
})