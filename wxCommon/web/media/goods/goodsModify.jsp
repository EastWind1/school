<%@page language="java" pageEncoding="UTF-8"%>
<!DOCTYPE html>
 <html lang="en">
<head>
	<meta charset="utf-8" />
 	<jsp:include page="../media.jsp"></jsp:include>
   <link href="media/css/uploadify.css" rel="stylesheet" type="text/css">
   <script src="media/locatResource/js/swfobject.js" type="text/javascript"></script>
   <script src="media/locatResource/js/jquery.uploadify.min.js" type="text/javascript"></script>
 	
 	<script type="text/javascript" src="media/media/datepicker/WdatePicker.js"></script>
 	<script type="text/javascript" src="media/goods/js/goodsModify.js"></script>
 	<link href="media/media/css/bootstrap-fileupload.css" rel="stylesheet" type="text/css"/>
 	<script type="text/javascript" src="media/media/js/bootstrap-fileupload.js"></script>
 	<style>
 		li{ list-style: none;}
 		.courseDbDetails{
 			width: 100%;
 			height: 100%;
 		}
 		.courseDbDetails_data li{
 			height: 40px;
 			line-height: 40px;
 			background-color:#CACAD2;
 			margin-bottom:10px;
 		}
 		/*字段名*/
 		.courseDbDetails_data .courseDbDetails_field{
 			width: 10%;
 			height: 100%;
 			padding-right:10px;
 			line-height:40px;
 			text-align:right;
 			float: left;
 			display: block;
 		}
 		/*字段值*/
 		.courseDbDetails_data .courseDbDetails_fieldValue{
 			width: 20%;
 			height: 100%;
 			text-align: left;
 			float:left;
 			display: block;
 		}
 	</style>
 </head>

<body class="page-header-fixed" >
<div class="tab-content contents"> 
	<h3 class="form-section" >&nbsp;&nbsp;&nbsp;<font style="font-weight:bold">商品管理</font></h3>
	<div class="row-fluid">
		<div class="span12">
	 <div class="portlet-body list mbModify">
		<form class="form-horizontal m-t" id="commentForm" novalidate="novalidate" method="post">
		<input type="hidden"  id="id"  name="id" />
		<div class="control-group">
                <label class="control-label">品牌：</label>
                <div class="controls">
                    <input id="brand" name="brand" minlength="2" type="text" class="form-control" required="" aria-required="true">
                </div>
            </div>
            <div class="control-group">
                <label class="control-label">名称：</label>
                <div class="controls">
                    <input id="name" name="name" minlength="2" type="text" class="form-control" required="" aria-required="true">
                </div>
            </div>
              <div class="control-group">
                <label class="control-label">分类：</label>
                <div class="controls">
                    <input id="fenlei" name="fenlei"  minlength="2" type="text" class="form-control" required=""  aria-required="true" >
                </div>
            </div>
             <div class="control-group">
                <label class="control-label">价格：</label>
                <div class="controls">
                    <input id="price" name="price"  minlength="2" type="text" class="form-control" required=""  aria-required="true" >
                </div>
            </div>
             <div class="control-group">
                <label class="control-label">商品毛重：</label>
                <div class="controls">
                    <input id="weight" name="weight"  minlength="2" type="text" class="form-control" required=""  aria-required="true" >
                </div>
            </div>
            <div class="control-group">
                <label class="control-label">容量：</label>
                <div class="controls">
                    <input id="capacity" name="capacity"  minlength="2" type="text" class="form-control" required=""  aria-required="true" >
                </div>
            </div>
                <div class="control-group">
                <label class="control-label">等级：</label>
                <div class="controls">
                    <input id="level" name="level"  minlength="2" type="text" class="form-control" required=""  aria-required="true" >
                </div>
             </div>
              <div class="control-group">
                <label class="control-label">粘度：</label>
                <div class="controls">
                    <input id="viscosity" name="viscosity"  minlength="2" type="text" class="form-control" required=""  aria-required="true" >
                </div>
             </div>
            <div class="control-group"  id="imageShowDiv">
             <label class="control-label">图片：</label>
                   <img  style="width: 100px; height: 100px;" id="thumbnailImage">
               </div>
              
            <div class="control-group">
                <label class="control-label">描述：</label>
                <div class="controls">
                <textarea class="span10 m-wrap" rows="3" id="des"  name="des" ></textarea>
                </div>
            </div>
             <!--封面开始-->
                        <div class="control-group">
                            
                            <div class="controls">
                            <font color="red">图片（大图片建议尺寸：513像素 * 387像素）</font>
                                <input id="file_upload" name="file_upload" type="file" multiple="true">

                                <!--图片URL-->
                                <input id="imageUrl" name="imageUrl" type="hidden">
                            </div>

                            <div class="controls" style="display: none" id="imageShowDiv">
                                <img src="" style="width: 102px; height: 74px;" id="fileImage">
                                <a id="deleteImage">删除</a>
                            </div>
                        </div>
                        <!--封面结束-->
            <div class="form-actions">
				<button id="modifyVal" type="button" class="btn blue">保存</button>
				<button id="return" type="button" class="btn blue">返回</button>
			</div>
         </form>
	      
		</div>
		</div>
	</div>
</div>

</body>
<script type="text/javascript">
 App.init();

</script>
</html>