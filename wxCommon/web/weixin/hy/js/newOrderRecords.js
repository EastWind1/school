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
					eidhtml+="<li><span class='odRec_left blue'>专家"+i+"：</span><span class='odRec_right blue'>"+exids[i-1]+"</span></li>";
				}
				var sex="";
		   		if(val.sex==1){
		   			sex="男";
		   		}else{
		   			sex="女";
		   		}
		   		
		   		
				html+="<ul class='odRecord'>"+eidhtml+
				"<li><span class='odRec_nameHeight'>性别：<i style='font-style:normal;'>"+sex+"</i></span><span class='odRec_ageWeight'>年龄：<i style='font-style:normal;'>"+val.age+"</i></span></li>"+
				"<li><span class='odRec_nameHeight'>身高(cm)：<i style='font-style:normal;'>"+val.height+"</i></span><span class='odRec_ageWeight'>体重(kg)：<i style='font-style:normal;'>"+val.weight+"</i></span></li>"+
				"<li><span class='odRec_left'>职业：</span><span class='odRec_right'>"+val.occaption+"</span></li>"+
				"<li><span class='odRec_left'>入院时间：</span><span class='odRec_right'>"+val.createTime+"</span></li>"+
				"<li><span class='odRec_left'>主诉：</span><span class='odRec_right'>"+val.chiefComplaint+"</span></li>"+
				"<li><span class='odRec_left'>现病史：</span><span class='odRec_right'>"+val.illPrenent+"</span></li>"+
				"<li><span class='odRec_left'>既往史：</span><span class='odRec_right'>"+val.illPost+"</span></li>"+
				"<li><span class='odRec_left'>个人史：</span><span class='odRec_right'>"+val.illPersonal+"</span></li>"+
				"<li><span class='odRec_left'>家族史：</span><span class='odRec_right'>"+val.illFamily+"</span></li>"+
				"<li><span class='odRec_left'>药物过敏史：</span><span class='odRec_right'>"+val.allergryHistory+"</span></li>"+
				"<li><span class='odRec_left'>初步诊断：</span><span class='odRec_right'>"+val.preDiagnosis+"</span></li>"+
				"<li><span class='odRec_left'>治疗方案：</span><span class='odRec_right'>"+val.treatPlan+"</span></li>"+
				"<li><span class='odRec_left'>病情恶化：</span><span class='odRec_right'>"+val.illSerious+"</span></li></ul>";
		   		
//				html+="<div class='card listsz'><ul class='table-view' style='margin-left:0px;margin-right:5px;'>"+eidhtml+
//      		  		   "<li class='table-view-cell classIn'>性别："+sex+"</li>"+
//      		  		    "<li class='table-view-cell classIn'>年龄："+val.birthday+"</li>"+
//      		  		     "<li class='table-view-cell classIn'>身高："+val.height+"cm</li>"+
//      		  		      "<li class='table-view-cell classIn'>体重："+val.weight+"kg</li>"+
//      		  		       "<li class='table-view-cell classIn'>职业："+val.occapation+"</li>"+
//      		  		        "<li class='table-view-cell classIn'>入院时间："+val.admissionTime+"</li>"+
//      		  		         "<li class='table-view-cell classIn'>主诉："+val.chiefComplaint+"</li>"+
//      		  		          "<li class='table-view-cell classIn'>现病史："+val.illPrenent+"</li>"+
//      		  		           "<li class='table-view-cell classIn'>既往史："+val.illPost+"</li>"+
//      		  		            "<li class='table-view-cell classIn'>个人史："+val.illPersonal+"</li>"+
//      		  		             "<li class='table-view-cell classIn'>家族史："+val.illFamily+"</li>"+
//      		  		              "<li class='table-view-cell classIn'>药物过敏史："+val.allergryHistory+"</li>"+
//      		  		               "<li class='table-view-cell classIn'>入院查体："+val.admissionCheck+"</li>"+
//      		  		                "<li class='table-view-cell classIn'>实验室检查："+val.labCheck+"</li>"+
//      		  		                 "<li class='table-view-cell classIn'>影像学检查："+val.imgCheck+"</li>"+
//      		  		                  "<li class='table-view-cell classIn'>其它辅助检查："+val.otherCheck+"</li>"+
//      		  		                   "<li class='table-view-cell classIn'>初步诊断："+val.preDiagnosis+"</li>"+
//      		  		                    "<li class='table-view-cell classIn'>治疗方案："+val.treatPlan+"</li>"+
//      		  		                     "<li class='table-view-cell classIn'>病情恶化："+val.illSerious+"</li>"+
//				"<li class='table-view-cell' style='padding-right:5px'><a onclick='orderfj(\""+val.id+"\")'>查看病历</a><a style='float:right;'>"+yueStatus+"</a></li>"+
//				"</ul></div>";
			})
			if(html=="")
			{
				html="暂无数据";
			}
			//alert(html);
			$("#content").html(html);
		})
	} 
});