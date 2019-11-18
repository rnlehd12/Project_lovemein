/**
 * targetFeed.js(상대피드) by 귀정
 */

//댓글삭제용 자바스크립트
function replydelFunc(fr_no){

	var answer = confirm("댓글을 삭제하시겠습니까?");
	
	if(answer == false){
		
		return false;
		
	}else{
		
		$.ajax({
			
			 url : "replyDel.do",
	         data : {fr_no:fr_no},
	         type : "post",
	         success : function(message){
	        	
	        	 alert('댓글삭제에 성공했습니다. ');
	        	 location.reload();
	        	 
	         },
	         error : function(request, status, errorData){
	            console.log("error code : " + request.status 
	                  + "\nMessage : " + request.responseText
	                  + "\nError : " + errorData);
	         }        
		});	
	}
}

//댓글 수정 form 노출용 자바스크립트
function replyModiFunc(fr_no){
	
	//해당 댓글번호의 div만 노출되게 처리함.
	$("#replyModidiv"+ fr_no).css("display","block");
		
}

//댓글 수정 controller보내는 ajax
function replyModiSubFunc(fr_no){
	
	var fr_text = $("#fr_Moditext" + fr_no).val();
	
	$.ajax({
		
		 url : "replyModi.do",
         data : {fr_no:fr_no,fr_text:fr_text},
         type : "post",
         success : function(message){
        	
        	 alert('댓글수정에 성공했습니다.');
        	 location.reload();
        	 
         },
         error : function(request, status, errorData){
            console.log("error code : " + request.status 
                  + "\nMessage : " + request.responseText
                  + "\nError : " + errorData);
         }
	});
}

//댓글 수정 영역 닫는 자바스크립트
function closeReplyModiSubFunc(fr_no){
	//해당 댓글번호의 div만 닫힘처리함
	$("#replyModidiv"+fr_no).css("display","none");
}


//좋아요 삭제하기
function delLikeFunc(f_no){
	
	var u_no = $("#hiddenSessionU_no").val();

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
	
	var u_no = $("#hiddenSessionU_no").val();
	
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

//글쓰기 업로드 이미지 미리보기
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
			$("#imgDiv").append(html);
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

//피드 글 삭제 스크립트
function feedDelFunc(f_no){
	
	var answer = confirm("해당 글을 삭제하시겠습니까?\n삭제하시면 복구하실 수 없습니다.");
	
	if(answer == true){
		
		$.ajax({
			
			 url : "feedDel.do",
	         data : {f_no:f_no},
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
}

//충전페이지 이동용 스크립트
function goPayFunc(){
	
	location.href = "payMain.do";
}

//피드슬라이드 api  시작
$(document).ready(function () {
	
	  var mySwiper = new Swiper('.swiper-container', {
          
		 /* loop : true,*/
          calculateHeight : false,
          grabCursor : true,
          slidesPerView : 1,
          paginationClickable : true,
          loopAdditionalSlides: 0,
          slidesPerColumn: 1,
          navigation : {
  			nextEl : '.swiper-button-next', // 다음 버튼 클래스명
  			prevEl : '.swiper-button-prev', // 이번 버튼 클래스명
          },
		scrollbar: {
	        el: '.swiper-scrollbar',
	        hide: false,
	      },	
	  });
	  
	  var mySwiper2 = new Swiper('#swiper-container32', {
          
			 /* loop : true,*/
	          calculateHeight : false,
	          grabCursor : true,
	          slidesPerView : 1,
	          paginationClickable : true,
	          loopAdditionalSlides: 0,
	          slidesPerColumn: 1,
	          navigation : {
	  			nextEl : '.swiper-button-next', // 다음 버튼 클래스명
	  			prevEl : '.swiper-button-prev', // 이번 버튼 클래스명
	          },
			scrollbar: {
		        el: '.swiper-scrollbar',
		        hide: false,
		      },	
		  });	
});

//댓글더보기 자바스크립트
function moreReplyFunc(f_no,more){
    
	if($("#replyWrapId" + f_no).css("height") == "185px"){
		
		$("#replyWrapId" + f_no).css("height","auto");
		$("#moreReply" + f_no).val("접기");
	    
	}else {
		
		$("#replyWrapId" + f_no).css("height","185px");
		$("#moreReply" + f_no).val(more + "개의 댓글 더보기");
	}
}

//상대피드 이동용 자바스크립트
function targetFeedFunc(u_no){
	
	location.href='goTargetFeed.do?u_no=' + u_no;
	
}


//mask영역 클릭시 모달창 닫힘
function closeMaskFun(){
	
	$("#mask").css("display","none");
	$("#golike").css("display","none");
	
}

//찜하기 모달팝업 노출
function goLikeTargetFunc(){
	
	var maskHeight = $(document).height();  
	var maskWidth = $(window).width();
	
	$('#golike').css("display","block");
	$('#mask').css({'width':maskWidth,'height':maskHeight});
	$('#mask').css("background","#000");
	$('#mask').css("z-index","999");
	$('#mask').fadeTo(500,0.8);
	
}

//찜하기 창닫기 스크립트
function findCloseFnc(){
	
	var maskHeight = $(document).height();  
	var maskWidth = $(window).width();
	
	$('#golike').css("display","none");
	$('#golike').css("display","none");
	$('#mask').css({'width':maskWidth,'height':maskHeight});
	$('#mask').css("z-index","-1");
	$('#mask').fadeTo(800,0);

}

//찜취소이동 스크립트
function ullikeBtnFunc(t_no, u_no){
	
	location.href= 'unLikeTarget.do?t_no=' + t_no + "&u_no=" + u_no;
	
}