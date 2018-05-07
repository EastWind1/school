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
                <p>粉丝数量<span id="count1" style="color: red;">0</span>人</p>

                <!--图文消息选择部分开始-->
                <jsp:include page="../weixin/materialSelect.jsp"></jsp:include>
                <!--图文消息选择部分结束-->


                <!--底部按钮开始-->
                <p><a id="sendMessage" class="btn blue">推送给他们</a></p>

                <p>&nbsp;</p>

                <p>群发消息说明:</p>

                <p>目前支持群发的内容：图文消息。</p>

                <p>1、群发内容中需添加文字+图片+视频，可先在“素材管理”中设置图文消息，然后群发时选择“图文消息”类型即可。</p>

                <p>2、上传至素材管理中的图片、语音可多次群发，没有有效期。</p>

                <p>3、群发图文消息的标题上限为64个字节。</p>
            </div>
            <!--底部按钮结束-->

            <!--弹出框部分-->
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
            </div>
	</div>
</div>

</body>
<script type="text/javascript">
 App.init();
 $(function(){
 	 $('#sendMessage').on('click',function(){
        var info = $.Params.create();

        info.addParams("publicNo",brandId);
        var informationPkid = $('#informationPkid').val();

        if(informationPkid ==undefined || informationPkid==""){
            alert("未选择图文消息");
            return;
        }

        info.addParams("informationId",informationPkid);
        info.addParams("brandId",brandId);
        info.addParams("newsType","0");
        info.ajax("material.action?sendNewsMessageByType",function(data){
            $("#resultModal .modal-body p").html(data.msg);
            $("#resultModal").modal('toggle');
        },function(){
            $("#resultModal .modal-body p").html("推送失败");
            $("#resultModal").modal('toggle');
        },900000);

    });
 })
</script>
</html>