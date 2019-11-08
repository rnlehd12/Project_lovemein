<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>${loginMember.u_name}님의 찜목록</title>
<link href="resources/css/likes/likeListView.css" rel="stylesheet">
<link href="resources/css/common/common.css" rel="stylesheet">
<script type="text/javascript" src="resources/js/jquery-3.4.1.min.js"></script>
<script type="text/javascript">
//내가 찜한 사람 목록 document
$(function(){
	var u_no_send = ${loginMember.u_no};
	var btn_val = 0;
		
	/* alert(end_row);  */
	// 내가 찜한 사람 목록 div 추가 ajax 		
	$.ajax({
		url: "addFromMeList.do",
		data: {u_no_send : u_no_send, btn_val: btn_val},
		type:"post",
		dataType : "json",
		success: function(obj){
			// 내가 찜한 사람
/* 			alert("sendLike ajax 값 돌아옴"); */
			var objStr = JSON.stringify(obj);
			var jsonObj = JSON.parse(objStr);
			var outValues = $("#onelist_ul1").html();
			 
			for(var i = 0; i < jsonObj.list.length; i++ ) { 
				outValues += 
					"<li class='oneImg_li'>" +
					"<div class='oneImg_div'>" +
					"<div class='imgPart'>" +
					"<img src='resources/images/profile/" +
					decodeURIComponent(jsonObj.list[i].u_rec_profile).replace(/\+/gi, " ") +"'>" +
					"</div>" +
					"<div class='profilePart'>" +
					"<div class='matp'>" +
					"<p class='pname'>" + decodeURIComponent(jsonObj.list[i].u_rec_name).replace(/\+/gi, " ") + "</p>" +
					"<p class='page'>" + jsonObj.list[i].u_rec_age + "세</p>" +
					"<p class='pjob'>" + decodeURIComponent(jsonObj.list[i].u_rec_job).replace(/\+/gi, " ") + "</p>" +
					"<p class='psch'>" + decodeURIComponent(jsonObj.list[i].u_rec_sch).replace(/\+/gi, " ") + "</p>" +
					"<p class='ploc'>" + decodeURIComponent(jsonObj.list[i].u_rec_loc).replace(/\+/gi, " ") + "</p>" +
					"</div" +
					"><div class='matright'>" +
					"<a href='#' class='math' onmouseover='hhover(this);' onmouseout='hunhover(this);'>" +	decodeURIComponent(jsonObj.list[i].u_type).replace(/\+/gi, " ") + "</p>" +
					"</a>";
					// 내가 찜한 사람
					if(decodeURIComponent(jsonObj.list[i].u_type).replace(/\+/gi, " ") == '♥') {
						outValues += 
							"<div class='matchat'>" +
							"<a href='#' class='matchatbt'> 1:1 채팅</a></div>" ;
					} 			
					outValues += "</div>" +
								"</div>" +
								"</div>" +
								"</li>";
				if(i == jsonObj.list.length-1) {
					outValues += 
						"<div id='f_addlistBtnDiv'>" +
						"<button id='f_addlistBtn'class='addbtn' onclick='addBtnFunc(this);' value='9'>Read More</button></div>";
				} //if	// 내가 찜한 사람
			} // for// 내가 찜한 사람
			$("#onelist_ul1").html(outValues);
			
		},
        error : function(request, status, errorData){
           console.log("error code : " + request.status 
                 + "\nMessage : " + request.responseText
                 + "\nError : " + errorData);
        }
	}); // 내가 찜한 사람 목록 div 추가 ajax 	
});//document.ready

