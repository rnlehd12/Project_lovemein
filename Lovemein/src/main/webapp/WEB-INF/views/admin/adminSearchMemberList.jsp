<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>      
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>럽미인:관리자페이지 회원검색결과</title>
<link  rel= "stylesheet" type="text/css" href="resources/css/admin/adminSearchMemberList.css">
<style type="text/css">


</style>
</head>
<body>
<c:import url="adminHeader.jsp"/>
<div class="main">

<!-- 타이틀 -->
<h2 class="listfont">회원검색결과</h2>
<!-- //타이틀 -->

<!-- 검색결과창 -->
<div class="search_result">
<h2>"<p class="search_font">${ requestScope.search }</p>"에 대한 검색결과</h2>
</div>
<!-- //검색결과창 -->

<!-- 회원목록-->
<table class="table">
<thead class="title">
<th>회원번호</th>
<th>닉네임</th>
<th>이메일</th>
<th>가입날짜</th>
</thead>

<c:forEach var="listsearch" items="${  requestScope.listsm }">
<c:url var="mselect" value="memberSelect.do">
	<c:param name="u_no" value="${ listsearch.u_no }" />
	<c:param name="page" value="${ requestScope.currentPage }"/>
</c:url>
<tr>
<td><a href="${mselect}">${ listsearch.u_no }</a></td>
<td>${ listsearch.u_name }</td>
<td>${ listsearch.u_email }</td>
<td>${ listsearch.join_date }</td>
</tr>
</c:forEach>
</table>
<!-- //회원목록 -->

<!-- 페이징 -->
<div class="paging">
<!-- 맨 처음 페이지 -->
<c:if test="${requestScope.currentPage le 1 }"><p class="pre_page"><<</p></c:if>
<c:if test="${requestScope.currentPage gt 1 }"><a href="memberSearchList.do?page=1&search=${search }"><p class="pre_page"><<</p></a></c:if>
<!-- 이전 페이지 -->
<c:if test="${(currentPage - 10) lt startPage and (currentPage - 10) gt 1 }">
<a class="pre_page" href="memberSearchList.do?page=${requestScope.startPage - 10 }&search=${search }"><p class="pre_page"><</p></a>
</c:if>
<c:if test="${(currentPage - 10) ge startPage or (currentPage - 10) le 1 }">
<p class="pre_page"><</p>
</c:if>
<!-- 현재 페이지가 포함된 그룹의 페이지 숫자 출력 -->

<c:forEach var="p" begin="${requestScope.startPage }" end="${requestScope.endPage }" step="1">
	<c:if test="${p eq requestScope.currentPage }">		
		<font><b class="page">${ p }</b></font>
	</c:if>
	<c:if test="${p ne requestScope.currentPage }"><a href="memberSearchList.do?page=${ p }&search=${search }"><p class="pre_page">${ p }</p></a></c:if>
</c:forEach>
<!-- 다음 페이지 -->
<c:if test="${(currentPage + 10) gt endPage and (currentPage + 10) lt maxPage }">
	<a class="next_page" href="memberSearchList.do?page=${requestScope.endPage + 10 }&search=${search }"><p class="next_page">></p></a>
</c:if>
<c:if test="${(currentPage + 10) le endPage or (currentPage + 10) ge maxPage }">
<p class="next_page">></p>
</c:if>
<!-- 맨 마지막페이지 -->
<c:if test="${currentPage ge maxPage }"><p class="next_page">>></p></c:if>
<c:if test="${currentPage lt maxPage }"><a class="next_page" href="memberSearchList.do?page=${ requestScope.maxPage }&search=${search }">>></a></c:if>  

</div>
<!-- //페이징 -->

</div><!-- //main -->
</body>
</html>