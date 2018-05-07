
$(function () {

    var info = $.Params.create();
    info.ajax("memberOrder.action?orderCount",function(data){
        var x = new Array();
        var y = new Array();
        var html = "";
        $.each(data.rows,function(i,val){
        	var Title=val.filed3;
        	var orderCount=parseInt(val.orderCount);
        	if(Titlt= ""){
        		Title="未完善";
        	}
            x[i] = Title;
            y[i] = orderCount;
            html+="<tr><td>"+Title+"</td>" +
                "<td>"+orderCount+"</td></tr>";
        });

        $('#container').highcharts({
            chart: {
                type: 'column'
            },
            title:{
                text: '预约专家人数统计'
            },
            xAxis: {
                categories:x,
                title: {
                    text: '专家姓名'
                }
            },
            yAxis: {
                min: 0,
                title: {
                    text: '预约人数'
                }
            },
            series: [{
                name: '预约人数',
                data: y
            }]
        });

        $('#tbodys').html(html);
        App.init();
        TableAdvanced.init();

    },function(){

    })



});

