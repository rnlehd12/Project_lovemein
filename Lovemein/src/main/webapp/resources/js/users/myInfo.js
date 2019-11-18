/**
 * 회원정보수정 자바스크립트 by 귀정
 */


$(document).ready(function(){
	
	//거주지 정보를 회원이 기존에 선택했던 값으로 불러옴.
	var chk_loc = $("#chkLoc").val();
	$('.locOpt').each(function (index, item) { 
		
		if(item.value == chk_loc){
			
			$(item).attr("selected","selected");
		}

	});
	
	//학력정보를 회원이 기존에 선택했던 값으로 불러옴.
	var chk_edu = $("#chkEdu").val();
	$('.eduOpt').each(function (index, item) { 
		
		if(item.value == chk_edu){
			
			$(item).attr("selected","selected");
		}

	});
	
	//체형 정보를 회원이 기존에 선택했던 값으로 불러옴.
	var chk_weight = $("#chk_weight").val();
	
	$('.chks').each(function (index, item) { 
		
		if(item.value == chk_weight){
			
			$(item).next().css('background-color', 'rgb(234, 76, 118)').css('color','#fff');
			$(item).attr("checked", true);
		}

	});
	
	//혈액형 정보를 회원이 기존에 선택했던 값으로 불러옴.
	var chk_blood = $("#bloodChk").val();

	$('.bchks').each(function (index, item) { 
		
		if(item.value == chk_blood){
			
			$(item).next().css('background-color', 'rgb(234, 76, 118)').css('color','#fff');
			$(item).attr("checked", true);
		}

	});
	
	//종교정보를 회원이 기존에 선택했던 값으로 불러옴
	var chk_rei = $("#chkReiInput").val();
	
	$('.rChks').each(function (index, item) { 
		
		if(item.value == chk_rei){
			
			$(item).next().css('background-color', 'rgb(234, 76, 118)').css('color','#fff');
			$(item).attr("checked", true);
		}

	});

	
	//성격 정보를 회원이 기존에 선택했던 값으로 불러옴.
	var chk_char = $(".chkCharInput").val();
	var array = new Array();
	array = chk_char.split(",");
	
	$('.cChks').each(function (index, item) { 
		
		for(var i =0; i<array.length; i++){

			if(item.value == array[i]){
						
				$(item).next().css('background-color', 'rgb(234, 76, 118)').css('color','#fff');
				$(item).attr("checked", true);
			}
		}
	});
	

});

//체형 라디오버튼 스크립트
function weightChk1(obj){
	
	var $label = $(this).next();  
	
	$('input[name="u_weight"]').click(function() {

		if($('input[id="weight1"]').prop('checked',true)){
			
			$('input[id="weight1"]').next().css('background-color', 'rgb(234, 76, 118)').css('color','#fff');
			$('input[id="weight2"]').next().css('background-color', 'white').css('border','1px solid rgb(234, 76, 118)').css('color','#000')
			.css('font-weight','normal');
			$('input[id="weight3"]').next().css('background-color', 'white').css('border','1px solid rgb(234, 76, 118)').css('color','#000')
			.css('font-weight','normal');
			$('input[id="weight4"]').next().css('background-color', 'white').css('border','1px solid rgb(234, 76, 118)').css('color','#000')
			.css('font-weight','normal');
			$('input[id="weight5"]').next().css('background-color', 'white').css('border','1px solid rgb(234, 76, 118)').css('color','#000')
			.css('font-weight','normal');
		}

	});	
}

function weightChk2(obj){
	
	var $label = $(this).next();  
	
	$('input[name="u_weight"]').click(function() {

		if($('input[id="weight2"]').prop('checked',true)){
			
			$('input[id="weight2"]').next().css('background-color', 'rgb(234, 76, 118)').css('color','#fff');
			$('input[id="weight1"]').next().css('background-color', 'white').css('border','1px solid rgb(234, 76, 118)').css('color','#000')
			.css('font-weight','normal');
			$('input[id="weight3"]').next().css('background-color', 'white').css('border','1px solid rgb(234, 76, 118)').css('color','#000')
			.css('font-weight','normal');
			$('input[id="weight4"]').next().css('background-color', 'white').css('border','1px solid rgb(234, 76, 118)').css('color','#000')
			.css('font-weight','normal');
			$('input[id="weight5"]').next().css('background-color', 'white').css('border','1px solid rgb(234, 76, 118)').css('color','#000')
			.css('font-weight','normal');
		}

	});	
}

