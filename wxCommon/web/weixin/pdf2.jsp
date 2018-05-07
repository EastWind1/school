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
						<img src="data/pdf2/1.jpg" />
					</li>
					<li class="table-view-cell">
						<img src="data/pdf2/2.jpg" />
					</li>
					<li class="table-view-cell">
						<img src="data/pdf2/3.jpg" />
					</li>
					<li class="table-view-cell">
						<img src="data/pdf2/4.jpg" />
					</li>
					<li class="table-view-cell">
						<img src="data/pdf2/5.jpg" />
					</li>
					<li class="table-view-cell">
						<img src="data/pdf2/6.jpg" />
					</li>
					<li class="table-view-cell">
						<img src="data/pdf2/7.jpg" />
					</li>
					<li class="table-view-cell">
						<img src="data/pdf2/8.jpg" />
					</li>
					<li class="table-view-cell">
						<img src="data/pdf2/9.jpg" />
					</li>
					<li class="table-view-cell">
						<img src="data/pdf2/10.jpg" />
					</li>
					<li class="table-view-cell">
						<img src="data/pdf2/11.jpg" />
					</li>
					<li class="table-view-cell">
						<img src="data/pdf2/12.jpg" />
					</li>
					<li class="table-view-cell">
						<img src="data/pdf2/13.jpg" />
					</li>
					<li class="table-view-cell">
						<img src="data/pdf2/14.jpg" />
					</li>
					<li class="table-view-cell">
						<img src="data/pdf2/15.jpg" />
					</li>
					<li class="table-view-cell">
						<img src="data/pdf2/16.jpg" />
					</li>
					<li class="table-view-cell">
						<img src="data/pdf2/17.jpg" />
					</li>
					<li class="table-view-cell">
						<img src="data/pdf2/18.jpg" />
					</li>
					<li class="table-view-cell">
						<img src="data/pdf2/19.jpg" />
					</li><li class="table-view-cell">
						<img src="data/pdf2/20.jpg" />
					</li>
					<li class="table-view-cell">
						<img src="data/pdf2/21.jpg" />
					</li>
					<li class="table-view-cell">
						<img src="data/pdf2/22.jpg" />
					</li>
					<li class="table-view-cell">
						<img src="data/pdf2/23.jpg" />
					</li>
					<li class="table-view-cell">
						<img src="data/pdf2/24.jpg" />
					</li>
					<li class="table-view-cell">
						<img src="data/pdf2/25.jpg" />
					</li>
					<li class="table-view-cell">
						<img src="data/pdf2/26.jpg" />
					</li>
					<li class="table-view-cell">
						<img src="data/pdf2/27.jpg" />
					</li>
					<li class="table-view-cell">
						<img src="data/pdf2/28.jpg" />
					</li>
					<li class="table-view-cell">
						<img src="data/pdf2/29.jpg" />
					</li>
					<li class="table-view-cell">
						<img src="data/pdf2/30.jpg" />
					</li>
					<li class="table-view-cell">
						<img src="data/pdf2/31.jpg" />
					</li>
					<li class="table-view-cell">
						<img src="data/pdf2/32.jpg" />
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
