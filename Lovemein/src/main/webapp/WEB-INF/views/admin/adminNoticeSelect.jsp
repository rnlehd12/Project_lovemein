<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항 상세페이지</title>
<link  rel= "stylesheet" type="text/css" href="resources/css/admin/adminNoticeSelect.css">

<script type="text/javascript" src="resources/js/jquery-3.4.1.min.js"></script>
<script type="text/javascript">
	$(function() {
		$('.delete').click(function() {
			$('.modal').show();
		});
		$('.update').click(function() {
			$('.modalu').show();
		});

	});//document.ready()


	//팝업 Close 기능
	function close_pop(flag) {
		$('.modal').hide();
		
	};//close_pop
	function close_popu(flag) {
		$('.modalu').hide();

	};//close_popu
	
	
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
<div class="main">
<div class="notice_detail">


	<ul>
		
		<li class="title">
			<p class="date">2019-12-12</p>
			<p class="ptitle">${requestScope.notice.n_title }</p>
		</li>
		
		<li class="nname_li"><img class="iconimg "src="resources/images/notice/icon.png"><p class="nname">럽미인</p>
			<ul class="btbt">
				<c:if test="${loginMember.u_no eq '1' }">
				<button class="update">수정</button>
				</c:if>
			<!-- The Modal -->
    			<div  class="modalu">
     		  <!-- Modal content -->
	     			<div class="modal-content"> 
		              		<p class="delp">수정하시겠습니까?</p>
		            	<div class="pop_btbt" >
		                	<p class="pop_bt1" onClick="close_popu();">Cancel</p>
		                	<p class="pop_bt2"><a class="pop_bt2_a" href="adminNoticeUpdate.do?n_no=${requestScope.notice.n_no }">OK</a></p>
		            	</div>
		     		</div>
    			</div>
       		   <!--End Modal-->
				<c:if test="${loginMember.u_no eq '1'}">
				<button class="delete" >삭제</button>
				</c:if>
			  <!-- The Modal -->
    			<div id="myModal" class="modal">
     		  <!-- Modal content -->
	     			<div class="modal-content"> 
		              		<p class="delp">삭제하시겠습니까?</p>
		            	<div class="pop_btbt" >
		                	<p class="pop_bt1" onClick="close_pop();">Cancel</p>
		                	<p class="pop_bt2" ><a class="pop_bt2_a" href="adminNoticeDelete.do?n_no=${requestScope.notice.n_no }">OK</a></p>
		            	</div>
		     		</div>
    			</div>
       		   <!--End Modal-->
			
			</ul>	
		  </li>
		  
		  <li>
		  	<!-- 공지사항이미지 -->

	<div class="ntimg">${requestScope.notice.n_text }</div>

	<!-- //공지사항이미지 -->
		  
		  </li>
	</ul>

	


	<!-- 돌아가기버튼 -->
	<div class="backbt_div">
	<c:url var="listNotice" value="adminNoticeMain.do"></c:url>
	<button class="backbt"><a class="ah" href="${ listNotice}">목록보기</a></button>
	</div>
	<!-- // -->

</div>
</div>
<div class="space"></div>
<c:import url="../common/footer.jsp"/>
</body>
</html>