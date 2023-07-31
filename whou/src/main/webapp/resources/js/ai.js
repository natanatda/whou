  $(function(){	
    	var showChatBot = 1; // 챗봇 열고 닫기 위한 변수
    	
    	// 챗봇 클릭하면 보여줌
    	$('#ai-area').click(function(){
    		if(showChatBot === 1){
    			$('#ai-assistant').show(); // include한 jsp를 보여줌
    			$('#ai-chatBot').css({'width':'500px'}); // css 수정
    			showChatBot--;
    		}else if(showChatBot === 0){
    			$('#ai-assistant').hide(); 
    			$('#ai-chatBot').css({'width':''}); // css 수정
    			showChatBot ++;
    		}
    	});	
    	
    	// 챗봇 밖 클릭하면 창 숨김
    	$('body').click(function (e) {		  
		  if (!$("#ai-chatBot").has(e.target).length) {
		    $('#ai-assistant').hide(); // include한 jsp를 숨김
		    $('#ai-chatBot').css({'width':''}); // css 수정
		    showChatBot = 1;
		    // tts종료
		    $("#readArea").html('<button id="readbtn" class="btn btn-light">읽기</button>'
							+'<button class="btn btn-light" id="clear">초기화</button>');
		    read = false;
		  }
		});
	
    });
