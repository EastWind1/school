/**
 */
$(function(){


    loadData();

//    $('.news-blocks').delegate('#addSingleNews','click',function(){
//        ParamJson['informationId'] = "";
//        load("media/material/singleNews.jsp");
//    });
//
//
//    $('.news-blocks').delegate('#addManyNews','click',function(){
//        ParamJson['informationId'] = "";
//        load("media/material/manyNews.jsp");
//    });



})

function loadData(){

    var info= $.Params.create();
    info.addParams("brandId",brandId);
    info.ajax("material.action?getAllMaterial",function(data){
        $('#newsCount').html(data.rows.length);
        $('#col1').html("");

        $('#col2').html("");

        $('#col3').html("");

        if(data.rows.length == 0){
            var html = "<div class='news-blocks'>"+
                "<div class='create_access' style='margin-bottom: 20px'>"+
                "<span>"+
                "<a id='addSingleNews' data-toggle='tooltip' data-placement='bottom' title='添加单图文消息'><i class='icon_appmsg_create'></i><strong>单图文消息</strong></a>"+
                "<a id='addManyNews' data-toggle='tooltip' data-placement='bottom' title='添加多图文消息'><i class='icon_appmsg_create multi'></i><strong>多图文消息</strong></a>"+
                "</span>"+
                "</div>"+
                "</div>";
            $('#col1').append(html);
        }
        $.each(data.rows,function(i,val){
            var html = "";


            if(i == 0){
                html += "<div class='news-blocks'>"+
                    "<div class='create_access' style='margin-bottom: 20px'>"+
                    "<span>"+
                    "<a id='addSingleNews' data-toggle='tooltip' data-placement='bottom' title='添加单图文消息'><i class='icon_appmsg_create'></i><strong class='singleTitle'>单图文消息</strong></a>"+
                    "<a id='addManyNews' data-toggle='tooltip' data-placement='bottom' title='添加多图文消息'><i class='icon_appmsg_create multi'></i><strong class='mutiTitle'>多图文消息</strong></a>"+
                    "</span>"+
                    "</div>"+
                    "</div>";
            }

            if(val.materialSub.length <= 0){
                html += "<div class='news-blocks'>"+
                    "<div class='views'>"+
                    "<p class='title'>"+val.title+"</p>"+
                    "<p class='createTime'>"+converTime(val.createTime)+"</p>"+
                    "<img style='width:296px; height: 160px;' src='data/material/"+val.imageUrl+"'>"+
                    "<p class='description'>"+val.digest+"</p>"+
                    "</div>"+

                    "<div class='bottom1'>"+
                    "<div class='span6 editButton'>"+
                    "<a class='editButtonTip' data-toggle='tooltip' data-placement='bottom' title='编辑' onclick=\"editData(\'"+val.pkid+"\',\'singleNews"+"\')\"><i class='icon18_common edit_gray'></i></a>"+
                    "</div>"+
                    "<div class='span6 deleteButton'>"+
                    "<a data-toggle='tooltip' data-placement='bottom' title='删除'  class='deleteButton' onclick=\"confirmDelete(\'"+val.pkid+"\')\" ><i class='icon18_common del_gray'></i></a>"+
                    "</div>"+
                    "</div>"+
                    "</div>";
            }else{
                html+="<div class='news-blocks' style='margin-bottom: 20px;'>"+
                    "<div class='views'>"+
                    "<p class='createTime'>"+converTime(val.createTime)+"</p>"+
                    "<img style='width:296px; height: 160px;' src='data/material/"+val.imageUrl+"' >"+
                    "<div class='manyNewsImageMask'><p>"+val.title+"</p></div>"+
                    "</div>";
                $.each(val.materialSub,function(i,subVal){
                    html+="<div class='subViews'>"+
                        "<img src='data/material/"+subVal.imageUrl+"'>"+
                        "<p>"+subVal.title+"</p>"+
                        "</div>";
                });
                html+="<div class='bottom1'>"+
                    "<div class='span6 editButton'>"+
                    "<a class='editButtonTip' data-toggle='tooltip' data-placement='bottom' title='编辑' onclick=\"editData(\'"+val.pkid+"\',\'manyNews"+"\')\"><i class='icon18_common edit_gray'></i></a>"+
                    "</div>"+
                    "<div class='span6 deleteButton'>"+
                    "<a data-toggle='tooltip' data-placement='bottom' title='删除'  class='deleteButton' onclick=\"confirmDelete(\'"+val.pkid+"\')\" ><i class='icon18_common del_gray'></i></a>"+
                    "</div>"+
                    "</div>"+
                    "</div>";
            }
            if(i%3 == 0){
                $('#col1').append(html);
            }else if(i%3 == 1){
                $('#col2').append(html);
            }else if(i%3 == 2){
                $('#col3').append(html);
            }
        });

        $('.editButtonTip').tooltip();

        $('.deleteButton').tooltip();

        $('.addButton').tooltip();


        $('#addSingleNews').on('click',function(){
            window.location.href = getIP()+"media/weixin/singleNews.jsp";
        })

        $('#addManyNews').on('click',function(){
            window.location.href = getIP()+"media/weixin/manyNews.jsp";
        })


    },function(data){
        alert("加载数据失败");
    });
}

function converTime(time){
    var str = time.replace(/-/g,"/");
    var oldDate = new Date(str);
    var nowDate = new Date();

    if(oldDate.getFullYear() < nowDate.getFullYear()){
        return oldDate.Format("yyyy年MM月dd日");
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




function confirmDelete(pkid){
    $('#confirmDelete').modal();
    $('#sureDelete').on('click',function(){
        deleteData(pkid);
    })
}




function deleteData(pkid){
    var info= $.Params.create();
    info.addParams("id",pkid);
    info.ajax("material.action?delete",function(data){
        loadData();
    },function(){
        alert("删除失败");
    });
}


function editData(pkid,type){
    if(type == "singleNews"){
        window.location.href = getIP()+'media/weixin/singleNews.jsp?informationId='+pkid;
    }else{
        window.location.href = getIP()+'media/weixin/manyNews.jsp?informationId='+pkid;
    }
}