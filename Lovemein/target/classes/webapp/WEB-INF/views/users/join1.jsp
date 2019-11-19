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
	function gostep2(){
		
		var u_phone = $("#u_phone").val();
		location.href="gojoinStep2.do?u_phone="+ u_phone;
	}
	
	$(function(){
	   $("#sendMessageBtn").on("click", function(){
	      $.ajax({
	         url : "sendmessage.do",
	         data : $("#u_phone").val(),
	         type : "post",
	         success : function(result){
	            if(result == "ok"){
	               alert("전송 성공!");
	               console.log("result : " + result);
	               $("#d1").html("<h5>" + result + "</h5>");
	            }else{
	               alert("전송 실패!");
	            }
	         },
	         error : function(request, status, errorData){
	            console.log("error code : " + request.status 
	                  + "\nMessage : " + request.responseText
	                  + "\nError : " + errorData);
	         }
	      });
	   });
	   
	   $("#authBtn").on("click", function(){
	      
	      var auth = $("#auth").val();
	      var authNum = $("#authNum").val();
	      
	      $.ajax({
	         url : "auth.do",
	         data : { auth : auth, authNum : authNum},
	         dataType : "text",
	         type : "post",
	         success : function(data){
	      
	            /* $("#messageDiv").html("<h5>" + result + "," + num + "</h5>"); */
	            
	         },
	         error : function(request, status, errorData){
	            console.log("error code : " + request.status 
	                  + "\nMessage : " + request.responseText
	                  + "\nError : " + errorData);
	         }
	      });
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
	
	<form action="sendmessage.do" id="step1Form">
      <c:if test="${not empty phone}">
         <input type="text" name="u_phone" id="u_phone" value="${phone}" readonly>
         <button id="sendMessageBtn">인증번호전송</button>
      </c:if>
      <c:if test="${empty phone}">
         <input type="text" placeholder="휴대폰번호를 입력하세요" name="u_phone" id="u_phone">
         <button id="sendMessageBtn">인증번호전송</button>
      </c:if>
   </form>
   <form action="auth.do" method="post" id="step1AuthForm">
      <c:if test="${not empty AuthNum}">
         <input type="text" name="auth" id="auth">
         <input type="hidden" name="authNum" id="authNum" value="${AuthNum}">
         <input type="hidden" name="u_phone" id="u_phone" value="${phone}">
         <button id="authBtn">인증하기</button>
         <p class="coment">전송된 인증번호를 입력하세요.</p>
      </c:if>
   	</form>      
      <div id="messageDiv">
         <form action="auth.do" method="post" id="step1AuthForm2">
            <c:if test="${not empty message and num == 0}">
               <input type="text" name="auth" id="auth">
               <input type="hidden" name="authNum" id="authNum" value="${authNum}">
               <input type="hidden" name="u_phone" id="u_phone" value="${phone}">
               <button id="authBtn">재인증하기</button>
               <p class="coment">${message}</p>
            </c:if>
            <c:if test="${not empty message and num == 1}">
                <p class="coment">${message}</p>
               <p id="nextBtn">
				<a href="javascript:gostep2()">다음단계</a>
			   </p>
            </c:if>
         </form>
      </div>
	</div>
	<c:import url="../common/footer.jsp"/>
</body>
</html>