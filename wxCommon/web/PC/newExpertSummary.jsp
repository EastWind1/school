<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<title>云  ICU</title>
	<jsp:include page="media.jsp"></jsp:include>
</head>
<body class="page-header-fixed page-full-width">
		<!-- 顶部导航 begin-->
	<jsp:include page="head.jsp"></jsp:include>
	<!-- 顶部导航 end -->
	
 	<!-- 内容主体  begin-->
	<div class="page-container row-fluid">
		<div class="page-content no-min-height">
			<div class="container-fluid promo-page">
				<div class="row-fluid">
					<div class="span12">
  				<!--	<div class="expertSumBanner">
  							<div class="container">预约专家</div>
  						</div>
  						
  						<div class="expertSel">
  							<div class="span3"></div>
  							<div class="span5 expertSelTitle">选择专家</div>
  							<div class="span4"></div>
  						</div>-->
						<!--导航下内容部分  begin-->
  						<div class="container">
  							<div class="row-fluid" style="margin: 40px 0" id="exp_summary">
  							<div class="db_contentRight" style="width:80%;margin-left:10%;margin-right:10%">
  							<div class="exp_expertContent">
  							<span class="index_modelTitle ol_ClassTitle borderTopRadius">在线咨询</span>
	  							<div style="width:100%;font-size:16px;border-bottom:1px solid #ccc;margin-bottom:10px;"><span style="padding:10px;display:inline-block;font-weight:800;">选择专家</span></div>
								<div class="control-group zjgroupcon">
					                <label class="control-label noPointer">选择意向专家一：</label>
					                <div class="controls">
						                <p class="yue_selExp">
											<select id="expertId1" class="noPointer">
												<option>请选择专家</option>
											</select>
											<a class="yue_qingchu">清除</a>
										</p>
					                </div>
					            </div>
								<div class="control-group zjgroupcon">
					                <label class="control-label noPointer">选择意向专家二：</label>
					                <div class="controls">
						                <p class="yue_selExp">
											<select id="expertId2" class="noPointer">
												<option>请选择专家</option>
											</select>
											<a class="yue_qingchu">清除</a>
										</p>
					                </div>
					            </div>
								<div class="control-group zjgroupcon">
					                <label class="control-label noPointer">选择意向专家三：</label>
					                <div class="controls">
						                <p class="yue_selExp">
											<select id="expertId3" class="noPointer">
												<option>请选择专家</option>
											</select>
											<a class="yue_qingchu">清除</a>
										</p>
					                </div>
					            </div>
  							
							    <div style="width:100%;font-size:16px;border-bottom:1px solid #ccc;margin-bottom:10px;">
							    	<span style="padding:10px 0 10px 10px;display:inline-block;font-weight:800">病人信息</span>
							    	(<span style="color: rgb(255, 1, 1);font-size:14px;">病人资料越详细，预约越快</span>)
							    </div>
					            <div class="control-group zjgroupcon">
					                <label class="control-label">性别(<font color="#FF0101">必填</font>)：</label>
					                <div class="controls" id="sum_sex" style="margin-bottom:10px;">
					            		<img style="width:28px;" sex="1" src="PC/image/sex1.png"> 男   <img style="width:28px;" sex="2" src="PC/image/sex0.png"> 女
					                </div>
					            </div> 
					            <div class="control-group zjgroupcon">
					                <label class="control-label">年龄(<font color="#FF0101">必填</font>)：</label>
					                <div class="controls">
					                	<input id="birthday" type="text" />
					                </div>
					            </div> 
					            <div class="control-group zjgroupcon">
					                <label class="control-label">身高(cm)：</label>
					                <div class="controls">
					                	<input id="sum_height" type="text" />
					                </div>
					            </div>  
					            <div class="control-group zjgroupcon">
					                <label class="control-label">体重(kg)：</label>
					                <div class="controls">
					                	<input id="sum_weight" type="text" />
					         		</div>
					            </div> 
					            <div class="control-group zjgroupcon">
					                <label class="control-label">职业：</label>
					                <div class="controls">
					                	<input id="sum_job" type="text" /> 
					                </div>
					            </div> 
							    <div class="control-group zjgroupcon">
					                <label class="control-label">入院时间：</label>
					                <div class="controls">
					                	<input type="text" id="admissionTime" name="admissionTime" placeholder="请选择入院时间" onClick="WdatePicker()" onfocus="WdatePicker()" />
					                </div>
					            </div> 
								
								
		  						<!--<div class="control-group">
		  							<div class="span1"></div>
		  							<div class="span10 exp_bingInfoTitle">病情描述</div>
		  						</div>
					            <div class="control-group">
					                <label class="control-label"></label>
					                <div class="controls">
					                	<textarea id="remark" class="span10 m-wrap" rows="10" placeholder="病情描述" style="resize: none;"></textarea>
					                </div>
					            </div>-->
					            <div class="control-group zjzsgroupcon">
					                <label class="control-label">主诉(<font color="#FF0101">必填</font>)：</label>
					                <div class="controls">
					                	<textarea id="sum_zhusu" class="span10 m-wrap" rows="4" placeholder="主诉描述" style="resize: none;"></textarea>
					                </div>
					            </div> 
					            <div class="control-group zjzsgroupcon">
					                <label class="control-label">现病史：</label>
					                <div class="controls">
					                	<textarea id="sum_xianbingshi" class="span10 m-wrap" rows="4" placeholder="现病史描述" style="resize: none;"></textarea>
					                </div>
					            </div> 
								<div class="control-group zjhlgroupcon">
					                <label class="control-label">既往史：</label>
					                <div class="controls">
					                	<textarea id="sum_jiwangshi" class="span10 m-wrap" rows="4" placeholder="既往史描述" style="resize: none;"></textarea>
					                </div>
					            </div> 
								<div class="control-group zjhlgroupcon">
					                <label class="control-label">个人史：</label>
					                <div class="controls">
					                	<textarea id="sum_gerenshi" class="span10 m-wrap" rows="4" placeholder="个人史描述" style="resize: none;"></textarea>
					                </div>
					            </div> 
								<div class="control-group zjhlgroupcon">
					                <label class="control-label">家族史：</label>
					                <div class="controls">
					                	<textarea id="sum_jiazushi" class="span10 m-wrap" rows="5" placeholder="家族史描述" style="resize: none;"></textarea>
					                </div>
					            </div> 
								<div class="control-group zjhlgroupcon">
					                <label class="control-label">药物食物过敏史：</label>
					                <div class="controls">
					                	<textarea id="sum_guominshi" class="span10 m-wrap" rows="5" placeholder="药物食物过敏史描述" style="resize: none;"></textarea>
					                </div>
					            </div> 
					             <div class="control-group">
					             	<div style="width:82%;margin-bottom:5px;overflow:hidden;">
					               		<label class="control-label">入院检查：</label>
					               	</div>
					                <div class="controls zjscgroupcon">
					                	<textarea id="sum_ryjc" class="span10 m-wrap" rows="4" placeholder="入院检查描述" style="display:inline-block;resize: none;"></textarea>
					               		<a id="sumSubmit_ryjc" filed4="1" name="ryjc" type="button" class="btn sum_uploadImg">上传检查结果</a>
					                	<p id="uploadimg1" style="display:inline-block; float:left;">
					                		
					                	</p>	
					                </div>
					            </div>
					            <div class="control-group" id="sysjc">
					                <div style="width:82%;margin-bottom:5px;overflow:hidden;">
					                	<label class="control-label">实验室检查：</label>
					                </div>
					                <div class="controls zjscgroupcon">
					                	<textarea id="sum_sysjc" class="span10 m-wrap" rows="4" placeholder="实验室检查描述" style="display:inline-blockresize: none;"></textarea>
					                	<a id="sumSubmit_sysjc" filed4="2" name="sysjc" type="button" class="btn sum_uploadImg">上传检查结果</a>
					                 	<p id="uploadimg2" style="display:inline-block;float:left;">
					                		
					                 	</p>
					                </div>
					            </div>
					            <div class="control-group">
					            	<div style="width:82%;margin-bottom:5px;overflow:hidden;">
					                	<label class="control-label">影像学检查：</label>
					                </div>
					                <div class="controls zjscgroupcon">
					                	<textarea id="sum_yxxjc" class="span10 m-wrap" rows="4" placeholder="影像检查描述" style="display:inline-blockresize: none;"></textarea>
					                	<a id="sumSubmit_yxxjc" filed4="3" name="yxxjc" type="button" class="btn sum_uploadImg">上传检查结果</a>
					                 	<p id="uploadimg3" style="display:inline-block;float:left;">
					                		
					                 	</p>
					                </div>
					            </div>
					            <div class="control-group">
					            	<div style="width:82%;margin-bottom:5px;overflow:hidden;">
					                	<label class="control-label">其他辅助检查：</label>
					                </div>
					                <div class="controls zjscgroupcon">
					                	<textarea id="sum_other" class="span10 m-wrap" rows="4" placeholder="辅助检查描述" style="display:inline-blockresize: none;"></textarea>
					                	<a id="sumSubmit_other" filed4="4" name="qtjc" type="button" class="btn sum_uploadImg">上传检查结果</a>
					                 	<p id="uploadimg4" style="display:inline-block;float:left;">
					                		
					                 	</p>
					                </div>
					            </div>
					            <div class="control-group zjzsgroupcon">
					                <label class="control-label">初步诊断：</label>
					                <div class="controls">
					                	<textarea id="sum_zhenduan" class="span10 m-wrap" rows="4" placeholder="诊断描述" style="resize: none;"></textarea>
					                </div>
					            </div>  
					            <div class="control-group zjzsgroupcon">
					                <label class="control-label">治疗方案：</label>
					                <div class="controls">
					                	<textarea id="sum_fangan" class="span10 m-wrap" rows="4" placeholder="治疗方案描述" style="resize: none;"></textarea>
					                </div>
					            </div> 
					            <div class="control-group zjzsgroupcon">
					                <label class="control-label">描述：</label>
					                <div class="controls">
					                	<textarea id="remark" class="span10 m-wrap" rows="4" placeholder="描述" style="resize: none;"></textarea>
					                </div>
					            </div> 
					           <!--  <div class="control-group">
					                <label class="control-label">病情恶化：</label>
					                <div class="controls">
					                	<textarea id="sum_ehua" class="span10 m-wrap" rows="5" placeholder="病情恶化描述" style="width: 50%;resize: none;"></textarea>
					                </div>
					            </div> --> 
					            <p style="color:red;text-align:center" >有问题请联系我们：400-8554120</p>
					           <div class="control-group">
					            	<a id="summary" class="exp_summaryBtn">提交预约</a>
					           </div>
  							</div>
						</div>
						</div>
					</div>
				</div>
			</div>
			<!--导航下内容部分  end-->
							
			<!-- 底部  begin-->
			<div class="copyRight"></div> 	
			<!-- 底部  end -->
		</div>
	</div>
	</div>
 	<!-- 内容主体  end -->
 	<div id="responsive" class="modal hide fade" tabindex="-1" data-width="760">
		<div class="modal-header" style="display:none !important;">
			<button type="button" class="close" data-dismiss="modal" aria-hidden="true"></button>
			<h3>友情提醒</h3>
		</div>
		<div class="modal-body">
			<div class="row-fluid">
				<div class="span12" id="modalcont">
					
				</div>
			</div>
		</div>
		<div class="modal-footer">
			<button type="button" data-dismiss="modal" class="btn">关闭</button>
		</div>
	</div>
	<input id="ryjc" type="hidden" value="">
	<input id="sysjc" type="hidden" value="">
	<input id="yxxjc" type="hidden" value="">
	<input id="qtjc" type="hidden" value="">
	<script src="PC/js/uuid.js"></script>
	<script src="PC/js/ajaxfileupload.js"></script>
	<script src="PC/js/datepicker/WdatePicker.js" type="text/javascript" charset="utf-8"></script>
 	<script type="text/javascript" src="PC/media/js/bootstrap-fileupload.js"></script>
	<script src="PC/newIndexjs/newExpertSummary.js"></script>
	<!--<script src="PC/newIndexjs/leftSection.js" type="text/javascript" charset="utf-8"></script>  -->
	</body>
</html>