<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>럽미인: 공지사항 추가 페이지</title>
<link  rel= "stylesheet" type="text/css" href="resources/css/admin/adminNoticeInsert.css">
<script type="text/javascript" src="resources/js/jquery-3.4.1.min.js"></script>

</head>
<body>
<c:import url="adminHeader.jsp"/>
<div class="main">

<!-- 타이틀 -->
<h2 class="listfont">공지사항 작성</h2>
<!-- //타이틀 -->

<div class="notice_box">
<form action="adminNoticeInsertResult.do" enctype="multipart/form-data"  method="post"> 
<table>

<tr>
<td><p class="ptitle">제목</p></td>
<td><input type="text" name="n_title" required></td>
</tr>

<tr>
<td><p class="psimg">썸네일사진</p></td>
<td><input  type="file" multiple="multiple" name="n_sumimg" required></td>
</tr>

<tr>
<td><p class="ptext">내용</p></td>
<td>
<div class="text_editor">
<textarea id="editor2" name="n_text" required></textarea>

<script type="text/javascript" src="${pageContext.request.contextPath }/resources/editor/admin/ckeditor/ckeditor.js"></script>
<script type="text/javascript">
 CKEDITOR.replace('editor2'
                , {height: 500,
                	 filebrowserImageUploadUrl :'${pageContext.request.contextPath }/adminNoticeInsertFile.do'
                		
                	
 });


</script> 
<script type="text/javascript">
/* if(CKEDITOR.instances.editor2.getData().length < 1){
	alert("내용을 입력해 주세요.");
	return;
} */
</script>
</div>
</td>
</tr>

<tr>
<td></td>
<td><input type="submit" value="확인"></td>
</tr>



</table>


</form>
</div>

</div><!-- //main -->
<div class="space"></div>
<c:import url="../common/footer.jsp"/>
</body>
</html>