/**
 * myFeed(마이피드) 자바스크립트 by 귀정
 */

//document ready
$(function(){
	//내가 찜한 사람 수 구하기
	var u_no_send = $("#u_no_send").val();
	$.ajax({
         url : "sendCount.do",
         data : {u_no_send:u_no_send},
         type : "post",
         success : function(data){
        	if(data.likecount != 0){	
        		
	             $("#accountLikeCountArea").html
	             ("<img src='resources/images/common/heartIcon2.png'>" +
	             	"내가 찜한 사람 <span>"+ data.likecount + "</span> 명" + 
	             	"<div id='heartSettingArea'><a href='moveLikesList.do' id='heartSetting'>관리</a></div>");
        	}else{
        		
        		$("#accountLikeList").html("<div class='noLikesMent'>내가 찜하고 있는 사람이 없습니다." + 
        				"<button id='goStoryFeedBtn' onclick='goAllfeedFunc();'>스토리피드로 이동하기</button></div>");
        	}
        	
        },
         error : function(request, status, errorData){
            console.log("error code : " + request.status 
                  + "\nMessage : " + request.responseText
                  + "\nError : " + errorData);
         }
      });
	
	//내가 찜한 사람 목록 구하기
	$.ajax({
		
         url : "sendLikeList.do",
         data : {u_no_send:u_no_send},
         type : "post",
         success : function(obj){
        	
				var objStr = JSON.stringify(obj);
				var jsonObj = JSON.parse(objStr);
				
				var outValues = $("#accountLikeList").html();
				
				var outLists = $("#modalLikeList").html();
				
				if(jsonObj.list.length < 9){
					//출력할 문자열 만들기
					for(var i in jsonObj.list){	
						outValues += 
							"<div id='personWrap'>" +
							"<div id='likeProfileImg'>" +
							"<img src='resources/images/profile/" +
							decodeURIComponent(jsonObj.list[i].u_rec_profile).replace(/\+/gi, " ") + "'>" +
							"</div>" +
							"<div id='likePersonNameArea'>" +
							decodeURIComponent(jsonObj.list[i].u_rec_name).replace(/\+/gi, " ") + 
							"</div><div id='btnArea'><input type='button' id='yourFeedBtn' onclick='targetFeedFunc(" + jsonObj.list[i].u_no_rec +");' value='이동'></div>"
							+ "</div>";
							
					}
				}else{
					
					//출력할 문자열 만들기
					for(var i = 0; i<8; i++){
						outValues += 
							"<div id='personWrap'>" +
							"<div id='likeProfileImg'>" +
							"<img src='resources/images/profile/" +
							decodeURIComponent(jsonObj.list[i].u_rec_profile).replace(/\+/gi, " ") + "'>" +
							"</div>" +
							"<div id='likePersonNameArea'>" +
							decodeURIComponent(jsonObj.list[i].u_rec_name).replace(/\+/gi, " ") + 
							"</div><div id='btnArea'><input type='button' id='yourFeedBtn' onclick='targetFeedFunc(" + jsonObj.list[i].u_no_rec +");' value='이동'></div>"
							+ "</div>";
							
					}
					
					var moreCount = jsonObj.list.length - 8;
					outValues += "<button id='moreLikeUsers' onclick='moreLikeDiv();'>" + moreCount +"명 더보기</button>";
					 
				}
				
				$("#accountLikeList").html(outValues);
					
					if(jsonObj.list.length > 8){
						
						outLists +="<p id='likeModalTitles'>내가 찜한 사람</p>"
						for(var i in jsonObj.list){	
							outLists += 
								"<div id='personWrap'>" +
								"<div id='likeProfileImg'>" +
								"<img src='resources/images/profile/" +
								decodeURIComponent(jsonObj.list[i].u_rec_profile).replace(/\+/gi, " ") + "'>" +
								"</div>" +
								"<div id='likePersonNameArea'>" +
								decodeURIComponent(jsonObj.list[i].u_rec_name).replace(/\+/gi, " ") + 
								"</div><div id='btnArea'><input type='button' id='yourFeedBtn' onclick='targetFeedFunc(" + jsonObj.list[i].u_no_rec +");' value='이동'></div>"
								+ "</div>";
								
						}
				}
        	 
				$("#modalLikeList").html(outLists);
            
         },
         error : function(request, status, errorData){
            console.log("error code : " + request.status 
                  + "\nMessage : " + request.responseText
                  + "\nError : " + errorData);
         }
      });
	
});//document ready 끝

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

//글쓰기 모달띄우는 스크립트
function writeFeedFunc(){
	
	var maskHeight = $(document).height();  
	var maskWidth = $(window).width();
	
	$('#feedWriteForm').css("display","block");
	$('#mask').css({'width':maskWidth,'height':maskHeight});
	$('#mask').css("background","#000");
	$('#mask').css("z-index","999");
	$('#mask').fadeTo(500,0.8);
	
}

