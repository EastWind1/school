/**
 * Created by Mark on 2014/7/21.
 */
$(function(){
//    var aboutusId = $("#aboutusId").val();
//    if(aboutusId == undefined || aboutusId == ""){
//        window.top.location.href = getIP()+"admin/login.jsp";
//    }
//	
    $.ajax(getIP()+"powerMenu.action?getUserMenu").done(function(data){
        var html = "";
        $.each(data,function(i,val){
            html += "<li class='open'>" +
                " <a><i><img src='media/images/menu1.png' />" +
            "</i><span class='title'>"+val.menuName+"</span><span class='selected'>" +
            "</span></a>"
            html += "<ul class='sub-menu'>";
            $.each(val.subMenuList,function(y,val) {
            	if(i==0 && y==0){
            		html+="<li class='start active'><a  class='ajaxify' target='right' href='"+val.url+"'>"+val.menuName1+"</a></li>"
            	}else{
            		html+="<li><a  class='ajaxify' target='right' href='"+val.url+"'>"+val.menuName1+"</a></li>"
            	}
            });
            html += "</ul></li>";
            
        });
        //alert(2222);
        $('#leftmenuclick').html(html);
    }).fail();
});