function weightChk3(obj){
	
	var $label = $(this).next();  
	
	$('input[name="u_weight"]').click(function() {

		if($('input[id="weight3"]').prop('checked',true)){
			
			$('input[id="weight3"]').next().css('background-color', 'rgb(234, 76, 118)').css('color','#fff');
			$('input[id="weight1"]').next().css('background-color', 'white').css('border','1px solid rgb(234, 76, 118)').css('color','#000')
			.css('font-weight','normal');
			$('input[id="weight2"]').next().css('background-color', 'white').css('border','1px solid rgb(234, 76, 118)').css('color','#000')
			.css('font-weight','normal');
			$('input[id="weight4"]').next().css('background-color', 'white').css('border','1px solid rgb(234, 76, 118)').css('color','#000')
			.css('font-weight','normal');
			$('input[id="weight5"]').next().css('background-color', 'white').css('border','1px solid rgb(234, 76, 118)').css('color','#000')
			.css('font-weight','normal');
		}

	});	
}

function weightChk4(obj){
	
	var $label = $(this).next();  
	
	$('input[name="u_weight"]').click(function() {

		if($('input[id="weight4"]').prop('checked',true)){
			
			$('input[id="weight4"]').next().css('background-color', 'rgb(234, 76, 118)').css('color','#fff');
			$('input[id="weight1"]').next().css('background-color', 'white').css('border','1px solid rgb(234, 76, 118)').css('color','#000')
			.css('font-weight','normal');
			$('input[id="weight2"]').next().css('background-color', 'white').css('border','1px solid rgb(234, 76, 118)').css('color','#000')
			.css('font-weight','normal');
			$('input[id="weight3"]').next().css('background-color', 'white').css('border','1px solid rgb(234, 76, 118)').css('color','#000')
			.css('font-weight','normal');
			$('input[id="weight5"]').next().css('background-color', 'white').css('border','1px solid rgb(234, 76, 118)').css('color','#000')
			.css('font-weight','normal');
		}

	});	
}

function weightChk5(obj){
	
	var $label = $(this).next();  
	
	$('input[name="u_weight"]').click(function() {

		if($('input[id="weight5"]').prop('checked',true)){
			
			$('input[id="weight5"]').next().css('background-color', 'rgb(234, 76, 118)').css('color','#fff');
			$('input[id="weight1"]').next().css('background-color', 'white').css('border','1px solid rgb(234, 76, 118)').css('color','#000')
			.css('font-weight','normal');
			$('input[id="weight2"]').next().css('background-color', 'white').css('border','1px solid rgb(234, 76, 118)').css('color','#000')
			.css('font-weight','normal');
			$('input[id="weight3"]').next().css('background-color', 'white').css('border','1px solid rgb(234, 76, 118)').css('color','#000')
			.css('font-weight','normal');
			$('input[id="weight4"]').next().css('background-color', 'white').css('border','1px solid rgb(234, 76, 118)').css('color','#000')
			.css('font-weight','normal');
		}

	});	
}

//혈액형 라디오버튼 스크립트
function bloodChk1(obj){
	
	var $label = $(this).next();  
	
	$('input[name="u_blood"]').click(function() {

		if($('input[id="blood1"]').prop('checked',true)){
			
			$('input[id="blood1"]').next().css('background-color', 'rgb(234, 76, 118)').css('color','#fff');
			$('input[id="blood2"]').next().css('background-color', 'white').css('border','1px solid rgb(234, 76, 118)').css('color','#000')
			.css('font-weight','normal');
			$('input[id="blood3"]').next().css('background-color', 'white').css('border','1px solid rgb(234, 76, 118)').css('color','#000')
			.css('font-weight','normal');
			$('input[id="blood4"]').next().css('background-color', 'white').css('border','1px solid rgb(234, 76, 118)').css('color','#000')
			.css('font-weight','normal');
			$('input[id="blood5"]').next().css('background-color', 'white').css('border','1px solid rgb(234, 76, 118)').css('color','#000')
			.css('font-weight','normal');
		}

	});	
}

function bloodChk2(obj){
	
	var $label = $(this).next();  
	
	$('input[name="u_blood"]').click(function() {

		if($('input[id="blood2"]').prop('checked',true)){
			
			$('input[id="blood2"]').next().css('background-color', 'rgb(234, 76, 118)').css('color','#fff');
			$('input[id="blood1"]').next().css('background-color', 'white').css('border','1px solid rgb(234, 76, 118)').css('color','#000')
			.css('font-weight','normal');
			$('input[id="blood3"]').next().css('background-color', 'white').css('border','1px solid rgb(234, 76, 118)').css('color','#000')
			.css('font-weight','normal');
			$('input[id="blood4"]').next().css('background-color', 'white').css('border','1px solid rgb(234, 76, 118)').css('color','#000')
			.css('font-weight','normal');
			$('input[id="blood5"]').next().css('background-color', 'white').css('border','1px solid rgb(234, 76, 118)').css('color','#000')
			.css('font-weight','normal');
		}

	});	
}

