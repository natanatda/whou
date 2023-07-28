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
        <script type="text/javascript" src="../resources/smarteditor/js/HuskyEZCreator.js" charset="utf-8"></script>
        <script src="https://code.jquery.com/jquery-3.7.0.min.js"></script>
        <script src="../resources/js/smartEditor.js" ></script> <%-- 스마트 에디터 --%>
       <c:if test="${lv != 2 }">
       		<script>
       			alert("잘못된 경로입니다.");
       			history.back();
       		</script>
       	</c:if>
    </head>
<body>
	<%@ include file="../header.jsp" %>     
	    <header class="py-5">
	      <div class="container px-5">
     	 <h3 class="page-title">공지사항 수정</h3>
	<div style="float: center; margin: 10px; padding: 20px; width: 1000px;">
		<form action="/whou/cs/noticeModify" onsubmit="return submitPost();">
		<div class="mb-3">
		  <label for="exampleFormControlInput1" class="form-label">제목</label>
		  <input type="text" value="${notice.subject}" name="subject" class="form-control" id="exampleFormControlInput1">
		</div>
		<div class="mb-3" style="height: 500px;">
		  <label for="exampleFormControlTextarea1" class="form-label">내용</label>
		  <textarea class="form-control" name="content" id="exampleFormControlTextarea1" rows="18">${notice.content }</textarea>
		</div>
			<input type="hidden" value="${notice.num }" name="num" /> 
			<input type="submit" class="btn btn-light" style="float: right;" value="수정">
			<button onclick="history.back();" type="button" class="btn btn-light" style="float: right;">돌아가기</button>
		</form>
	</div>
	</div>
	</header>
	<%@ include file="../footer.jsp" %>
	<!-- Bootstrap core JS-->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>