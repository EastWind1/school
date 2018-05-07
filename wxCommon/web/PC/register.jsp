<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0, minimum-scale=1.0, maximum-scale=1.0">
	<title>云  ICU</title>
	<jsp:include page="media.jsp"></jsp:include>
		<style type="text/css">
		.nav li a {
    font-family: "Helvetica Neue",Helvetica,"Hiragino Sans GB","Microsoft YaHei","微软雅黑",Arial,sans-serif !important" ;
color:red;
}
			/*导航*/
.nav li{ 
	margin-right: 20px !important;
}
.nav li a{
	font-size: 18px;
	padding: 6px 20px !important;
	color: #434343 !important;
	background-color: transparent !important;
	-webkit-box-shadow: none !important;
	box-shadow: none !important;
}
		/*注册_start*/
.agree_tk .reg_now {
  height: 30px;
  display: block;
  background-color: #C3C3C3;
  color: #A09B9B;
  border-radius: 5px;
  line-height: 30px;
  text-align: center;
  font-size: 1.3rem;
  margin: 10px;
}
.agree_tk .reg_now.active {
  height: 30px;
  display: block;
  background-color: #FFA861;
  color: #fff;
  text-decoration: none;
  cursor: pointer;
  margin: 10px;
}
/*注册_end*/
		/*登录_start*/
.loginBanner,
.regBanner,
.userBanner{
	height: 110px;
	line-height: 110px;
	font-size: 32px;
	color: #fff;
	background-color: #1091CF;
}


.reg td input{ line-height: 35px !important;} /*修改输入框内容不居中*/

.lg_title,
.reg_title{
	height: 26px !important;
	line-height: 26px;
	font-size: 18px;
	padding-left: 6%;
	color: #777;
	font-family: '微软雅黑';
	background: url(../image/yue_titleBg.png) top left no-repeat;
}

