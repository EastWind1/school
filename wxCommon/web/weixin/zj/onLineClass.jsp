<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<!DOCTYPE>
<html>
  <head>
	<title>在线课程</title>
	<jsp:include page="../common.jsp"></jsp:include>
  </head>
  
<body style="overflow-y: scroll" ontouchstart="">
<div class="content cont" id="content">
<div class="card navsz">
<nav class="bar bar-standard navbar">
		  <div class="segmented-control onLineClass_tab">
		    <a name="notjk" state="0" class="control-item active">在线选课</a>
		    <a name="yjk" state="1" class="control-item">录课选课</a>
		  </div>
		</nav>
</div>
<div id="notjk">
<!--<div class="card listsz">
 		<ul class="table-view" style="margin-left:0px;">
	        <li class="table-view-cell">
				<span>个体化血小板策略时代</span>
	        </li>
	        <li class="table-view-cell classIn noBr">
				<small>开课专家:王宏伟</small>
	        </li>
	        <li class="table-view-cell classIn">
				<small>播放次数：50次</small>
				<span class="onLineClass_play">播放</span>
	        </li>
        </ul>
</div> -->
</div> 


<div id="yjk" style="display: none;">
<!--<div class="card listsz">
 		<ul class="table-view" style="margin-left:0px;">
	        <li class="table-view-cell">
				<span>样本化肝病讨论</span>
	        </li>
	        <li class="table-view-cell classIn noBr">
				<small>开课专家:王宏伟</small>
	        </li>
	        <li class="table-view-cell classIn">
				<small>播放次数：50次</small>
				<span class="onLineClass_play">播放</span>
	        </li>
        </ul>
</div> -->


</div> 

    </div>
    <script type="text/javascript">
    $(".onLineClass_tab a").on("click",function(){
		var name=$(this).attr("name");
		var state=$(this).attr("state")
		var classList=$(".navsz").nextAll();
		getData(state);
		$(".onLineClass_tab a").removeClass("active");
		$(this).addClass("active");
		classList.hide();
		classList.eq(""+state+"").show();
		$("#content div[id="+name+"]").show();
	})
	
	
	getData();	
	function getData(){
		var p=$.Params.create();
		p.addParams("publicNo",brandId); 
	    p.ajax(getIP()+"course.action?getCourse",function(data){
	    	var html="";
	    	$.each(data.rows,function(i,val){			  
 			    html+="<div class='card listsz'><ul onclick='getExpert(\""+val.id+"\")' class='table-view' style='margin-left:0px;'>"+
      		  		  "<li class='table-view-cell titleclass'><span>"+val.title+"</span></li>"+
      		  		  "<li class='table-view-cell classIn'><small>开课专家："+val.name+"</small></li>"+
      		  		  "<li class='table-view-cell classIn'><small>报名人数：<font color='#00c53c'>"+val.setNum+"/"+val.signNum+"</font></small></li>"+
     			      "<li class='table-view-cell classIn'><small>开课时间："+val.startDate+"</small>"+
     			      "<span class='onLineClass_play'>选课</span></li></ul></div>"; 	
	    	})
	    	$("#notjk").html(html);
	    })
	}
	
	function getExpert(eid){
		window.location.href="weixin/hy/classOnlineDetails.jsp?eid="+eid;
	}
    </script>
</body>
</html>
