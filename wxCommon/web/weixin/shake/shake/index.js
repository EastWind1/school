$(function(){
	//��ȡ��Ϸʱ��ͱ���ͼ
	$.ajax(getIP()+"gameShake.action?list&brandId=1&timestamp="+new Date().valueOf()).done(function(data){		   
		 var gameTime=data.rows[0].gameTime;
		 var path = "data/game/";
		 var background_image = path + data.rows[0].backgroundImage;
		 $(".time").innerHTML = gameTime;
		 alert(gameTime);
	}).fail(function(){ alert("��������111")
		
	});		
	
	
	var stopInterval;
	stopInterval=self.setInterval(function(){
		$.ajax(getIP()+"customer.action?getGameCustomer&brandId=1&timestamp="+new Date().valueOf())
	.done(function(data){
		var html="";
		$.each(data,function(i,val){
			 var customerImg=val.customerImage;
            if(val.customerImage == "" || val.customerImage == null){
            	customerImg="images/default.jpg";
            }
			$(".gamecontent .ui-grid-c:eq("+i+") .ui-block-a img").attr("src",customerImg);
			$(".gamecontent .ui-grid-c:eq("+i+") .ui-block-b input").val(data[i].filed).slider("refresh");  ;
			$(".gamecontent .ui-grid-c:eq("+i+") .ui-block-c").html(data[i].filed);
		});
	})
	.fail(function(){ alert("��������222"); });	
	},200);
		
	$("#hide").hide();
	$(".time").hide();
	$("#end").hide();
	$(".startPage").click(function(i){
		//��ʼ����ʱ
		var i=3;
		var j =3;
		var startInterval;
		var interval;
		var endInterval;
		startInterval=setInterval(function(){
			i--;
			$("#second").html(i);
			if(i==0){
				$("#hide").show();
				$(".startPage").hide();
				$(".time").show();
			$.ajax(getIP()+"customer.action?updateGame&brandId=1&timestamp="+new Date().valueOf()).done(function(data){
																															 																											
		  }).fail(function(){ alert("��������333")
});		
			
				clearTimeout(startInterval)
				//��Ϸ����ʱ
			 interval= setInterval(function(){ 		
			 var t = $(".time").html();
			 $(".time").html(t-1);
				   if(Number(t)==4){
			  	clearTimeout(interval);
				$(".startPage").show();
				$(".startPage #end1").hide();
				$("#hide").hide();
				$("#end").show();
				
				endInterval=setInterval(function(){
					 var t = $(".time").html();
					 $(".time").html(t-1);
					 $("#second1").html(t-1);
					 if(parseInt(t) ==1){
						 clearTimeout(endInterval);
						 clearTimeout(stopInterval);
			   	    $("#hide").show();
					$(".startPage").hide();
					$(".time").show();
						 }
					},1000); 
			  }
		},1000); 
	}
},1000);
		
		
		
		
	});
});
