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
        <!--  --><link rel="stylesheet" href="/whou/resources/css/eduDetailStyle.css">
        <script src="https://kit.fontawesome.com/dbaea98925.js" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
    </head>
 
    <body>
        <!-- Responsive navbar-->
       <%@ include file="../header.jsp" %>        
        <section class="py-2 desc-dtl-section">
            <div class="desc-container">
                <h2 class="page-title">대학교</h2>
                <div class="desc-wrap">
                    <div class="right-wrap">
                        <nav>
                            <div class="nav nav-tabs" id="nav-tab" role="tablist">
                              <button class="nav-link active" id="nav-home-tab" data-bs-toggle="tab" data-bs-target="#nav-home" type="button" role="tab" aria-controls="nav-home" aria-selected="true">학과 개요</button>
                              <button class="nav-link" id="nav-profile-tab" data-bs-toggle="tab" data-bs-target="#nav-profile" type="button" role="tab" aria-controls="nav-profile" aria-selected="false">개설 대학</button>
                              <button class="nav-link" id="nav-contact-tab" data-bs-toggle="tab" data-bs-target="#nav-contact" type="button" role="tab" aria-controls="nav-contact" aria-selected="false">학과 전망</button>
                            </div>
                          </nav>
                          <div class="tab-content" id="nav-tabContent">
                            <div class="tab-pane fade show active edu-detail-div1" id="nav-home" role="tabpanel" aria-labelledby="nav-home-tab" tabindex="0">
                                <div class="content-item edu-detail-div2">
                                    <p class="icon-title"><i class="fa-sharp fa-solid fa-circle-chevron-right"></i>학과 설명</p>
                                    <div class="content-box">${RESULT.getSummary()}</div>
                                </div>
                                <div class="content-item edu-detail-div2">
                                    <p class="icon-title"><i class="fa-sharp fa-solid fa-circle-chevron-right"></i>흥미와 적성</p>
                                    <div class="content-box">${RESULT.getInterest()}</div>
                                </div>
                                <div class="content-item edu-detail-div2">
                                    <p class="icon-title"><i class="fa-sharp fa-solid fa-circle-chevron-right"></i>관련 자격증</p>
                                    <div class="content-box">${RESULT.getQualifications()}</div>
                                </div>
                                <div class="content-item edu-detail-div2">
                                    <p class="icon-title"><i class="fa-sharp fa-solid fa-circle-chevron-right"></i>관련 직업</p>
                                    
                                    <div class="content-box">${RESULT.getJob()}</div>
                                </div>
                                <div class="content-item edu-detail-div2">
                                    <p class="icon-title"><i class="fa-sharp fa-solid fa-circle-chevron-right"></i>졸업 후 진출 분야</p>
                                    <c:forEach items="${RESULT.getEnterFields()}" var="enterFields" varStatus="status">
                                    	<div class="content-box edu-graduate">${enterFields.getGraduate() }</div>
                                    	<div class="content-box edu-description">${enterFields.getDescription() }</div>
                                    	<br>
                                    </c:forEach>
                                </div>
                                <div class="content-item edu-detail-div2">
                                    <p class="icon-title"><i class="fa-sharp fa-solid fa-circle-chevron-right"></i>세부관련학과</p>
                                    <div class="content-box">${RESULT.getDepartment()}</div>
                                </div>
                            </div>
                            <div class="tab-pane fade edu-detail-div1" id="nav-profile" role="tabpanel" aria-labelledby="nav-profile-tab" tabindex="0">
                            	<table class="edu-detail-table">
                            		<tr>
                            			<th>지역</th>
                            			<th>대학명</th>
                            			<th>학과명</th>
                            		</tr>
                            		<c:forEach items="${RESULT.getUniversities()}" var="enterUniversities" varStatus="status">
	                            		<tr>
	                            			<td>${enterUniversities.getArea()}</td>
	                            			<td class="edu-detail-table-td"><a href="${enterUniversities.getSchoolURL()}">${enterUniversities.getSchoolName()}</a></td>
	                            			<td>${enterUniversities.getMajorName()}</td>
	                            		</tr>
                            		</c:forEach>
                            	</table>
                            </div>
                            <div class="tab-pane fade" id="nav-contact" role="tabpanel" aria-labelledby="nav-contact-tab" tabindex="0">
                            	<div class="content-item">
                                    <p class="icon-title">학과 설명</p>
                                    <div class="content-box">${RESULT.getSummary()}</div>
                                    <canvas id="doughnutChartCanvas"></canvas>
                                </div>
                            </div>
                          </div>
                    </div>
                </div>    
            </div>
        </section>
       
        <!-- Footer-->
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
        <!-- Bootstrap core JS-->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
        <script>
            const triggerTabList = document.querySelectorAll('#myTab button')
				triggerTabList.forEach(triggerEl => {
				  const tabTrigger = new bootstrap.Tab(triggerEl)
				
				  triggerEl.addEventListener('click', event => {
				    event.preventDefault()
				    tabTrigger.show()
				  })
				})
        </script>
    </body>
    
    
    <script>
    	const canvas = document.getElementById("doughnutChartCanvas");
    	const data = {
    	  labels: ["Red", "Blue", "Yellow"],
    	  datasets: [
    	    {
    	      label: "My First Dataset",
    	      data: [300, 50, 100],
    	      backgroundColor: [
    	        "rgb(255, 99, 132)",
    	        "rgb(54, 162, 235)",
    	        "rgb(255, 205, 86)",
    	      ],
    	      hoverOffset: 4,
    	    },
    	  ],
    	};
    	new Chart(canvas, {
    	  type: "doughnut",
    	  data,
    	});
    </script>
</html>
