<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<!DOCTYPE>
<html>
  <head>
	<title>忙闲状态设置</title>
	<jsp:include page="../common.jsp"></jsp:include>
	<style type="text/css">
		.titleclass{ text-align: center;}
		.table-view-cell.footbar {
		  	padding: 0px;
		  	border-top: 1px solid #dedede;
		  	border-radius: 0px;
		}
		.table-view-cell.footbar p {
			width: 49%;
		  	display: inline-block;
		  	text-align: center;
		  	line-height: 50px;
		  	height: 50px;
		  	border-right: 1px solid #dedede;
		}
	</style>
  </head>
  
  <body>
 		<div class="card listsz">
			<ul class="table-view" style="margin-left:0px;">
				<li class="table-view-cell titleclass"><span>设置在线状态</span></li>
				<li class="table-view-cell footbar">
					<p><img status="1" src="weixin/images/sex1.png">  在线</p>
					<p><img status="2" src="weixin/images/sex0.png">  繁忙</p>
				</li>
			</ul>
 		</div>
 		
 		<script type="text/javascript">
		$(function(){
			var sel=$.Params.create(); 
			sel.addParams("openId",eopenId); 
			sel.ajax(getIP()+"expert.action?list",function(data){
				var val=data.rows[0];
		   		
		   		$(".footbar img[status="+val.busyStatus+"]").attr("src","PC/image/sex1.png").attr("checked","checked");
		   		$(".footbar img[status="+val.busyStatus+"]").parent().siblings().find("img").attr("src","PC/image/sex0.png").removeAttr("checked");
			})
			
		
		
			$(".footbar img").on("click",function(){
				$(this).attr("src","PC/image/sex1.png").attr("checked","checked");
				$(this).parent().siblings().find("img").attr("src","PC/image/sex0.png").removeAttr("checked");
		 		 
				var statusNum=$(this).attr("checked","checked").attr("status");
		 		 
				var update=$.Params.create(); 
		 		update.addParams("openId",eopenId); 
		 		update.addParams("busyStatus",statusNum); 
				update.ajax(getIP()+"expert.action?updateByOpenId",function(data){
					alert(data.msg);
				})
		 	})
		})
		
		/*var send=$.Params.create(); 
		send.addParams("access_token","83sbq4k6abvJif2NW0-F8fgoiUJKorGuX4slmfHxjYtwkLMd7ADa3ZTjeNwbAbiJ0LI2hwnfjGDQ2Xigd-lxgQ"); 
 		var body="{\"touser\": \"Ashe.cao\",\"totag\": \"1\",\"msgtype\": \"text\",\"agentid\": \"1\",\"text\": {\"content\": \"你好呀\"},\"safe\":\"0\"}";
 		send.addParams("body",body); 
		send.ajax("https://qyapi.weixin.qq.com/cgi-bin/user/simplelist",function(data){
			alert(data.errmsg);
		})*/
		/*var body="{\"touser\": \"Ashe.cao\",\"totag\": \"1\",\"msgtype\": \"text\",\"agentid\": \"1\",\"text\": {\"content\": \"你好呀\"},\"safe\":\"0\"}";
		var access_token="83sbq4k6abvJif2NW0-F8fgoiUJKorGuX4slmfHxjYtwkLMd7ADa3ZTjeNwbAbiJ0LI2hwnfjGDQ2Xigd-lxgQ";
		 $.ajax({
            //提交数据的类型 POST GET
            type:"POST",
            //提交的网址
            url:"https://qyapi.weixin.qq.com/cgi-bin/message/send?access_token="+access_token,
            //提交的数据
            data:{"body":body},
            //返回数据的格式
            datatype: "json",//"xml", "html", "script", "json", "jsonp", "text".
            //在请求之前调用的函数
            beforeSend:function(){},
            //成功返回之后调用的函数             
            success:function(data){
          			alert(data.errmsg);       
            }
          })*/
		
 		</script>
  </body>
</html>