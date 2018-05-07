<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@include file="../common/head.jsp" %>
<html>
<head>
    <title>查询订单</title>
    <script type="text/javascript">
   	 	function initlist(name,kind){
   	 		var ajaxurl="server.action?getOrder";  
   	 		if(name!=null && name!="")
   	 			ajaxurl+=("&name="+name);
   	 		if(kind!=null && kind!="")
   	 			ajaxurl+=("&kind="+kind);
   	 		$.ajax({
   	 			url:ajaxurl,
   	 			data:{},
   	 			type: "get",
   	 			dataType: "JSON",
   	 			success: function(data){
   	 				var orderlist="";
   	 				$.each(data.rows, function(i, elt) {
   	 					orderlist+='<div class="mer-shop clearfix">'
                            +'<div class="mer-shop-img fl">'
                                +'<a><img src="'+returnimg(elt.kind)+'" alt=""></a>'
                            +'</div>'
                           +'<div class="mer-shop-js fl">'
                                +'<h3><p>'+elt.name+'</p></h3>'
                                +'<div class="mer-shop-area"><i class="img-logo"><img src="wxpage/images//mer_logo_area.png" alt=""></i>'
                                    +'<p>'+elt.userName+'</p>'
                                +'</div>'
                                +'<div class="mer-shop-logo"><i class="img-logo"><img src="wxpage/images//mer_logo_te.png" alt=""></i>'
                                   +'<p>'+elt.kind+'</p>'
                                +'</div>'
                                +'<div class="mer-shop-logo"><i class="img-logo"><img src="wxpage/images//mer_logo_fan.png" alt=""></i>'
                                    +'<p>'+elt.description+'</p>'
                                +'</div>'
                            +'</div>'
                            +'<div class="mer-shop-phone clearfix fr">'
                                +'<div class="mer-shop-tel">'
                                   +'<font size="5" face="arial" color="red">￥</font><font size="5" face="arial" color="red">'+elt.price+'</font>'
                                   
                                +'</div>'
                            +'</div>'
                             +'<div class="mer-shop-pj">'
	                            +'<a name="receive_'+elt.id+'"  class="btn btn-hollow default">下单</a>'
                            +'</div>'
                    	 +'</div>';
   	 				});
   	 				$("#orderlist").html(orderlist);
   	 			}
   	 		});
   	 	}
   	 	$(function(){
   	 		initlist(null,null);
   	 		$('#search').bind('keypress',function(event){ 
        		 initlist($(this).val(),null);
     		});
     		$('.grids-item').bind('click',function(event){ 
        		initlist(null,$(this).attr("value"));
     		});
     		$("#orderlist").on("click",".btn",function(){
     			var	name=$(this).attr("name");
				var orderid=name.substring(name.indexOf('_')+1, name.length);
				if(confirm("确认接收吗？")){
					$.ajax({
						url:"server.action?receive",
				   	 	data:{"id":orderid},
				   	 	type: "get",
				   	 	dataType: "JSON",
				   	 	success: function(data){
				   	 		alert(data.msg);
				   	 	}
					});
				}
     		});
   	 	});
   	 	</script>
</head>

