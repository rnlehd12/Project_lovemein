<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>     
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>럽미인:관리자페이지 회원상세페이지</title>
<link  rel= "stylesheet" type="text/css" href="resources/css/admin/adminMemberSelect.css">
</head>
<body>
<c:import url="adminHeader.jsp"/>
<div class="main">

<!-- 타이틀 -->
<h2 class="listfont">회원 상세 페이지</h2>
<!-- //타이틀 -->

<!-- 수정|삭제버튼-->
<div class="btbt">
<c:url var="mselect" value="memberDelete.do">
	<c:param name="u_no" value="${ u_no }" />
</c:url>
<a href="${mselect }"class="bt">삭제</a>
<a class="bt">수정</a>
<!-- //수정|삭제버튼 -->
</div>
<!-- 회원상세정보-->
<div class="member_detail">

<!-- 1.정보 -->
<div class="pro1_div">
	<div class="pro1_div2">
	
	<div class="profile_img_div">
	<img class="profile_img">
	</div><!-- //img div -->
	
	<div class="profile1_ul_div">
	
	<ul class="profile1_ul">
	<li>email
		<p class="Ap1">lovemein@gmail.com</p>
	</li> 
	<li>닉네임
		<p class="Ap2">럽미인</p>
	</li>
	<li>성별
		<p class="Ap3">여자</p>
	</li>
	<li>전화번호
		<p class="Ap4">010-1234-4567</p>
	</li>
	<li>푸딩
		<p class="Ap5">9999</p>
	</li>
	<li><p id="intro">소개</p>
		<div class="Ap6"><p>안냥하세요 럽미인 관리자 럽미인입니당
		안냥하세요 럽미인 관리자 럽미인입니당안냥하세요 럽미인 관리자 럽미인입니당</p></div>
	</li>
	</ul>

	</div><!-- //ul li div -->

</div>

</div><!-- //1 -->	

<!-- 2.기본정보 -->
<div class="pro2_div">
<h3 class="pro_font_g">기본정보</h3>
<div class="profile1">
	<ul>
		<li>생일
			<p class="Bp1">19.12.24</p>
		</li>
		<li>지역
			<p class="Bp2">서울</p>
		</li>
		<li>키
			<p class="Bp3">192</p>
		</li>
		<li>체형
			<p class="Bp4">통통</p>
		</li>
	</ul>
</div>
<div class="profile2">
	<ul>
		<li>직장
		<p class="Bp5">럽미인</p>
		</li>
		
		<li>직업
		<p class="Bp6">개발자</p>		
		</li>
		
		<li>학력
		<p class="Bp7">4년제 대졸</p>	
		</li>
		
		<li>학교
		<p class="Bp8">사랑대학교</p>	
		</li>
	</ul>
</div>


</div>
<!-- //2 -->
<hr>
<!-- 3.추가정보 -->
<div class="pro2_div">
<h3 class="pro_font">추가정보</h3>
<div class="profile1">
	<ul>
		<li>성격
			<p class="Cp1">도발적인</p>
		</li>
		
		<li>음주
			<p class="Cp2">자주</p>
		</li>
		<li>혈액형
			<p class="Cp3">AB형</p>
		</li>
		
	</ul>
</div>
<div class="profile2">
	<ul>
		<li>종교
			<p class="Cp4">힌두교</p>
		</li>
		<li>흡연
			<p class="Cp5">자주</p>
		</li>
		<li>인종
			<p class="Cp6">한국인</p>
		</li>
		
	</ul>
</div>
</div>
<!-- //추가정보 -->
<hr>
<!-- 4.스타일정보 -->
<h3 class="pro_font">스타일정보</h3>
<div class="pro4_div">
	<ul>
		
		<li>매력포인트
			<ul class="style1">
				<li>허세없어요</li>
				<li>경제력</li>
				<li>뭐든 잘먹어요</li>
				<li>긍정적마인드</li>
				<li>보조개</li>
			</ul>	
		</li>
		
		<li>이상형
			<ul class="style2">
				<li>표현을 잘하는 사람</li>
				<li>예의 바른 사람</li>
			</ul>
		</li>
		
		<li>관심사
			<ul class="style3">
				<li>그림 그리기</li>
				<li>노래</li>
				<li>글 쓰기</li>
				<li>커피</li>
				<li>IT</li>
			</ul>
		</li>
		
		<li>데이트스타일
			<ul class="style4">
				<li>영화보기</li>
				<li>노래방가기</li>
				<li>도서관가기</li>
				<li>카페가기</li>
				<li>쇼핑하기</li>
			</ul>
		
		</li>
		
		<li class="life_li">라이프스타일
			<ul class="style5">
				<li>아침형 인간</li>
				<li>1인가구</li>
				<li>자녀가있어요</li>
				<li>돌싱이에요</li>
				<li>야깅</li>
			</ul>
		
		
		</li>		
	</ul>
	
	
	
	
</div>
<!-- //4-->


</div><!-- 전체div -->
<!-- //회원상세정보 -->



</div><!-- //main -->
</body>
</html>