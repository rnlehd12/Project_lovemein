<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>전체 회원 MISSION 목록</title>
<link href="resources/css/mission/adminMissionListView.css" rel="stylesheet">
<link href="resources/css/common/common.css" rel="stylesheet">
<script type="text/javascript" src="resources/js/jquery-3.4.1.min.js"></script>
<script type="text/javascript">
$(function(){
	//검색
	$('.search-input').focus(function(){
		  $(this).parent().addClass('focus');
		}).blur(function(){
		  $(this).parent().removeClass('focus');
	});
	//라디오 버튼값	
	var radioVal;
	$("input[name=type]").change(function(){
		radioVal = $("input[name='type']:checked").val();
		/* alert("radioVal: " + radioVal); */
	});
	
	//	msta 글씨
	
	
}); // search docu


</script>
</head>
<body>
<c:import url="../common/header.jsp"/>
<div id="myMi_top">
<div id="myMissionListView">
<div id="myMi_title">
<span>미션 관리</span><span id="lcount">총 ${requestScope.listCount}개의 미션 목록이 있습니다.</span>
</div>
<div id="muMi_search2">
<form class="search-form" action="adminMSearch.do" method="get">
  <input type="search" name="keyword" value="" placeholder="Search" class="search-input">
  <button type="submit" class="search-button">
    <svg class="submit-button">
      <use xmlns:xlink="http://www.w3.org/1999/xlink" xlink:href="#search"></use>
    </svg>
  </button>
  <input type="hidden" name="page" value="1">
  <%-- <input type="hidden" name="u_no" value="${loginMember.u_no}"> --%>
  <div class="search-option">
    <div>
      <input name="type" type="radio" value="u.u_name" id="type-users" checked>
      <label for="type-users">
        <svg class="edit-pen-title">
          <use xmlns:xlink="http://www.w3.org/1999/xlink" xlink:href="#user"></use>
        </svg>
        <span>Users</span>
      </label>
    </div>
        <div>
      <input name="type" type="radio" value="c_mission" id="type-special">
      <label for="type-special">
        <svg class="edit-pen-title">
          <use xmlns:xlink="http://www.w3.org/1999/xlink" xlink:href="#special"></use>
        </svg>
        <span>Missions</span>
      </label>
    </div>
    
   <!--  <div>
      <input name="type" type="radio" value="m_con" id="type-images">
      <label for="type-images">
        <svg class="edit-pen-title">
          <use xmlns:xlink="http://www.w3.org/1999/xlink" xlink:href="#images"></use>
        </svg>
        <span>Images</span>
      </label>
    </div> -->
    <div>
      <input name="type" type="radio" value="m_sta" id="type-posts">
      <label for="type-posts">
        <svg class="edit-pen-title">
          <use xmlns:xlink="http://www.w3.org/1999/xlink" xlink:href="#post"></use>
        </svg>
        <span>Results</span>
      </label>
    </div>
  </div>
</form>
<div class="return-form">
	<div class="return" onclick="location.href='adminMission.do?page=1'">
		<svg class="edit-pen-title">
       		<use xmlns:xlink="http://www.w3.org/1999/xlink" xlink:href="#return"></use>
        </svg>
       	<span>All List</span>
	</div>
