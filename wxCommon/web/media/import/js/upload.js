/**
 * create by Mark 2014-7-23 15：53Sv
 */
$(function(){
	 $('#upload').click(function (e) {// 循环读取时间
	 var fileName=$("#fileName").val();
	 if(fileName=="")
	 {
	 alert("请选择上传的文件！");
	 return;
	 }
     var file = $('#fileName').val();
　　// 检查是否已选择上传文件
　　if (file != '') {
　　　　var filename = file.replace(/.*(\/|\\)/, '');
　　　　var fileext = (/[.]/.exec(filename)) ? /[^.]+$/.exec(filename.toLowerCase()) : '';
　　　　// 检查文件格式
　　　　if (fileext == 'xls') {
　　　　　　// 上传excel文件
           $("#loading").show();
　　　　　　$.ajaxFileUpload({
　　　　　　　　url: "ImportData.action?upload",
　　　　　　　　secureuri: false,
　　　　　　　　dataType: "text",
　　　　　　　　fileElementId: 'fileName',
　　　　　　　　success: function(data){       // data是后台返回过来的在上传并保持excel内容过程中的用户提示信息
　　　　　　　
			$("#okButton").removeAttr("disabled");
                var ms= data.split("|");
                if(ms[2]=="1")
                {
                alert("请先设置导入字段！");	
                }else
                {
                	　alert("导入完成");
                	 $("#gh").html(ms[0]);
                     $("#fa").html(ms[1]);	
                }
               
                  $("#loading").hide();
				},
　　　　　　});
　　　　}
　　　　else {
　　　　　　alert('文件格式必须是*.xls');
　　　　}
　　}
　　else {
　　　　alert('请选择excel文件！')
　　}
     
     });
   	  
});


