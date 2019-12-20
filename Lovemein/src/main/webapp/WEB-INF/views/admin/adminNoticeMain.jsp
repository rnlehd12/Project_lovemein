<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>   
<!DOCTYPE html>
<html>
<head>
<title>공지사항 페이지</title>
<link  rel= "stylesheet" type="text/css" href="resources/css/admin/adminNoticeMain.css">
<script type="text/javascript" src="resources/js/jquery-3.4.1.min.js"></script>
<script type="text/javascript">
$(function(){
	/*
	var count = 3; //3 개씩 카운트함
	var counts; //= counta - (3*j); 전체갯수 - (버튼누른횟수  * 3)
	var  clickbtcount = 1;	//버튼누른수 저장 //j
	var listcount= json.result; //전체갯수  //counta
	var countaa = counts-3; // count aa 는 전체갯수 - (버튼누른횟수  * 3)  에다가 -3을 또함
	*/
	var count = 3; //3 개씩 카운트함
	var counts; //= counta - (3*j);
	var clickbtcount  = 1;	//버튼누른수 저장
	
	$(".bt").on("click", function() {
	
		$.ajax({
			url: 'adminNoticeMainAjax.do', //주소
			type: 'post', // get 또는 post 방식으로
			dataType: "json",
			success : function(data) { 
				var jsonStr = JSON.stringify(data);
				var json = JSON.parse(jsonStr);
				var listcount = json.result; //전체갯수

				var outValues = $(".ntwr").html();
				if((listcount - (3*clickbtcount)) > 2){
					// 전체갯수 - (클릭한수 * 3)이 2보다 크다면
				outValues += "<div class='ntbox_lists'>";
	
								
				for(var i = 0; i < 3; i++){
				
					
					outValues += "<div class='nt_box'>"
						+"<a class='aaa' href='adminNoticeSelect.do?n_no="+json.list[count].n_no+"'>"
						+"<div class='nt'>"
						+"<img class='ntimg' src='resources/images/admin/notice/notice_s/" + json.list[count].n_simg +"'>"
						+"</div>"
						+"<div class='textbox'>"
							+"<p class='datep'>" + json.list[count].n_date + "</p>"	
							+"<p class='heart'>♥</p>"
							+"<p class='text'>" + decodeURIComponent(json.list[count].n_title).replace(/\+/gi, " ")  + "</p>"	
						+"</div>"
						+"</a>"
					+"</div>";
					
					if((listcount - (3*clickbtcount)) == 3)
						 $(".bt").css("display","none"); 
					
					count++;
						
				}
				
				
				
				outValues += "</div>";
				
				counts = listcount - (3*clickbtcount);
				clickbtcount++;
				
		
				}else{
					// 전체갯수 - (클릭한수 * 3)이 2보다 작다면

					var countaa = counts-3;
				
					//outValues += "<div class='ntbox_lists2'>";
					outValues += "<div class='ntbox_lists'>";
					
					
					for(var i = 0; i < countaa; i++){
						
						
					
						outValues += "<div class='nt_box'>"
							+"<a class='aaa' href='adminNoticeSelect.do?n_no="+json.list[count].n_no+"'>"
							+"<div class='nt'>"
							+"<img class='ntimg' src='resources/images/admin/notice/notice_s/" +json.list[count].n_simg +"'>"
							+"</div>"
							+"<div class='textbox'>"
								+"<p class='datep'>" + json.list[count].n_date + "</p>"	
								+"<p class='heart'>♥</p>"
								+"<p class='text'>" + decodeURIComponent(json.list[count].n_title).replace(/\+/gi, " ")  + "</p>"	
							+"</div>"
							+"</a>"
						+"</div>";
						
						
						count++;
						if(count <=0){
						
								$(".bt").css("display","none");
							
						}
					}
					
					
					
					outValues += "</div>";
					
					 $(".bt").css("display","none"); 
					
					
				}
				$(".ntwr").html(outValues);
				
				
				},
			error: function(textStatus) {
				console.log("error : " + textStatus);
			}
		});
	});

});//document ready
</script>

</head>
<body>

<!-- 로그인한 번호가 1과 같을때  -->
<c:if test="${ loginMember.u_no eq '1'}">
<c:import url="adminHeader.jsp"/>
</c:if>

<!--  로그인 한 유저번호가 1이 아니면서 로그인한 유저번호가 비어있지 않을때 -->
<c:if test="${ loginMember.u_no ne '1' and not empty loginMember.u_no }">
<c:import url="../common/header.jsp"/>
</c:if>

<!-- 로그인한 u_no가 널일때 -->
<c:if test="${ empty loginMember.u_no }">
<c:import url="../common/headerNone.jsp"/>
</c:if>

<img class="ntb"src="resources/images/notice/noticephoto.png">
<div id="maind">
<div class="main">
<c:if test="${ loginMember.u_no eq '1'}">
<c:url var="insert" value="adminNoticeinsert.do"></c:url>
<button class="insertbt"><a class="aaa" href="${insert }">글작성</a></button>
</c:if>
<c:if test="${ loginMember.u_no ne '1' or empty loginMember.u_no}">
<div class="insertdiv"></div>
</c:if>
<!-- 공지사항목록 -->
<div class="ntwr">
<div class="ntbox_lists">
<c:forEach var="notice" items="${  requestScope.listn }" begin="0" end="2">
<c:url var="ndetail" value="adminNoticeSelect.do">
	<c:param name="n_no" value="${ notice.n_no }"></c:param>
</c:url>
<div class="nt_box"><a class="aaa" href="${ ndetail }">
	<div class="nt">
		<img class="ntimg "src="resources/images/admin/notice/notice_s/${ notice.n_simg }">
	</div>
	<div class="textbox">
		<p class="datep"><fmt:formatDate value="${ notice.n_date }" pattern="yyyy.MM.dd"/></p>	
		<p class="heart">♥</p>	
		<p class="text">${notice.n_title}</p>	
		
	</div>
</a>
</div>

</c:forEach>


</div><!-- //ntbox_list -->

</div><!-- //ntwr -->

<div class="btbox">

	<button class="bt">더보기</button>

</div>

<!-- //공지사항목록 -->
</div><!-- main -->
</div> <!-- 한번더 감싸주기 -->
<div class="space"></div>
	<c:import url="../common/footer.jsp"/>
</body>
</html>