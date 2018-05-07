$(function() {
	var id = GetQueryString("id");
	var p = $.Params.create();
	p.addParams("idlist", id);
	var html = "";
	var line = 0;
	html += "<div class='span7 print'  style='margin-left:0px' ><table class='table labelprint'>"
			+ "<tr><td>"
			+ "<label class='control-label' for='firstName' style='margin-top:10px'>资产名称</label>	"
			+ "<div class='controls'>"
			+ "<input type='text' id='firstName' class='m-wrap span12' name='assetName' value='笔记本'>"
			+ "</div></td>"
			+ "<td><label class='control-label' for='firstName' style='margin-top:10px'>资产编码</label>"
			+ "<div class='controls'>"
			+ "<input type='text' id='firstName' class='m-wrap span12' name='assetNo'  value='10010'>"
			+ "<input type='hidden' id='firstName1' class='m-wrap span12' name='assetNo1'  value='10010'>"
			+ "</div></td></tr>"
			+ "<tr><td colspan='2'><label class='control-label' for='firstName' style='margin-top:10px'>资产来源</label>"
			+ "<div class='controls'><input type='text' id='firstName' class='m-wrap span12'   name='assetSource' value='济南'>"
			+ "</div></td></tr>"
			+ "<tr><td colspan='2'><label class='control-label' for='firstName' style='margin-top:10px'>资产属性</label>"
			+ "<div class='controls'><input type='text' id='firstName' class='m-wrap span12'   name='assetAttribute' value='固定资产' >"
			+ "</div></td></tr>"
			+ "<tr><td colspan='2'><label class='control-label' for='firstName' style='margin-top:10px'>规格型号</label>"
			+ "<div class='controls'><input type='text' id='firstName' class='m-wrap span12'  name='specifications' value='个'>"
			+ "</div></td></tr>"
			+ "<tr><td colspan='2'><label class='control-label' for='firstName' style='margin-top:10px'>制造厂商</label>"
			+ "<div class='controls'><input type='text' id='firstName' class='m-wrap span12' name='manufacturer' value='联想'>"
			+ "</div></td></tr>"
			+ "<tr><td colspan='2'><label class='control-label' for='firstName' style='margin-top:10px'>保管部门</label>"
			+ "<div class='controls'><input type='text' id='firstName' class='m-wrap span12' name='custodyDepartment' value='厂家'></div>"
			+ "</td></tr>"
			+ "<tr><td colspan='2'><label class='control-label' for='firstName' style='margin-top:10px'>保管人</label>"
			+ "<div class='controls'><input type='text' id='firstName' class='m-wrap span12' name='custodian' value='李伟'></div>"
			+ "</td></tr>"
			+ "<tr><td><label class='control-label' for='firstName' style='margin-top:10px'>购置日期</label>	<div class='controls'>"
			+"<input type='text' id='firstName' class='m-wrap span12' value=''  name='startUseDate'></div></td>"
			+ "<td rowspan='2' style='text-align:right;'><img src='data/3.png'> </td></tr>"
			+ "<tr><td><label class='control-label' for='firstName' style='margin-top:10px'>检定周期</label>"
			+ "<div class='controls'><input type='text' id='firstName' class='m-wrap span12' name='verificationPeriod' value=''></div>"
			+ "</td></tr>"
			+ "<tr><td><label class='control-label' for='firstName' style='margin:5px' style='margin-top:10px'>是否计量器具</label>"
			+ "<div class='controls'>"
			+"<input type='text' id='firstName' class='m-wrap span12' name='isMeasure' value='否'>"
			+ "</div>"
			+ "</td>"
			+ "<td><label class='control-label' for='firstName' style='margin-top:10px'>计具编号</label>"
			+ "<div class='controls'><input type='text' id='firstName' class='m-wrap span12' name='oldMeasureNo' value=''></div>"
			+ "</td></tr>" + "</table></div>"
	// p.ajax("asset.action?getMore",function (data)
	// {
	// $.each(data.rows,function(i,val){
	// html+="<div class='span7 print' style='margin-left:0px' ><table
	// class='table labelprint'>" +
	// "<tr><td>"+
	// "<label class='control-label' for='firstName'
	// style='margin-top:10px'>资产名称</label> "+
	// "<div class='controls'>" +
	// "<input type='text' id='firstName' class='m-wrap span12' name='assetName'
	// value='"+val.assetName+"'>" +
	// "</div></td>"+
	// "<td><label class='control-label' for='firstName'
	// style='margin-top:10px'>资产编码</label>"+
	// "<div class='controls'>"+
	// "<input type='text' id='firstName' class='m-wrap span12' name='assetNo'
	// value='"+val.assetNo+"'>"+
	// "<input type='hidden' id='firstName1' class='m-wrap span12'
	// name='assetNo1' value='"+val.assetNo+"'>"+
	// "</div></td></tr>"+
	// "<tr><td colspan='2'><label class='control-label' for='firstName'
	// style='margin-top:10px'>资产来源</label>"+
	// "<div class='controls'><input type='text' id='firstName' class='m-wrap
	// span12' name='assetSource' value='"+val.assetSourceName+"'>"+
	// "</div></td></tr>"+
	// "<tr><td colspan='2'><label class='control-label' for='firstName'
	// style='margin-top:10px'>资产属性</label>"+
	// "<div class='controls'><input type='text' id='firstName' class='m-wrap
	// span12' name='assetAttribute' value='"+val.assetAttributeName+"' >"+
	// "</div></td></tr>"+
	// "<tr><td colspan='2'><label class='control-label' for='firstName'
	// style='margin-top:10px'>规格型号</label>"+
	// "<div class='controls'><input type='text' id='firstName' class='m-wrap
	// span12' name='specifications' value='"+val.specifications+"'>"+
	// "</div></td></tr>"+
	// "<tr><td colspan='2'><label class='control-label' for='firstName'
	// style='margin-top:10px'>制造厂商</label>"+
	// "<div class='controls'><input type='text' id='firstName' class='m-wrap
	// span12' name='manufacturer' value='"+val.manufacturer+"'>"+
	// "</div></td></tr>"+
	// "<tr><td colspan='2'><label class='control-label' for='firstName'
	// style='margin-top:10px'>保管部门</label>"+
	// "<div class='controls'><input type='text' id='firstName' class='m-wrap
	// span12' name='custodyDepartment'
	// value='"+val.custodyDepartmentName+"'></div>" +
	// "</td></tr>"+
	// "<tr><td colspan='2'><label class='control-label' for='firstName'
	// style='margin-top:10px'>保管人</label>"+
	// "<div class='controls'><input type='text' id='firstName' class='m-wrap
	// span12' name='custodian' value='"+val.custodian+"'></div>" +
	// "</td></tr>"+
	// "<tr><td><label class='control-label' for='firstName'
	// style='margin-top:10px'>购置日期</label> <div class='controls'>";
	// if(val.startUseDate==null)
	// {
	// html+= "<input type='text' id='firstName' class='m-wrap span12' value=''
	// name='startUseDate'></div></td>";
	// }else
	// {
	// html+= "<input type='text' id='firstName' class='m-wrap span12'
	// value='"+val.startUseDate+"' name='startUseDate'></div></td>";
	// }
	//
	// html+= "<td rowspan='2' style='text-align:right;'><img src='data/3.png'>
	// </td></tr>"+
	// "<tr><td><label class='control-label' for='firstName'
	// style='margin-top:10px'>检定周期</label>";
	// if(val.verificationPeriodName==null )
	// {
	// html+= "<div class='controls'><input type='text' id='firstName'
	// class='m-wrap span12' name='verificationPeriod' value=''></div>"
	// }else
	// {
	// html+= "<div class='controls'><input type='text' id='firstName'
	// class='m-wrap span12' name='verificationPeriod'
	// value='"+val.verificationPeriodName+"'></div>"
	// }
	// html+= "</td></tr>"+
	// "<tr><td><label class='control-label' for='firstName' style='margin:5px'
	// style='margin-top:10px'>是否计量器具</label>"+
	// "<div class='controls'>";
	// if(val.isMeasure==0)
	// {
	// html+= "<input type='text' id='firstName' class='m-wrap span12'
	// name='isMeasure' value='否'>"
	// }else
	// {
	// html+= "<input type='text' id='firstName' class='m-wrap span12'
	// name='isMeasure' value='是'>"
	// }
	// html+= "</div>" +
	// "</td>"+
	// "<td><label class='control-label' for='firstName'
	// style='margin-top:10px'>计具编号</label>";
	// if(val.oldMeasureNo==null)
	// {
	// html+= "<div class='controls'><input type='text' id='firstName'
	// class='m-wrap span12' name='oldMeasureNo' value=''></div>" ;
	// }else
	// {
	// html+= "<div class='controls'><input type='text' id='firstName'
	// class='m-wrap span12' name='oldMeasureNo'
	// value='"+val.oldMeasureNo+"'></div>" ;
	// }
	//			 
	// html+= "</td></tr>"+
	// "</table></div>"
	// line=i+1;
	// $("#line").html(line);
	// });
	// $("#loading").hide();
	// $("#printDiv").html(html);
	// });
    // $("#printDiv").html(html);
	/**
	 * 返回按钮
	 */
	$("#fanhui").click(function() {
		history.go(-1);
	});
	/**
	 * 打印
	 */
	$("#print").click(function() {
		// $("#print").attr("disabled","true")
			var params = $("#editform").serialize();
			$.ajax( {
				dataType : "json",
				type : "post",
				url : "print.action?print",
				data : params,
				success : function(data) {

				}
			});
		});

});
