<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>         
<!DOCTYPE html>
<!-- 회원가입 step5 by 귀정 -->
<html>
<head>
<meta charset="UTF-8">
<title>회원가입 - Step5</title>
<link rel="stylesheet" type="text/css" href="resources/css/common/common.css">
<link rel="stylesheet" type="text/css" href="resources/css/users/join.css">
<script type="text/javascript" src="resources/js/jquery-3.4.1.min.js"></script>
<script>
function iweightChk1(obj){
	
	var $label = $(this).next();  
	
	$('input[name="i_weight"]').click(function() {

		if($('input[id="iweight1"]').prop('checked',true)){
			
			$('input[id="iweight1"]').next().css('background-color', 'rgb(234, 76, 118)').css('color','#fff');
			$('input[id="iweight2"]').next().css('background-color', 'white').css('border','1px solid rgb(234, 76, 118)').css('color','#000')
			.css('font-weight','normal');
			$('input[id="iweight3"]').next().css('background-color', 'white').css('border','1px solid rgb(234, 76, 118)').css('color','#000')
			.css('font-weight','normal');
			$('input[id="iweight4"]').next().css('background-color', 'white').css('border','1px solid rgb(234, 76, 118)').css('color','#000')
			.css('font-weight','normal');
			$('input[id="iweight5"]').next().css('background-color', 'white').css('border','1px solid rgb(234, 76, 118)').css('color','#000')
			.css('font-weight','normal');
		}

	});	
}

function iweightChk2(obj){
	
	var $label = $(this).next();  
	
	$('input[name="i_weight"]').click(function() {

		if($('input[id="iweight2"]').prop('checked',true)){
			
			$('input[id="iweight2"]').next().css('background-color', 'rgb(234, 76, 118)').css('color','#fff');
			$('input[id="iweight1"]').next().css('background-color', 'white').css('border','1px solid rgb(234, 76, 118)').css('color','#000')
			.css('font-weight','normal');
			$('input[id="iweight3"]').next().css('background-color', 'white').css('border','1px solid rgb(234, 76, 118)').css('color','#000')
			.css('font-weight','normal');
			$('input[id="iweight4"]').next().css('background-color', 'white').css('border','1px solid rgb(234, 76, 118)').css('color','#000')
			.css('font-weight','normal');
			$('input[id="iweight5"]').next().css('background-color', 'white').css('border','1px solid rgb(234, 76, 118)').css('color','#000')
			.css('font-weight','normal');
		}

	});	
}

function iweightChk3(obj){
	
	var $label = $(this).next();  
	
	$('input[name="i_weight"]').click(function() {

		if($('input[id="iweight3"]').prop('checked',true)){
			
			$('input[id="iweight3"]').next().css('background-color', 'rgb(234, 76, 118)').css('color','#fff');
			$('input[id="iweight1"]').next().css('background-color', 'white').css('border','1px solid rgb(234, 76, 118)').css('color','#000')
			.css('font-weight','normal');
			$('input[id="iweight2"]').next().css('background-color', 'white').css('border','1px solid rgb(234, 76, 118)').css('color','#000')
			.css('font-weight','normal');
			$('input[id="iweight4"]').next().css('background-color', 'white').css('border','1px solid rgb(234, 76, 118)').css('color','#000')
			.css('font-weight','normal');
			$('input[id="iweight5"]').next().css('background-color', 'white').css('border','1px solid rgb(234, 76, 118)').css('color','#000')
			.css('font-weight','normal');
		}

	});	
}

function iweightChk4(obj){
	
	var $label = $(this).next();  
	
	$('input[name="i_weight"]').click(function() {

		if($('input[id="iweight4"]').prop('checked',true)){
			
			$('input[id="iweight4"]').next().css('background-color', 'rgb(234, 76, 118)').css('color','#fff');
			$('input[id="iweight1"]').next().css('background-color', 'white').css('border','1px solid rgb(234, 76, 118)').css('color','#000')
			.css('font-weight','normal');
			$('input[id="iweight2"]').next().css('background-color', 'white').css('border','1px solid rgb(234, 76, 118)').css('color','#000')
			.css('font-weight','normal');
			$('input[id="iweight3"]').next().css('background-color', 'white').css('border','1px solid rgb(234, 76, 118)').css('color','#000')
			.css('font-weight','normal');
			$('input[id="iweight5"]').next().css('background-color', 'white').css('border','1px solid rgb(234, 76, 118)').css('color','#000')
			.css('font-weight','normal');
		}

	});	
}

