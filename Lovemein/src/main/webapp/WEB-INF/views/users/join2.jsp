<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>          
<!DOCTYPE html>
<!-- 회원가입 step2 by 귀정 -->
<html>
<head>
<meta charset="UTF-8">
<title>회원가입 - Step2</title>
<link rel="stylesheet" type="text/css" href="resources/css/common/common.css">
<link rel="stylesheet" type="text/css" href="resources/css/users/join.css">
<script type="text/javascript" src="resources/js/jquery-3.4.1.min.js"></script>
</head>
<body>
	<div class="joinWrap">
	<p id="logop">LOVE ME IN</p>
	<div id="step">
		<div id="line"></div>
		<div class="radiusdiv">
			<div class="radius"></div>
			<p class="rcon">STEP.1</p>
			<p class="rconK">SMS인증</p>
		</div>
		<div class="radiusdiv">
			<div id="chkRadius" class="radius"></div>
			<p class="rcon">STEP.2</p>
			<p class="rconK">계정설정</p>
		</div>
		<div class="radiusdiv">
			<div class="radius"></div>
			<p class="rcon">STEP.3</p>
			<p class="rconK">기본정보</p>
		</div>
		<div class="radiusdiv">
			<div class="radius"></div>
			<p class="rcon">STEP.4</p>
			<p class="rconK">추가정보</p>
		</div>
		<div class="radiusdiv">
			<div class="radius"></div>
			<p class="rcon">STEP.5</p>
			<p class="rconK">이상형설정</p>
		</div>
	</div>
		<form method="post" id="step2Form" action="gojoinStep2ok.do">
			<input type="text" placeholder="이메일을 입력하세요" id="u_email" name="u_email">
			<button id="chkemail">중복확인</button>
			<input type="text" placeholder="이름을 입력하세요" id="u_name" name="u_name">
			<button id="chkname">중복확인</button>
			<input type="password" id="u_pw" name="u_pw" placeholder="비밀번호(특수문자,영문,숫자 포함 8자 이상)">
			<input type="password" id="chkpw" placeholder="비밀번호중복확인">
			<p class="pw_con">비밀번호는 특수문자,영문,숫자 포함 8자 이상입니다.</p>
			<input type="text" id="u_intro" name="u_intro" placeholder="간단한 인사말을 입력하세요.">
			<input type="hidden" name="u_phone" value="${requestScope.u_phone}">
			<input type="submit" value="다음단계" id="subBtn">
		</form>	
	</div>
</body>
</html>