//내가 찜한 사람 목록 더보기 클릭시  	
function addBtnFunc(btnVal){ 
	var u_no_send = ${loginMember.u_no};
	var btn_val = btnVal.value; 		
	/* alert("버튼실행. 넘길 버튼값 :" + btn_val);  */
	$("#f_addlistBtnDiv").remove();
	$.ajax({
		url: "addFromMeList.do",
		data: {u_no_send : u_no_send, btn_val: btn_val},
		type:"post",
		dataType : "json",
		success: function(obj){
			var objStr = JSON.stringify(obj);
			var jsonObj = JSON.parse(objStr);
			var outValues = $("#onelist_ul1").html();
			/* alert("addAjax 되돌아옴. 돌아온 list :" + jsonObj.list.length);  */
			// 내가 찜한 사람 목록 더보기
			if(jsonObj.list.length != 0) {
				for(var i = 0; i < jsonObj.list.length; i++ ) { 
					outValues += 
						"<li class='oneImg_li'>" +
						"<div class='oneImg_div'>" +
						"<div class='imgPart'>" +
						"<img src='resources/images/profile/" +
						decodeURIComponent(jsonObj.list[i].u_rec_profile).replace(/\+/gi, " ") +"'>" +
						"</div>" +
						"<div class='profilePart'>" +
						"<div class='matp'>" +
						"<p class='pname'>" + decodeURIComponent(jsonObj.list[i].u_rec_name).replace(/\+/gi, " ") + "</p>" +
						"<p class='page'>" + jsonObj.list[i].u_rec_age + "세</p>" +
						"<p class='pjob'>" + decodeURIComponent(jsonObj.list[i].u_rec_job).replace(/\+/gi, " ") + "</p>" +
						"<p class='psch'>" + decodeURIComponent(jsonObj.list[i].u_rec_sch).replace(/\+/gi, " ") + "</p>" +
						"<p class='ploc'>" + decodeURIComponent(jsonObj.list[i].u_rec_loc).replace(/\+/gi, " ") + "</p>" +
						"</div" +
						"><div class='matright'>" +
						"<a href='#' class='math' id='fmath' onmouseover='hhover(this);' onmouseout='hunhover(this);'>" +	decodeURIComponent(jsonObj.list[i].u_type).replace(/\+/gi, " ") + "</p>" +
						
						"</a>";
						// 내가 찜한 사람 목록 더보기
						if(decodeURIComponent(jsonObj.list[i].u_type).replace(/\+/gi, " ") == '♥') {
							outValues += 
								"<div class='matchat'>" +
								"<a href='#' class='matchatbt'> 1:1 채팅</a></div>" ;
						} 			
						outValues += "</div>" +
									"</div>" +
									"</div>" +
									"</li>";
					if(i == jsonObj.list.length-1) {
						var addBtnVal = parseInt(btn_val) +9;
						/* alert("addfromAjax 돌아와서 for문안의 if문 처리중. addBtnVal(증가된버튼값) : " +addBtnVal); */
						outValues += 
							"<div id='f_addlistBtnDiv'>" +
							"<button id='f_addlistBtn' class='addbtn' onclick='addBtnFunc(this);'" +
							"value='" + addBtnVal +"'>Read More</button></div>";
					} //for문 안의 if	// 내가 찜한 사람 목록 더보기
				} // for // 내가 찜한 사람 목록 더보기
				
				$("#onelist_ul1").html(outValues); 
			
			} else {
				outValues += 
					"<div id='f_addlistBtnDiv'>" +
					"<button id='f_addlistBtn' class='addbtn' onclick='addBtnFunc(this);'" +
					"value='" + addBtnVal +"'>Read More</button></div>";
				$("#onelist_ul1").html(outValues); 
				$("#f_addlistBtnDiv").attr("class", "addbtn disabled");
				$("#f_addlistBtnDiv").text("더 이상 불러올 목록이 없습니다.");
				// 내가 찜한 사람 목록 더보기
				/* $("#onelist_ul1").html(outValues);  */
				
			}
			
		},
        error : function(request, status, errorData){
           console.log("error code : " + request.status 
                 + "\nMessage : " + request.responseText
                 + "\nError : " + errorData);
        }
	}); // 내가 찜한 사람 목록 더보기 div ajax 	
} //addBtnFunc버 (내가 찜한 사람 목록 더보기버튼) 클릭모션

//탭이동 func
$(function(){
	$(".tab_alldiv div").on("click", function(){
		var tabDiv_id = $(this).attr("data-toggle");
		alert(tabDiv_id);
		
		$(".tab_alldiv div").removeClass("active");
		$(".tab-div").removeClass("active");
		
		$(this).addClass("active");
		$("#"+tabDiv_id).addClass("active");
	})
}); //탭이동	

//하트 마우스호버/언호버 func
function hhover(e){
	if($(e).text() == "♡") {
		$(e).text("♥");
	} else {
		$(e).text("♡");
	}
} //하트 마우스호버 func
function hunhover(e){
	if($(e).text() == "♡") {
		$(e).text("♥");
	} else {
		$(e).text("♡");
	}
} //하트 마우스호버 func


