
// top-ai.js
document.addEventListener('DOMContentLoaded', function() {
 
 // ai띄우기
  var topAiElement = document.createElement('div');
  topAiElement.className = 'top-ai';
  
  topAiElement.innerHTML = `
	  <div class="ai-text">후니에게 이용 방법을 문의하세요!</div>
	  <div class="img-box">
	  	<i class="fa-solid fa-robot fa-xl" style="color: #743cb9;"></i>
	  </div>
  `;
  
  document.body.appendChild(topAiElement);
  var isChatBoxOpen = false;
   topAiElement.addEventListener('click', function() {
      if (!isChatBoxOpen) { // 채팅 상자가 닫혀있으면 열도록 합니다.
    isChatBoxOpen = true;

    // AJAX 요청 보내기
    fetch('/whou/assistant/ai') // 채팅창 내용이 있는 JSP 파일 경로
      .then(function(response) {
        return response.text(); // 응답 데이터를 텍스트로 변환
      })
      .then(function(data) {
        // AJAX 응답 처리 - 채팅창 표시할 영역에 내용 삽입
        var chatBoxContainer = document.querySelector('.chat-box-container');
        chatBoxContainer.innerHTML = data;
        chatBoxContainer.style.display = 'block';
        

      })
      .catch(function(error) {
        console.error('AJAX request failed: ', error);
      });
  } else { // 채팅 상자가 열려있으면 닫도록 합니다.
    isChatBoxOpen = false;

    // 채팅창 닫기
    var chatBoxContainer = document.querySelector('.chat-box-container');
    chatBoxContainer.innerHTML = '';
    chatBoxContainer.style.display = 'none';
  }
  });
});