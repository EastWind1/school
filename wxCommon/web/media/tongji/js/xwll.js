
$(function () {

    var info = $.Params.create();
    info.ajax("information.action?informationReadCount",function(data){
        var x = new Array();
        var y = new Array();
        var html = "";
        $.each(data.rows,function(i,val){
        	var Title=val.informationTitle;
        	var signNum=parseInt(val.number);
        	if(Title== ""){
        		Title="未完善";
        	}
            x[i] = Title;
            y[i] = signNum;
            html+="<tr><td>"+Title+"</td>" +
                "<td>"+signNum+"</td></tr>";
        });

        $('#container').highcharts({
            chart: {
                type: 'column'
            },
            title:{
                text: '新闻浏览统计'
            },
            xAxis: {
                categories:x,
                title: {
                    text: '新闻名称'
                }
            },
            yAxis: {
                min: 0,
                title: {
                    text: '浏览人数'
                }
            },
            series: [{
                name: '浏览人数',
                data: y
            }]
        });

        $('#tbodys').html(html);
        App.init();
        TableAdvanced.init();

    },function(){

    })



});

