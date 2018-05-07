
$(function () {

    var info = $.Params.create();
    info.ajax("member.action?hospitalCount",function(data){
        var x = new Array();
        var y = new Array();
        var html = "";
        $.each(data.rows,function(i,val){
        	var name=val.hospitalName;
        	var hospitalNum=parseInt(val.number);
        	if(name== ""){
        		name="未完善";
        	}
            x[i] = name;
            y[i] = hospitalNum;
            html+="<tr><td>"+name+"</td>" +
                "<td>"+hospitalNum+"</td></tr>";
        });

        $('#container').highcharts({
            chart: {
                type: 'column'
            },
            title:{
                text: '会员预约医院统计'
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

