/**
 * 时期格式化方法
 * @return
 */
Date.prototype.format = function(format){
    var o = {
        "M+" : this.getMonth()+1, //month
        "d+" : this.getDate(), //day
        "h+" : this.getHours(), //hour
        "m+" : this.getMinutes(), //minute
        "s+" : this.getSeconds(), //second
        "q+" : Math.floor((this.getMonth()+3)/3), //quarter
        "S" : this.getMilliseconds() //millisecond
    }

    if(/(y+)/.test(format)) {
        format = format.replace(RegExp.$1, (this.getFullYear()+"").substr(4 - RegExp.$1.length));
    }

    for(var k in o) {
        if(new RegExp("("+ k +")").test(format)) {
            format = format.replace(RegExp.$1, RegExp.$1.length==1 ? o[k] : ("00"+ o[k]).substr((""+ o[k]).length));
        }
    }
    return format;
}

/**
 * 获取当前时间
 */
function getNowDateTime(){
	var d = new Date();    
	return d.format("yyyy-MM-dd hh:mm:ss");
}

/**
 * 获取当前日期
 */
function getNowDate(){
	var d = new Date();    
	return d.format("yyyy-MM-dd");
}

function valPhone(phone){
    var isPhone=/^(?:13\d|15\d|18\d|17\d)\d{8}$/;
    return isPhone.test(phone);
}
function checkEmail(str){
   var re = /^(\w-*\.*)+@(\w-?)+(\.\w{2,})+$/
   if(re.test(str)){
	   return true;
   }else{
       return false;
   }
}

function getRandom(n){
    return Math.floor(Math.random()*n+1)
    }

function mm(a)
{
return /(\x0f[^\x0f]+)\x0f[\s\S]*\1/.test("\x0f"+a.join("\x0f\x0f") +"\x0f");
}
		
/**
 * 获取y轴数据
 */
function getdataY(arr1,arr2,arr3){
//	arr1:x轴日期
//	arr2:数据库获取的日期
//	arr3:数据库获取的y轴的值
	                                                                                            
	 var dataY=new Array();
	 for(var i=0;i<arr1.length;i++){
		 var data="";
		 for(var j=0;j<arr2.length;j++){
			 if(arr1[i] == arr2[j]){
				data=arr3[j];
			 }
		 }
		 if(data == ""){
			 dataY.push(0);
		 }else{
			 dataY.push(Number(data));
		 }
	 }
	 return dataY;
}



function GetQueryString(name)
{
    var reg = new RegExp("(^|&)"+ name +"=([^&]*)(&|$)");
    var r = window.location.search.substr(1).match(reg);
    if (r!=null) {
    	return unescape(r[2]);
    }else{
    	return null;
    }
}

/**
 * 获取选中数据
 */
function getcheckdata(){
	var params="";
	$("input[name='checkbox']").each(function(){
		var check=$(this).attr("checked");
		var id=$(this).attr("id");
		if(check == "checked"){
			params+=id+",";
		}
	})
	params=params.substring(0,params.length-1);
	return params;
}

function getcheckotherdata(){
	var paramT="";
	$("input[name='checkbox']").each(function(){
		var check=$(this).attr("checked");
		var memberId=$(this).attr("memberId");
		if(check == "checked"){
			paramT+=memberId+",";
		}
	})
	paramT=paramT.substring(0,paramT.length-1);
	return paramT;
}


function getUUID(){
	return Math.uuid();
}


/**
 * 获取选中数据json
 */
function getcheckdataJson(roleId){
	var params="[";
	$("input[name='checkbox']").each(function(){
		var check=$(this).attr("checked");
		var id=$(this).attr("id");
		if(check == "checked"){
			params+="{\"id\":\""+getUUID()+"\",\"roleId\":\""+roleId+"\",\"menuId\":\""+id+"\"},";
		}
	})
	params=params.substring(0,params.length-1);
	params+="]";
	return params;
}



/**
 * 重新查询页面清单数据后，全选复选框需要取消选中状态
 */
function cancelQueryCheckbox(){
	$("input[name='queryCheckbox']").removeAttr("checked");
    $("input[name='queryCheckbox']").parent().removeClass("checked");
}


$(function(){
	/**
	 * 全选事件
	 */
	$("#queryCheckbox").on('click',function(){
	    if ($("input[name='queryCheckbox']:checked").size() == 0) {
	        $("input[name='checkbox']").removeAttr("checked");
	        $("input[name='checkbox']").parent().removeClass("checked");
	    }else{
	        $("input[name='checkbox']").attr("checked",true);
	        $("input[name='checkbox']").parent().addClass("checked");
	    }
	})
})


//将从数据库中查询的数据，为空时显示暂无
function showValue(data){
	return data == null? "暂无": data;
}

//男女显示
function showSex(data){
	var sex;
	if(data == "1"){
		sex="男";
	}else if(data=="2"){
		sex="女";
	}else{
		sex="未填写";
	}
	return sex;
}

//根据日期计算年龄
function showAge(str){
	if(str == ""){
	 return "未完善"; 
	}else{
		var age;
	 var r=str.match(/^(\d{1,4})(-|\/)(\d{1,2})\2(\d{1,2})$/);     
     if(r==null)return false;     
     var d=new Date(r[1], r[3]-1, r[4]);     
     if(d.getFullYear()==r[1]&&(d.getMonth()+1)==r[3]&&d.getDate()==r[4]){   
           var Y = new Date().getFullYear();   
           age=(Y-r[1]);
           return age+"岁";
     }  
	}
	   
}

function showMemberType(data){
	var type;
	if(data == "1"){
		type="医师";
	}else{
		type="普通会员";
	}
	return type;
}

		