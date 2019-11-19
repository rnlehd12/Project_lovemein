<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>     
<!DOCTYPE html>
<!-- 회원가입 step4 by 귀정 -->
<html>
<head>
<meta charset="UTF-8">
<title>회원가입 - Step4</title>
<link rel="stylesheet" type="text/css" href="resources/css/common/common.css">
<link rel="stylesheet" type="text/css" href="resources/css/users/join.css">
<script type="text/javascript" src="resources/js/jquery-3.4.1.min.js"></script>
<script type="text/javascript" src="resources/js/users/join4.js"></script>
</head>
<body>
	<div class="joinWrap3">
		<p id="logop">LOVE ME IN</p>
		<div id="step">
			<div id="line"></div>
			<div class="radiusdiv">
				<div class="radius"></div>
				<p class="rcon">STEP.1</p>
				<p class="rconK">SMS인증</p>
			</div>
			<div class="radiusdiv">
				<div class="radius"></div>
				<p class="rcon">STEP.2</p>
				<p class="rconK">계정설정</p>
			</div>
			<div class="radiusdiv">
				<div class="radius"></div>
				<p class="rcon">STEP.3</p>
				<p class="rconK">기본정보</p>
			</div>
			<div class="radiusdiv">
				<div id="chkRadius" class="radius"></div>
				<p class="rcon">STEP.4</p>
				<p class="rconK">추가정보</p>
			</div>
			<div class="radiusdiv">
				<div class="radius"></div>
				<p class="rcon">STEP.5</p>
				<p class="rconK">이상형설정</p>
			</div>
		</div>
	</div>
	<form action="gojoinStep5.do" id="styleForm" method="post">
		<table id="styleTable">
			<tr>
				<td>
					<p class="styleTitle">나의 매력포인트 </p><p class="stylesubTitle">(최대 5개까지 설정가능)</p>
					<p class="subCo">나는 이런사람! 나의 매력포인트를 어필해주세요!</p>
					<div class="appealDiv">
						<div class="lines">
							<input id="appeal1" name="s_appeal" type="checkbox" class="chks" value="운동을좋아해요">
							<label for="appeal1" onclick="func(this);" class="label">운동을 좋아해요</label>
							<input id="appeal2" name="s_appeal" type="checkbox" class="chks" value="잘먹어요">
							<label for="appeal2" onclick="func(this);" class="label">잘먹어요</label>
							<input id="appeal3" name="s_appeal" type="checkbox" class="chks" value="목소리가좋아요">
							<label for="appeal3" onclick="func(this);" class="label">목소리가 좋아요</label>
							<input id="appeal4" name="s_appeal" type="checkbox" class="chks" value="착해요">
							<label for="appeal4" onclick="func(this);" class="label">착해요</label>
						</div>
						<div class="lines">
							<input id="appeal5" name="s_appeal" type="checkbox" class="chks" value="섹시해요">
							<label for="appeal5" onclick="func(this);" class="label">섹시해요</label>
							<input id="appeal6" name="s_appeal" type="checkbox" class="chks" value="솔직해요">
							<label for="appeal6" onclick="func(this);" class="label">솔직해요</label>
							<input id="appeal7" name="s_appeal" type="checkbox" class="chks" value="귀여워요">
							<label for="appeal7" onclick="func(this);" class="label">귀여워요</label>
							<input id="appeal8" name="s_appeal" type="checkbox" class="chks" value="피부가좋아요">
							<label for="appeal8" onclick="func(this);" class="label">피부가 좋아요</label>
						</div>
						<div class="lines">	
							<input id="appeal9" name="s_appeal" type="checkbox" class="chks" value="말을예쁘게해요">
							<label for="appeal9" onclick="func(this);" class="label">말을 예쁘게 해요</label>
							<input id="appeal10" name="s_appeal" type="checkbox" class="chks" value="털털해요">
							<label for="appeal10" onclick="func(this);" class="label">털털해요</label>
							<input id="appeal11" name="s_appeal" type="checkbox" class="chks" value="다정해요">
							<label for="appeal11" onclick="func(this);" class="label">다정해요</label>
							<input id="appeal12" name="s_appeal" type="checkbox" class="chks" value="허세가없어요">
							<label for="appeal12" onclick="func(this);" class="label">허세가 없어요</label>
						</div>
						<div class="lines">	
							
							<input id="appeal13" name="s_appeal" type="checkbox" class="chks" value="한사람만바라봐요">
							<label for="appeal13" onclick="func(this);" class="label">한사람만 바라봐요</label>
							<input id="appeal14" name="s_appeal" type="checkbox" class="chks" value="노래를잘해요">
							<label for="appeal14" onclick="func(this);" class="label">노래를 잘해요</label>
							<input id="appeal15" name="s_appeal" type="checkbox" class="chks" value="춤을잘춰요">
							<label for="appeal15" onclick="func(this);" class="label">춤을 잘춰요</label>
						</div>
						<div class="lines">	
							<input id="appeal16" name="s_appeal" type="checkbox" class="chks" value="표현잘해요">
							<label for="appeal16" onclick="func(this);" class="label">표현 잘해요</label>
							<input id="appeal17" name="s_appeal" type="checkbox" class="chks" value="애교가많아요">
							<label for="appeal17" onclick="func(this);" class="label">애교가 많아요</label>
							<input id="appeal18" name="s_appeal" type="checkbox" class="chks" value="배려심이많아요">
							<label for="appeal18" onclick="func(this);" class="label">배려심이 많아요</label>
						</div>
					</div>
				</td>
				<td rowspan="2"id="cenline">
					<div class="centerLine"></div>
				</td>
				<td>
					<p class="rstyleTitle">나의 관심사 </p><p class="stylesubTitle">(최대 3개까지 설정가능)</p>
					<p class="rsubCo">요즘 꽂힌 나의 관심사를 알려주세요!</p>
					<div class="interDiv">
						<div class="rlines">	
							<input id="inter1" name="s_inter" type="checkbox" class="chks" value="악기연주">
							<label for="inter1" onclick="func2(this);" class="label">악기연주</label>
							<input id="inter2" name="s_inter" type="checkbox" class="chks" value="IT">
							<label for="inter2" onclick="func2(this);" class="label">IT</label>
							<input id="inter3" name="s_inter" type="checkbox" class="chks" value="술">
							<label for="inter3" onclick="func2(this);" class="label">술</label>
							<input id="inter4" name="s_inter" type="checkbox" class="chks" value="봉사활동">
							<label for="inter4" onclick="func2(this);" class="label">봉사활동</label>
							<input id="inter5" name="s_inter" type="checkbox" class="chks" value="반려동물">
							<label for="inter5" onclick="func2(this);" class="label">반려동물</label>
							<input id="inter6" name="s_inter" type="checkbox" class="chks" value="게임">
							<label for="inter6" onclick="func2(this);" class="label">게임</label>
							<input id="inter7" name="s_inter" type="checkbox" class="chks" value="웹툰">
							<label for="inter7" onclick="func2(this);" class="label">웹툰</label>
						</div>
						<div class="rlines">
							<input id="inter8" name="s_inter" type="checkbox" class="chks" value="재테크">
							<label for="inter8" onclick="func2(this);" class="label">재테크</label>
							<input id="inter9" name="s_inter" type="checkbox" class="chks" value="등산">
							<label for="inter9" onclick="func2(this);" class="label">등산</label>
							<input id="inter11" name="s_inter" type="checkbox" class="chks" value="독서">
							<label for="inter11" onclick="func2(this);" class="label">독서</label>
							<input id="inter12" name="s_inter" type="checkbox" class="chks" value="글쓰기">
							<label for="inter12" onclick="func2(this);" class="label">글쓰기</label>
							<input id="inter13" name="s_inter" type="checkbox" class="chks" value="사진촬영">
							<label for="inter13" onclick="func2(this);" class="label">사진촬영</label>
							<input id="inter14" name="s_inter" type="checkbox" class="chks" value="스포츠/운동">
							<label for="inter14" onclick="func2(this);" class="label">스포츠/운동</label>
						</div>
						<div class="rlines">
							<input id="inter15" name="s_inter" type="checkbox" class="chks" value="인테리어">
							<label for="inter15" onclick="func2(this);" class="label">인테리어</label>
							<input id="inter16" name="s_inter" type="checkbox" class="chks" value="미드정주행">
							<label for="inter16" onclick="func2(this);" class="label">미드 정주행</label>
							<input id="inter17" name="s_inter" type="checkbox" class="chks" value="노래">
							<label for="inter17" onclick="func2(this);" class="label">노래</label>
							<input id="inter18" name="s_inter" type="checkbox" class="chks" value="자기계발">
							<label for="inter18" onclick="func2(this);" class="label">자기계발</label>
							<input id="inter19" name="s_inter" type="checkbox" class="chks" value="드라이브">
							<label for="inter19" onclick="func2(this);" class="label">드라이브</label>
							<input id="inter20" name="s_inter" type="checkbox" class="chks" value="춤">
							<label for="inter20" onclick="func2(this);" class="label">춤</label>
						</div>
						<div class="rlines">
							<input id="inter21" name="s_inter" type="checkbox" class="chks" value="요리">
							<label for="inter21" onclick="func2(this);" class="label">요리</label>
							<input id="inter22" name="s_inter" type="checkbox" class="chks" value="레저">
							<label for="inter22" onclick="func2(this);" class="label">레저</label>
							<input id="inter23" name="s_inter" type="checkbox" class="chks" value="쇼핑하기">
							<label for="inter23" onclick="func2(this);" class="label">쇼핑하기</label>
							<input id="inter24" name="s_inter" type="checkbox" class="chks" value="커피">
							<label for="inter24" onclick="func2(this);" class="label">커피</label>
							<input id="inter25" name="s_inter" type="checkbox" class="chks" value="정치">
							<label for="inter25" onclick="func2(this);" class="label">정치</label>
							<input id="inter26" name="s_inter" type="checkbox" class="chks" value="패션">
							<label for="inter26" onclick="func2(this);" class="label">패션</label>
							<input id="inter27" name="s_inter" type="checkbox" class="chks" value="애니">
							<label for="inter27" onclick="func2(this);" class="label">애니</label>
						</div>
						<div class="rlines">
							<input id="inter28" name="s_inter" type="checkbox" class="chks" value="미용">
							<label for="inter28" onclick="func2(this);" class="label">미용</label>
							<input id="inter29" name="s_inter" type="checkbox" class="chks" value="외국어/어학">
							<label for="inter29" onclick="func2(this);" class="label">외국어/어학</label>
							<input id="inter30" name="s_inter" type="checkbox" class="chks" value="여행">
							<label for="inter30" onclick="func2(this);" class="label">여행</label>
							<input id="inter31" name="s_inter" type="checkbox" class="chks" value="음악">
							<label for="inter31" onclick="func2(this);" class="label">음악</label>
							<input id="inter32" name="s_inter" type="checkbox" class="chks" value="맛집탐방">
							<label for="inter32" onclick="func2(this);" class="label">맛집탐방</label>
							<input id="inter33" name="s_inter" type="checkbox" class="chks" value="영화감상">
							<label for="inter33" onclick="func2(this);" class="label">영화감상</label>
						</div>
					</div>	
				</td>
			</tr>	
			<tr>
				<td>
					<p class="styleTitle">나의 라이프스타일 </p><p class="stylesubTitle">(최대 3개까지 설정가능)</p>
					<p class="subCo">나는 이렇게 생활해요!</p>
					<div class="lifeDiv">
						<div class="lines">
							<input id="life1" name="s_ls" type="checkbox" class="chks" value="비공개">
							<label for="life1" onclick="func3(this);" class="label">비공개</label>
							<input id="life2" name="s_ls" type="checkbox" class="chks" value="아침형인간">
							<label for="life2" onclick="func3(this);" class="label">아침형 인간</label>
							<input id="life3" name="s_ls" type="checkbox" class="chks" value="교대근무">
							<label for="life3" onclick="func3(this);" class="label">교대근무</label>
							<input id="life4" name="s_ls" type="checkbox" class="chks" value="반려동물과함께지내요">
							<label for="life4" onclick="func3(this);" class="label">반려동물과 함께 지내요</label>
						</div>
						<div class="lines">
							<input id="life5" name="s_ls" type="checkbox" class="chks" value="룸메이트와함께지내요">
							<label for="life5" onclick="func3(this);" class="label">룸메이트와 함께 지내요</label>
							<input id="life6" name="s_ls" type="checkbox" class="chks" value="새벽형인간/올빼미형">
							<label for="life6" onclick="func3(this);" class="label">새벽형 인간/올빼미형</label>
							<input id="life7" name="s_ls" type="checkbox" class="chks" value="야간근무">
							<label for="life7" onclick="func3(this);" class="label">야간근무</label>
						</div>
						<div class="lines">
							<input id="life8" name="s_ls" type="checkbox" class="chks" value="집에있는걸좋아해요">
							<label for="life8" onclick="func3(this);" class="label">집순이/집돌이에요</label>
							<input id="life9" name="s_ls" type="checkbox" class="chks" value="1인가구">
							<label for="life9" onclick="func3(this);" class="label">1인가구</label>
							<input id="life10" name="s_ls" type="checkbox" class="chks" value="규칙적인생활">
							<label for="life10" onclick="func3(this);" class="label">규칙적인 생활</label>
							<input id="life11" name="s_ls" type="checkbox" class="chks" value="평일근무">
							<label for="life11" onclick="func3(this);" class="label">평일근무</label>
						</div>
						<div class="lines">	
							<input id="life12" name="s_ls" type="checkbox" class="chks" value="주말에근무해요">
							<label for="life12" onclick="func3(this);" class="label">주말에 근무해요</label>
							<input id="life13" name="s_ls" type="checkbox" class="chks" value="돌싱이에요">
							<label for="life13" onclick="func3(this);" class="label">돌싱이에요</label>
							<input id="life14" name="s_ls" type="checkbox" class="chks" value="외출을좋아해요">
							<label for="life14" onclick="func3(this);" class="label">외출을 좋아해요</label>
						</div>
						<div class="lines">	
							<input id="life15" name="s_ls" type="checkbox" class="chks" value="자녀가있어요">
							<label for="life15" onclick="func3(this);" class="label">자녀가 있어요</label>
							<input id="life16" name="s_ls" type="checkbox" class="chks" value="기숙사/숙소에서지내요">
							<label for="life16" onclick="func3(this);" class="label">기숙사/숙소에서 지내요</label>
							<input id="life17" name="s_ls" type="checkbox" class="chks" value="불규칙적인생활">
							<label for="life17" onclick="func3(this);" class="label">불규칙적인 생활</label>
						</div>
					</div>	
				</td>
				<td>
					<p class="rstyleTitle" id="dateText">나의 데이트스타일 </p><p class="stylesubTitle">(최대 3개까지 설정가능)</p>
					<p class="rsubCo">나는 이런 데이트를 좋아해요!</p>
					<div class="DateDiv">
						<div class="rlines">	
							<input id="date1" name="s_ds" type="checkbox" class="chks" value="집데이트">
							<label for="date1" onclick="func4(this);" class="label">집 데이트</label>
							<input id="date2" name="s_ds" type="checkbox" class="chks" value="카페데이트">
							<label for="date2" onclick="func4(this);" class="label">카페 데이트</label>
							<input id="date3" name="s_ds" type="checkbox" class="chks" value="영화관람">
							<label for="date3" onclick="func4(this);" class="label">영화관람</label>
							<input id="date4" name="s_ds" type="checkbox" class="chks" value="맛집투어">
							<label for="date4" onclick="func4(this);" class="label">맛집투어</label>
						</div>
						<div class="rlines">
							<input id="date5" name="s_ds" type="checkbox" class="chks" value="짧더라도자주만나기">
							<label for="date5" onclick="func4(this);" class="label">짧더라도 자주 만나기</label>
							<input id="date6" name="s_ds" type="checkbox" class="chks" value="한번볼때진하게만나기">
							<label for="date6" onclick="func4(this);" class="label">한번 볼 때 진하게 만나기</label>
							<input id="date7" name="s_ds" type="checkbox" class="chks" value="통화하기">
							<label for="date7" onclick="func4(this);" class="label">통화하기</label>
						</div>
						<div class="rlines">
							<input id="date8" name="s_ds" type="checkbox" class="chks" value="친구같은편한만남">
							<label for="date8" onclick="func4(this);" class="label">친구같은 편한 만남</label>
							<input id="date9" name="s_ds" type="checkbox" class="chks" value="전시회관람">
							<label for="date9" onclick="func4(this);" class="label">전시회 관람</label>
							<input id="date10" name="s_ds" type="checkbox" class="chks" value="노래방데이트">
							<label for="date10" onclick="func4(this);" class="label">노래방 데이트</label>
						</div>	
						<div class="rlines">
							<input id="date11" name="s_ds" type="checkbox" class="chks" value="즉흥적인만남">
							<label for="date11" onclick="func4(this);" class="label">즉흥적인 만남</label>
							<input id="date12" name="s_ds" type="checkbox" class="chks" value="산책하기">
							<label for="date12" onclick="func4(this);" class="label">산책하기</label>
							<input id="date13" name="s_ds" type="checkbox" class="chks" value="함께공연관람">
							<label for="date13" onclick="func4(this);" class="label">함께 공연관람</label>
							<input id="date14" name="s_ds" type="checkbox" class="chks" value="매일 연락하기">
							<label for="date14" onclick="func4(this);" class="label">매일 연락하기</label>
						</div>
						<div class="rlines">	
							<input id="date15" name="s_ds" type="checkbox" class="chks" value="술마시기">
							<label for="date15" onclick="func4(this);" class="label">술 마시기</label>
							<input id="date16" name="s_ds" type="checkbox" class="chks" value="함께게임하기">
							<label for="date16" onclick="func4(this);" class="label">함께 게임하기</label>
							<input id="date17" name="s_ds" type="checkbox" class="chks" value="함께스포츠관람">
							<label for="date17" onclick="func4(this);" class="label">함께 스포츠관람</label>
							<input id="date18" name="s_ds" type="checkbox" class="chks" value="함께여행가기">
							<label for="date18" onclick="func4(this);" class="label">함께 여행가기</label>
						</div>
					</div>
				</td>	
			</tr>
		</table>
		<table id="submitTable">
			<tr>
				<td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td>
				<td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td>
				<td><input type="submit" value="다음단계"></td>
				<td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td>
				<td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td>
			</tr>
		</table>	
	</form>
	<c:import url="../common/footer.jsp"/>
</body>
</html>