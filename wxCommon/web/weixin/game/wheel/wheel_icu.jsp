<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<base href ="http://test.s4s.com.cn/ychz/">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="viewport"
          content="width=device-width,height=device-height,inital-scale=1.0,maximum-scale=1.0,user-scalable=no;">
    <meta name="apple-mobile-web-app-capable" content="yes">
    <meta name="apple-mobile-web-app-status-bar-style" content="black">
    <meta name="format-detection" content="telephone=no">
    <title>大转盘</title>
    <link rel="stylesheet" href="weixin/game/wheel/activity-style.css" type="text/css">
    <script src="weixin/game/wheel/jquery.js" type="text/javascript"></script>
     <script type="text/javascript" src="js/getIp.js"></script>
     <script src="common/ian.js"></script>
    <style type="text/css">
        .window {
            width: 290px;
            position: absolute;
            display: none;
            top: 130px;
            left: 50%;
            z-index: 9999;
            margin: -50px auto 0 -145px;
            padding: 2px;
            border-radius: 0.6em;
            -webkit-border-radius: 0.6em;
            -moz-border-radius: 0.6em;
            background-color: #ffffff;
            -webkit-box-shadow: 0 0 10px rgba(0, 0, 0, 0.5);
            -moz-box-shadow: 0 0 10px rgba(0, 0, 0, 0.5);
            -o-box-shadow: 0 0 10px rgba(0, 0, 0, 0.5);
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.5);
            font: 14px/1.5 Microsoft YaHei, Helvitica, Verdana, Arial, san-serif;
        }

        .window .title {
            background-color: #A3A2A1;
            line-height: 26px;
            padding: 5px 5px 5px 10px;
            color: #ffffff;
            font-size: 16px;
            border-radius: 0.5em 0.5em 0 0;
            -webkit-border-radius: 0.5em 0.5em 0 0;
            -moz-border-radius: 0.5em 0.5em 0 0;
            background-image: -webkit-gradient(linear, left top, left bottom, from(#585858),
            to(#565656)); /* Saf4+, Chrome */
            background-image: -webkit-linear-gradient(#585858, #565656);
            /* Chrome 10+, Saf5.1+ */
            background-image: -moz-linear-gradient(#585858, #565656); /* FF3.6 */
            background-image: -ms-linear-gradient(#585858, #565656); /* IE10 */
            background-image: -o-linear-gradient(#585858, #565656);
            /* Opera 11.10+ */
            background-image: linear-gradient(#585858, #565656);
        }

        .window .content {
            /*min-height:100px;
            background: linear-gradient(#FBFBFB, #EEEEEE) repeat scroll 0 0 #FFF9DF;
            */
            overflow: auto;
            padding: 10px;
            color: #222222;
            text-shadow: 0 1px 0 #FFFFFF;
            border-radius: 0 0 0.6em 0.6em;
            -webkit-border-radius: 0 0 0.6em 0.6em;
            -moz-border-radius: 0 0 0.6em 0.6em;
        }

        .window #txt {
            min-height: 30px;
            font-size: 16px;
            line-height: 22px;
            float:right;
            padding-right:40px;
        }

        .window .txtbtn {
            background: #f1f1f1;
            background-image: -webkit-gradient(linear, left top, left bottom, from(#DCDCDC),
            to(#f1f1f1)); /* Saf4+, Chrome */
            background-image: -webkit-linear-gradient(#ffffff, #DCDCDC);
            /* Chrome 10+, Saf5.1+ */
            background-image: -moz-linear-gradient(#ffffff, #DCDCDC); /* FF3.6 */
            background-image: -ms-linear-gradient(#ffffff, #DCDCDC); /* IE10 */
            background-image: -o-linear-gradient(#ffffff, #DCDCDC);
            /* Opera 11.10+ */
            background-image: linear-gradient(#ffffff, #DCDCDC);
            border: 1px solid #CCCCCC;
            border-bottom: 1px solid #B4B4B4;
            color: #555555;
            font-weight: bold;
            text-shadow: 0 1px 0 #FFFFFF;
            border-radius: 0.6em 0.6em 0.6em 0.6em;
            display: block;
            width: 100%;
            box-shadow: 0 1px 3px rgba(0, 0, 0, 0.2);
            text-overflow: ellipsis;
            white-space: nowrap;
            cursor: pointer;
            text-align: windowcenter;
            font-weight: bold;
            font-size: 18px;
            padding: 6px;
            margin: 10px 0 0 0;
        }

        .window .txtbtn:visited {
            background-image: -webkit-gradient(linear, left top, left bottom, from(#ffffff),
            to(#cccccc)); /* Saf4+, Chrome */
            background-image: -webkit-linear-gradient(#ffffff, #cccccc);
            /* Chrome 10+, Saf5.1+ */
            background-image: -moz-linear-gradient(#ffffff, #cccccc); /* FF3.6 */
            background-image: -ms-linear-gradient(#ffffff, #cccccc); /* IE10 */
            background-image: -o-linear-gradient(#ffffff, #cccccc);
            /* Opera 11.10+ */
            background-image: linear-gradient(#ffffff, #cccccc);
        }

        .window .txtbtn:hover {
            background-image: -webkit-gradient(linear, left top, left bottom, from(#ffffff),
            to(#cccccc)); /* Saf4+, Chrome */
            background-image: -webkit-linear-gradient(#ffffff, #cccccc);
            /* Chrome 10+, Saf5.1+ */
            background-image: -moz-linear-gradient(#ffffff, #cccccc); /* FF3.6 */
            background-image: -ms-linear-gradient(#ffffff, #cccccc); /* IE10 */
            background-image: -o-linear-gradient(#ffffff, #cccccc);
            /* Opera 11.10+ */
            background-image: linear-gradient(#ffffff, #cccccc);
        }

        .window .txtbtn:active {
            background-image: -webkit-gradient(linear, left top, left bottom, from(#cccccc),
            to(#ffffff)); /* Saf4+, Chrome */
            background-image: -webkit-linear-gradient(#cccccc, #ffffff);
            /* Chrome 10+, Saf5.1+ */
            background-image: -moz-linear-gradient(#cccccc, #ffffff); /* FF3.6 */
            background-image: -ms-linear-gradient(#cccccc, #ffffff); /* IE10 */
            background-image: -o-linear-gradient(#cccccc, #ffffff);
            /* Opera 11.10+ */
            background-image: linear-gradient(#cccccc, #ffffff);
            border: 1px solid #C9C9C9;
            border-top: 1px solid #B4B4B4;
            box-shadow: 0 1px 4px rgba(0, 0, 0, 0.3) inset;
        }

        .window .title .close {
            float: right;
            width: 26px;
            height: 26px;
            display: block;
        }
		
		*{ margin:0; padding:0;}
		.marquee_box{ width:200px; height:200px; border:0px solid #000; overflow:hidden;}
		 ul li{ list-style:none; line-height:20px;}
		 .scrollLeft_box{ width:400px; height:200px; overflow:hidden; border:1px solid #000;}
		 .scrollLeft_box img{ width:200px; height:200px; margin-left:3px;}
		 .scrollLeft_box table{ padding:10px; border:0; display:inline;}
		  .scrollLeft_box table tr td{ width:300px;}
		 .scrollLeft_box ul li{ float:left;}
		 p.cj_msg{text-align:center;color:#fff}
		 p.cj_msg span{color:#ff0000}
    </style>
</head>

<body class="activity-lottery-winning" ryt11204="1">
<div class="main">
    <div class="window" id="windowcenter" style="display: none;">
        <div id="title" class="title">友情提醒<span class="close" id="alertclose"></span></div>
        <div class="content">
        	<div id="txt" style="padding-right:90px;"><strong>恭喜您抽中<span style="color:red"></span> ！</strong></div>
            <div id="txt" style="float:right;padding-right:20px">姓名：<input id="customerName" type="text"  /></div>
            <div id="txt" style="float:right;padding-right:20px">手机号：<input id="tel" type="text"  /></div>
            <div id="txt" style="padding-right:0px;font-size:12px;color:red">请填写资料领取奖品，在“我的钱包”中查看详情</div>
            <input type="button" value="立即领取" id="windowclosebutton" name="立即领取"
                   class="txtbtn">
        </div>
    </div>
     <div class="window" id="windowcenter1" style="display: none;">
        <div id="title" class="title">友情提醒<span class="close" id="alertclose"></span></div>
        <div class="content">
            <div id="txt" style="float:left;margin-bottom:10px"><strong>恭喜您抽中<span style="color:red"></span> ！</strong></div>
			<div id="txt" style="float:left;margin-bottom:10px">点击<a id="mymoney" style="color:#5B9AED;cursor: pointer;">“我的钱包”</a>查看详情</div>
			<div id="txt" style="float:left;margin-bottom:10px">点击<a id="jxcj" style="color:#5B9AED;cursor: pointer;">“继续抽奖”</a></div>
        </div>
    </div>
    
    <div class="window" id="windowcenter2" style="display: none;">
        <div id="title" class="title">友情提醒<span class="close" id="alertclose"></span></div>
        <div class="content">
            <div id="txt" style="padding-left:0px;"></div>
            <input type="button" value="关闭" id="closebutton" name="关闭"
                   class="txtbtn">
        </div>
    </div>

    <div id="outercont">
        <div id="outer-cont">
            <div id="outer" style="-webkit-transform: rotate(0deg);">
                <img src="weixin/game/wheel/activity-lottery-1.png">
            </div>
        </div>
        <div id="inner-cont">
            <div id="inner">
                <img src="weixin/game/wheel/activity-lottery-3.png">
            </div>
        </div>
        <p class="cj_msg">还剩<span>3</span>次抽奖机会</p>
    </div>
    <div class="content">
         <div class="boxcontent boxyellow">
            <div class="box">
					<div class="title-green">
						<span id="del">中奖名单：</span>
					</div>

					<div class="Detail">
						<div class="marquee_box" id="box" style="width:100%">
					      <div id="box1">
					           <ul>
					       
					           </ul>
					       </div>
       <div id="box2"></div>
 					 </div>
					</div>
				</div>
			</div>
				<script language="javascript" type="text/javascript">
          var bigBox=document.getElementById("box");
    var box1=document.getElementById("box1");
    var box2=document.getElementById("box2");
    var preTop=0;
    box2.innerHTML=box1.innerHTML;
    function AutoMar(){
      automar=setInterval("Marquee()",100);
    }
    function Marquee(){
       preTop=bigBox.scrollTop;
       bigBox.scrollTop++;
      if(preTop==bigBox.scrollTop)
    { bigBox.scrollTop=0;
     bigBox.scrollTop++;
    }
    }
    function ClearAuto(){
      clearInterval(automar);
    }
    window.onload=function(){
    AutoMar();
       bigBox.onmouseover=ClearAuto;
    bigBox.onmouseout=AutoMar;
	}
  </script>
        <div class="boxcontent boxyellow">
            <div class="box">
                <div class="title-green">抽奖规则：</div>
                <div class="Detail">
                    <!-- <p class="red">本次活动总共可以转3次转盘!你已经转了1次</p> -->
                    <p>1.参加微小说投票并注册云ICU后可抽奖，每人3次机会。</p>
                    <p>2.中奖后云ICU会尽快和您取得联系，寄送奖品。</p>
                    <p>3.转发无效。</p>
                    <p>4.本活动最终解释权归云ICU所有。</p>
                </div>
                <!-- <img src="../images/default.gif" width="100%" id="ewm" />  -->
            </div>
        </div>
    </div>

</div>


<script type="text/javascript">
window.brandId='gh_8d5f9c073de7';//4s店标识
window.customerId='o7FDrs9ZvM1-15Bo_ajys5i-SszY';//客户标识
window.ipVal="http://test.s4s.com.cn/ychz/";
var customerName=""
var prizesName="";
var tel="";
var customerType="0";
var myDate = new Date();
var year = myDate.getFullYear(); 
var month = myDate.getMonth() + 1;     //月
var day = myDate.getDate();  
var createTime=year+"-"+month+"-"+day;
var arr=createTime.split('-');
createTime= arr[0]+"-"+ (arr[1].length > 9 ? arr[1] : '0'+ arr[1])  +"-"+ (arr[2].length > 1 ? '' : '0') + arr[2];
var state="";

var jszj=window.localStorage.getItem("jpName");//判断是否中奖
var playCount=window.localStorage.getItem("playCount");//获取总抽奖次数
if(jszj != null){
	$("#outercont p").html(jszj);
}else{
	$("#outercont p>span").html(3-playCount);
}

$("#del").on("click",function(){
	window.localStorage.removeItem("jpName");
	window.localStorage.removeItem("playCount");
	alert("清除成功");
})


    $(function () {
        window.requestAnimFrame = (function () {
            return window.requestAnimationFrame
                    || window.webkitRequestAnimationFrame
                    || window.mozRequestAnimationFrame
                    || window.oRequestAnimationFrame
                    || window.msRequestAnimationFrame
                    || function (callback) {
                        window.setTimeout(callback, 1000 / 60)
                    }
        })();
        var totalDeg = 360;
        var steps = [];
        //342：参与奖   270:不要灰心 234：三等奖  198:继续努力 162：四等奖 126:参与奖  90：五等奖  54：要加油哦 306：一等奖 378：二等奖
        //378:幸运奖 342：参与奖 306：谢谢参与 270：不要灰心 234：继续加油
        //198:幸运奖 162：参与奖 126：谢谢参与 90：不要灰心 54：继续加油
        var lostDeg = [198,162,126,90,54];//不中奖的角度
        var prizeDeg =[378,342,306,270,234];//中奖的角度 
        var prize, sncode = "1";//prize 赋值 则不能抽奖
        var count = 0;//抽奖次数
        var now = 0;
        var a = 0.07;//旋转速度  数字越大越快
        var outter, inner, timer, running = false;
        var id = 0; //判断是否标识
        function countSteps() {
            var t = Math.sqrt(2 * totalDeg / a);
            var v = a * t;
            for (var i = 0; i < t; i++) {
                steps.push((2 * v * i - a * i * i) / 2)
            }
            steps.push(totalDeg)
        }

        function step() {
            outter.style.webkitTransform = 'rotate(' + steps[now++]
                    + 'deg)';
            outter.style.MozTransform = 'rotate(' + steps[now++] + 'deg)';
            if (now < steps.length) {
                running = true;
                requestAnimFrame(step)
                
            } else {
                running = false;
                
                if (prize != null) {
                	state=1;
                   $("#sncode").text(sncode);
                    var type = "";
                    if (prize == 0) {
                        type = "幸运奖";
                        prizesName="幸运奖";
                    }
                    else{
                    	type = "参与奖";
                    	prizesName="参与奖";
                    }
                    if(customerName !="" && tel !=""){
                    	//$("#windowcenter1 #txt span").html(type);
                    	//$("#windowcenter1").show();
                    	$("#outercont p").html("<label style='color:#ff0000'>恭喜你，获得"+prizesName+"</label>");
						window.localStorage.setItem("jpName","<label style='color:#ff0000'>恭喜你，获得"+prizesName+"</label>");	
                    }else{
                    	$("#windowcenter #txt span").html(type);
                    	$("#windowcenter").show();
                    }
                } else {
                	state=0;
                    prizesName="未中奖";
                }
                user.luckyAdd(prizesName);
            }
        }

        function start(deg) {
            deg = deg || lostDeg[parseInt(lostDeg.length * Math.random())];
            running = true;
            clearInterval(timer);
            totalDeg = 360 * 3 + deg;
            steps = [];
            now = 0;
            countSteps();
            requestAnimFrame(step)
        }
        $.ajax(ipVal+"gameWheelLog.action?getPrizeslog&brandId="+brandId+"&gamesId=1").done(function(data){
		var html = "";
		$.each(data.row,function(i,val){
			var customerName=val.name;
			var playCount=val.prizes_name;
			html+="<li>恭喜<font color='red'>"+customerName+"</font>获得： <font color='red'>"+playCount+"</font></li>";
			
		});
		$("#box1 ul").html(html);
		}).fail(function(data){
	});

        window.start = start;
        outter = document.getElementById('outer');
        inner = document.getElementById('inner');
               
         $("#inner").click(
                function () {
               	if(jszj == null && playCount<3){
               		user.playGame();
               	}
                   
                });
         $("#windowclosebutton").click(function(){
         	var customerName=$("#customerName").val();
         	var tel=$("#tel").val();
         	if(customerName == ""){
         		return false;
         	}
         	if(tel == ""){
         		return false;
         	}
         	var updateCus = $.Params.create();
    		updateCus.addParams("customerName",customerName);
    		updateCus.addParams("tel", tel);
    		updateCus.addParams("customerId", customerId);
    		updateCus.ajax("customer.action?updateByCustomer", function (data) {
    			user.luckyAdd(prizesName);
              	$("#windowcenter").hide();
            },function(){
                alert("失败");
            });
         	
         });
         
         $("#jxcj").click(function(){
         	$("#windowcenter1").hide();
         })
         
         $("#closebutton").click(function(){
         	$("#windowcenter2").hide();
         })
         
         $("#mymoney").on('click',function(){
			window.location.href = "weixin/other/qiangqian.jsp";
		});

        /************************以上为大转盘算法******************************************/

        var user = {
            ip: ipVal,
            customerId: customerId,//客户Id
            brandId: brandId,
            jgmin:"10",
            //初始化大转盘数据
            init: function () {
              var t = this;
                //获取客户openId
            },
            //获取客户信息
            getCustomerInfo:function(){
            	var t = this;
            	 $.ajax({
                    url: t.ip + "member.action?list&openId="+customerId,
                    method: "GET",
                    dataType: "json",
                    success: function (data) {
                       customerType="1";
                       customerName=data.rows[0].name;
                       tel=data.rows[0].tel;
                       $("#customerName").val(customerName);
                       $("#tel").val(tel);
                       //判断客户的身份
                       t.getCjCount();
                       /*if(customerType != "0"){
                       		t.getCjCount();
                       }
                       //如果是粉丝则不需要进行下一步判断，中奖几率为0
                       else{
                       		t.businessLogic("a");
                       }*/
                    }
                });
            },
            //获得客户抽奖次数
            getCjCount: function () {
                var t = this;
                $.ajax({
                    url: t.ip + "gameWheelLog.action?list",
                    type: "post",
                    dataType: "json",
                    data: {"customerId":customerId,"createTime":createTime},
                    success: function (data) {
                        count = data.rows.length;
                        //alert("抽奖次数："+count);
                        if(count<3){
                        	$("#outercont p>span").html(2-count);
                        	window.localStorage.setItem("playCount",count+1);
                        	t.getAllCount();
                        }
                        
                       /* if(count==0){
                        	 t.getAllCount();
                        }else if(count ==1){
                        	//t.getAllCount();
                        	var min=t.getTime(data.rows[0].createTime);
                        	if(min<t.jgmin){
                        		var sysj=t.jgmin-min;
                        		$("#windowcenter2 #txt").html("等会再来吧！距离下一次抽奖还剩"+sysj+"分钟哦！");
                        		$("#windowcenter2").show();
                        	}else{
                        		t.getAllCount();
                        	}
                        }else{
                        	$("#windowcenter2 #txt").html("每天只有两次抽奖机会哦！");
                        	$("#windowcenter2").show();
                        }*/
                    }
                });
            },
            //获得总抽奖次数
            getAllCount: function () {
                var t = this;
                $.ajax({
                    url: t.ip + "gameWheelLog.action?list",
                    type: "post",
                    dataType: "json",
                    success: function (data) {
                        var count =data.rows.length+1;
                       // alert("抽奖总次数："+count);
                        t.businessLogic(count);
                    }
                });
            },
            //中奖后添加到数据库
            luckyAdd: function (prizesName) {
                var t = this;
            	$.ajax({
                    url: t.ip + "gameWheelLog.action?add",
                    type: "post",
                    dataType: "text",
                    data: {
                        "gamesId":"1",
                        "brandId":brandId,
                        "customerId":customerId,
                        "state":state,
                        "prizesName":prizesName
                    },
                    success: function (data) {
                    }
                });
            },
            /**
             * 开始游戏
             */
            playGame: function () {
                //先判断是否可以抽奖
                this.getCustomerInfo();
            },
            /**
             * 查询中奖的次数 后的业务逻辑
             * @param count
             */
            businessLogic: function (count) {
            	var t=this;
            	if(customerType != "0"){
            		var num = Math.floor((Math.random() * 10));
            		//alert("count="+count);
	                /*if(count%100==0){//判断是否是100的倍数，是则中四等奖
	                	prize=2;
	                	start(prizeDeg[2]);
	                }
	                else if(count%50==0){//判断是否是50的倍数，是则中五等奖
	                	prize=4;
	                	start(prizeDeg[4]);
	                }
	                else if(count%30==0){//判断是否是30的倍数，是则中参与奖
	                	prize=0;
	                	start(prizeDeg[0]);
	                }*/
	                ////378:幸运奖 342：参与奖 306：谢谢参与 270：不要灰心 234：继续加油
	                if(num <3){//幸运奖
	                	prize=0;
	                	start(prizeDeg[0]);
	                	jszj=1;
	                }
	                else if(num<6 && num>3){//参与奖
	                	prize=1;
	                	start(prizeDeg[1]);
	                	jszj=1;
	                }
	                else{
	                	var num1 = Math.floor((Math.random() * 3));
	                	prize=null;//代表未中奖
	                	if(num1==0){//不要灰心
	                 		start(prizeDeg[3]);
	                	}else if(num1==1){//继续努力
	                		start(prizeDeg[4]);
	                	}else{//谢谢参与
	                		start(prizeDeg[2]);
	                	}
	                }
            	}else{
                	var num1 = Math.floor((Math.random() * 3));
                	prize=null;//代表未中奖
                	if(num1==0){//不要灰心
	                 		start(prizeDeg[3]);
	                	}else if(num1==1){//继续努力
	                		start(prizeDeg[4]);
	                	}else{//谢谢参与
	                		start(prizeDeg[2]);
	                	}
                }
        		
        
            },
            getTime:function(startDate){
            	var myDate1 = new Date();
				var hours = myDate1.getHours(); 
				var minutes = myDate1.getMinutes(); 
				var seconds = myDate1.getSeconds();  
				var time1=startDate.split(" ")[1];
				var hours1=time1.split(":")[0];
				var minus=time1.split(":")[1];
				var h = (hours-hours1)*60;
				var m = minutes-minus;
				var min=h+m;
				return min;
            }
        };
        user.init();



    });


</script>

</body>
</html>