.index_contentLeft{
	width: 24%;
}
.index_login{
	height: 43%;
	margin-bottom: 20px;
	border-radius: 8px;
	background-color: #1497D6;
}
.logContainer{ padding: 0 8%;}
.index_login input[type='text'],
.index_login input[type='password']{
	width: 100%;
	margin: 10px 0 !important;
	padding: 4px 0 !important;
}
.index_login a:not([class='index_logBtn']){
	font-size: 14px;
	color: #fff;
}
.index_logBtn{
	padding: 8px 14px;
	margin-right: 4px;
	display: inline-block;
	text-align: center;
	font-size: 17px;
	color: #fff;
	background-color: #FFA861;
	border: none;
	border-radius: 5px;
}
.index_logBtn:hover{ text-decoration: none; color: #fff; }
.user_log{
	height: 120px;
	position: relative;
}
.user_logImg{
	width: 30%;
 	height: 100%;
	float: left;
	margin: 2% 2%;
}
.user_logImg img{
	width: 100px;
	height: 100px;
	border-radius:50%;
}
.user_logInfo{
	width: 65%;
	height: 100%;
	float: right;
}
.user_logDetails{ 
	min-height: 120px;
  	border-radius: 8px;
  	margin-top: 2%;
}
/*登录_end*/
/*底部_start*/
.copyRight{
	height: 170px;
	line-height: 170px;
	text-align: center;
	color: #fff;
	background-color: #1091CF;
}
/*底部_end*/
.reg_zhicheng{
	position:absolute; 
	top:40px; 
	left:0; 
	width: 49.5%;
	background: orange;
	border:1px solid #ccc; 
	display:none;
	overflow-y:auto;
}
.reg_zhicheng li{ padding:5px; font-size:13px;}
.reg_zhicheng li:hover{
	background-color:#fff;
	color:orange;
}
::-webkit-input-placeholder { /* WebKit browsers */ 
color: #999; 
} 
:-moz-placeholder { /* Mozilla Firefox 4 to 18 */ 
color: #999; 
} 
::-moz-placeholder { /* Mozilla Firefox 19+ */ 
color: #999; 
} 
:-ms-input-placeholder { /* Internet Explorer 10+ */ 
color: #999; 
} 
	</style>
	<link rel="stylesheet" type="text/css" href="PC/css/weixin1.css"/>
	<link rel="stylesheet" type="text/css" href="PC/css/ratchet.min.css"/>
	<link rel="stylesheet" type="text/css" href="PC/css/common1.css"/>

	<script src="PC/js/datepicker/WdatePicker.js" type="text/javascript" charset="utf-8"></script>
	<script src="js/city.js" type="text/javascript" charset="utf-8"></script>
 	<!-- <script type="text/javascript" charset="utf-8">		
			function f1(){
				alert("abc");
			$("birthday").WdatePicker();

			}
	</script>   -->
</head>
<body class="page-header-fixed page-full-width">

	<!-- 顶部导航 begin-->
	<jsp:include page="head.jsp"></jsp:include>
	<!-- 顶部导航 end -->
 	<!-- 内容主体  begin-->
	<div class="page-container row-fluid">
		<div class="page-content no-min-height">
			<div class="container-fluid promo-page">
				<div class="row-fluid">
					<div class="span12">
						<div class="regBanner">
  							<div class="container">
  								会员注册
  							</div>
  						</div>
						<!--导航下内容部分  begin-->
						<form class="form-horizontal">
						<div class="content_one">
							<div class="container conTen">
								<div class="row-fluid containBox">
									<div class="card cardmagin">
										<table class="reg">
											<tr>
			  									<td colspan="2">
			  										<div class="span12 reg_title">完善信息
			  										<!-- <span style="color:#f00;font-size: 12px;"> * 如果已经通过微信注册，可直接登录，默认密码为111111</span> -->
			  										</div>
			  									</td>
											</tr>
											<tr>
												<td class="tdkey">姓名：</td>
												<td class="tdval"><input type="text" id="name" name="name" placeholder="请输入姓名" required></td>
											</tr>
											<tr>
												<td class="tdkey">地区：</td>
												<td class="tdval">
													<select id="province" style="width: 25%;border:1px solid #ddd;"></select>
													<select id="city" style="width: 25%;border:1px solid #ddd;"></select>
												</td>
											</tr>
											<tr>
												<td class="tdkey">所在医院：</td>
												<td class="tdval">
													<select id="hospital_name" class="m-wrap span1" style="width: 50%;border:1px solid #ddd;" size="6"></select>
													<input id="searchHos" style="position:absolute;width:200px;right:41px;margin-top:86px;background-color:rgba(255, 255, 255, 0);box-shadow:none;" type="text" placeholder="请输入医院关键字查询" />
													<!-- <select id="hospital_name" class="m-wrap span1" style="width: 50%;border:1px solid #ddd;"></select>
													<input id="searchHos" style="" type="text" placeholder="请输入医院关键字查询" />
													<div><p>北京医院</p><p>北京医院</p></div> -->
												</td>
											</tr>
											<tr>
												<td class="tdkey">所在科室：</td>
												<td class="tdval">
													<select id="hospital_offices" style="width: 50%;border:1px solid #ddd;">
														<option>请选择科室</option>
														<option>ICU</option>
														<option>PICU</option>
														<option>急诊科</option>
														<option>急诊ICU</option>
														<option>呼吸科</option>
														<option>麻醉科</option>
														<option>儿科</option>
														<option>产科</option>
														<option>外科</option>
														<option id="officeOther">其他</option>
													</select>
													<input id="searchOffice" style="position:absolute;width:200px;right:41px;margin-top:6px;background-color:rgba(255, 255, 255, 0);box-shadow:none;display:none;" type="text" placeholder="请输入科室" />
												</td>
											</tr>
											<tr>
												<td class="tdkey">职称：</td>
												<td class="tdval">
													<select id="jb_title" style="width: 50%;border:1px solid #ddd;">
														<option>请选择职称</option>
														<option>主任医师</option>
														<option>副主任医师</option>
														<option>主治医师</option>
														<option>住院医师</option>
														<option>学生</option>
														<option>主任护师</option>
														<option>副主任护师</option>
														<option>主管护师</option>
														<option>护师</option>
														<option>其他</option>
													</select>
													<input id="searchJobtitle" style="position:absolute;width:200px;right:41px;margin-top:6px;background-color:rgba(255, 255, 255, 0);box-shadow:none;display:none;" type="text" placeholder="请输入科室" />
												</td>
											</tr>
											
										</table>
										<div class="agree_tk">
										<!-- 	<img src="PC/image/type0.png" id="agree_box"> 
											<label for="agree_box">我已阅读并同意相关服务条款和隐私政策<a id="readys">点击阅读</a></label> -->
											<a name="reg_now" class="reg_now hasPointer" disabled="disabled" id="register" style="width: 200px; margin: 10px auto;">立即注册</a>
										</div>	
								 	</div>
								</div>
							</div>
						</div>
						<!--导航下内容部分  end-->
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
 	<!-- 内容主体  end-->
	<!-- 底部  begin-->
	<div class="copyRight"></div> 	
	<!-- 底部  end -->
<script src="PC/js/register.js" type="text/javascript" charset="utf-8"></script>

</body>
</html>