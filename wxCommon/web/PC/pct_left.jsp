<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<script>
if(memberId==""){
	window.location.href=getIP()+"PC/newIndex.jsp";
}
</script>
<div class="pct_contentLeft">
	<div class="pct_Mydata">
		<h3 class="pct_MydataTitle">我的信息</h3>
		<ul class="pct_MydataList">
			<li>
				<a href="PC/newMyData.jsp" class="pct_myData">个人信息</a>
			</li>
			<li>
				<a  href="PC/newUpdateMyData.jsp" class="pct_updateFile" style="cursor: pointer;">修改个人信息</a>
			</li>
			<li class="">
				<a href="PC/newChangePwd.jsp" class="pct_changePwd">修改密码</a>
			</li>
			<li>
				<a href="PC/doctorRz.jsp" class="pct_doctorRz">资格认证</a>
			</li>
		</ul>
	</div>
	<div class="pct_collectFolder">
		<h3 class="pct_collectFolderTitle">收藏夹</h3>
		<ul class="pct_collectFolderList">
			<li class="pct_myOrder">
				<a href="PC/newExpertYue.jsp" class="pct_expertYueJL">我的预约</a>
			</li>
			<li class="pct_checkRecord">
				<a href="PC/newCheckRecord.jsp" class="pct_expertYueJL">我的审核记录</a>
			</li>
			<li class="pct_baomingClass">
				<a href="PC/newBaomingRecord.jsp" class="pct_baomingJL">我报名的课程</a>
			</li>
			<li class="pct_collectClass">
				<a href="PC/newCollectRecord.jsp" class="pct_collectJL">我收藏的课程</a>
			</li>
			<li class="pct_classFadeback">
				<a href="PC/newClassFadeBack.jsp" class="pct_fadeBackJL">课程反馈</a>
			</li>	
			
		</ul>
	</div>
</div>