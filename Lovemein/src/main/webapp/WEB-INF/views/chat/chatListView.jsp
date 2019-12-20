<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>${loginMember.u_name}님의 대화 목록</title>
<link href="resources/css/chat/chatListView.css" rel="stylesheet">
<link href="resources/css/common.css" rel="stylesheet">
<script type="text/javascript" src="resources/js/jquery-3.4.1.min.js"></script>
<script type="text/javascript">
var loginNo = ${loginMember.u_no};
var btNum = 0;
$(function(){
	$.ajax({
		url: "chatList.do",
		data: {loginNo : loginNo, btNum : btNum},
		type: "post",
		dataType: "json",
		success: function(obj){
			//alert("chatList ajax 돌아옴");
			var objStr = JSON.stringify(obj);
			var jsonObj = JSON.parse(objStr);
			var outValues = $("#contentDiv").html();
			outValues ="";
			for(var i = 0; i < jsonObj.list.length; i++){
				/* decodeURIComponent(jsonObj.list[i].u_rec_profile).replace(/\+/gi, " ") */
				/* c_no t_no  t_con t_date t_read t_from_uno t_to_uno t_profile */
				outValues += "<div class='oneChatDiv'><div class='chatDiv' id='imgDiv'> "+
					"<img alt='' src='resources/images/profile/"+
					decodeURIComponent(jsonObj.list[i].t_profile).replace(/\+/gi, " ") + "'>"+
					"</div><div class='chatDiv' id='textDiv'> ";					
					if(jsonObj.list[i].t_from_uno == parseInt(loginNo)) {
						/* alert("11111"); */
						outValues += 
							"<div id='textcon' onclick='location.href=\"talkView.do?t_from_uno="+jsonObj.list[i].t_from_uno+"&t_to_uno="+jsonObj.list[i].t_to_uno+"\"'>";
							/* jsonObj.list[i].t_to_uno;  */
					} else {
						/* alert("22222"); */
						outValues += 
							"<div id='textcon' onclick='location.href=\"talkView.do?t_from_uno="+jsonObj.list[i].t_to_uno+"&t_to_uno="+jsonObj.list[i].t_from_uno+"\"'>";
							/* jsonObj.list[i].t_from_uno;	 */	
					}
						
					outValues +=
				/* 	"<div id='textcon' onclick='location.href=\"\"'>"+ */
					/* href='talkView.do?t_from_uno="+jsonObj.list[i].u_no_send+"&t_to_uno="+jsonObj.list[i].u_no_rec+"'
					 */
							
					"<a id='ctext'>"+decodeURIComponent(jsonObj.list[i].t_con).replace(/\+/gi, " ") +
					"</a><a id='cdate'>"+ jsonObj.list[i].t_date +
					"</a></div></div>";
					if(jsonObj.list[i].t_read != 0) {
					outValues +=
					"<div class='chatDiv' id='rcountDiv'> "+
					"<div id='rcDiv' ><p>"+ jsonObj.list[i].t_read +
					"</p></div></div>";
					}
					outValues +=
					"</div>";
				if(i == jsonObj.list.length -1) {
					outValues += "<div id='butDiv'><button id='addlist' onclick='addListfunc(btNum);'>"+
					"Read More</button></div>";
				}
			}  //list for문끝
			$("#contentDiv").html(outValues);
		},
        error : function(request, status, errorData){
            console.log("error code : " + request.status 
                  + "\nMessage : " + request.responseText
                  + "\nError : " + errorData);
        }//error
	});//ajax끝
});// list docu

// more버튼 클릭시
function addListfunc(btNumVal){
	btNum = btNumVal+ 1;
	alert("btNum : " + btNum , "btNumVal : " + btNumVal);
	$("#butDiv").remove();
	$.ajax({
		url: "chatList.do",
		data: {loginNo : loginNo, btNum : btNum},
		type: "post",
		dataType: "json",
		success: function(obj){
			//alert("chatList ajax 돌아옴");
			var objStr = JSON.stringify(obj);
			var jsonObj = JSON.parse(objStr);
			var outValues = $("#contentDiv").html();
			for(var i = 0; i < jsonObj.list.length; i++){
				/* decodeURIComponent(jsonObj.list[i].u_rec_profile).replace(/\+/gi, " ") */
				/* c_no t_no  t_con t_date t_read t_from_uno t_to_uno t_profile */
				outValues += "<div class='oneChatDiv'><div class='chatDiv' id='imgDiv'> "+
					"<img alt='' src='resources/images/profile/"+
					decodeURIComponent(jsonObj.list[i].t_profile).replace(/\+/gi, " ") + "'>"+
					"</div><div class='chatDiv' id='textDiv'> ";
					if(jsonObj.list[i].t_from_uno == parseInt(loginNo)) {
						/* alert("11111"); */
						outValues += 
							"<div id='textcon' onclick='location.href=\"talkView.do?t_from_uno="+jsonObj.list[i].t_from_uno+"&t_to_uno="+jsonObj.list[i].t_to_uno+"\"'>";
							/* jsonObj.list[i].t_to_uno;  */
					} else {
						/* alert("22222"); */
						outValues += 
							"<div id='textcon' onclick='location.href=\"talkView.do?t_from_uno="+jsonObj.list[i].t_to_uno+"&t_to_uno="+jsonObj.list[i].t_from_uno+"\"'>";
							/* jsonObj.list[i].t_from_uno;	 */	
					}
					outValues +=
					"<a id='ctext'>"+decodeURIComponent(jsonObj.list[i].t_con).replace(/\+/gi, " ") +
					"</a><a id='cdate'>"+ jsonObj.list[i].t_date +
					"</a></div></div>";
				if(jsonObj.list[i].t_read != 0) {
					outValues +=
					"<div class='chatDiv' id='rcountDiv'> "+
					"<div id='rcDiv' ><p>"+ jsonObj.list[i].t_read +
					"</p></div></div>";
				}	
				outValues +=	
					"</div>";
				if(i == jsonObj.list.length -1) {
					outValues += "<div id='butDiv'><button id='addlist' onclick='addListfunc(btNum);'>"+
					"Read More</button></div>";
				}
			}  //list for문끝
			$("#contentDiv").html(outValues);
		},
        error : function(request, status, errorData){
            console.log("error code : " + request.status 
                  + "\nMessage : " + request.responseText
                  + "\nError : " + errorData);
        }//error
	});//ajax끝
}

</script>
</head>
<body>
<c:import url="../common/header.jsp" />
<div id="chatListDiv"> <!-- 전체div -->
<div id="titleDiv"> <!-- 제목div -->
<p onclick="location.href='adminMission.do?page=1'">채팅목록</p>
</div>
<div id="contentDiv">  <!-- 내용전체div -->



</div>
<c:import url="../common/footer.jsp" />
</body>
</html>