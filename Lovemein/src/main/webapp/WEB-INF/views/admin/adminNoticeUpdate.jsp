<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항 수정페이지</title>
<link  rel= "stylesheet" type="text/css" href="resources/css/admin/adminNoticeUpdate.css">
<script type="text/javascript" src="resources/js/jquery-3.4.1.min.js"></script>
<script type="text/javascript">


function reviewUploadImg(fileObj)
  {
   var filePath = fileObj.value;
   //파일명
   var fileName = filePath.substring(filePath.lastIndexOf("\\")+1);
//   alert(fileName);
   var randValNode = document.getElementById("filename");
   randValNode.innerHTML = "<font color='black'>"+fileName+"</font>";
   document.getElementById("fimenameout").style.display="none";

   /* 
   var fileKind = fileName.split(".")[1];
  	if(fileKind != "jpg" && fileKind != "gif" && fileKind != "png")
   {
    alert("jpg, gif, png 확장자를 가진 이미지 파일만 올려주세요.");
    
    document.getElementById("n_sumimg").value = "";
    document.getElementById("n_sumimg").select();
    document.selection.clear();
   } */
  }



</script>

</head>
<body>
<!-- header -->
<c:import url="adminHeader.jsp"/>
<!-- //header -->
<div class="main">
<!-- 타이틀 -->
<h2 class="listfont">공지사항 수정</h2>
<!-- //타이틀 -->
<div class="notice_box">

<form action="adminNoticeUpdateResult.do" enctype="multipart/form-data"  method="post"> 
<input type="hidden" name="n_no" value="${requestScope.notice.n_no}">
<input type="hidden" name="n_simg" value="${requestScope.notice.n_simg}">
<table>
<tr>
<td><p class="ptitle">제목</p></td>
<td><input type="text" name="n_title" value="${requestScope.notice.n_title}" required></td>
</tr>

<tr>
<td><p class="psimg">썸네일사진</p></td>
<td id="labeltd">
<p id="fimenameout">${requestScope.notice.n_simg}</p>
<p id="filename"></p>
<div class="filebox">
<label for="n_sumimg">파일찾기</label>
<input id="n_sumimg" type="file" multiple="multiple" name="n_sumimg" onchange="reviewUploadImg(this);">
</div>
</td>
</tr>
<tr>
<td><p class="ptext">내용</p></td>
<td>
<div class="text_editor">
<textarea id="editor2" name="n_text" required>
${requestScope.notice.n_text}
</textarea>


<script type="text/javascript" src="${pageContext.request.contextPath }/resources/editor/admin/ckeditor/ckeditor.js"></script>
<script type="text/javascript">

 CKEDITOR.replace('editor2'
                , {height: 500,
                	 filebrowserImageUploadUrl :'${pageContext.request.contextPath }/adminNoticeUpdateFile.do',            
                	 extraPlugins: 'youtube' 	
 });
 
</script> 
<script type="text/javascript">

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