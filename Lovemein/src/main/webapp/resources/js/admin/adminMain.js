/**
 * adminMain(관리자메인) 자바스크립트 : 최선혜
 */

//document ready
$(function(){
	
	/*회원관리*/
	$(".user_div").mouseover(function(){
		$(".userimg").attr("src","resources/images/admin/user_hover.png");
		$(".puser").css("color","#116554");
		
	});
	
	
	$(".user_div").mouseleave(function(){
		$(".userimg").attr("src","resources/images/admin/user.png");
		$(".puser").css("color","#2c3e50");
	});
	
	/*공지관리*/
	$(".notice_div").mouseover(function(){
		$(".noticeimg").attr("src","resources/images/admin/notice_hover.png");
		$(".pnotice").css("color","#f1c40f");

	});
	
	$(".notice_div").mouseleave(function(){
		$(".noticeimg").attr("src","resources/images/admin/notice.png");
		$(".pnotice").css("color","#2c3e50");
	});

	/*미션관리*/
	$(".mission_div").mouseover(function(){
		$(".missionimg").attr("src","resources/images/admin/mission_hover.png");
		$(".pmission").css("color","#7c3d96");

	});
	
	$(".mission_div").mouseleave(function(){
		$(".missionimg").attr("src","resources/images/admin/mission.png");
		$(".pmission").css("color","#2c3e50");
	});

	/*신고관리*/
	$(".report_div").mouseover(function(){
		$(".reportimg").attr("src","resources/images/admin/report_hover.png");
		$(".preport").css("color","#c0392b");

	});
	
	$(".report_div").mouseleave(function(){
		$(".reportimg").attr("src","resources/images/admin/report.png");
		$(".preport").css("color","#2c3e50");
	});
	
	/*페이지 이동*/
	/*클릭하면 회원관리페이지로 이동*/
	$(".user_div").click(function(){
		location.href = "adminMemberList.do"
	});
	
	/*클릭하면 공지관리페이지로 이동*/
	$(".notice_div").click(function(){
		location.href = "adminNoticeMain.do"
	});
	/*클릭하면 신고관리페이지로 이동*/
	$(".report_div").click(function(){
		location.href = "adminReportList.do"
	});
});//document.ready
