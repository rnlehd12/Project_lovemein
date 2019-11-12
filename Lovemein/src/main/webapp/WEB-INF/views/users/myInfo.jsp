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
		    <li class="tab-link" data-tab="tab-4">이상형 수정</li>
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
		  	</div>
		  	<div class="inlineDiv">
		  		<p id="ageLabel">성별</p>
			  	<c:if test="${loginMember.u_gender eq 'M'}">
			  		<p class="contents">남성</p>
			  	</c:if>
			  	<c:if test="${loginMember.u_gender eq 'F'}">
			  		<p class="contents">여성</p>
			  	</c:if>
		  	</div>
		  	<p>거주지역</p>
		  	<select id="u_loc" name="u_loc">
				<option value="${loginMember.u_loc}" selected>${loginMember.u_loc}</option>
				<option value="서울특별시">서울특별시</option>
				<option value="경기도">경기도</option>
				<option value="인천광역시">인천광역시</option>
				<option value="대전광역시">대전광역시</option>
				<option value="대전광역시">울산광역시</option>
				<option value="대구광역시">대구광역시</option>
				<option value="대구광역시">부산광역시</option>
				<option value="강원도">강원도</option>
				<option value="충청북도">충청북도</option>
				<option value="충청남도">충청남도</option>
				<option value="전라북도">전라북도</option>
				<option value="전라남도">전라남도</option>
				<option value="경상북도">경상북도</option>
				<option value="경상남도">경상남도</option>
				<option value="제주도">제주도</option>
				<option value="기타">기타</option>		  	
		  	</select>
		  	<p>학력</p>
		  	<select id="u_edu" name="u_edu">
		  		<option value="${loginMember.u_edu}" selected>${loginMember.u_edu}</option>
				<option value="고등학교졸업미만">고등학교 졸업 미만</option>
				<option value="고등학교졸업">고등학교 졸업</option>
				<option value="전문대학졸업">전문대학 졸업</option>
				<option value="4년제대학졸업">4년제대학 졸업</option>
				<option value="석사이상">석사 이상</option>
			</select>
			<p>출신학교</p>
			<input type="text" name="u_shcool" id="u_shcool" value="${loginMember.u_shcool}">
			<p>직업</p>
			<input type="text" name="u_job" id="u_job" value="${loginMember.u_job}">
			<p>키</p>
			<input type="text" name="u_height" id="u_height" value="${loginMember.u_height}" min="140">
			<p>체형</p>
			<div class="weightDiv">
				<div class="wlines">
					<input type="hidden" id="weightChk" value="${loginMember.u_weight}">
					<input id="weight1" name="u_weight" type="radio" class="chks" value="슬림">
					<label for="weight1" onclick="weightChk1(this);" class="wlabel">슬림</label>
					<input id="weight2" name="u_weight" type="radio" class="chks" value="근육질">
					<label for="weight2" onclick="weightChk2(this);" class="wlabel">근육질</label>
					<input id="weight3" name="u_weight" type="radio" class="chks" value="보통" checked>
					<label for="weight3" onclick="weightChk3(this);" class="wlabel" id="wcheck">보통</label>
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
	  <div id="tab-3" class="tab-content">
	  	추가정보수정 탭 영역
	  </div>
	   <div id="tab-4" class="tab-content">
	  	이상형 수정 탭 영역
	  </div>
	</div>
	<c:import url="../common/footer.jsp"/>
</body>
</html>