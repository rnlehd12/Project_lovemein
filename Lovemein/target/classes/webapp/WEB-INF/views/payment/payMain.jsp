<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>결제메인페이지</title>
<link  rel= "stylesheet" type="text/css" href="resources/css/payment/payMain.css">
<script src="https://cdn.bootpay.co.kr/js/bootpay-3.0.7.min.js" type="application/javascript"></script>

<script type="text/javascript" src="resources/js/jquery-3.4.1.min.js"></script>
<script type="text/javascript">

function payTest(price){

	var u_no = $('#u_no').val();
	var u_name = $('#u_name').val();
	var u_email = $('#u_mail').val();
	var u_phone = $('#u_phone').val();


	var p_price; var p_coin;
	
	if(price == 1){
		p_price = 5000;
		p_coin = 4;
		
	}else if(price == 2){
		p_price = 10000;
		p_coin = 10;
		
	}else if(price == 3){
		p_price = 30000;
		p_coin = 32;
	}else if(price == 4){
		p_price = 50000;
		p_coin = 62;
	}else if(price == 5){
		p_price = 100000;
		p_coin = 135;

	}

	BootPay.request({
	
			price :  p_price, //실제 결제되는 가격
			application_id : "5d943b724f74b40028a53cef",
			name : '푸딩'+p_coin+'개', //결제창에서 보여질 이름		
			pg : '',
			method : '', 
		
			show_agree_window : 0, // 부트페이 정보 동의 창 보이기 여부

			user_info : {
				username : u_name,
				email : u_email,
				phone : u_phone
				},

			order_id : u_no, //고유 주문번호로, 생성하신 값을 보내주셔야 합니다.
			params: {callback1: '그대로 콜백받을 변수 1', callback2: '그대로 콜백받을 변수 2', customvar1234: '변수명도 마음대로'},
			account_expire_at: '2019-11-10', // 가상계좌 입금기간 제한 ( yyyy-mm-dd 포멧으로 입력해주세요. 가상계좌만 적용됩니다. )
			extra: {
			    start_at: '2019-05-10', // 정기 결제 시작일 - 시작일을 지정하지 않으면 그 날 당일로부터 결제가 가능한 Billing key 지급
				end_at: '2022-05-10', // 정기결제 만료일 -  기간 없음 - 무제한
		        vbank_result: 1, // 가상계좌 사용시 사용, 가상계좌 결과창을 볼지(1), 말지(0), 미설정시 봄(1)
		        quota: 0 // 결제금액이 5만원 이상시 할부개월 허용범위를 설정할 수 있음, [0(일시불), 2개월, 3개월] 허용, 미설정시 12개월까지 허용
			}
		}).error(function (data) {
			//결제 진행시 에러가 발생하면 수행됩니다.
			console.log(data);
		}).cancel(function (data) {
			//결제가 취소되면 수행됩니다.
			console.log(data);
		}).ready(function (data) {
			//가상계좌
			console.log(data);
		}).confirm(function (data) {
			//결제가 실행되기 전에 수행되며, 주로 재고를 확인하는 로직이 들어갑니다.
			//주의 - 카드 수기결제일 경우 이 부분이 실행되지 않습니다.
			console.log(data);
			var enable = true; // 재고 수량 관리 로직 혹은 다른 처리
			if (enable) {
				BootPay.transactionConfirm(data); // 조건이 맞으면 승인 처리를 한다.
			} else {
				BootPay.removePaymentWindow(); // 조건이 맞지 않으면 결제 창을 닫고 결제를 승인하지 않는다.
			}
		}).close(function (data) {
		    // 결제창이 닫힐때 수행됩니다. (성공,실패,취소에 상관없이 모두 수행됨)
		    console.log(data);
		}).done(function (data) {
			//결제가 정상적으로 완료되면 수행됩니다
			//비즈니스 로직을 수행하기 전에 결제 유효성 검증을 하시길 추천합니다.
			console.log(data);
			
			/*ajax : db로 넘겨주고 성공페이지 보여주는 ajax*/
		 	$.ajax({
				url : "paySuccess.do",
				data : { u_no: u_no,
						 p_price: p_price,
						 p_coin: p_coin},
				type : "post",
				success: function(){
					location.href = "payOk.do"
				}

		 	});
	
			/*ajax*/
			
		
		}); //bootpay

	}//payTest()
	
	
