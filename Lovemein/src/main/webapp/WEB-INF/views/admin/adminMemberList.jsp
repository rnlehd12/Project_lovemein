<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>      
 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>럽미인:관리자페이지 회원목록</title>
<link  rel= "stylesheet" type="text/css" href="resources/css/admin/adminMemberList.css">
<script type="text/javascript" src="resources/js/jquery-3.4.1.min.js"></script>
<script type="text/javascript">
$(function(){
	
	/*input text-> date로 바꾸는 함수*/
	$(".searchmenu").change(function(){
		
		var sel= $(".searchmenu").val();
		
		if(	sel == 'join_date'){
			$(".search_text").attr("type","date");
			$('.search_text').css("display","inline-block");
			$(".search_text").css("padding-top","7.5px");
			$(".search_text").css("width","165px");
		

		
		}else if( sel == 'u_name'|sel == 'u_email'){
			$(".search_text").attr("type","text");
			$(".search_text").val("");				
			$(".search_text").css("display","inline-block");
			$(".search_text").css("padding-top","12.5px");
		}
	});
		
	

});//document.ready


</script>
</head>
<body>
<c:import url="adminHeader.jsp"/>
<div class="main">
<!-- 타이틀 -->
<h2 class="listfont">회원목록</h2>
<!-- //타이틀 -->

<!-- 검색창 -->
<div class="search">
<form action="memberSearchList.do" method="post">
<select class="searchmenu" name="searchmenu">
     <option value="u_name">닉네임</option>
     <option value="u_email">이메일</option>
     <option selected="selected" value="join_date">가입날짜</option>
</select>

<input class="search_text" type="date" name="search">
<input class="search_bt" type="submit" value="검색" name="submit">

</form>
</div>
<!-- //검색창 -->

<!-- 회원목록-->
<table class="table">
<thead class="title">
<th>회원번호</th>
<th>닉네임</th>
<th>이메일</th>
<th>가입날짜</th>
</thead>
<c:forEach var="users" items="${  requestScope.listm }">

<c:url var="mselect" value="memberSelect.do">
	<c:param name="u_no" value="${ users.u_no }" />
</c:url>


<tr>
<td><a href="${mselect}">${ users.u_no }</a></td>
<td><a href="${mselect}">${ users.u_name }</a></td>
<td><a href="${mselect}">${ users.u_email }</a></td>
<td><a href="${mselect}">${ users.join_date }</a></td>
</tr>
</c:forEach>
</table>
<!-- //회원목록 -->

<!-- 페이징 -->
<div class="paging">
<!-- 맨 처음 페이지 -->
<c:if test="${requestScope.currentPage le 1 }"><p class="pre_page"><<</p></c:if>
<c:if test="${requestScope.currentPage gt 1 }"><a href="adminMemberList.do?page=1"><p class="pre_page"><<</p></a></c:if>
<!-- 이전 페이지 -->
<c:if test="${(currentPage - 10) lt startPage and (currentPage - 10) gt 1 }">
<a class="pre_page" href="adminMemberList.do?page=${requestScope.startPage - 10 }"><p class="pre_page"><</p></a>
</c:if>
<c:if test="${(currentPage - 10) ge startPage or (currentPage - 10) le 1 }">
<p class="pre_page"><</p>
</c:if>
<!-- 현재 페이지가 포함된 그룹의 페이지 숫자 출력 -->

<c:forEach var="p" begin="${requestScope.startPage }" end="${requestScope.endPage }" step="1">
	<c:if test="${p eq requestScope.currentPage }">		
		<font><b class="page">${ p }</b></font>
	</c:if>
	<c:if test="${p ne requestScope.currentPage }"><a href="adminMemberList.do?page=${ p }"><p class="pre_page">${ p }</p></a></c:if>
</c:forEach>
<!-- 다음 페이지 -->
<c:if test="${(currentPage + 10) gt endPage and (currentPage + 10) lt maxPage }">
	<a class="next_page" href="adminMemberList.do?page=${requestScope.endPage + 10 }"><p class="next_page">></p></a>
</c:if>
<c:if test="${(currentPage + 10) le endPage or (currentPage + 10) ge maxPage }">
<p class="next_page">></p>
</c:if>
<!-- 맨 마지막페이지 -->
<c:if test="${currentPage ge maxPage }"><p class="next_page">>></p></c:if>
<c:if test="${currentPage lt maxPage }"><a class="next_page" href="adminMemberList.do?page=${ requestScope.maxPage }">>></a></c:if>  

</div>
<!-- //페이징 -->


</div><!-- //main -->
<div class="space"></div>
<c:import url="../common/footer.jsp"/>
</body>
</html>