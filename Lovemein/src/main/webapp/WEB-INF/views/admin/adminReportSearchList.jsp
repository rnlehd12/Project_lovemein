<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>럽미인:관리자페이지  신고검색결과</title>
<link  rel= "stylesheet" type="text/css" href="resources/css/admin/adminReportSearchList.css">
<script type="text/javascript" src="resources/js/jquery-3.4.1.min.js"></script>
<script type="text/javascript">
$(function(){
	
});//document.ready
</script>
</head>
<body>
<c:import url="adminHeader.jsp"/>
<div class="main">

<!-- 타이틀 -->
<h2 class="listfont">신고 검색 결과</h2>
<!-- //타이틀 -->
<!--  -->
<!-- 검색결과창 -->
<div class="search_result">
<h2>"<p class="search_font">
<c:if test="${ requestScope.result_text eq 'Y'}">
<c:out value="확인완료"/>
</c:if>
<c:if test="${ requestScope.result_text eq 'N'}">
<c:out value="미확인"/>
</c:if>
</p>"에 대한 검색결과</h2>
</div>
<!-- //검색결과창 -->
<!-- 회원목록-->
<table class="table">
<thead class="title">
<th>신고한닉네임</th>
<th>신고받은 닉네임</th>
<th>내용</th>
<th>날짜</th>
<th>처리현황</th>
</thead>
<c:forEach var="report" items="${  requestScope.listsr }">
<c:url var="rselect" value="adminReportDetail.do">
	<c:param name="r_no" value="${ report.r_no }" />
</c:url>
<tr>
<td><a href="${rselect}">${ report.r_send_uno }</a></td>
<td><a href="${rselect}">${ report.r_rec_uno }</a></td>
<c:if test="${fn:length(report.r_text) >= 7}">
<td><a href="${rselect}">${fn:substring(report.r_text, 0, 6)}...</a></td>
</c:if>
<c:if test="${fn:length(report.r_text) < 7}">
<td><a href="${rselect}">${ report.r_text }</a></td>
</c:if>
<td><a href="${rselect}"><fmt:formatDate value="${ report.r_date }" pattern="yyyy.MM.dd"/></a></td>
<td><a href="${rselect}">${ report.r_yn}</a></td>
</tr>
</c:forEach>
</table>
<!-- //회원목록 -->

<!-- 페이징 -->
<div class="paging">
<!-- 맨 처음 페이지 -->
<c:if test="${requestScope.currentPage le 1 }"><p class="pre_page"><<</p></c:if>
<c:if test="${requestScope.currentPage gt 1 }"><a href="adminSearchReportList.do?page=1&sselect=${sselect}&result_text=${result_text}"><p class="pre_page"><<</p></a></c:if>
<!-- 이전 페이지 -->
<c:if test="${(currentPage - 10) lt startPage and (currentPage - 10) gt 1 }">
<a class="pre_page" href="adminSearchReportList.do?page=${requestScope.startPage - 10 }&sselect=${sselect}&result_text=${result_text}"><p class="pre_page"><</p></a>
</c:if>
<c:if test="${(currentPage - 10) ge startPage or (currentPage - 10) le 1 }">
<p class="pre_page"><</p>
</c:if>
<!-- 현재 페이지가 포함된 그룹의 페이지 숫자 출력 -->

<c:forEach var="p" begin="${requestScope.startPage }" end="${requestScope.endPage }" step="1">
	<c:if test="${p eq requestScope.currentPage }">		
		<font><b class="page">${ p }</b></font>
	</c:if>
	
	<c:if test="${p ne requestScope.currentPage }"><a href="adminSearchReportList.do?page=${ p }
	&sselect=${sselect}&result_text=${result_text}"><p class="pre_page">${ p }</p></a></c:if>
</c:forEach>
<!-- 다음 페이지 -->
<c:if test="${(currentPage + 10) gt endPage and (currentPage + 10) lt maxPage }">
	<a class="next_page" href="adminSearchReportList.do?page=${requestScope.endPage + 10 }&sselect=${sselect}&result_text=${result_text}"><p class="next_page">></p></a>
</c:if>
<c:if test="${(currentPage + 10) le endPage or (currentPage + 10) ge maxPage }">
<p class="next_page">></p>
</c:if>
<!-- 맨 마지막페이지 -->
<c:if test="${currentPage ge maxPage }"><p class="next_page">>></p></c:if>
<c:if test="${currentPage lt maxPage }"><a class="next_page" href="adminSearchReportList.do?page=${ requestScope.maxPage }&sselect=${sselect}&result_text=${result_text}">>></a></c:if>  

</div>
<!-- //페이징 -->

</div><!-- //main -->
<div class="space"></div>
<c:import url="../common/footer.jsp"/>
</body>
</html>