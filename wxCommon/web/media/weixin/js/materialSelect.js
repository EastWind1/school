/**
 * Created by 栋 on 2014/7/8.
 */
$(function () {

    $('.tooltips').tooltip();

    $('.tooltips').on("click", function () {
        $('.tooltips > i').removeClass("active");
        $(this).children().addClass("active");

        var type = $(this).attr("type");
        if (type == "5") {
            $('#myModal3').modal().css({
                width: 'auto',
                'margin-left': function () {
                    return -($(this).width() / 2) - 20;
                }
            });
//            $('#newsSelected').css("height","auto !important");
//            $('#newsSelected').css("height","218px");
//            $('#newsSelected').css("min-height","218px");
        }else{
//            $('#newsSelected').html("功能正在开发中,稍等哦亲");
//            $('#newsSelected').height(100);
        }
    });


    $('#myModal3').on('hidden.bs.modal', function (e) {
        if($('#newsSelected').children().length > 0){
            $('#newsSelected').css("height","auto");
        }else{
            $('#newsSelected').css("height","218px");
        }
    })

    //选择图文之后 点击保存
    $('#sure').on('click', function () {
        var informationPkid = $(document).find("div.news-blocks[selected=selected]").attr("pkid");
        var type = $(document).find("div.news-blocks[selected=selected]").attr("type");
        var html = "";
        //赋值给隐藏域
        $('#informationPkid').val(informationPkid);

        var info = $.Params.create();

        info.addParams("parentId",informationPkid);
        info.addParams("brandId",brandId);
        info.ajax("material.action?getAllMaterial", function (data) {
            var val = data.rows[0];
            var html = "";
            if (val.materialSub.length <= 0) {
                html += "<div class='news-blocks' style='width: 296px; margin: 20px;' pkid='"+val.pkid+"' >" +
                    "<div class='views'>" +
                    "<p class='title'>" + val.title + "</p>" +
                    "<p class='createTime'>" + converTime(val.createTime) + "</p>" +
                    "<img style='width:296px; height: 160px;' src='data/material/" + val.imageUrl + "'>" +
                    "<p class='description'>" + val.digest + "</p>" +
                    "</div>" +
                    "<div class='mask'></div>" +
                    "<div class='selected'><i class='icon-ok icon-4x' style='color: #ffffff'></i></div>" +
                    "</div>";
            } else {
                html += "<div class='news-blocks' style='width: 296px; margin: 20px;'  pkid='"+val.pkid+"'>" +
                    "<div class='views'>" +
                    "<p class='createTime'>" + converTime(val.createTime) + "</p>" +
                    "<img style='width:296px; height: 160px;' src='data/material/" + val.imageUrl + "' >" +
                    "<div class='manyNewsImageMask'><p>" + val.title + "</p></div>" +
                    "</div>";
                $.each(val.materialSub, function (i, subVal) {
                    html += "<div class='subViews'>" +
                        "<img src='data/material/" + subVal.imageUrl + "'>" +
                        "<p>" + subVal.title + "</p>" +
                        "</div>";
                });
                html += "<div class='mask'></div>" +
                    "<div class='selected'><i class='icon-ok icon-4x' style='color: #ffffff'></i></div>" +
                    "</div>";
            }

            $('#newsSelected').html(html);
        });
    });


    loadData();
})

