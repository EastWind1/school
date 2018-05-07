
<base href ="http://weixin.yunicu.com/ychz/">

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content=" initial-scale=1, maximum-scale=1, user-scalable=yes, minimal-ui">
<meta name="apple-mobile-web-app-capable" content="yes">
<meta name="apple-mobile-web-app-status-bar-style" content="black">
<meta name="format-detection" content="telephone=no">

<meta http-equiv="x-rim-auto-match" content="none">
<link href="common/css/ratchet.min.css" rel="stylesheet">

<link href="weixin/css/icu.css" rel="stylesheet">
<!-- 
<link href="weixin/css/apnet.css" rel="stylesheet">
 -->
<script src="common/js/jquery-1.9.1.min.js"></script>
<script src="common/js/ratchet.min.js "></script>
<script src="js/interface.js"></script>
<script src="common/ian.js"></script>
<script src="weixin/js/uuid.js"></script>
<script type="text/javascript" src="media/js/util.js"></script>

<script type="text/javascript">
function getIP(){
	return "http://weixin.yunicu.com/ychz/";
}
function GetQueryString(name)
{
    var reg = new RegExp("(^|&)"+ name +"=([^&]*)(&|$)");
    var r = window.location.search.substr(1).match(reg);
    if (r!=null) {
    	return unescape(r[2]);
    }else{
    	return null;
    }
}
window.brandId='gh_8d5f9c073de7';
//alert("brandId:"+brandId);
window.openId='${userInfo.openid}';
window.type11='${type}';
window.eopenId='${userInfo.UserId}';
window.memberId='${memberId}';
//window.memberId='aiyoufu';



window.memberName='${memberName}';
window.userType='1';
window.kfemail="1198249798@qq.com";
window.userType="1";
//alert("customerId:"+customerId);
window.kftel="400-8554-120";
window.place="1";
//alert("customerId:"+openId);
/*if(window.customerId == null || window.customerId== "" || window.brandId == "" || window.brandId == null){
    window.location.href="weixin/error.jsp";
}*/

</script>
