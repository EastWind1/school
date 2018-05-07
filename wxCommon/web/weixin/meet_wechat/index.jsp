<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<!DOCTYPE>
<html>
  <head>
	<title>会议注册缴费</title>
		<jsp:include page="../common.jsp"></jsp:include>
	   <!--  <meta name="viewport" content="initial-scale=1, maximum-scale=1, user-scalable=no, minimal-ui">
	    <meta name="apple-mobile-web-app-capable" content="yes">
	    <meta name="apple-mobile-web-app-status-bar-style" content="black">
	    <link rel="stylesheet" href="common/css/ratchet.min.css" > 
		<link rel="stylesheet" type="text/css" href="common/css/ratchet-theme-android.min.css"/>
		<link rel="stylesheet" type="text/css" href="common/css/ratchet-theme-ios.min.css"/>-->
		<link rel="stylesheet" type="text/css" href="weixin/css/jf.css"/>
		<link rel="stylesheet" type="text/css" href="weixin/css/weui.min.css"/>
		<script type="text/javascript" src="weixin/js/jweixin-1.0.0.js"> </script>
		<script type="text/javascript" src="weixin/js/weixinjs.js"> </script>
  </head>
  
	<body>
	    <div class="content">
			<div class="jf_head">
				<p>您正在为</p>
				<p id="jf_head_meetName" class="jf_head_meetName"></p>	
		    	<p>进行注册缴费，请选择您的身份</p>
		    	<ul id="jf_head_identityContainer" class="jf_head_identityContainer">
		    		<li class="jf_head_doctor active">
		    			<img src="weixin/images/jf/yisheng_select.png"/>
		    			<span>我是医生</span>
		    			<span id="doctorPrice" class="jf_price"></span>
		    		</li>
		    		<li class="jf_head_doctor">
		    			<img src="weixin/images/jf/hushi_unselect.png"/>
		    			<span>我是护士</span>
		    			<span id="nursePrice" class="jf_price"></span>
		    		</li>
		    		<li class="jf_head_doctor">
		    			<img src="weixin/images/jf/xuesheng_unselect.png"/>
		    			<span>我是学生</span>
		    			<span id="stuPrice" class="jf_price"></span>
		    		</li>
		    	</ul>
		    	<div class="jf_head_promptCards animated">
		    		<p>会议报到时，请务必携带您</p>
		    		<p>本人的<span id="jf_head_identity"></span>证件，进行核对。</p>
		    	</div>
		    	<div class="jf_head_infoConfirm">
		    		<p>注册信息确认</p>
		    		<p class="jf_head_infoTips">请核对注册信息，如有误请返回"我-个人信息"修改。</p>
		    	</div>
			</div>
	    	
		    <div class="card mr0">
		        <ul class="table-view jf_info">
					<li class="table-view-cell media jf_info_basics">
					    <a class="navigate-right">
					      	<span class="media-object pull-left zc_infoIcon zc_infoIcon_name"></span>
					      	<div class="media-body">
					        	<span id="jf_info_name" class="jf_info_name"></span>
					        	<span id="jf_info_identity" class="jf_info_classification"></span>
					      	</div>
					    </a>
					</li>
				  	<li class="table-view-cell media jf_info_basics">
					    <a class="navigate-right">
					      	<span class="media-object pull-left zc_infoIcon zc_infoIcon_hospital"></span>
					      	<div class="media-body">
					        	<span id="jf_info_hospital" class="jf_info_name"></span>
					        	<span id="jf_info_hospitalDepartment" class="jf_info_classification"></span>
					      	</div>
					    </a>
				  	</li>
				  	<li class="table-view-cell media jf_info_basics">
					    <a class="navigate-right">
					    	<span class="media-object pull-left zc_infoIcon zc_infoIcon_phone"></span>
					      	<div id="jf_info_tel" class="media-body"></div>
					    </a>
				  	</li>
				  	<li class="table-view-cell media jf_info_address">
					    <a class="navigate-right">
					    	<span class="media-object pull-left zc_infoIcon zc_infoIcon_address"></span>
					      	<div class="media-body">
					        	学分邮寄地址
					        	<div class="jf_info_selAddress">
					        		<select id="province">
					        			<option value="">请选择省份</option>
					        		</select>
					        		<select id="city">
					        			<option value="">市</option>
					        		</select>
					        	</div>
						        <input id="addressDetails" type="text" placeholder="详细地址">
					      	</div>
					    </a>
				  	</li>
				</ul>
		    </div>
		    
		    <div class="card mr0 jf_invoice">
		    	<p class="jf_invoice_head">
		    		发票信息
		    		<span>凭有效证件，到报到处领取发票</span>
		    	</p>
		    	<form class="input-group">
				  <div class="input-row">
				    <label>发票抬头</label>
				    <input id="jf_invoiceContent" type="text" placeholder="请填写发票抬头">
				  </div>
				</form>
		    </div>
						<div class="card mr0 jf_hotel">
		    	<p class="jf_hotel_head">
		    		您计划入住哪个酒店？
		    		<span>住宿费报到时支付</span>
		    	</p>
		    	<div class="cell">
		    		<div class="bd">
		    			<div class="weui_cells weui_cells_checkbox">
					        <label class="weui_cell weui_check_label" for="s11">
					            <div class="weui_cell_hd">
					                <input type="radio" class="weui_check" name="hotel" id="s11" checked="checked">
					                <i class="weui_icon_checked"></i>
					            </div>
					            <div class="weui_cell_bd weui_cell_primary">
					                <p>万达凯悦（499元/标间）</p>
					            </div>
					        </label>
					        <label class="weui_cell weui_check_label" for="s12">
					            <div class="weui_cell_hd">
					                <input type="radio" class="weui_check" name="hotel" id="s12">
					                <i class="weui_icon_checked"></i>
					            </div>
					            <div class="weui_cell_bd weui_cell_primary">
					                <p>山东丽天（286元/标间）</p>
					            </div>
					        </label>
					        <label class="weui_cell weui_check_label" for="s13">
					            <div class="weui_cell_hd">
					                <input type="radio" class="weui_check" name="hotel" id="s13">
					                <i class="weui_icon_checked"></i>
					            </div>
					            <div class="weui_cell_bd weui_cell_primary">
					                <p>鲁能信宜（268元/标间）</p>
					            </div>
					        </label>
					        <label class="weui_cell weui_check_label" for="s14">
					            <div class="weui_cell_hd">
					                <input type="radio" class="weui_check" name="hotel" id="s14">
					                <i class="weui_icon_checked"></i>
					            </div>
					            <div class="weui_cell_bd weui_cell_primary">
					                <p>如家（160元/标间）</p>
					            </div>
					        </label>
					        <label class="weui_cell weui_check_label" for="s15">
					            <div class="weui_cell_hd">
					                <input type="radio" class="weui_check" name="hotel" id="s15">
					                <i class="weui_icon_checked"></i>
					            </div>
					            <div class="weui_cell_bd weui_cell_primary">
					                <p>不住宿或其他</p>
					            </div>
					        </label>
					    </div>
		    		</div>
		    	</div>
		    </div>
		    <div class="card mr0 weChatPay">
		    	<p class="weChatPay_head">支付方式</p>
		    	<img src="weixin/images/jf/wechatPay.png"/>
		    </div>
			
			<!-- <div class="card jf_btn">
				<button id="jfBtn" class="btn btn-primary btn-block">
			    	<span id="jf_btnPrice" class="jf_btnPrice"></span>
			    	确认缴费
			    </button>
			</div> -->
				<div class="content-padded">
	      		<a class="btn btn-primary btn-block" id="jf_btnPrice">
	      		</a>
	   		 </div> 
	    </div>
	   	<script src="js/city.js"></script>	
	   	<script src="weixin/js/pingpp.js"></script>	
	    <script src="weixin/meet_wechat/js/jf.js" type="text/javascript" charset="utf-8"></script>
	</body>
</html>
