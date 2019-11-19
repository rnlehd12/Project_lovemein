<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<!DOCTYPE html>
<!-- 찜목록페이지_서영 -->
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
	
	// 내가 찜한 사람 목록 div 추가 ajax 		
	$.ajax({
		url: "addFromMeList.do",
		data: {u_no_send : u_no_send, btn_val: btn_val},
		type:"post",
		dataType : "json",
		success: function(obj){
			// 내가 찜한 사람
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
					"><div class='matright'>" + /* jsonObj.list[i].u_no_rec + */
					"<a href='#' class='math' id='heart"+jsonObj.list[i].u_no_rec+"' "  + 
					"onclick='changeLikes(this, "+ jsonObj.list[i].u_no_rec +"," +decodeURIComponent(jsonObj.list[i].u_type).replace(/\+/gi, " ")+");' "+
					"onmouseover='hhover(this);' onmouseout='hunhover(this);'>" +	
					"♥" + "</p>" +
					"</a>";
					// 내가 찜한 사람
					/* if(decodeURIComponent(jsonObj.list[i].u_type).replace(/\+/gi, " ") == 1) {
						outValues += 
							"<div class='matchat'>" +
							"<a href='#' class='matchatbt'> 1:1 채팅</a></div>" ;
					} */
					if(decodeURIComponent(jsonObj.list[i].u_type).replace(/\+/gi, " ") == 1) {
						outValues += 
							"<div class='matchat active' id='matchat"+jsonObj.list[i].u_no_rec+"'>" +
							"<a href='talkView.do?c_from_uno="+jsonObj.list[i].u_no_send+"&c_to_uno="+jsonObj.list[i].u_no_rec+"' class='matchatbt'> 1:1 채팅</a></div>" ;
					} else {
						outValues += 
							"<div class='matchat' id='matchat"+jsonObj.list[i].u_no_rec+"'>" +
							"<a href='talkView.do?c_from_uno="+jsonObj.list[i].u_no_send+"&c_to_uno="+jsonObj.list[i].u_no_rec+"' class='matchatbt'> 1:1 채팅</a></div>" ;
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
						"><div class='matright'>" + /* jsonObj.list[i].u_no_rec + */
						"<a href='#' class='math' id='heart"+jsonObj.list[i].u_no_rec+"' "  + 
						"onclick='changeLikes(this, "+ jsonObj.list[i].u_no_rec +"," +decodeURIComponent(jsonObj.list[i].u_type).replace(/\+/gi, " ")+");' "+
						"onmouseover='hhover(this);' onmouseout='hunhover(this);'>" +	
						"♥" + "</p>" +
						"</a>";
						
						if(decodeURIComponent(jsonObj.list[i].u_type).replace(/\+/gi, " ") == 1) {
							outValues += 
								"<div class='matchat active' id='matchat"+jsonObj.list[i].u_no_rec+"'>" +
								"<a href='talkView.do?c_from_uno="+jsonObj.list[i].u_no_send+"&c_to_uno="+jsonObj.list[i].u_no_rec+"' class='matchatbt'> 1:1 채팅</a></div>" ;
						} else {
							outValues += 
								"<div class='matchat' id='matchat"+jsonObj.list[i].u_no_rec+"'>" +
								"<a href='talkView.do?c_from_uno="+jsonObj.list[i].u_no_send+"&c_to_uno="+jsonObj.list[i].u_no_rec+"' class='matchatbt'> 1:1 채팅</a></div>" ;
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
			}// 내가 찜한 사람 목록 더보기
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
		
		$(".tab_alldiv div").removeClass("active");
		$(".tab-div").removeClass("active");
		
		$(this).addClass("active");
		$("#"+tabDiv_id).addClass("active");
		//$(window).hashchange(); 
	})
	
});	
 
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

