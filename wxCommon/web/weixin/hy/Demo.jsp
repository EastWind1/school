<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<!DOCTYPE>
<html>
  <head>
	<title>预约专家</title>
	<jsp:include page="../common.jsp"></jsp:include>
  </head>
  <body>
    <div class="content">
		<div class="card cardmagin">
		<table>
			<tr style="color:#458DE6;">
				<td class="tdkey">专家1：</td>
				<td class="tdval memberOrder_sel">
					<span style="padding-left:10px;">Prof.John Kellum</span>
				</td>
			</tr>
			<tr style="color:#458DE6;">
				<td class="tdkey">专家2：</td>
				<td class="tdval memberOrder_sel">
					<span style="padding-left:10px;">王春亭教授</span>
				</td>
			</tr>
			<tr style="color:#458DE6;">
				<td class="tdkey">专家3：</td>
				<td class="tdval memberOrder_sel">
					<span style="padding-left:10px;">杜斌教授</span>
				</td>
			</tr>
			<tr style="color:#458DE6;">
				<td class="tdkey">性别：<span>男</span></td>
				<td class="tdval memberOrder_sel" style="text-align:center;">
					<span style="padding-left:10px;">年龄：<i>48</i></span>
				</td>
			</tr>
			<tr style="color:#458DE6;">
				<td class="tdkey">身高(cm)：<span>175</span></td>
				<td class="tdval memberOrder_sel" style="text-align:center;">
					<span style="padding-left:10px;">体重(kg)：<i>60</i></span>
				</td>
			</tr>
			<tr style="color:#458DE6;">
				<td class="tdkey">职业：</td>
				<td class="tdval memberOrder_sel">
					<span style="padding-left:10px;">工人</span>
				</td>
			</tr>
			<tr style="color:#458DE6;">
				<td class="tdkey">入院时间：</td>
				<td class="tdval memberOrder_sel">
					<span style="padding-left:10px;">2015-08-10</span>
				</td>
			</tr>
			<tr style="color:#458DE6;">
				<td class="tdkey">主诉：</td>
				<td class="tdval memberOrder_sel">
					<p style="padding-left:10px;">外伤后头疼头晕伴左下肢疼痛1小时余。</p>
				</td>
			</tr>
			<tr style="color:#458DE6;">
				<td class="tdkey">现病史：</td>
				<td class="tdval memberOrder_sel">
					<span style="padding-left:10px;">患者诉于1小时前被机动车撞伤</span>
				</td>
			</tr>
			
			
			
			<tr>
				<td class="tdkey" >入院查体：</td>
				<td class="tdval"><textarea id="searchos"></textarea></td>
			</tr>
			<tr class="img" style="display:none" >
				<td class="tdkey"></td>
				<td class="tdval" name="ryct">
					<div class='card listsz'>
						<h4>入院检查<a id="chooseImage1" typeNo="1" style="border: 1px solid;border-radius: 5px;color: #fff;background-color: #08c;padding: 5px;">上传图片</a></h4>
						<ul class='table-view' style='margin-left:0px;padding-right:5px;' id="content1">
						</ul>
					</div>	
					<div class="content-padded">
				      <a class="btn btn-primary btn-block" id="regbl">提交</a>
				    </div> 
				</td>
			</tr>
			<tr>
				<td class="tdkey">实验室检查：</td>
				<td class="tdval"><textarea id="labCheck"></textarea></td>
			</tr>
			<tr>
				<td class="tdkey">影像学检查：</td>
				<td class="tdval"><textarea id="imgCheck"></textarea></td>
			</tr>
			<tr>
				<td class="tdkey">其他辅助检查：</td>
				<td class="tdval"><textarea id="otherCheck"></textarea></td>
			</tr>
			<tr>
				<td class="tdkey">初步诊断：</td>
				<td class="tdval"><textarea id="preDiagnosis"></textarea></td>
			</tr>
			<tr>
				<td class="tdkey">治疗方案：</td>
				<td class="tdval"><textarea id="treatPlan"></textarea></td>
			</tr>
			<tr>
				<td class="tdkey">病情恶化：</td> 
				<td class="tdval"><textarea id="illSerious"></textarea></td>
			</tr>
			<!-- <tr>
				<td class="tdkey">病情描述：</td> 
				<td class="tdval"><textarea id="remark"></textarea></td>
			</tr> -->
		</table>
		<div class="content-padded">
	      <a class="btn btn-primary btn-block" id="reg">提交</a>
	    </div> 
 		</div>
 	</div>
 	<script>	
	function stopPropagation(e) {
		if (e.stopPropagation){
       		e.stopPropagation();
   		}
   		else{ 
       		e.cancelBubble = true;
   		}
	}

      $(".content td[name!=ryct]").on('click',function(){
      		console.log("1");
          //$(".img").hide();
      });

      $('#searchos').on('click',function(e){
          stopPropagation(e);
          $(".img").toggle();
      });
 	</script>
  </body>
</html>
