<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>럽미인:관리자 메인 페이지</title>
<link  rel= "stylesheet" type="text/css" href="resources/css/admin/adminMain.css">
<script type="text/javascript" src="resources/js/jquery-3.4.1.min.js"></script>
<script type="text/javascript" src="resources/js/admin/adminMain.js"></script>
</head>
<body>
<c:import url="adminHeader.jsp"/>
<div class="main">

<div class="table_div">
<table>
<tr>

<td class="tduser">
	<div class="user_div">
	<img class="userimg" src="resources/images/admin/user.png"
	onmouseover="this.src='resources/images/admin/user_hover.png'" 
	onmouseout="this.src='resources/images/admin/user.png'">
	<p class="puser">회원관리</p>
	</div>
</td>

<td class="tdnotice">
	<div class="notice_div">
	<img class="noticeimg" src="resources/images/admin/notice.png"
	onmouseover="this.src='resources/images/admin/notice_hover.png'" 
	onmouseout="this.src='resources/images/admin/notice.png'">
	<p class="pnotice">공지사항</p>
	</div>
</td>

</tr>
<tr>
<td class="tdmission">
	<div class="mission_div">
	<img class="missionimg" src="resources/images/admin/mission.png"
	onmouseover="this.src='resources/images/admin/mission_hover.png'" 
	onmouseout="this.src='resources/images/admin/mission.png'">
	<p class="pmission">미션관리</p>
	</div>
</td>

<td>
	<div class="report_div">
	<img class="reportimg" src="resources/images/admin/report.png"
	onmouseover="this.src='resources/images/admin/report_hover.png'" 
	onmouseout="this.src='resources/images/admin/report.png'">
	<p class="preport">신고관리</p>
	</div>
</td>
</tr>

</table>
</div><!-- table 묶어주는 div -->


</div><!-- //main -->

</body>
</html>