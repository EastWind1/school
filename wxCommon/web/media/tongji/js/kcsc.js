
$(function () {

    var info = $.Params.create();
    info.ajax("courseDb.action?list",function(data){
        var x = new Array();
        var y = new Array();
        var html = "";
        $.each(data.rows,function(i,val){
        	var collectTitle=val.title;
        	var collectNum=parseInt(val.collectNum);
        	if(collectTitle== ""){
        		collectTitle="未完善";
        	}
            x[i] = collectTitle;
            y[i] = collectNum;
            html+="<tr><td>"+collectTitle+"</td>" +
                "<td>"+collectNum+"</td></tr>";
        });

        $('#container').highcharts({
            chart: {
                type: 'column'
            },
            title:{
                text: '课程收藏统计'
            },
            xAxis: {
                categories:x,
                title: {
                    text: '课程名称'
                }
            },
            yAxis: {
                min: 0,
                title: {
                    text: '收藏人数'
                }
            },
            series: [{
                name: '收藏人数',
                data: y
            }]
        });

        $('#tbodys').html(html);
        App.init();
        TableAdvanced.init();

    },function(){

    })



});

