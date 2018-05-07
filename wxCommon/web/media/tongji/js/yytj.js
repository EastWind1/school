
$(function () {

    var info = $.Params.create();
    info.ajax("member.action?tjhospitalNameUsers",function(data){
        var x = new Array();
        var y = new Array();
        var html = "";
        $.each(data.rows,function(i,val){
        	var hospitalName=val.hospitalName;
        	var num=parseInt(val.number);
        	if(hospitalName== ""){
        		hospitalName="未完善";
        	}
            x[i] = hospitalName;
            y[i] = num;
            html+="<tr><td>"+hospitalName+"</td>" +
                "<td>"+num+"</td></tr>";
        });

        $('#container').highcharts({
            chart: {
                type: 'column'
            },
            title:{
                text: '医院统计'
            },
            xAxis: {
                categories:x,
                title: {
                    text: '医院名称'
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

