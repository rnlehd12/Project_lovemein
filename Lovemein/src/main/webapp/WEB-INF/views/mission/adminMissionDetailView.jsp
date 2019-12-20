<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 MISSION 관리 상세</title>
<title>전체 회원 MISSION 목록</title>
<link href="resources/css/mission/adminMissionDetailView.css" rel="stylesheet">
<link href="resources/css/common/common.css" rel="stylesheet">
<script type="text/javascript" src="resources/js/jquery-3.4.1.min.js"></script>
<script type="text/javascript">
var c_from_uno = ${talkMission.c_from_uno};
var c_to_uno = ${talkMission.c_to_uno};
$(function(){
	 ajax(
	url:"sta",
	data:{}
	); 
});
function mstaFun(e){
	var btnVal = e.value;

	alert("btnVal : "+btnVal+ ", c_from_uno : "+ c_from_uno +", c_to_uno : "+c_to_uno );
	
	$.ajax({
		url: "mstaUpdate.do",
		data: {c_from_uno : c_from_uno, c_to_uno: c_to_uno, btnVal : btnVal},
		type:"post",
		success: function(data){
			alert("값돌아옴 data : "+ data);
		},
        error : function(request, status, errorData){
            console.log("error code : " + request.status 
                  + "\nMessage : " + request.responseText
                  + "\nError : " + errorData);
        }  
	});
	
}
</script>
</head>
<body>
<c:import url="../common/header.jsp"/>
<div id="mDetail_top">
<div id="addminMissionDetailView">
<div id="mDetail_title">
<span>미션 관리</span>
</div>
<hr>
<div id="missionDetail">
<!-- 미션박스 안 제목 -->
<div id="mission_title">
<span class="mtitl1">미션</span>
<span class="mtitl2">${talkMission.c_mission}</span>
<span class="mtitl3">회원</span>
<span class="mtitl2">${talkMission.m_name}, ${talkMission.p_name}</span>
</div>
<hr>
<!-- 미션박스 안 내용 -->
<div id="mission_content">
<div id="mission_statediv">
<span>상태 : ${talkMission.m_sta}</span>
</div>
<div id="mission_imgdiv">
<img alt="" src="resources/images/mission/${talkMission.m_con}">
</div>
<div id="mission_buttondiv">
<button id="failBun" value="2" onclick="mstaFun(this);">실패</button>
<button id="successBun" value="1" onclick="mstaFun(this);">성공</button>
</div>

</div> <!-- mission_content div -->

</div> <!-- missionDetail box 끝-->

</div><!-- addminMissionDetailView div 끝 -->
</div><!-- mDetail_top div 끝 -->
<c:import url="../common/footer.jsp"/>
</body>
</html>