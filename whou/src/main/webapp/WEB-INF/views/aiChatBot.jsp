<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div id="ai-chatBot">
		<div id="ai-assistant" >
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