var sel=$.Params.create();
$(function(){
	var orderId=GetQueryString("id");
    getData();
    
    function getData(){
	   sel.addParams("orderId",orderId);
	   sel.ajax(getIP()+"medicalRecord.action?list",function(data){
	   		if(data.success){
	   			var len=data.total;
		   		var html="";
				if(len >0){
					$.each(data.rows,function(i,val){
						html+="<div class='span3'><div class='item'>" +
								"<a href='data/order/"+val.name+"' class='fancybox-button' data-rel='fancybox-button' title='Photo'>" +
								"<div class='zoom'><img src='data/order/"+val.name+"' alt='Photo' />" +
								"</div></a></div></div>";
					})
				}
				$("#recordList").html(html);
	   		}else{
	   			alert(data.msg);
	   		}
	   	});
	}
    $("#addRecordClass").on("click",function(){
//    	    $("#midicalRecord").attr("action",getIP()+"medicalRecord.action?addImage");
    		if($("#headImgs").val() == ""){
    			alert("请选择病历");return false;
    		}
    	    $.ajaxFileUpload({
url: getIP()+"medicalRecord.action?addImage&orderId="+orderId+"&place="+place,
secureuri: false,
fileElementId: 'headImgs',
success: function(data){   
    	    				getData();
    					},
});
    	//	$("#midicalRecord").submit();
//    	    $.ajax({
//    	        cache: true,
//    	        type: "POST",
//    	        url:getIP()+"medicalRecord.action?addImage",
//    	        data:$('#midicalRecord').serialize(),// 你的formid
//    	        success: function(data) { 
//    	           alert(data.msg);
//    	        }
//    	    });
    	
    })
    
//	$("#addRecordClass").on("click",function(){
//		$("#addCourse").attr("action",getIP()+"courseDb.action?addImage");
//		$("#addCourse").submit();
//	})
   
   
})


		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
