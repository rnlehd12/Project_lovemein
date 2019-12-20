<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>       
<!DOCTYPE html>
<!-- 회원정보 보기 및 수정 by 귀정 -->
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="resources/css/common/common.css">
<link rel="stylesheet" type="text/css" href="resources/css/users/myInfo.css">
<script type="text/javascript" src="resources/js/jquery-3.4.1.min.js"></script>
<script type="text/javascript" src="resources/js/users/myInfo.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	   
	  $('.tabs li').click(function(){
	    var tab_id = $(this).attr('data-tab');
	 
	    $('.tabs li').removeClass('current');
	    $('.tab-content').removeClass('current');
	 
	    $(this).addClass('current');
	    $("#"+tab_id).addClass('current');
	    $('.tabs li').css("border-bottom","none");
	    $(".tabs .current").css("border-bottom","4px solid #e42e5f");  
	    
	  });
	  
	
});

//비밀번호와 비밀번호 확인값이 같은지 체크하는 자바스크립트
function chkPwFun(){
	
	var pw = $("#u_pw").val();
	var pwchk =  $("#u_pwChk").val();
	
	if(pw != pwchk){
		
		alert('비밀번호와 비밀번호 확인값이 다릅니다. 다시 입력하세요.');
		return false;
		
	}

}

