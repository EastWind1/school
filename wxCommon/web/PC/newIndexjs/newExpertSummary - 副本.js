var summary=$.Params.create();
var sel=$.Params.create();
if(memberId==""){
	window.location.href=getIP()+"PC/newIndex.jsp";
}	
 	$(function(){
 		var expertOpenId=GetQueryString("eid");
 		var expId=GetQueryString("expId");
 		var orderId=getUUID();
 		summary.addParams("type","1");
 		summary.addParams("publicNo",brandId);
 		summary.addParams("filed5","1");
		summary.ajax(getIP()+"expert.action?list",function (data){
			if(data.success){
				var html="<option value='0'>请选择专家</option>";
				$.each(data.rows,function(i,val){
					html+="<option openId='"+val.id+"' value='"+val.openId+"'>"+val.name+"</option>";
				})
				$("#expertId1,#expertId2,#expertId3").html(html);
				//$("#expertId1").val(expId);
				
				$("#expertId1 option").each(function(){
					var openId=$(this).attr("openId");
					if(openId==expId){
						$(this).attr("selected",true);
					}
				})
				
				
				$(".yue_selExp select").each(function(){
					if($(this).find("option:selected").text()!="请选择专家"){
						$(this).next().css("display","inline-block");
					}else{
						$(this).next().css("display","none");
					}
				})
				
				$(".yue_selExp select").on("change",function(){
					if($(this).find("option:selected").text()!="请选择专家"){
						$(this).next().css("display","inline-block");
					}else{
						$(this).next().css("display","none");
					}
				})
				
				$(".yue_qingchu").on("click",function(){
					$(this).prev().find("option:first-child").attr("selected",true);
					$(this).css("display","none");
				})
			}
		});
		
		$("#sumSubmit_ryjc,#sumSubmit_sysjc,#sumSubmit_yxxjc,#sumSubmit_other").live("click",function(){
			//$("#showImg").attr("status","undefined");
			$("#responsive").attr("status","0");//代表点击上传按钮时 上传按钮触发添加事件
			var filed4=$(this).attr("filed4");
			var name=$(this).attr("name");
			var uuid="";
			var file2=$("#"+name+"").val();
			if(file2 == ""){
				uuid=getUUID();
			}else{
				uuid=file2;
			}
			$("#"+name+"").val(uuid);
			$("#modalcont").html("<img src='' alt='error' style='display:none;width: 60%;height: 255px;margin: 0 auto;' /><form id='midicalRecord' method='post' enctype='multipart/form-data'>上传图片："+
								 "<input type='file' class='default' id='headImgs' name='headImgs' /></form><div>备注："+
								 "<textarea id='uploadImg_info' style='width:80%;resize: none;'></textarea>"+
								 "<button id='addRecordClass' uuid='"+uuid+"' filed4type='"+filed4+"' name='"+name+"'"+
								 "type='button' class='btn blue' style='display: block;'>上传</button></div><div class='pct_yueContent' id='recordList'></div>");	
			//$(".modal-footer").hide();
			$("#subBtn").hide();
			$(".modal-footer button:eq(0)").html("关闭");
			$("#responsive").modal('toggle');
		//	getData(uuid,filed4);
			//getUUID
		})
	

	    $("#addRecordClass").live("click",function(){
	    	var status=$("#responsive").attr("status");
	    	var keyID;
	    	var imgInfo=$("#uploadImg_info").val();//备注
	    	var file4=$(this).attr("filed4type");//4大类型
	    	var randomNum=$(this).attr("uuid");
	    	var url;
	    	var imname;
	    	if(status == "0"){//添加逻辑
		    	if($("#headImgs").val() == ""){
	    			alert("请选择图片");
	    			return false;
	    		}
	    		url=getIP()+"medicalRecord.action?addImage";
	    	}else{//修改逻辑
	    		keyID=$("#responsive").attr("keyID");
	    		imname=$("#responsive").attr("imgName");
	    		url=getIP()+"medicalRecord.action?updateImage&id="+keyID+"&imageName1="+imname;
	    	}
	    	

	    	
	    	 $.ajaxFileUpload({
				url: url+"&filed3="+imgInfo+"&place="+place+"&filed4="+file4+"&filed2="+randomNum+"&orderId="+orderId,
				secureuri: false,
				type: "post", 
				fileElementId: 'headImgs',
				success: function(data){

	    		 console.log($("#headImgs").val());
	    		 getData(randomNum,file4);
				}
			});
	    	
	    	  
	    })
		    
		//添加删除按钮
	    $(".zoom").live("mouseover",function(){
	    	$(this).find("a[class='delImg']").addClass("removeImg");
	    	$(this).find("a[class='delImg removeImg']").html("X");
	    })
	     
	    $(".zoom").live("mouseout",function(){
	    	$(this).find("a[class='delImg removeImg']").removeClass("removeImg");
	    	$(this).find("a[class='delImg']").html("");
	    })
	    $(".removeImg").live("click",function(){
	    	var item=$(this).attr("containBox");
	    	var filed2=$(this).attr("filed2");
	    	var filed4=$(this).attr("filed4type");
	    	var del=$.Params.create();
	    	del.addParams("id",item);
			//sel.addParams("filed2",filed2);
		    //sel.addParams("filed4",filed4);
	    	del.addParams("filed5","0");
	    	del.ajax(getIP()+"medicalRecord.action?update",function(data){
				if(data.success){
					//$("#recordList").find("div[item='"+item+"']").remove();
					getData(filed2,filed4);
				}else{
		   			alert(data.msg);
		   		}
			})
	    })
	    
	    $(".zoom img").live("click",function(event){
	    	event.stopPropagation();
	    	//$(this).attr("status","1");
	    	var keyID=$(this).attr("keyID");
	    	var imgName=$(this).attr("imgName");
	    	$("#responsive").attr("keyID",keyID);
	    	$("#responsive").attr("imgName",imgName);
	    	$("#responsive").attr("status","1");//代表的点击图片时上传按钮触发修改事件
	    	$("#modalcont img").attr("src","data/order/"+imgName);
	    	$("#modalcont img").css("display","block");
	    	var imgInfo=$(this).parent().find("p").text().substring(5);
	    	alert(imgInfo);
	    	$("#uploadImg_info").val("");
	    	$("#uploadImg_info").val(imgInfo);
	    	$("#responsive").modal('toggle');
	    })
	    
	    function getData(randomNum,file4){
			$("#uploadImg_info").val("");
			sel.addParams("filed2",randomNum);
			sel.addParams("filed4",file4);
			sel.addParams("filed5","1");
			sel.ajax(getIP()+"medicalRecord.action?list",function(data){
		   		if(data.success){
		   			var len=data.total;
			   		var html="";
					if(len >0){
						$.each(data.rows,function(i,val){
							html+="<div item='"+val.id+"' class='zoom' style='max-width: 226px;min-height:234px;display:inline-block;margin-right:8px;vertical-align:top;position:relative;'>" +
									//"<a href='data/order/"+val.name+"' class='fancybox-button' data-rel='fancybox-button' title='Photo'>" +
									"<img style='min-width:220px;width:100%;height: 220px;' src='data/order/"+val.name+"' alt='Photo' imgName='"+val.name+"' keyID='"+val.id+"' status='' /><a id='removeImg' class='delImg' containBox='"+val.id+"' filed2='"+randomNum+"' filed4type='"+file4+"'></a>" +
									"<p style='min-height:20px;line-height:20px;word-break: break-all;'><span style='color:#000;font-weight:bold;'>病情描述</span>："+val.filed3+"</p>"+
									"</div>";
						})
					}
					$("#uploadimg"+file4).html(html+"<a id='sumSubmit_ryjc' filed4='1' name='ryjc' type='button' class='btn blue sum_uploadImg'>+</a>");
					$("#uploadimg"+file4+" a").css("vertical-align","top");
					$("#responsive").modal('hide');
		   		}else{
		   			alert(data.msg);
		   		}
		   	});
		}
	    
		$("#sum_sex img").on("click",function(){
	 		 $(this).attr("src","PC/image/sex1.png");
	 		 $(this).siblings().attr("src","PC/image/sex0.png");
	 	})

		$("#summary").on("click",function(){
			addOrderpc();
		})
		
		/***
		预约
		**/
		function addOrderpc(){
			//alert("预约功能暂不开放，敬请期待！");
			var expertId1=$('#expertId1').val();
			var expertId2=$('#expertId2').val();
			var expertId3=$('#expertId3').val();
			var remark=$("#remark").val();
			var expertName1=$('#expertId1 option:selected').text();
			var expertName2=$('#expertId2 option:selected').text();
			var expertName3=$('#expertId3 option:selected').text();
			var eopenId=$('#expertId1 option:selected').attr("openId");
			var birthday=$('#birthday').val().trim();
			var sex=$("#sum_sex img[src='PC/image/sex1.png']").attr("sex");
			var height=$('#sum_height').val().trim();
			var weight=$('#sum_weight').val().trim();
			var job=$('#sum_job').val().trim();
			var zhusu=$('#sum_zhusu').val().trim();
			var xianbingshi=$('#sum_xianbingshi').val().trim();
			var jiwangshi=$('#sum_jiwangshi').val().trim();
			var gerenshi=$('#sum_gerenshi').val().trim();
			var jiazushi=$('#sum_jiazushi').val().trim();
			var guominshi=$('#sum_guominshi').val().trim();
			var zhenduan=$('#sum_zhenduan').val().trim();
			var fangan=$('#sum_fangan').val().trim();
		//	var ehua=$('#sum_ehua').val();
			
			var ryjc=$('#sum_ryjc').val().trim();
			var sysjcId=$('#sysjc').val().trim();
			var ryjcId=$('#ryjc').val().trim();
			var otherId=$('#qtjc').val().trim();
			var yxxjcId=$('#yxxjc').val().trim();
			if(ryjcId ==""){
				ryjcId=getUUID();
			}if(sysjcId ==""){
				sysjcId=getUUID();
			}if(yxxjcId ==""){
				yxxjcId=getUUID();
			}if(otherId ==""){
				otherId=getUUID();
			}
			var sysjc=$('#sum_sysjc').val().trim();
			
			var yxxjc=$('#sum_yxxjc').val().trim();
			
			var other=$('#sum_other').val().trim();
			
			var admissionTime=$('#admissionTime').val();
			var expertId="";
			var expertOpenId="";
			var expertName="";
			if(expertId1 != "0"){
				expertOpenId=expertId1+",";
				expertName=expertName1+",";
			}
			if(expertId2 != "0"){
				expertOpenId+=expertId2+",";
				expertName+=expertName2+",";
			}
			if(expertId3 != "0"){
				expertOpenId+=expertId3+",";
				expertName+=expertName3+",";
			}
			expertOpenId=expertOpenId.substring(0,expertOpenId.length-1);
			if(expertOpenId == ""){
				alert("请选择专家！");
				$("#expertId1").focus();
				return false;
			}
			
			if((expertName1==expertName2 && expertName1 !="请选择专家" && expertName2!="请选择专家") ||
				(expertName1==expertName3 && expertName1 !="请选择专家" && expertName3 !="请选择专家" ) || 
				(expertName2==expertName3 && expertName2 !="请选择专家"  && expertName3 !="请选择专家")){
				alert("专家有重复,请另选专家");
				return false;
			}
			if(birthday==""){
				alert("请填写年龄");
				$("#birthday").focus();
				return false;
			}
			if(zhusu==""){
				alert("请填写主诉");
				$("#sum_zhusu").focus();
				return false;
			}
			//if(remark==""){
			//	alert("请描述病情");
			//	return false;
			//}
			
			expertName=expertName.substring(0,expertName.length-1);
			var add=$.Params.create();
			add.addParams("expertOpenid",expertOpenId);
			add.addParams("memberOpenid",memberId);
			add.addParams("publicNo",brandId); 
			add.addParams("birthday",birthday);
			add.addParams("sex",sex);
			add.addParams("height",height);
			add.addParams("weight",weight);
			add.addParams("occaption",job);
			add.addParams("chiefComplaint",zhusu);
			add.addParams("illPrenent",xianbingshi);
			add.addParams("illPost",jiwangshi);
			add.addParams("illPersonal",gerenshi);
			add.addParams("illFamily",jiazushi);
			add.addParams("allergryHistory",guominshi);
			add.addParams("preDiagnosis",zhenduan);
			add.addParams("treatPlan",fangan);
			//add.addParams("illSerious",ehua);
			add.addParams("admissionCheck",ryjc);
			add.addParams("admissionCheckId",ryjcId);
			add.addParams("labCheck",sysjc);
			add.addParams("labCheckId",sysjcId);
			add.addParams("imgCheck",yxxjc);
			add.addParams("imgCheckId",yxxjcId);
			add.addParams("otherCheck",other);
			add.addParams("otherCheckId",otherId);
			add.addParams("remark",remark);
			add.addParams("filed1",expertName); 
			add.addParams("id",orderId);
			add.addParams("eopenId",eopenId);
			add.addParams("expertName1",expertName1);
			add.addParams("filed4",place); 
			add.addParams("admissionTime",admissionTime);
			add.ajax(getIP()+"memberOrder.action?add",function(data){
				$("#responsive").modal('hide');
				alert("您的信息已成功受理，请至专家预约记录中查看处理情况!");
				window.location.href=getIP()+"PC/newExpertList.jsp";
		    })
		}

})