function maleChk(obj){
	
	var $label = $(this).next();  
	
	$('input[name="u_gender"]').click(function() {

		if($('input[id="male"]').prop('checked',true)){
			
			$('input[id="male"]').next().css('background-color', 'rgb(234, 76, 118)').css('color','#fff');
			$('input[id="female"]').next().css('background-color', '#6F6F6F').css('color','#fff')
			.css('font-weight','normal');
		}

	});	
}

	function femaleChk(obj){
		
		var $label = $(this).next();  
		
		$('input[name="u_gender"]').click(function() {

			if($('input[id="female"]').prop('checked',true)){
				
				$('input[id="female"]').next().css('background-color', 'rgb(234, 76, 118)').css('color','#fff');
				$('input[id="male"]').next().css('background-color', '#6F6F6F').css('color','#fff')
				.css('font-weight','normal');
			}

		});	
	}

	
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
	
	function bChk1(obj){
		
		var $label = $(this).next();  
		
		$('input[name="u_blood"]').click(function() {

			if($('input[id="b1"]').prop('checked',true)){
				
				$('input[id="b1"]').next().css('background-color', 'rgb(234, 76, 118)').css('color','#fff');
				$('input[id="b2').next().css('background-color', 'white').css('border','1px solid rgb(234, 76, 118)').css('color','#000')
				.css('font-weight','normal');
				$('input[id="b3"]').next().css('background-color', 'white').css('border','1px solid rgb(234, 76, 118)').css('color','#000')
				.css('font-weight','normal');
				$('input[id="b4"]').next().css('background-color', 'white').css('border','1px solid rgb(234, 76, 118)').css('color','#000')
				.css('font-weight','normal');
				
			}

		});	
	}
	
	function bChk2(obj){
		
		var $label = $(this).next();  
		
		$('input[name="u_blood"]').click(function() {

			if($('input[id="b2"]').prop('checked',true)){
				
				$('input[id="b2"]').next().css('background-color', 'rgb(234, 76, 118)').css('color','#fff');
				$('input[id="b1').next().css('background-color', 'white').css('border','1px solid rgb(234, 76, 118)').css('color','#000')
				.css('font-weight','normal');
				$('input[id="b3"]').next().css('background-color', 'white').css('border','1px solid rgb(234, 76, 118)').css('color','#000')
				.css('font-weight','normal');
				$('input[id="b4"]').next().css('background-color', 'white').css('border','1px solid rgb(234, 76, 118)').css('color','#000')
				.css('font-weight','normal');
				
			}

		});	
	}

	function bChk3(obj){
		
		var $label = $(this).next();  
		
		$('input[name="u_blood"]').click(function() {

			if($('input[id="b3"]').prop('checked',true)){
				
				$('input[id="b3"]').next().css('background-color', 'rgb(234, 76, 118)').css('color','#fff');
				$('input[id="b1').next().css('background-color', 'white').css('border','1px solid rgb(234, 76, 118)').css('color','#000')
				.css('font-weight','normal');
				$('input[id="b2"]').next().css('background-color', 'white').css('border','1px solid rgb(234, 76, 118)').css('color','#000')
				.css('font-weight','normal');
				$('input[id="b4"]').next().css('background-color', 'white').css('border','1px solid rgb(234, 76, 118)').css('color','#000')
				.css('font-weight','normal');
				
			}

		});	
	}
	
	function bChk4(obj){
		
		var $label = $(this).next();  
		
		$('input[name="u_blood"]').click(function() {

			if($('input[id="b4"]').prop('checked',true)){
				
				$('input[id="b4"]').next().css('background-color', 'rgb(234, 76, 118)').css('color','#fff');
				$('input[id="b1').next().css('background-color', 'white').css('border','1px solid rgb(234, 76, 118)').css('color','#000')
				.css('font-weight','normal');
				$('input[id="b2"]').next().css('background-color', 'white').css('border','1px solid rgb(234, 76, 118)').css('color','#000')
				.css('font-weight','normal');
				$('input[id="b3"]').next().css('background-color', 'white').css('border','1px solid rgb(234, 76, 118)').css('color','#000')
				.css('font-weight','normal');
				
			}

		});	
	}
	
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