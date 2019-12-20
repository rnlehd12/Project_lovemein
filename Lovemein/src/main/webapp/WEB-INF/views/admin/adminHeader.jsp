<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link  rel= "stylesheet" type="text/css" href="resources/css/admin/adminHeader.css">
</head>
<body>
<!-- 헤더영역 -->

<header>
<nav>
	<ul id="headerul">
		<li class="hdli"><a class="lmi" href="adminMain.do">LOVE ME IN</a></li>
		<li class="hdli"><a class="home" href="adminMain.do">HOME</a></li>
		<li class="hdli"><a class="admin_user" href="adminMemberList.do">회원관리</a></li>
		<li class="hdli"><a class="admin_notice" href="adminNoticeMain.do">공지사항</a></li>
		<li class="hdli"><a class="admin_mission" href="#">미션관리</a></li>
		<li class="hdli"><a class="admin_report" href="adminReportList.do">신고관리</a></li>	
		<li class="admin_users"><p class="users_p">${ loginMember.u_name }</p> 관리자님</li>
		<li class="admin_logout"><a class="logout" href="logout.do">로그아웃</a></li>
	</ul>
</nav>
</header>
<!-- //헤더영역 -->

</body>
</html>