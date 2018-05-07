<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<!DOCTYPE>
<html>
  <head>
	<title>在线预览</title>    
	<meta name="viewport" content="width=device-width,user-scalable=yes" />
	<jsp:include page="common.jsp"></jsp:include>
	<link href="weixin/css/owl.carousel.min.css" rel="stylesheet">
	<link href="weixin/css/owl.theme.default.css" rel="stylesheet">
	<style>
		li{text-align:center;}
		li img{width:70%}
	
		html,body{height: 100%;}
		.owl-carousel{ height: 100%;}
		.owl-item{
			/*height: 15rem;*/
		    background: transparent;
		    padding: 0;
		}
		.owl-item img{
			max-width: 100%;
			/*margin-top: 50%;*/
			height:50%;
		}
		.owl-controls{display: none !important;}
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
				}else{
					name="00"+i;
				}

				html+="<div class='item'><img src='data/pdf/"+num+"/"+name+".jpg' /></div>";

			}
		$("#pdfTabSlide").html(html);
		})
	</script>
  </head>
  
  <body>
    <div class="content">
	    <div id="wrapper">
			<div id="scroller">
				<div class="card nonemagin pdf">
		 			<div class="owl-carousel" id="pdfTabSlide">
						  
			  		</div> 
		 		</div>
		 	</div>
	 	</div>
 	</div>
 	
  	</body>
	<script type="text/javascript" src="common/iscroll.js"></script>
  	<script src="weixin/js/owl.carousel.min.js" type="text/javascript"></script>
	<script type="text/javascript">
	$('.owl-carousel').owlCarousel({
	      loop:true,
	      margin:10,
	      responsive:{
	          0:{
	              items:1
	          },
	          600:{
	              items:1
	          },
	          1000:{
	              items:1
	          }
	      }
	  })
	
	  
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
