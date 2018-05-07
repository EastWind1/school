var sel=$.Params.create();
$(function(){
	
	var newDate = getNowDate();
    $("#d5222").val(newDate);
    var zdateStart=new Date((+new Date())-100*24*3600*10000).format("yyyy-MM-dd");
    $("#d5221").val(zdateStart);
    
    getDate();
    
    /**
     * 查询
     */
    $("#searchList").on("click",function(){  	
    	getDate();
    })
    function getDate(){
		var datefrom=$("#d5221").val();
	    var dateto=$("#d5222").val();
		sel.addParams("datefrom",datefrom);
	   	sel.addParams("dateto",dateto);
	   	sel.addParams("page",0);
	   	sel.addParams("rows",rows);
	   	sel.addParams("subscribe","1");
	   	getPageData(sel,getIP()+"wxUsers.action?listWxUsers",function(data){
	   		var len=data.rows.length;
	   		var html="";
			if(len >0){
				$.each(data.rows,function(i,val){
					var sex=val.sex;
					if(sex == "2"){
						sex="女";
					}else if(sex == "1"){
						sex="男";
					}else{
						sex="未知";
					}
					html+="<tr>" +
							"<td><input id='"+val.id+"' name='checkbox' type='checkbox'></td>" +
							"<td><img style='width:80px;height:80px;' src='"+val.headImgurl+"'></td>" +
							"<td>"+val.nickName+"</td>" +
							"<td>"+sex+"</td>" +
							"<td>"+val.country + val.province + val.city +"</td>" +
							"<td>"+val.subscribeTime+"</td></tr>";
				})
			}else{
				html="<tr><td colspan='4'>暂无数据</td></tr>";
			}
			$("table tbody").html(html);
			App.init();
	   	});
	}
   

})