</script>
<title>${loginMember.u_name}님의 회원정보 수정</title>
</head>
<body>
	<c:import url="../common/header.jsp"/>
	<div id="myInfoWrap">
	  <ul class="tabs">
		    <li class="tab-link current" data-tab="tab-1">계정정보 수정</li>
		    <li class="tab-link" data-tab="tab-2">기본정보 수정</li>
		    <li class="tab-link" data-tab="tab-3">추가정보 수정</li>
		    <li class="tab-link" data-tab="tab-4">스타일정보 수정</li>
		    <li class="tab-link" data-tab="tab-5">이상형 수정</li>
	  </ul>
	  
	  <!-- 계정정보수정 탭 영역 시작 -->
	  <div id="tab-1" class="tab-content current">
	  	<form id="accountInfo" method="post" action="accountInfo.do">
		  	<p id="emailLabel">이메일</p>
		  	<p class="contents">${loginMember.u_email}</p>
		  	<p id="phoneLabel">휴대폰번호</p>
		  	<p class="contents">${loginMember.u_phone}</p>
		  	<p>이름</p> <input type="text" name="u_name" id="u_name" value="${loginMember.u_name}">
		  	<p id="pwLabel">비밀번호</p>
		  	<input type="password" name="u_pw" id="u_pw">
		  	<p>비밀번호확인</p> <input type="password" id="u_pwChk">
		  	<p id="chkInfoPw">(수정하지않으시려면 사용하시던 비밀번호를 다시 입력해주세요.)</p>
		  	<p>인사말 </p> <input type="text" name="u_intro" id="u_intro" value="${loginMember.u_intro}">
		  	<input type="hidden" name="u_no" id="u_no" value="${loginMember.u_no}">
		  	<input type="submit" class="submitBtn" value="수정하기" onclick="chkPwFun();">
	  	</form>
	  </div>
	  
	   <!-- 기본정보수정 탭 영역 시작 -->
	  <div id="tab-2" class="tab-content">
	  	<form id="primaryInfo" method="post" action="primaryInfo.do">
		  	<div class="inlineDiv">
		  		<p id="birthLabel">생년월일</p>
		  		<p class="contents">${loginMember.u_birth}</p>
		  		<input type="hidden" name="u_birth" value="${loginMember.u_birth}">
		  	</div>
		  	<div class="inlineDiv">
		  		<p id="ageLabel">성별</p>
		  		<input type="hidden" name="u_gender" value="${loginMember.u_gender}">
			  	<c:if test="${loginMember.u_gender eq 'M'}">
			  		<p class="contents">남성</p>
			  	</c:if>
			  	<c:if test="${loginMember.u_gender eq 'F'}">
			  		<p class="contents">여성</p>
			  	</c:if>
		  	</div>
		  	<p>거주지역</p>
		  	<input type="hidden" value="${loginMember.u_loc}" id="chkLoc">
		  	<select id="u_loc" name="u_loc">
				<option value="서울특별시" class="locOpt">서울특별시</option>
				<option value="경기도" class="locOpt">경기도</option>
				<option value="인천광역시" class="locOpt">인천광역시</option>
				<option value="대전광역시" class="locOpt">대전광역시</option>
				<option value="대전광역시" class="locOpt">울산광역시</option>
				<option value="대구광역시" class="locOpt">대구광역시</option>
				<option value="대구광역시" class="locOpt">부산광역시</option>
				<option value="강원도" class="locOpt">강원도</option>
				<option value="충청북도" class="locOpt">충청북도</option>
				<option value="충청남도" class="locOpt">충청남도</option>
				<option value="전라북도" class="locOpt">전라북도</option>
				<option value="전라남도" class="locOpt">전라남도</option>
				<option value="경상북도" class="locOpt">경상북도</option>
				<option value="경상남도" class="locOpt">경상남도</option>
				<option value="제주도" class="locOpt">제주도</option>
				<option value="기타" class="locOpt">기타</option>		  	
		  	</select>
		  	<p>학력</p>
		  	<input type="hidden" value="${loginMember.u_edu}" id="chkEdu">
		  	<select id="u_edu" name="u_edu">
				<option class="eduOpt" value="고등학교졸업미만">고등학교 졸업 미만</option>
				<option class="eduOpt" value="고등학교졸업">고등학교 졸업</option>
				<option class="eduOpt" value="전문대학졸업">전문대학 졸업</option>
				<option class="eduOpt" value="4년제대학졸업">4년제대학 졸업</option>
				<option class="eduOpt" value="석사이상">석사 이상</option>
			</select>
			<p>출신학교</p>
			<input type="text" name="u_shcool" id="u_shcool" value="${loginMember.u_shcool}">
			<p>직업</p>
			<input type="text" name="u_job" id="u_job" value="${loginMember.u_job}">
			<p>키</p>
			<input type="text" name="u_height" id="u_height" value="${loginMember.u_height}" min="140">
			<p>체형</p>
			<input type="hidden" name="chk_weight" id="chk_weight" value="${loginMember.u_weight}"/>
			<div class="weightDiv">
				<div class="wlines">
					<input type="hidden" id="weightChk" value="${loginMember.u_weight}">
					<input id="weight1" name="u_weight" type="radio" class="chks" value="슬림">
					<label for="weight1" onclick="weightChk1(this);" class="wlabel">슬림</label>
					<input id="weight2" name="u_weight" type="radio" class="chks" value="근육질">
					<label for="weight2" onclick="weightChk2(this);" class="wlabel">근육질</label>
					<input id="weight3" name="u_weight" type="radio" class="chks" value="보통">
					<label for="weight3" onclick="weightChk3(this);" class="wlabel" >보통</label>
					<input id="weight4" name="u_weight" type="radio" class="chks" value="글래머">
					<label for="weight4" onclick="weightChk4(this);" class="wlabel">글래머</label>
					<input id="weight5" name="u_weight" type="radio" class="chks" value="통통">
					<label for="weight5" onclick="weightChk5(this);" class="wlabel">통통</label>
				</div>
			</div>
			<input type="hidden" name="u_no" id="u_no" value="${loginMember.u_no}">
			<input type="submit" class="submitBtn" value="수정하기" onclick="chkPwFun();">
	  	</form>
	  </div>
	  <!-- 추가정보수정 탭 영역 시작 -->
	  <div id="tab-3" class="tab-content">
	  	<form id="addInfo" method="post" action="addInfo.do">
		  	<p>혈액형</p>
		  	<div class="bloodDiv">
				<div class="wlines">
					<input type="hidden" id="bloodChk" value="${loginMember.u_blood}">
					<input id="blood1" name="u_blood" type="radio" class="bchks" value="A">
					<label for="blood1" onclick="bloodChk1(this);" class="blabel">A형</label>
					<input id="blood2" name="u_blood" type="radio" class="bchks" value="B">
					<label for="blood2" onclick="bloodChk2(this);" class="blabel">B형</label>
					<input id="blood3" name="u_blood" type="radio" class="bchks" value="O">
					<label for="blood3" onclick="bloodChk3(this);" class="blabel" >O형</label>
					<input id="blood4" name="u_blood" type="radio" class="bchks" value="AB">
					<label for="blood4" onclick="bloodChk4(this);" class="blabel">AB형</label>
				</div>
			</div>
		  	<p>성격(최대 5개까지 선택 가능합니다.)</p>
		  	<input type="hidden" class="chkCharInput" value="${loginMember.u_char}">
		  	<div class="charDiv">
				<div class="wlines">
					<input id="char1" name="u_char" type="checkbox" class="cChks" value="조용한">
					<label for="char1" onclick="func(this);" class="label">조용한</label>
					<input id="char2" name="u_char" type="checkbox" class="cChks" value="엉뚱한">
					<label for="char2" onclick="func(this);" class="label">엉뚱한</label>
					<input id="char3" name="u_char" type="checkbox" class="cChks" value="수줍은">
					<label for="char3" onclick="func(this);" class="label">수줍은</label>
					<input id="char4" name="u_char" type="checkbox" class="cChks" value="웃긴">
					<label for="char4" onclick="func(this);" class="label">웃긴</label>
					<input id="char5" name="u_char" type="checkbox" class="cChks" value="성실한">
					<label for="char5" onclick="func(this);" class="label">성실한</label>
					<input id="char6" name="u_char" type="checkbox" class="cChks" value="단순한">
					<label for="char6" onclick="func(this);" class="label">단순한</label>
				</div>
				<div class="lines">
					<input id="char7" name="u_char" type="checkbox" class="cChks" value="주도적">
					<label for="char7" onclick="func(this);" class="label">주도적</label>
					<input id="char8" name="u_char" type="checkbox" class="cChks" value="도발적">
					<label for="char8" onclick="func(this);" class="label">도발적</label>
					<input id="char9" name="u_char" type="checkbox" class="cChks" value="활발한">
					<label for="char9" onclick="func(this);" class="label">활발한</label>
					<input id="char10" name="u_char" type="checkbox" class="cChks" value="친절한">
					<label for="char10" onclick="func(this);" class="label">친절한</label>
					<input id="char11" name="u_char" type="checkbox" class="cChks" value="털털한">
					<label for="char11" onclick="func(this);" class="label">털털한</label>
					<input id="char12" name="u_char" type="checkbox" class="cChks" value="낙천적">
					<label for="char12" onclick="func(this);" class="label">낙천적</label>
				</div>
				<div class="lines">
					<input id="char13" name="u_char" type="checkbox" class="cChks" value="정직한">
					<label for="char13" onclick="func(this);" class="label">정직한</label>
					<input id="char14" name="u_char" type="checkbox" class="cChks" value="도도한">
					<label for="char14" onclick="func(this);" class="label">도도한</label>
					<input id="char15" name="u_char" type="checkbox" class="cChks" value="애교">
					<label for="char15" onclick="func(this);" class="label">애교</label>
					<input id="char16" name="u_char" type="checkbox" class="cChks" value="감성적">
					<label for="char16" onclick="func(this);" class="label">감성적</label>
					<input id="char17" name="u_char" type="checkbox" class="cChks" value="긍정적">
					<label for="char17" onclick="func(this);" class="label">긍정적</label>
					<input id="char18" name="u_char" type="checkbox" class="cChks" value="쿨한">
					<label for="char18" onclick="func(this);" class="label">쿨한</label>
				</div>
			</div>
			<p style="margin-top:20px">종교</p>
			<input type="hidden" id="chkReiInput" value="${loginMember.u_rei}">
			<div class="reiDiv">
				<div class="wlines">
					<input id="r1" name="u_rei" type="radio" class="rChks" value="무교">
					<label for="r1" onclick="rChk1(this);" class="rlabel">무교</label>
					<input id="r2" name="u_rei" type="radio" class="rChks" value="기독교">
					<label for="r2" onclick="rChk2(this);" class="rlabel">기독교</label>
					<input id="r3" name="u_rei" type="radio" class="rChks" value="불교">
					<label for="r3" onclick="rChk3(this);" class="rlabel">불교</label>
					<input id="r4" name="u_rei" type="radio" class="rChks" value="천주교">
					<label for="r4" onclick="rChk4(this);" class="rlabel">천주교</label>
					<input id="r5" name="u_rei" type="radio" class="rChks" value="유대교">
					<label for="r5" onclick="rChk5(this);" class="rlabel">유대교</label>
					<input id="r6" name="u_rei" type="radio" class="rChks" value="힌두교">
					<label for="r6" onclick="rChk6(this);" class="rlabel">힌두교</label>
				</div>
			</div>
			<!-- 음주 -->
			<p class="priStyleTitle4">음주 </p>
			<input type="range" name="u_drinking" class="rangeInput" value="${loginMember.u_drinking}">
			<!-- 흡연 -->
			<p class="priStyleTitle4">흡연 </p>
			<input type="range" name="u_smoking" class="rangeInput" value="${loginMember.u_smoking}">
			
			<input type="hidden" name="u_no" id="u_no" value="${loginMember.u_no}">
			<input type="submit" class="submitBtn" value="수정하기" onclick="chkPwFun();">
	  	</form>
	  </div>
	   <div id="tab-4" class="tab-content">
	  		<form action="stylemodi.do" id="styleForm" method="post">
	  			<input type="hidden" name="u_no" id="u_no" value="${loginMember.u_no}">
		<table id="styleTable">
			<tr>
				<td>
					<p class="styleTitle">나의 매력포인트 </p><p class="stylesubTitle">(최대 5개까지 설정가능)</p>
					<input type="hidden" id="chk_appeal" value="${loginMember.s_appeal}">
					<div class="appealDiv">
						<div class="lines">
							<input id="appeal1" name="s_appeal" type="checkbox" class="aChks" value="운동을좋아해요">
							<label for="appeal1" onclick="funcs(this);" class="label">운동을 좋아해요</label>
							<input id="appeal2" name="s_appeal" type="checkbox" class="aChks" value="잘먹어요">
							<label for="appeal2" onclick="funcs(this);" class="label">잘먹어요</label>
							<input id="appeal3" name="s_appeal" type="checkbox" class="aChks" value="목소리가좋아요">
							<label for="appeal3" onclick="funcs(this);" class="label">목소리가 좋아요</label>
							<input id="appeal4" name="s_appeal" type="checkbox" class="aChks" value="착해요">
							<label for="appeal4" onclick="funcs(this);" class="label">착해요</label>
						</div>
						<div class="lines">
							<input id="appeal5" name="s_appeal" type="checkbox" class="aChks" value="섹시해요">
							<label for="appeal5" onclick="funcs(this);" class="label">섹시해요</label>
							<input id="appeal6" name="s_appeal" type="checkbox" class="aChks" value="솔직해요">
							<label for="appeal6" onclick="funcs(this);" class="label">솔직해요</label>
							<input id="appeal7" name="s_appeal" type="checkbox" class="aChks" value="귀여워요">
							<label for="appeal7" onclick="funcs(this);" class="label">귀여워요</label>
							<input id="appeal8" name="s_appeal" type="checkbox" class="aChks" value="피부가좋아요">
							<label for="appeal8" onclick="funcs(this);" class="label">피부가 좋아요</label>
						</div>
						<div class="lines">	
							<input id="appeal9" name="s_appeal" type="checkbox" class="aChks" value="말을예쁘게해요">
							<label for="appeal9" onclick="funcs(this);" class="label">말을 예쁘게 해요</label>
							<input id="appeal10" name="s_appeal" type="checkbox" class="aChks" value="털털해요">
							<label for="appeal10" onclick="funcs(this);" class="label">털털해요</label>
							<input id="appeal11" name="s_appeal" type="checkbox" class="aChks" value="다정해요">
							<label for="appeal11" onclick="funcs(this);" class="label">다정해요</label>
							<input id="appeal12" name="s_appeal" type="checkbox" class="aChks" value="허세가없어요">
							<label for="appeal12" onclick="funcs(this);" class="label">허세가 없어요</label>
						</div>
						<div class="lines">	
							
							<input id="appeal13" name="s_appeal" type="checkbox" class="aChks" value="한사람만바라봐요">
							<label for="appeal13" onclick="funcs(this);" class="label">한사람만 바라봐요</label>
							<input id="appeal14" name="s_appeal" type="checkbox" class="aChks" value="노래를잘해요">
							<label for="appeal14" onclick="funcs(this);" class="label">노래를 잘해요</label>
							<input id="appeal15" name="s_appeal" type="checkbox" class="aChks" value="춤을잘춰요">
							<label for="appeal15" onclick="funcs(this);" class="label">춤을 잘춰요</label>
						</div>
						<div class="lines">	
							<input id="appeal16" name="s_appeal" type="checkbox" class="aChks" value="표현잘해요">
							<label for="appeal16" onclick="funcs(this);" class="label">표현 잘해요</label>
							<input id="appeal17" name="s_appeal" type="checkbox" class="aChks" value="애교가많아요">
							<label for="appeal17" onclick="funcs(this);" class="label">애교가 많아요</label>
							<input id="appeal18" name="s_appeal" type="checkbox" class="aChks" value="배려심이많아요">
							<label for="appeal18" onclick="funcs(this);" class="label">배려심이 많아요</label>
						</div>
					</div>
				</td>
				<td rowspan="2"id="cenline">
					<div class="centerLine"></div>
				</td>
				<td>
					<p class="rstyleTitle">나의 관심사 </p><p class="stylesubTitle">(최대 3개까지 설정가능)</p>
					<input type="hidden" id="chk_inter" value="${loginMember.s_inter}">
					<div class="interDiv">
						<div class="rlines">	
							<input id="inter1" name="s_inter" type="checkbox" class="schks" value="악기연주">
							<label for="inter1" onclick="func2(this);" class="label">악기연주</label>
							<input id="inter2" name="s_inter" type="checkbox" class="schks" value="IT">
							<label for="inter2" onclick="func2(this);" class="label">IT</label>
							<input id="inter3" name="s_inter" type="checkbox" class="schks" value="술">
							<label for="inter3" onclick="func2(this);" class="label">술</label>
							<input id="inter4" name="s_inter" type="checkbox" class="schks" value="봉사활동">
							<label for="inter4" onclick="func2(this);" class="label">봉사활동</label>
							<input id="inter5" name="s_inter" type="checkbox" class="schks" value="반려동물">
							<label for="inter5" onclick="func2(this);" class="label">반려동물</label>
							<input id="inter6" name="s_inter" type="checkbox" class="schks" value="게임">
							<label for="inter6" onclick="func2(this);" class="label">게임</label>
							<input id="inter7" name="s_inter" type="checkbox" class="schks" value="웹툰">
							<label for="inter7" onclick="func2(this);" class="label">웹툰</label>
						</div>
						<div class="rlines">
							<input id="inter8" name="s_inter" type="checkbox" class="schks" value="재테크">
							<label for="inter8" onclick="func2(this);" class="label">재테크</label>
							<input id="inter9" name="s_inter" type="checkbox" class="schks" value="등산">
							<label for="inter9" onclick="func2(this);" class="label">등산</label>
							<input id="inter11" name="s_inter" type="checkbox" class="schks" value="독서">
							<label for="inter11" onclick="func2(this);" class="label">독서</label>
							<input id="inter12" name="s_inter" type="checkbox" class="schks" value="글쓰기">
							<label for="inter12" onclick="func2(this);" class="label">글쓰기</label>
							<input id="inter13" name="s_inter" type="checkbox" class="schks" value="사진촬영">
							<label for="inter13" onclick="func2(this);" class="label">사진촬영</label>
							<input id="inter14" name="s_inter" type="checkbox" class="schks" value="스포츠/운동">
							<label for="inter14" onclick="func2(this);" class="label">스포츠/운동</label>
						</div>
						<div class="rlines">
							<input id="inter15" name="s_inter" type="checkbox" class="schks" value="인테리어">
							<label for="inter15" onclick="func2(this);" class="label">인테리어</label>
							<input id="inter16" name="s_inter" type="checkbox" class="schks" value="미드정주행">
							<label for="inter16" onclick="func2(this);" class="label">미드 정주행</label>
							<input id="inter17" name="s_inter" type="checkbox" class="schks" value="노래">
							<label for="inter17" onclick="func2(this);" class="label">노래</label>
							<input id="inter18" name="s_inter" type="checkbox" class="schks" value="자기계발">
							<label for="inter18" onclick="func2(this);" class="label">자기계발</label>
							<input id="inter19" name="s_inter" type="checkbox" class="schks" value="드라이브">
							<label for="inter19" onclick="func2(this);" class="label">드라이브</label>
							<input id="inter20" name="s_inter" type="checkbox" class="schks" value="춤">
							<label for="inter20" onclick="func2(this);" class="label">춤</label>
						</div>
						<div class="rlines">
							<input id="inter21" name="s_inter" type="checkbox" class="schks" value="요리">
							<label for="inter21" onclick="func2(this);" class="label">요리</label>
							<input id="inter22" name="s_inter" type="checkbox" class="schks" value="레저">
							<label for="inter22" onclick="func2(this);" class="label">레저</label>
							<input id="inter23" name="s_inter" type="checkbox" class="schks" value="쇼핑하기">
							<label for="inter23" onclick="func2(this);" class="label">쇼핑하기</label>
							<input id="inter24" name="s_inter" type="checkbox" class="schks" value="커피">
							<label for="inter24" onclick="func2(this);" class="label">커피</label>
							<input id="inter25" name="s_inter" type="checkbox" class="schks" value="정치">
							<label for="inter25" onclick="func2(this);" class="label">정치</label>
							<input id="inter26" name="s_inter" type="checkbox" class="schks" value="패션">
							<label for="inter26" onclick="func2(this);" class="label">패션</label>
							<input id="inter27" name="s_inter" type="checkbox" class="schks" value="애니">
							<label for="inter27" onclick="func2(this);" class="label">애니</label>
						</div>
						<div class="rlines">
							<input id="inter28" name="s_inter" type="checkbox" class="schks" value="미용">
							<label for="inter28" onclick="func2(this);" class="label">미용</label>
							<input id="inter29" name="s_inter" type="checkbox" class="schks" value="외국어/어학">
							<label for="inter29" onclick="func2(this);" class="label">외국어/어학</label>
							<input id="inter30" name="s_inter" type="checkbox" class="schks" value="여행">
							<label for="inter30" onclick="func2(this);" class="label">여행</label>
							<input id="inter31" name="s_inter" type="checkbox" class="schks" value="음악">
							<label for="inter31" onclick="func2(this);" class="label">음악</label>
							<input id="inter32" name="s_inter" type="checkbox" class="schks" value="맛집탐방">
							<label for="inter32" onclick="func2(this);" class="label">맛집탐방</label>
							<input id="inter33" name="s_inter" type="checkbox" class="schks" value="영화감상">
							<label for="inter33" onclick="func2(this);" class="label">영화감상</label>
						</div>
					</div>	
				</td>
			</tr>	
			<tr>
				<td>
					<p class="styleTitle">나의 라이프스타일 </p><p class="stylesubTitle">(최대 3개까지 설정가능)</p>
					<input type="hidden" id="chk_life" value="${loginMember.s_ls}">
					<div class="lifeDiv">
						<div class="lines">
							<input id="life1" name="s_ls" type="checkbox" class="lchks" value="비공개">
							<label for="life1" onclick="func3(this);" class="label">비공개</label>
							<input id="life2" name="s_ls" type="checkbox" class="lchks" value="아침형인간">
							<label for="life2" onclick="func3(this);" class="label">아침형 인간</label>
							<input id="life3" name="s_ls" type="checkbox" class="lchks" value="교대근무">
							<label for="life3" onclick="func3(this);" class="label">교대근무</label>
							<input id="life4" name="s_ls" type="checkbox" class="lchks" value="반려동물과함께지내요">
							<label for="life4" onclick="func3(this);" class="label">반려동물과 함께 지내요</label>
						</div>
						<div class="lines">
							<input id="life5" name="s_ls" type="checkbox" class="lchks" value="룸메이트와함께지내요">
							<label for="life5" onclick="func3(this);" class="label">룸메이트와 함께 지내요</label>
							<input id="life6" name="s_ls" type="checkbox" class="lchks" value="새벽형인간/올빼미형">
							<label for="life6" onclick="func3(this);" class="label">새벽형 인간/올빼미형</label>
							<input id="life7" name="s_ls" type="checkbox" class="lchks" value="야간근무">
							<label for="life7" onclick="func3(this);" class="label">야간근무</label>
						</div>
						<div class="lines">
							<input id="life8" name="s_ls" type="checkbox" class="lchks" value="집에있는걸좋아해요">
							<label for="life8" onclick="func3(this);" class="label">집순이/집돌이에요</label>
							<input id="life9" name="s_ls" type="checkbox" class="lchks" value="1인가구">
							<label for="life9" onclick="func3(this);" class="label">1인가구</label>
							<input id="life10" name="s_ls" type="checkbox" class="lchks" value="규칙적인생활">
							<label for="life10" onclick="func3(this);" class="label">규칙적인 생활</label>
							<input id="life11" name="s_ls" type="checkbox" class="lchks" value="평일근무">
							<label for="life11" onclick="func3(this);" class="label">평일근무</label>
						</div>
						<div class="lines">	
							<input id="life12" name="s_ls" type="checkbox" class="lchks" value="주말에근무해요">
							<label for="life12" onclick="func3(this);" class="label">주말에 근무해요</label>
							<input id="life13" name="s_ls" type="checkbox" class="lchks" value="돌싱이에요">
							<label for="life13" onclick="func3(this);" class="label">돌싱이에요</label>
							<input id="life14" name="s_ls" type="checkbox" class="lchks" value="외출을좋아해요">
							<label for="life14" onclick="func3(this);" class="label">외출을 좋아해요</label>
						</div>
						<div class="lines">	
							<input id="life15" name="s_ls" type="checkbox" class="lchks" value="자녀가있어요">
							<label for="life15" onclick="func3(this);" class="label">자녀가 있어요</label>
							<input id="life16" name="s_ls" type="checkbox" class="lchks" value="기숙사/숙소에서지내요">
							<label for="life16" onclick="func3(this);" class="label">기숙사/숙소에서 지내요</label>
							<input id="life17" name="s_ls" type="checkbox" class="lchks" value="불규칙적인생활">
							<label for="life17" onclick="func3(this);" class="label">불규칙적인 생활</label>
						</div>
					</div>	
				</td>
				<td>
					<p class="rstyleTitle" id="dateText">나의 데이트스타일 </p><p class="stylesubTitle">(최대 3개까지 설정가능)</p>
					<input type="hidden" id="chk_date" value="${loginMember.s_ds}">
					<div class="DateDiv">
						<div class="rlines">	
							<input id="date1" name="s_ds" type="checkbox" class="dchks" value="집데이트">
							<label for="date1" onclick="func4(this);" class="label">집 데이트</label>
							<input id="date2" name="s_ds" type="checkbox" class="dchks" value="카페데이트">
							<label for="date2" onclick="func4(this);" class="label">카페 데이트</label>
							<input id="date3" name="s_ds" type="checkbox" class="dchks" value="영화관람">
							<label for="date3" onclick="func4(this);" class="label">영화관람</label>
							<input id="date4" name="s_ds" type="checkbox" class="dchks" value="맛집투어">
							<label for="date4" onclick="func4(this);" class="label">맛집투어</label>
						</div>
						<div class="rlines">
							<input id="date5" name="s_ds" type="checkbox" class="dchks" value="짧더라도자주만나기">
							<label for="date5" onclick="func4(this);" class="label">짧더라도 자주 만나기</label>
							<input id="date6" name="s_ds" type="checkbox" class="dchks" value="한번볼때진하게만나기">
							<label for="date6" onclick="func4(this);" class="label">한번 볼 때 진하게 만나기</label>
							<input id="date7" name="s_ds" type="checkbox" class="dchks" value="통화하기">
							<label for="date7" onclick="func4(this);" class="label">통화하기</label>
						</div>
						<div class="rlines">
							<input id="date8" name="s_ds" type="checkbox" class="dchks" value="친구같은편한만남">
							<label for="date8" onclick="func4(this);" class="label">친구같은 편한 만남</label>
							<input id="date9" name="s_ds" type="checkbox" class="dchks" value="전시회관람">
							<label for="date9" onclick="func4(this);" class="label">전시회 관람</label>
							<input id="date10" name="s_ds" type="checkbox" class="dchks" value="노래방데이트">
							<label for="date10" onclick="func4(this);" class="label">노래방 데이트</label>
						</div>	
						<div class="rlines">
							<input id="date11" name="s_ds" type="checkbox" class="dchks" value="즉흥적인만남">
							<label for="date11" onclick="func4(this);" class="label">즉흥적인 만남</label>
							<input id="date12" name="s_ds" type="checkbox" class="dchks" value="산책하기">
							<label for="date12" onclick="func4(this);" class="label">산책하기</label>
							<input id="date13" name="s_ds" type="checkbox" class="dchks" value="함께공연관람">
							<label for="date13" onclick="func4(this);" class="label">함께 공연관람</label>
							<input id="date14" name="s_ds" type="checkbox" class="dchks" value="매일 연락하기">
							<label for="date14" onclick="func4(this);" class="label">매일 연락하기</label>
						</div>
						<div class="rlines">	
							<input id="date15" name="s_ds" type="checkbox" class="dchks" value="술마시기">
							<label for="date15" onclick="func4(this);" class="label">술 마시기</label>
							<input id="date16" name="s_ds" type="checkbox" class="dchks" value="함께게임하기">
							<label for="date16" onclick="func4(this);" class="label">함께 게임하기</label>
							<input id="date17" name="s_ds" type="checkbox" class="dchks" value="함께스포츠관람">
							<label for="date17" onclick="func4(this);" class="label">함께 스포츠관람</label>
							<input id="date18" name="s_ds" type="checkbox" class="dchks" value="함께여행가기">
							<label for="date18" onclick="func4(this);" class="label">함께 여행가기</label>
						</div>
					</div>
				</td>	
			</tr>
		</table>
		<table id="submitTable">
			<tr>
				<td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td>
				<td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td>
				<td><input type="submit" value="수정하기"></td>
				<td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td>
				<td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td>
			</tr>
		</table>	
	</form>
	  </div>
	  <!-- 이상형 영역 시작 -->
	  <div id="tab-5" class="tab-content">
	  	<form method="post" id="idealForm" action="idealmodi.do">
			<p class="priStyleTitle1" id="titles1">나이</p>
			<input type="number" name="age" id="age" value="${loginMember.i_age}">
			<p class="priStyleTitle1" id="titles1">거주지역</p>
			<input type="hidden" value="${loginMember.i_loc}" id="chk_iloc">
			<select id="i_loc" name="i_loc">
				<option class="iloc" value="서울특별시">서울특별시</option>
				<option class="iloc" value="경기도">경기도</option>
				<option class="iloc" value="인천광역시">인천광역시</option>
				<option class="iloc" value="대전광역시">대전광역시</option>
				<option class="iloc" value="대전광역시">울산광역시</option>
				<option class="iloc" value="대구광역시">대구광역시</option>
				<option class="iloc" value="대구광역시">부산광역시</option>
				<option class="iloc" value="강원도">강원도</option>
				<option class="iloc" value="충청북도">충청북도</option>
				<option class="iloc" value="충청남도">충청남도</option>
				<option class="iloc" value="전라북도">전라북도</option>
				<option class="iloc" value="전라남도">전라남도</option>
				<option class="iloc" value="경상북도">경상북도</option>
				<option class="iloc" value="경상남도">경상남도</option>
				<option class="iloc" value="제주도">제주도</option>
				<option class="iloc" value="기타">기타</option>
			</select>
			<p class="priStyleTitle1">학력</p>
			<input type="hidden" value="${loginMember.i_edu}" id="chk_edu">
			<select id="i_edu" name="i_edu">
				<option class="iedu" value="고등학교졸업미만">고등학교 졸업 미만</option>
				<option class="iedu" value="고등학교졸업">고등학교 졸업</option>
				<option class="iedu" value="전문대학졸업">전문대학 졸업</option>
				<option class="iedu" value="4년제대학졸업" selected>4년제대학 졸업</option>
				<option class="iedu" value="석사이상">석사 이상</option>
			</select><br>
			<p class="priStyleTitle1">키</p>
			<input type="number" name="i_height" id="i_height" value="${loginMember.i_height}" min="140">
			<p class="priStyleTitle1">체형 </p>
			<input type="hidden" value="${loginMember.i_weight}" id="chk_iweight">
			<div class="weightDiv">
				<div class="wlines">
					<input id="iweight1" name="i_weight" type="radio" class="ichks" value="슬림">
					<label for="iweight1" onclick="iweightChk1(this);" class="wlabel">슬림</label>
					<input id="iweight2" name="i_weight" type="radio" class="ichks" value="근육질">
					<label for="iweight2" onclick="iweightChk2(this);" class="wlabel">근육질</label>
					<input id="iweight3" name="i_weight" type="radio" class="ichks" value="보통">
					<label for="iweight3" onclick="iweightChk3(this);" class="wlabel">보통</label>
					<input id="iweight4" name="i_weight" type="radio" class="ichks" value="글래머">
					<label for="iweight4" onclick="iweightChk4(this);" class="wlabel">글래머</label>
					<input id="iweight5" name="i_weight" type="radio" class="ichks" value="통통">
					<label for="iweight5" onclick="iweightChk5(this);" class="wlabel">통통</label>
				</div>
			</div>
			<div>
				<input id="u_no" name="u_no" type="hidden" value="${loginMember.u_no}">
				<input id="idealBtn" value="이상형수정완료" type="submit">
			</div>			
		</form>	
	  </div>
	</div>
	<c:import url="../common/footer.jsp"/>
</body>
</html>