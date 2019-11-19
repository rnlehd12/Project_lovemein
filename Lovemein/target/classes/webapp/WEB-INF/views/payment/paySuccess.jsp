<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>럽미인: 결제성공페이지</title>
<style type="text/css">
/*메인 전체 div 50% 설정해서 중간에 놓음*/
.main{width:50%; margin: 0 auto;}

/*중간 글귀,이미지*/
.wrap{text-align:center; margin-top: 230px;}
.h1{color:#404040; margin: 0px 0px 15px 0px;}
.heart{margin: 0px; color:#c0392b; display: inline-block;}
.h2_1{color:#8244ad; margin: 0px;font-weight: bold;font-size: 25px;text-align:center; }
.h2_2{color:#8244ad; margin: 0px 0px 50px 130px;font-weight: bold; font-size: 25px;text-align:center; }
.img{width:25%;vertical-align: bottom;}
.pdiv{display:inline-block;}
.imgdiv{margin-bottom:50px;}
/*메인으로가는 버튼*/
.movehome{text-decoration: none; color: white; font-weight: bold;background: #e64c75;
 		   padding: 10px 15px;border-radius: 6px;}
</style>

</script>
</head>
<body>
<div class="main">
<div class="wrap">

<div class="imgdiv">
	
	<div class="pdiv">
		<h1 class="h1">충전이 성공적으로 끝났습니다!<p class="heart">♥</p></h1>
		<p class="h2_1">푸딩보다 더 달달한 인연</p>
		<p class="h2_2">찾으러 가보실까요?</p>
	</div>

	<img class="img"src="resources/images/payment/pudding.png"> 
</div>

<a class="movehome"href="payMain.do">메인으로 이동하기</a>

</div><!-- //wrap -->
</div><!-- //main -->
</body>
</html>