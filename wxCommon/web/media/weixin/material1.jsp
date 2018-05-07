<%@ page language="java" pageEncoding="UTF-8"%>
<jsp:include page="../media.jsp"></jsp:include>
<link href="media/css/material.css" rel="stylesheet" type="text/css">
<script src="media/weixin/js/material1.js" type="text/javascript"></script>

<body class="page-header-fixed" >
<div class="tab-content contents"> 
	<h3 class="form-section">素材管理</h3>
<div class="row-fluid">
    <div class="span12">
        <div class="tabbable tabbable-custom">

            <ul class="nav nav-tabs">

                <li class="active"><a href="#tab_1_1" data-toggle="tab">图文消息</a></li>

                <%--<li class=""><a href="#tab_1_2" data-toggle="tab">图片</a></li>--%>

                <%--<li class=""><a href="#tab_1_3" data-toggle="tab">语音</a></li>--%>

                <%--<li class=""><a href="#tab_1_4" data-toggle="tab">视频</a></li>--%>

            </ul>


                <div class="tab-pane active" id="tab_1_1">

                    <p>图文消息列表(共<span id="newsCount">0</span>个)</p>


                    <div class="span4" id="col1" style="width: 296px;">



                        <%--<div class="news-blocks" style="margin-bottom: 20px;">--%>
                            <%--<div class="views">--%>
                                <%--<p class="createTime">14:10</p>--%>
                                <%--<img style="width:296px; height: 160px;" src="http://mmsns.qpic.cn/mmsns/UKnpojXqAh13ucvFrmia5E0ibzfGYyTXribsPatGIn0q1rPjwRoXyPKGA/0" >--%>
                                <%--<div class="manyNewsImageMask"><p>研恒软件——技术领域，移动互联网 </p></div>--%>
                            <%--</div>--%>
                            <%--<div class="subViews">--%>
                                    <%--<img src="http://mmsns.qpic.cn/mmsns/UKnpojXqAh13ucvFrmia5E0ibzfGYyTXribHUGiabOAQxiaMetIK1aEbtJw/0" >--%>
                                    <%--<p>研恒软件——技术领域，物联网信息系统</p>--%>
                            <%--</div>--%>
                            <%--<div class="subViews">--%>
                                <%--<img src="http://mmsns.qpic.cn/mmsns/UKnpojXqAh13ucvFrmia5E0ibzfGYyTXribHUGiabOAQxiaMetIK1aEbtJw/0" >--%>
                                <%--<p>研恒软件——技术领域，物联网信息系统</p>--%>
                            <%--</div>--%>
                            <%--<div class="subViews">--%>
                                <%--<img src="http://mmsns.qpic.cn/mmsns/UKnpojXqAh13ucvFrmia5E0ibzfGYyTXribHUGiabOAQxiaMetIK1aEbtJw/0" >--%>
                                <%--<p>研恒软件——技术领域，物联网信息系统</p>--%>
                            <%--</div>--%>

                            <%--<div class="bottom">--%>
                                <%--<div class="span6 editButton">--%>
                                    <%--<a class="editButtonTip" data-toggle="tooltip" data-placement="bottom" title="" onclick="editData('2fccdef5fad54db781f36c0b082f4ef7')" data-original-title="编辑">--%>
                                        <%--<i class="icon-pencil icon-large" style="width: 20px ; height:20px;"></i>--%>
                                    <%--</a>--%>
                                <%--</div>--%>
                                <%--<div class="span6">--%>
                                    <%--<a data-toggle="tooltip" data-placement="bottom" title="" class="deleteButton" onclick="deleteData('2fccdef5fad54db781f36c0b082f4ef7')" data-original-title="删除">--%>
                                        <%--<i class="icon-trash icon-large"></i>--%>
                                    <%--</a>--%>
                                <%--</div>--%>
                            <%--</div>--%>
                        <%--</div>--%>

                        <%--<div class="news-blocks1">--%>
                            <%--<p>12:40</p>--%>
                            <%--<div class="mainViews" active="active" newsType="main" author="" imageurl="" contentsourceurl="">--%>
                                <%--<img  id="thumbnailImage" src="images/newsDefaul1t.jpg" style="width: 298px;height: ">--%>
                                <%--<div id="imageMask">--%>
                                    <%--<p class="informationTitle" style="width: 190px; word-wrap: break-word;">标题</p>--%>
                                <%--</div>--%>
                                <%--<input type="hidden" value="">--%>
                            <%--</div>--%>

                            <%--<div class="subNews" author="" imageurl="" contentsourceurl="">--%>
                                <%--<span><p class="informationTitle" style="width: 200px; word-wrap:break-word;">标题</p></span>--%>
                                <%--<img src="images/manyNewsDefault.jpg" width="80px" height="80px">--%>
                                <%--<input type="hidden" value="">--%>
                            <%--</div>--%>

                        <%--</div>--%>
                    </div>


                    <div class="span4" id="col2" style="width: 296px;">


                    </div>

                    <div class="span4" id="col3" style="width: 296px;">

                    </div>

                </div>

               <!-- <div class="tab-pane" id="tab_1_2">
                    <p>图片群发功能正在开发中</p>
                </div>

                <div class="tab-pane" id="tab_1_3">
                    <p>语音群发功能正在开发中</p>

                </div>

                <div class="tab-pane" id="tab_1_4">
                    <p>视频群发功能正在开发中</p>

                </div> --> 


        </div>

        <!--END TABS-->

    </div>

    <div class="space10 visible-phone"></div>

</div>


<%--删除确认框--%>
<div id="confirmDelete" class="modal hide fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel3" aria-hidden="true" style="display: none;">

    <div class="modal-header">

        <button type="button" class="close" data-dismiss="modal" aria-hidden="true"></button>

        <h3 id="myModalLabel3">提示</h3>

    </div>

    <div class="modal-body">

        <p>确定删除?</p>

    </div>

    <div class="modal-footer">

        <button class="btn" data-dismiss="modal" aria-hidden="true">取消</button>

        <button data-dismiss="modal" class="btn red" id="sureDelete">确定</button>

    </div>

</div>
<%--删除确认框--%>
</div>
</body>