function bloodChk3(obj){
	
	var $label = $(this).next();  
	
	$('input[name="u_blood"]').click(function() {

		if($('input[id="blood3"]').prop('checked',true)){
			
			$('input[id="blood3"]').next().css('background-color', 'rgb(234, 76, 118)').css('color','#fff');
			$('input[id="blood1"]').next().css('background-color', 'white').css('border','1px solid rgb(234, 76, 118)').css('color','#000')
			.css('font-weight','normal');
			$('input[id="blood2"]').next().css('background-color', 'white').css('border','1px solid rgb(234, 76, 118)').css('color','#000')
			.css('font-weight','normal');
			$('input[id="blood4"]').next().css('background-color', 'white').css('border','1px solid rgb(234, 76, 118)').css('color','#000')
			.css('font-weight','normal');
			$('input[id="blood5"]').next().css('background-color', 'white').css('border','1px solid rgb(234, 76, 118)').css('color','#000')
			.css('font-weight','normal');
		}

	});	
}

function bloodChk4(obj){
	
	var $label = $(this).next();  
	
	$('input[name="u_blood"]').click(function() {

		if($('input[id="blood4"]').prop('checked',true)){
			
			$('input[id="blood4"]').next().css('background-color', 'rgb(234, 76, 118)').css('color','#fff');
			$('input[id="blood1"]').next().css('background-color', 'white').css('border','1px solid rgb(234, 76, 118)').css('color','#000')
			.css('font-weight','normal');
			$('input[id="blood2"]').next().css('background-color', 'white').css('border','1px solid rgb(234, 76, 118)').css('color','#000')
			.css('font-weight','normal');
			$('input[id="blood3"]').next().css('background-color', 'white').css('border','1px solid rgb(234, 76, 118)').css('color','#000')
			.css('font-weight','normal');
			$('input[id="blood5"]').next().css('background-color', 'white').css('border','1px solid rgb(234, 76, 118)').css('color','#000')
			.css('font-weight','normal');
		}

	});	
}


//성격 체크박스 시작(최대 5개가능)
function func(obj){	
	$('input[name="u_char"]').change(function() {
	    var value = $(this).val();              
	    var checked = $(this).prop('checked'); 
	    var $label = $(this).next();  
		var chkbox = document.getElementsByName("u_char");
		var chkCnt = 0;
		for(var i=0;i<chkbox.length; i++){
			if(chkbox[i].checked){
				chkCnt++;
			}
		}
		if(chkCnt<6){
			if(checked)
				
				$label.css('background-color', 'rgb(234, 76, 118)').css('color','#fff');
			
			else{
				
				$label.css('background-color', 'white').css('border','1px solid rgb(234, 76, 118)').css('color','#000')
				.css('font-weight','normal');
				chkCnt--;
				
			}
			
		}else {
				
			alert("최대 5개까지 선택가능합니다.");
			$(this).prop('checked', false); 
			return false;
		}
	});	
}

//종교 라디오 버튼 스크립트
function rChk1(obj){
	
	var $label = $(this).next();  
	
	$('input[name="u_rei"]').click(function() {

		if($('input[id="r1"]').prop('checked',true)){
			
			$('input[id="r1"]').next().css('background-color', 'rgb(234, 76, 118)').css('color','#fff');
			$('input[id="r2').next().css('background-color', 'white').css('border','1px solid rgb(234, 76, 118)').css('color','#000')
			.css('font-weight','normal');
			$('input[id="r3"]').next().css('background-color', 'white').css('border','1px solid rgb(234, 76, 118)').css('color','#000')
			.css('font-weight','normal');
			$('input[id="r4"]').next().css('background-color', 'white').css('border','1px solid rgb(234, 76, 118)').css('color','#000')
			.css('font-weight','normal');
			$('input[id="r5"]').next().css('background-color', 'white').css('border','1px solid rgb(234, 76, 118)').css('color','#000')
			.css('font-weight','normal');
			$('input[id="r6"]').next().css('background-color', 'white').css('border','1px solid rgb(234, 76, 118)').css('color','#000')
			.css('font-weight','normal');
		}

	});	
}

function rChk2(obj){
	
	var $label = $(this).next();  
	
	$('input[name="u_rei"]').click(function() {

		if($('input[id="r2"]').prop('checked',true)){
			
			$('input[id="r2"]').next().css('background-color', 'rgb(234, 76, 118)').css('color','#fff');
			$('input[id="r1').next().css('background-color', 'white').css('border','1px solid rgb(234, 76, 118)').css('color','#000')
			.css('font-weight','normal');
			$('input[id="r3"]').next().css('background-color', 'white').css('border','1px solid rgb(234, 76, 118)').css('color','#000')
			.css('font-weight','normal');
			$('input[id="r4"]').next().css('background-color', 'white').css('border','1px solid rgb(234, 76, 118)').css('color','#000')
			.css('font-weight','normal');
			$('input[id="r5"]').next().css('background-color', 'white').css('border','1px solid rgb(234, 76, 118)').css('color','#000')
			.css('font-weight','normal');
			$('input[id="r6"]').next().css('background-color', 'white').css('border','1px solid rgb(234, 76, 118)').css('color','#000')
			.css('font-weight','normal');
		}

	});	
}

