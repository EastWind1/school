$(function(){
 getData();
	function getData(){
		var sel=$.Params.create();
		sel.addParams("memberOpenId",memberId); 
		console.log(memberId);
		sel.ajax(getIP()+"memberOrder.action?list",function(data){
			var html="";
			$.each(data.rows,function(i,val){	
				var eids=val.filed1;
				var exids=eids.split(",");
				var eidhtml="";
				for(var i=1;i<exids.length+1;i++){
					//alert(exids[i]);
					eidhtml+="<li class='table-view-cell titleclass'><span>专家"+i+"："+exids[i-1]+"</span></li>";
				}
				var yueStatus="处理中";
				switch(val.state){
					case 2:
						yueStatus="预约成功";
						break;
					case 4:
						yueStatus="已关闭";
						break;
					default:
						yueStatus="处理中";
						break;
				}	
				var sex="";
		   		if(val.sex==1){
		   			sex="男";
		   		}else{
		   			sex="女";
		   		}
				html+="<div class='card listsz'><ul class='table-view' style='margin-left:0px;margin-right:5px;'>"+eidhtml+
      		  		   "<li class='table-view-cell classIn'>性别："+sex+"</li>"+
      		  		    "<li class='table-view-cell classIn'>年龄："+val.birthday+"</li>"+
      		  		     "<li class='table-view-cell classIn'>身高："+val.height+"cm</li>"+
      		  		      "<li class='table-view-cell classIn'>体重："+val.weight+"kg</li>"+
      		  		       "<li class='table-view-cell classIn'>职业："+val.occapation+"</li>"+
      		  		        "<li class='table-view-cell classIn'>入院时间："+val.admissionTime+"</li>"+
      		  		         "<li class='table-view-cell classIn'>主诉："+val.chiefComplaint+"</li>"+
      		  		          "<li class='table-view-cell classIn'>现病史："+val.illPrenent+"</li>"+
      		  		           "<li class='table-view-cell classIn'>既往史："+val.illPost+"</li>"+
      		  		            "<li class='table-view-cell classIn'>个人史："+val.illPersonal+"</li>"+
      		  		             "<li class='table-view-cell classIn'>家族史："+val.illFamily+"</li>"+
      		  		              "<li class='table-view-cell classIn'>药物过敏史："+val.allergryHistory+"</li>"+
      		  		               "<li class='table-view-cell classIn'>入院查体："+val.admissionCheck+"</li>"+
      		  		                "<li class='table-view-cell classIn'>实验室检查："+val.labCheck+"</li>"+
      		  		                 "<li class='table-view-cell classIn'>影像学检查："+val.imgCheck+"</li>"+
      		  		                  "<li class='table-view-cell classIn'>其它辅助检查："+val.otherCheck+"</li>"+
      		  		                   "<li class='table-view-cell classIn'>初步诊断："+val.preDiagnosis+"</li>"+
      		  		                    "<li class='table-view-cell classIn'>治疗方案："+val.treatPlan+"</li>"+
      		  		                     "<li class='table-view-cell classIn'>病情恶化："+val.illSerious+"</li>"+
				"<li class='table-view-cell' style='padding-right:5px'><a onclick='orderfj(\""+val.id+"\")'>查看病历</a><a style='float:right;'>"+yueStatus+"</a></li>"+
				//"<li class='table-view-cell liimg' id='uploadimg'>"+
				//"<img onclick='chooseImage(\""+val.id+"\")' src='weixin/images/upload.png' /></li>"+
				"</ul></div>";
			})
			if(html=="")
			{
				html="暂无数据";
			}
			//alert(html);
			$("#videoClass_list").html(html);
		})
	} 
});
     

function orderfj(oid){
	window.location.href="weixin/hy/memberOrderfj.jsp?orderId="+oid;
}
	

	
