<%@page language="java" pageEncoding="UTF-8"%>
<!DOCTYPE html>
 <html lang="en">
<head>
	<meta charset="utf-8" />
 	<jsp:include page="../media.jsp"></jsp:include>
 	
 </head>

<body class="page-header-fixed" >
<div class="tab-content contents"> 
	<h3 class="form-section">消息推送</h3>
 <div class="row-fluid">
		<div class="span12">
                <!--图文消息选择部分开始-->
                <jsp:include page="../weixin/materialSelect.jsp"></jsp:include>
                <!--图文消息选择部分结束-->


                <!--底部按钮开始-->
                <p><a id="sendMessage" class="btn blue">添加</a></p>

               
            </div>
            <!--底部按钮结束-->

            <!--弹出框部分
            <div id="resultModal" class="modal hide fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel3"
                 aria-hidden="true" style="display: none;">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true"></button>
                    <h3 id="myModalLabel3">推送结果</h3>
                </div>

                <div class="modal-body">
                    <p></p>
                </div>

                <div class="modal-footer">
                    <button class="btn blue" data-dismiss="modal" aria-hidden="true">关闭</button>
                </div>
            </div>-->
	</div>
</div>

</body>
<script type="text/javascript">
 App.init();
 $(function(){
 	 $('#sendMessage').on('click',function(){
        var info = $.Params.create();

        var informationPkid = $('#informationPkid').val();
        if(informationPkid ==undefined || informationPkid==""){
            alert("未选择图文消息");            return;
        }

        info.addParams("informationId",informationPkid);
        info.addParams("brandId",brandId);
        info.addParams("newsType","1");
        info.ajax("material.action?addInform",function(data){
        	alert(data.msg);
        	window.location.href="media/information/informationList.jsp";
           // $("#resultModal .modal-body p").html(data.msg);
            //$("#resultModal").modal('toggle');
        },function(){
            //$("#resultModal .modal-body p").html("推送失败");
            //$("#resultModal").modal('toggle');
        },900000);

    });
 })
</script>
</html>