//나를 찜한 사람 목록 document
$(function(){
	var u_no_rec = ${loginMember.u_no};
	var btn_val = 0;
		
	/* alert(end_row);  */
	// 나를 찜한 사람 목록 div 추가 ajax 		
	$.ajax({
		url: "addToMeList.do",
		data: {u_no_rec : u_no_rec, btn_val: btn_val},
		type:"post",
		dataType : "json",
		success: function(obj){
/* 			alert("sendLike ajax 값 돌아옴"); */
			var objStr = JSON.stringify(obj);
			var jsonObj = JSON.parse(objStr);
			var outValues = $("#onelist_ul2").html();
			// 나를 찜한 사람
			for(var i = 0; i < jsonObj.list.length; i++ ) { 
				/*			u_no_rec,  u_no_send,  u_send_name, 
				u_send_profileImg, u_send_age, u_send_job, 
				u_send_sch, u_send_loc, u_type ;*/ // toMe찜리스트
				outValues += 
					"<li class='oneImg_li'>" +
					"<div class='oneImg_div'>" +
					"<div class='imgPart'>" +
					"<img src='resources/images/profile/" +
					decodeURIComponent(jsonObj.list[i].u_send_profile).replace(/\+/gi, " ") +"'>" +
					"</div>" +              
					"<div class='profilePart'>" +
					"<div class='matp'>" +
					"<p class='pname'>" + decodeURIComponent(jsonObj.list[i].u_send_name).replace(/\+/gi, " ") + "</p>" +
					"<p class='page'>" + jsonObj.list[i].u_send_age + "세</p>" +
					"<p class='pjob'>" + decodeURIComponent(jsonObj.list[i].u_send_job).replace(/\+/gi, " ") + "</p>" +
					"<p class='psch'>" + decodeURIComponent(jsonObj.list[i].u_send_sch).replace(/\+/gi, " ") + "</p>" +
					"<p class='ploc'>" + decodeURIComponent(jsonObj.list[i].u_send_loc).replace(/\+/gi, " ") + "</p>" +
					"</div" +
					"><div class='matright'>" +
					"<a href='#' class='math' onmouseover='hhover(this);' onmouseout='hunhover(this);'>" +	"♥" + "</p>" +
					"</a>";
					// 나를 찜한 사람
					if(decodeURIComponent(jsonObj.list[i].u_type).replace(/\+/gi, " ") == 1) {
						outValues += 
							"<div class='matchat'>" +
							"<a href='#' class='matchatbt'> 1:1 채팅</a></div>" ;
					} 			
					outValues += "</div>" +
								"</div>" +
								"</div>" +
								"</li>";
				if(i == jsonObj.list.length-1) {
					outValues += 
						"<div id='t_addlistBtnDiv'>" +
						"<button id='t_addlistBtn' class='addbtn' onclick='addTBtnFunc(this);' value='9'>Read More</button></div>";
				} //if	// 나를 찜한 사람
			} // for// 나를 찜한 사람
			$("#onelist_ul2").html(outValues);
			
		},
        error : function(request, status, errorData){
           console.log("error code : " + request.status 
                 + "\nMessage : " + request.responseText
                 + "\nError : " + errorData);
        }
	}); // 나를 찜한 사람 목록 div 추가 ajax 	
});//document.ready

