
$(function(){
	var ryId=GetQueryString("ryId");
	var sysId=GetQueryString("sysId");
	var yxId=GetQueryString("yxId");
	var qtId=GetQueryString("qtId");
    getData();
    
    function getData(){
       var sel=$.Params.create();
	   sel.addParams("filed2",ryId);
	   sel.addParams("filed5","1");
	   sel.ajax(getIP()+"medicalRecord.action?list",function(data){
	   		if(data.success){
	   			var len=data.total;
	   			var html="<ul><li><span style='font-size:15px;font-weight:bold'>入院查体</span></li><br />";
				if(len >0){
					$.each(data.rows,function(i,val){
						var filed3="";
						if(val.filed3!=null){
							filed3=val.filed3;
						}
						html+=
						"<li><p><img  class='orderImgpc' src='data/order/"+val.name+"' alt='Photo' /></p><p style='font-size:15px;'>"+filed3+"</p><p onclick=del(\""+val.id+"\",\""+ryId+"\",\""+sysId+"\",\""+yxId+"\",\""+qtId+"\") class='delbut'>删除</p></li>";
					})
				
					
				}
				html+="</ul>";
				$("#recordList").html(html);
	   		}else{
	   			alert(data.msg);
	   			
	   		}
	   	});
	   var sel1=$.Params.create();
	   sel1.addParams("filed2",sysId);
	   sel1.addParams("filed5","1");
	   sel1.ajax(getIP()+"medicalRecord.action?list",function(data){
	   		if(data.success){  
	   			var len=data.total;
	   			var html="<ul><li><span style='font-size:15px;font-weight:bold'>实验室检查</span></li><br />";
	   		
				if(len >0){
					$.each(data.rows,function(i,val){
						var filed3="";
						if(val.filed3!=null){
							filed3=val.filed3;
						}
//						html+="<ul><div class='span3'><span>实验室检查</span><div class='item'>" +
//								"<li><a href='data/order/"+val.name+"' class='fancybox-button' data-rel='fancybox-button' title='Photo'>" +
//								"<div class='zoom'><img src='data/order/"+val.name+"' alt='Photo' />" +
//								"</div></a></li><li><label>"+val.filed3+"</label></li></div></div>";
						html+=
						"<li><p><img class='orderImgpc' src='data/order/"+val.name+"' alt='Photo' /></p><p style='font-size:15px;'>"+filed3+"</p><p onclick=del(\""+val.id+"\",\""+ryId+"\",\""+sysId+"\",\""+yxId+"\",\""+qtId+"\") class='delbut'>删除</p></li>";
					})
				}
				html+="</ul>";
				$("#recordList1").html(html);
	   		}else{
	   			alert(data.msg);
	   		}
	   	});
	   var sel2=$.Params.create();
	   sel2.addParams("filed2",yxId);
	   sel2.addParams("filed5","1");
	   sel2.ajax(getIP()+"medicalRecord.action?list",function(data){
	   		if(data.success){
	   			var len=data.total;
	   			var html="<ul><li><span style='font-size:15px;font-weight:bold'>影像学查体</span></li><br />";
	   		
				if(len >0){
					$.each(data.rows,function(i,val){
						var filed3="";
						if(val.filed3!=null){
							filed3=val.filed3;
						}
//						html+="<ul><div class='span3'><span>影像学查体</span><div class='item'>" +
//								"<li><a href='data/order/"+val.name+"' class='fancybox-button' data-rel='fancybox-button' title='Photo'>" +
//								"<div class='zoom'><img src='data/order/"+val.name+"' alt='Photo' />" +
//								"</div></a></li><li><label>"+val.filed3+"</label></li></div></div>";
						html+=
						"<li><p><img  class='orderImgpc' src='data/order/"+val.name+"' alt='Photo' /></p><p style='font-size:15px;'>"+filed3+"</p><p onclick=del(\""+val.id+"\",\""+ryId+"\",\""+sysId+"\",\""+yxId+"\",\""+qtId+"\") class='delbut'>删除</p></li>";
					})
				}
				html+="</ul>";
				$("#recordList2").html(html);
	   		}else{
	   			alert(data.msg);
	   		}
	   	});
	   var sel3=$.Params.create();
	   sel3.addParams("filed2",qtId);
	   sel3.addParams("filed5","1");
	   sel3.ajax(getIP()+"medicalRecord.action?list",function(data){
	   		if(data.success){
	   			var len=data.total;
	   			var html="<ul><li><span style='font-size:15px;font-weight:bold'>其他辅助查体</span></li><br />";
	   		
				if(len >0){
					$.each(data.rows,function(i,val){
						var filed3="";
						if(val.filed3!=null){
							filed3=val.filed3;
						}
//						html+="<ul><div class='span3'><span>其他辅助查体</span><div class='item'>" +
//								"<li><a href='data/order/"+val.name+"' class='fancybox-button' data-rel='fancybox-button' title='Photo'>" +
//								"<div class='zoom'><img src='data/order/"+val.name+"' alt='Photo' />" +
//								"</div></a></li><li><label>"+val.filed3+"</label></li></div></div>";
						html+=
						"<li><p><img class='orderImgpc' src='data/order/"+val.name+"' alt='Photo' /></p><p style='font-size:15px;'>"+filed3+"</p><p onclick=del(\""+val.id+"\",\""+ryId+"\",\""+sysId+"\",\""+yxId+"\",\""+qtId+"\") class='delbut'>删除</p></li>";
					})
				
					
				}
			html+="</ul>";
				$("#recordList3").html(html);
	   		}else{
	   			alert(data.msg);
	   		}
	   	});
	}
    
    
//	$("#addRecordClass").on("click",function(){
//		$("#addCourse").attr("action",getIP()+"courseDb.action?addImage");
//		$("#addCourse").submit();
//	})
   
    
    
    
})

function del(id,ryId,sysId,yxId,qtId){
	if(confirm("确认要删除吗！")){
    	var del=$.Params.create();
    	del.addParams("id",id);
    	del.addParams("filed5","0");
    	del.ajax(getIP()+"medicalRecord.action?update",function(data){
    		if(data.success){
    			window.location.href="PC/newSayImg.jsp?ryId="+ryId+"&sysId="+sysId+"&yxId="+yxId+"&qtId="+qtId;
    		}
    		
    	})
	}
    	
    }
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
