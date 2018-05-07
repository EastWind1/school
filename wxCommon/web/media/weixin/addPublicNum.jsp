<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<jsp:include page="../media.jsp"></jsp:include>
<script type="text/javascript" src="media/weixin/js/addPublicNum.js"></script> 
<style>
.form-horizontal .control-group{padding-top:20px;padding-bottom:20px;}
</style>
<div class="tab-content contents">
	<h3 class="form-section">添加公众号
	</h3>
	<form id="editform" class="form-horizontal">
	<input type="hidden" id="id" name="id" />
 <div class="portlet-body">
	<div class="row-fluid">
	<div class="span5 ">
		<div class="control-group">
		<label class="control-label" for="inputWarning">公众号类型</label>
		<div class="controls">
		<select class="selectshort" id="publicType" name="type">
            <option value="1" selected="selected">认证的服务号</option>
            <option value="2">未认证的服务号</option>
            <option value="3">认证的订阅号</option>
             <option value="4">未认证的订阅号</option>
        </select>
		</div>
    </div>
	</div>
	</div>
	<div class="row-fluid">
	<div class="span5 ">
		<div class="control-group">
		<label class="control-label" for="inputWarning">服务器地址</label>
		<div class="controls">
			<input type="text" class="span6 m-wrap" id="url" name="url" />
		</div>
    </div>
	</div>
	<div class="span5 ">
		<div class="control-group">
		<label class="control-label" for="inputWarning">wxToken</label>
		<div class="controls">
			<input type="text" class="span6 m-wrap" id="wxToken" name="wxToken" />
		</div>
    </div>
	</div>
	</div>
	<div class="row-fluid">
	<div class="span5 ">
		<div class="control-group">
		<label class="control-label" for="inputWarning">原始ID</label>
		<div class="controls">
			<input type="text" class="span6 m-wrap" id="publicNo" name="publicNo" />
		</div>
    </div>
	</div>
	<div class="span5 ">
	<div class="control-group">
		<label class="control-label" for="inputWarning">公众号名称</label>
		<div class="controls">
			<input type="text" class="span6 m-wrap" id="name" name="name" />
		</div>
	</div>
	</div>
	</div>
	<div class="row-fluid">
	<div class="span5 ">
	<div class="control-group">
		<label class="control-label" for="inputWarning">AppId</label>
		<div class="controls">
			<input type="text" class="span6 m-wrap" id="appId" name="appId" />
		</div>
	</div>
	</div>
	<div class="span5 ">
	<div class="control-group">
		<label class="control-label" for="inputWarning">AppSecret</label>
		<div class="controls">
			<input type="text" class="span6 m-wrap" id="appSecret" name="appSecret" />
		</div>
	</div>
	</div>
	</div>
	<div class="row-fluid">
	<div class="span5 ">
	<div class="control-group">
		<label class="control-label" for="inputWarning">公众平台登录账号</label>
		<div class="controls">
			<input type="text" class="span6 m-wrap" id="loginName" name="loginName" />
		</div>
	</div>
	</div>
	<div class="span5 ">
	<div class="control-group">
		<label class="control-label" for="inputWarning">公众平台登录密码</label>
		<div class="controls">
			<input type="text" class="span6 m-wrap" id="loginPwd" name="loginPwd" />
		</div>
	</div>
	</div>
	</div>
</div>

<div class="form-actions">
		<button type="button" id="submitButton" class="btn blue form_button">保存</button>
		<button type="button" id="accessButton" class="btn blue form_button">接入</button>
	</div>
	</form>
	</div>

