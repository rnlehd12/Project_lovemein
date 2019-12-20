<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>      
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>검색실패페이지</title>
<link  rel= "stylesheet" type="text/css" href="resources/css/admin/adminSearchNone.css">
</head>

<body>
<c:import url="adminHeader.jsp"/>
<div class="main"> 
	<div class="searchNoneBox">
	<ul>
		<li class="searchNone">검색결과가 없습니다</li> 
		<li onclick="history.back();" class="listBack"> 목록으로 돌아가기</li>
	</ul>
	</div>
</div>
<div class="space"></div>
<c:import url="../common/footer.jsp"/>
</body>
</html>