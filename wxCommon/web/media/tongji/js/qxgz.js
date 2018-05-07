
$(function () {

    var info = $.Params.create();
    info.ajax("wxUsers.action?tjqgwxUsers",function(data){
        var x = new Array();
        var y = new Array();
        var html = "";
        $.each(data.rows,function(i,val){
        	var dateTime=val.dateTime;
        	var num=parseInt(val.number);
//            if(dateTime == "2015-05-22" || dateTime == "2015-05-23" || dateTime == "2015-05-24"){
//            	num=num+144;
//            }
//            if( dateTime == "2015-05-25"){
//            	num=num+116;
//            }
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
                text: '取消关注人数统计'
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
                    text: '取消人数'
                }
            },
            series: [{
                name: '取消人数',
                data: y
            }]
        });

        $('#tbodys').html(html);
        App.init();
        TableAdvanced.init();

    },function(){

    })



});

