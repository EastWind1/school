<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<!DOCTYPE>
<html>
  <head>
	<title>会员求助</title>
	<jsp:include page="../common.jsp"></jsp:include>
  </head>
  
<body style="overflow-y: scroll" ontouchstart="">
<div class="content cont" id="content">

</div> 

    <script type="text/javascript">
    
  
    
	getData();	
	function getData(){
		var p=$.Params.create();
		p.addParams("filed2",openId); 
	    p.ajax(getIP()+"memberOrder.action?list",function(data){
	    	var html="";
	    	$.each(data.rows,function(i,val){	
	    		var state=val.state;
		   		if(state == "1"){
		   			state="已同意";
		   		}else if(state == "2"){
		   			state="预约成功";
		   		}else if(state == "0"){
		   			state="已拒绝";
		   		}else if(state == "3"){
		   			state="待处理";
		   		}else{
		   			state="已关闭";
		   		}
		   		var sex="";
		   		if(val.sex==1){
		   			sex="男";
		   		}else{
		   			sex="女";
		   		}
 			    html+="<div class='card listsz'><ul class='table-view' style='margin-left:0px;padding-top:5px;'>"+
      		  		 // "<li class='table-view-cell titleclass'><span>"+val.name+" "+sex+"</span></li>"+
      		  		  //"<li class='table-view-cell classIn noBr'><small>年龄："+showAge(val.birthday)+"</small></li>"+
      		  		  "<li class='table-view-cell classIn'>医师："+val.memberName+"<a style='float:right'>"+state+"</a></li>"+
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
     			      "<li class='table-view-cell classIn'>预约时间："+val.createTime+"</li>"+
     			      "<li class='table-view-cell classIn'><a onclick='orderfj(\""+val.id+"\")'>查看病历</a><a  href='tel:"+kftel+"' class='zjiconimg'><img src='weixin/images/bh.png' /></a></li>"+
     			      "<li class='table-view-cell footbar'><p style='width:50%' onclick='isagree(\""+val.id+"\",1)'>同意</p><p style='width:50%' onclick='isagree(\""+val.id+"\",0)'>拒绝</p></li>"+
     			      "</ul></div>"; 	
	    	})
	    	$("#content").html(html);
	    })
	}
	
	function getExpert(eid){
		window.location.href="weixin/hy/classOnlineDetails.jsp?eid="+eid;
	}
	function showAge(str){
		var age;
		 var r=str.match(/^(\d{1,4})(-|\/)(\d{1,2})\2(\d{1,2})$/);     
	     if(r==null)return false;     
	     var d=new Date(r[1], r[3]-1, r[4]);     
	     if(d.getFullYear()==r[1]&&(d.getMonth()+1)==r[3]&&d.getDate()==r[4]){   
	           var Y = new Date().getFullYear();   
	           age=(Y-r[1]);
	           return age+"å²";
	     }   
	     return "è¾å¥çæ¥ææ ¼å¼éè¯¯ï¼";   
	}

function orderfj(oid){
	window.location.href="weixin/hy/memberOrderfjzj.jsp?orderId="+oid;
}
function isagree(oid,isagree){
	var agree;
		if(isagree == 1){
			agree="同意";
		}else{
			agree="拒绝";
		}
		if(confirm("确定要"+agree+"吗？")){
			var agree=$.Params.create();
			agree.addParams("id",oid); 
			agree.addParams("state",isagree); 
		    agree.ajax(getIP()+"memberOrder.action?updateAgree",function(data){
		    	alert(data.msg);
		    	getData();	
		    })
	    }
}
	
	
    </script>
</body>
</html>
