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
    	var email=$("#email").val();
    	var province=$("#province").find("option:selected").text();
    	var city=$("#city").find("option:selected").text();
    	if(email != ""){
    		sel.addParams("email",email);
    	}else{
    		sel.addParams("email",null);
    	}
    	if(userName != ""){
    		
    		sel.addParams("name",userName);
    	}else{
    		sel.addParams("name",null);
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
    	getData();
    })
    
    /**
     * 添加
     */
    $("#addbutton").on("click",function(){
    	window.location.href="media/member/memberSpecialUserAdd.jsp?type=6";
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
    
    	
   
    function getData(){
	   	sel.addParams("page",pageList);
	   	sel.addParams("rows",rows);
	   	sel.addParams("publicNo",brandId);
	   	sel.addParams("type",6);
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
								"<td>"+val.email+"</td>" +
								"<td>"+val.province+"</td>" +
								"<td>"+val.city+"</td>" +
								"<td>"+val.hospitalName+"</td>"+
								"<td>"+
								"<span onclick='update(\""+val.id+"\")' class='checkDetailsBtn'>修改</span>"+
								"<span onclick='PasswordSet(\""+val.id+"\")' class='checkDetailsBtn'>重置密码</span></td>"+
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

function PasswordSet(id){
    	var update=$.Params.create();
		update.addParams("id",id);
		update.addParams("filed1","111111");
		update.ajax(getIP()+"member.action?updatezjPwd",function(data){
			if(data.success){
				alert("密码重置成功");
			}
		})
	
}
function update(id){
	window.location.href="media/member/memberSpecialUserModify.jsp?eid="+id+"&type=6";
}

