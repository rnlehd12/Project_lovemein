<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>님과의 대화</title>
<link href="resources/css/talk/talkView.css" rel="stylesheet">
<link href="resources/css/common/common.css" rel="stylesheet">
<script src="resources/js/jquery-3.4.1.min.js"></script>
<script type="text/javascript">
	
	function hover(e){
		e.setAttribute('src','resources/images/talk/r2.jpg');
	}
	function unhover(e){
		e.setAttribute('src','resources/images/talk/r3.jpg');
	}
	
/* 	$(document).ready(function(){
		$('#mission_modal').show();
	}); */
 	$(document).ready(function(){
 	
		$(".missbt").on("click", function(){
			alert("클릭됨");
			$(".modal").css("display", "block");
			/* $("#mission_modal").show(); */
		}); 
	 	$(".close-button").on("click", function(){
	 		$(".modal").css("display", "none");
		}); 
		 
	});
 
 // 신고이미지 변경 
</script>
</head>
<body>
<c:import url="../common/header.jsp"/>

<div id="talkViewDiv">

<div id="talkForm_Div"><!-- 1.1채팅영역 -->
<div id="talkTitle">님과의 대화</div>
<div id="talkText"><textarea id="talkTextArea"></textarea></div>
<div id="talkInput"></div>
<div id="talkMission">
<div id="mission_1"><img class="missbt" src="resources/images/talk/m3.jpg"></div>
<div id="mission_2"><p class="missbt">${talkChat.c_mission}</p></div>
<div id="report_1" ><img src="resources/images/talk/r3.jpg" 
onmouseover="hover(this);" onmouseout="unhover(this);"></div>

</div>

</div><!-- 1.1채팅영역div talkform_Div 끝 -->

<div id="profile_Div">
<!-- 1.2프로필영역 -->
<div id="profile_img"><img src="resources/images/likes/images (1).jpg"></div>
<div id="profile_text">
<p id="pname">김이름</p>
<p id="page">25세</p>
<p id="pjob">회사원</p>
<p id="psch">한국대학교</p>
<p id="pad">서울시 강남구</p>
<!-- <p id="pname">김이름</p>
<p id="page">25</p>
<p id="pjob">회사원</p>
<p id="psch">한국대학교</p>
<p id="pad">서울시 강남구</p> -->
</div>
<div id="profile_feed">
<div id="profile_feed_title">
<p id="proFeP"> 이름 님의 최근 피드</p>
</div>
<div id="profile_feed_img">
<img  src="resources/images/talk/hotcake1.jpg">
</div>
</div>
<div id="profile_mList">
<button id="mListBt">미션 내역 확인</button></div>

</div> <!-- 1.2프로필영역div profile_Div 끝 -->
</div> <!--1. 전체div talkViewDiv 끝 -->
<div id="mission_modal" class="modal">
<div id="mModal_con">
<div id="mM_con_title"><p>Mission</p></div>
<div id="mM_con_close">
<span class="close-button">&times;</span></div>
<div id="mM_con_text"><p>영화를 보고 영화표를 업로드하세요</p></div>
<div id="mM_con_upload">
<img src="">
<form>
<input class="upload_name" value="파일선택" disabled="disabled">
<label for="ms_fileUp">업로드</label>
<input type="file" id="ms_fileUp" class="fileUp_hidden">
</form>
</div>
</div> <!-- mModal_con 끝. 모달 미션 content -->
</div> <!-- <mission_modalAll 끝. 미션모달 전체, 배경> -->




</body>
</html>