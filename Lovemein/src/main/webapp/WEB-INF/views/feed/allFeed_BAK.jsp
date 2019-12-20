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
<c:import url="../common/header.jsp"/>
<link rel="stylesheet" type="text/css" href="resources/css/feed/feed.css">
<link rel="stylesheet" type="text/css" href="resources/css/feed/slick.css">
<link rel="stylesheet" type="text/css" href="resources/css/feed/slick-theme.css">
<script type="text/javascript" src="resources/js/feed/allFeed.js"></script>
<script type="text/javascript" src="resources/js/feed/slick.js"></script>
</head>
<body>
	<div id="mask" onclick="closeMaskFun();"></div> 
	<input type="hidden" id="hiddenU_no" value="${loginMember.u_no}">
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
					<table>
						<tr>
							<!-- 피드이미지 영역 -->
							<td id="feedTd">
								<div class="allfeedSlideDiv" align="center" style="width: 500px; left: 500px;">
								     <c:forTokens items="${feed.f_img}" delims="," var="f_img">
							        	<div class="swiper-slide"><img src="resources/images/feedImages/${f_img}"></div>
							        </c:forTokens>
								</div>
							</td>
							<td>
								<div id="allFeedContentsArea">
									<div id="allWriterArea">
										<div id="allWriterImgDiv">
											<button id="findCloseFeedOne" onclick="findCloseFnc();">X</button>
											<div id="imagebox">
												<c:if test="${feed.u_profile != null}">
													<img id="allprofileImgsOne" src="resources/images/profile/${feed.u_profile}" />
												</c:if>
												<c:if test="${feed.u_profile == null}">
														<img id="allprofileImgsOne" src="resources/images/profile/nullProfile.png" />
												</c:if>
											</div>
											<div id="writerbox">
												${feed.u_name}<br>
												<span>${feed.u_email}</span>
											</div>
											<div id="goLikeArea">
												<c:forEach var="feedUserLikeChks" items="${userLikeChkList}">
													<c:if test="${feedUserLikeChks.target_no == feed.u_no}">
														 <c:set var="heart" value="${feed.u_no}" />
			                               				 <input type="hidden" value="${heart}">
													</c:if>
												</c:forEach>
												 <c:choose>
												 	<c:when test="${feed.u_no == loginMember.u_no}">
					                               		<div id="writeArea">
															<button type="button" class="allGoLikeTargetBtn" id="unlikeBtn">
																<img id="goLikeTargetImg" src="resources/images/common/heartIcon2.png" width="50">
																나
															</button>
														</div>
					                               </c:when>
					                               <c:when test="${heart == feed.u_no}">
					                               		<div id="writeArea">
															<button type="button" class="allGoLikeTargetBtn" onclick="ullikeBtnFunc('${feed.u_no}','${loginMember.u_no}');">
																<img id="goLikeTargetImg" src="resources/images/common/heartIcon3.png" width="50">
																찜하는중
															</button>
														</div>
					                               </c:when>
					                               <c:otherwise>
					                               		<div id="writeArea">
															<button type="button" class="allGoLikeTargetBtn" id="unlikeBtn" onclick="goLikeTargetFunc('${feed.f_no}');">
																<img id="goLikeTargetImg" src="resources/images/common/heartIcon2.png" width="50">
																찜하기
															</button>
														</div>	
					                               </c:otherwise>
					                           	</c:choose>
											</div>
											<!-- 찜하기 모달 팝업 -->
											<div id="golike" class="golike${feed.f_no}">
												<button id="findClose" onclick="LikeCloseFnc();">X</button>
												<form id="golikeForm" method="post" action="golikeTarget.do">
													<div id="heartIconArea">
														<img id="goLikeTargetImages" src="resources/images/common/heartIcon2.png" width="50">
													</div>
													<p id="golikeTitle">
													찜하기
													</p>
													<div id="golikeimgArea">
														<c:if test="${targetUser.u_profile == null}">
															<img id="profileImg" src="resources/images/common/nullProfile.png">
														</c:if>
														<c:if test="${targetUser.u_profile != null}">
															<img id="profileImg" src="resources/images/profile/${targetUser.u_profile}">
														</c:if>
													</div>
													<p id="likeMessage1"><span>${feed.u_name}</span>님을 찜하시겠습니까?</p>
													<p id="likeMessage2"><span>푸딩1개</span>가 소진됩니다.</p>
													<input type="hidden" name="loginUno" value="${loginMember.u_no}">
													<input type="hidden" name="targetUno" value="${feed.u_no}">
														<c:choose>
															<c:when test="${loginMember.u_coin > 0}">
																<div id="likeAreaBtns">
																	<input type="submit" value="찜하기" class="likesBtns" id="goTargetLikeBtn" />
																	<button type="button" class="likesBtns" id="resetLikeBtn" onclick="findCloseFnc();">취소</button>
																</div>
															</c:when>
															<c:otherwise>
																<div id="likeAreaBtns">
																	<button type="button" class="likesBtns" id="goTargetLikeBtn" onclick="goPayFunc();">충전페이지로 이동</button>
																	<button type="button" class="likesBtns" id="resetLikeBtn" onclick="findCloseFnc();">취소</button>
																</div>	
																<p id="noCoin">잔여푸딩이 부족합니다. 충전 후 이용해주세요.</p>
															</c:otherwise>
														</c:choose>		
												</form>
											</div>
										</div>
										<!-- 피드글 내용영역 -->
										<div id="allfeedOneContentsArea">
											<p id="allfeedOnetext">
												${feed.f_text}
											</p>
										</div>
										<!-- 피드 댓글 영역 -->
										<div id="lines"></div>
										<div id="allFeedreplyArea">
											<c:forEach var="feed_reply_list" items="${allFeedReplyList}">
												<c:if test="${feed_reply_list.f_no eq feed.f_no}">
													<a href="#" onclick="targetFeedFunc('${feed_reply_list.u_no}')">
								    					<div id="replyOne">
								    						<div id="replyProfileImg">
								    							<c:if test="${feed_reply_list.u_profile != null}">
						    										<img id="profileImgs" src="resources/images/profile/${feed_reply_list.u_profile}" />
							    								</c:if>
								    							<c:if test="${feed_reply_list.u_profile == null}">
								    									<img id="profileImgs" src="resources/images/profile/nullProfile.png" />
								    							</c:if>
								    						</div>
								    						<div id="rightArea">
								    							<div id="replyNickName">${feed_reply_list.u_name}</div>
								    							<div id="replyDate">
								    								<fmt:formatDate value="${feed_reply_list.fr_date}" pattern="M월 dd일"/>
								    								<c:if test="${loginMember.u_no eq feed_reply_list.u_no}">
									    								<div id="editArea">
									    									<a href="#" onclick="replydelFunc('${feed_reply_list.fr_no}');">삭제</a>
									    									<a href="#" onclick="replyModiFunc('${feed_reply_list.fr_no}');">수정</a>
									    								</div>
									    							</c:if>	 
								    							</div>
								    							<div id="replyText">${feed_reply_list.fr_text}</div>
								    						</div>
								    						<!-- 댓글수정 폼 영역 시작 '수정'을 누르면 노출 -->
								    						<div id="replyModidiv${feed_reply_list.fr_no}" class="modiDiv">
								    							<form id="replyModiForm" method="post">
									    							<input type="text" id="fr_Moditext${feed_reply_list.fr_no}" 
									    								class="fr_Moditext" name="fr_Ntext" value="${feed_reply_list.fr_text}">
																	<button id="replyModiSub" onclick="replyModiSubFunc('${feed_reply_list.fr_no}');">수정</button>
																	<button id="closeReplyModiSub" onclick="closeReplyModiSubFunc('${feed_reply_list.fr_no}');">닫기</button>
																</form>				    						
								    						</div>
								    					</div>
								    				</a>
												</c:if>
											</c:forEach>	
										</div>
									</div>
								</div>
							</td>	
						</tr>
					</table>
				</div>
			</c:forEach>
		</div>
		<c:import url="../common/footer.jsp"/>
</body>

</html>