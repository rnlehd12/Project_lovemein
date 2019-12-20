<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>${loginMember.u_name}님의 매칭 리스트</title>
<link href="resources/css/match/matchListView.css" rel="stylesheet">
<link href="resources/css/common/common.css" rel="stylesheet">
<script type="text/javascript" src="resources/js/jquery-3.4.1.min.js"></script>
<script type="text/javascript">
var login_no = ${loginMember.u_no};
var bcount = 0;
var listcount  = 0;
var btNum = 0;
$(function(){
	//alert("페이지출력");
	getlist(bcount);
});// docu

//이전버튼 클릭시 값없으면 이전버튼비활성화 + 다음버튼활성화
function prevClick(){
	if(bcount == 0) {
		 $("#button-1").css('background-color', '#f5f2f2');
		$("#button-1").css('border', '2px solid #d6d6d6'); 
		$("#eff-1").css('background-color', '#f5f2f2'); 
		$("#button-1 a").css('color', '#d6d6d6');
		//$("#button-1").children().css('color', '#d6d6d6');
/* 		 $("#button-4").addClass('buttonClass');
		$("#eff-4").addClass('effClass'); 
 */	
		//alert();
	} else {
		 $("#button-4").css('background-color', '#fff');
			$("#button-4").css('border', '2px solid #e64c7f'); 
			$("#eff-4").css('background-color', '#e64c7f'); 
			$("#button-4 a").css('color', '#e64c7f'); 
			$("#button-4").mouseenter(function(){
				$("#button-4").children().css('color', '#fff');
			}); 
			$("#button-4").mouseleave(function(){
				$("#button-4").children().css('color', '#e64c7f');
			}); 
		bcount--;
		//alert(bcount);
		getlist(bcount); 		
	}

}
//다음버튼 클릭시 값없으면 다음버튼비활성화 + 이전버튼활성화
function nextClick(){
	//alert(listcount);
	var maxbCount = Math.floor(listcount / 9)
	//alert(maxbCount);
	if(bcount == maxbCount) {
		 $("#button-4").css('background-color', '#f5f2f2');
			$("#button-4").css('border', '2px solid #d6d6d6'); 
			$("#eff-4").css('background-color', '#f5f2f2'); 
			$("#button-4 a").css('color', '#d6d6d6');  
			//$("#button-4").children().css('color', '#d6d6d6');
			//alert()
	} else {
		 $("#button-1").css('background-color', '#fff');
			$("#button-1").css('border', '2px solid #e64c7f'); 
			$("#button-1 a").css('color', '#e64c7f'); 
			$("#eff-1").css('background-color', '#e64c7f'); 
			$("#button-1").mouseenter(function(){
				$("#button-1").children().css('color', '#fff');
			}); 
			$("#button-1").mouseleave(function(){
				$("#button-1").children().css('color', '#e64c7f');
			}); 

		bcount++;
		//alert(bcount);
		getlist(bcount); 	
	}
	/* if(bcount == )  */
}

//하트 마우스호버/언호버 func
function hhover(e){
	if($(e).text() == "♡") {
		$(e).text("♥");
	} else {
		$(e).text("♡");
	}
}  //하트 마우스호버 func
function hunhover(e){
	if($(e).text() == "♡") {
		$(e).text("♥");
	} else {
		$(e).text("♡");
	}
}  //하트 마우스호버 func

