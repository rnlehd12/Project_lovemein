<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>      
<!DOCTYPE html>
<!-- 회원가입 step1 by 귀정 -->
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="resources/css/common/common.css">
<link rel="stylesheet" type="text/css" href="resources/css/users/join.css">
<title>회원가입 - Step1</title>
<script type="text/javascript" src="resources/js/jquery-3.4.1.min.js"></script>
<script>
	//다음단계 정보입력 javaScript
	function gostep2(){
		
		var u_phone = $("#u_phone").val();
		location.href="gojoinStep2.do?u_phone="+ u_phone;
	}
	
	//인증번호 일치하는지 확인하는 function
	function authScript(){
		
		var authNum = $("#authNum").val();	//문자로보낸 인증번호
		var auth = $("#auth").val();	//사용자가 입력한 인증번호
		var phone = $("#phone").val();	//사용자의 핸드폰번호
		
		if(authNum == auth){
			
			//인증이 완료되면 auth input 비활성화
			$("#auth").attr("readonly",true);
			$("#nextLevelDiv").css("display","block");
			$(".coment").html("인증이 완료되었습니다.");
			
			
		}else{
			
			alert('인증번호가 일치하지 않습니다.');
		}
		
	}
	
	//휴대폰번호 중복체크하고, 없는 휴대폰번호라면 인증번호 전송하는 컨트롤러로 연결함.
	$(function(){
	   $("#sendMessageBtn").on("click", function(){
		  
		  var passRule = /^[0-9]{11}$/;
		  var clientPhone = $("#u_phone").val();

		  //휴대폰번호 양식에 맞는지 check
		  if(clientPhone == "" || !passRule.test(clientPhone)){
			  
			  alert("양식에 맞지않습니다. 다시 시도하세요.");
			  $("#u_phone").val("");	//값 초기화함.
			  return false;
			  
		  }else{	//조건에 일치할 시 중복체크후 인증번호 휴대폰번호로 전송함.
			  
			  //중복체크 먼저 시작
			  $.ajax({
			         url : "phoneAuthChk.do",
			         data : {clientPhone : clientPhone},
			         type : "post",
			         success : function(data){
			        	
			        	 //가입가능한 휴대폰번호일시
			            if(data.result == 0){
			    
			            	$("#authDiv").html(
			            			"<form id='step1AuthForm'>" +
			            	        "<input type='text' name='auth' id='auth'>"+
			            	        "<input type='hidden' name='authNum' id='authNum' value='" + data.AuthNum + "'>" +
			            	        "<input type='hidden' name='phone' id='phone' value='" + data.phone + "'>" +
			            	        "<button type='button' id='authBtn' onclick='authScript();'>인증하기</button>" +
			            	        "<p class='coment'>전송된 인증번호를 입력하세요.</p>" + 
			            	        "<div id='timer'></div></form>");
			            	
			            	
			            }else if(data.result == 1){
			            	
			            	alert("이미가입된 휴대폰번호입니다.");
			            	$("#u_phone").val("");	//값 초기화함.
			  			  	return false;
			            	
			            }
			            
			         },
			         error : function(request, status, errorData){
			            console.log("error code : " + request.status 
			                  + "\nMessage : " + request.responseText
			                  + "\nError : " + errorData);
			         }
			 });
			  
		  }
	  	
		});
	});	   
</script>
</head>
<body>
	<div class="joinWrap">
	<p id="logop">LOVE ME IN</p>
	<div id="step">
		<div id="line"></div>
		<div class="radiusdiv">
			<div id="chkRadius" class="radius"></div>
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
			<div class="radius"></div>
			<p class="rcon">STEP.5</p>
			<p class="rconK">이상형설정</p>
		</div>
	</div>
	<form id="step1Form">
		 <input type="text" name="u_phone" id="u_phone">
         <button type="button" id="sendMessageBtn">인증번호전송</button>
         <p id="phoneChkContents"></p>
	</form>
	<!-- 인증번호 전송되면 실행될 폼영역 -->
	<div id="authDiv"></div>
	<!-- 다음단계 이동버튼 영역-->
	<div id="nextLevelDiv">
		<button id="nextBtn" onclick="gostep2();">다음단계</button>
	</div>
	</div>
	<c:import url="../common/footer.jsp"/>
</body>
</html>