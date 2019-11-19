<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>${loginMember.u_name}님의 매칭 리스트</title>
<link href="resources/css/match/matchListView.css" rel="stylesheet">
<link href="resources/css/common/common.css" rel="stylesheet">
<script type="text/javascript" src="resources/js/jquery-3.4.1.min.js"></script>
<script type="text/javascript">
$(function(){
	var login_no = ${loginMember.u_no};
	var btnNum = 0;
	
 	$.ajax({
		url: "Match.do",
		data: {login_no : login_no, btnNum: btnNum},
		type: "post",
		dataType: "json",
		success: function(obj){
			alert("값돌아옴");
			var objStr = JSON.stringify(obj);
			var jsonObj = JSON.parse(objstr);
			var outValues = $("#ajax_ulbox").html();
			
			/* for(i = 0; i <jsonObj.list.length; i++) {
				outValues = "<li><div class='matimg' "+
							"style='background-image:url("resources/images/images (1).jpg");'>"+
							"<div class='matp'>"+
							"<p id='pname'>김이름</p>"+
							"<p id='page'>25</p>"+
							"<p id='pjob'>회사원</p>"+
							"<p id='psch'>한국대</p>"+
							"<p id='pad'>서울시 강남구</p>"+
							"</div>"+
							"<div class='matright'>"+
							"<div class='math'>♥</div>"+
							"<!-- <div class="matchat"><button id="matchatbt">1:1 채팅</button></div> -->"+       
							"</div>"+
							"</div>"+
							"</li>";
					
			} */
			
		},
        error : function(request, status, errorData){
            console.log("error code : " + request.status 
                  + "\nMessage : " + request.responseText
                  + "\nError : " + errorData);
        }
	}); 
	
});
</script>
</head>
<body>
<c:import url="../common/header.jsp"/>
<div id="matdiv1">
<button class="matbt" id="matbt1">이전매칭</button>
<button class="matbt" id="matbt2">다음매칭</button>
</div>

<div id="matdiv2">
<div id="matdiv2_1">
<ul id="ajax_ulbox"> 
<li><div class="matimg" style="background-image:url('resources/images/images (1).jpg');">
<div class="matp">
<p id="pname">김이름</p>
<p id="page">25</p>
<p id="pjob">회사원</p>
<p id="psch">한국대</p>
<p id="pad">서울시 강남구</p>
</div>
<div class="matright">
<div class="math">♥</div>
<!-- <div class="matchat"><button id="matchatbt">1:1 채팅</button></div> -->
</div>
</div>
</li>



</ul>

</div> <!-- matdiv2_1 끝-->
</div> <!-- matdiv2 끝-->

</body>
</html>