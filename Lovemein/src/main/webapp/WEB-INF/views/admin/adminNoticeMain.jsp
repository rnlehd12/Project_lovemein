<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>   
<!DOCTYPE html>
<html>
<head>
<title>공지사항 페이지</title>
<link  rel= "stylesheet" type="text/css" href="resources/css/admin/adminNoticeMain.css">
<script type="text/javascript" src="resources/js/jquery-3.4.1.min.js"></script>

<script type="text/javascript">
</script>

</head>
<body>
<c:import url="adminHeader.jsp"/>
<div class="main">

<!-- 타이틀 -->
<div class="title_div">
<h2 class="listfont">공지사항</h2>
</div>
<!-- //타이틀 -->
<button class="insertbt">글작성</button>
<!-- 공지사항목록 -->
<div class="ntwr">
<div class="ntbox_list">
<div class="nt_box">
	<div class="nt">
		<img class="ntimg "src="resources/images/admin/user.png">
	</div>
	<div class="textbox">
		<p class="datep">2019.12.17</p>	
		<p class="heart">♥</p>
		<p class="text">올겨울 럽미인과 하는 이벤트!!</p>	
	</div>
</div>

<div class="nt_box">
	<div class="nt">
		<img class="ntimg "src="resources/images/admin/user.png">
	</div>
	<div class="textbox">
		<p class="datep">2019.12.17</p>	
		<p class="heart">♥</p>
		<p class="text">올겨울 럽미인과 하는 이벤트!!</p>	
	</div>
</div>

<div class="nt_box">
	<div class="nt">
		<img class="ntimg "src="resources/images/admin/user.png">
	</div>
	<div class="textbox">
		<p class="datep">2019.12.17</p>	
		<p class="heart">♥</p>
		<p class="text">올겨울 럽미인과 하는 이벤트!!</p>	
	</div>
</div>

</div><!-- //ntbox_list -->
</div><!-- //ntwr -->

<div class="btbox">
	<button class="bt">더보기</button>
</div>

<!-- //공지사항목록 -->
</div><!-- main -->

</body>
</html>