//나를 찜한 사람 목록 document
$(function(){
	var u_no_rec = ${loginMember.u_no};
	var btn_val = 0;
	
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
					"<a href='#' class='math' id='heart"+jsonObj.list[i].u_no_send+"' "  +
					"onclick='changeLikes2(this, "+ jsonObj.list[i].u_no_send +"," +decodeURIComponent(jsonObj.list[i].u_type).replace(/\+/gi, " ")+");' "+
					"onmouseover='hhover(this);' onmouseout='hunhover(this);'>";
					
					/* decodeURIComponent(jsonObj.list[i].u_type).replace(/\+/gi, " ") +  */
					if(decodeURIComponent(jsonObj.list[i].u_type).replace(/\+/gi, " ") == 1) {
						outValues += "♥";
					} else {
						outValues += "♡";
					}
					outValues +=	"</p>" +
									"</a>";
					// 나를찜한 서로 찜한경우/아닌경우 div
					if(decodeURIComponent(jsonObj.list[i].u_type).replace(/\+/gi, " ") == 1) {
						outValues += 
							"<div class='matchat tactive' id='tmatchat"+jsonObj.list[i].u_no_send+"'>" +
							"<a href='talkView.do?c_from_uno="+jsonObj.list[i].u_no_rec+"&c_to_uno="+jsonObj.list[i].u_no_send+"' class='matchatbt'> 1:1 채팅</a></div>" ;
					} 	else {
						outValues += 
							"<div class='matchat' id='tmatchat"+jsonObj.list[i].u_no_send+"'>" +
							"<a href='talkView.do?c_from_uno="+jsonObj.list[i].u_no_rec+"&c_to_uno="+jsonObj.list[i].u_no_send+"' class='matchatbt'> 1:1 채팅</a></div>" ;
					} 	
					outValues += "</div>" +
								"</div>" +
								"</div>" +
								"</li>";
				if(i == jsonObj.list.length-1) {
					outValues += 
						"<div id='t_addlistBtnDiv'>" +
						"<button id='t_addlistBtn' class='addbtn' onclick='addTBtnFunc(this, "+ jsonObj.list[i].u_no_send +");' value='9'>Read More</button></div>";
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
	$("#t_addlistBtnDiv").remove(); // 이전 버튼 삭제
	
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
						"<a href='#' class='math' id='heart"+jsonObj.list[i].u_no_send+"' "  +
						"onclick='changeLikes2(this, "+ jsonObj.list[i].u_no_send +"," +decodeURIComponent(jsonObj.list[i].u_type).replace(/\+/gi, " ")+");' "+
						"onmouseover='hhover(this);' onmouseout='hunhover(this);'>";
						
						/* decodeURIComponent(jsonObj.list[i].u_type).replace(/\+/gi, " ") +  */
						if(decodeURIComponent(jsonObj.list[i].u_type).replace(/\+/gi, " ") == 1) {
							outValues += "♥";
						} else {
							outValues += "♡";
						}
						outValues +=	"</p>" +
										"</a>";
						// 나를찜한
						if(decodeURIComponent(jsonObj.list[i].u_type).replace(/\+/gi, " ") == 1) {
							outValues += 
								"<div class='matchat tactive' id='tmatchat"+jsonObj.list[i].u_no_send+"'>" +
								"<a href='talkView.do?c_from_uno="+jsonObj.list[i].u_no_rec+"&c_to_uno="+jsonObj.list[i].u_no_send+"' class='matchatbt'> 1:1 채팅</a></div>" ;
						} 	else {
							outValues += 
								"<div class='matchat' id='tmatchat"+jsonObj.list[i].u_no_send+"'>" +
								"<a href='talkView.do?c_from_uno="+jsonObj.list[i].u_no_rec+"&c_to_uno="+jsonObj.list[i].u_no_send+"' class='matchatbt'> 1:1 채팅</a></div>" ;
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
} //addTBtnFunc버튼 (나를 찜한 사람목록 더보기버튼) 클릭 func

//내가 찜한 사람 목록 하트 클릭시 찜하기/찜삭제하기 동작 --------------------------------
function changeLikes(e,rNo, utype){ 
	var u_no_send = ${loginMember.u_no};
	var u_no_rec = rNo;
	var matchatid = "matchat"+rNo;
	//클릭전 채운하트인경우(마우스호버때문에 ♡)
	if($(e).text() == "♡") {
		
		//alert("if ♥(호버상태 ♡)클릭시 찜삭제ajax");
		$.ajax({
			url:"deleteLikes.do", 
			data: {u_no_send : u_no_send, u_no_rec: u_no_rec},
			type: "post",
			async: false,
			success: function(data) {
			//	alert("if ♥(호버상태 ♡)클릭시 찜삭제ajax 다녀옴. data,e : "+ data.result+", "+$(e).text());
				alert("♡ 되었습니다");
				$(e).text("♥"); 
				if(utype == 1) {
				//	alert("utype1"+ matchatid); // async: false 추가
					$("#"+matchatid).removeClass("active");
					return false;
				} 
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
			//	alert("if ♡(호버상태 ♥) 일때 클릭시 찜추가 ajax 다녀옴. data,e : "+ data.result+", "+ $(e).text());
				//alert(matchatid);
				alert("♥ 되었습니다");
				$(e).text("♡"); 
				// async: false 추가
				if(utype == 1) {
					//alert("utype1"+ matchatid);
					$("#"+matchatid).addClass("active");
					return false;
				}
			//	$("#"+matchatid).addClass("active");
			}, 
			error : function(jsonData){
				console.log("error code : " + request.status + "\nMessage : " + request.responseText + "\nError : " + errorData);
			}
		}); // if ♡(호버상태 ♥) 일때 클릭시 찜추가 ajax 
	}
} // 하트 클릭시 찜하기/찜삭제하기 동작 fun1(내가 찜한 사람 목록) 끝
//하트 클릭시 찜하기/찜삭제하기 동작 fun1(나를 찜한 사람 목록) 끝
function changeLikes2(e,rNo, utype){ 
	var u_no_send = ${loginMember.u_no};
	var u_no_rec = rNo;
	var tmatchatid = "tmatchat"+rNo;
	//클릭전 채운하트 (마우스호버로 ♡ )
	if($(e).text() == "♡") {
		//삭제 ajax 실행 // ♥클릭시 찜삭제 (호버상태 ♡)	
		$.ajax({
			url:"deleteLikes.do", 
			data: {u_no_send : u_no_send, u_no_rec: u_no_rec},
			type: "post",
			async: false,
			success: function(data) {
			//	alert("if ♥(호버상태 ♡)클릭시 찜삭제ajax 다녀옴. data,e : "+ data.result+", "+$(e).text());
				alert("♡ 되었습니다");
				$(e).text("♥"); 
				
					$("#"+tmatchatid).removeClass("tactive");
					return false;
			}, 
			error : function(jsonData){
				console.log("error code : " + request.status + "\nMessage : " + request.responseText + "\nError : " + errorData);
			}
		}); 
	} else { 
		/* alert("if ♡(호버상태) 일때");  */ // ♡클릭시 찜추가 (호버상태 ♥)	
		$.ajax({
			url:"insertLikes.do", 
			data: {u_no_send : u_no_send, u_no_rec: u_no_rec},
			type: "post",
			async: false, 
			success: function(data) {
				alert("♥ 되었습니다");
				$(e).text("♡"); 
					$("#"+tmatchatid).addClass("tactive");
					return false;
			}, 
			error : function(jsonData){
				console.log("error code : " + request.status + "\nMessage : " + request.responseText + "\nError : " + errorData);
			}
		}); // if ♡ 클릭시 찜추가 ajax(호버상태 ♥) 
	}
} // 나를 찜한 사람들 하트 클릭시 찜하기/찜삭제하기 동작 func2 끝

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
<div class="tab_link active" id="tab1" data-toggle="likesBody_div1"><a href="#reloadTab1" class="tab_a" >내가 찜한 친구들</a></div
><div class="tab_link" id="tab2" data-toggle="likesBody_div2" ><a href="#reloadTab2" class="tab_a" \>나를 찜한 친구들</a></div>
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