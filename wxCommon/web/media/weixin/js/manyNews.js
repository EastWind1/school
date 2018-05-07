$(function () {

    var pkid = getQueryString("informationId") ;

    App.initUniform();

    var ue = UE.getEditor('contents');

    ue.addListener("contentChange",function(){
        var obj = $('.news-blocks').find('.subNews[active=active],.mainViews[active=active]');
        obj.find('input').val(ue.getContent());
    });

    $('#file_upload').uploadify({
        'swf': getIP()+'media/weixin/js/uploadify.swf',    //指定上传控件的主体文件
        'uploader': getIP()+'util/uploadFile.action',    //指定服务器端上传处理文件

        //其他配置项
        width: 108,                          // 按钮的宽度
        height: 32,                         // 按钮的高度
//        'buttonClass':'uploadBtn',
        'buttonText': "上传",                 // 按钮上的文字
        'buttonImage' : getIP()+'media/images/uploadBtn.png',
        'buttonCursor': 'hand',                // 按钮的鼠标图标

        'fileObjName': 'Filedata',            // 上传参数名称
        'fileSizeLimit' : '1MB',
        // 两个配套使用
        'fileTypeExts': "*.jpg;*.png",             // 扩展名
        'fileTypeDesc': "请选择 jpg png 文件",     // 文件说明

        'auto': true,                // 选择之后，自动开始上传
        'multi': false,               // 是否支持同时上传多个文件
        'onUploadSuccess': function (file, data, response) {
            var object = eval('(' + data + ')');

            //查找当前选中的DIV
            var obj = $('.news-blocks').find('.subNews[active=active],.mainViews[active=active]');

            //给DIV附加图片URL
            obj.attr("imageUrl",object.imageUrl);

            obj.find('img').attr('src',"data/material/" + object.imageUrl);

            $('#fileImage').attr('src', "data/material/" + object.imageUrl);

            $('#imageShowDiv').show();

        }
    });


    //图片上传成功之后 可以删除图片
    $('#deleteImage').on('click', function () {
        $('#imageShowDiv').hide();

        //寻找属性为active
        var obj = $('.news-blocks').find('.subNews[active=active],.mainViews[active=active]');


        if(obj.attr("newsType") == "main"){
            obj.find("img").attr('src', "media/images/newsDefault.jpg");
        }else{
            obj.find("img").attr('src', "media/images/manyNewsDefault.jpg");
        }


        $.ajax({
            type: "POST",
            url:getIP()+"util/deleteFile.action",
            data:{imageUrl:obj.attr("imageUrl")},// 你的formid
            async:false,
            success: function(data) {
                if(data.success){
                    //删除成功做处理
                    console.info(data.msg);
                }else{
                    //删除失败 做处理
                }
            },error: function(data) {
                //做处理
            }
        });

        obj.attr("imageUrl","");
        $('#informationImage').attr('src', "");
    });


    //添加原文链接
//    $('#addContentSourceUrl').bind("click",function(){
//        $(this).hide();
//        $('#contentSourceUrl').parent().parent().removeClass("hide");
//    })



    //是否显示封面
    $('input[type=checkbox]').on("click",function(){
        var obj = $('.news-blocks').find('.subNews[active=active],.mainViews[active=active]');
        if($(this).val() == "0"){
            $('input[type=checkbox]').parent().addClass("checked");
            $(this).val("1");
            obj.attr("showCoverPic","1");
        }else if($(this).val() == "1"){
            $('input[type=checkbox]').parent().removeClass("checked");
            $(this).val("0");
            obj.attr("showCoverPic","0");
        }
    })


    //保存按钮
    $('#save').bind('click',function(){

        var array = new Array();
        var flag = true;

        var mainNewsInfo = $.Params.create();
        var mainNews = $('.mainViews');
        mainNewsInfo.addParams("title",mainNews.find('.informationTitle').html());
        mainNewsInfo.addParams("author",mainNews.attr("author"));
        var imageUrl = mainNews.attr("imageUrl");
        if(imageUrl == "" || imageUrl == undefined || imageUrl == null){
            alert("必须插入一张图片");
            flag = false;
            return false;
        }
        mainNewsInfo.addParams("imageUrl",imageUrl);
        mainNewsInfo.addParams("brandId",brandId);
        mainNewsInfo.addParams("contentSourceUrl",mainNews.attr("contentSourceUrl"));
        mainNewsInfo.addParams("contents",mainNews.find('input').val());
        mainNewsInfo.addParams("showCoverPic",mainNews.attr("showCoverPic"));
        if(mainNews.find('input').val() == ""){
//            $('#messageAlertContent').html("正文内容不能为空或多于20000字");
//            $('#messageAlert').modal();
            alert("正文内容不能为空或多于20000字");
            mainNews.find('.editMainNews').click();
            return;
        }

        mainNewsInfo.addParams("pkid",mainNews.attr("pkid"));
        array.push(mainNewsInfo.toJson());

        $.each($('.subNews'),function(i,val){

            var subNewsInfo = $.Params.create();
            var subNews = $(val);

            subNewsInfo.addParams("title",subNews.find('.informationTitle').html());
            subNewsInfo.addParams("author",subNews.attr("author"));
            var imageUrl = subNews.attr("imageUrl");
            if(imageUrl == "" || imageUrl == undefined || imageUrl == null){
                alert("必须插入一张图片");
                flag = false;
                return false;
            }
            subNewsInfo.addParams("pkid",subNews.attr("pkid"));
            subNewsInfo.addParams("brandId",brandId);
            subNewsInfo.addParams("imageUrl",imageUrl);
            subNewsInfo.addParams("contentSourceUrl",subNews.attr("contentSourceUrl"));
            subNewsInfo.addParams("contents",subNews.find('input').val());
            subNewsInfo.addParams("showCoverPic",subNews.attr("showCoverPic"));

            if(subNews.find('input').val() == ""){
//                $('#messageAlertContent').html("正文内容不能为空或多于20000字");
//                $('#messageAlert').modal();

                alert("正文内容不能为空或多于20000字");
                subNews.find('.editSubNews').click();
                flag = false;
                return false;
            }

            array.push(subNewsInfo.toJson());
        });


        if(flag == true){
            $.ajax({
                type: "POST",
                url:getIP()+"material.action?addManyNews",
                data:{dataList:JSON.stringify(array)},
                async:false,
                success: function(data) {
                    if(data.success){
                        window.location.href = getIP()+"media/weixin/material1.jsp";
                    }else{
                        alert("保存失败");
                    }
                },error: function(data) {
                    alert("提交失败");
                }
            });
        }
    });

    //点击之后添加一条多图文
    $('#js_add_appmsg').on("click",function(){

        if($('.subNews').length >= 9){
            alert("不能超过10条图文消息");
            return;
        }


        var html = "<div class='subNews' author='' imageurl='' contentsourceurl='' pkid='' showCoverPic='0'>"+
                    "<span><p class='informationTitle' style='width: 200px; word-wrap:break-word;'>标题</p></span>"+
                    "<img src='media/images/manyNewsDefault.jpg' width='80px' height='80px'>"+
                    "<div class='appmsg_edit_mask '>"+
                    "<a class='editSubNews'><i class='icon18_common edit_gray' ></i></a>"+
                    "<a style='margin-left:20px;' class='deleteSubNews'><i class='icon18_common del_gray'></i></a>"+
                    "</div>"+
                    "<input type='hidden' value=''>"+
                    "</div>";
        $('.subNews').last().after(html);
    })

    //子消息的删除按钮
    $('.news-blocks').delegate('.deleteSubNews','click',function(){
        if($('.subNews').length <= 1){
            alert("无法删除，多图文至少需要2条消息");
        }else{
            $(this).parent().parent().remove();
            var pkid =  $(this).parent().parent().attr("pkid");

            var info= $.Params.create();
            info.addParams("id",pkid);
            info.ajax("material.action?delete",function(data){
                var html = "<div class='news-blocks'>"+
                    "<div class='viewsButton' style='margin-bottom: 20px'>"+
                    "<p>"+
                    "<a class='addButton' data-toggle='tooltip' data-placement='bottom' title='添加单图文消息'><i class='icon-picture icon-2x'></i></a>"+
                    "<a class='addButton' data-toggle='tooltip' data-placement='bottom' title='添加多图文消息'><i class='icon-picture icon-2x'></i></a>"+
                    "</p>"+
                    "</div>"+
                    "</div>";
                $('#col1').html(html);
                $('.addButton').tooltip();
                $('#col2').html("");
                $('#col3').html("");
                loadData();
            },function(){
                alert("删除失败");
            });
        }

        //删除图片
    })



    //主要消息的编辑按钮
    $('.editMainNews').on("click",function(){
        $('.editDiv').css("margin-top","0");
        //给父父DIV添加active属性
        $('.subNews').removeAttr("active");
        var parent = $(this).parent().parent();
        parent.attr("active","active");


        //给点击的元素绑定事件
        //及时监听标题输入框
        $("#title").off();

        $("#title").on('input propertychange', function () {
            if ($("#title").val() == "") {
                parent.find('.informationTitle').html("标题")
            } else {
                parent.find('.informationTitle').html($("#title").val())
            }
        })

        //给作者绑定事件
        $("#author").off();

        $("#author").on('input propertychange', function () {
            parent.attr("author",$("#author").val())
        })


        //原文链接
        $('#contentSourceUrl').off();
        $('#contentSourceUrl').on('input propertychange', function () {
            parent.attr("contentSourceUrl",$(this).val())
        })


        //是否显示正面
        var showCover = parent.attr("showCoverPic");
        if(showCover == "0"){
            $('input[type=checkbox]').val("0");
            $('input[type=checkbox]').parent().removeClass("checked");
        }else if(showCover == "1"){
            $('input[type=checkbox]').val("1");
            $('input[type=checkbox]').parent().addClass("checked");
        }


        //赋值
        $('#title').val(parent.find('.informationTitle').html());

        $('#author').val(parent.attr("author"));

        //图片赋值
        var imageUrl = parent.attr("imageUrl");
        if(imageUrl != "" && imageUrl != undefined){
            $('#fileImage').attr('src', "data/material/" + imageUrl);
            $('#imageShowDiv').show();
        }else{
            $('#fileImage').attr('src', "");
            $('#imageShowDiv').hide();
        }

        ue.setContent(parent.find('input').val());

        //原文链接赋值
        $('#contentSourceUrl').val(parent.attr("contentSourceUrl"));
    });

    //内容赋值
    ue.addListener("ready", function () {
        // editor准备好之后才可以使用
        $('.editMainNews').click();
    });


    //子消息的编辑按钮
    $('.news-blocks').delegate('.editSubNews','click',function(){
        var margin =($(this).parent().parent().index()-1)*120 +183;
        $('.editDiv').css("margin-top",margin);

        //同时去除active属性
        $('.subNews,.mainViews').removeAttr("active");

        var parent = $(this).parent().parent();
        parent.attr("active","active");


        //给点击的元素绑定事件
        //及时监听标题输入框
        $("#title").off();

        $("#title").on('input propertychange', function () {
            if ($("#title").val() == "") {
                parent.find('.informationTitle').html("标题")
            } else {
                parent.find('.informationTitle').html($("#title").val())
            }
        })

        //给作者绑定事件
        $("#author").off();

        $("#author").on('input propertychange', function () {
            parent.attr("author",$("#author").val())
        })


        //原文链接
        $('#contentSourceUrl').off();
        $('#contentSourceUrl').on('input propertychange', function () {
            parent.attr("contentSourceUrl",$(this).val())
        })


        //是否显示正面
        var showCover = parent.attr("showCoverPic");
        if(showCover == "0"){
            $('input[type=checkbox]').val("0");
            $('input[type=checkbox]').parent().removeClass("checked");
        }else if(showCover == "1"){
            $('input[type=checkbox]').val("1");
            $('input[type=checkbox]').parent().addClass("checked");
        }


        //赋值
        $('#title').val(parent.find('.informationTitle').html());

        $('#author').val(parent.attr("author"));

        //图片赋值
        var imageUrl = parent.attr("imageUrl");
        if(imageUrl != "" && imageUrl != undefined){
            $('#fileImage').attr('src', "data/material/" + imageUrl);
            $('#imageShowDiv').show();
        }else{
            $('#fileImage').attr('src', "");
            $('#imageShowDiv').hide();
        }

        //内容赋值

            // editor准备好之后才可以使用
        ue.setContent(parent.find('input').val());


        //原文链接赋值
        $('#contentSourceUrl').val(parent.attr("contentSourceUrl"));

    });




    if(pkid != undefined && pkid !=null && pkid !=""){
        $.ajax({
            type: "POST",
            url:getIP()+"material.action?getAllMaterial",
            data:{parentId:pkid,brandId:brandId},
            success: function(data) {
                var val = data.rows[0];
                console.info(val);

                $('.mainViews').attr("author",val.author);
                $('.mainViews').attr("imageurl",val.imageUrl);
                $('.mainViews').attr("pkid",val.pkid);
                $('.mainViews').attr("contentsourceurl",val.contentSourceUrl);
                $('.mainViews').find('.informationTitle').html(val.title);
                $('.mainViews').find('input').val(val.contents);
                $('.mainViews').find('img').attr("src","data/material/"+val.imageUrl);

                if(val.showCoverPic == null || val.showCoverPic == ""){
                    $('.mainViews').attr("showCoverPic","0");
                }else{
                    $('.mainViews').attr("showCoverPic",val.showCoverPic);
                }


                var html = "";
                $('.subNews').remove();
                $.each(val.materialSub,function(i,subVal){
                    console.info(subVal);
                    html += "<div class='subNews' author='"+subVal.author+"' imageurl='"+subVal.imageUrl+"' contentsourceurl='"+subVal.contentSourceUrl+"' pkid='"+subVal.pkid+"' showCoverPic='"+(subVal.showCoverPic==null ||subVal.showCoverPic=="" ?"0":subVal.showCoverPic)+"'>"+
                        "<span><p class='informationTitle' style='width: 200px; word-wrap:break-word;'>"+subVal.title+"</p></span>"+
                        "<img src='data/material/"+subVal.imageUrl+"' width='80px' height='80px'>"+
                        "<div class='appmsg_edit_mask'>"+
                        "<a class='editSubNews'><i class='icon18_common edit_gray'></i></a>"+
                        "<a style='margin-left:20px;' class='deleteSubNews'><i class='icon18_common del_gray'></i></a>"+
                        "</div>"+
                        "<input type='hidden' value='"+subVal.contents+"'>"+
                        "</div>";
                });

                $('.mainViews').after(html);

                $('.editMainNews').click();
            },error: function(data) {
                alert("提交失败");
            }
        });
    }
})