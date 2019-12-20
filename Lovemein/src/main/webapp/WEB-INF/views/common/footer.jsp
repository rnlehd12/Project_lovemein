<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>common footer</title>
<link rel="stylesheet" type="text/css" href="resources/css/common/common.css">
<script type="text/javascript" src="resources/js/jquery-3.4.1.min.js"></script>
</head>
<body>
	<div id="footerArea">
		<ul>
			<li class="footerList"><a href="#">회사소개</a><span> | </span></li>
			<li class="footerList"><a href="#">이용약관</a><span> | </span></li>
			<li class="footerList"><a href="#">개인정보처리방침</a><span> | </span></li>
			<li class="footerList"><a href="adminNoticeMain.do">공지사항</a></li>
			<c:if test="${sessionScope.loginMember.u_no eq '1'}">			
			<li class="footerList"><span> | </span><a href="adminMain.do">관리자페이지</a></li></c:if>	
			<li class="footerList" id="rightMenu">copyright 2019 all rights reserved.</li>
		</ul>
	</div>
</body>
</html>