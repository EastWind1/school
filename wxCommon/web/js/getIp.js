

function getIP(){
	 return ""; 

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
 
function valPhone(phone){
    var isPhone=/^(?:13\d|15\d|18\d)\d{8}$/;
    return isPhone.test(phone);
}

 