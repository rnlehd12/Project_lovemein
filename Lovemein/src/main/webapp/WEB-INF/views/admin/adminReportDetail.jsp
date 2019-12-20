<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>럽미인:관리자 신고 상세 페이지</title>
<link  rel= "stylesheet" type="text/css" href="resources/css/admin/adminReportDetail.css">

<script type="text/javascript" src="resources/js/jquery-3.4.1.min.js"></script>
<script type="text/javascript">

$(function(){
	var r_no = $('#r_no').val();
	var r_yn = $('#r_yn').val();
	var u_no = $('#u_no').val();


	/*확인버튼*/


	$(".confirm_bt").click(function(){
		
		$.ajax({
			url : "adminReportResult.do",
			data : { r_no: r_no,
				 r_yn : r_yn},
			type : "post",
			success: function(obj){
				var objStr = JSON.stringify(obj);
				var jsonObj = JSON.parse(objStr);
				var outValues = $(".confirm_bt").html();
					
			 	$(".confirm_bt").attr("value","확인완료"); 
				$(".confirm_bt").css("color", "black").css("background","white").css("border","1px solid black"); 
				for(var i in jsonObj.list){
					outValues += decodeURIComponent(jsonObj.list[i].r_yn).replace(/\+/gi, " ")
					
				} //for
				
				
				
			
				}, //success
		         error : function(request, status, errorData){
		             console.log("error code : " + request.status 
		                   + "\nMessage : " + request.responseText
		                   + "\nError : " + errorData);
		         }//error
		      
		});//ajax
	
	});//function
	/*탈퇴버튼*/
	
	$(".outbt").click(function(){
	

			$.ajax({
				url : "memberDelete.do",
				data : { u_no: u_no},
				type : "post",
				success: function(){
					
					$(".outbt").text("탈퇴완료");		
					$(".outbt").css("color", "#2b2b2b").css("background","white").css("border","1px solid #2b2b2b");
					
					}//success
		
			});//ajax
		
		
	});//function


	
});//document.ready
</script>
</head>
<body>
<c:import url="adminHeader.jsp"/>
<div class="main">
<!-- 타이틀 -->
<h2 class="listfont">신고상세페이지</h2>
<!-- //타이틀 -->

<!-- 신고 상세BOX -->
<div class="report_detail">

<ul id="detailul" style="padding: 30px;">
	<li class="name">
		<p class="pname">신고자</p>
		<p>${requestScope.rlist.r_send_uno }</p>
	</li>
	
	<li class="unum">
		<p class="punum">신고받은 자</p>

		<p>${requestScope.rlist.r_rec_uno }<a class="outbt" style="cursor:pointer">탈퇴</a></p>
		<input type="hidden" value="${requestScope.rlist.u_no }" id="u_no">
		
	</li>
	
	<li class="date">
		<p class="pdate">날짜</p>
		<p><fmt:formatDate value="${requestScope.rlist.r_date}" pattern="yyyy.MM.dd"/></p>
	
	</li>
	
	<li class="text">
		<p class="ptext">신고내용</p>
		
		<p>${requestScope.rlist.r_text}</p>
	</li>

	<li>
	<input type="hidden" value="${requestScope.rlist.r_no }" id="r_no">
	<input type="hidden" value="${requestScope.rlist.r_yn }" id="r_yn">
	<c:if test="${requestScope.rlist.r_yn eq 'N'}">
	<input class="confirm_bt" type="button" value="확인" style="cursor:pointer">
	</c:if>
	 <c:if test="${requestScope.rlist.r_yn eq 'Y'}">
	 <input class="confirm_bt2" type="button" value="확인완료" >

	 </c:if>
	</li>

</ul>

</div>
<!-- // 신고 상세 박스 -->
<div class="report_div">
<a href="adminReportList.do" class="report_list">목록으로</a>
</div>

</div><!-- //main -->
<div class="space"></div>
<c:import url="../common/footer.jsp"/>
</body>
</html>