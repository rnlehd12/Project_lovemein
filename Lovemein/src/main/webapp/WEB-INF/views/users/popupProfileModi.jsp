<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>     
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>프로필이미지 수정</title>
<script type="text/javascript" src="resources/js/jquery-3.4.1.min.js"></script>
<script type="text/javascript">
var sel_files = [];

$(document).ready(function(){
	$("#f_img").on("change", handleImgsFilesSelect);
});

function fileUploadAction(){
	
	console.log("fileUploadAction");
	$("#f_img").trigger('click');
}

function handleImgsFilesSelect(e){
	
	var files = e.target.files;
	var filesArr = Array.prototype.slice.call(files);

	var index = 0;
	filesArr.forEach(function(f){
	
		if(!f.type.match("image.*")){
			
			alert("이미지만 업로드 가능합니다.");
			return;
		}
		
		sel_files.push(f);
		
		var reader = new FileReader();
		reader.onload = function(e){
			
			var html = 
			"<a href=\"javascript:void(0);\" onclick=\"deleteImageAction(" + index + ")\" id=\"img_id_" + index + "\"><img src=\"" + e.target.result + "\" data-file='" + f.name + "' class='selProductFile' title='click to remove'></a>";
			$("#f_img").append(html);
			index++;

		}
		
		reader.readAsDataURL(f);
	});
	
}

function deleteImageAction(index){
	
	sel_files.splice(index, 1);
	
	var img_id = "#img_id_" + index;
	$(img_id).remove();
	
}
</script>
<link rel="stylesheet" type="text/css" href="resources/css/common/common.css">
<link rel="stylesheet" type="text/css" href="resources/css/users/profileImg.css">
</head>
<body>
	<div id="promodiArea">
		<p>프로필이미지 수정</p>
		<c:if test="${loginMember.u_profile != null}">
			<img id="profileImgs" src="resources/images/profile/${loginMember.u_profile}" />
		</c:if>
		<c:if test="${loginMember.u_profile == null}">
				<img id="profileImgs" src="resources/images/profile/nullProfile.png" />
		</c:if>
		<form action="saveProfile.do">
			<input type="file" id="f_img">
		</form>
	</div>
</body>
</html>