<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
        <script src="https://code.jquery.com/jquery-3.7.0.min.js" ></script>
        <script src="../resources/js/ai.js"></script>	
    </head>
<body>
	<%@ include file="../header.jsp" %>        
	    <header class="py-5">
	      <div class="container px-5">
     	 <h3 class="page-title">공지사항</h3>
     	 <div style="float: center; margin: 10px; padding: 20px; width: 1000px;">
     	 <table class="table" style="table-layout:fixed" >
						<tbody>
							<tr>
								<th class="table-secondary" scope="col"><strong>글번호</strong></th>
									<td>${notice.num} </td>
								<th class="table-secondary" scope="col"><strong>조회수</strong></th>
									<td>${notice.readcount}</td>
							</tr>
							<tr>
								<th class="table-secondary" scope="col"><strong>제목</strong></th>
									<td><strong>${notice.subject}</strong></td>
								<th class="table-secondary" scope="col"><strong>작성일</strong></th>
									<td>
										<fmt:formatDate value="${notice.reg}" pattern="yyyy-MM-dd" type="date"/>
									</td>
							</tr>
							<tr>
								<th class="table-secondary" scope="row" style="height: 450px; vertical-align: middle;"><strong>내용</strong></th>
									<td colspan="3">${notice.content}</td>
							</tr>
						</tbody>
		</table>
		<button onclick="history.back();" type="button" class="btn btn-light" style="float: right;">돌아가기</button>
		<c:if test="${lv == 2}">
			<button type="button" onclick="deleteNotice();" class="btn btn-light" style="float: right;">삭제</button>
			<button type="button" onclick="location='/whou/cs/noticeModifyForm?num=${notice.num}'" class="btn btn-light" style="float: right;">수정</button>
		</c:if>
		
	</div>
	</div>
	</header>
	<%@ include file="../aiChatBot.jsp" %>
	<%@ include file="../footer.jsp" %>
	<!-- Bootstrap core JS-->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
	<script>
		function deleteNotice(){
			if(confirm("삭제 하시겠습니까?") == true){
				location='/whou/cs/noticeDelete?num=${notice.num}';	
			}			
		}
	</script>
</body>
</html>