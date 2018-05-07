$(function(){
	var priceNum;
	var hotelName;
	//$("#jf_btnPrice").html(priceNum+"确认缴费");
	//获取省、市
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
		var city="<option selected='selected' value=''>请选择城市</option>";
		for(var y=1;y<china[provinceId].length;y++){
	 		city+="<option value="+china[provinceId][y]+">"+china[provinceId][y]+"</option>";
	 	}
		$("#city").html(city);
	})
	
   //读取会议和价格信息
    var selMeetInfo = $.Params.create();
    selMeetInfo.addParams("type",1);
    selMeetInfo.ajax(getIP()+"conferencepayment.action?list",function(data){
		if(data.success){
			var val = data.rows[0];
	    	$("#jf_head_meetName").html(val.title);
	       	$("#doctorPrice").html("¥"+val.doctorPay);
	       	$("#nursePrice").html("¥"+val.nursePay);
	       	$("#stuPrice").html("¥"+val.studentPay);
	       	priceNum=val.doctorPay;
	       	$("#jf_btnPrice").html("¥"+val.doctorPay+"确认缴费");
		}
    })
	//读取个人信息

    var selPersonInfo = $.Params.create();
    selPersonInfo.addParams("id",memberId);
    selPersonInfo.ajax(getIP()+"member.action?list",function(data){
    	if(data.success){
			var val = data.rows[0];
			$("#jf_info_name").html(val.name);
	       	$("#jf_info_identity").html(val.jobTitle+" "+val.education);
	       	$("#jf_info_hospital").html(val.hospitalName);
	       	$("#jf_info_hospitalDepartment").html(val.hospitalOffices);
	       	$("#jf_info_tel").html(val.tel);
	    }
    })

    //获取酒店
	$("input[name=hotel]").on("click",function(){
		hotelName = $(this).parent().find(" +div p").html();
	})

	//缴费
	$("#jf_btnPrice").on("click",function(){
		

		var invoice = $("#jf_invoiceContent").val();
		var address = $("#province  option:selected").text()+$("#city").val()+$("#addressDetails").val();
		var province=$("#province  option:selected").text();
		var city=$("#city").val();
		var addre=$("#addressDetails").val();
		var isok=true;
		if(province == "请选择省份"){
			alert("请选择省份！");
			isok=false;
			return false;
		}
		if(city == ""){
			alert("请选择城市！");
			isok=false;
			return false;
		}
		if(addre == ""){
			alert("请输入详细地址！");
			isok=false;
			return false;
		}
		if(invoice == ""){
			alert("请输入发票抬头！");
			isok=false;
			return false;
		}
		
		if(isok){
			var channel="wx_pub";
			var amount =priceNum.replace("¥","") * 100;
	        var url=getIP()+"conferencepayrecord.action?payMeet&memberId="+memberId+"&openId="+openId+"&pay="+amount+"&name="+memberName;
	        var xhr = new XMLHttpRequest();
	       //alert(url);return false;
	        xhr.open("POST",url, true);
	        xhr.setRequestHeader("Content-type", "application/json");
	        xhr.send(JSON.stringify({
	            channel: channel,
	            amount: amount
	        }));

	        xhr.onreadystatechange = function () {
	        //	alert(xhr.responseText);
	            if (xhr.readyState == 4 && xhr.status == 200) {
	            	var chargeTex =xhr.responseText;
	                pingpp.createPayment(xhr.responseText, function(result, err) {
	                	// alert(result);
	                	if(result != "cancel"){
	                		var chargeTex =JSON.parse(xhr.responseText);
	                		//alert(chargeTex.charge.orderId);
	                		var addPrice = $.Params.create();
	                	    addPrice.addParams("memberId",memberId);
	                	    addPrice.addParams("openId",openId);
	                	    addPrice.addParams("roleName",roleName);
	                	    addPrice.addParams("pay",priceNum);
	                	    addPrice.addParams("invoice",invoice);
	                	    addPrice.addParams("address",address);
	                	    addPrice.addParams("filed1",chargeTex.order);
	                	    addPrice.addParams("filed2",hotelName);
	                	    addPrice.ajax(getIP()+"conferencepayrecord.action?add",function(data){
	                	    	if(data.success){
	                				//alert("添加成功");	
	                				wx.closeWindow();
	                		    }
	                	    })
	                		
	                	}
	                   // alert(result);
	                    //alert(err.msg);
	                    //alert(err.extra);
	                });
	            }
	        }
		}
		
		/*var invoice = $("#jf_invoiceContent").val();
		var address = $("#province  option:selected").text()+$("#city").val()+$("#addressDetails").val();
	   	
		var addPrice = $.Params.create();
	    addPrice.addParams("memberId",memberId);
	    addPrice.addParams("openId",openId);
	    addPrice.addParams("roleName",roleName);
	    addPrice.addParams("pay",priceNum);
	    addPrice.addParams("invoice",invoice);
	    addPrice.addParams("address",address);
	    addPrice.ajax(getIP()+"conferencepayrecord.action?add",function(data){
	    	if(data.success){
				alert("添加成功");	   
		    }
	    })*/
	})
	
	
	var roleName = "医生";
	var $identitySelImgs = [
		"yisheng_select.png",
		"hushi_select.png",
		"xuesheng_select.png"
	];
	
	var $identityUnselImgs = [
		"yisheng_unselect.png",
		"hushi_unselect.png",
		"xuesheng_unselect.png"
	];
	
	//切换类型
	$("#jf_head_identityContainer li").on("click",function(){
		var $this = $(this);
		var $lis = $("#jf_head_identityContainer li img");  				//三个类型的头像
		var $Index = $(this).index();										//当前头像的索引
		var $price = $this.find(".jf_price").html();						//获取价格
		switch($Index){
			case 0:
				$(".jf_head_promptCards").fadeOut("fast");					//点击第一个，隐藏携带证件提示
				roleName = "医生";
				priceNum = $("#doctorPrice").html();
				break;
			case 1:
				$(".jf_head_promptCards").fadeIn();							//点击第二个，显示携带护士证件提示
				$("#jf_head_identity").html("护士");
				roleName = "护士";
				priceNum = $("#nursePrice").html();
				break;
			case 2:
				$(".jf_head_promptCards").fadeIn();							//点击第三个，隐藏携带学生证证件提示
				$("#jf_head_identity").html("学生");
				roleName = "学生";
				priceNum = $("#stuPrice").html();
				break;
		}
		
		for(var i = 0;i < $lis.length; i ++){  								//将三个头像类型显示为各自未选中的图片
			$($lis[i]).attr("src","weixin/images/jf/"+$identityUnselImgs[i]);
			$($lis[i]).parent().removeClass("active");
		}
		
		$this.find("img").attr("src","weixin/images/jf/"+$identitySelImgs[$Index]+"");	//当前头像设置为选中的头像
		$this.addClass("active");	
		$("#jf_btnPrice").html("");
		$("#jf_btnPrice").html(priceNum+"确认支付");										//显示选中类型的价格
	})
})