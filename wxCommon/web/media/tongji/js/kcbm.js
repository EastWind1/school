
$(function () {

    var info = $.Params.create();
    info.ajax("course.action?list",function(data){
        var x = new Array();
        var y = new Array();
        var html = "";
        $.each(data.rows,function(i,val){
        	var Title=val.title;
        	var signNum=parseInt(val.signNum);
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
                text: '课程名称统计'
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
                    text: '报名人数'
                }
            },
            series: [{
                name: '报名人数',
                data: y
            }]
        });

        $('#tbodys').html(html);
        App.init();
        TableAdvanced.init();

    },function(){

    })



});

