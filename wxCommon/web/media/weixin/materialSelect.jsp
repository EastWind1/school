<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<link href="media/css/material.css" rel="stylesheet" type="text/css">
<script src="media/weixin/js/materialSelect.js"  type="text/javascript"></script>

<!--选择推送类型框开始-->
<div class="portlet white" style="border: 1px solid #EEEEEE;background-color: #ffffff;">
    <div class="portlet-title" style="height: 36px; background-color: #ffffff;">

        <%--<a class="tooltips" type="1" data-placement="bottom" data-original-title="文字">--%>
            <%--<i class="icon-pencil icon-large active"></i>--%>
        <%--</a>--%>

        <%--<a class="tooltips" type="2" data-placement="bottom" data-original-title="图片">--%>
            <%--<i class="icon-picture icon-large"></i>--%>
        <%--</a>--%>

        <%--<a class="tooltips" type="3" data-placement="bottom" data-original-title="语音">--%>
            <%--<i class="icon-volume-up icon-large"></i>--%>
        <%--</a>--%>

        <%--<a class="tooltips" type="4" data-placement="bottom" data-original-title="视频">--%>
            <%--<i class="icon-facetime-video icon-large"></i>--%>
        <%--</a>--%>




        <a class="" >
            <i class="icon_msg_sender tooltips" data-placement="bottom" data-original-title="图文消息" type="5" ></i>
        </a>

        <input type="hidden" id="informationPkid">
    </div>

    <div class="portlet-body" id="newsSelected" style="height: 218px">
        <%--<textarea id="textContent" name="textContent" style="width: 95%; margin-top: 10px; margin-left: 10px; " rows="10" placeholder="在这里输入群发的信息..."></textarea>--%>
        <%--功能正在开发中,稍等哦亲--%>
    </div>
</div>
<!--选择推送类型框结束-->

<!--图文消息选择框开始-->
<div id="myModal3"  class="modal hide fade bs-example-modal-lg"   tabindex="-1" role="dialog" aria-labelledby="myModalLabel3" aria-hidden="true" style="display: none;">

    <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-hidden="true"></button>
        <h3 id="myModalLabel3">选择素材</h3>
    </div>

    <div class="modal-body" style="overflow-x: hidden">
        <p>图文消息列表(共<span id="newsCount">0</span>个)</p>
        <div style="width: 910px; height: 450px;">
            <div class="span4" id="col1" style="width: 296px; margin-left: 120px;">

            </div>


            <div class="span4" id="col2" style="width: 296px; margin-left: 20px;">

            </div>

        </div>
    </div>

    <div class="modal-footer" style="text-align: center">
        <button id="sure" data-dismiss="modal" class="btn blue" style="width: 108px; height: 30px;">确定</button>
        <button class="btn" data-dismiss="modal" aria-hidden="true" style="width: 108px; height: 30px;">取消</button>
    </div>

</div>
<!--图文消息选择框结束-->