//match list 불러오는 func
function getlist(bcount) {
	//alert(num);
	if(bcount == 0) {
		btNum = bcount;
	} else {
		btNum = (parseInt(bcount) * 9);
	}
	//alert(btNum);
	$.ajax({
		url: "Match.do",
		data: {login_no : login_no, btNum: btNum},
		type: "post",
		dataType: "json",
		success: function(obj){
			//alert("값돌아옴");
			var objStr = JSON.stringify(obj);
			var jsonObj = JSON.parse(objStr);
			var outValues = $("#ajax_ulbox").html();
			outValues = "";
			//alert(jsonObj.list.length);
			for(var i = 0; i <jsonObj.list.length; i++) {
				//alert("for문");
				outValues += "<li><div class='matimg' style='background-image:url(\"resources/images/profile/"+
							decodeURIComponent(jsonObj.list[i].mat_prof).replace(/\+/gi, " ")+"\");'>"+
/* 							+decodeURIComponent(jsonObj.list[i].mat_prof).replace(/\+/gi, " ") +"');'>"+ */
							"<div class='matp'>"+
							"<p id='pname'>"+
							decodeURIComponent(jsonObj.list[i].mat_name).replace(/\+/gi, " ") + "</p>"+
							"<p id='page'>"+jsonObj.list[i].mat_age +" 세 </p>"+
							"<p id='pjob'>"+decodeURIComponent(jsonObj.list[i].mat_job).replace(/\+/gi, " ") +"</p>"+
							"<p id='psch'>"+decodeURIComponent(jsonObj.list[i].mat_sch).replace(/\+/gi, " ") +"</p>"+
							"<p id='pad'>"+decodeURIComponent(jsonObj.list[i].mat_loc).replace(/\+/gi, " ") +"</p>"+
							"</div>"+
							"<div class='matright'>"+
							"<a href='#' class='math' id='heart' onclick='changeLikes(this,"+ 
							jsonObj.list[i].mat_no+");' "+ 
							"onmouseover='hhover(this);' onmouseout='hunhover(this);'>♡</a>"+
							"<!-- <div class='matchat'><button id='matchatbt'>1:1 채팅</button></div> -->"+       
							"</div>"+
							"</div>"+
							"</li>"; 		
							
			} 
			$("#ajax_ulbox").html(outValues);
			listcount = jsonObj.list[0].listcount;
		},
        error : function(request, status, errorData){
            console.log("error code : " + request.status 
                  + "\nMessage : " + request.responseText
                  + "\nError : " + errorData);
        }//error
	}); //ajax
}//matchlist 불러오는 func

//하트 클릭시 찜하기/찜삭제하기 동작 --------------------------------
function changeLikes(e,rNo){ 
	var u_no_send = ${loginMember.u_no};
	var u_no_rec = rNo;
	var matchatid = "matchat"+rNo;
	//클릭전 채운하트인경우(마우스호버때문에 ♡)
	if($(e).text() == "♡") {
		$.ajax({
			url:"deleteLikes.do", 
			data: {u_no_send : u_no_send, u_no_rec: u_no_rec},
			type: "post",
			async: false,
			success: function(data) {
			alert("♡ 되었습니다");
				$(e).text("♥"); 
				/* if(utype == 1) {
				//	alert("utype1"+ matchatid); // async: false 추가
					$("#"+matchatid).removeClass("active");
					return false;
				}  */
			}, 
			error : function(jsonData){
				console.log("error code : " + request.status + "\nMessage : " + request.responseText + "\nError : " + errorData);
			}
		}); // ♥(호버상태 ♡)클릭시 찜삭제ajax				
	} else { //클릭전 채운하트인경우
		/* alert("if ♡(호버상태) 일때");  */
		$.ajax({
			url:"insertLikes.do", 
			data: {u_no_send : u_no_send, u_no_rec: u_no_rec},
			type: "post",
			async: false,
			success: function(data) {
				alert("♥ 되었습니다");
				$(e).text("♡"); 
				/* if(utype == 1) {
					//alert("utype1"+ matchatid);
					$("#"+matchatid).addClass("active");
					return false;
				} */
			}, 
			error : function(jsonData){
				console.log("error code : " + request.status + "\nMessage : " + request.responseText + "\nError : " + errorData);
			}
		}); // if ♡(호버상태 ♥) 일때 클릭시 찜추가 ajax 
	}
} // 하트 클릭시 찜하기/찜삭제하기 동작 func

</script>
</head>
<body>
<c:import url="../common/header.jsp"/>
<div id="matdiv1">
  <!--  <div class="button-1">
    <div class="eff-1"></div>
    <a href="#"> Touch me </a>
  </div>
  <div class="button-4">
    <div class="eff-4"></div>
    <a href="#"> Touch me </a> -->
    
<div id="button-1" onclick="prevClick();"> <div id="eff-1"></div>
<a href="#" class="matbt" >prev</a></div>
<div id="centerdiv"><p id="centerp">
${loginMember.u_name} 회원 님의 이상형 매칭 입니다</p> 
<p id="centerp2">
#키${loginMember.i_height}cm전후  #${loginMember.i_loc}
 #${loginMember.i_weight}체형 #${loginMember.i_edu}
  #나이${loginMember.i_age}세전후</p> 
</div>
<div id="button-4" onclick="nextClick();"> <div id="eff-4"></div>
<a href="#" class="matbt" >next</a> </div>

</div>

<div id="matdiv2">
<div id="matdiv2_1">
<ul id="ajax_ulbox"> 


</ul>

</div> <!-- matdiv2_1 끝-->
</div> <!-- matdiv2 끝-->
<c:import url="../common/footer.jsp"/>
</body>
</html>