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
$(function(){
	var u_no_send = ${loginMember.u_no};
	var btn_val = 0;
		
	/* alert(end_row);  */
	$.ajax({
		url: "addfromMeList.do",
		data: {u_no_send : u_no_send, btn_val: btn_val},
		type:"post",
		dataType : "json",
		success: function(obj){
		
/* 			alert("sendLike ajax 값 돌아옴"); */
			var objStr = JSON.stringify(obj);
			var jsonObj = JSON.parse(objStr);
			var outValues = $("#onelist_ul1").html();
			 
			for(var i = 0; i < jsonObj.list.length; i++ ) { 
			/* for(var i in jsonObj.list) { */			
				outValues += 
					"<li class='oneImg_li'>" +
					"<div class='oneImg_div' id='oneImg_div_A'>" +
					"<div id='imgPart'>" +
					"<img src='resources/images/profile/" +
					decodeURIComponent(jsonObj.list[i].u_rec_profile).replace(/\+/gi, " ") +"'>" +
					"</div>" +
					"<div id='profilePart'>" +
					"<div id='matp'>" +
					"<p id='pname'>" + decodeURIComponent(jsonObj.list[i].u_rec_name).replace(/\+/gi, " ") + "</p>" +
					"<p id='page'>" + jsonObj.list[i].u_rec_age + "세</p>" +
					"<p id='pjob'>" + decodeURIComponent(jsonObj.list[i].u_rec_job).replace(/\+/gi, " ") + "</p>" +
					"<p id='psch'>" + decodeURIComponent(jsonObj.list[i].u_rec_sch).replace(/\+/gi, " ") + "</p>" +
					"<p id='ploc'>" + decodeURIComponent(jsonObj.list[i].u_rec_loc).replace(/\+/gi, " ") + "</p>" +
					"</div" +
					"><div id='matright'>" +
					"<div id='math'>♥</div>" +
					"<div id='matchat'><button id='matchatbt'>1:1 채팅</button></div>" +
					"</div>" +
					"</div>" +
					"</div>" +
					"</li>";
				if(i == jsonObj.list.length-1) {
					outValues += 
						"<div id='addlistBtnDiv'>" +
						"<button id='addlistBtn' onclick='addBtnFunc(this);' value='9' class='addBtn'>Read More</button></div>";
				
				} //if	
			} // for
			$("#onelist_ul1").html(outValues);
			
		},
        error : function(request, status, errorData){
           console.log("error code : " + request.status 
                 + "\nMessage : " + request.responseText
                 + "\nError : " + errorData);
        }
	}); // 찜한 사람 목록 div ajax 	
});//document.ready

