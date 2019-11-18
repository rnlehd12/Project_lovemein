/**
 * 로그인창 외부 자바스크립트
 */
	//로그인 쿠키 저장용 스크립트
	$(document).ready(function(){
		
		var userInputId = getCookie("userInputId");//저장된 쿠키값 가져오기
		
		$("input[id='u_email']").val(userInputId); 
	 
	    if($("input[id='u_email']").val() != ""){ // 그 전에 ID를 저장해서 처음 페이지 로딩
	                                           // 아이디 저장하기 체크되어있을 시,
	        $("#saveid").attr("checked", true ); // ID 저장하기를 체크 상태로 두기.
	        
	    }
	 
	    $("#saveid").change(function(){ // 체크박스에 변화가 발생시
	    	
	        if($("#saveid").is(":checked")){ // ID 저장하기 체크했을 때,
	            var userInputId = $("input[id='u_email']").val();
	            setCookie("userInputId", userInputId, 7); // 7일 동안 쿠키 보관
	            
	        }else{ // ID 저장하기 체크 해제 시,
	            deleteCookie("userInputId");
	        }
	    });
	 
	    // ID 저장하기를 체크한 상태에서 ID를 입력하는 경우, 이럴 때도 쿠키 저장.
	    $("input[id='u_email']").keyup(function(){ // ID 입력 칸에 ID를 입력할 때,
	        if($("#saveid").is(":checked")){ // ID 저장하기를 체크한 상태라면,
	            var userInputId = $("input[id='u_email']").val();
	            setCookie("userInputId", userInputId, 7);
		
		        }
		});
	    
	});
	 
	function setCookie(cookieName, value, exdays){
	    var exdate = new Date();
	    exdate.setDate(exdate.getDate() + exdays);
	    var cookieValue = escape(value) + ((exdays==null) ? "" : "; expires=" + exdate.toGMTString());
	    document.cookie = cookieName + "=" + cookieValue;
	}
	 
	function deleteCookie(cookieName){
	    var expireDate = new Date();
	    expireDate.setDate(expireDate.getDate() - 1);
	    document.cookie = cookieName + "= " + "; expires=" + expireDate.toGMTString();
	}
	 
	function getCookie(cookieName) {
	    cookieName = cookieName + '=';
	    var cookieData = document.cookie;
	    var start = cookieData.indexOf(cookieName);
	    var cookieValue = '';
	    if(start != -1){
	        start += cookieName.length;
	        var end = cookieData.indexOf(';', start);
	        if(end == -1)end = cookieData.length;
	        cookieValue = cookieData.substring(start, end);
	    }
	    return unescape(cookieValue);
	
	}
	
	// 공백으로 남겨두고 로그인할시
	function checkLoginForm(){
			
		if(loginForm.u_email.value == "") {
			    alert("이메일이 입력되지 않았습니다.");
			    loginForm.u_email.focus();
			    return false;
		}
			
		if(loginForm.u_pw.value == "") {
			    alert("비밀번호가 입력되지 않았습니다.");
			    loginForm.u_pw.focus();
			    return false;
		}
	  
	}
	
	//아이디 찾기 모달 띄우기 스크립트
	function funcFindId(){
		
		var maskHeight = $(document).height();  
		var maskWidth = $(window).width();
		
		$('#findIdWrap').css("display","block");
		$('#mask').css({'width':maskWidth,'height':maskHeight});
		$('#mask').css("background","#000");
		$('#mask').css("z-index","999");
		$('#mask').fadeTo(500,0.8);
		
	}
	
	//비밀번호 찾기 모달 띄우기 스크립트
	function funcFindPw(){
		
		var maskHeight = $(document).height();  
		var maskWidth = $(window).width();
		
		$('#findPwWrap').css("display","block");
		$('#mask').css({'width':maskWidth,'height':maskHeight});
		$('#mask').css("background","#000");
		$('#mask').css("z-index","999");
		$('#mask').fadeTo(500,0.8);
		
	}
	
	//창닫기
	function findCloseFnc(){
		
		var maskHeight = $(document).height();  
		var maskWidth = $(window).width();
		
		$('.findWrap').css("display","none");
		$('#mask').css({'width':maskWidth,'height':maskHeight});
		$('#mask').css("z-index","-1");
		$('#mask').fadeTo(800,0);

	}

	//mask를 누르면 창닫기
	function closeMaskFun(){
		
		$("#mask").css("display","none");
		$(".findWrap").css("display","none");
	}
	
