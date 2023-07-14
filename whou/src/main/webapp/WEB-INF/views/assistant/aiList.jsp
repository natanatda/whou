<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<script src="https://code.jquery.com/jquery-3.7.0.min.js" ></script>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
	<meta name="description" content="" />
	<meta name="author" content="" />
	<title>whou</title>
	<link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
        <!-- Bootstrap icons-->
	<link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css" rel="stylesheet" />
        <!-- Core theme CSS (includes Bootstrap)-->
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-9ndCyUaIbzAi2FUVXJi0CjmCapSmO7SnpJef0486qhLnuZ2cdeRhO02iuK6FUUVM" crossorigin="anonymous">
	<link rel="stylesheet" href="/whou/resources/css/style.css">
	<script src="https://kit.fontawesome.com/dbaea98925.js" crossorigin="anonymous"></script>
	
	<script src="../resources/js/adminInputcheck.js" ></script>
<script>
	$(function() {
		$("#add").click(function(){ // '추가' 버튼 눌렀을 때 동작
			$("#addText").html(
			'<form action="/whou/assistant/aiInsert" onsubmit="return aiInput();">'
			+'<input type="text" id="qes" name="qes" placeholder="질문" />'
			+'<input type="text" id="con" name="con" placeholder="답변" />'
			+'<input type="number" id="ref" name="ref" placeholder="그룹" />'
			+'<input type="number" id="ref_level" name="ref_level" placeholder="그룹레벨" />'
			+'<input type="submit" class="btn btn-light" value="저장"/>'
			+'</form>')
		});
      });
	</script>
	<c:if test="${lv != 0}"> <%-- 레벨 검사 --%>
		<script>
			alert("잘못된 접근입니다.");
			history.back();
		</script>
	</c:if>
</head>
<body>
	<%@ include file="../header.jsp" %>        
        <!-- Header-->
        <header class="py-5">
            <div class="container px-5">
                <h2 class="page-title">ai</h2>
			</div>
		</header>	
	<!-- start -->
	<div style="overflow: auto; margin:0 auto; display:flex; justify-content: center; height: 40px">
		<input style="float: left;" class="btn btn-light" type="button" id="add" value="추가" />
		<div id="addText"></div>
		<hr/>
	</div>
	<c:if test="${count > 0 }" >
		<c:forEach items="${list}" var="assistant">
		<div style="overflow: auto; margin:0 auto; display:flex; justify-content: center;" >
			<form action="/whou/assistant/aiUpdate">
				<input type="text" id="qes" name="qes" value="${assistant.qes}" />
				<input type="text" id="con" name="con" value="${assistant.con}" />
				<input type="number" id="ref" name="ref" value="${assistant.ref}" />
				<input type="number" id="ref_level" name="ref_level" value="${assistant.ref_level}" /> <br/>
				<input type="hidden" name="num" value="${assistant.num}" />
				<input type="submit" class="btn btn-light" value="수정" />
				<input type="button" class="btn btn-light" value="삭제" onclick="location='/whou/assistant/aiDelete?num=${assistant.num}'"/>
			</form>
	</div>
			<hr/>
		</c:forEach>
	</c:if>
	<!-- end -->
	<footer class="container py-5">
            <div class="border-top border-bottom py-3">
                <ul class="footer-content">
                    <li><a href="#!">개인정보처리방침</a></li>
                    <li><a href="#!">이메일주소무단수집거부</a></li>
                    <li><a href="#!">이용안내</a></li>
                    <li><a href="#!">이용문의 및 오류제보</a></li>
                    <li><a href="#!">English</a></li>
                    <li><a href="#!">오픈API</a></li>
                </ul>
            </div>
            <div class="footer-address py-3">
                <p class="m-0">주소 : 서울특별시 관악구 봉천동 에그옐로우 14층</p>
                <p class="m-0">운영 : 한국직업능력연구원 국가진로교육연구센터</p>
                <p class="m-0">Copyright &copy; Your Website 2023</p>
            </div>
        </footer>
    </body>
</html>