/**
判断是否登录
**/
function getlogin(){
	if(memberId == ""){
		return 
	}
	
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

function showValue(data){
	return data == null? "暂无": data;
}
function subStr(data){
	if(data.length>12){
		data=data.substring(0,12)+"...";
	}
	return data;
	
}


function getUUID(){
	return Math.uuid();
}

/*****
日期截取
***/
function splitStr(str){
	return str.split(" ",1);
}

/*****
设置导航边框
***/
function addBorder(obj,className){
	$(obj).addClass(className);
}


