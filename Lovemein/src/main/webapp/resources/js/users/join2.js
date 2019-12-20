/**
 * join2 자바스크립트 by 귀정
 */
//이메일 중복확인 script
function mailChkScript(){
	
	var passRule = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
	var chkmail = $("#u_email").val();
	
	if($("#u_email").val() == "" || !passRule.test(chkmail)){
		
		alert("이메일란이 비어있거나 양식에 맞지않습니다.");
		return false;
		
	}else{
		
		$.ajax({
			
			 url : "checkEmail.do",
	         data : {chkmail:chkmail},
	         type : "post",
	         success : function(result){
	        	
	        	if(result.chkresult == 0){
	        		
	        		$("#checkMailMsgDiv").css("display","block").html(
	        				"<p id='checkMailMsg'>가입가능한 이메일입니다. 이 이메일로 가입을 진행하시겠습니까?</p>" +
	        				"<div id='chkDiv'>" + 
	        				"<button onclick='okmailFunc();' type='button' class='mailsub' id='ymailchk'>예</button>" + 
	        				"<button onclick='nomailFunc();' type='button' class='mailsub' id='nmailchk'>아니오</button></div>");
	        		
	        	}else{
	        		
	        		$("#u_email").val('');
	        		$("#checkMailMsgDiv").css("display","block").html(
	        				"<p id='checkMailMsg'>이미 가입된 이메일입니다. 다른 이메일을 사용하세요.</p>");
	        	}
	        	 
	         },
	         error : function(request, status, errorData){
	            console.log("error code : " + request.status 
	                  + "\nMessage : " + request.responseText
	                  + "\nError : " + errorData);
	         }        
		});	
	}
}
	
//입력한 이메일 사용 yes
function okmailFunc(){
	
	$("#xEamilicon").attr("src","resources/images/users/o.png").attr("class","ok");
	$("#checkMailMsgDiv").css("display","none");
	$("#u_email").attr("readonly",true).css("background","#eaeaea");
	$("#chkemail").attr("class","authOk").text("완료");
	
}

//입력한 이메일 사용 no
function nomailFunc(){
	
	$("#u_email").val('');
	$("#checkMailMsgDiv").css("display","none");

}

//이름 중복확인 script
function nameChkScript(){
	
	var passRule = /^[가-힣]{2,6}|[a-zA-Z]{2,10}\s[a-zA-Z]{2,10}$/;
	var chkName = $("#u_name").val();
	
	if($("#u_name").val() == "" || !passRule.test(chkName)){
		
		alert("닉네임란이 비어있거나 양식에 맞지않습니다.");
		return false;
		
	}else{
		
		$.ajax({
			
			 url : "checkName.do",
	         data : {chkName:chkName},
	         type : "post",
	         success : function(result){
	        	
	        	if(result.chkresult == 0){
	        		
	        		$("#checkNameMsgDiv").css("display","block").html(
	        				"<p id='checkMailMsg'>중복되지 않은 닉네임입니다. 이 이름으로 가입을 진행하시겠습니까?</p>" +
	        				"<div id='chkDiv'>" + 
	        				"<button onclick='oknameFunc();' type='button' class='namesub' id='ynamechk'>예</button>" + 
	        				"<button onclick='nonameFunc();' type='button' class='namesub' id='nnamechk'>아니오</button></div>");
	        		
	        	}else{
	        		
	        		$("#u_name").val('');
	        		$("#checkNameMsgDiv").css("display","block").html(
	        				"<p id='checkMailMsg'>중복된 닉네임입니다. 다른 이름을 사용하세요.</p>");
	        	}
	        	 
	         },
	         error : function(request, status, errorData){
	            console.log("error code : " + request.status 
	                  + "\nMessage : " + request.responseText
	                  + "\nError : " + errorData);
	         }        
		});	
	}
}

//입력한 이름 사용 yes
function oknameFunc(){
	
	$("#xNameicon").attr("src","resources/images/users/o.png").attr("class","ok");
	$("#checkNameMsgDiv").css("display","none");
	$("#u_name").attr("readonly",true).css("background","#eaeaea");
	$("#chkname").attr("class","authOk").text("완료");
	/*.attr("class","authName")*/
}

//입력한 이름 사용 no
function nonameFunc(){
	
	$("#u_name").val('');
	$("#checkNameMsgDiv").css("display","none");

}

//비밀번호 일치 체크
$(function(){
	
	$("#chkpw").keyup(function(){
		
		var pwd1 = $("#u_pw").val();
		var pwd2 = $("#chkpw").val();
		
		if(pwd1 != "" || pwd2 != ""){ 
			
			$.ajax({
				
				 url : "checkPwd.do",
		         data : {pwd1:pwd1,pwd2:pwd2},
		         type : "post",
		         success : function(result){
		        	
		        	 if(result.message == 1){
		        		 
		        		 $("#xPwdicon").attr("src","resources/images/users/o.png").attr("class","ok");
		        		 
		        	 }else if(result.message == 0){
		        		 
		        		 $("#xPwdicon").attr("src","resources/images/users/x.png");
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
	
	//인사말 글자수 체크(50자까지 가능)
	$("#u_intro").keyup(function(){
		
		var chkLength = $("#u_intro").val().length;
		var maxCount = 30;
		
		$.ajax({
			
			 url : "chkLengthAjax.do",
	         data : {chkLength:chkLength},
	         type : "post",
	         success : function(result){
	        	
	        	 $("#introLengthChk").text("인사말은 최대 30자까지 가능합니다.(" + result.counts + "/" + maxCount + ")");
	        	 if(result.counts > 30){
	        		 
	        		 $("#xIntroicon").attr("src","resources/images/users/x.png").attr("class","joinicon");
	        	 }else{
	        		 
	        		 $("#xIntroicon").attr("src","resources/images/users/o.png");
	        	 }
	         },
	         error : function(request, status, errorData){
	            console.log("error code : " + request.status 
	                  + "\nMessage : " + request.responseText
	                  + "\nError : " + errorData);
	         }        
		});	
		
	});
});



function subBtnFunc(){
	
	//비밀번호 정규표현식 시작
	var passRule = /^(?=.*[a-zA-Z])(?=.*[!@#$%^*+=-])(?=.*[0-9]).{8,16}$/;
	
	var chkPwd = $("#u_pw").val();
	
	if($(".authOk").length != 2){
			
		alert("중복체크를 완료해주세요.");
		return false;
		
	}else{
		
		if(!passRule.test(chkPwd)){
			
			alert("비밀번호는 특수문자,영문,숫자포함 8자 이상입니다.");
			return false;
			
		}else{
			
			//전부다 체크 class가 아닐시 return false
			if($(".ok").length != 4){
				
				alert("입력하지 않았거나 양식에 맞지않는란이 있습니다.");
				return false;
				
			}else{
				
				return true;
			}
		}
	}

}