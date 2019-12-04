<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>${loginMember.u_no}님의 MISSION 목록</title>
<link href="resources/css/mission/myMissionListView.css" rel="stylesheet">
<link href="resources/css/common/common.css" rel="stylesheet">
<script type="text/javascript" src="resources/js/jquery-3.4.1.min.js"></script>
</head>
<body>
<c:import url="../common/header.jsp"/>
<div id="myMi_top">
<div id="myMissionListView">
<div id="myMi_title">
<span>미션 내역</span><span id="lcount">총 ${requestScope.listCount}개의 미션 내역이 있습니다.</span>
</div>
<div id="muMi_search">
<form>
	<input type="search" placeholder="Search">
</form>
</div>

<hr>
<div id="myMi_table">
<table>
<!-- 제목 -->
<tr><th class="m1">상대회원</th>
<th class="m2">미션</th>
<th class="m3">미션이미지</th>
<th class="m1">날짜</th>
<th class="m1">결과</th></tr>
<!-- 목록 -->
<c:forEach var="talkMission" items="${requestScope.list}">
<tr><td>${talkMission.p_name}</td>
<td>${talkMission.c_mission}</td>
<td><img alt="" src="resources/images/mission/${talkMission.m_con}"></td>
<td>${talkMission.m_date}</td>
<td>${talkMission.m_sta}</td></tr>
</c:forEach>
<!-- 임시 -->


</table>
</div>
<div id="myMi_paging">
<br> <!-- 페이징 -->
<ul class="pagination modal-3">
  <!-- 맨처음 버튼 << &laquo 표시 -->
  <c:if test="${requestScope.currentPage le 1}">
    <li><a class="btdisa">first</a></li> 
  </c:if>
  <c:if test="${requestScope.currentPage gt 1}">
  	<li><a href="#" class="first">firstgt</a></li>
  </c:if>
  	<!-- 이전버튼 &lt-->
  <c:if test="${(currentPage - 10) ge startPage or (currentPage - 10 ) le 1 }">
  	<li><a class="btdisa">&laquo</a></li>
  </c:if>
  <c:if test="${(currentPage - 10) lt startPage and (currentPage - 10) gt 1}">
  	<li><a href="#" class="prev">&laquolt</a></li>
  </c:if>
  <!-- 숫자버튼 &lt-->
  <c:forEach var="p" begin="${requestScope.startPage}" end="${requestScope.endPage}" step="1">
  	<c:if test="${p eq requestScope.currentPage}">
  		<li><a href="#" class="active">[${p}]</a></li>
  	</c:if>
  	<c:if test="${p ne requestScope.currentPage}">
  		<li><a href="#" >[${p}]</a></li>
  	</c:if>
  </c:forEach>
<!--   <li><a href="#" class="active">1</a></li> -->
<!--   <li> <a href="#">2</a></li>
  <li> <a href="#">3</a></li>
  <li> <a href="#">4</a></li>
  <li> <a href="#">5</a></li>
  <li> <a href="#">6</a></li>
  <li> <a href="#">7</a></li>
  <li> <a href="#">8</a></li>
  <li> <a href="#">9</a></li> -->
  <!-- 이전버튼 &gt;-->
  <c:if test="${(currentPage + 10) le endPage or (currentPage + 10) ge maxPage}">
  	<li><a class="btdisa">&raquo;</a></li>
  </c:if>
  <c:if test="${(currentPage + 10) gt endPage and (currentPage + 10) lt maxPage}">
  	<li><a href="#" class="next">&raquogt;</a></li>
  </c:if>
<!--   <li><a href="#" class="next">&raquo;</a></li> -->
    <!-- 맨마지막 버튼 >> &raquo; 표시 -->
  <c:if test="${currentPage ge maxPage}">
 	<li><a class="btdisa">last</a></li>
  </c:if> 
  <c:if test="${currentPage lt maxPage}">
  	<li><a href="#" class="last">last</a></li>
  </c:if>
 <!--  <li><a href="#" class="last">last</a></li> -->
</ul><br>


</div>
</div> <!-- myMissionListView div 끝 -->
<c:import url="../common/footer.jsp"/>

</body>
</html>