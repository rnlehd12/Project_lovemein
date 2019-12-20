<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>          
<!DOCTYPE html>
<!-- 회원 신고리스트 by 귀정 -->
<html>
<head>
<meta charset="UTF-8">
<title>${loginMember.u_name}님의 신고내역</title>
<c:import url="../common/header.jsp"/>
<link rel="stylesheet" type="text/css" href="resources/css/users/userReport.css">
</head>
<body>
<div id="reportWrap">
	<p id="reportTitles">나의 신고내역  ${listCount}건</p>
	<ul id="listTitles">
		<li id="rownum">번호</li>
		<li id="rowPerson">신고회원</li>
		<li id="rowReson">신고사유</li>
		<li id="rowDate">신고일</li>
		<li id="rowAnswer">처리여부</li>
	</ul>
	<c:if test="${listCount > 0}">
		<c:forEach var="report" items="${rlist}">
			<ul>
				<li class="reportListLi" id="rownumli">${ report.rownum }</li>
				<li class="reportListLi" id="rowPerli">${ report.u_name }</li>
				<li class="reportListLi" id="rowResli">${ report.r_text }</li>
				<li class="reportListLi" id="rowDateli"><fmt:formatDate value="${report.r_date}" pattern="yy년 M월 dd일"/></li>
				<li class="reportListLi" id="redLi">
					<c:if test="${report.r_yn == 'Y' }">
						처리완료
					</c:if>
					<c:if test="${report.r_yn == 'N' }">
						대기중
					</c:if>
				</li>
			</ul>
		</c:forEach>
	</c:if>
	<c:if test="${listCount == 0}">
		<p class="nullReportList">${nullrlistMsg}</p>
	</c:if>
	<!-- //회원목록 -->
	
	<!-- 페이징 -->
	<div class="paging">
	<!-- 현재 페이지가 포함된 그룹의 페이지 숫자 출력 -->
	<c:forEach var="p" begin="${requestScope.startPage }" end="${requestScope.endPage }" step="1">
		<c:if test="${p eq requestScope.currentPage }">		
			<p class="pre_page">${p}</b>
		</c:if>
		<c:if test="${p ne requestScope.currentPage }">
			<a href="goReportList.do?page=${p}">
				<p class="pre_page" id="recentPage">${p}</p>
			</a>
		</c:if>
	</c:forEach>
	</div>
	<!-- //페이징 -->
</div>	
</body>
</html>