<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<!DOCTYPE>
<html>
  <head>
	<title>在线预览</title>
	<jsp:include page="common.jsp"></jsp:include>
	<script type="text/javascript" src="common/iscroll.js"></script>
  </head>
  
  <body>
    <div class="content">
    <div id="wrapper">
	<div id="scroller">
		<div class="card nonemagin pdf">
 			<ul class="table-view">
 				<li class="table-view-cell">
						<img src="data/pdf1/1.png" />
					</li>
					<li class="table-view-cell">
						<img src="data/pdf1/2.png" />
					</li>
					<li class="table-view-cell">
						<img src="data/pdf1/3.png" />
					</li>
					<li class="table-view-cell">
						<img src="data/pdf1/4.png" />
					</li>
					<li class="table-view-cell">
						<img src="data/pdf1/5.png" />
					</li>
					<li class="table-view-cell">
						<img src="data/pdf1/6.png" />
					</li>
					<li class="table-view-cell">
						<img src="data/pdf1/7.png" />
					</li>
					<li class="table-view-cell">
						<img src="data/pdf1/8.png" />
					</li>
					<li class="table-view-cell">
						<img src="data/pdf1/9.png" />
					</li>
					<li class="table-view-cell">
						<img src="data/pdf1/10.png" />
					</li>
					<li class="table-view-cell">
						<img src="data/pdf1/11.png" />
					</li>
					<li class="table-view-cell">
						<img src="data/pdf1/12.png" />
					</li>
					<li class="table-view-cell">
						<img src="data/pdf1/13.png" />
					</li>
					<li class="table-view-cell">
						<img src="data/pdf1/14.png" />
					</li>
					<li class="table-view-cell">
						<img src="data/pdf1/15.png" />
					</li>
					<li class="table-view-cell">
						<img src="data/pdf1/16.png" />
					</li>
					<li class="table-view-cell">
						<img src="data/pdf1/17.png" />
					</li>
					<li class="table-view-cell">
						<img src="data/pdf1/18.png" />
					</li>
					<li class="table-view-cell">
						<img src="data/pdf1/19.png" />
					</li><li class="table-view-cell">
						<img src="data/pdf1/20.png" />
					</li>
					<li class="table-view-cell">
						<img src="data/pdf1/21.png" />
					</li>
					<li class="table-view-cell">
						<img src="data/pdf1/22.png" />
					</li>
					<li class="table-view-cell">
						<img src="data/pdf1/23.png" />
					</li>
					<li class="table-view-cell">
						<img src="data/pdf1/24.png" />
					</li>
					<li class="table-view-cell">
						<img src="data/pdf1/25.png" />
					</li>
					<li class="table-view-cell">
						<img src="data/pdf1/26.png" />
					</li>
					<li class="table-view-cell">
						<img src="data/pdf1/27.png" />
					</li>
					<li class="table-view-cell">
						<img src="data/pdf1/28.png" />
					</li>
					<li class="table-view-cell">
						<img src="data/pdf1/29.png" />
					</li>
					<li class="table-view-cell">
						<img src="data/pdf1/30.png" />
					</li>
					<li class="table-view-cell">
						<img src="data/pdf1/31.png" />
					</li>
					<li class="table-view-cell">
						<img src="data/pdf1/32.png" />
					</li>
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