</div>
<svg xmlns="http://www.w3.org/2000/svg" width="0" height="0" display="none">
  <symbol id="search" viewBox="0 0 32 32">
    <path d="M 19.5 3 C 14.26514 3 10 7.2651394 10 12.5 C 10 14.749977 10.810825 16.807458 12.125 18.4375 L 3.28125 27.28125 L 4.71875 28.71875 L 13.5625 19.875 C 15.192542 21.189175 17.250023 22 19.5 22 C 24.73486 22 29 17.73486 29 12.5 C 29 7.2651394 24.73486 3 19.5 3 z M 19.5 5 C 23.65398 5 27 8.3460198 27 12.5 C 27 16.65398 23.65398 20 19.5 20 C 15.34602 20 12 16.65398 12 12.5 C 12 8.3460198 15.34602 5 19.5 5 z" />
  </symbol>
  <symbol id="user" viewBox="0 0 32 32">
    <path d="M 16 4 C 12.145852 4 9 7.1458513 9 11 C 9 13.393064 10.220383 15.517805 12.0625 16.78125 C 8.485554 18.302923 6 21.859881 6 26 L 8 26 C 8 21.533333 11.533333 18 16 18 C 20.466667 18 24 21.533333 24 26 L 26 26 C 26 21.859881 23.514446 18.302923 19.9375 16.78125 C 21.779617 15.517805 23 13.393064 23 11 C 23 7.1458513 19.854148 4 16 4 z M 16 6 C 18.773268 6 21 8.2267317 21 11 C 21 13.773268 18.773268 16 16 16 C 13.226732 16 11 13.773268 11 11 C 11 8.2267317 13.226732 6 16 6 z" /></symbol>
  <symbol id="images" viewbox="0 0 32 32">
    <path d="M 2 5 L 2 6 L 2 26 L 2 27 L 3 27 L 29 27 L 30 27 L 30 26 L 30 6 L 30 5 L 29 5 L 3 5 L 2 5 z M 4 7 L 28 7 L 28 20.90625 L 22.71875 15.59375 L 22 14.875 L 21.28125 15.59375 L 17.46875 19.40625 L 11.71875 13.59375 L 11 12.875 L 10.28125 13.59375 L 4 19.875 L 4 7 z M 24 9 C 22.895431 9 22 9.8954305 22 11 C 22 12.104569 22.895431 13 24 13 C 25.104569 13 26 12.104569 26 11 C 26 9.8954305 25.104569 9 24 9 z M 11 15.71875 L 20.1875 25 L 4 25 L 4 22.71875 L 11 15.71875 z M 22 17.71875 L 28 23.71875 L 28 25 L 23.03125 25 L 18.875 20.8125 L 22 17.71875 z" />
  </symbol>
  <symbol id="post" viewbox="0 0 32 32">
    <path d="M 3 5 L 3 6 L 3 23 C 3 25.209804 4.7901961 27 7 27 L 25 27 C 27.209804 27 29 25.209804 29 23 L 29 13 L 29 12 L 28 12 L 23 12 L 23 6 L 23 5 L 22 5 L 4 5 L 3 5 z M 5 7 L 21 7 L 21 12 L 21 13 L 21 23 C 21 23.73015 21.221057 24.41091 21.5625 25 L 7 25 C 5.8098039 25 5 24.190196 5 23 L 5 7 z M 7 9 L 7 10 L 7 13 L 7 14 L 8 14 L 18 14 L 19 14 L 19 13 L 19 10 L 19 9 L 18 9 L 8 9 L 7 9 z M 9 11 L 17 11 L 17 12 L 9 12 L 9 11 z M 23 14 L 27 14 L 27 23 C 27 24.190196 26.190196 25 25 25 C 23.809804 25 23 24.190196 23 23 L 23 14 z M 7 15 L 7 17 L 12 17 L 12 15 L 7 15 z M 14 15 L 14 17 L 19 17 L 19 15 L 14 15 z M 7 18 L 7 20 L 12 20 L 12 18 L 7 18 z M 14 18 L 14 20 L 19 20 L 19 18 L 14 18 z M 7 21 L 7 23 L 12 23 L 12 21 L 7 21 z M 14 21 L 14 23 L 19 23 L 19 21 L 14 21 z" />
  </symbol>
  <symbol id="special" viewbox="0 0 32 32">
    <path d="M 4 4 L 4 5 L 4 27 L 4 28 L 5 28 L 27 28 L 28 28 L 28 27 L 28 5 L 28 4 L 27 4 L 5 4 L 4 4 z M 6 6 L 26 6 L 26 26 L 6 26 L 6 6 z M 16 8.40625 L 13.6875 13.59375 L 8 14.1875 L 12.3125 18 L 11.09375 23.59375 L 16 20.6875 L 20.90625 23.59375 L 19.6875 18 L 24 14.1875 L 18.3125 13.59375 L 16 8.40625 z M 16 13.3125 L 16.5 14.40625 L 17 15.5 L 18.1875 15.59375 L 19.40625 15.6875 L 18.5 16.5 L 17.59375 17.3125 L 17.8125 18.40625 L 18.09375 19.59375 L 17 19 L 16 18.40625 L 15 19 L 14 19.59375 L 14.3125 18.40625 L 14.5 17.3125 L 13.59375 16.5 L 12.6875 15.6875 L 13.90625 15.59375 L 15.09375 15.5 L 15.59375 14.40625 L 16 13.3125 z" />
  </symbol>
  <symbol id="return" viewBox="0 0 20 20">
  	<path d="M3.24,7.51c-0.146,0.142-0.146,0.381,0,0.523l5.199,5.193c0.234,0.238,0.633,0.064,0.633-0.262v-2.634c0.105-0.007,0.212-0.011,0.321-0.011c2.373,0,4.302,1.91,4.302,4.258c0,0.957-0.33,1.809-1.008,2.602c-0.259,0.307,0.084,0.762,0.451,0.572c2.336-1.195,3.73-3.408,3.73-5.924c0-3.741-3.103-6.783-6.916-6.783c-0.307,0-0.615,0.028-0.881,0.063V2.575c0-0.327-0.398-0.5-0.633-0.261L3.24,7.51 M4.027,7.771l4.301-4.3v2.073c0,0.232,0.21,0.409,0.441,0.366c0.298-0.056,0.746-0.123,1.184-0.123c3.402,0,6.172,2.709,6.172,6.041c0,1.695-0.718,3.24-1.979,4.352c0.193-0.51,0.293-1.045,0.293-1.602c0-2.76-2.266-5-5.046-5c-0.256,0-0.528,0.018-0.747,0.05C8.465,9.653,8.328,9.81,8.328,9.995v2.074L4.027,7.771z"/>
  </symbol>
</svg>

</div>