</script>

</head>
<body>
<c:import url="../common/header.jsp"/>
<div class="main">
<input type="hidden" id="u_no" name="" value="${ loginMember.u_no }">
<input type="hidden" id="u_name" name="" value="${ loginMember.u_name }">
<input type="hidden" id="u_email" name="" value="${ loginMember.u_email }">
<input type="hidden" id="u_phone" name="" value="${ loginMember.u_phone }">


<!-- 타이틀 -->
<div class="title_div">
<h2 class="listfont">푸딩충전소</h2>
<img class="title_pudding" src="resources/images/payment/pudding.png">
</div>
<!-- //타이틀 -->

<!-- 결제부분 -->
<div class="paymain">

	<div class="paylistbox">
		<!-- 결제페이지 버튼, 선 -->
		<div class="paylistbox">
			<a class="paylist" href="payList.do?u_no=${ loginMember.u_no }">결제내역보기</a><br>
			<div class="line"></div>
		</div>
		<!-- 잔여푸딩 -->
		<div class="coinbox">
			<p class="havecoins">잔여푸딩 : ${ loginMember.u_coin }</p>
			<img class="havecoin" src="resources/images/payment/pudding.png">
		</div>
	</div>

</div>
<!-- 결제리스트 -->
<div class="listbox">
	<!-- 1box -->
	<div class="box1">
		<div class="li1">
			<div class="nbox">
				<img class="img1"src="resources/images/payment/pudding.png">
				<p class="p1">4</p>
			</div>
		</div>
		<div class="li2">
			<div class="charge_box">
				<p class="p3" id="p_price">5,000</p>
				<button class="chargebt" onclick="payTest('1')">충전하기</button>
			</div>
		</div>
	</div>

	<!-- //1box -->
	
	<!-- 2box -->
	<div class="box1">
		<div class="li1">
			<div class="nbox">
				<img class="img1"src="resources/images/payment/pudding.png">
				<p class="p1">8</p>
				<p class="p2">+2</p>
			</div>
		</div>
		<div class="li2">
			<div class="charge_box">
				<p class="p3">10,000</p>		
				<button class="chargebt" onclick="payTest('2')">충전하기</button>
			</div>
		</div>
	</div>
	<!-- //2box -->

	<!-- 3box -->
	<div class="hit" ><img class="hitimg"src="resources/images/payment/heart.png"></div>
	<div class="box1">
		<div class="li1">
			<div class="nbox">
				<img class="img1"src="resources/images/payment/pudding.png">
				<p class="p1">24</p>
				<p class="p2">+8</p>
			</div>
		</div>
		<div class="li2">
			<div class="charge_box">
				<p class="p3">30,000</p>
				<button class="chargebt" onclick="payTest('3')">충전하기</button>
			</div>
		</div>
	</div>
	<!-- //3box -->
	
	<!-- 4box -->
	<div class="box1">
		<div class="li1">
			<div class="nbox">
				<img class="img1"src="resources/images/payment/pudding.png">
				<p class="p1">50</p>
				<p class="p2">+12</p>
			</div>
		</div>
		<div class="li2">
			<div class="charge_box">
				<p class="p3">50,000</p>
				<button class="chargebt" onclick="payTest('4')">충전하기</button>
			</div>
		</div>
	</div>
	<!-- //4box -->
	
	<!-- 5box -->
	<div class="hit" ><img class="hitimg"src="resources/images/payment/heart.png"></div>
	<div class="box1">
		<div class="li1">
			<div class="nbox">
				<img class="img1"src="resources/images/payment/pudding.png">
				<p class="p1">100</p>
				<p class="p2">+35</p>
			</div>
		</div>
		<div class="li2">
			<div class="charge_box">
				<p class="p3">100,000</p>
				<button class="chargebt" onclick="payTest('5')">충전하기</button>
			</div>
		</div>
	</div>
	<!-- //5box -->
</div><!-- //결제리스트 -->

</div><!-- main -->

</body>
</html>