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
        <script src="https://kit.fontawesome.com/dbaea98925.js" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
        <script src="https://code.jquery.com/jquery-3.7.0.min.js" ></script>
        <script src="/whou/resources/js/ai.js"></script>
        <link rel="stylesheet" href="/whou/resources/css/style.css">
    </head>
    
	<input type="hidden" id="majorSeq" value="${seq}">
    <script>
		var seq = document.getElementById('majorSeq').value;
		if (seq === null || seq === '') {
			alert('잘못된 접근입니다.');
			location.href = "majorList";
		}
	</script>
	
    <body>
        <!-- Responsive navbar-->
       <%@ include file="../header.jsp" %>        
        <section class="py-2 desc-dtl-section">
            <div class="desc-container" style="margin:auto 100px;">
                <h2 class="page-title">대학교</h2>
                <div class="desc-wrap">
                    <div class="right-wrap" style="width:100%;">
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
                                    <p class="icon-title">학과 설명</p>
                                    <div class="content-box">${RESULT.getSummary()}</div>
                                </div>
                                <div class="content-item edu-detail-div2">
                                    <p class="icon-title">흥미와 적성</p>
                                    <div class="content-box">${RESULT.getInterest()}</div>
                                </div>
                                <div class="content-item edu-detail-div2">
                                    <p class="icon-title">관련 자격증</p>
                                    <div class="content-box">${RESULT.getQualifications()}</div>
                                </div>
                                <div class="content-item edu-detail-div2">
                                    <p class="icon-title">관련 직업</p>
                                    
                                    <div class="content-box">${RESULT.getJob()}</div>
                                </div>
                                <div class="content-item edu-detail-div2">
                                    <p class="icon-title">졸업 후 진출 분야</p>
                                    <c:forEach items="${RESULT.getEnterFields()}" var="enterFields" varStatus="status">
                                    	<div class="content-box edu-graduate">${enterFields.getGraduate() }</div>
                                    	<div class="content-box edu-description">${enterFields.getDescription() }</div>
                                    	<br>
                                    </c:forEach>
                                </div>
                                <div class="content-item edu-detail-div2">
                                    <p class="icon-title">세부관련학과</p>
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
	                            			<td class="edu-detail-table-td"><a href="${enterUniversities.getSchoolURL()}" target="_blank">${enterUniversities.getSchoolName()}</a></td>
	                            			<td>${enterUniversities.getMajorName()}</td>
	                            		</tr>
                            		</c:forEach>
                            	</table>
                            </div>
                            <div class="tab-pane fade" id="nav-contact" role="tabpanel" aria-labelledby="nav-contact-tab" tabindex="0">
                            	<div class="content-item">
                            	
                                   	<canvas id="applicantChartCanvas" style="width:1200px; height:450px; padding:30px;"></canvas>
                            	
                                   	<div class="d-flex">
										<canvas id="fieldChartCanvas" style="width:800px; height:500px; padding:30px;"></canvas>
										<canvas id="salaryChartCanvas" style="width:800px; height:500px; padding:30px;"></canvas>
                                   	</div>
                                </div>
							<span>*자료 출처 : 커리어넷 </span>
                            </div>
                          </div>
                    </div>
                </div>    
            </div>
            <%@ include file="../aiChatBot.jsp" %>
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
    
   	<!-- Spring에서 넘겨준 모델 변수 사용 chartData로 사용 -->
   	<script>
	    var fieldLabel = [
	        <c:forEach items="${fieldItemList}" var="item" varStatus="status">
	            '${item}'<c:if test="${not status.last}">,</c:if>
	        </c:forEach>
	    ];
	    var fieldData = [
	        <c:forEach items="${fieldDataList}" var="item" varStatus="status">
	            '${item}'<c:if test="${not status.last}">,</c:if>
	        </c:forEach>
	    ];
	 	// 문자열 요소들을 숫자로 변환
	    for (var i = 0; i < fieldData.length; i++) {
	        fieldData[i] = parseFloat(fieldData[i]);
	        // 또는 parseFloat()를 사용하면 소수점이 있는 숫자로 변환할 수도 있습니다.
	    }
	    
	    var salaryLabel = [
	        <c:forEach items="${salaryItemList}" var="item" varStatus="status">
	            '${item}'<c:if test="${not status.last}">,</c:if>
	        </c:forEach>
	    ];
	    var salaryData = [
	        <c:forEach items="${salaryDataList}" var="item" varStatus="status">
	            '${item}'<c:if test="${not status.last}">,</c:if>
	        </c:forEach>
	    ];
	 	// 문자열 요소들을 숫자로 변환
	    for (var i = 0; i < salaryData.length; i++) {
	    	salaryData[i] = parseFloat(salaryData[i]);
	        // 또는 parseFloat()를 사용하면 소수점이 있는 숫자로 변환할 수도 있습니다.
	    }
	    
	    var applicantLabel = [
	        <c:forEach items="${applicantItemList}" var="item" varStatus="status">
	            '${item}'<c:if test="${not status.last}">,</c:if>
	        </c:forEach>
	    ];
	    var applicationData = [
	        <c:forEach items="${applicantDataList}" var="item" varStatus="status">
	            '${item}'<c:if test="${not status.last}">,</c:if>
	        </c:forEach>
	    ];
	 	// 문자열 요소들을 숫자로 변환
	    for (var i = 0; i < applicationData.length; i++) {
	    	applicationData[i] = parseFloat(applicationData[i]);
	        // 또는 parseFloat()를 사용하면 소수점이 있는 숫자로 변환할 수도 있습니다.
	    }
	 	
	 	//색상 랜덤 배정
	    function randomColor(usedColors) {
	    	  const letters = "0123456789ABCDEF";
	    	  let color = "#";
	    	  do {
	    	    for (let i = 0; i < 6; i++) {
	    	      color += letters[Math.floor(Math.random() * 16)];
	    	    }
	    	  } while (usedColors.includes(color));
	    	  
	    	  usedColors.push(color);
	    	  return color;
	    	}
	 	
	 	
	    function getSpecificColor(index) {
	    	  const colors = [
	    		  '#FF6D60', '#F7D060', '#F3E99F', '#98D8AA',
	    		  '#3AA6B9', '#F0F0F0', '#F9D949', '#F45050',
	    		  '#F7C8E0', '#DFFFD8', '#B4E4FF', '#95BDFF',
	    		  '#6F69AC', '#95DAC1', '#C56183',
	    	  ];
	    	  return colors[index % colors.length]; // 인덱스에 따라서 색상을 반복해서 사용합니다.
		}
   	</script>
   	
   	
    
    <script>
		const canvas3 = document.getElementById("applicantChartCanvas");
    	const data3 = {
    	    	  labels: applicantLabel,
    	    	  datasets: [
    	    	    {
    	    	      label: "입학 상황",
    	    	      data: applicationData,
    	    	      backgroundColor: Array.from({ length: salaryData.length }, () => randomColor([])), // 무작위 색상을 5000개 생성하여 배열로 설정,
    	    	      backgroundColor: [
    	    	        "rgb(255, 99, 132)",
    	    	        "rgb(54, 162, 235)",
    	    	      ],
    	    	      hoverOffset: 4,
    	    	    },
    	    	  ],
    	    	};
    	const options3 = {
    			responsive: false,
    			plugins: {
    				title: {
    					display: true,
    					position: 'top',
    					text: '입학 상황',
    					font: { size: 20, weight: 'bold' },
    					},
    			    legend: {
    			    	display:false,
    			    	position: 'bottom',
    			    	},
				},
		};

		new Chart(canvas3, {
			type: "bar",
			data: data3,
			options: options3,
		});
		
		
		
    	const canvas1 = document.getElementById("fieldChartCanvas");
    	const data1 = {
    	  labels: fieldLabel,
    	  datasets: [
    	    {
    	      label: "졸업 후 첫 직업분야",
    	      data: fieldData,
    	      backgroundColor: Array.from({ length: fieldData.length }, (_, index) => getSpecificColor(index)), // 무작위 색상을 5000개 생성하여 배열로 설정,
    	      /*backgroundColor: [
    	        "rgb(255, 99, 132)",
    	        "rgb(54, 162, 235)",
    	        "rgb(255, 205, 86)",
    	      ],*/
    	      hoverOffset: 4,
    	    },
    	  ],
    	};
    	const options1 = {
    			responsive: false,
    			plugins: {
    				title: {
    					display: true,
    					position: 'top',
    					text: '졸업 후 첫 직업분야',
    					font: { size: 20, weight: 'bold' },
    					},
   					legend: {
   						position: 'bottom',
   						},
				},
		};

		new Chart(canvas1, {
			type: "doughnut",
			data: data1,
			options: options1,
		});
    	
    	
    	
    	const canvas2 = document.getElementById("salaryChartCanvas");
    	const data2 = {
    	    	  labels: salaryLabel,
    	    	  datasets: [
    	    	    {
    	    	      label: "졸업 후 첫 직장 월평균 임금",
    	    	      data: salaryData,
    	    	      backgroundColor: Array.from({ length: salaryData.length }, (_, index) => getSpecificColor(index)), // 무작위 색상을 5000개 생성하여 배열로 설정,
    	    	      /*backgroundColor: [
    	    	        "rgb(255, 99, 132)",
    	    	        "rgb(54, 162, 235)",
    	    	        "rgb(255, 205, 86)",
    	    	      ],*/
    	    	      hoverOffset: 4,
    	    	    },
    	    	  ],
    	    	};
    	const options2 = {
    			responsive: false,
    			plugins: {
    				title: {
    					display: true,
    					position: 'top',
    					text: '졸업 후 첫 직장 월평균 임금',
    					font: { size: 20, weight: 'bold' },
    					},
    			    legend: {
    			    	position: 'bottom',
    			    	},
				},
		};

		new Chart(canvas2, {
			type: "doughnut",
			data: data2,
			options: options2,
		});
		
		
    </script>
</html>
