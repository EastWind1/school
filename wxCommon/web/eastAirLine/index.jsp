<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title></title>
		<meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1,maximum-scale=1,user-scalable=no" />
		<link rel="stylesheet" type="text/css" href="css/bootstrap.min.css"/>
		<link rel="stylesheet" type="text/css" href="css/style.min.css"/>
		<style type="text/css">
			body{color: #676a6c;}
			th,td{text-align: center;}
			.ibox{margin-bottom: 10px;}
		</style>
	</head>
	<body class="gray-bg">
		<div class="wrapper wrapper-content">
			<div class="row">
				<div class="col-sm-12">
					<div class="ibox float-e-margins">
	                    <div class="ibox-title">
	                        <h5>填写会议信息</h5>
	                    </div>
	                    <div class="ibox-content">
	                        <form class="form-horizontal m-t" id="commentForm" novalidate="novalidate">
	                            <div class="form-group">
	                                <label class="col-sm-3 control-label">会议标题：</label>
	                                <div class="col-sm-8">
	                                    <input id="meetName" minlength="2" type="text" class="form-control" required>
	                                </div>
	                            </div>
	                            <div class="form-group">
	                                <label class="col-sm-3 control-label">会议开始时间：</label>
	                                <div class="col-sm-8">
	                                    <input id="meetStarTime" type="text" class="form-control" required>
	                                </div>
	                            </div>
	                            <div class="form-group">
	                                <label class="col-sm-3 control-label">会议结束时间：</label>
	                                <div class="col-sm-8">
	                                    <input id="meetEndTime" type="text" class="form-control" required>
	                                </div>
	                            </div>
								<div class="form-group">
	                                <label class="col-sm-3 control-label">会员ID：</label>
	                                <div class="col-sm-8">
	                                    <select class="form-control">
	                                        <option>请选择会议ID</option>
	                                        <option>选项 2</option>
	                                        <option>选项 3</option>
	                                        <option>选项 4</option>
	                                    </select>
	                                </div>
	                            </div>
	                            <div class="form-group">
	                                <label class="col-sm-3 control-label">会诊开始时间：</label>
	                                <div class="col-sm-8">
	                                    <input id="consultationStarTime" type="text" class="form-control" required>
	                                </div>
	                            </div>
	                            <div class="form-group">
	                                <label class="col-sm-3 control-label">会诊结束时间：</label>
	                                <div class="col-sm-8">
	                                    <input id="consultationEndTime" type="text" class="form-control" required>
	                                </div>
	                            </div>
	                        </form>
	                    </div>
                	</div>
            	</div>
				<div class="col-sm-12">
					<div class="ibox float-e-margins">
	                    <div class="ibox-title">
	                        <h5>选择参与人员</h5>
	                    </div>
	                    <div class="ibox-content" style="padding: 0;">
	                        <table class="table">
	                            <thead>
	                                <tr>
	                                    <th>姓名</th>
	                                    <th>登录账号</th>
	                                    <th>操作</th>
	                                </tr>
	                            </thead>
	                            <tbody>
	                                <tr>
	                                    <td>门燕荣</td>
	                                    <td>15194170623</td>
	                                    <td><button type="button" class="btn btn-sm btn-success">添加</button></td>
	                                </tr>
	                            </tbody>
	                        </table>
	                    </div>
	                </div>
					<button type="submit" class="btn btn-block btn-success">添加</button>
				</div>
			</div>
		</div>
		<script src="js/jquery-1.9.1.min.js" type="text/javascript" charset="utf-8"></script>
		<script src="js/jquery.validate.min.js" type="text/javascript" charset="utf-8"></script>
	</body>
</html>