<body>
    <div class="g-flexview">
        <header class="m-navbar my-header">
            <a href="javascript:history.go(-1);" class="navbar-item default">
                 <i class="back-ico"></i>
            </a>
            <div class="navbar-center input-center flex-align-start flex">
                <div class="index-input flex-1">
                    <div class="icon-search"></div>
                    <div class="index-right">
                        <input type="text" placeholder="输入搜索订单信息" autocomplete="off">
                    </div>
                </div>
            </div>
            
        </header>
        <!-- mer-main -->
        <div class="index-main g-scrollview">
            <!-- m-slider -->
            <div class="m-slider index-swiper clearfix">
                <div class="slider-wrapper">
                    <div class="slider-item">
                        <a>
                            <img src="wxpage/images/index_ad.jpg">
                        </a>
                    </div>
                    <div class="slider-item">
                        <a>
                              <img src="wxpage/images/index_ad.jpg">
                        </a>
                    </div>
                    <div class="slider-item">
                        <a>
                             <img src="wxpage/images/index_ad.jpg">
                        </a>
                    </div>
                </div>
                <div class="slider-pagination"></div>
                <!-- 分页标识 -->
            </div>
            <!-- m-slider -->
            <!-- m-slider -->
            <div class="m-slider menu-swiper clearfix" style="height:180px">
	                <div class="slider-wrapper">
	                    <div class="slider-item">
	                        <div class="m-grids-5">
	                            <a value="1" class="grids-item">
	                                <div class="grids-icon"><img src="wxpage/images//wangzhan.png"></div>
	                                <div class="grids-txt"><span>网站建设</span></div>
	                            </a>
	                            <a value="2" class="grids-item">
	                                <div class="grids-icon"><img src="wxpage/images//APP.png"></div>
	                                <div class="grids-txt"><span>app开发</span></div>
	                            </a>
	                            <a value="3" class="grids-item">
	                                <div class="grids-icon"><img src="wxpage/images//weixin.png"></div>
	                                <div class="grids-txt"><span>微信开发</span></div>
	                            </a>
	                            <a value="4" class="grids-item">
	                                <div class="grids-icon"><img src="wxpage/images//desktop.png"></div>
	                                <div class="grids-txt"><span>桌面软件</span></div>
	                            </a>
	                            <a value="5" class="grids-item">
	                                <div class="grids-icon"><img src="wxpage/images//UI.png"></div>
	                                <div class="grids-txt"><span>UI设计</span></div>
	                            </a>
	                            <a value="6" class="grids-item">
	                                <div class="grids-icon"><img src="wxpage/images//jiejue.png"></div>
	                                <div class="grids-txt"><span>解决方案</span></div>
	                            </a>
	                            <a value="7" class="grids-item">
	                               <div class="grids-icon"><img src="wxpage/images//shuju.png"></div>
	                                <div class="grids-txt"><span>数据服务</span></div>
	                            </a>
	                            <a value="8" class="grids-item">
	                                <div class="grids-icon"><img src="wxpage/images//safe.png"></div>
	                                <div class="grids-txt"><span>安全服务</span></div>
	                            </a>
	                            <a value="9" class="grids-item">
	                                <div class="grids-icon"><img src="wxpage/images//test.png"></div>
	                                <div class="grids-txt"><span>测试服务</span></div>
	                            </a>
	                            <a value="10" class="grids-item">
	                                <div class="grids-icon"><img src="wxpage/images//H5.png"></div>
	                                <div class="grids-txt"><span>HTML5</span></div>
	                            </a>
	                        </div>
	                    </div>
	                    <div class="slider-item">
	                        <div class="m-grids-5">
	                            <a value="11" class="grids-item">
	                                <div class="grids-icon"><img src="wxpage/images//yuming.png"></div>
	                                <div class="grids-txt"><span>域名服务</span></div>
	                            </a>
	                            <a value="12" class="grids-item">
	                                <div class="grids-icon"><img src="wxpage/images//yun.png"></div>
	                                <div class="grids-txt"><span>云服务</span></div>
	                            </a>
	                            <a value="13" class="grids-item">
	                                <div class="grids-icon"><img src="wxpage/images//people.png"></div>
	                                <div class="grids-txt"><span>人力外派</span></div>
	                            </a>
	                            
	                        </div>
	                    </div>
	                </div>
	                <div class="slider-pagination"></div>
	                <!-- 分页标识 -->
	            </div>
            <div class="index-near clearfix">
                <div class="m-cell">
                    <a class="cell-item" href="javascript:;">
                        <div class="cell-left"><i class="img_hot"><img src="wxpage/images/mer_logo_area.png" alt=""></i>需求订单</div>
                        
                    </a>
                    <div id="orderlist" class="index-near-cont clearfix">
	                </div>
                </div>
            </div>
        </div>
    </div>
    <script>
    $('.index-swiper').slider({
        speed: 200,
        autoplay: 2000,
        lazyLoad: true
    });

    $('.menu-swiper').slider({
        speed: 200,
        autoplay: 30000,
        lazyLoad: true
    });
    </script>
</body>
</html>
