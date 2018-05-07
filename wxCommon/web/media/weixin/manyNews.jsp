<%--
  Created by IntelliJ IDEA.
  User: 栋
  Date: 2014/7/21
  Time: 11:23
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" pageEncoding="UTF-8"%>
<jsp:include page="../media.jsp"></jsp:include>

<link href="media/css/uploadify.css" rel="stylesheet" type="text/css">
<script src="media/weixin/js/swfobject.js" type="text/javascript"></script>
<script src="media/weixin/js/jquery.uploadify.min.js" type="text/javascript"></script>

<script src="media/ueditor/ueditor.config.js" type="text/javascript"></script>
<script src="media/ueditor/ueditor.all.min.js" type="text/javascript"></script>
<script src="media/ueditor/lang/zh-cn/zh-cn.js" type="text/javascript"></script>

<script src="media/weixin/js/manyNews.js" type="text/javascript"></script>

<body class="page-header-fixed" >
<div class="tab-content contents"> 
	<h3 class="form-section"><a target="right" href="media/weixin/material1.jsp">素材管理</a> > 多图文消息</h3>

<!--内容开始-->
<div class="row-fluid">
    <div class="span12">
        <div class="span5" style="width: 320px;background-color:#fff;margin-top:10px;">

            <div class="news-blocks" style="position: relative">
                <div class="mainViews" active="active" newsType="main" author="" imageurl="" contentsourceurl=""  pkid="" showCoverPic="0">
                    <img style="width:314px; height: 160px;" id="thumbnailImage" src="media/images/newsDefault.jpg">
                    <div id="imageMask">
                        <p class="informationTitle" style="width: 290px; word-wrap: break-word;">标题</p>
                    </div>
                    <div class="viewsMask">
                        <a class="editMainNews"><i class='icon18_common edit_gray'></i></a>
                    </div>
                    <input type="hidden" value="">
                </div>

                <div class="subNews" author="" imageurl="" contentsourceurl="" pkid="" showCoverPic="0">
                    <span><p class="informationTitle" style="width: 200px; word-wrap:break-word;">标题</p></span>
                    <img src="media/images/manyNewsDefault.jpg">
                    <div class="appmsg_edit_mask">
                        <a class="editSubNews"><i class='icon18_common edit_gray' style='width: 20px ; height:20px;'></i></a>
                        <a style="margin-left:20px;" class="deleteSubNews"><i class='icon18_common del_gray'></i></a>
                    </div>
                    <input type="hidden" value="">
                </div>

                <a onclick="return false;" class="create_access_primary appmsg_add" id="js_add_appmsg" href="javascript:void(0);">
                    <img style="width:16px; height: 16px; position: absolute;margin-top: 30;" id="thumbnailImage1" src="media/images/manyNewsPlus.png">
                </a>
            </div>
        </div>

        <!--右侧编辑开始-->
        <div class="span7" style="margin-top:10px;">
            <div class="news-blocks" style="border:none;">

                <div style="display: inline-block;position: relative;margin-right: 7px;">
                    <i class="arrow arrow_out" style="margin-top: -800px;"></i>
                    <i class="arrow arrow_in" style="margin-top: -800px;"></i>
                </div>

                <div class="editDiv">
                    <form id="form" method="post">
                        <!--隐藏域开始-->
                        <input type="hidden" id="brandId" name="brandId" value="${roles.brandId}">
                        <input type="hidden" id="pkid" name="pkid">
                        <!--隐藏域结束-->

                        <!--标题开始-->
                        <div class="control-group">
                            <label class="control-label">标题</label>
                            <div class="controls">
                                <input type="text" id="title" name="title" class="m-wrap span12" maxlength="38">
                            </div>
                        </div>
                        <!--标题结束-->

                        <!--标题开始-->
                        <div class="control-group">
                            <label class="control-label">作者（选填）</label>
                            <div class="controls">
                                <input type="text" id="author" name="author" class="m-wrap span12" maxlength="10">
                            </div>
                        </div>
                        <!--标题结束-->

                        <!--封面开始-->
                        <div class="control-group">
                            <label class="control-label">封面（小图片建议尺寸：200像素 * 200像素）</label>
                            <div class="controls">
                                <input id="file_upload" name="file_upload" type="file" multiple="true">

                                <!--图片URL-->
                                <input id="imageUrl" name="imageUrl" type="hidden">
                            </div>

                            <div class="controls" style="display: none" id="imageShowDiv">
                                <img src="" style="width: 102px; height: 74px;" id="fileImage">
                                <a id="deleteImage">删除</a>
                            </div>

                            <div class="controls">
                                <label class="checkbox">
                                    <input type="checkbox"  value="0"> 封面图片显示在正文中
                                    <input type="hidden" id="showCoverPic" name="showCoverPic">
                                </label>
                            </div>
                        </div>
                        <!--封面结束-->

                        <!--正文开始-->
                        <div class="control-group">
                            <label class="control-label">正文</label>
                            <div class="controls">
                                <%--<textarea class="ckeditor" id="field2" name="field2" class="span12 m-wrap" rows="3"></textarea>--%>
                                <script id="contents" name="contents" type="text/plain"></script>
                            </div>
                        </div>
                        <!--正文结束-->

                        <!--添加原文链接按钮-->
                        <%--<div class="control-group">--%>
                            <%--<a id="addContentSourceUrl">添加原文链接</a>--%>
                        <%--</div>--%>

                        <!--添加原文链接按钮-->

                        <!--添加原文链接开始-->
                        <div class="control-group" >
                            <label class="control-label">原文链接</label>
                            <div class="controls">
                                <input type="text" id="contentSourceUrl" name="contentSourceUrl" class="span12  m-wrap" />
                            </div>
                        </div>
                        <!--添加原文结束-->

                    </form>
                </div>
            </div>
        </div>
        <!--右侧编辑结束-->

    </div>
    <p>
            <button type="button" class="btn" id="save" style="margin-left: 300px;">保存</button>
        </p>
</div>
<!--内容结束-->

<%--消息提示框开始--%>
<div id="messageAlert" class="modal hide fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel2" aria-hidden="true" style="display: none;">

    <div class="modal-header">

        <button type="button" class="close" data-dismiss="modal" aria-hidden="true"></button>

        <h3 id="myModalLabel2">提示</h3>

    </div>

    <div class="modal-body">

        <p id="messageAlertContent"></p>

    </div>

    <div class="modal-footer">

        <button data-dismiss="modal" class="btn green">确定</button>

    </div>

</div>

<%--消息提示框开始--%>
</div>
</body>