<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
 <head>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>whou</title>
        <!-- Favicon-->
        <link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
        <!-- Bootstrap icons-->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css" rel="stylesheet" />
        <!-- Core theme CSS (includes Bootstrap)-->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-9ndCyUaIbzAi2FUVXJi0CjmCapSmO7SnpJef0486qhLnuZ2cdeRhO02iuK6FUUVM" crossorigin="anonymous">
        <link rel="stylesheet" href="/whou/resources/css/style.css">
        <script src="https://kit.fontawesome.com/dbaea98925.js" crossorigin="anonymous"></script>
        <script src="../resources/js/adminInputcheck.js" ></script>
    </head>
    	<c:if test="${lv != 0}"> <%-- 레벨 검사 --%>
    		<script>
    			alert("잘못된 접근입니다.");
    			history.back();
    		</script>
    	</c:if>
   <body>
        <!-- Responsive navbar-->
       <%@ include file="../header.jsp" %>        
    <header class="py-5">
      <div class="container px-5">
      <h3 class="page-title">FAQ작성</h3>
    <div style="float: center; margin: 10px; padding: 20px; width: 1000px;">
	<form action="/whou/cs/faqWrite" onsubmit="return input();">
	<div class="mb-3">
	
	
	<span>카테고리</span> <br/>
		  <select name="category">
			<option value="자주묻는질문">자주묻는질문</option>
			<option value="회원가입/탈퇴관련">회원가입/탈퇴관련</option>
			<option value="진로검사및상담">진로검사 및 상담</option>
			<option value="직업정보">직업정보</option>
			<option value="활용TIP">활용TIP</option>
			<option value="기타">기타</option>
		</select>
	</div>
		
		<div class="mb-3">
		  <label for="exampleFormControlInput1" class="form-label">제목</label>
		  <input type="text" name="subject" class="form-control" id="exampleFormControlInput1" placeholder="제목을 입력해주세요">
		</div>		
		<div class="mb-3" style="height: 500px;">
		  <label for="exampleFormControlTextarea1" class="form-label">내용</label>
		  <textarea class="form-control" name="content" id="exampleFormControlTextarea1" rows="18"></textarea>
		</div>
			<button onclick="history.back();" type="button" class="btn btn-light" style="float: right;">돌아가기</button>
			<button type="submit" class="btn btn-light" style="float: right;" >글작성</button>
 	</form>
 	</div>
 	</div>
 	</header>
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