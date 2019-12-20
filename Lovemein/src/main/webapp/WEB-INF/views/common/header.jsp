<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>         
<!DOCTYPE html>
<!-- 공통헤더 영역 by 귀정 -->
<html>
<head>
<meta charset="UTF-8">
<title>common header</title>
<script type="text/javascript" src="resources/js/jquery-3.4.1.min.js"></script>
<link rel="stylesheet" type="text/css" href="resources/css/common/common.css">
<script type="text/javascript" src="resources/js/common/header.js"></script>
</head>
<body>
	<div id="headerMask" onclick="closeMaskFun();"></div> 
	<!-- 헤더메뉴 시작 -->
	<div id="headerWrap">
		<div id="headerContentWrap">
			<div id="logoArea">
				<p id="mainlogo"><a href="allFeed.do">LOVE ME IN</a></p>
			</div>
			<div id="headerSearchWrap">
				<form id="headerSearch" action="search.do">
					<input type="text" id="searchInput" name="search" 
					placeholder="검색할 회원이나 해시태그를 입력하세요." autocomplete="off" onfocus="historyListFunc();">
				</form>
			</div>
			<div id="quickMenuWrap">
				<button id="matchingBtn" onclick="location.href='moveMatch.do'">소개팅 매칭</button>
				<div id="iconWrap">
					<button id="chatBtn" class="headerIcon"  onclick="location.href='moveChat.do'">
						<img src="resources/images/common/chatIcon.png">
						<div class="badge-num">59</div>
					</button>
					<button id="likeBtn" class="headerIcon" onclick="location.href='likesList.do'">
						<img src="resources/images/common/heartIcon2.png">
					</button>
					<button id="alBtn" class="headerIcon" type="button" onclick="alOpenFunc();">
						<img src="resources/images/common/alIcon.png">
					</button>
					<button id="accountBtn" class="headerIcon" onclick="myOpenFunc();">
						<img src="resources/images/common/accountIcon.png">
					</button>
				</div>			
			</div>
		</div>
	</div>
	
	<!-- 클릭시 나오는 서브메뉴 시작 -->
	<!-- ##### 알림 서브메뉴 ##### -->
	<div class="subMenu" id="alMenu">
		<button class="subMenuclose" onclick="menuCloseFunc();">X</button>
		<p class="alCountTitle">새로운 알림  <span id="count">4</span>개</p>
		<ul>
			<li class="alLi" id="firstAlLi"><span class="alNickname">쁘띠영기_071</span>님이 회원님을 찜했습니다.</li>
			<li class="alLi"><span class="alNickname">쁘띠영기_071</span>님이 회원님의 게시물에 댓글을 남겼습니다.</li>
			<li class="alLi"><span class="alNickname">서녜짱짱걸</span>님이 회원님의 게시물에 댓글을 남겼습니다.</li>
			<li class="alLi"><span class="alNickname">초고공쥬</span>님이 회원님을 찜했습니다.</li>
		</ul>
	</div>
	
	<!-- ##### 마이메뉴 서브메뉴 ##### -->
	<div class="subMenu" id="myMenu">
		<button class="subMenuclose" onclick="menuCloseFunc();">X</button>
		<ul>
			<li class="myLi" id="myFeedId"><a href="redirectFeed.do">마이피드</a></li>
			<li class="myLi"><a href="myInfo.do">내정보/이상형 수정</a></li>
			<li class="myLi"><a href="payMain.do">나의 푸딩 <span>&nbsp;${loginMember.u_coin}</span>개</a></li>
			<li class="myLi"><a href="goReportList.do">신고내역</a></li>
			<li class="myLi" id="logoutId"><a href="logout.do">로그아웃</a></li>
		</ul>
	</div>
	
	<!-- ### 최근검색어 목록 -->
	<div id="SearchViewArea">
		<div id="SearchView">
			<div id="searchAreas">
				<p>최근검색어 <span>(최근검색어는 10개까지만 저장됩니다.)</span></p>
				<ul id="searchList">
						<c:if test="${searchHistory != null}">
							<c:forEach var="sList" items="${searchHistory}">
								<fmt:formatDate var="sDate" value="${sList.search_date}" pattern="MM.dd" />
								<li>
									<a href="search.do?search=${sList.search_text}">${sList.search_text}</a>
									<!-- 한개만 삭제 -->
									<a id="oneDelete" href="#" 
											onclick="searchOneDelFunc('${loginMember.u_no}','${sList.search_text}');">
										${sDate} X
									</a>
								</li>
							</c:forEach>
						</c:if>
					<c:if test="${searchHistory == null}">
						<li id="no_search">${notSearchMsg}</li>
					</c:if>
				</ul>
				<div class="searchOptionmenu">
					<button id="historydelBtn" type="button" onclick="historyAllDelFunc('${loginMember.u_no}');">X 검색내역 전체삭제</button>
					<button id="historycloseBtn" type="button" onclick="closeMasksFun();">X 닫기</button>
				</div>
			</div>
		</div>
	</div>
</body>
</html>