//글쓰기 창닫기 스크립트
function findCloseFnc(){
	
	var maskHeight = $(document).height();  
	var maskWidth = $(window).width();
	
	$('#feedWriteForm').css("display","none");
	$('#feedModiForm').css("display","none");
	$('.goReport').css("display","none");
	$('#mask').css({'width':maskWidth,'height':maskHeight});
	$('#mask').css("z-index","-1");
	$('#mask').fadeTo(800,0);

}

//피드 메뉴 열기용 스크립트
function gofeedMenu(f_no){
	
	if($("#feedCategory" + f_no).css("display") == "none"){
		
	    $("#feedCategory" + f_no).show();
	    
	} else {
		
	    $("#feedCategory" + f_no).hide();
	}
}

//좋아요 삭제하기
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

//피드글 수정 자바스크립트
function feedModiFunc(f_no){
	
	var maskHeight = $(document).height();  
	var maskWidth = $(window).width();
	
	$('#feedModiForm'+ f_no).css("display","block");
	$('#mask').css({'width':maskWidth,'height':maskHeight});
	$('#mask').css("background","#000");
	$('#mask').css("z-index","999");
	$('#mask').fadeTo(500,0.8);
	
}

//피드 글 수정 창 닫기 자바스크립트
function findCloseModiFnc(f_no){
	
	
	var maskHeight = $(document).height();  
	var maskWidth = $(window).width();
	
	$('#feedModiForm'+ f_no).css("display","none");
	$('#mask').css({'width':maskWidth,'height':maskHeight});
	$('#mask').css("z-index","-1");
	$('#mask').fadeTo(800,0);
}

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

//mask를 누르면 글쓰기 div창 닫힘
function closeMaskFun(){
	
	$("#mask").css("display","none");
	$("#feedWriteForm").css("display","none");
	$(".feedModiForm").css("display","none");
	$(".feedCategory").css("display","none");
	$(".goReport").css("display","none");
	$('#modalLikeList').css("display","none");
}

//전체피드 이동용 스크립트
function goAllfeedFunc(){
	
	location.href = 'allFeed.do';
}


//해시태그 검색 페이지로 이동하는 스크립트
function goTagSearchFunc(search){
	
	// '#'기호 제거함.
	while(search.charAt(0) === '#'){
	    
		search= search.substr(1);
	}
	
	location.href = "search.do?search=" + search;
}

//피드이미지 api 시작
$(document).ready(function () {
	
	$('.myfeedSlideDiv').slick({
			
		autoplay : true,
		dots: true,
		speed : 300 /* 이미지가 슬라이딩시 걸리는 시간 */,
		infinite: true,
		autoplaySpeed: 3000 /* 이미지가 다른 이미지로 넘어 갈때의 텀 */,
		arrows: false,
		slidesToShow: 1,
		slidesToScroll: 1,
		fade: false
	});
});

//프로필이미지 변경용 팝업창 여는 스크립트
function profileImgModiFunc(){
	
	window.open("modiProfile.do", "_blank", "toolbar=yes, scrollbars=yes,resizable=yes,top=300,left=650,width=400,height=400");
}

//신고하기 모달팝업 노출용 스크립트
function replyReportFunc(fr_no){
	
	var maskHeight = $(document).height();  
	var maskWidth = $(window).width();
	
	$("#goReport"+fr_no).css("display","block");
	$('#mask').css({'width':maskWidth,'height':maskHeight});
	$('#mask').css("background","#000");
	$('#mask').css("z-index","999");
	$('#mask').fadeTo(500,0.8);
}

//신고하기 ajax
function goReportConFunc(fr_no){
	
	var r_send_uno = $("#loginUno").val();
	var r_rec_uno = $("#targetUno"+fr_no).val();
	var r_text = $("#r_text"+fr_no).val();
	
	$.ajax({
		
		 url : "goReportCon.do",
        data : {r_send_uno : r_send_uno, r_rec_uno: r_rec_uno, r_text: r_text },
        type : "post",
        success : function(){
       	
       	 alert('정상적으로 신고가 접수되었습니다.');
       	 location.reload();
       	 
        },
        error : function(request, status, errorData){
           console.log("error code : " + request.status 
                 + "\nMessage : " + request.responseText
                 + "\nError : " + errorData);
        }        
	});	
	
}

//전체 찜한 회원 목록 보이는 모달창.
function moreLikeDiv(){
	
	var maskHeight = $(document).height();  
	var maskWidth = $(window).width();
	
	$('#modalLikeList').css("display","block");
	$('#mask').css({'width':maskWidth,'height':maskHeight});
	$('#mask').css("background","#000");
	$('#mask').css("z-index","999");
	$('#mask').fadeTo(500,0.8);
	
}