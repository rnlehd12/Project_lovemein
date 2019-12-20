/**
 * 공통헤더 영역 자바스크립트 by 귀정
 */

function menuCloseFunc(){
	$(".subMenu").css("display","none");
}

function alOpenFunc(){
	
	$("#alMenu").css("position","absolute");
	$("#alMenu").css("display","block");
	$("#myMenu").css("display","none");
}

function myOpenFunc(){
	
	$("#myMenu").css("position","absolute");
	$("#myMenu").css("display","block");
	$("#alMenu").css("display","none");
}

function closeMasksFun(){
	
	$("#mask").css("display","none");
	$("#searchAreas").css("display","none");
	$(".showFeedOneArea").css("display","none");
}

//커서를 올리면 검색내역 리스트 노출
function historyListFunc(){
	
	$("#searchAreas").css("display","block");
}

//검색어 전체삭제 이동 스크립트
function historyAllDelFunc(u_no){
	
	$.ajax({
		url : "historyAllDel.do",
		data : { u_no: u_no},
		type : "post",
		success : function(result){
			
			location.reload();
			$("#searchAreas").css("display","block");
		},
		error : function(request, status, errorData){
			console.log("error code : " + request.status 
					+ "\nMessage : " + request.responseText
					+ "\nError : " + errorData);
		}
	});
	
}

//## 검색어 한개만 삭제
function searchOneDelFunc(u_no, s_text){
	
	$.ajax({
		url : "searchOneDelete.do",
		data : {u_no: u_no, search_text : s_text},
		type : "post",
		success : function(result){
			
			location.reload();
		},
		error : function(request, status, errorData){
			console.log("error code : " + request.status 
					+ "\nMessage : " + request.responseText
					+ "\nError : " + errorData);
		}
	});
}