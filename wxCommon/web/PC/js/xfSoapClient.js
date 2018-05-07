/*****************************************************************************\

 Javascript "XFire SOAP Client" library

 @version: 1.0 - 2012.8.10
 @author: Zhangke - zhangke.jn@gmail.com

\*****************************************************************************/
function SOAPClientParameters()
{
	var _pl = new Array();
	this.add = function(name, value)
	{
		_pl[name] = value;
		return this;
	}
	this.toXml = function()
	{
		var xml = "";
		for(var p in _pl)
		{
			switch(typeof(_pl[p]))
			{
                case "string":
                case "number":
                case "boolean":
                case "object":
                    xml += "<web:"+p+">" + SOAPClientParameters._serialize(_pl[p]) + "</web:"+p+">";
                    break;
                default:
                    break;
            }
		}
		return xml;
	}
}
SOAPClientParameters._serialize = function(o)
{
    var s = "";
    switch(typeof(o))
    {
        case "string":
            s += o.replace(/&/g, "&amp;").replace(/</g, "&lt;").replace(/>/g, "&gt;"); break;
        case "number":
        case "boolean":
            s += o.toString(); break;
        case "object":
            // Date
//            if(o.constructor.toString().indexOf("function Date()") > -1)
//            {
//
//                var year = o.getFullYear().toString();
//                var month = (o.getMonth() + 1).toString(); month = (month.length == 1) ? "0" + month : month;
//                var date = o.getDate().toString(); date = (date.length == 1) ? "0" + date : date;
//                var hours = o.getHours().toString(); hours = (hours.length == 1) ? "0" + hours : hours;
//                var minutes = o.getMinutes().toString(); minutes = (minutes.length == 1) ? "0" + minutes : minutes;
//                var seconds = o.getSeconds().toString(); seconds = (seconds.length == 1) ? "0" + seconds : seconds;
//                var milliseconds = o.getMilliseconds().toString();
//                var tzminutes = Math.abs(o.getTimezoneOffset());
//                var tzhours = 0;
//                while(tzminutes >= 60)
//                {
//                    tzhours++;
//                    tzminutes -= 60;
//                }
//                tzminutes = (tzminutes.toString().length == 1) ? "0" + tzminutes.toString() : tzminutes.toString();
//                tzhours = (tzhours.toString().length == 1) ? "0" + tzhours.toString() : tzhours.toString();
//                var timezone = ((o.getTimezoneOffset() < 0) ? "+" : "-") + tzhours + ":" + tzminutes;
//                s += year + "-" + month + "-" + date + "T" + hours + ":" + minutes + ":" + seconds + "." + milliseconds + timezone;
//            }
//            // Array
//            else if(o.constructor.toString().indexOf("function Array()") > -1)
//            {
//                for(var p in o)
//                {
//                    if(!isNaN(p))   // linear array
//                    {
//                        (/function\s+(\w*)\s*\(/ig).exec(o[p].constructor.toString());
//                        var type = RegExp.$1;
//                        switch(type)
//                        {
//                            case "":
//                                type = typeof(o[p]);
//                            case "String":
//                                type = "string"; break;
//                            case "Number":
//                                type = "int"; break;
//                            case "Boolean":
//                                type = "bool"; break;
//                            case "Date":
//                                type = "DateTime"; break;
//                        }
//                        s += "<" + type + ">" + SOAPClientParameters._serialize(o[p]) + "</" + type + ">"
//                    }
//                    else    // associative array
//                        s += "<" + p + ">" + SOAPClientParameters._serialize(o[p]) + "</" + p + ">"
//                }
//            }
            // Object or custom function
//            else
                for(var p in o)
                    s += "<" + p + ">" + SOAPClientParameters._serialize(o[p]) + "</" + p + ">";
            break;
        default:
            break; // throw new Error(500, "SOAPClientParameters: type '" + typeof(o) + "' is not supported");
    }
    return s;
}

function SOAPClient() {}

SOAPClient.request = function(url, method, parameters, callback,callback_error)
{
	var req={
            type:"post",
            contentType:"text/xml;charset=utf-8",
            url:url,
            data:getPostData(method,parameters),
            timeout:5000,
            async:true,
            dataType:'xml',
            success:function(xml){
                if(xml==null || xml==undefined)
                    return;
                var out;
                if(navigator.userAgent.indexOf("MSIE")>0){
                    out = xml.getElementsByTagName("ns1:out")[0];
                    if(out!=null && out.childNodes!=null){
                    	if(out.childNodes[0] == undefined || out.childNodes[0] == null) return;
                        var jsonStr = out.childNodes[0].nodeValue;
                        if(jsonStr == undefined || jsonStr == null) return;
                        callback(jsonStr);
                    }
                }else if(navigator.userAgent.indexOf("Chrome")>0){
                    out = xml.getElementsByTagName("out")[0];
                    if(out!=undefined && out.childNodes!=undefined){
                    	if(out.childNodes[0] == undefined || out.childNodes[0] == null) return;
                        var jsonStr = out.childNodes[0].nodeValue;
                        if(jsonStr == undefined || jsonStr == null) return;
                        callback(jsonStr);
                    }
                }else if(navigator.userAgent.indexOf("Safari")>0){
                    out = xml.getElementsByTagName("out")[0];
                    if(out!=undefined && out.childNodes!=undefined){
                    	if(out.childNodes[0] == undefined || out.childNodes[0] == null) return;
                        var jsonStr = out.childNodes[0].nodeValue;
                        if(jsonStr == undefined || jsonStr == null) return;
                        callback(jsonStr);
                    }
                }else if(navigator.userAgent.indexOf("Mozilla")>-1){
                	out = xml.documentElement;
                	if(out!=null && out.childNodes != null){
                		if(out.childNodes.item(0) == undefined || out.childNodes.item(0) == null) return;
                		var jsonStr = out.childNodes.item(0).textContent;
                		if(jsonStr == undefined || jsonStr == null) return;
                		callback(jsonStr);
                	}
                }
                //初始化select下拉选框
                var sel = $("select");
				$(sel).each(function(){
					var text = $(this).find("option:selected").text();
					$(this).parent().find(".ui-btn-text").find("span").html(text);//初始化下拉框的值
				});
				//初始化select下拉选框结束
            },
            error:function(er){
                //                callback_error(er);
            }
        };
    return req;
}

function getPostData(method,param)
{
	var postdata = "<soapenv:Envelope xmlns:soapenv=\"http://schemas.xmlsoap.org/soap/envelope/\" xmlns:web=\"http://webservice.hint4s.dcits.com\">";
    postdata +="<soapenv:Header/>";
    postdata +="<soapenv:Body>";
    postdata +="<web:";
    postdata += method;
    postdata +=">";
    postdata += param.toXml();
    postdata += "</web:";
    postdata += method;
    postdata += ">";
    postdata +="</soapenv:Body>";
    postdata +="</soapenv:Envelope>";
	return postdata;
}