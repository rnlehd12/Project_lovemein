<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
<!DOCTYPE html>
<!-- 전체유저 피드 by 귀정 -->
<html>
<head>
<meta charset="UTF-8">
<title>전체 피드</title>
<link rel="stylesheet" type="text/css" href="resources/css/feed/feed.css">
<script type="text/javascript" src="resources/js/jquery-3.4.1.min.js"></script>
<script type="text/javascript" src="resources/js/feed/allFeed.js"></script>
</head>
<body>
	<div id="mask" onclick="closeMaskFun();"></div> 
	<input type="hidden" id="hiddenU_no" value="${loginMember.u_no}">
	<c:import url="../common/header.jsp"/>
		<div id="allFeedWrap">
			<c:forEach var="feed" items="${allFeed}">
				<div onmouseover="showMenuFun('${feed.f_no}');" onmouseout="hideMenuFun('${feed.f_no}');" id="onDiv">
						<div class="feedOneArea" id="feedOneArea${feed.f_no}" style="background-image:url('resources/images/feedImages/${feed.f_allImg}')">		
						<div id="imgCountArea">
							<div id="profileP">
								<div id="profileImagesAll">
									<c:if test="${feed.u_profile != null}">
										<img id="allprofileImgs" src="resources/images/profile/${feed.u_profile}" />
									</c:if>
									<c:if test="${feed.u_profile == null}">
											<img id="allprofileImgs" src="resources/images/profile/nullProfile.png" />
									</c:if>
								</div>
								${feed.u_name}
							</div>
							<p id="imgCountP"><img id="countImg" src="resources/images/common/picImages.png" width="22">${feed.count}</p>
							<!-- 피드 이동 버튼 & 피드 글 보기 버튼 -->
							<div id="allFeedmenu${feed.f_no}" class="allFeedmenu">
								<!-- 좋아요 체크여부 시작 -->
								<div class="allHeartArea">
									<c:forEach var="hchk" items="${allFeedHeartChk}">
										 <c:if test="${hchk.f_no eq feed.f_no}">
			                               <c:set var="heart" value="${feed.f_no}" />
			                               <input type="hidden" value="${heart}">
										</c:if>
									</c:forEach>
									<c:choose>
										<c:when test="${heart == feed.f_no}">
											<a href="#" onclick="delLikeFunc('${feed.f_no}');">
												<img id="chkHeart${feed.f_no}" src="resources/images/common/heartIcon2.png">
											</a>
										</c:when>
										<c:otherwise>
											<a href="#" onclick="plusLikeFunc('${feed.f_no}');">
												<img id="chkHeart${feed.f_no}" src="resources/images/common/heartIcon4.png">
											</a>
										</c:otherwise>
									</c:choose>
								</div>	
								<button id="goTargetFeed" onclick="gotargetFeedFunc('${feed.u_no}')">피드로 이동</button>
								<button id="showFeedOne" onclick="showFeedOneFunc('${feed.f_no}')">게시글 보기</button>
							</div>
						</div>
					</div>
				</div>
				<!-- 게시글 하나만 보기 -->
				<div class="showFeedOneArea" id="showFeedOneArea${feed.f_no}">
					<button id="findClose" onclick="findCloseFnc();">X</button>
					<!-- 피드 이미지 슬라이드 영역  -->
					<div id="slide${feed.f_no}" class="allfeedSlideDiv">
						<c:if test="${feed.f_img != null}">
							<div class="slider">
								<c:forTokens items="${feed.f_img}" delims="," var="f_img">
							        	<div><img src="resources/images/feedImages/${f_img}"></div>
							    </c:forTokens>
							</div>
						</c:if>	
						<c:if test="${feed.f_img == null}">
							<div class="swiper-container">
								<p id="noFeedImage">등록된 피드이미지가 없습니다.</p>
							</div>
						</c:if>
					</div>
				</div>
			</c:forEach>
		</div>
		<c:import url="../common/footer.jsp"/>
</body>
</html>