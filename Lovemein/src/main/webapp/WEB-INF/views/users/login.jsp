<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<% String msg = (String)request.getAttribute("message"); %>       
<!DOCTYPE html>
<!-- 로그인페이지 by 귀정 -->
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="resources/css/common/common.css">
<link rel="stylesheet" type="text/css" href="resources/css/users/login.css">
<script type="text/javascript" src="resources/js/jquery-3.4.1.min.js"></script>
<script type="text/javascript" src="resources/js/users/loginCheck.js"></script>
<title>Lovemein - 로그인</title>
<script>
	$(function(){
		<% if(msg != null){ %>
			alert('이메일계정 또는 패스워드가 일치하지않습니다.');
		<% }%>	
	});
	$(document).ready(function(){
		$('#findChkIdBtn').on('click', function(){
			
			      var obj = new Object();
			      obj.email = $("#findid").val();
			      
			      $.ajax({
			         url : "checkId.do",
			         data : JSON.stringify(obj),
			         contentType : "application/json; charset=utf-8",
			         type : "post",
			         success : function(jsonData){
			      		
			        	  $("#sendOk").html(decodeURIComponent(jsonData.message.replace(/\+/gi," ")));
			            
			         },
			         error : function(request, status, errorData){
			            console.log("error code : " + request.status 
			                  + "\nMessage : " + request.responseText
			                  + "\nError : " + errorData);
			         }
			      });
	        });
		
		$('#findChkPwBtn').on('click', function(){
			
		      var obj = new Object();
		      obj.phone = $("#findpw").val();
		      
		      $.ajax({
		         url : "checkPw.do",
		         data : JSON.stringify(obj),
		         contentType : "application/json; charset=utf-8",
		         type : "post",
		         success : function(jsonData){
		      		
		        	 $("#sendOkPw").html(decodeURIComponent(jsonData.message.replace(/\+/gi," ")));
		            
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
	<div id="mask" onclick="closeMaskFun();"></div> 
	<div id="loginWrap">
		<table>
			<tr>
				<td>
					<div id="loginLeftArea">
						<img src="resources/images/users/login.png" id="leftImgs">
					</div>
				</td>
				<td>
					<div id="loginRightArea">
						<form action="loginCheck.do" id="loginForm" method="post" onsubmit="checkLoginForm();">
							<p id="logop">LOVE ME IN</p>
							<input type="text" name="u_email" id="u_email" placeholder="이메일주소 입력" class="ic">
							<input type="password" name="u_pw" id="u_pw" placeholder="비밀번호(특수문자,영문,숫자 포함 8자 이상)" class="ic">
							<div id="subMenu">
								<input type="checkbox" id="saveid">
								<label for="saveid" id="saveidLabel"> 아이디 저장하기</label>
								<button type="button" class="findbtn" onclick="funcFindId();">아이디 찾기</button>
								<span> | </span>
								<button type="button" class="findbtn" onclick="funcFindPw();">비밀번호 찾기</button>
			
							</div>	
							<input type="submit" value="로그인" class="ic" id="subBtn">
							<div id="joinMenu">
								<p class="join">아직 럽미인 계정이 없으신가요?</p> <a href="gojoinStep1.do">회원가입</a>
							</div>
						</form>
					</div>
				</td>
			</tr>
		</table>	
	</div>

	<div class="findWrap" id="findIdWrap">
		<button id="findClose" onclick="findCloseFnc();">X</button>
		<p id="logop">LOVE ME IN</p>
		<p class="findTitle">아이디 찾기</p>
		<p class="subTitle">이메일주소를 입력해주세요. 가입여부를 확인해드립니다.</p>
		<div class="findWrapDiv">
			<form id="chkidForm">			
			<input type="text" id="findid" name="findid" placeholder="이메일계정을 입력해주세요.">
			<button type="button" id="findChkIdBtn">아이디 찾기</button>
			<div id="sendOk"></div>
			</form>	
		</div>	
	</div>
	
	<div class="findWrap" id="findPwWrap">
		<button id="findClose" onclick="findCloseFnc();">X</button>
		<p id="logop">LOVE ME IN</p>
		<p class="findTitle">비밀번호 찾기</p>
		<p class="subTitle">가입하실때 등록하셨던 핸드폰번호를 입력해주세요.<br>임시비밀번호를 전송해드립니다.</p>
		<div class="findWrapDiv">
			<form id="chkidForm">			
			<input type="text" id="findpw" name="findpw" placeholder="핸드폰번호를 입력해주세요.">
			<button type="button" id="findChkPwBtn">임시비밀번호 전송</button>
			<div id="sendOkPw"></div>
			</form>	
		</div>	
	</div>
	<c:import url="../common/footer.jsp"/>
</body>
</html>