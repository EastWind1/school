
<base href ="http://www.yunicu.com/ychz/">

<meta content="width=device-width, initial-scale=1.0" name="viewport" />
<meta name="renderer" content="webkit">
<link href="PC/media/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
<link href="PC/media/css/bootstrap-responsive.min.css" rel="stylesheet" type="text/css"/>
<link href="PC/media/css/style.css" rel="stylesheet" type="text/css" />
<link href="PC/media/css/promo.css" rel="stylesheet" type="text/css" />


<link href="PC/media/css/font-awesome.min.css" rel="stylesheet" type="text/css"/>
<link href="PC/media/css/style-metro.css" rel="stylesheet" type="text/css"/>
<link href="PC/media/css/style-responsive.css" rel="stylesheet" type="text/css"/>
<link href="PC/media/css/uniform.default.css" rel="stylesheet" type="text/css"/>
<link href="PC/media/css/timeline.css" rel="stylesheet" type="text/css"/>
<link rel="stylesheet" type="text/css" href="PC/media/css/select2_metro.css" />
<link rel="shortcut icon" href="PC/image/icu.ico" /> 
<link href="PC/css/icu.css" rel="stylesheet" type="text/css" />
 
<script src="PC/media/js/jquery-1.10.1.min.js" type="text/javascript"></script>
<script src="PC/media/js/jquery-migrate-1.2.1.min.js" type="text/javascript"></script>
<script src="PC/media/js/jquery-ui-1.10.1.custom.min.js" type="text/javascript"></script>      
<script src="PC/media/js/bootstrap.min.js" type="text/javascript"></script>
<script src="PC/media/js/excanvas.min.js"></script>
<script src="PC/media/js/respond.min.js"></script>  
<script src="PC/media/js/jquery.slimscroll.min.js" type="text/javascript"></script>
<script src="PC/media/js/jquery.blockui.min.js" type="text/javascript"></script>  
<script src="PC/media/js/jquery.cookie.min.js" type="text/javascript"></script>
<script src="PC/media/js/jquery.uniform.min.js" type="text/javascript" ></script>
<script src="PC/media/js/app.js"></script>

<script src="common/ian.js" type="text/javascript"></script>
<script src="js/getIp.js" type="text/javascript"></script>
<script src="PC/js/util.js" type="text/javascript"></script>
<script src="js/interface.js" type="text/javascript"></script>
<script type="text/javascript">
var brandId="gh_8d5f9c073de7";
var openId='${member.openId}';
var memberId='${member.id}';
var host=window.location.host;
var htmlurl= window.location.href;
htmlurl=htmlurl.split("PC/")[1];
//window.localStorage.setItem("openId",null);
if((openId == "" && memberId !="" ) || (openId == "" && memberId != "")){
	//openId=window.localStorage.getItem("openId");
	//if(openId == null || openId == "null"){
	//	openId="";
		var p1=$.Params.create();
		p1.addParams("id",memberId); 
		p1.ajax(getIP()+"member.action?list",function(data){
		    openId=data.rows[0].openId;
		  //  alert(memberId+"-------------"+openId);
			if(openId != null){
				//window.localStorage.setItem("openId",openId);
			}else{
				openId="";
			}
		})
	//}
 	
}
var userName= '${member.name}';
var place='2';
window.kfemail="1198249798@qq.com";
window.kftel="400-8554-120";
</script>

