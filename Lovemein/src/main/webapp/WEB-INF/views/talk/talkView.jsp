<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>${talkPartner.p_name}님과의 대화</title>
<link href="resources/css/talk/talkView.css" rel="stylesheet">
<link href="resources/css/common/common.css" rel="stylesheet">
<script type="text/javascript" src="resources/js/jquery-3.4.1.min.js"></script>
<script type="text/javascript" src="resources/js/sockjs.min.js"></script>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<!-- <script src="http://cdn.jsdeliver.net/sockjs/1/sockjs.min.js"></script> -->
<script type="text/javascript">
/* 이미지변환 */

var sock;
function hover(e){
		e.setAttribute('src','resources/images/talk/r2.jpg');
}
function unhover(e){
		e.setAttribute('src','resources/images/talk/r3.jpg');
}

/* 기본view 모달	 */
$(document).ready(function(){
	/* swal("Hello world!"); */
		//미션틀릭시 모달팝업동작
		$(".missbt").on("click", function(){
			//alert("클릭됨");
			$(".modal").css("display", "block");
			/* $("#mission_modal").show(); */
		}); 
	 	$(".close-button").on("click", function(){
	 		$(".modal").css("display", "none");
		}); //미션틀릭시 모달팝업동작 닫기		
	 	
	 	//모달파일 업로드시 파일이름 출력
	 	var fileTarget = $(".filebox .msupload_hidden");
	 	fileTarget.on("change", function(){
	 		if(window.FileReader){
	 			var filename = $(this)[0].files[0].name;
	 		} else {
	 			var filename = $(this).val().split("/").pop().split("\\").pop(); //파일명만추출 
	 		}
			
	 		$(this).siblings(".msupload_name").val(filename);
	 	}); //모달파일 업로드시 파일이름 출력 닫기
	 	
	 	//모달파일 preview image 보이기
	 	var imgTarget = $(".preview-image .msupload_hidden")
	 	imgTarget.on('change', function(){ 
	 		var parent = $(this).parent(); 
	 		parent.children('.upload-display').remove(); 
	 		if(window.FileReader){ 
	 			//image 파일만 
	 			if (!$(this)[0].files[0].type.match(/image\//)) return; 
	 			var reader = new FileReader(); 
	 			reader.onload = function(e){ 
	 				var src = e.target.result; 
	 				parent.prepend('<div class="upload-display"><div class="upload-thumb-wrap"><img src="'+
	 					src+'" class="upload-thumb"></div></div>'); 
	 			} 
	 			reader.readAsDataURL($(this)[0].files[0]); 
	 		} else {
	 				$(this)[0].select(); 
	 				$(this)[0].blur(); 
	 				var imgSrc = document.selection.createRange().text; 
	 				parent.prepend('<div class="upload-display"><div class="upload-thumb-wrap"><img class="upload-thumb"></div></div>'); 
	 				var img = $(this).siblings('.upload-display').find('img'); 
	 				img[0].style.filter = "progid:DXImageTransform.Microsoft.AlphaImageLoader(enable='true',sizingMethod='scale',src=\""+imgSrc+"\")"; 
	 				}
	 	}); // 	 	//모달파일 preview image 보이기	

});//모달 기본docu


//미션업로드
function insertMFunc(){
	
	var form = $('#insertMForm')[0];

    // FormData 객체 생성
    var formData = new FormData(form);

    // 코드로 동적으로 데이터 추가 가능.
//                formData.append("userId", "testUser!");

    $.ajax({
        type: "POST",
        enctype: 'multipart/form-data',
        url: "insertMission.do",
        data: formData,
        processData: false,
        contentType: false,
        cache: false,
        //timeout: 600000,
        success: function (data) {
        	if(data == "success") {
        		swal("미션 SUCCESS!", "미션내역을 통해 확인할 수 있습니다!", "success");
        		$(".upload-display").remove();
         		$("#insertMForm")[0].reset();  
        		$(".modal").css("display", "none");
        		
        	} else {
        		swal("미션 FAIL!", "이미 업로드된 미션이 있습니다!", "error");
        		$(".upload-display").remove();
        		$("#insertMForm")[0].reset(); 
        		$(".modal").css("display", "none");
        	}
        },
        error : function(request, status, errorData){
			console.log("error code : " + request.status 
					+ "\nMessage : " + request.responseText
					+ "\nError : " + errorData);
		}
    });
}
//스크롤 설정
$(document).ready(function(){
	  $("#talkTextArea").scrollTop($("#talkTextArea")[0].scrollHeight);
});

//이전채팅
/* $(document).ready(function(){
	$.ajax({
		
		
	});
} */

/* 소켓 */
$(document).ready(function(){
	//연결
	connect();
	//전송클릭시
	$("#inputBtn").click(function(){
		send();
	});
	/* $('#enterBtn').click(function() { connect(); }); 
	$('#exitBtn').click(function() { disconnect(); }); */
	 
	//keypress, 엔터처리 //빈칸처리안됨
	 $('#textInput').keypress(function(event){
  	 	var keycode = (event.keyCode ? event.keyCode : event.which);
   		if(keycode == '13'){
    		send();
   		}
   		event.stopPropagation();
  	});
});// inputbtn click

//소켓연결
function connect(){
	sock = new SockJS('<c:url value="/talk"/>');
	sock.onopen = function(){ //열림메시지
		//alert("open");
		console.log('talk.jsp socket opne');
	};
	
	sock.onmessage = function(msg) { 	//받은메시지 처리
	 	var msgdata =  msg.data;
		//alert("onmessage() msgdata : " + msgdata);
		var msgJson = JSON.parse(msgdata);	 
		//alert("onmessage() msgJson : " + msgJson);
		//alert(msg);
		appendMessage(msgJson.t_con, msgJson.t_from_uno);
/* 		appendMessage(msgJson); */
		 $("#talkTextArea").scrollTop($("#talkTextArea")[0].scrollHeight);
	}
	sock.onclose = function() { //닫음메시지
		appendMessage("소켓연결종료");
		console.log("talk.jsp socket close.");
		
	}
}// socket connect 소켓연결 func

//소켓 메시지 전송 func
function send(){
	console.log($("#textInput").val());
	///alert("send() : " + $("#textInput").val());
	var msg = $("#textInput").val();
	/* var d = getTimeStamp();
	alert(d); */
 	if(msg != ""){
	  talk = {};
	  talk.c_no = '${chat.c_no}'
	  talk.t_from_uno = '${loginMember.u_no}'
	  talk.t_to_uno ='${talkPartner.p_no}'
	  talk.t_con =  $("#textInput").val()
	} 
	 
	//sock.send(JSON.stringify($("#textInput").val()));
	sock.send(JSON.stringify(talk));
	$("#textInput").val("");
	$("#textInput").focus();
} // send func 

//div 메시지 추가 func
function appendMessage(msg, funo){
	if(msg == ''){
		return false;
	} else {
		var t = getTimeStamp();
		//alert(funo);
		if(funo == '${loginMember.u_no}') {
			$("#talkTextArea").append( 
					"<div class='from-me'>"+
					"<p>"+msg+"</p>"+
					"<p class='rightTime'>"+t+"</p>"+
					"</div>"+
			   		"<div class='clear'></div>"
			   		);	
		} else {
			$("#talkTextArea").append( 
					"<div class='from-them'>"+
					"<p>"+msg+"</p>"+
					"<p class='rightTime'>"+t+"</p>"+
					"</div>"+
			   		"<div class='clear'></div>"
			   		);	
		}
/* 		$("#talkTextArea").append(msg); */
		console.log("append: " + msg);
		
		//var chatAreaHeight = $("#chatArea").height();
		//var maxScroll = $("#chatMessageArea").height() - chatAreaHeight;
		//$("#chatArea").scrollTop(maxScroll);
		
	}
	//$("#talkTextArea").append(msg);
}   // 받은 메시지처리 메소드

//날짜자르기
 function leadingZeros(n, digits) {
   var zero = '';
   n = n.toString();

   if (n.length < digits) {
     for (i = 0; i < digits - n.length; i++)
       zero += '0';
   }
   return zero + n;
 }
 //날짜가져오기
 function getTimeStamp() {
   var d = new Date();
   var s =
     leadingZeros(d.getFullYear(), 4) + '-' +
     leadingZeros(d.getMonth() + 1, 2) + '-' +
     leadingZeros(d.getDate(), 2) + ' ' +

     leadingZeros(d.getHours(), 2) + ':' +
     leadingZeros(d.getMinutes(), 2) + ':' +
     leadingZeros(d.getSeconds(), 2);

   return s;
 }

</script>


</head>
<body>
<c:import url="../common/header.jsp"/>

<div id="talkViewDiv">

<div id="talkForm_Div"><!-- 1.1채팅영역 -->
<div id="talkTitle"><p>${talkPartner.p_name} 님과의 대화</p></div>
<!-- 채팅내용 -->
<div id="talkText"><div id="talkTextArea">
<c:forEach var="talk" items="${requestScope.talkList}">
<c:if test="${talk.t_from_uno eq loginMember.u_no}">
	<div class="from-me">
   	<p>${talk.t_con}</p>
 	</div>
 	<div class="clear"></div>
</c:if>
<c:if test="${talk.t_from_uno ne loginMember.u_no}">
	<div class="from-them">
   	<p>${talk.t_con}</p>
 	</div>
 	<div class="clear"></div>
</c:if>
 </c:forEach>
</div></div>
<!-- 채팅입력 -->
<div id="talkInput">
<textarea id="textInput"></textarea>
<button id=inputBtn>보내기</button>
</div>
<div id="talkMission">
<div id="mission_1"><img class="missbt" src="resources/images/talk/m3.jpg"></div>
<div id="mission_2"><p class="missbt">${chat.c_mission}</p></div>
<div id="report_1" ><img src="resources/images/talk/r3.jpg" 
onmouseover="hover(this);" onmouseout="unhover(this);"></div>

</div>

</div><!-- 1.1채팅영역div talkform_Div 끝 -->


<!-- 1.2프로필영역 -->

<div id="profile_Div">

<div id="profile_img"><img src="resources/images/profile/${talkPartner.p_profileImg}" /></div>

<div id="profile_text">
<p id="pname">${talkPartner.p_name} 님</p>
<p id="pjob">-${talkPartner.p_job}</p>
<p id="page">-${talkPartner.p_age}세</p>
<p id="psch">-${talkPartner.p_sch}</p>
<p id="pad">-${talkPartner.p_loc}</p>
<!-- <p id="pname">김이름</p>
<p id="page">25</p>
<p id="pjob">회사원</p>
<p id="psch">한국대학교</p>
<p id="pad">서울시 강남구</p> -->
</div>
<div id="profile_feed">
<div id="profile_feed_title">
<p id="proFeP"> ${talkPartner.p_name} 님의 최근 피드</p>
</div>
<div id="profile_feed_img">

<c:set var="p_fimg" value="${talkPartner.p_feed}"/>

<c:if test="${p_fimg != null}">
<img src="resources/images/feed/${p_fimg}">
</c:if>
<c:if test="${p_fimg == null}">
<br>
<br>
<br>
<p> ${talkPartner.p_name} 님의 </p>
<p> 최근 피드 이미지가 없습니다 </p>
</c:if>
<!-- 
<img  src="resources/images/talk/hotcake1.jpg"> -->
</div>
</div> <!-- profile_feed div끝 -->
<div id="profile_mList">
<button id="mListBt" onclick="location.href='userMission.do?login_no=${loginMember.u_no}&page=1'">미션 내역 확인</button></div>

</div> <!-- 1.2프로필영역div profile_Div 끝 -->
</div> <!--1. 전체div talkViewDiv 끝 -->
<div id="mission_modal" class="modal">

<div id="mModal_con">
<div id="mM_con_title"><p>Mission</p></div>
<div id="mM_con_close">
<span class="close-button">&times;</span></div>

<div id="mM_con_text"><p>${chat.c_mission}</p></div>

<div class="filebox preview-image">

<img src="">

<form id="insertMForm" method="post" enctype="multipart/form-data">
<!-- <input class="upload_name" value="파일선택" disabled="disabled"> -->
<input class="msupload_name" value="파일선택" disabled="disabled">
<label for="ms_file">업로드</label> 		
<input type="file" name="ms_file" id="ms_file" class="msupload_hidden">
<input type="hidden" name="ms_uid" id="ms_uid" value="${loginMember.u_no}">
<input type="hidden" name="ms_pid" id="ms_pid" value="${talkPartner.p_no}">
<input type="hidden" name="ms_cno" id="ms_cno" value="${chat.c_no}">
<input type="hidden" name="ms_cmission" id="ms_cmission" value="${chat.c_mission}">
<!-- ms_uid ms_pid ms_cno ms_cmission -->
<!-- <label for="ms_submit">보내기</label> -->
</form>
<input type="button" value="보내기" onclick="insertMFunc();" id="ms_submit">


</div>

</div> <!-- mModal_con 끝. 모달 미션 content -->

</div> <!-- <mission_modalAll 끝. 미션모달 전체, 배경> -->


<br>
<c:import url="../common/footer.jsp"/>
</body>
</html>