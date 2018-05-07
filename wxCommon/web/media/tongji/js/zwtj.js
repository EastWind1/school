
$(function () {

    var info = $.Params.create();
    info.ajax("member.action?tjjobTitleUsers",function(data){
        var x = new Array();
        var y = new Array();
        var html = "";
        $.each(data.rows,function(i,val){
        	var jobTitle=val.jobTitle;
        	var num=parseInt(val.number);
        	if(jobTitle== ""){
        		jobTitle="未完善";
        	}
            x[i] = jobTitle;
            y[i] = num;
            html+="<tr><td>"+jobTitle+"</td>" +
                "<td>"+num+"</td></tr>";
        });

        $('#container').highcharts({
            chart: {
                type: 'column'
            },
            title:{
                text: '职位统计'
            },
            xAxis: {
                categories:x,
                title: {
                    text: '职位名称'
                }
            },
            yAxis: {
                min: 0,
                title: {
                    text: '数量'
                }
            },
            series: [{
                name: '数量',
                data: y
            }]
        });

        $('#tbodys').html(html);
        App.init();
        TableAdvanced.init();

    },function(){

    })



});

