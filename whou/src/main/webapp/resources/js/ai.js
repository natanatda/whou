    	
    $(function(){	
    	var showChatBot = 0; // 챗봇 열고 닫기 위한 변수
    	$(document).ready(function(){
    		var initialPosition = ParseInt($("#ai-chatBot").css("top")); // 초기 위치 세팅
    		$(window).scroll(function(){  //스크롤이 움직일때마다 이벤트 발생
    			var position = $(window).scrollTop(); // 현재 스크롤바의 위치값을 반환
    			$("#ai-chatBot").stop().animate({top:position+"px"}, 400); //해당 오브젝트 위치값 재설정
    		});
    	});
    	        
    	$('#ai-area').click(function(){
    		showChatBot++;
    		if(showChatBot === 1){
    			$('#ai-assistant').show(); // include한 jsp를 보여줌
    			$('#ai-chatBot').css({'width':'500px'}); // css 수정
    		}
    	});	
    	
		/* 다른 곳 클릭 시 div 숨기기 */
    	$(document).click(function (e) {
  			const aiWarp = $("#ai-area");
  			if (aiWarp.has(e.target).length === 0) {
	    		$('#ai-assistant').hide(); // include한 jsp를 보여줌
	    		$('#ai-chatBot').css({'width':''}); // css 수정
	    		showChatBot = 0;
  			}
    	});
    });