<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
	<section class="py-2 aptitude vocation-aptitude">
		<div class="container px-5 my-5">
			<h2 class="page-title">진로검사</h2>
			<div class="row aptitude-content">
				<div class="col-lg-12 col-xl-12">
					<h3 class="page-count">
						<span>29</span> / <span>153</span>
					</h3>
					<form action="getAptitudeTestResult" method="post">
						<input type="hidden" name="qnum" value="27">
						<c:forEach items="${RESULT}" var="item">
						${item}
							<h4 class="question-title">${item.tip1Score}신체 운동능력</h4>
							<div class="top-question">
								<p class="top-q">
									${item.question}
								</p>
							</div>
							<ul class="question-wrap num">
								<li>
									<div class="question-item">
										<span class="ic-question">1</span>${item.question}생명체의 기원, 발달 및 원리 등을 연구한다.
									</div>
									<!-- 
									<div class="question-dt">
										<div class="question-dt-info">무릎 대고 팔굽혀펴기를 5회 이상 하기 어렵다.</div>
										<div class="question-dt-info">무릎 대고 팔굽혀펴기를 5회 이상 하기 어렵다.</div>
									</div>
									 -->
									<div class="btn-group radio-group" role="group"
										aria-label="Basic radio toggle button group">
										<input type="radio" class="btn-check" name="btnradio"
											id="btnradio1" autocomplete="off" checked> <label
											class="btn btn-outline-primary" for="btnradio1">1</label> <input
											type="radio" class="btn-check" name="btnradio" id="btnradio2"
											autocomplete="off"> <label
											class="btn btn-outline-primary" for="btnradio2">2</label> <input
											type="radio" class="btn-check" name="btnradio" id="btnradio3"
											autocomplete="off"> <label
											class="btn btn-outline-primary" for="btnradio3">3</label> <input
											type="radio" class="btn-check" name="btnradio" id="btnradio4"
											autocomplete="off"> <label
											class="btn btn-outline-primary" for="btnradio4">4</label> <input
											type="radio" class="btn-check" name="btnradio" id="btnradio4"
											autocomplete="off"> <label
											class="btn btn-outline-primary" for="btnradio4">5</label> <input
											type="radio" class="btn-check" name="btnradio" id="btnradio4"
											autocomplete="off"> <label
											class="btn btn-outline-primary" for="btnradio4">6</label> <input
											type="radio" class="btn-check" name="btnradio" id="btnradio4"
											autocomplete="off"> <label
											class="btn btn-outline-primary" for="btnradio4">7</label>
									</div>
								</li>
							</ul>
						</c:forEach>
						<div class="button-wrap">
							<button class="white-btn">이전</button>
							<button class="white-btn">다음</button>
						</div>
				</div>
			</div>
			</form>


		</div>
	</section>

	<!-- Bootstrap core JS-->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>

    </body>
    
</html>