function iweightChk5(obj){
	
	var $label = $(this).next();  
	
	$('input[name="i_weight"]').click(function() {

		if($('input[id="iweight5"]').prop('checked',true)){
			
			$('input[id="iweight5"]').next().css('background-color', 'rgb(234, 76, 118)').css('color','#fff');
			$('input[id="iweight1"]').next().css('background-color', 'white').css('border','1px solid rgb(234, 76, 118)').css('color','#000')
			.css('font-weight','normal');
			$('input[id="iweight2"]').next().css('background-color', 'white').css('border','1px solid rgb(234, 76, 118)').css('color','#000')
			.css('font-weight','normal');
			$('input[id="iweight3"]').next().css('background-color', 'white').css('border','1px solid rgb(234, 76, 118)').css('color','#000')
			.css('font-weight','normal');
			$('input[id="iweight4"]').next().css('background-color', 'white').css('border','1px solid rgb(234, 76, 118)').css('color','#000')
			.css('font-weight','normal');
		}

	});	
}
function laterFunc(){
	
	location.href="login.do";
}
</script>
</head> 
<body>
	<div class="joinWrap3">
		<p id="logop">LOVE ME IN</p>
		<div id="step">
			<div id="line"></div>
			<div class="radiusdiv">
				<div class="radius"></div>
				<p class="rcon">STEP.1</p>
				<p class="rconK">SMS인증</p>
			</div>
			<div class="radiusdiv">
				<div class="radius"></div>
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
				<div id="chkRadius" class="radius"></div>
				<p class="rcon">STEP.5</p>
				<p class="rconK">이상형설정</p>
			</div>
		</div>
		<form method="post" id="step5Form" action="step5ok.do">
			<p class="priStyleTitle1" id="titles1">나이</p>
			<input type="text" name="age" id="age">
			<p class="priStyleTitle1" id="titles1">거주지역</p>
			<select id="i_loc" name="i_loc">
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
			<p class="priStyleTitle1">학력</p>
			<select id="i_edu" name="i_edu">
				<option value="고등학교졸업미만">고등학교 졸업 미만</option>
				<option value="고등학교졸업">고등학교 졸업</option>
				<option value="전문대학졸업">전문대학 졸업</option>
				<option value="4년제대학졸업" selected>4년제대학 졸업</option>
				<option value="석사이상">석사 이상</option>
			</select><br>
			<p class="priStyleTitle1">키</p>
			<input type="number" name="i_height" id="i_height" value="160" min="140">
			<p class="priStyleTitle1">체형 </p>
			<div class="weightDiv">
				<div class="wlines">
					<input id="iweight1" name="i_weight" type="radio" class="chks" value="슬림">
					<label for="iweight1" onclick="iweightChk1(this);" class="wlabel">슬림</label>
					<input id="iweight2" name="i_weight" type="radio" class="chks" value="근육질">
					<label for="iweight2" onclick="iweightChk2(this);" class="wlabel">근육질</label>
					<input id="iweight3" name="i_weight" type="radio" class="chks" value="보통" checked>
					<label for="iweight3" onclick="iweightChk3(this);" class="wlabel" id="wcheck">보통</label>
					<input id="iweight4" name="i_weight" type="radio" class="chks" value="글래머">
					<label for="iweight4" onclick="iweightChk4(this);" class="wlabel">글래머</label>
					<input id="iweight5" name="i_weight" type="radio" class="chks" value="통통">
					<label for="iweight5" onclick="iweightChk5(this);" class="wlabel">통통</label>
				</div>
			</div>
			<div>
				<button id="laterBtn" type="button" onclick="laterFunc();">나중에설정하기</button>
				<input id="idealBtn" value="이상형설정완료" type="submit">
			</div>			
		</form>	
	</div>
</body>
</html>