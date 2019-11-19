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
		
		var sel= $(".sselect").val();
		
		if(	sel == '날짜'){
			$('.search_text').css("display","inline-block");
			$(".search_text").attr("type","date");
			$(".search_text2").attr("type","hidden");
			$(".chbox").css("display","none");
			

		}else if( sel == '처리현황'){
			
			$('.search_text').css("display","none");
			$('.search_text2').attr("type","checkbox")
			$('.chbox').css("display","inline-block");
			
		
		}else if( sel == '신고한유저'|sel == '신고받은유저'|sel == '내용' ){
			$(".search_text").attr("type","text");
			$(".search_text").val("");			
			$(".chbox").css("display","none");
			$(".search_text").css("display","inline-block");
		}
	});
		


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
<form action="">
<div class="search">
<select class="sselect">
     <option  selected="selected" value="신고한유저">신고한 유저</option>
     <option value="신고받은유저">신고받은 유저</option>
     <option value="내용">내용</option>
     <option class="opdate" value="날짜">날짜</option>
     <option  value="처리현황">처리현황</option>
</select>
<input class="search_text" type="text" >
<!-- <input class="search_text" type="date" style="padding: 3px;" > -->
<div class="chbox" style="display:none">
<p class="pp">확인완료</p><input type="checkbox" class="search_text2">
<p class="pp">미확인</p><input type="checkbox" class="search_text2">
</div>
<input class="search_bt" type="submit" value="검색">
</div>
</form>
<!-- //검색창 -->

<!-- 회원목록-->
<table class="table">
<thead class="title">
<th>신고한닉네임</th>
<th>신고받은 닉네임</th>
<th>내용</th>
<th>날짜</th>
<th>처리현황</th>
</thead>

<tr>
<td>럽미인</td>
<td>쁘띠영기_071</td>
<td>피드에 음란물을 올림</td>
<td>2019.10.11</td>
<td>처리</td>
</tr>

<tr>
<td>럽미인</td>
<td>쁘띠영기_071</td>
<td>피드에 음란물을 올림</td>
<td>2019.10.12</td>
<td>미확인</td>
</tr>

<tr>
<td>럽미인</td>
<td>쁘띠영기_071</td>
<td>피드에 음란물을 올림</td>
<td>2019.10.13</td>
<td>처리</td>
</tr>

<tr>
<td>럽미인</td>
<td>쁘띠영기_071</td>
<td>피드에 음란물을 올림</td>
<td>2019.10.14</td>
<td>미확인</td>
</tr>
<tr>
<td>럽미인</td>
<td>쁘띠영기_071</td>
<td>피드에 음란물을 올림</td>
<td>2019.10.15</td>
<td>처리</td>
</tr>

<tr>
<td>럽미인</td>
<td>쁘띠영기_071</td>
<td>피드에 음란물을 올림</td>
<td>2019.10.16</td>
<td>미확인</td>
</tr>
<tr>
<td>럽미인</td>
<td>쁘띠영기_071</td>
<td>피드에 음란물을 올림</td>
<td>2019.10.17</td>
<td>처리</td>
</tr>

<tr>
<td>럽미인</td>
<td>쁘띠영기_071</td>
<td>피드에 음란물을 올림</td>
<td>2019.10.18</td>
<td>미확인</td>
</tr>

<tr>
<td>럽미인</td>
<td>쁘띠영기_071</td>
<td>피드에 음란물을 올림</td>
<td>2019.10.19</td>
<td>처리</td>
</tr>

<tr>
<td>럽미인</td>
<td>쁘띠영기_071</td>
<td>피드에 음란물을 올림</td>
<td>2019.10.20</td>
<td>미확인</td>
</tr>



</table>
<!-- //회원목록 -->

<!-- 페이징 -->
<div class="paging">
<a class="pre_page"><</a>
<a class="page">1</a>
<a class="page">2</a>
<a class="page">3</a>
<a class="page">4</a>
<a class="page">5</a>
<a class="next_page">></a>

</div>
<!-- //페이징 -->


</div><!-- //main -->
</body>
</html>