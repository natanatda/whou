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
        <section class="py-2 aptitude vocation-aptitude">
            <div class="container px-5 my-5">
                <h2 class="page-title">진로검사</h2>
                <div class="row aptitude-content">
                    <div class="col-lg-12 col-xl-12">
                    <form action="report"  method="post">
                    	<input type="hidden" name="qnum" value="${qnum}">
						<input type="hidden" name="countQ" value="${fn:length(RESULT)}">
                       <h3 class="page-count"><span>0</span> / <span>${fn:length(RESULT)}</span></h3>
	                       <c:if test="${qnum eq '21' || qnum == 21}">
		                       <h4 class="question-title">신체 운동능력</h4>
		                       <div class="top-question">
		                            <p class="top-q">기초체력을 바탕으로 효율적으로 몸을 움직이고 동작을 학습할 수 있는 능력입니다.<br>
		                                나의 신체·운동능력은 어느 정도일까요? 해당되는 번호를 선택하세요.</p>
		                       </div>
		                       <c:forEach var="item" items="${RESULT}" varStatus="status">
			                       <ul class="question-wrap num">
			                            <li>
			                                <div class="question-item"><span class="ic-question">${item.qitemNo}</span>${item.question}</div>
			                                <div class="question-dt">
			                                    <div class="question-dt-info">무릎 대고 팔굽혀펴기를 5회 이상 하기 어렵다.</div>
			                                    <div class="question-dt-info">무릎 대고 팔굽혀펴기를 5회 이상 하기 어렵다.</div>
			                                </div>
			                                <div class="btn-group radio-group" role="group" aria-label="Basic radio toggle button group">
			                                    <input type="radio" class="btn-check" name="btnradio${status.index + 1}" id="btnradio${status.index * 7 + 1}" value="1" autocomplete="off" >
			                                    <label class="btn btn-outline-primary" for="btnradio${status.index * 7 + 1}">1</label>
			                                  
			                                    <input type="radio" class="btn-check" name="btnradio${status.index + 1}" id="btnradio${status.index * 7 + 2}" value="2" autocomplete="off">
			                                    <label class="btn btn-outline-primary" for="btnradio${status.index * 7 + 2}">2</label>
			                                  
			                                    <input type="radio" class="btn-check" name="btnradio${status.index + 1}" id="btnradio${status.index * 7 + 3}" value="3" autocomplete="off">
			                                    <label class="btn btn-outline-primary" for="btnradio${status.index * 7 + 3}">3</label>
			
			                                    <input type="radio" class="btn-check" name="btnradio${status.index + 1}" id="btnradio${status.index * 7 + 4}" value="4" autocomplete="off">
			                                    <label class="btn btn-outline-primary" for="btnradio${status.index * 7 + 4}">4</label>
			                                    
			                                    <input type="radio" class="btn-check" name="btnradio${status.index + 1}" id="btnradio${status.index * 7 + 5}" value="5" checked autocomplete="off">
			                                    <label class="btn btn-outline-primary" for="btnradio${status.index * 7 + 5}">5</label>
			
			                                    <input type="radio" class="btn-check" name="btnradio${status.index + 1}" id="btnradio${status.index * 7 + 6}" value="6" autocomplete="off">
			                                    <label class="btn btn-outline-primary" for="btnradio${status.index * 7 + 6}">6</label>
			
			                                    <input type="radio" class="btn-check" name="btnradio${status.index + 1}" id="btnradio${status.index * 7 + 7}" value="7" autocomplete="off">
			                                    <label class="btn btn-outline-primary" for="btnradio${status.index * 7 + 7}">7</label>
			                                  </div>
			                            </li>
			                       </ul>
		                       </c:forEach>
	                       </c:if>
	                       
	                        <c:if test="${qnum eq '31' || qnum == 31}">
		                       <h4 class="question-title">신체 운동능력</h4>
		                       <div class="top-question">
		                            <p class="top-q">기초체력을 바탕으로 효율적으로 몸을 움직이고 동작을 학습할 수 있는 능력입니다.<br>
		                                나의 신체·운동능력은 어느 정도일까요? 해당되는 번호를 선택하세요.</p>
		                       </div>
		                       <c:forEach var="item" items="${RESULT}" varStatus="status">
			                       <ul class="question-wrap">
			                            <li>
			                                <div class="question-item"><span class="ic-question">${item.qitemNo}</span>${item.question}</div>			                         
			                                <div class="btn-group radio-group" role="group" aria-label="Basic radio toggle button group">
			                                    <input type="radio" class="btn-check" name="btnradio${status.index + 1}" id="btnradio${status.index * 4 + 1}" checked value="1" autocomplete="off">
			                                    <label class="btn btn-outline-primary" for="btnradio${status.index * 4 + 1}">${item.answer01 }</label>
			                                  
			                                    <input type="radio" class="btn-check" name="btnradio${status.index + 1}" id="btnradio${status.index * 4 + 2}" value="2" autocomplete="off">
			                                    <label class="btn btn-outline-primary" for="btnradio${status.index * 4 + 2}">${item.answer02 }</label>
			                                  
			                                    <input type="radio" class="btn-check" name="btnradio${status.index + 1}" id="btnradio${status.index * 4 + 3}" value="3" autocomplete="off">
			                                    <label class="btn btn-outline-primary" for="btnradio${status.index * 4 + 3}">${item.answer03 }</label>
			
			                                    <input type="radio" class="btn-check" name="btnradio${status.index + 1}" id="btnradio${status.index * 4 + 4}" value="4" autocomplete="off">
			                                    <label class="btn btn-outline-primary" for="btnradio${status.index * 4 + 4}">${item.answer04 }</label>
			                                  </div>
			                            </li>
			                       </ul>
		                       </c:forEach>
	                       </c:if>
                       <div class="button-wrap">
                            <button class="white-btn">이전</button>
                            <button class="white-btn">다음</button>
                            <input type="submit" class="white-btn" value="완료"/>
                       </div>
                	</form>
                    </div>
                </div>
            </div>
        </section>
       <script>
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
