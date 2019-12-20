<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>럽미인 결제내역 페이지</title>
<link  rel= "stylesheet" type="text/css" href="resources/css/payment/payList.css">

</head>
<body>
<c:import url="../common/header.jsp"/>
<div class="main">



<!-- 타이틀 -->
<h2 class="listfont">${loginMember.u_name }님의 결제내역  ${ listCount } 건</h2>
<!-- //타이틀 -->

<!-- 결제내역 -->
<div class="tb_div">
<table class="table">
<thead class="title">
<th>No</th>
<th>충전 푸딩</th>
<th>충전 금액</th>
<th>날짜</th>
</thead>

<c:forEach var="list" items="${ requestScope.listp }" >

<tr>
<td>${ list.p_no }</td>
<td>${ list.p_coin }</td>
<td>${ list.p_price }</td>
<td><fmt:formatDate value="${ list.p_date }" pattern="yyyy.MM.dd" /></td>
</tr>

</c:forEach>
</table>
</div>
<!-- //결제내역리스트 -->

<!-- 페이징 -->
<div class="paging">
<!-- 맨 처음 페이지 -->
<c:if test="${requestScope.currentPage le 1 }"><p class="pre_page"><<</p></c:if>
<c:if test="${requestScope.currentPage gt 1 }"><a href="payList.do?page=1&u_no=${loginMember.u_no}"><p class="pre_page"><<</p></a></c:if>
<!-- 이전 페이지 -->
<c:if test="${(currentPage - 10) lt startPage and (currentPage - 10) gt 1 }">
<a class="pre_page" href="payList.do?page=${requestScope.startPage - 10 }&u_no=${loginMember.u_no}"><p class="pre_page"><</p></a>
</c:if>
<c:if test="${(currentPage - 10) ge startPage or (currentPage - 10) le 1 }">
<p class="pre_page"><</p>
</c:if>
<!-- 현재 페이지가 포함된 그룹의 페이지 숫자 출력 -->

<c:forEach var="p" begin="${requestScope.startPage }" end="${requestScope.endPage }" step="1">
	<c:if test="${p eq requestScope.currentPage }">		
		<font><b class="page">${ p }</b></font>
	</c:if>
	<c:if test="${p ne requestScope.currentPage }"><a href="payList.do?page=${ p }&u_no=${loginMember.u_no}"><p class="pre_page" style="margin:0px 2px 0px 2px">${ p }</p></a></c:if>
</c:forEach>
<!-- 다음 페이지 -->
<c:if test="${(currentPage + 10) gt endPage and (currentPage + 10) lt maxPage }">
	<a class="next_page" href="payList.do?page=${requestScope.endPage + 10 }&u_no=${loginMember.u_no}"><p class="next_page">></p></a>
</c:if>
<c:if test="${(currentPage + 10) le endPage or (currentPage + 10) ge maxPage }">
<p class="next_page">></p>
</c:if>
<!-- 맨 마지막페이지 -->
<c:if test="${currentPage ge maxPage }"><p class="next_page">>></p></c:if>
<c:if test="${currentPage lt maxPage }"><a class="next_page" href="payList.do?page=${ requestScope.maxPage }&u_no=${loginMember.u_no}">>></a></c:if>  




</div>
<!-- //페이징 -->


</div><!-- //main -->
</body>
</html>