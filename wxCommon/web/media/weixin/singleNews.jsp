
<%@ page language="java" pageEncoding="UTF-8"%>

<jsp:include page="../media.jsp"></jsp:include>
<link href="media/css/uploadify.css" rel="stylesheet" type="text/css">

<script src="media/weixin/js/swfobject.js" type="text/javascript"></script>
<script src="media/weixin/js/jquery.uploadify.min.js" type="text/javascript"></script>

<script src="media/ueditor/ueditor.config.js" type="text/javascript"></script>
<script src="media/ueditor/ueditor.all.min.js" type="text/javascript"></script>
<script src="media/ueditor/lang/zh-cn/zh-cn.js" type="text/javascript"></script>

<script src="media/weixin/js/singleNews.js" type="text/javascript"></script>

<body class="page-header-fixed" >
<div class="tab-content contents"> 
	<h3 class="form-section"><a target="right" href="media/weixin/material1.jsp">素材管理</a> > 单图文消息</h3>
<!--内容开始-->
<div class="row-fluid">
    <div class="span12">
        <div class="span5" style="width: 320px;background-color:#fff;margin-top:10px;">

            <div class="news-blocks">
                <div class="views">
                    <p mode="wrap"  id="titleP" style="width: 298px; word-break: break-word;">标题</p>
                    <img style="width:314px; height: 160px;" id="thumbnailImage" src="media/images/newsDefault.jpg">
                    <p class="description" id="descriptionP" style="width: 298px; word-break: break-word;"></p>
                </div>
            </div>

        </div>
        <!--右侧编辑开始-->
        <div class="span7" style="margin-top:10px;">
            <div class="news-blocks">

                <div style="display: inline-block;position: relative;margin-right: 7px;">
                    <i class="arrow arrow_out" style="margin-top: -800px;"></i>
                    <i class="arrow arrow_in" style="margin-top: -800px;"></i>
                </div>


                <div class="editDiv">
                    <form id="form" method="post">
                        <!--隐藏域开始-->
                        <input type="hidden" id="brandId" name="brandId" value="gh_8d5f9c073de7">
                        <input type="hidden" id="pkid" name="pkid">
                        <!--隐藏域结束-->
                        <!--标题开始-->
                        <div class="control-group">
                            <label class="control-label">标题</label>
                            <div class="controls">
                                <input type="text" id="title" name="title" class="m-wrap span12" maxlength="40">
                            </div>
                        </div>
                        <!--标题结束-->

                        <!--标题开始-->
                        <div class="control-group">
                            <label class="control-label">作者（选填）</label>
                            <div class="controls">
                                <input type="text" id="author" name="author" class="m-wrap span12" maxlength="40">
                            </div>
                        </div>
                        <!--标题结束-->

                        <!--封面开始-->
                        <div class="control-group">
                            <label class="control-label">封面（大图片建议尺寸：900像素 * 500像素）</label>
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
                                    <input type="checkbox" value="0"> 封面图片显示在正文中
                                </label>
                                <input type="hidden" id="showCoverPic" name="showCoverPic" value="0">
                            </div>
                        </div>
                        <!--封面结束-->

                        <!--添加摘要按钮-->
                        <div class="control-group">
                            <a id="addDigest">添加摘要</a>
                        </div>

                        <!--添加摘要按钮结束-->

                        <!--摘要开始-->
                        <div class="control-group hide" >
                            <label class="control-label">摘要</label>
                            <div class="controls">
                                <textarea id="digest" name="digest" class="span12  m-wrap" rows="4"></textarea>
                            </div>
                        </div>
                        <!--摘要结束-->


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
                        <div class="control-group">
                            <a id="addContentSourceUrl" style="cursor: pointer;">添加原文链接</a>
                        </div>

                        <!--添加原文链接按钮-->

                        <!--添加原文链接开始-->
                        <div class="control-group hide" >
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

</div>
</body>
<script>
    App.init();
</script>