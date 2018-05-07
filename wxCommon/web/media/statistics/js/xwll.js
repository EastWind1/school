var sel=$.Params.create();
$(function(){
//	var newDate = getNowDate();
//    $("#d5222").val(newDate);
//    var zdateStart=new Date((+new Date())-30*24*3600*1000).format("yyyy-MM-dd");
//    $("#d5221").val(zdateStart);
    
  //  getData();

    /**
     * 查询
     */
//    $("#searchList").on("click",function(){
//       	var userName=$("#name").val();
//    	if(userName != ""){
//    		sel.addParams("name",userName);
//    	}else{
//    		sel.addParams("name",null);
//    	}
//    	getData();
//    })
    
    /*添加*/
//    $("#addbutton").on("click",function(){
//    	window.location.href="media/expert/expertEdit.jsp";
//    })
    
//    /**
//     * 删除
//     */
//    $("#delbutton").on("click",function(){
//    	var params=getcheckdata();
//    	if(params == ""){
//    		alert("请选择记录");
//    		return false;
//    	}
//    	if(confirm("确定要删除吗？")){
//    		var del=$.Params.create();
//        	del.addParams("id",params);
//        	del.ajax(getIP()+"expert.action?delMore",function(data){
//        		alert(data.msg);
//        		if(data.success){
//        			$("#queryCheckbox").removeAttr("checked");
//        			$("#queryCheckbox").parent().removeClass("checked");
//        			getData();
//        		}
//        	})
//    	}
//    })
//    
   // function getData(){
//    
	   	sel.addParams("page",0);
	   	sel.addParams("rows",rows);
	   
	   getPageData(sel,getIP()+"information.action?informationReadCount",function(data){
	   		if(data.success){
	   			var len=data.rows.length;
		   		var html="";
				if(len >0){
					$.each(data.rows,function(i,val){
					
						html+="<tr>" +
								//"<td><input id='"+val.id+"' name='checkbox' type='checkbox'></td>" +
								//"<td><img src='data/expert/"+val.headImg+"' /></td>"+
								"<td>"+val.informationTitle+"</td>" +
								"<td>"+val.number+"</td>" +
//								"<td>"+val.filed1+"</td>" +
//								"<td>"+val.filed3+"</td>"+
//								"<td>"+val.filed2+"</td>"+
//								"<td>" +
//								"<span onclick='getDetail(\""+val.id+"\")' class='checkDetailsBtn' style='width:30%'>查看详情</span>"+
//								"<span onclick='update(\""+val.id+"\")' class='checkDetailsBtn' style='width:30%'>修改</span></td></tr>";
								"</tr>";
					})
				}else{
					html="<tr><td colspan='2'>暂无数据</td></tr>";
				}
				$("table tbody").html(html);
				App.init();
	   		}else{
	   			alert(data.msg);
	   		}
	   		
	   	});
//	}
   

})

//function addCourse(id){
//	window.location.href="media/course/courseDbAdd.jsp?eid="+id;
//}
//
//function getDetail(id){
//	window.location.href="media/expert/expertDetails.jsp?eid="+id;
//}
//function update(id){
//	window.location.href="media/expert/expertModify.jsp?eid="+id;
//}

