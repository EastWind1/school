<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<!DOCTYPE>
<html>
  <head>
	<title>在线预览</title>
	<jsp:include page="common.jsp"></jsp:include>
	<script type="text/javascript" src="common/iscroll.js"></script>
	<style type="text/css">
	li{text-align:center;}
	li img{width:100%}
	</style>
	<script>
		$(function(){
			//var count=parseInt(GetQueryString("count"))+1;
			
			var num=GetQueryString("num");
			var count=num.split("_")[1];
			//num=num.split("_")[0];
			var pdfname=num.split("_")[0];
			var html="";
			for(var i=1;i<count;i++){
				var name="";
				if(i<10){
				name="000"+i;
				}else if(i>100 || i==100){
					name="0"+i;
				}else{
					name="00"+i;
				}
				html+="<li class='table-view-cell'><img  src='data/pdf/"+num+"/"+name+".jpg' /></li>";
			}
			$("ul").html(html);
		})
	</script>
  </head>
  
  <body>
    <div class="content">
    <div id="wrapper">
	<div id="scroller">
		<div class="card nonemagin pdf">
 			<ul class="table-view">
 				
 			</ul> 
 		</div>
 		</div>
 		
 	</div>
 	</div>
 	
  </body>
  <script>
  
  loading();
  function loading(){
  	var opts = {
		lines: 13, // The number of lines to draw
		length: 11, // The length of each line
		width: 5, // The line thickness
		radius: 17, // The radius of the inner circle
		corners: 1, // Corner roundness (0..1)
		rotate: 0, // The rotation offset
		color: '#FFF', // #rgb or #rrggbb
		speed: 1, // Rounds per second
		trail: 60, // Afterglow percentage
		shadow: false, // Whether to render a shadow
		hwaccel: false, // Whether to use hardware acceleration
		className: 'spinner', // The CSS class to assign to the spinner
		zIndex: 2e9, // The z-index (defaults to 2000000000)
		top: 'auto', // Top position relative to parent in px
		left: 'auto' // Left position relative to parent in px
	};
	var target = document.createElement("div");
	document.body.appendChild(target);
	var spinner = new Spinner(opts).spin(target);
	iosOverlay({
		text: "Loading",
		duration: 2e3,
		spinner: spinner
	});
	return false;
  }
  
  var myScroll;
	function loaded() {
		myScroll = new IScroll('wrapper',{checkDOMChanges: true });
	}
	document.addEventListener('DOMContentLoaded', loaded, false);
	
	
  </script>
</html>
