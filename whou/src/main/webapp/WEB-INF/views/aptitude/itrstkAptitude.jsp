<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html lang="en">
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
    </head>
    
    

<body>
       <!-- Responsive navbar-->
       <%@ include file="../header.jsp" %>

	<!-- Pricing section-->
	<section class="py-2 aptitude aptitude-section">
		<div class="container px-5 my-5">
			<h2 class="page-title">진로검사</h2>

			<div class="row aptitude-content">
				<div class="col-lg-12 col-xl-12">
					<h3 class="page-count">
						<span>0</span> / <span>${fn:length(RESULT)}</span>
					</h3>
					<form action="report" method="post">
						<input type="hidden" name="qnum" value="27">
						<input type="hidden" name="countQ" value="${fn:length(RESULT)}">
						<c:if test="${qnum eq '27' || qnum == '27'}" >
						<div class="top-question">
							<span class="top-num"></span>
							<p class="top-q">
								다음 문항들은 여러가지 종류의 직업에서 이루어지는 활동들을 나타내고 있습니다.<br>
								장래의 직업으로서 다음 활동들을 얼마나 좋아하는지를 생각해보고 답하십시오.
							</p>
						</div>
						<ul class="question-wrap">
							<c:forEach items="${RESULT}" var="item" varStatus="status">
								<li>
									<div class="question-item">
										<span class="ic-question">${item.qitemNo}</span>${item.question}
									</div>
									
									<div class="btn-group radio-group" role="group" aria-label="Basic radio toggle button group">
										<input type="radio" class="btn-check" name="btnradio${status.index+1}" id="btnradio${status.index * 5 + 1}" value="1" checked autocomplete="off">
										<label class="btn btn-outline-primary" for="btnradio${status.index * 5 + 1}">${item.answer01}</label>

										<input type="radio" class="btn-check" name="btnradio${status.index+1}" id="btnradio${status.index * 5 + 2}" value="2" autocomplete="off">
										<label class="btn btn-outline-primary" for="btnradio${status.index * 5 + 2}">${item.answer02}</label>

										<input type="radio" class="btn-check" name="btnradio${status.index+1}" id="btnradio${status.index * 5 + 3}" value="3" autocomplete="off">
										<label class="btn btn-outline-primary" for="btnradio${status.index * 5 + 3}">${item.answer03}</label>

										<input type="radio" class="btn-check" name="btnradio${status.index+1}" id="btnradio${status.index * 5 + 4}" value="4" autocomplete="off">
										<label class="btn btn-outline-primary" for="btnradio${status.index * 5 + 4}">${item.answer04}</label>

										<input type="radio" class="btn-check" name="btnradio${status.index+1}" id="btnradio${status.index * 5 + 5}" value="5" autocomplete="off">
										<label class="btn btn-outline-primary" for="btnradio${status.index * 5 + 5}">${item.answer05}</label>
									</div>
								</li>
							</c:forEach>
							</ul>
							</c:if>
						<c:if test="${qnum eq '6' || qnum == '6'}">
						<div class="top-question">
							<span class="top-num"></span>
							<p class="top-q">
								다음 문항들은 여러가지 종류의 직업에서 이루어지는 활동들을 나타내고 있습니다.<br>
								장래의 직업으로서 다음 활동들을 얼마나 좋아하는지를 생각해보고 답하십시오.
							</p>
						</div>
						<ul class="question-wrap">
							<c:forEach items="${RESULT}" var="item" varStatus="status">
								<li>
									<div class="question-item">
										<span class="ic-question">${item.qitemNo}</span>${item.question}
									</div>
									
									<div class="btn-group radio-group" role="group" aria-label="Basic radio toggle button group">
										<input type="radio" class="btn-check" name="btnradio${status.index+1}" id="btnradio${status.index * 5 + 1}" value="1" checked autocomplete="off">
										<label class="btn btn-outline-primary" for="btnradio${status.index * 5 + 1}">${item.answer01}</label>

										<input type="radio" class="btn-check" name="btnradio${status.index+1}" id="btnradio${status.index * 5 + 2}" value="2" autocomplete="off">
										<label class="btn btn-outline-primary" for="btnradio${status.index * 5 + 2}">${item.answer02}</label>

										<p>${item.answer03}<br>${item.answer04}</p>
									</div>
								</li>
							</c:forEach>
						</ul>
						</c:if>
						<div class="button-wrap">
						<!-- 
							<button class="white-btn" onclick="previousPage()">이전</button>
							<button class="white-btn" onclick="nextPage()">다음</button>
							 -->
							<button class="white-btn">취소</button>
							<button class="white-btn">임시저장</button>
							<input type="submit" class="white-btn"></button>
						</div>
					</form>
				</div>
			</div>
		</div>
	</section>

	<script>
		// 답한 문항 개수
	    const radioButtons = document.querySelectorAll('.btn-check');
	    const countSpan = document.querySelector('.page-count span:first-child');
	    let count = 0;
	
	    radioButtons.forEach(radioButton => {
	        radioButton.addEventListener('click', () => {
	            count = document.querySelectorAll('.btn-check:checked').length;
	            countSpan.textContent = count;
	        });
	    });
    </script>

		<!-- Bootstrap core JS-->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
    </body>
    
</html>
		