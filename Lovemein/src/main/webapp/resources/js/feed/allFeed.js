/**
 * 전체 유저 피드용 자바스크립트 by 귀정
 */

//마우스를 올리면 각피드별 메뉴 나오게 함
function showMenuFun(f_no){
	
	$("#allFeedmenu" + f_no).css("display","inline-block").css("z-index","999999");
}

//커서가 사라지면 메뉴 안보이게 처리
function hideMenuFun(f_no){
	
	$("#allFeedmenu" + f_no).css("display","none");
}

//상대 피드로 이동함
function gotargetFeedFunc(u_no){
	
	location.href = "goTargetFeed.do?u_no=" + u_no;
}

//게시글 하나만 눌러서 보기
function showFeedOneFunc(f_no){
	
	var maskHeight = $(document).height();  
	var maskWidth = $(window).width();
	
	$("#showFeedOneArea" + f_no).css("display","inline-block").css("z-index","999999");
	$('#mask').css({'width':maskWidth,'height':maskHeight});
	$('#mask').css("background","#000");
	$('#mask').css("z-index","999");
	$('#mask').fadeTo(500,0.8);
}

//게시글 닫기
function findCloseFnc(){
	
	var maskHeight = $(document).height();  
	var maskWidth = $(window).width();
	
	$(".showFeedOneArea").css("display","none");
	$('#mask').css({'width':maskWidth,'height':maskHeight});
	$('#mask').css("z-index","-1");
	$('#mask').fadeTo(800,0);
	
	
}

//mask영역 클릭시 모달창 닫힘
function closeMaskFun(){
	
	$("#mask").css("display","none");
	$(".showFeedOneArea").css("display","none");
	
}

//좋아요 취소하기
function delLikeFunc(f_no){
	
	var u_no = $("#hiddenU_no").val();
	
	$.ajax({
		
		 url : "delLike.do",
         data : {f_no:f_no,u_no:u_no},
         type : "post",
         success : function(message){
        
        	 location.reload();
        	 
         },
         error : function(request, status, errorData){
            console.log("error code : " + request.status 
                  + "\nMessage : " + request.responseText
                  + "\nError : " + errorData);
         }
	});
}

//좋아요 누르기
function plusLikeFunc(f_no){
	
	var u_no = $("#hiddenU_no").val();
	
	$.ajax({
		
		 url : "plusLike.do",
         data : {f_no:f_no,u_no:u_no},
         type : "post",
         success : function(message){
        
        	 location.reload();
        	 
         },
         error : function(request, status, errorData){
            console.log("error code : " + request.status 
                  + "\nMessage : " + request.responseText
                  + "\nError : " + errorData);
         }
	});
}