function loadData() {
    var info = $.Params.create();
    info.addParams("brandId", brandId);
    info.ajax("material.action?getAllMaterial", function (data) {
        $('#newsCount').html(data.rows.length);
        $.each(data.rows, function (i, val) {
            var html = "";
            if (val.materialSub.length <= 0) {
                html += "<div class='news-blocks' pkid='"+val.pkid+"' type='singleNews'>" +
                    "<div class='views'>" +
                    "<p class='title'>" + val.title + "</p>" +
                    "<p class='createTime'>" + converTime(val.createTime) + "</p>" +
                    "<img style='width:296px; height: 160px;' src='data/material/" + val.imageUrl + "'>" +
                    "<p class='description'>" + val.digest + "</p>" +
                    "</div>" +
                    "<div class='mask'></div>" +
                    "<div class='selected'><i class='icon-ok icon-4x' style='color: #ffffff;'></i></div>" +
                    "</div>";
            } else {
                html += "<div class='news-blocks'  pkid='"+val.pkid+"'  type='manyNews'>" +
                    "<div class='views'>" +
                    "<p class='createTime'>" + converTime(val.createTime) + "</p>" +
                    "<img style='width:296px; height: 160px;' src='data/material/" + val.imageUrl + "' >" +
                    "<div class='manyNewsImageMask'><p>" + val.title + "</p></div>" +
                    "</div>";
                $.each(val.materialSub, function (i, subVal) {
                    html += "<div class='subViews'>" +
                        "<img src='data/material/" + subVal.imageUrl + "'>" +
                        "<p>" + subVal.title + "</p>" +
                        "</div>";
                });
                html += "<div class='mask'></div>" +
                    "<div class='selected'><i class='icon-ok icon-4x' style='color: #ffffff;'></i></div>" +
                    "</div>";
            }

            if (i % 2 == 0) {
                $('#col1').append(html);
            } else if (i % 2 == 1) {
                $('#col2').append(html);
            }
        });

        $('.news-blocks').mouseenter(function () {
            $(this).find('div.mask').show();
        });

        $('.news-blocks').mouseleave(function () {
            $(this).find('div.mask').hide();
            if ($(this).attr("selected") == "selected") {
                $(this).find('div.mask').show();
            }

        });

        $('.news-blocks').on('click', function () {
            $(document).find("div.news-blocks").removeAttr("selected");
            $(document).find("div.mask").hide();
            $(document).find("div.selected").hide();

            $(this).attr("selected", "yes");
            $(this).find('div.mask').show();
            $(this).find('div.selected').show();
        });


//        $('#myModal3').modal();

    }, function (data) {
        alert("error");
    });
}

function deleteData(pkid) {

    var info = $.Params.create();
    info.addParams("id", pkid);
    info.ajax("information.action?del", function (data) {
//        var html = "<div class='news-blocks'>"+
//            "<div class='viewsButton' style='margin-bottom: 20px'>"+
//            "<p>"+
//            "<a class='addButton' data-toggle='tooltip' data-placement='bottom' title='添加单图文消息'><i class='icon-picture icon-2x'></i></a>"+
//            "<a class='addButton' data-toggle='tooltip' data-placement='bottom' title='添加多图文消息'><i class='icon-picture icon-2x'></i></a>"+
//            "</p>"+
//            "</div>"+
//            "</div>";
//        $('#col1').html(html);
        $('.addButton').tooltip();
        $('#col2').html("");
        $('#col3').html("");
        loadData();
    }, function () {
        alert("删除失败");
    });
}

function converTime(time){
    var str = time.replace(/-/g,"/");
    var oldDate = new Date(str);
    var nowDate = new Date();

    if(oldDate.getFullYear() < nowDate.getFullYear()){
        return oldDate.format("yyyy年MM月dd日");
    }else if(oldDate.getFullYear() == nowDate.getFullYear()){
        if(oldDate.getMonth() == nowDate.getMonth() && oldDate.getDate() == nowDate.getDate()){
            return oldDate.Format("hh:mm");
        }else{
            return oldDate.Format("MM月dd日");
        }
    }
}

// 对Date的扩展，将 Date 转化为指定格式的String
// 月(M)、日(d)、小时(h)、分(m)、秒(s)、季度(q) 可以用 1-2 个占位符，
// 年(y)可以用 1-4 个占位符，毫秒(S)只能用 1 个占位符(是 1-3 位的数字)
// 例子：
// (new Date()).Format("yyyy-MM-dd hh:mm:ss.S") ==> 2006-07-02 08:09:04.423
// (new Date()).Format("yyyy-M-d h:m:s.S")      ==> 2006-7-2 8:9:4.18
Date.prototype.Format = function (fmt) { //author: meizz
    var o = {
        "M+": this.getMonth() + 1, //月份
        "d+": this.getDate(), //日
        "h+": this.getHours(), //小时
        "m+": this.getMinutes(), //分
        "s+": this.getSeconds(), //秒
        "q+": Math.floor((this.getMonth() + 3) / 3), //季度
        "S": this.getMilliseconds() //毫秒
    };
    if (/(y+)/.test(fmt)) fmt = fmt.replace(RegExp.$1, (this.getFullYear() + "").substr(4 - RegExp.$1.length));
    for (var k in o)
        if (new RegExp("(" + k + ")").test(fmt)) fmt = fmt.replace(RegExp.$1, (RegExp.$1.length == 1) ? (o[k]) : (("00" + o[k]).substr(("" + o[k]).length)));
    return fmt;
}