function addBtnFunc(btnVal){
	var u_no_send = ${loginMember.u_no};
	var btn_val = btnVal.value; 		
	/* alert("버튼실행. 넘길 버튼값 :" + btn_val);  */
	$("#addlistBtnDiv").remove();
	$.ajax({
		url: "addfromMeList.do",
		data: {u_no_send : u_no_send, btn_val: btn_val},
		type:"post",
		dataType : "json",
		success: function(obj){
			var objStr = JSON.stringify(obj);
			var jsonObj = JSON.parse(objStr);
			var outValues = $("#onelist_ul1").html();
			/* alert("addAjax 되돌아옴. 돌아온 list :" + jsonObj.list.length);  */

			if(jsonObj.list.length != 0) {
				for(var i = 0; i < jsonObj.list.length; i++ ) { 
					outValues += 
						"<li class='oneImg_li'>" +
						"<div class='oneImg_div' id='oneImg_div_A'>" +
						"<div id='imgPart'>" +
						"<img src='resources/images/profile/" +
						decodeURIComponent(jsonObj.list[i].u_rec_profile).replace(/\+/gi, " ") +"'>" +
						"</div>" +
						"<div id='profilePart'>" +
						"<div id='matp'>" +
						"<p id='pname'>" + decodeURIComponent(jsonObj.list[i].u_rec_name).replace(/\+/gi, " ") + "</p>" +
						"<p id='page'>" + jsonObj.list[i].u_rec_age + "세</p>" +
						"<p id='pjob'>" + decodeURIComponent(jsonObj.list[i].u_rec_job).replace(/\+/gi, " ") + "</p>" +
						"<p id='psch'>" + decodeURIComponent(jsonObj.list[i].u_rec_sch).replace(/\+/gi, " ") + "</p>" +
						"<p id='ploc'>" + decodeURIComponent(jsonObj.list[i].u_rec_loc).replace(/\+/gi, " ") + "</p>" +
						"</div" +
						"><div id='matright'>" +
						"<div id='math'>♥</div>" +
						"<div id='matchat'><button id='matchatbt'>1:1 채팅</button></div>" +
						"</div>" +
						"</div>" +
						"</div>" +
						"</li>";	
					if(i == jsonObj.list.length-1) {
						var addBtnVal = parseInt(btn_val) +9;
						/* alert("addfromAjax 돌아와서 for문안의 if문 처리중. addBtnVal(증가된버튼값) : " +addBtnVal); */
						outValues += 
							"<div id='addlistBtnDiv'>" +
							"<button id='addlistBtn' onclick='addBtnFunc(this);'" +
							"value='" + addBtnVal +"' class='addBtn'>Read More</button></div>";
					} //for문 안의 if	
				} // for
				
				$("#onelist_ul1").html(outValues); 
			
			} else {
				outValues += 
					"<div id='addlistBtnDiv'>" +
					"<button id='addlistBtn' onclick='addBtnFunc(this);'" +
					"value='" + addBtnVal +"' class='addBtn'>Read More</button></div>";
				$("#onelist_ul1").html(outValues); 
				$("#addlistBtnDiv").attr("class", "addBtn disabled");
				$("#addlistBtnDiv").text("더 이상 불러올 목록이 없습니다.");
				
			}
			
		},
        error : function(request, status, errorData){
           console.log("error code : " + request.status 
                 + "\nMessage : " + request.responseText
                 + "\nError : " + errorData);
        }
	}); // 찜한 사람 목록 div ajax 	
} //addBtnFunc버튼 클릭모션

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
/* 	$(document).ready(function(){
	   
	  $('ul.tabs li').click(function(){
	    var tab_id = $(this).attr('data-tab');
	 
	    $('ul.tabs li').removeClass('current');
	    $('.tab-content').removeClass('current');
	 
	    $(this).addClass('current');
	    $("#"+tab_id).addClass('current');
	  })
	 
	}) */

</script>
</head>
<body>
<c:import url="../common/header.jsp"/>
<br>
<br>
<div id="likesDiv">
<!-- 탭으로 바뀌는 첫번째 div(1.1 나를 찜한 리스트 toMEList_div) 시작 -->
<div id="toMEList_div" class="myLikesList_div">
<div class="tab_alldiv">
<div class="tab_link active" id="tab1" data-toggle="likesBody_div1"><a class="tab_a" >나를 찜한 친구들</a></div
><div class="tab_link" id="tab2" data-toggle="likesBody_div2"><a class="tab_a">내가 찜한 친구들</a></div>
</div> <!-- tab_alldiv 끝 -->

<div id="likesBody_div1" class="tab-div active">
<ul id="onelist_ul1">

</ul>
</div> <!-- likesBody_div1 끝 --><!-- 탭변경div -->

<div id="likesBody_div2" class="tab-div">
<ul id="onelist_ul2">
ddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddd
</ul>
</div><!-- likesBody_div2 끝 --><!-- 탭변경div -->

</div> <!-- 1.1 toMEList_div 끝 -->



<br>
<!-- 탭으로 바뀌는 두번째 div(1.2 내가 찜한 리스트 fromMEList_div) 시작 -->

<!-- <div id="fromMEList_div" class="myLikesList_div">
<div class="tab_alldiv">
<div class="tabDiv" id="tab2"><p>나를 찜한 친구들</p></div
><div class="tabDiv" id="tab1"><p>내가 찜한 친구들</p></div>
</div>tab_alldiv 끝
<div class="likesBody_div">
<ul>

</ul>
</div>likesBody_div 끝

 

</div> 1.2 fromMEList_div 끝
 -->
</div> <!-- 1. likesDiv끝 -->
</body>
</html>