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
<script type="text/javascript" src="resources/js/jquery-3.4.1.min.js"></script>
<script type="text/javascript">
	
	$(function(){
		
		//내가 찜한 사람 수 구하기
		var u_no_send = $("#u_no_send").val();
		$.ajax({
	         url : "sendCount.do",
	         data : {u_no_send:u_no_send},
	         type : "post",
	         success : function(data){
	        	if(data.likecount != 0){	 
		             $("#accountLikeCountArea").html
		             ("<img src='resources/images/common/heartIcon2.png'>" +
		             	"내가 찜한 사람 <span>"+ data.likecount + "</span> 명");
	        	}else{
	        		
	        		$("#accountLikeList").html("<div class='noLikesMent'>내가 찜하고 있는 사람이 없습니다." + 
	        				"<button id='goStoryFeedBtn'>스토리피드로 이동하기</button></div>");
	        	} 
	        },
	         error : function(request, status, errorData){
	            console.log("error code : " + request.status 
	                  + "\nMessage : " + request.responseText
	                  + "\nError : " + errorData);
	         }
	      });
		
		//내가 찜한 사람 목록 구하기
		$.ajax({
			
	         url : "sendLikeList.do",
	         data : {u_no_send:u_no_send},
	         type : "post",
	         success : function(obj){
	        	
					var objStr = JSON.stringify(obj);
					var jsonObj = JSON.parse(objStr);
					
					var outValues = $("#accountLikeList").html();
					
					//출력할 문자열 만들기
					for(var i in jsonObj.list){
						outValues += 
							"<div id='personWrap'>" +
							"<div id='likeProfileImg'>" +
							"<img src='resources/images/profile/" +
							decodeURIComponent(jsonObj.list[i].u_rec_profile).replace(/\+/gi, " ") + "'>" +
							"</div>" +
							"<div id='likePersonNameArea'>" +
							decodeURIComponent(jsonObj.list[i].u_rec_name).replace(/\+/gi, " ") + 
							"</div><div id='btnArea'><button type='button' id='yourFeedBtn'>이동</button></div>"
							+ "</div>";
							
					}
					
					$("#accountLikeList").html(outValues);
	        	 
	            
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
	<div id="feedWrap">
		<!-- 피드영역 -->
		<div id="feedArea">
			<div id="feedcontentsArea">
				<!-- 피드영역 -->
				<c:forEach var="feed" items="${feed_list}">
				<div id="feedContainer">
					<div id="feedContents">
						<div id="feedWriterWrap">
							<div id="profileImgArea">
								<c:if test="${feed.u_profile != null}">
    									<img id="profileImgs" src="resources/images/profile/${feed.u_profile}" />
    								</c:if>
    							<c:if test="${feed.u_profile == null}">
    									<img id="profileImgs" src="resources/images/profile/nullProfile.png" />
    							</c:if>
							</div>
							<div id="feedNameArea"> 
    								${feed.u_name}<br><span>${feed.u_email}</span>
    						</div>
						</div>
						<div id="feed_date">${feed.f_date}</div>
    					<div id="textArea">${feed.f_text}</div>
    					<div id="feedTag">
    							<c:forTokens items="${feed.f_tag}" delims="," var="tag">
								    <a id="hashTagId" href="${tag}">${tag}</a>
								</c:forTokens>
    					</div>
    					<div id="likeCnt">
    						<img src="resources/images/common/heartIcon2.png">
							<c:forEach var="feed_like_count" items="${feed_like_cnt}">
								 <c:if test="${feed_like_count.f_no eq feed.f_no}">
								 		${feed_like_count.count}
								 </c:if>						
							</c:forEach>
	    				</div>
	    				<div id="replyCnt">
	    					<img src="resources/images/common/chatIcon.png">
	    					<c:forEach var="feed_reply_count" items="${feed_reply_cnt}">
								 <c:if test="${feed_reply_count.f_no eq feed.f_no}">
								 		${feed_reply_count.count}
								 </c:if>  							
							</c:forEach>
	    				</div>
	    				<div id="lines"></div>
	    				<c:forEach var="feed_reply_list" items="${feed_Reply_List}">
		    				 <c:if test="${feed_reply_list.f_no eq feed.f_no}">
			    				<div id="replyWrap">
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
			    							<div id="replyText">${feed_reply_list.fr_text}</div>
			    							<c:if test="${loginMember.u_no eq feed_reply_list.u_no}">
			    								<div id="editArea">
			    									<a href="replyModi.do">수정</a>
			    									<a href="replyDel.do">삭제</a>
			    								</div>
			    							</c:if>
			    						</div>
			    					</div>
			    				</div>
			    			 </c:if>
	    				</c:forEach>
	    				<div id="insertReply">
	    					<form id="insertForm" method="post" action="insertReply.do">
	    						<input type="text" name="fr_text" id="inputReplyText" placeholder="게시물에 댓글을 남겨주세요.">
	    						<input type="hidden" name="f_no" id="reply_input_Fno" value="${feed.f_no}">
								<input type="hidden" name="u_no" id="reply_input_Uno" value="${loginMember.u_no}"> 
								<button id="insertBtn"> </button>
	    					</form>
			    		</div>	
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
				<button type="button" id="writeFeedBtn">글쓰기</button>
			</div>
			<!-- 찜한사람 카운트 영역 -->
			<input type="hidden" value="${loginMember.u_no}" id="u_no_send" name="u_no_send">
			<div id="accountLikeCountArea"></div>
			<!-- 찜한사람목록 -->
			<div id="accountLikeList"></div>
		</div><!-- 계정영역 끝 -->
	</div>
</body>
</html>	