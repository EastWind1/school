<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<base href ="<%=basePath %>">
<meta content="width=device-width, initial-scale=1.0" name="viewport" />
<meta content="" name="description" />
<meta content="" name="author" />
<meta name="renderer" content="webkit">
<link href="media/media/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
<link href="media/media/css/font-awesome.min.css" rel="stylesheet" type="text/css"/>
<link href="media/media/css/style-metro.css" rel="stylesheet" type="text/css"/>
<link href="media/media/css/style.css" rel="stylesheet" type="text/css"/>
<link href="media/media/css/style-responsive.css" rel="stylesheet" type="text/css"/>
<link href="media/media/css/default.css" rel="stylesheet" type="text/css" id="style_color"/>
<link href="media/media/css/uniform.default.css" rel="stylesheet" type="text/css"/>
<link href="media/media/css/timeline.css" rel="stylesheet" type="text/css"/>
<link rel="stylesheet" type="text/css" href="media/media/css/select2_metro.css" />
<link href="media/css/media.css" rel="stylesheet" type="text/css"/>

<script src="media/media/js/jquery-1.10.1.min.js" type="text/javascript"></script>
<script src="media/media/js/jquery-migrate-1.2.1.min.js" type="text/javascript"></script>
<script src="media/media/js/jquery-ui-1.10.1.custom.min.js" type="text/javascript"></script>      
<script src="media/media/js/bootstrap.min.js" type="text/javascript"></script>
<script src="media/media/js/excanvas.min.js"></script>
<script src="media/media/js/respond.min.js"></script>  
<script src="media/media/js/jquery.slimscroll.min.js" type="text/javascript"></script>
<script src="media/media/js/jquery.blockui.min.js" type="text/javascript"></script>  
<script src="media/media/js/jquery.cookie.min.js" type="text/javascript"></script>
<script src="media/media/js/jquery.uniform.min.js" type="text/javascript" ></script>
<script src="media/media/js/app.js"></script>

<script src="media/js/ian.js" type="text/javascript"></script>
<script src="js/getIp.js" type="text/javascript"></script>
<script type="text/javascript" src="media/js/util.js"></script>
<script type="text/javascript">
var usersId = '${users.id}';
var brandId="gh_8e5eb3255148";
var userName= '${users.userName}';
if(usersId==null || usersId=="" || typeof usersId==undefined){
    parent.location.href="media/login.jsp";
}
</script>
<script type="text/javascript" src="media/js/highcharts.js"></script>
