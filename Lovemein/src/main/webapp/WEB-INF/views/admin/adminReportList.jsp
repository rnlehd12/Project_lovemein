<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>럽미인:관리자페이지  신고목록</title>
<link  rel= "stylesheet" type="text/css" href="resources/css/admin/adminReportList.css">
<script type="text/javascript" src="resources/js/jquery-3.4.1.min.js"></script>

<script type="text/javascript">
$(function(){
	
	/*input text-> date로 바꾸는 함수*/
	$(".sselect").change(function(){
		//select option 바뀌는 함수
		var sel= $(".sselect").val();
		//select안의   value 값을 담아주는 변수 sel
		if(	sel == 'r_date'){
			//sel이  옵션값 value=re_date와 같다면
			$('.search_text').css("display","inline-block"); // css inline-block 으로 바뀌고
			$(".search_text2").val("");
			$(".search_text2").attr("type","hidden"); //.search_text2 는 숨겨지고
			$(".chbox").css("display","none"); //.chbox는 보이지않게된다.
			$(".search_text").attr("type","date"); // .search_text의 input type이 date가 되며

		}else if( sel == 'r_yn'){
			//sel이  옵션값 value=re_yn와 같다면
			$(".search_text").val("");
			$('.search_text').css("display","none");// .search_text의 css inline-block 으로 바뀌고
			$('.search_text2').attr("type","radio") // .search_text2의 input type이 date가 되며
			$('.chbox').css("display","inline-block"); //.chbox는 보이지 않게 된다.
			
		
		}else if( sel == 'r_send_uno'|sel == 'r_rec_uno'|sel == 'r_text' ){
			$(".search_text").attr("type","text"); // .search_text의 input type이 text가 되며
			$(".search_text").val("");		// .search_text의  value가 사라지며
			$(".chbox").css("display","none"); //.chbox는 보이지 않게 되며.(확인처리에 관한 체크박스)
			$(".search_text").css("display","inline-block");// .search_text의 css inline-block 으로 바뀐다
		}
	});
		
// 확인처리여부 : .search_text2 체크박스yn
// 날짜, 신고보낸사람, 신고한사람, 내용은 .search_text 이것은 name이 result_text input 임

});//document.ready
</script>
</head>
<body>
<c:import url="adminHeader.jsp"/>
<div class="main">
<!-- 타이틀 -->
<h2 class="listfont">신고목록</h2>
<!-- //타이틀 -->

<!-- 검색창 -->
<form action="adminSearchReportList.do" method="post">
<input type="hidden">
<div class="search">
<select class="sselect" name="sselect">
     <option value="r_send_uno" selected="selected">신고한 유저</option>
     <option value="r_rec_uno">신고받은 유저</option>
     <option value="r_text">내용</option>
     <option value="r_date" class="opdate">날짜</option> 
     <option value="r_yn">처리현황</option>
</select>
<input class="search_text" type="text" name="result_text" >
<div class="chbox" style="display:none">
<p class="pp">확인완료</p><input type="radio" class="search_text2" name="result_text"  value="Y">
<p class="pp">미확인</p><input type="radio" class="search_text2" name="result_text" value="N">
</div>
<input class="search_bt" type="submit" value="검색">
</div>
</form>
<!-- //검색창 -->

<!-- 회원목록-->
<table class="table">
<thead class="title">
<tr>
<th>신고한닉네임</th>
<th>신고받은 닉네임</th>
<th>내용</th>
<th>날짜</th>
<th>처리현황</th>
</tr>
</thead>
<c:forEach var="report" items="${  requestScope.listr }">
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
<c:if test="${requestScope.currentPage gt 1 }"><a href="adminReportList.do?page=1"><p class="pre_page"><<</p></a></c:if>
<!-- 이전 페이지 -->
<c:if test="${(currentPage - 10) lt startPage and (currentPage - 10) gt 1 }">
<a class="pre_page" href="adminReportList.do?page=${requestScope.startPage - 10 }"><p class="pre_page"><</p></a>
</c:if>
<c:if test="${(currentPage - 10) ge startPage or (currentPage - 10) le 1 }">
<p class="pre_page"><</p>
</c:if>
<!-- 현재 페이지가 포함된 그룹의 페이지 숫자 출력 -->

<c:forEach var="p" begin="${requestScope.startPage }" end="${requestScope.endPage }" step="1">
	<c:if test="${p eq requestScope.currentPage }">		
		<font><b class="page">${ p }</b></font>
	</c:if>
	<c:if test="${p ne requestScope.currentPage }"><a href="adminReportList.do?page=${ p }"><p class="pre_page">${ p }</p></a></c:if>
</c:forEach>
<!-- 다음 페이지 -->
<c:if test="${(currentPage + 10) gt endPage and (currentPage + 10) lt maxPage }">
	<a class="next_page" href="adminReportList.do?page=${requestScope.endPage + 10 }"><p class="next_page">></p></a>
</c:if>
<c:if test="${(currentPage + 10) le endPage or (currentPage + 10) ge maxPage }">
<p class="next_page">></p>
</c:if>
<!-- 맨 마지막페이지 -->
<c:if test="${currentPage ge maxPage }"><p class="next_page">>></p></c:if>
<c:if test="${currentPage lt maxPage }"><a class="next_page" href="adminReportList.do?page=${ requestScope.maxPage }">>></a></c:if>  

</div>
<!-- //페이징 -->



</div><!-- //main -->
<div class="space"></div>
<c:import url="../common/footer.jsp"/>
</body>
</html>