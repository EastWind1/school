
$(function () {

    var info = $.Params.create();
    info.ajax("courseDb.action?list",function(data){
        var x = new Array();
        var y = new Array();
        var html = "";
        $.each(data.rows,function(i,val){
        	var zanTitle=val.title;
        	var zanNum=parseInt(val.zanNum);
        	if(zanTitle== ""){
        		zanTitle="未完善";
        	}
            x[i] = zanTitle;
            y[i] = zanNum;
            html+="<tr><td>"+zanTitle+"</td>" +
                "<td>"+zanNum+"</td></tr>";
        });

        $('#container').highcharts({
            chart: {
                type: 'column'
            },
            title:{
                text: '课程点赞统计'
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
                    text: '点赞人数'
                }
            },
            series: [{
                name: '点赞人数',
                data: y
            }]
        });

        $('#tbodys').html(html);
        App.init();
        TableAdvanced.init();

    },function(){

    })



});

