<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div id="ai-chatBot" style="position: fixed; right: 20px; bottom: 20px; background-color: #f8f8f8; border: 1px solid #ddd; padding: 10px;">
		<div id="ai-assistant" style="display: none;">
		<%@ include file="assistant/ai.jsp" %>
		</div> 
		<div id="ai-area">
			<div class="ai-text" >후니에게 이용 방법을 문의하세요!</div>
			<div class="img-box">
				<i class="fa-solid fa-robot fa-xl" style="color: #743cb9;"></i>
			</div>
		</div>
	</div>
</body>
</html>