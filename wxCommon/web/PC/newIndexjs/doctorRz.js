var rz=$.Params.create();
var del=$.Params.create();
$(function(){
	getData();
	
	//显示示例格式
	$(".ck span").on("mouseover",function(){
		$(this).next().show();
	})
	$(".ck span").on("mouseout",function(){
		$(this).next().hide();
	})
	
	
	
	/**
	 *	获取数据
	 **/
    function getData(){
    	rz.addParams("memberId",memberId);
    	rz.addParams("deleteState",1);
    	rz.ajax(getIP()+"memberCard.action?list",function(data){
	   		if(data.success){
	   			var len=data.total;
		   		var html="";
		   		$("#yb1,#yb2,#yb3").removeAttr("value");
		   		$("#yb1,#yb2,#yb3").find("img").attr("src","weixin/images/uprz.png");
				if(len >0){
					$.each(data.rows,function(i,val){
						if(val.type==1){
							$("#yb1").attr("value","upimg");
							$("#yb1").find("img").attr("src","data/member/"+val.card).parent().attr("tid",val.id);
						}else if(val.type==2){
							$("#yb2").attr("value","upimg");
							$("#yb2").find("img").attr("src","data/member/"+val.card).parent().attr("tid",val.id);
						}else{
							$("#yb3").attr("value","upimg");
							$("#yb3").find("img").attr("src","data/member/"+val.card).parent().attr("tid",val.id);
						}
					})
				}
				$("#responsive").modal('hide');
	   		}else{
	   			alert(data.msg);
	   		}
	   	});
	}
	
	
	
    /**
     *	显示上传图片的html
     **/
	$("#yb1,#yb2,#yb3").live("click",function(event){
    	event.stopPropagation();
		var type=$(this).attr("ctype");
		$("#modalcont").html("<div style='overflow:hidden;'><img src='' alt='error' style='display:none;width: 70%;height: 255px;margin:0 auto;' />"+
							 "</div><form id='midicalRecord' method='post' enctype='multipart/form-data' style='margin-botom:0;'>上传图片："+
							 "<input type='file' class='default' id='headImgs' name='headImgs' type1='"+type+"' /></form><div>"+
							 "<button id='addRecordClass'"+
							 "type='button' class='btn blue' style='display: block;'>上传</button></div><div class='pct_yueContent' id='recordList'></div>");	
		$("#subBtn").hide();
		$(".modal-footer button:eq(0)").html("关闭");
		$("#responsive").modal('toggle');
	})

	
	
	/**
	 *	上传图片 
	 */
    $("#addRecordClass").live("click",function(){
    	var url;
    	url=getIP()+"memberCard.action?addImage";
    	var type=$("#headImgs").attr("type1");

    	 $.ajaxFileUpload({
			url: url+"&type="+type+"&filed4="+place+"&memberId="+memberId,
			secureuri: false,
			type: "post", 
			fileElementId: 'headImgs',
			success: function(data){
    		 	getData();
			}
		});  
    })
	    
    
    
	//添加、隐藏删除按钮
    $("a[value=upimg]").live("mouseover",function(){
    	$(this).find(".rz_removeImg").css("display","block");
    })
    
    $("a[value=upimg]").live("mouseout",function(){
    	$(this).find(".rz_removeImg").css("display","none");
    })
    
    
    //删除图片
    $(".rz_removeImg").on("click",function(event){
    	event.stopPropagation();
    	var id=$(this).parent().attr("tid");
    	if(confirm("确定要删除吗？")){
			del.addParams("id",id);
	    	del.addParams("memberId",memberId);
		    del.addParams("deleteState",0);
		   // alert("aaaa");
	    	del.ajax(getIP()+"memberCard.action?update",function(data){
				if(data.success){
					//$("#recordList").find("div[item='"+item+"']").remove();
					//window.location.href="PC/doctorRz.jsp";
					getData();
				}else{
		   			alert(data.msg);
		   		}
			})
    	}
    })

    
    
//    $(".zoom img").live("click",function(event){
//    	event.stopPropagation();
//    	//$(this).attr("status","1");
//    	var keyID=$(this).attr("keyID");
//    	var imgName=$(this).attr("imgName");
//    	$("#responsive").attr("keyID",keyID);
//    	$("#responsive").attr("imgName",imgName);
//    	$("#responsive").attr("status","1");//代表的点击图片时上传按钮触发修改事件
//    	$("#modalcont img").attr("src","data/order/"+imgName);
//    	$("#modalcont img").css("display","block");
//    	var imgInfo=$(this).parent().find("p").text().substring(5);
//    	$("#uploadImg_info").val("");
//    	$("#uploadImg_info").val(imgInfo);
//    	$("#responsive").modal('toggle');
//    })
})