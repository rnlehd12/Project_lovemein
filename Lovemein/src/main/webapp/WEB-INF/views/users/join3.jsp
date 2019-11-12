<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>     
<!DOCTYPE html>
<!-- 회원가입 step3 by 귀정 -->
<html>
<head>
<meta charset="UTF-8">
<title>회원가입 - Step3</title>
<link rel="stylesheet" type="text/css" href="resources/css/common/common.css">
<link rel="stylesheet" type="text/css" href="resources/css/users/join.css">
<script type="text/javascript" src="resources/js/jquery-3.4.1.min.js"></script>
<script type="text/javascript" src="resources/js/users/join3.js"></script>
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
				<div id="chkRadius" class="radius"></div>
				<p class="rcon">STEP.3</p>
				<p class="rconK">기본정보</p>
			</div>
			<div class="radiusdiv">
				<div class="radius"></div>
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
	<form action="gojoinStep4.do" id="priForm" method="post">
		<table id="styleTable">
			<tr>
				<td>
					<div class="leftWrap">
						<p class="titles">기본정보 입력</p>
						<p class="priStyleTitle">생년월일</p>
						<select id="years" name="years" class="birth">
							<option value="1980">1980</option><option value="1981">1981</option><option value="1982">1982</option>
							<option value="1983">1983</option><option value="1984">1984</option><option value="1985">1985</option>
							<option value="1986">1986</option><option value="1987">1987</option><option value="1988">1988</option>
							<option value="1989">1989</option><option value="1990">1990</option><option value="1991">1991</option>
							<option value="1992">1992</option><option value="1993">1993</option><option value="1994" selected>1994</option>
							<option value="1995">1995</option><option value="1996">1996</option><option value="1997">1997</option>
							<option value="1998">1998</option><option value="1999">1999</option><option value="2000">2000</option>
						</select>
						<select id="months" name="months" class="birth">
							<option value="1">1</option><option value="2">2</option><option value="3">3</option><option value="4">4</option>
							<option value="5">5</option><option value="6">6</option><option value="7">7</option><option value="8">8</option>
							<option value="9">9</option><option value="10">10</option><option value="11">11</option><option value="12" selected>12</option>
						</select>
						<select id="days" name="days" class="birth">
							<option value="1">1</option><option value="2">2</option><option value="3">3</option><option value="4">4</option>
							<option value="5">5</option><option value="6">6</option><option value="7">7</option><option value="8">8</option>
							<option value="9">9</option><option value="10">10</option><option value="11">11</option><option value="12">12</option>
							<option value="13">13</option><option value="14">14</option><option value="15">15</option><option value="16">16</option>
							<option value="17" selected>17</option><option value="18">18</option><option value="19">19</option><option value="20">20</option>
							<option value="21">21</option><option value="22">22</option><option value="23">23</option><option value="24">24</option>
							<option value="25">25</option><option value="26">26</option><option value="27">27</option><option value="28">28</option>
							<option value="29">29</option><option value="30">30</option><option value="31">31</option>
						</select>
						<!-- 생년월일 radio button 시작 -->
						<div class="genderDiv">
							<div class="lines">
								<input id="male" name="u_gender" type="radio" class="ckgen" value="M" checked >
								<label for="male" onclick="maleChk(this);" class="genlabel" id="maleid">남성</label>
								
								<input id="female" name="u_gender" type="radio" class="ckgen" value="F">
								<label for="female" onclick="femaleChk(this);" class="genlabel" id="femailid">여성</label>
							</div>
						</div>
						<!-- 거주지역 -->
						<p class="priStyleTitle1" id="titles1">거주지역</p>
						<select id="u_loc" name="u_loc">
							<option value="서울특별시">서울특별시</option>
							<option value="경기도">경기도</option>
							<option value="인천광역시">인천광역시</option>
							<option value="대전광역시">대전광역시</option>
							<option value="대전광역시">울산광역시</option>
							<option value="대구광역시">대구광역시</option>
							<option value="대구광역시">부산광역시</option>
							<option value="강원도">강원도</option>
							<option value="충청북도">충청북도</option>
							<option value="충청남도">충청남도</option>
							<option value="전라북도">전라북도</option>
							<option value="전라남도">전라남도</option>
							<option value="경상북도">경상북도</option>
							<option value="경상남도">경상남도</option>
							<option value="제주도">제주도</option>
							<option value="기타">기타</option>
						</select>
						<!-- 학력 -->
						<br>
						<p class="priStyleTitle1">학력</p>
						<select id="u_edu" name="u_edu">
							<option value="고등학교졸업미만">고등학교 졸업 미만</option>
							<option value="고등학교졸업">고등학교 졸업</option>
							<option value="전문대학졸업">전문대학 졸업</option>
							<option value="4년제대학졸업" selected>4년제대학 졸업</option>
							<option value="석사이상">석사 이상</option>
						</select><br>
						<!-- 출신학교 -->
						<p class="priStyleTitle1">출신학교</p>
						<input type="text" name="u_shcool" id="u_shcool">
						<!-- 직업 -->
						<p class="priStyleTitle1">직업</p>
						<input type="text" name="u_job" id="u_job">
						<!-- 키 -->
						<p class="priStyleTitle1">키</p>
						<input type="number" name="u_height" id="u_height" value="160" min="140">
						<!-- 체형 -->
						<p class="priStyleTitle1">체형 </p>
						<div class="weightDiv">
							<div class="wlines">
								<input id="weight1" name="u_weight" type="radio" class="chks" value="슬림">
								<label for="weight1" onclick="weightChk1(this);" class="wlabel">슬림</label>
								<input id="weight2" name="u_weight" type="radio" class="chks" value="근육질">
								<label for="weight2" onclick="weightChk2(this);" class="wlabel">근육질</label>
								<input id="weight3" name="u_weight" type="radio" class="chks" value="보통" checked>
								<label for="weight3" onclick="weightChk3(this);" class="wlabel" id="wcheck">보통</label>
								<input id="weight4" name="u_weight" type="radio" class="chks" value="글래머">
								<label for="weight4" onclick="weightChk4(this);" class="wlabel">글래머</label>
								<input id="weight5" name="u_weight" type="radio" class="chks" value="통통">
								<label for="weight5" onclick="weightChk5(this);" class="wlabel">통통</label>
							</div>
						</div>
					</div>	
				</td>
				<td id="cenline">
					<div class="centerLine"></div>
				</td>
				<td>
					<div class="rightWrap">
						<p class="titles">추가정보 입력</p>
						<!-- 혈액형 -->
						<p class="priStyleTitle">혈액형 </p>
						<div class="weightDiv">
							<div class="wlines">
								<input id="b1" name="u_blood" type="radio" class="chks" value="A">
								<label for="b1" onclick="bChk1(this);" class="blabel">A형</label>
								<input id="b2" name="u_blood" type="radio" class="chks" value="B">
								<label for="b2" onclick="bChk2(this);" class="blabel">B형</label>
								<input id="b3" name="u_blood" type="radio" class="chks" value="O" checked>
								<label for="b3" onclick="bChk3(this);" class="blabel" id="bcheck">O형</label>
								<input id="b4" name="u_blood" type="radio" class="chks" value="AB">
								<label for="b4" onclick="bChk4(this);" class="blabel">AB형</label>
							</div>
						</div>	
						<!-- 성격 -->
						<p class="priStyleTitle2">성격 </p><p class="charsub">(최대 5개까지 선택가능합니다.)</p>
						<div class="charDiv">
							<div class="wlines">
								<input id="char1" name="u_char" type="checkbox" class="chks" value="조용한">
								<label for="char1" onclick="func(this);" class="label">조용한</label>
								<input id="char2" name="u_char" type="checkbox" class="chks" value="엉뚱한">
								<label for="char2" onclick="func(this);" class="label">엉뚱한</label>
								<input id="char3" name="u_char" type="checkbox" class="chks" value="수줍은">
								<label for="char3" onclick="func(this);" class="label">수줍은</label>
								<input id="char4" name="u_char" type="checkbox" class="chks" value="웃긴">
								<label for="char4" onclick="func(this);" class="label">웃긴</label>
								<input id="char5" name="u_char" type="checkbox" class="chks" value="성실한">
								<label for="char5" onclick="func(this);" class="label">성실한</label>
								<input id="char6" name="u_char" type="checkbox" class="chks" value="단순한">
								<label for="char6" onclick="func(this);" class="label">단순한</label>
							</div>
							<div class="lines">
								<input id="char7" name="u_char" type="checkbox" class="chks" value="주도적">
								<label for="char7" onclick="func(this);" class="label">주도적</label>
								<input id="char8" name="u_char" type="checkbox" class="chks" value="도발적">
								<label for="char8" onclick="func(this);" class="label">도발적</label>
								<input id="char9" name="u_char" type="checkbox" class="chks" value="활발한">
								<label for="char9" onclick="func(this);" class="label">활발한</label>
								<input id="char10" name="u_char" type="checkbox" class="chks" value="친절한">
								<label for="char10" onclick="func(this);" class="label">친절한</label>
								<input id="char11" name="u_char" type="checkbox" class="chks" value="털털한">
								<label for="char11" onclick="func(this);" class="label">털털한</label>
								<input id="char12" name="u_char" type="checkbox" class="chks" value="낙천적">
								<label for="char12" onclick="func(this);" class="label">낙천적</label>
							</div>
							<div class="lines">
								<input id="char13" name="u_char" type="checkbox" class="chks" value="정직한">
								<label for="char13" onclick="func(this);" class="label">정직한</label>
								<input id="char14" name="u_char" type="checkbox" class="chks" value="도도한">
								<label for="char14" onclick="func(this);" class="label">도도한</label>
								<input id="char15" name="u_char" type="checkbox" class="chks" value="애교">
								<label for="char15" onclick="func(this);" class="label">애교</label>
								<input id="char16" name="u_char" type="checkbox" class="chks" value="감성적">
								<label for="char16" onclick="func(this);" class="label">감성적</label>
								<input id="char17" name="u_char" type="checkbox" class="chks" value="긍정적">
								<label for="char17" onclick="func(this);" class="label">긍정적</label>
								<input id="char18" name="u_char" type="checkbox" class="chks" value="쿨한">
								<label for="char18" onclick="func(this);" class="label">쿨한</label>
							</div>
						</div>
						<!-- 종교 -->	
						<p class="priStyleTitle3">종교 </p>
						<div class="reiDiv">
							<div class="wlines">
								<input id="r1" name="u_rei" type="radio" class="chks" value="무교">
								<label for="r1" onclick="rChk1(this);" class="rlabel">무교</label>
								<input id="r2" name="u_rei" type="radio" class="chks" value="기독교">
								<label for="r2" onclick="rChk2(this);" class="rlabel">기독교</label>
								<input id="r3" name="u_rei" type="radio" class="chks" value="불교" checked>
								<label for="r3" onclick="rChk3(this);" class="rlabel" id="bcheck">불교</label>
								<input id="r4" name="u_rei" type="radio" class="chks" value="천주교">
								<label for="r4" onclick="rChk4(this);" class="rlabel">천주교</label>
								<input id="r5" name="u_rei" type="radio" class="chks" value="유대교">
								<label for="r5" onclick="rChk5(this);" class="rlabel">유대교</label>
								<input id="r6" name="u_rei" type="radio" class="chks" value="힌두교">
								<label for="r6" onclick="rChk6(this);" class="rlabel">힌두교</label>
							</div>
						</div>
						<!-- 음주 -->
						<p class="priStyleTitle4">음주 </p>
						<input type="range" name="u_drinking">
						<!-- 흡연 -->
						<p class="priStyleTitle4">흡연 </p>
						<input type="range" name="u_smoking">
					</div>		
				</td>
			</tr>
		</table>
		<table id="submitTable">
			<tr>
				<td>&nbsp;</td>
				<td>&nbsp;</td>
				<td>&nbsp;</td>
				<td>&nbsp;</td>
				<td>&nbsp;</td>
				<td>&nbsp;</td>
				<td>&nbsp;</td>
				<td><input type="submit" value="다음단계"></td>
				<td>&nbsp;</td>
				<td>&nbsp;</td>
				<td>&nbsp;</td>
				<td>&nbsp;</td>
				<td>&nbsp;</td>
				<td>&nbsp;</td>
				<td>&nbsp;</td>
			</tr>
		</table>	
	</form>
	<c:import url="../common/footer.jsp"/>
</body>
</html>