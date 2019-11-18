<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<!DOCTYPE html>
<!-- 마이피드 by 귀정 -->
<html>
<head>
<meta charset="UTF-8">
<title>${loginMember.u_name}님의 피드</title>
<link rel="stylesheet" type="text/css" href="resources/css/common/common.css">
<link rel="stylesheet" type="text/css" href="resources/css/feed/feed.css">
<link rel="stylesheet" type="text/css" href="resources/css/feed/swiper.min.css">
<script type="text/javascript" src="resources/js/jquery-3.4.1.min.js"></script>
<script type="text/javascript" src="resources/js/feed/feed.js"></script>
<script type="text/javascript" src="resources/js/feed/swiper.min.js"></script>
<script>

</script>
</head>
<body>
	<div id="mask" onclick="closeMaskFun();"></div> 
	<input type="hidden" id="hiddenU_no" value="${loginMember.u_no}">
	<c:import url="../common/header.jsp"/>
	<div id="feedWrap">
		<!-- 피드영역 -->
		<div id="feedArea">
			<div id="feedcontentsArea">
				<!-- 피드영역 -->
				<c:if test="${nullMessage != null}">
					<div id="notFeedArea">
						<p id="notFeed">${nullMessage}</p>
					</div>
				</c:if><!-- 피드가없을시 피드없다는 메시지 노출 -->
				<c:forEach var="feed" items="${feed_list}">
				<div id="feedContainer">
					<!-- 피드 글영역 시작 -->
					<div id="feedContents">
						<div id="feedWriterWrap">
							<!-- 프로필 이미지 부분 시작 -->
							<div id="profileImgArea">
								<c:if test="${feed.u_profile != null}">
    									<img id="profileImgs" src="resources/images/profile/${feed.u_profile}" />
    								</c:if>
    							<c:if test="${feed.u_profile == null}">
    									<img id="profileImgs" src="resources/images/profile/nullProfile.png" />
    							</c:if>
							</div>
							<!-- 이름, 이메일부분 시작 -->
							<div id="feedNameArea"> 
    								${feed.u_name}<br><span>${feed.u_email}</span>
    						</div>
						</div>
						<!-- 메뉴아이콘 (피드 글삭제/글수정용) 시작 -->
						<div id="feedMenu">
							<button id="gofeedMenu" onclick="gofeedMenu(${feed.f_no})">
								<img src="resources/images/feed/menuIcon3.png">
							</button>
						</div>
						<!-- 버튼누르면 나오는 메뉴 -->
						<div id="feedCategory${feed.f_no}" class="feedCategory">
							<ul>
								<li><a href="#" onclick="feedModiFunc('${feed.f_no}')">게시글 수정</a></li>
								<li><a href="#" onclick="feedDelFunc('${feed.f_no}');">게시글 삭제</a></li>
							</ul>
						</div>
						<!-- 수정을 누르면 글수정 form 실행 -->
						<div id="feedModiForm${feed.f_no}" class="feedModiForm">
							<button id="findClose" onclick="findCloseModiFnc('${feed.f_no}');">X</button>
							<form id="insertFeedModiForm" method="post" action="updateFeed.do">
								<p id="modiTitle">피드 글 수정</p>
								<p id="subTitle">내용과 해시태그만 수정이 가능합니다.</p>
								<p>내용</p>
								<textarea id="f_text" name="f_text">${feed.f_text}</textarea>
								<p>#해시태그 <span>(','(쉼표)로 해시태그를 구분해주세요.)</span></p>
								<input type="text" name="f_tag" id="f_tag" value="${feed.f_tag}">
								<input type="hidden" name="u_no" value="${loginMember.u_no}">
								<input type="hidden" name="f_no" value="${feed.f_no}">
								<input type="submit" id="writeSubmitBtn" value="작성완료">
							</form>
						</div>
						<div id="feed_date"><fmt:formatDate value="${feed.f_date}" pattern="M월 dd일"/></div>
    					<div id="textArea">${feed.f_text}</div>
    					<div id="feedTag">
    							<c:forTokens items="${feed.f_tag}" delims="," var="tag">
								    <a id="hashTagId" href="${tag}">${tag}</a>
								</c:forTokens>
    					</div>
    					<div id="likeCnt">
    						<!-- 글 좋아요 영역 -->
    							<c:forEach var="like_Check" items="${feed_Like_Chk}">
		                            <c:if test="${like_Check.f_no eq feed.f_no}">
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
	                                		<img id="unChkHeart${feed.f_no}" src="resources/images/common/heartIcon3.png">
	                                	</a>	
	                               </c:otherwise>
                           	</c:choose>
                           	<!-- 좋아요 수 영역 -->
							<c:forEach var="feed_like_count" items="${feed_like_cnt}">
								 <c:if test="${feed_like_count.f_no eq feed.f_no}">
								 		${feed_like_count.count}
								 </c:if>						
							</c:forEach>
	    				</div>
	    				<!-- 댓글 수 영역 -->
	    				<div id="replyCnt">
	    					<img src="resources/images/common/chatIcon.png">
	    					<c:forEach var="feed_reply_count" items="${feed_reply_cnt}">
								 <c:if test="${feed_reply_count.f_no eq feed.f_no}">
								 		${feed_reply_count.count}
								 </c:if>  							
							</c:forEach>
	    				</div>
	    				<div id="lines"></div>
	    				<!-- 댓글영역 시작 -->
	    				<c:forEach var="feed_reply_count" items="${feed_reply_cnt}">
									 <c:if test="${feed_reply_count.f_no eq feed.f_no}">
									 		<c:set var="replyCount" value="${feed_reply_count.count}" />
									 </c:if>  							
						</c:forEach>
						<c:choose>
							<c:when test="${replyCount <=3}">
				    				<div class="replyWrap">
					    				<c:forEach var="feed_reply_list" items="${feed_Reply_List}">
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
		    				</c:when>
		    				<c:otherwise>
				    				<div class="replyWrapMore" id="replyWrapId${feed.f_no}">
					    				<c:forEach var="feed_reply_list" items="${feed_Reply_List}">
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
				    				<!-- 댓글 더보기 버튼 -->
				    				<c:set var= "more" value="${replyCount-3}"/>
				    				<input type="button" id="moreReply${feed.f_no}" class="moreReply" onclick="moreReplyFunc('${feed.f_no}','${more}');" 
				    					value="${more}개의 댓글 더보기">		
		    				</c:otherwise>
	    				</c:choose>
	    				<!-- 댓글영역 끝 -->
	    				<!-- 댓글 insert 영역 -->
	    				<div id="insertReply">
	    					<form id="insertForm" method="post" action="insertReply.do">
	    						<input type="text" name="fr_text" id="inputReplyText" placeholder="게시물에 댓글을 남겨주세요.">
	    						<input type="hidden" name="f_no" id="reply_input_Fno" value="${feed.f_no}">
								<input type="hidden" name="u_no" id="reply_input_Uno" value="${loginMember.u_no}"> 
								<button id="insertBtn"> </button>
	    					</form>
			    		</div>	
					</div>
						<!-- 피드 이미지 슬라이드 영역  -->
						<div id="slide${feed.f_no}" class="feedSlideDiv">
							<c:if test="${feed.f_img != null}">
								<div class="swiper-container" id="swiper-container${feed.f_no}">
								    <div class="swiper-wrapper">
								        <c:forTokens items="${feed.f_img}" delims="," var="f_img">
								        	<div class="swiper-slide"><img src="resources/images/feedImages/${f_img}"></div>
								        </c:forTokens>
								    </div>    
								   <!--  <div class="swiper-pagination"></div> -->
									<div class="swiper-scrollbar"></div>
								    <!-- <div class="swiper-button-prev"></div>
								    <div class="swiper-button-next"></div> -->
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
		</div><!-- 피드영역끝 -->
		
		<!-- 계정영역 -->
		<div id="accountArea">
			<div id="imgArea">
				<c:if test="${loginMember.u_profile == null}">
					<img id="profileImg" src="resources/images/common/nullProfile.png">
				</c:if>
				<c:if test="${loginMember.u_profile != null}">
					<img id="profileImg" src="resources/images/profile/${loginMember.u_profile}">
				</c:if>
			</div>
			<div id="accountPrimaryInfo">
				<div id="accountName">${loginMember.u_name}
					 <span>
					 	<!-- 정보수정 이동 링크 -->
					 	<a href="myInfo.do"><img src="resources/images/feed/settingIcon.png" width="17"></a>
					 </span>
				 </div>
				<div id="accountEmail">${loginMember.u_email}</div>
			</div>
			<div id="accountIntro">${loginMember.u_intro}</div>
			<!-- 글쓰기 영역 -->
			<div id="writeArea">
				<button type="button" id="writeFeedBtn" onclick="writeFeedFunc();">글쓰기</button>
			</div>
			<!-- 글쓰기 버튼을 누르면 글쓰기 form 실행 -->
			<div id="feedWriteForm">
				<button id="findClose" onclick="findCloseFnc();">X</button>
				<form id="insertFeedWriteForm" method="post" action="insertFeed.do" enctype="multipart/form-data">
					<p id="writeTitle">피드 글쓰기</p>
					<div id="imgAreas">
						<div id="imgDiv"></div>
						<label for="f_img" id="upfilesBtn">이미지파일업로드</label>
						<input multiple="multiple" type="file" name="flies" id="f_img"/>
					</div>
					<p>내용</p>
					<textarea id="f_text" name="f_text" placeholder="내용을 입력해주세요."></textarea>
					<p>#해시태그 <span>(','(쉼표)로 해시태그를 구분해주세요.)</span></p>
					<input type="text" name="f_tag" id="f_tag">
					<input type="hidden" name="u_no" value="${loginMember.u_no}">
					<input type="submit" id="writeSubmitBtn" value="작성완료">
				</form>
			</div>
			<!-- 찜한사람 카운트 영역 -->
			<input type="hidden" value="${loginMember.u_no}" id="u_no_send" name="u_no_send">
			<div id="accountLikeCountArea"></div>
			<!-- 찜한사람목록 -->
			<div id="accountLikeList"></div>
		</div><!-- 계정영역 끝 -->
	</div>
	<c:import url="../common/footer.jsp"/>
</body>
</html>	