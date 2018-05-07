
$(function () {

    var info = $.Params.create();
    info.ajax("wxUsers.action?tjgzwxUsers",function(data){
        var x = new Array();
        var y = new Array();
        var html = "";
        $.each(data.rows,function(i,val){
        	var dateTime=val.dateTime;
        	var num=parseInt(val.number);
            x[i] = dateTime;
            y[i] = num;
            html+="<tr><td>"+dateTime+"</td>" +
                "<td>"+num+"</td></tr>";
        });

        $('#container').highcharts({
            chart: {
                type: 'column'
            },
            title:{
                text: '微信关注人数统计'
            },
            xAxis: {
                categories:x,
                title: {
                    text: '日期'
                }
            },
            yAxis: {
                min: 0,
                title: {
                    text: '关注人数'
                }
            },
            series: [{
                name: '关注人数',
                data: y
            }]
        });

        $('#tbodys').html(html);
        App.init();
        TableAdvanced.init();

    },function(){

    })



});

