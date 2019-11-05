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
		  	<p id="emailLabel">이메일</p><p id="chkInfo">(이메일은 수정하실 수 없습니다.)</p>
		  	<input type="text" name="u_email" id="u_email" value="${loginMember.u_email}" readonly>
		  	<p>이름</p> <input type="text" name="u_name" id="u_name" value="${loginMember.u_name}">
		  	<p>비밀번호 </p><input type="password" name="u_pw" id="u_pw">
		  	<p>비밀번호확인</p> <input type="password" id="u_pwChk">
		  	<p>인사말 </p> <input type="text" name="u_intro" id="u_intro" value="${loginMember.u_intro}">
		  	<input type="hidden" name="u_no" id="u_no" value="${loginMember.u_no}">
		  	<input type="submit" class="submitBtn" value="수정하기" onclick="chkPwFun();">
	  	</form>
	  </div>
	  <div id="tab-2" class="tab-content">
	  	기본정보수정 탭 영역
	  </div>
	  <div id="tab-3" class="tab-content">
	  	추가정보수정 탭 영역
	  </div>
	   <div id="tab-4" class="tab-content">
	  	이상형 수정 탭 영역
	  </div>
	</div>
</body>
</html>