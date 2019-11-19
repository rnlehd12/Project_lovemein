<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="resources/css/chat/chatListView.css" rel="stylesheet">
</head>
<body>
<div id="chatListDiv"> <!-- 전체div -->
<div id="titleDiv"> <!-- 제목div -->
<p>채팅목록</p>
</div>

<div id="contentDiv">  <!-- 내용전체div -->
<div class="oneChatDiv"> <!-- 내용반복div -->
<div class="chatDiv" id="imgDiv"> <!-- 내용이미지div -->
<img alt="" src="resources/images/likes/images (1).jpg">
</div>
<div class="chatDiv" id="textDiv"> <!-- 내용텍스트div -->
<div id="textcon">
 <p id="ctext">안녕하세요~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~</p>
 <p id="cdate">19.10.31</p>
</div>
</div
><div class="chatDiv" id="rcountDiv"> <!-- 읽음표시div -->
<div id="rcDiv" ><p>1</p>
<!-- style="background-image:url('resources/images/p3.jpg');" -->
</div>
</div>
</div>
<div class="oneChatDiv"></div>
<div class="oneChatDiv">
</div>
<div id="butDiv"><button id="addlist">Read More</button></div>

</div>

</div>
</body>
</html>