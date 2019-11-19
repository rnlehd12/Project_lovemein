	function func(obj){	
		$('input[name="s_appeal"]').change(function() {
		    var value = $(this).val();              
		    var checked = $(this).prop('checked'); 
		    var $label = $(this).next();  
			var chkbox = document.getElementsByName("s_appeal");
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
	
	function func2(obj){	
		$('input[name="s_inter"]').change(function() {
		    var value = $(this).val();              
		    var checked = $(this).prop('checked'); 
		    var $label = $(this).next();  
			var chkbox = document.getElementsByName("s_inter");
			var chkCnt = 0;
			for(var i=0;i<chkbox.length; i++){
				if(chkbox[i].checked){
					chkCnt++;
				}
			}
			if(chkCnt<4){
				if(checked)
					
					$label.css('background-color', 'rgb(234, 76, 118)').css('color','#fff');
				
				else{
					
					$label.css('background-color', 'white').css('border','1px solid rgb(234, 76, 118)').css('color','#000')
					.css('font-weight','normal');
					chkCnt--;
					
				}
				
			}else {
					
				alert("최대 3개까지 선택가능합니다.");
				$(this).prop('checked', false); 
				return false;
			}
		});	
	}
	
	function func3(obj){	
		$('input[name="s_ls"]').change(function() {
		    var value = $(this).val();              
		    var checked = $(this).prop('checked'); 
		    var $label = $(this).next();  
			var chkbox = document.getElementsByName("s_ls");
			var chkCnt = 0;
			for(var i=0;i<chkbox.length; i++){
				if(chkbox[i].checked){
					chkCnt++;
				}
			}
			if(chkCnt<4){
				if(checked)
					
					$label.css('background-color', 'rgb(234, 76, 118)').css('color','#fff');
				
				else{
					
					$label.css('background-color', 'white').css('border','1px solid rgb(234, 76, 118)').css('color','#000')
					.css('font-weight','normal');
					chkCnt--;
					
				}
				
			}else {
					
				alert("최대 3개까지 선택가능합니다.");
				$(this).prop('checked', false); 
				return false;
			}
		});	
	}
	
	function func4(obj){	
		$('input[name="s_ds"]').change(function() {
		    var value = $(this).val();              
		    var checked = $(this).prop('checked'); 
		    var $label = $(this).next();  
			var chkbox = document.getElementsByName("s_ds");
			var chkCnt = 0;
			for(var i=0;i<chkbox.length; i++){
				if(chkbox[i].checked){
					chkCnt++;
				}
			}
			if(chkCnt<4){
				if(checked)
					
					$label.css('background-color', 'rgb(234, 76, 118)').css('color','#fff');
				
				else{
					
					$label.css('background-color', 'white').css('border','1px solid rgb(234, 76, 118)').css('color','#000')
					.css('font-weight','normal');
					chkCnt--;
					
				}
				
			}else {
					
				alert("최대 3개까지 선택가능합니다.");
				$(this).prop('checked', false); 
				return false;
			}
		});	
	}