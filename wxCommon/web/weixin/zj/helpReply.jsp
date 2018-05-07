<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<!DOCTYPE>
<html>
  <head>
	<title>求助回复</title>
	<jsp:include page="../common.jsp"></jsp:include>
  </head>
  
  <body>

    <div class="content helpList">
		<div class="card">
			<ul class="table-view helpList_ul">
		        <li class="table-view-cell media">
		          <a class="navigate-right" href="#" data-transition="slide-in"> 
		          <div class="media-body helpListInfo">
		              <p>姓名：王晓雪</p>
		              <p>性别：女</p>
		              <p>年龄：24</p>
		              <p>医师：王宏伟</p>
		              <p>创建时间：2015-05-08 09:30 </p>
		              <p class="connectIcon">
		                <a href="#"><img src="http://placehold.it/64x64" style="width:32px; height:32px" /></a>
		              	<a href="#"><img src="http://placehold.it/64x64" style="width:32px; height:32px" /></a>
		              	<a href="#"><img src="http://placehold.it/64x64" style="width:32px; height:32px" /></a>
		              </p>
		            </div>
		          </a>
		        </li>
		        <li class="table-view-cell media replyContent">
		        	<textarea placeholder="请输入您的回复"></textarea>
		        </li>
		        
     		<div class="helpReply_btn">
		      <a class="btn btn-primary btn-block">回复</a>
		    </div> 
     		</ul>
      </div>
      		
    </div>
  </body>
</html>
