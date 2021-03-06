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
	<c:param name="u_no" value="${ requestScope.member.u_no }" />
</c:url>
<c:url var="mupdate" value="memberUpdate.do">
	<c:param name="u_no" value="${ requestScope.member.u_no }" />
	<c:param name="u_name" value="${ requestScope.member.u_name }" />
	<c:param name="u_coin" value="${ requestScope.member.u_coin }" />
	<c:param name="u_intro" value="${ requestScope.member.u_intro }" />
</c:url>
<a href="${ mselect }"class="bt">삭제</a>
<a href="${ mupdate }" class="bt">수정</a>
<!-- //수정|삭제버튼 -->
</div>
<!-- 회원상세정보-->
<div class="member_detail">

<!-- 1.정보 -->
<div class="pro1_div">
	<div class="pro1_div2">
	
	<div class="profile_img_div">
	<c:if test="${ empty requestScope.member.u_profile || requestScope.member.u_profile eq 'null' }">
	<img class="profile_img"src="resources/images/admin/member/icon.png">
	</c:if>
	<c:if test="${ !empty requestScope.member.u_profile }">
	<img class="profile_img"src="resources/images/admin/member/${ requestScope.member.u_profile }">
	</c:if>
	</div><!-- //img div -->
	
	<div class="profile1_ul_div">
	
	<ul class="profile1_ul">
	<li>email
		<p class="Ap1">${ requestScope.member.u_email }</p>
	</li> 
	<li>닉네임
		<p class="Ap2">${ requestScope.member.u_name }</p>
	</li>
	<li>성별
		<p class="Ap3">${ requestScope.member.u_gender }</p>
	</li>
	<li>전화번호
		<p class="Ap4">${ requestScope.member.u_phone }</p>
	</li>
	<li>푸딩
		<p class="Ap5">${ requestScope.member.u_coin }</p>
	</li>
	<li><p id="intro">소개</p>
		<div class="Ap6"><p>${ requestScope.member.u_intro }</p></div>
	</li>
	</ul>

	</div><!-- //ul li div -->

</div>

</div><!-- //1 -->	

<!-- 2.기본정보 -->
<div class="pro2_div">
<h3 class="pro_font_g">기본정보</h3>
<div class="profile1">
	<ul style="padding:40px">
		<li>생일
			<p class="Bp1">${ requestScope.member.u_birth }</p>
		</li>
		<li>지역
			<p class="Bp2">${ requestScope.member.u_loc }</p>
		</li>
		<li>키
			<p class="Bp3">${ requestScope.member.u_height }</p>
		</li>
		<li>체형
			<p class="Bp4">${ requestScope.member.u_weight }</p>
		</li>
	</ul>
</div>
<div class="profile2">
	<ul style="padding:40px">
		<li>직장
		<p class="Bp5">${ requestScope.member.u_job }</p>
		</li>
		
		<li>직업
		<p class="Bp6">${ requestScope.member.u_weight }</p>		
		</li>
		
		<li>학력
		<p class="Bp7">${ requestScope.member. u_edu }</p>	
		</li>
		
		<li>학교
		<p class="Bp8">${ requestScope.member.u_shcool }</p>	
		</li>
	</ul>
</div>


</div>
<!-- //2 -->

<!-- 3.추가정보 -->
<div class="pro2_div">
<div class="hrdiv" style="text-align:center"><p class="hrp"></p></div>
<h3 class="pro_font">추가정보</h3>
<div class="profile1">
	<ul style="padding:40px">
		<li>성격
			<p class="Cp1">${ requestScope.member.u_char }</p>
		</li>
		
		<li>음주
			<p class="Cp2">${ requestScope.member.u_drinking }</p>
		</li>
		<li>혈액형
			<p class="Cp3">${ requestScope.member.u_blood }</p>
		</li>
		
	</ul>
</div>
<div class="profile2">
	<ul style="padding:40px" >
		<li>종교
			<p class="Cp4">${ requestScope.member.u_rei }</p>
		</li>
		<li>흡연
			<p class="Cp5">${ requestScope.member.u_smoking }</p>
		</li>
	
	</ul>
</div>
</div>

<!-- //추가정보 -->
<div class="hrdiv" style="text-align:center"><p class="hrp"></p></div>

<!-- 4.스타일정보 -->
<h3 class="pro_font">스타일정보</h3>
<div class="pro4_div">
	<ul>		
		<li>매력포인트
			<ul class="style1">
				<li>${ requestScope.member.s_appeal }</li>				
			</ul>	
		</li>
		
		<li>이상형
			<ul class="style2">
				<li>지역 : ${ requestScope.member.i_loc }</li>
				<li>나이 : ${ requestScope.member.i_age }</li>
				<li>학력 : ${ requestScope.member.i_edu }</li>
				<li>키 : ${ requestScope.member.i_weight }</li>
				<li>체형 : ${ requestScope.member.i_weight }</li>				
			</ul>
		</li>
		
		<li>관심사
			<ul class="style3">
				<li>${ requestScope.member.s_inter }</li>
				
			</ul>
		</li>
		
		<li>데이트스타일
			<ul class="style4">
				<li>${ requestScope.member.s_ds }</li>		
			</ul>
		
		</li>
		
		<li class="life_li">라이프스타일
			<ul class="style5">
				<li>${ requestScope.member.s_ls }</li>		
			</ul>
		</li>		
	</ul>
</div>
<!-- //4-->


</div><!-- 전체div -->
<!-- //회원상세정보 -->



</div><!-- //main -->
<div class="space"></div>
<c:import url="../common/footer.jsp"/>
</body>
</html>