<hr>
<div id="myMi_table">
<table>
<!-- 제목 -->
<tr><th class="m1">신청회원</th>
<th class="m2">미션</th>
<th class="m3">미션이미지</th>
<th class="m1">날짜</th>
<th class="m1">결과</th></tr>
<!-- 목록 -->
<%-- <c:if test="${!empty sessionScope.loginMember }">
	<c:url var="bdt" value="bdetail.do">
		<c:param name="bnum" value="${board.board_num }" />
		<c:param name="page" value="${ requestScope.currentPage }"/>
	</c:url>
	<a href="${bdt }">${board.board_title }</a>
</c:if> --%>
<c:forEach var="talkMission" items="${requestScope.list}">
<tr onclick="location.href='adminMDetail.do?c_from_uno=${talkMission.c_from_uno}&c_to_uno=${talkMission.c_to_uno}'">
<td>${talkMission.m_name}, ${talkMission.p_name}</td>
<%-- <tr onclick="location.href='adminMDetail.do?c_from_uno=${talkMission.c_from_uno}&c_to_uno=${talkMission.c_to_uno}&c_mission=${talkMission.c_mission}&m_con=${talkMission.m_con}&m_sta=${talkMission.m_sta}'"><td>${talkMission.m_name}, ${talkMission.p_name}</td> --%>
<td>${talkMission.c_mission}</td>
<td><img alt="" src="resources/images/mission/${talkMission.m_con}"></td>
<td>${talkMission.m_date}</td>
<c:if test="${talkMission.m_sta eq '성공'}">
<td class="msta1">${talkMission.m_sta}</td>
</c:if>
<c:if test="${talkMission.m_sta eq '실패'}">
<td class="msta2">${talkMission.m_sta}</td>
</c:if>
<c:if test="${talkMission.m_sta eq '미결'}">
<td class="msta3">${talkMission.m_sta}</td>
</c:if>
</tr>
</c:forEach>
<!-- 임시 -->
<!-- <tr><td><a href="#">보거미</a></td>
<td><a href="#">커피를 좋아하시는분들 언제나 환영이에요!</a></td>
<td><a href="#"><img alt="" src="resources/images/mission/20191211125444.jpg"></a></td>
<td><a href="#">19.12.11</a></td>
<td><a href="#">미결</a></td></tr> -->
<c:if test="${requestScope.listCount eq 0}">
<tr><td colspan="5">
<span class="errorSp">${requestScope.type}</span><span class="errorTd">의 </span><span class="errorSp">${requestScope.keyword}</span><span class="errorTd">로 검색한 결과 내역이 없습니다.</span></td>
</tr>
<tr><td colspan="5" class="errorTd">
<span class="errorSp">${requestScope.type}</span>의 <span class="errorSp">"${requestScope.keyword}"</span>로 검색한 결과 미션내역이 없습니다.</td>
</tr>
</c:if>

</table>
</div>
<c:if test="${requestScope.listCount ne 0}">
<div id="myMi_paging">
<br> <!-- 페이징 -->
<ul class="pagination modal-3">
  <!-- 맨처음 버튼 << &laquo 표시 -->
  <c:if test="${requestScope.currentPage le 1}">
    <li><a class="btdisa">first</a></li> 
  </c:if>
  <c:if test="${requestScope.currentPage gt 1}">
  	<li><a href="adminMission.do?page=1" class="first">first</a></li>
<%--   	<li><a href="adminMission.do?login_no=${loginMember.u_no}&page=1" class="first">first</a></li> --%>
  </c:if>
  	<!-- 이전버튼 &lt-->
  <c:if test="${(currentPage - 10) ge startPage or (currentPage - 10 ) le 1 }">
  	<li><a class="btdisa">&laquo</a></li>
  </c:if>
  <c:if test="${(currentPage - 10) lt startPage and (currentPage - 10) gt 1}">
  	<li><a href="adminMission.do?page=${requestScope.startPage - 10}" class="prev">&laquo</a></li>
  </c:if>
  <!-- 숫자버튼 &lt-->
  <c:forEach var="p" begin="${requestScope.startPage}" end="${requestScope.endPage}" step="1">
  	<c:if test="${p eq requestScope.currentPage}">
  		<li><a class="active">[${p}]</a></li>
  	</c:if>
  	<c:if test="${p ne requestScope.currentPage}">
  		<li><a href="adminMission.do?page=${p}" class="current">[${p}]</a></li>
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
  	<li><a href="adminMission.do?page=${requestScope.endPage + 10}" class="next">&raquogt;</a></li>
  </c:if>
<!--   <li><a href="#" class="next">&raquo;</a></li> -->
    <!-- 맨마지막 버튼 >> &raquo; 표시 -->
  <c:if test="${currentPage ge maxPage}">
 	<li><a class="btdisa">last</a></li>
  </c:if> 
  <c:if test="${currentPage lt maxPage}">
  	<li><a href="adminMission.do?page=${requestScope.maxPage}" class="last">last</a></li>
  </c:if>
 <!--  <li><a href="#" class="last">last</a></li> -->
</ul><br>


</div>
</c:if>
</div> <!-- myMissionListView div 끝 -->
<c:import url="../common/footer.jsp"/>

</body>
</html>