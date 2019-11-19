<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!-- 공통헤더 영역 by 귀정 -->
<html>
<head>
<meta charset="UTF-8">
<title>common header</title>
<link rel="stylesheet" type="text/css" href="resources/css/common/common.css">
<script type="text/javascript" src="resources/js/jquery-3.4.1.min.js"></script>
<script type="text/javascript">
	function menuCloseFunc(){
		$(".subMenu").css("display","none");
	}
	
	function alOpenFunc(){
		
		$("#alMenu").css("position","absolute");
		$("#alMenu").css("display","block");
		$("#myMenu").css("display","none");
	}
	
	function myOpenFunc(){
		
		$("#myMenu").css("position","absolute");
		$("#myMenu").css("display","block");
		$("#alMenu").css("display","none");
	}
	
</script>
</head>
<body>
	<!-- 헤더메뉴 시작 -->
	<div id="headerWrap">
		<div id="headerContentWrap">
			<div id="logoArea">
				<p id="mainlogo"><a href="#">LOVE ME IN</a></p>
			</div>
			<div id="headerSearchWrap">
				<form id="headerSearch">
					<input type="text" id="searchInput" name="searchInput" placeholder="검색할 회원이나 해시태그를 입력하세요.">
				</form>
			</div>
			<div id="quickMenuWrap">
				<button id="matchingBtn" onclick="location.href='moveMatch.do'">소개팅 매칭</button>
				<div id="iconWrap">
					<button id="chatBtn" class="headerIcon" onclick="location.href='chatList.do'">
						<img src="resources/images/common/chatIcon.png">
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
			<li class="myLi"><a href="#">신고/문의내역</a></li>
			<li class="myLi" id="logoutId"><a href="logout.do">로그아웃</a></li>
		</ul>
		
	</div>
</body>
</html>