function rChk3(obj){
	
	var $label = $(this).next();  
	
	$('input[name="u_rei"]').click(function() {

		if($('input[id="r3"]').prop('checked',true)){
			
			$('input[id="r3"]').next().css('background-color', 'rgb(234, 76, 118)').css('color','#fff');
			$('input[id="r1').next().css('background-color', 'white').css('border','1px solid rgb(234, 76, 118)').css('color','#000')
			.css('font-weight','normal');
			$('input[id="r2"]').next().css('background-color', 'white').css('border','1px solid rgb(234, 76, 118)').css('color','#000')
			.css('font-weight','normal');
			$('input[id="r4"]').next().css('background-color', 'white').css('border','1px solid rgb(234, 76, 118)').css('color','#000')
			.css('font-weight','normal');
			$('input[id="r5"]').next().css('background-color', 'white').css('border','1px solid rgb(234, 76, 118)').css('color','#000')
			.css('font-weight','normal');
			$('input[id="r6"]').next().css('background-color', 'white').css('border','1px solid rgb(234, 76, 118)').css('color','#000')
			.css('font-weight','normal');
		}

	});	
}

function rChk4(obj){
	
	var $label = $(this).next();  
	
	$('input[name="u_rei"]').click(function() {

		if($('input[id="r4"]').prop('checked',true)){
			
			$('input[id="r4"]').next().css('background-color', 'rgb(234, 76, 118)').css('color','#fff');
			$('input[id="r1').next().css('background-color', 'white').css('border','1px solid rgb(234, 76, 118)').css('color','#000')
			.css('font-weight','normal');
			$('input[id="r2"]').next().css('background-color', 'white').css('border','1px solid rgb(234, 76, 118)').css('color','#000')
			.css('font-weight','normal');
			$('input[id="r3"]').next().css('background-color', 'white').css('border','1px solid rgb(234, 76, 118)').css('color','#000')
			.css('font-weight','normal');
			$('input[id="r5"]').next().css('background-color', 'white').css('border','1px solid rgb(234, 76, 118)').css('color','#000')
			.css('font-weight','normal');
			$('input[id="r6"]').next().css('background-color', 'white').css('border','1px solid rgb(234, 76, 118)').css('color','#000')
			.css('font-weight','normal');
		}

	});	
}

function rChk5(obj){
	
	var $label = $(this).next();  
	
	$('input[name="u_rei"]').click(function() {

		if($('input[id="r5"]').prop('checked',true)){
			
			$('input[id="r5"]').next().css('background-color', 'rgb(234, 76, 118)').css('color','#fff');
			$('input[id="r1').next().css('background-color', 'white').css('border','1px solid rgb(234, 76, 118)').css('color','#000')
			.css('font-weight','normal');
			$('input[id="r2"]').next().css('background-color', 'white').css('border','1px solid rgb(234, 76, 118)').css('color','#000')
			.css('font-weight','normal');
			$('input[id="r3"]').next().css('background-color', 'white').css('border','1px solid rgb(234, 76, 118)').css('color','#000')
			.css('font-weight','normal');
			$('input[id="r4"]').next().css('background-color', 'white').css('border','1px solid rgb(234, 76, 118)').css('color','#000')
			.css('font-weight','normal');
			$('input[id="r6"]').next().css('background-color', 'white').css('border','1px solid rgb(234, 76, 118)').css('color','#000')
			.css('font-weight','normal');
		}

	});	
}

function rChk6(obj){
	
	var $label = $(this).next();  
	
	$('input[name="u_rei"]').click(function() {

		if($('input[id="r6"]').prop('checked',true)){
			
			$('input[id="r6"]').next().css('background-color', 'rgb(234, 76, 118)').css('color','#fff');
			$('input[id="r1').next().css('background-color', 'white').css('border','1px solid rgb(234, 76, 118)').css('color','#000')
			.css('font-weight','normal');
			$('input[id="r2"]').next().css('background-color', 'white').css('border','1px solid rgb(234, 76, 118)').css('color','#000')
			.css('font-weight','normal');
			$('input[id="r3"]').next().css('background-color', 'white').css('border','1px solid rgb(234, 76, 118)').css('color','#000')
			.css('font-weight','normal');
			$('input[id="r4"]').next().css('background-color', 'white').css('border','1px solid rgb(234, 76, 118)').css('color','#000')
			.css('font-weight','normal');
			$('input[id="r5"]').next().css('background-color', 'white').css('border','1px solid rgb(234, 76, 118)').css('color','#000')
			.css('font-weight','normal');
		}

	});	
}