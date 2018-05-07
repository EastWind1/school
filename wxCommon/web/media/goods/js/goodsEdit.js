$(function(){
$("#return").on("click",function(){
	history.go(-1);
	});
	 getType();//获取一级菜单
	$("#add").on("click",function(){
		//var baseStr=$("#imageStr").val();//base64图片值
		var name=$("#name").val();
		var type=$("#type").val();
		if(name=="" || name.length==0)
		{
		alert("名称不许为空！");
		return;
		}
			if(type=="" || type==null )
		{
		alert("类型不许为空！");
		return;
		}
		
		 if($('#imageUrl').val() == ""){
            alert("必须选择一张图片");
            return;
        }
		
		  $.ajax({
            type: "POST",
            url:getIP()+"goods.action?add",
            data:$('#addform').serialize(),
            async:false,
            success: function(data) {
                if(data.success){
                    alert("保存成功");
                    window.location.href =  "media/goods/goodsList.jsp";
                }else{
                    alert("保存失败");
                }
            },error: function(data) {
                alert("提交失败");
            }
        });
		
		
	});
	
	
	$('#file_upload').uploadify({
        'swf': 'media/locatResource/js/uploadify.swf',    //指定上传控件的主体文件
        'uploader': getIP()+'util/uploadFile.action',    //指定服务器端上传处理文件
        //其他配置项
        width: 108,                          // 按钮的宽度
        height: 32,                         // 按钮的高度
//        'buttonClass':'uploadBtn',
        'buttonText': "上传",                 // 按钮上的文字
        'buttonImage' : 'media/images/uploadBtn.png',
        'buttonCursor': 'hand',                // 按钮的鼠标图标

        'fileObjName': 'Filedata',            // 上传参数名称
        'fileSizeLimit' : '1MB',
        // 两个配套使用
        'fileTypeExts': "*.jpg;*.png",             // 扩展名
        'fileTypeDesc': "请选择 jpg png 文件",     // 文件说明

        'auto': true,                // 选择之后，自动开始上传
        'multi': false,               // 是否支持同时上传多个文件
        'onUploadSuccess': function (file, data, response) {
            var object = eval('(' + data + ')');
            $('#fileImage').attr('src', "data/material/" + object.imageUrl);

            $('#imageUrl').val(object.imageUrl);

            $('#thumbnailImage').attr('src', "data/material/" + object.imageUrl);
            $('#imageShowDiv').show();
            $('.editDiv').height($('.editDiv').height()+100);
        }
    });
    //图片上传成功之后 可以删除图片
    $('#deleteImage').on('click', function () {
        $('#imageShowDiv').hide();
        $('#thumbnailImage').attr('src', "media/images/newsDefault.jpg");
        $.ajax({
            type: "POST",
            url:getIP()+"util/deleteFile.action",
            data:{imageUrl:$('#imageUrl').val()},// 你的formid
            async:false,
            success: function(data) {
                if(data.success){
                    //删除成功做处理
                    console.info(data.msg);

                }else{
                    //删除失败 做处理
                }
            },error: function(data) {
                //做处理
            }
        });
        //删除隐藏域
        $('#imageUrl').val("");
        //
        $('#fileImage').attr('src', "");
    });
	
	
	$("#type1").change(function(){
		   var listrole=$.Params.create();
		   var type=$("#type1").val();
		listrole.addParams("parentId",type);
	   listrole.ajax(getIP()+"TfTypeInfo.action?list",function (data){
		if(data.success){
			var html="<option value=''>--请选择--</option>";
			$.each(data.rows,function(i,val){
				html+="<option value='"+val.id+"'>"+val.menuName+"</option>";
			})
			$("#type2").html(html);
		}
	});
	
	})
	
	$("#type2").change(function(){
		   var listrole=$.Params.create();
		   var type=$("#type2").val();
		listrole.addParams("parentId",type);
	   listrole.ajax(getIP()+"TfTypeInfo.action?list",function (data){
		if(data.success){
			var html="<option value=''>--请选择--</option>";
			$.each(data.rows,function(i,val){
				html+="<option value='"+val.id+"'>"+val.menuName+"</option>";
			})
			$("#type").html(html);
		}
	});
	
	})
	
	
	
})
//获取一级菜单
function  getType()
	{
	  	/**
	 * 获取一级栏目
	 */
	    var listrole=$.Params.create();
		listrole.addParams("parentId","0")
	   listrole.ajax(getIP()+"TfTypeInfo.action?list",function (data){
		if(data.success){
			var html="<option value=''>--请选择--</option>";
			$.each(data.rows,function(i,val){
				html+="<option value='"+val.id+"'>"+val.menuName+"</option>";
			})
			$("#type1").html(html);
		}
	   });
	}


