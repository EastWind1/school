
$(function () {

    var pkid = getQueryString("informationId") ;

    var ue = UE.getEditor('contents');

    $('#file_upload').uploadify({
        'swf': 'media/weixin/js/uploadify.swf',    //指定上传控件的主体文件
        'uploader': getIP()+'util/uploadFile.action',    //指定服务器端上传处理文件

        //其他配置项
        width: 108,                          // 按钮的宽度
        height: 32,                         // 按钮的高度
//        'buttonClass':'uploadBtn',
        'buttonText': "上传",                 // 按钮上的文字
        'buttonImage' : 'media/images/uploadBtn.png',
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
            $('#fileImage').attr('src', "data/material/" + object.imageUrl);

            $('#imageUrl').val(object.imageUrl);

            $('#thumbnailImage').attr('src', "data/material/" + object.imageUrl);
            $('#imageShowDiv').show();
            $('.editDiv').height($('.editDiv').height()+100);
        }
    });


    //图片上传成功之后 可以删除图片
    $('#deleteImage').on('click', function () {
        $('#imageShowDiv').hide();
        $('#thumbnailImage').attr('src', "media/images/newsDefault.jpg");
        $.ajax({
            type: "POST",
            url:getIP()+"util/deleteFile.action",
            data:{imageUrl:$('#imageUrl').val()},// 你的formid
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
        //删除隐藏域
        $('#imageUrl').val("");
        //
        $('#fileImage').attr('src', "");
    });

    //及时监听标题输入框
    $("#title").bind('input propertychange', function () {
        if ($("#title").val() == "") {
            $("#titleP").html("标题");
        } else {
            $("#titleP").html($("#title").val());
        }

    })

    //及时监听摘要输入框
    $("#digest").bind('input propertychange', function () {
        $("#descriptionP").html($("#digest").val());
    })


    //添加摘要按钮
    $("#addDigest").bind("click", function () {
        $(this).hide();
        $("#digest").parent().parent().removeClass("hide");
        $('.editDiv').height($('.editDiv').height()+100);
    })


    //添加原文链接
    $('#addContentSourceUrl').bind("click",function(){
        $(this).hide();
        $('#contentSourceUrl').parent().parent().removeClass("hide");
    })


    //是否显示封面
    $('input[type=checkbox]').on("click",function(){
        var that = $('#showCoverPic');
        if(that.val() == "0"){

            that.val("1");
        }else if(that.val() == "1"){
            that.val("0");
        }
    })



    //保存按钮
    $('#save').on('click',function(){

        if($('#imageUrl').val() == ""){
            alert("必须插入一张图片");
            return;
        }
        if(ue.getContent() == ""){
            alert("正文内容不能为空或多于20000字");
            return;
        }

        $.ajax({
            type: "POST",
            url:getIP()+"material.action?add",
            data:$('#form').serialize(),
            async:false,
            success: function(data) {
                if(data.success){
                    alert("保存成功");
                    window.location.href =  "media/weixin/material1.jsp";
                }else{
                    alert("保存失败");
                }
            },error: function(data) {
                alert("提交失败");
            }
        });
    });


    ue.addListener("ready", function () {
        // editor准备好之后才可以使用
        loadData();
    });


    function loadData(){
        if(pkid != undefined && pkid !=null && pkid !=""){
            $.ajax({
                type: "POST",
                url:getIP()+"material.action?list",
                data:{pkid:pkid},
                success: function(data) {
                    var val = data.rows[0];
                    $('#pkid').val(pkid);
                    $('#title').val(val.title);
                    $('#titleP').html(val.title);
                    $('#author').val(val.author);


                    //图片赋值
                    $('#fileImage').attr('src', "data/material/" + val.imageUrl);
                    $('#imageUrl').val(val.imageUrl);

                    $('#thumbnailImage').attr('src', "data/material/" + val.imageUrl);
                    $('#imageShowDiv').show();
                    $('.editDiv').height($('.editDiv').height()+100);

                    //摘要
                    $('#addDigest').hide();
                    $("#digest").parent().parent().removeClass("hide");
                    $('.editDiv').height($('.editDiv').height()+100);
                    $('#digest').val(val.digest);
                    $("#descriptionP").html(val.digest);
//                //正文
                    ue.setContent(val.contents);
                    //原文链接
                    $('#addContentSourceUrl').hide();
                    $('#contentSourceUrl').parent().parent().removeClass("hide");
                    $('#contentSourceUrl').val(val.contentSourceUrl);

                    if(val.showCoverPic == "0"){
                        $('input[type=checkbox]').val(val.showCoverPic);
                        $('input[type=checkbox]').parent().removeClass("checked");
                    }else if(val.showCoverPic == "1"){
                        $('input[type=checkbox]').val(val.showCoverPic);
                        $('input[type=checkbox]').parent().addClass("checked");
                    }else if(val.showCoverPic == null || val.showCoverPic == ""){
                        ('input[type=checkbox]').val("0");
                        $('input[type=checkbox]').parent().remove("checked");
                    }

                },error: function(data) {
                    alert("提交失败");
                }
            });
        }
    }

})