//나를 찜한  사람 목록 더보기 클릭시  	
function addTBtnFunc(btnVal){ 
	var u_no_rec = ${loginMember.u_no};
	var btn_val = btnVal.value; 		
	/* alert("버튼실행. 넘길 버튼값 :" + btn_val); */  
	$("#t_addlistBtnDiv").remove();
	$.ajax({
		url: "addToMeList.do",
		data: {u_no_rec : u_no_rec, btn_val: btn_val},
		type:"post",
		dataType : "json",
		success: function(obj){
			var objStr = JSON.stringify(obj);
			var jsonObj = JSON.parse(objStr);
			var outValues = $("#onelist_ul2").html();
			// 나를 찜한 사람
			if(jsonObj.list.length != 0) {
				/* alert("sendLike ajax 값 돌아옴 수 : " + jsonObj.list.length);  */
				for(var i = 0; i < jsonObj.list.length; i++ ) { 
					/*			u_no_rec,  u_no_send,  u_send_name, 
					u_send_profileImg, u_send_age, u_send_job, 
					u_send_sch, u_send_loc, u_type ;*/ // toMe찜리스트
					outValues += 
						"<li class='oneImg_li'>" +
						"<div class='oneImg_div'>" +
						"<div class='imgPart'>" +
						"<img src='resources/images/profile/" +
						decodeURIComponent(jsonObj.list[i].u_send_profile).replace(/\+/gi, " ") +"'>" +
						"</div>" +              
						"<div class='profilePart'>" +
						"<div class='matp'>" +
						"<p class='pname'>" + decodeURIComponent(jsonObj.list[i].u_send_name).replace(/\+/gi, " ") + "</p>" +
						"<p class='page'>" + jsonObj.list[i].u_send_age + "세</p>" +
						"<p class='pjob'>" + decodeURIComponent(jsonObj.list[i].u_send_job).replace(/\+/gi, " ") + "</p>" +
						"<p class='psch'>" + decodeURIComponent(jsonObj.list[i].u_send_sch).replace(/\+/gi, " ") + "</p>" +
						"<p class='ploc'>" + decodeURIComponent(jsonObj.list[i].u_send_loc).replace(/\+/gi, " ") + "</p>" +
						"</div" +
						"><div class='matright'>" +
						"<a href='#' class='math' onmouseover='hhover(this);' onmouseout='hunhover(this);'>" +	"♥" + "</p>" +
						"</a>";
						// 나를 찜한 사람
						if(decodeURIComponent(jsonObj.list[i].u_type).replace(/\+/gi, " ") == 1) {
							outValues += 
								"<div class='matchat'>" +
								"<a href='#' class='matchatbt'> 1:1 채팅</a></div>" ;
						} 			
						outValues += "</div>" +
									"</div>" +
									"</div>" +
									"</li>";
					if(i == jsonObj.list.length-1) {
						var addBtnVal = parseInt(btn_val) +9;
						outValues += 
							"<div id='t_addlistBtnDiv'>" +
							"<button id='t_addlistBtn' class='addbtn' onclick='addTBtnFunc(this);'" +
							"value='" + addBtnVal +"'>Read More</button></div>";
					} //if	// 나를 찜한 사람
				} // for// 나를 찜한 사람
				$("#onelist_ul2").html(outValues); 
			
			} else {
				outValues += 
					"<div id='t_addlistBtnDiv'>" +
					"<button id='t_addlistBtn' class='addTbtn' onclick='addTBtnFunc(this);'" +
					"value='" + addBtnVal +"'>Read More</button></div>";
				$("#onelist_ul2").html(outValues); 
				$("#t_addlistBtnDiv").attr("class", "addTbtn disabled");
				$("#t_addlistBtnDiv").text("더 이상 불러올 목록이 없습니다.");
				// 나를 찜한 사람 목록 더보기
			}
		
		},
        error : function(request, status, errorData){
           console.log("error code : " + request.status 
                 + "\nMessage : " + request.responseText
                 + "\nError : " + errorData);
        }
	}); // 나를 찜한 사람 목록 더보기 div ajax 	
} //addTBtnFunc버튼 (나를 찜한 사람목록 더보기버튼) 클릭모션



</script>
</head>
<body>
<c:import url="../common/header.jsp"/>
<br>
<br>
<div id="likesDiv">
<!-- 탭으로 바뀌는 첫번째 div(1.1 나를 찜한 리스트 toMEList_div) 시작 -->
<div id="all_div" class="myLikesList_div">

<div class="tab_alldiv">
<div class="tab_link active" id="tab1" data-toggle="likesBody_div1"><a class="tab_a" >나를 찜한 친구들</a></div
><div class="tab_link" id="tab2" data-toggle="likesBody_div2"><a class="tab_a">내가 찜한 친구들</a></div>
</div> <!-- tab_alldiv 끝 -->

<div id="likesBody_div1" class="tab-div active">
<ul id="onelist_ul1">
</ul>
</div> <!-- likesBody_div1 끝 --><!-- 탭내용div1 -->

<div id="likesBody_div2" class="tab-div">
<ul id="onelist_ul2">
</ul>
</div><!-- likesBody_div2 끝 --><!-- 탭내용div2 -->
<br>
<br>
</div> <!-- 1.1 all_div 끝 -->
</div> <!-- 1. likesDiv끝 -->
<br>
<br>
<br>
</body>
</html>