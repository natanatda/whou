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
        <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
        <script src="https://code.jquery.com/jquery-3.7.0.min.js" ></script>
        <!-- three.js -->
        <script src="https://cdnjs.cloudflare.com/ajax/libs/three.js/r128/three.min.js" integrity="sha512-dLxUelApnYxpLt6K2iomGngnHO83iUvZytA3YjDUCjT0HDOHKXnVYdf3hU4JjM8uEhxf9nD1/ey98U3t2vZ0qQ==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
		<script src="/whou/resources/js/unpkg.com_gsap@3.12.1_dist_gsap.min.js"></script>
		<script src="/whou/resources/js/ThreeCSG.js"></script>
		<script src="https://unpkg.com/three@0.128.0/examples/js/controls/OrbitControls.js"></script>
		<script type="module" src="/whou/resources/js/whouModel.js?ver=1"></script>
		<script src="/whou/resources/js/ai.js"></script>	
		
		<!--  kakao share API -->
		<script src="https://t1.kakaocdn.net/kakao_js_sdk/2.3.0/kakao.min.js"
		integrity="sha384-70k0rrouSYPWJt7q9rSTKpiTfX6USlMYjZUtr1Du+9o4cGvhPAWxngdtVZDdErlh" crossorigin="anonymous"></script>
		<script>
		  Kakao.init('275aa3989621eb23a0f9f8e416aeb814'); // 사용하려는 앱의 JavaScript 키 입력
		</script>
    </head>

 <style>

 	.share-bt{
        padding: 20px 0px;
	    font-weight: 600;
	    margin: 10px 20px;
	    width: 200px;
	    border-radius: 0.3rem;
 	}
 	.share-bt:first-child{background-color:#F9D949; color:#;}
 	.share-bt:last-child{background-color:#61677A; color:#fff;}
 	.modal-body {
	    display: flex;
	    justify-content: center;
	}

  
    @media print {
     html, body { -webkit-print-color-adjust:exact; width: 210mm; height: 297mm; } 
    .page-title, .left-wrap{display:none;}
    }
 </style>
    <body>
    <c:set var="workList" value="${jobDetail.workList}" />
    <c:set var="BaseInfo" value="${jobDetail.baseInfo}" />
    <c:set var="Depart" value="${jobDetail.departList}" />
    <c:set var="certiList" value="${jobDetail.certiList}" />
    <c:set var="abilityList" value="${jobDetail.abilityList}" />
    <c:set var="aptitudeList" value="${jobDetail.aptitudeList}" />
    <c:set var="interestList" value="${jobDetail.interestList}" />
    <c:set var="researchList" value="${jobDetail.researchList}" />
    <c:set var="relJinSol" value="${jobDetail.relJinSol}" />
    <c:set var="JobReady" value="${jobDetail.jobReady}" />
    <c:set var="jobRelOrg" value="${jobDetail.jobRelOrg}" />
    <c:set var="forecast" value="${jobDetail.forecast}" />
    <c:set var="eduChart" value="${jobDetail.eduChart}" />
    <c:set var="majorChart" value="${jobDetail.majorChart}" />
    <c:set var="indicatorChart" value="${jobDetail.indicatorChart}" />
    <c:set var="performList" value="${jobDetail.perform.perform_}" />
    <c:set var="knowledge" value="${jobDetail.perform.knowledge}" />
    <c:set var="environment" value="${jobDetail.perform.environment}" />
        <!-- Responsive navbar-->
       <%@ include file="../header.jsp" %>  
       <c:if test="${slide == null}">
          <div class="ai-wrap active">
			<div>
	       		<canvas class="webgl"></canvas>
	       	</div> 
	       	<div class="job_info-sd">
	       		<h3>${BaseInfo.job_nm}</h3>
						<div>&middot; ${workList[0].work}</div>
			</div>
	       	<button onclick="checkAndClose()"><i class="fa-solid fa-angles-right fa-2xl" style="color:#fff;"></i></button>
	       </div>  
       </c:if>    
    
       
       
        <section class="py-2 desc-dtl-section">
            <div class="desc-container" id="desc">
                <h2 class="page-title">직업백과</h2>
                <div class="desc-wrap">
                    <div class="left-wrap">
                        <h5>${BaseInfo.job_nm}</h5>
                        <ul class="desc-icon-box">
                        	<c:if test="${contain}">
	                            <li onclick="return bookCheck(${BaseInfo.job_cd},1)"><i class="fa-solid fa-star" style="color: purple;"></i></li>
                        	</c:if>
                        	<c:if test="${!contain}">
	                            <li onclick="return bookCheck(${BaseInfo.job_cd},0)"><i class="fa-regular fa-star" style="color: #5c5c5c;"></i></li>
                        	</c:if>
                            <li onclick="showShareOptions()"><i class="fa-solid fa-share-nodes" style="color: #5c5c5c;"></i></li>
                            <li class="print-btn"><i class="fa-solid fa-print" style="color: #5c5c5c;"></i></li>
                        </ul>
                            <c:if test="${BaseInfo.wage != null}">
		                        <div class="d-flex">
		                            <div class="desc-item">
		                                <i class="fa-regular fa-credit-card" style="color: #4d4d4d;"></i>
		                                <span>평균연봉</span>
		                            </div>
			                            <div>${BaseInfo.wage} 만원</div>
		                        </div>
                            </c:if>
                            <c:if test="${BaseInfo.wlb != null}">
		                        <div class="d-flex">
		                            <div class="desc-item">
		                                <i class="fa-solid fa-house" style="color: #4d4d4d;"></i>
		                                <span>일&middot;가정균형</span>
		                            </div>
		                            <div>${BaseInfo.wlb}</div>
		                        </div>
		                   </c:if>
		                   <c:if test="${BaseInfo.social != null}">
		                        <div class="d-flex">
		                            <div class="desc-item">
		                                <i class="fa-solid fa-users" style="color: #4d4d4d;"></i>
		                                <span>사회공헌</span>
		                            </div>
		                            <div>${BaseInfo.social}</div>
		                        </div>
	                        </c:if>
                    </div>
                    <div class="right-wrap">
                        <nav>
                            <div class="nav nav-tabs" id="nav-tab" role="tablist">
                              <button class="nav-link active" id="nav-home-tab" data-bs-toggle="tab" data-bs-target="#nav-home" type="button" role="tab" aria-controls="nav-home" aria-selected="true">직업개요</button>
                              <button class="nav-link" id="nav-profile-tab" data-bs-toggle="tab" data-bs-target="#nav-profile" type="button" role="tab" aria-controls="nav-profile" aria-selected="false">직업탐색 및 준비</button>
                              <button class="nav-link" id="nav-contact-tab" data-bs-toggle="tab" data-bs-target="#nav-contact" type="button" role="tab" aria-controls="nav-contact" aria-selected="false">직업현황 및 자료</button>
                              <button class="nav-link" id="nav-disabled-tab" data-bs-toggle="tab" data-bs-target="#nav-disabled" type="button" role="tab" aria-controls="nav-disabled" aria-selected="false">능력/ 지식/ 환경</button>
                            </div>
                          </nav>
                          <div class="tab-content" id="nav-tabContent">
                            <div class="tab-pane fade show active" id="nav-home" role="tabpanel" aria-labelledby="nav-home-tab" tabindex="0">
	                            <c:if test="${BaseInfo.rel_job_nm != null}"> 
	                                <div class="content-item">
	                                    <p class="icon-title">관련 직업명</p>
	                                    <div class="content-box">${BaseInfo.rel_job_nm}</div>
	                                </div>
                                </c:if>   
                                <div class="content-item">
                                    <p class="icon-title">관련 학과 및 관련 자격</p>
                                    <p class="semi-title">﻿ο 관련 학과</p>
                                    <div class="content-box">
	                                    <c:forEach var="depart" items="${Depart}">
										    ${depart.depart_name}
										</c:forEach>
									</div>
									<p class="semi-title">﻿ο 관련 자격</p>
                                    <div class="content-box">
										<c:forEach var="Certi" items="${certiList}">
										    <a href="${Certi.link}">${Certi.certi}${Certi.link}</a>
										</c:forEach>
                                    </div>
								</div>
                                <div class="content-item">
                                    <p class="icon-title">하는일</p>
                                    <div class="content-box">
										<c:forEach var="work" items="${workList}">
											<div style="margin-bottom: 4px;">• ${work.work}</div>
										</c:forEach>
                                    </div>
                                </div>
                                <div class="content-item">
                                    <p class="icon-title">핵심능력</p>
                                    <div class="content-box">
										<c:forEach var="Ability" items="${abilityList}">
										    ${Ability.ability_name}</br>
										</c:forEach>
                                    </div>
                                </div>
                                <div class="content-item">
                                    <p class="icon-title">적성 및 흥미</p>
                                    <p class="semi-title">﻿ο 적성</p>
                                    <div class="content-box">
										<c:forEach var="Aptitude" items="${aptitudeList}">
										    • ${Aptitude.aptitude}</br>
										</c:forEach>
                                    </div>
                                    <p class="semi-title">﻿ο 흥미</p>
                                    <div class="content-box">
										<c:forEach var="Interest" items="${interestList}">
										    • ${Interest.interest}</br>
										</c:forEach>
                                    </div>
                                </div>
                                <div class="content-item">
                                 <p class="icon-title">핵심능력</p>
                                 <div class="content-box">${BaseInfo.tag}</div>
                            	</div>
                            </div>
                            <div class="tab-pane fade" id="nav-profile" role="tabpanel" aria-labelledby="nav-profile-tab" tabindex="0">
								<div class="content-item">
                                    <p class="icon-title">직업탐색</p>
                                    <p class="semi-title">﻿﻿﻿﻿ο 진로 탐색 활동</p>
                                    <div class="content-box">
										<c:forEach var="Research" items="${researchList}">
											<c:if test="${Research != null}">
										    	<div style="margin-bottom: 4px;">• ${Research.research}</div>
											</c:if>
										</c:forEach>
                                    </div>
                                </div>
                                <div class="content-item">
                                    <p class="icon-title">준비방법</p>
                                    <p class="semi-title">﻿﻿﻿﻿ο 정규교육과정</p>
                                    <div class="content-box">
										<c:forEach var="Curriculum" items="${JobReady.curriculum}">
										    <div style="margin-bottom: 4px;">• ${Curriculum.curriculum}</div>
										</c:forEach>
                                    </div>
									<c:forEach var="Training" items="${JobReady.training}">
	                                    <c:if test="${Training.training != null}">
		                                    <p class="semi-title">﻿﻿﻿﻿ο 직업훈련</p>
		                                    <div class="content-box">
												    <div style="margin-bottom: 4px;">• ${Training.training}</div>
		                                    </div>
	                                    </c:if>
									</c:forEach>
									<c:forEach var="Certificate" items="${JobReady.certificate}">
	                                    <c:if test="${Certificate.certificate != null}">
	                                    	<p class="semi-title">﻿﻿﻿﻿ο 관련 자격증</p>
		                                    <div class="content-box">
												    <div style="margin-bottom: 4px;">• ${Certificate.certificate}</div>
		                                    </div>
	                                    </c:if>
									</c:forEach>
                                    <p class="semi-title">﻿﻿﻿﻿ο 입직 및 취업방법 </p>
                                    <div class="content-box">
										<c:forEach var="Recruit" items="${JobReady.recruit}">
										    <div style="margin-bottom: 4px;">• ${Recruit.recruit}</div>
										</c:forEach>
                                    </div>
                                </div>
                                <div class="content-item">
                                    <p class="icon-title">관련기관</p>
                                    <div class="content-box">
										<c:forEach var="JobRelOrg" items="${jobRelOrg}">
										    • ${JobRelOrg.rel_org} <a href="${JobRelOrg.rel_org_url}">${JobRelOrg.rel_org_url}</a></br>
										</c:forEach>
                                    </div>
                                </div>
							</div>
                            <div class="tab-pane fade" id="nav-contact" role="tabpanel" aria-labelledby="nav-contact-tab" tabindex="0">
                            	<div class="content-item">
                                    <p class="icon-title">직업현황</p>
                                    <p class="semi-title">﻿﻿﻿﻿ο 직업전망</p>
                                    <div class="content-box">
										<c:forEach var="Forecast" items="${forecast}">
										    ${Forecast.forecast}</br>
										</c:forEach>
                                    </div>
                                    <c:if test="${BaseInfo.wage != null}">
	                                    <p class="semi-title">﻿﻿﻿﻿ο 임금수준 및 직업만족도</p>
	                                    <div class="flex-box">
		                                    <div class="content-box" style="width:150px">
		                                    	<p style="font-weight: 600;">평균 연봉</p>
		                                    	<p style="font-weight: 600; color:green;">${BaseInfo.wage} 만원</p>
		                                    </div>
		                                    <div>
												${BaseInfo.wage_source}
		                                    </div>
	                                    </div>
                                    </c:if>
                                    <c:if test="${BaseInfo.satisfication != 0.0}">
	                                    <div class="flex-box">
		                                    <div class="content-box" style="width:150px">
		                                    	<p style="font-weight: 600;">직업 만족도</p>
												<p style="font-weight: 600; color:green;">${BaseInfo.satisfication} %</p>
											</div>
			                                <div>	
												${BaseInfo.satisfi_source}
		                                    </div>
	                                    </div>
                                    </c:if>
	                                    <p class="semi-title">﻿﻿﻿﻿ο 학력분포 및 전공계열</p>
	                                   	<div class="flex-box">                                   	
		                                    <div class="content-box">
			                                    <c:forEach var="EduChart" items="${eduChart}">
													<c:set var="chart_name" value="${EduChart.chart_name.split(',')}"/>
													<c:set var="chart_data" value="${EduChart.chart_data.split(',')}"/>
														<c:forEach var="name" items="${chart_name}" varStatus="status">
													    </c:forEach>
													    <div>
													    	<c:if test="${EduChart.chart_data != '0,0,0,0,0,0'}">
						                                    	<p style="text-align:center; font-weight: 400;">학력분포</p>
													    		<canvas id="EduChart" width="400" height="400"></canvas>
													    	</c:if>
													    </div>
													    ${EduChart.source}
												</c:forEach>
		                                    </div>
		                                    <div class="content-box">
												<c:forEach var="MajorChart" items="${majorChart}">
													<c:set var="major" value="${MajorChart.major.split(',')}"/>
													<c:set var="major_data" value="${MajorChart.major_data.split(',')}"/>
														<c:forEach var="major" items="${major}" varStatus="status">
													    </c:forEach>
													    <div>
													    	<c:if test="${MajorChart.major_data != '0,0,0,0,0,0,0'}">
						                                    	<p style="text-align:center; font-weight: 400;">전공계열</p>
														    	<canvas id="MajorChart" width="400" height="400"></canvas>
													    	</c:if>
													    </div>
													    ${MajorChart.source}
												</c:forEach>
		                                    </div>
	                                    </div>
                                </div>
                                <div class="content-item">
                                    <c:forEach var="IndicatorChart" items="${indicatorChart}">
                                    <c:if test="${IndicatorChart.indicator_data != '0.0,0.0,0.0,0.0,0.0,0.0,0.0'}">
									    <p class="icon-title">한국의 직업지표</p>
									    <canvas id="IndicatorChart" width="400" height="200"></canvas>
									    ${IndicatorChart.source}
									</c:if>
									</c:forEach>
                                </div>
                            </div>
                            <div class="tab-pane fade" id="nav-disabled" role="tabpanel" aria-labelledby="nav-profile-tab" tabindex="0">
		                           	<p class="icon-title">업무수행능력</p>
		                           	<div class="content-item ">
		                           		<div class="table-wrap desc-table">
									        <table>
									            <tr>
									                <th>중요도</th>
									                <th>능력명</th>
									                <th>설명</th>
									            </tr>
					                            <c:forEach var="perform" items="${performList}" varStatus="status">
									                <tr>
									                    <td>${perform.importance}</td>
									                    <td>${perform.perform}</td>
									                    <td>${perform.inform}</td>
									                </tr>
						                         </c:forEach>
									        </table>
									    </div>
									    <c:forEach var="perform" items="${performList}" varStatus="status">
										    <c:if test="${status.last}">
										        ${perform.source}
										    </c:if>
										</c:forEach>
									</div>
								    <p class="icon-title">지식중요도</p>
		                           	<div class="content-item ">
		                           		<div class="table-wrap desc-table">
				                           	<table>
									            <tr>
									                <th>중요도</th>
									                <th>능력명</th>
									                <th>설명</th>
									            </tr>
									            <c:forEach var="k" items="${knowledge}" varStatus="status">
									                <tr>
									                    <td>${k.importance}</td>
									                    <td>${k.knowledge}</td>
									                    <td>${k.inform}</td>
									                </tr>
									            </c:forEach>
									        </table>
								     	</div>
		                                <c:forEach var="k" items="${knowledge}" varStatus="status">
										    <c:if test="${status.last}">
										        ${k.source}
										    </c:if>
										</c:forEach>
		                            </div>
		                            <p class="icon-title">업무환경</p>
		                            <div class="content-item ">
		                           		<div class="table-wrap desc-table">
				                           	<table>
									            <tr>
									                <th>중요도</th>
									                <th>능력명</th>
									                <th>설명</th>
									            </tr>
									            <c:forEach var="E" items="${environment}" varStatus="status">
									                <tr>
									                    <td>${E.importance}</td>
									                    <td>${E.environment}</td>
									                    <td>${E.inform}</td>
									                </tr>
									            </c:forEach>
									        </table>
								     	</div>
		                                <c:forEach var="E" items="${environment}" varStatus="status">
										    <c:if test="${status.last}">
										        ${E.source}
										    </c:if>
										</c:forEach>
		                            </div>
	                         </div>
                          </div>
                    </div>
                </div>    
            </div>
            <%@ include file="../aiChatBot.jsp" %>
        </section>
        
        <!-- Modal -->
        <div class="modal fade" id="shareModal" tabindex="-1" aria-labelledby="shareModalLabel" aria-hidden="true">
		  <div class="modal-dialog">
		    <div class="modal-content">
		      <div class="modal-header">
		        <h5 class="modal-title" id="shareModalLabel">공유 옵션</h5>
		        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
		      </div>
		      <div class="modal-body">
		        <button class="share-bt" onclick="shareKakao()">카카오톡으로 공유하기</button>
		        <button class="share-bt" onclick="copyUrl()">URL 복사</button>
		      </div>
		    </div>
		  </div>
		</div>
       
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
	      var aiWrapElement = document.querySelector('.ai-wrap');
	      var body = document.querySelector('body');
	        if(aiWrapElement.classList.contains('active')){
		      	body.style.overflowY = 'hidden';
		      }
        
	        function checkAndClose() {
	      	  var aiWrapElement = document.querySelector('.ai-wrap');
	        	var body = document.querySelector('body');
	      	    aiWrapElement.style.transition = 'max-width 0.5s ease-out'; // 슬라이드 애니메이션 설정
	      	    aiWrapElement.style.maxWidth = '0'; // 요소를 왼쪽으로 슬라이드하여 사라지게 함
	      	  	
		      	body.style.overflowY = 'auto';
		
	      	    setTimeout(function() {
	      	    aiWrapElement.style.display = 'none'; //  alert(aiWrapElement.style.display);
	      	    }, 500); // 0.5초(500ms) 후에 요소를 숨김 (transition 속성과 동일한 시간)
	      	  
	      	}
	


	   
        </script>
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
        <script>
        const memId = "${memId}";
        function idCheck() {
    		if (memId == '') {
    			if (confirm("로그인 후 등록할 수 있습니다.\n로그인 화면으로 이동하시겠습니까?")== true) {
    				location.href ='/whou/member/login';
    		    } else {
    		    	return false;
    		    }
    		}else if(memId != null){
    			return true;
    		}
    	}
        function bookCheck(job_cd,num) {
    		if(idCheck()){
    			location.href ='/whou/member/bookmark?job_cd='+job_cd+'&contain='+num;
    		}
    		
    	}
        </script>
        <script>
	        const ctx = document.getElementById('IndicatorChart');
	        var data = ${indicatorData};
	        var colors = ['rgba(230, 99, 132, 1)', 'rgba(54, 140, 235, 1)', 'rgba(255, 206, 86, 1)', 'rgba(75, 192, 192, 1)', 'rgba(153, 102, 255, 1)', 'rgba(255, 159, 64, 1)', 'rgba(270, 180, 230, 1)'];
			console.log(data);
	        // 막대형 차트 생성
	        var IndicatorChart = new Chart(ctx, {
	            type: 'bar',
	            data: {
	                labels: ['융합성', '대인관계', '창의성', '일가정균형', '소득수준', '고용유지', '사회공헌'],
	                datasets: [{
	                    data: data,
	                    backgroundColor: colors,
	                    borderColor: colors,
	                    borderWidth: 1
	                }]
	            },
	            options: {
	                scales: {
	                    y: {
	                        beginAtZero: true
	                    }
	                },
		            plugins:{
		                legend: {
		                    display: false
		                },
		            }
	            }
	        });
	    </script>
	    <script>
	        const ctx2 = document.getElementById('MajorChart');
	        var data2 = ${majorData};
	        var colors2 = ['rgba(230, 99, 132, 1)', 'rgba(54, 140, 235, 1)', 'rgba(255, 206, 86, 1)', 'rgba(270, 180, 230, 1)', 'rgba(153, 102, 255, 1)', 'rgba(255, 159, 64, 1)', 'rgba(75, 192, 192, 1)'];
			console.log(data2);
	        // 원형 차트 생성
	        var MajorChart = new Chart(ctx2, {
	        	type: 'pie',
	        	data: {
	                labels: ['인문계열', '사회계열', '교육계열', '공학계열', '자연계열', '의학계열', '예체능계열'],
	                datasets: [{
	                    data: data2,
	                    backgroundColor: colors2,
	                    borderColor: colors2,
	                    borderWidth: 1
	                }]
	            },
	            options: {
	                responsive: false,
	                maintainAspectRatio: true, //true 하게 되면 캔버스 width,height에 따라 리사이징된다.
	                legend: {
	                    position: 'bottom',
	                    fontColor: 'black',
	                    align: 'center',
	                    display: true,
	                    fullWidth: true,
	                    labels: {
	                        fontColor: 'rgb(0, 0, 0)'
	                    }
	                },
	                plugins: {
	                    labels: {//두번째 script태그를 설정하면 각 항목에다가 원하는 데이터 라벨링을 할 수 있다.
	                        render: 'value',
	                        fontColor: 'black',
	                        fontSize: 15,
	                        precision: 2
	                    }

	                }
	            }
	        });
	    </script>
	    <script>
	        const ctx3 = document.getElementById('EduChart');
	        var data3 = ${eduData};
	        var colors3 = ['rgba(230, 99, 132, 1)', 'rgba(54, 140, 235, 1)', 'rgba(255, 206, 86, 1)', 'rgba(270, 180, 230, 1)', 'rgba(153, 102, 255, 1)', 'rgba(255, 159, 64, 1)'];
			console.log(data3);
	        // 원형 차트 생성
	        var EduChart = new Chart(ctx3, {
	        	type: 'pie',
	        	data: {
	                labels: ['중졸이하', '고졸', '전문대졸', '대졸', '대학원졸', '박사졸'],
	                datasets: [{
	                    data: data3,
	                    backgroundColor: colors3,
	                    borderColor: colors3,
	                    borderWidth: 1
	                }]
	            },
	            options: {
	                responsive: false,
	                maintainAspectRatio: true, //true 하게 되면 캔버스 width,height에 따라 리사이징된다.
	                legend: {
	                    position: 'bottom',
	                    fontColor: 'black',
	                    align: 'center',
	                    display: true,
	                    fullWidth: true,
	                    labels: {
	                        fontColor: 'rgb(0, 0, 0)'
	                    }
	                },
	                plugins: {
	                    labels: {//두번째 script태그를 설정하면 각 항목에다가 원하는 데이터 라벨링을 할 수 있다.
	                        render: 'value',
	                        fontColor: 'black',
	                        fontSize: 15,
	                        precision: 2
	                    }

	                }
	            }
	        });
	        
	    
	   
	    </script>
	    <%-- 모델 --%>
	    <script>
		 	var modelCamera_x = ${model.camera};
		 	var modelCamera_y = 2;
		 	var modelCamera_z = 9;
		 	var modelPath = '../resources/whouModel/${model.path_folder}/${model.path_gltf}';
		 	
		 	var modelWidth = 1000;
        	var modelHeight = 1000;
		 	
		 	if('${model.color}' != 'noColor'){
		 		var modelColor = ${model.color};
		 	}
		 	var modelScale_x = ${model.scale_x};
		 	var modelScale_y = ${model.scale_y};
		 	var modelScale_z = ${model.scale_z};
		 	
		 	var modelPosition_x = ${model.position_x};
		 	var modelPosition_y = ${model.position_y};
		 	var modelPosition_z = ${model.position_z};
		 	
		 	var modelRotation_x = ${model.rotation_x};
		 	var modelRotation_y = ${model.rotation_y};
		 	var modelRotation_z = ${model.rotation_z};
		 	
		 	var modelMotion = ${model.motion};
		 	
		 	if('${modelColor.headColor}' === ''){
        		var headColor = '#F781F3';
        	}else{
        		headColor = '${modelColor.headColor}';
        	}
        	if('${modelColor.armColor}' === ''){
        		var armColor = '#F781F3';
        	}else{
        		armColor = '${modelColor.armColor}';
        	}
        	if('${modelColor.cheekColor}' === ''){
        		var cheekColor = '#DF0101';
        	}else{
        		cheekColor = '${modelColor.cheekColor}';
        	}
        	if('${modelColor.legColor}' === ''){
        		var legColor = '#585858';
        	}else{
        		legColor = '${modelColor.legColor}';
        	}
	 	
	 </script>

	<script>	
 		//화면 인쇄 메소드		
	
        var g_oBeforeBody = document.getElementById('desc').innerHTML;

        jQuery('.print-btn').click( function() {

            // 프린트를 보이는 그대로 나오기위한 셋팅
            window.onbeforeprint = function (ev) {
                document.body.innerHTML = g_oBeforeBody;
            };

            // window.onafterprint 로 다시 화면원복을 해주는게 맞으나,
            // 문제가 있기에 reload로 처리
/*
            var initBody = document.body.innerHTML;
            window.onafterprint = function(){
                document.body.innerHTML = initBody;
            }
*/

            window.print();
            location.reload();

            // reload를 해주는 이유는 onbeforeprint 이벤트로
            // 화면을 다시 그렸기때문에 스크립트나 여러가지 이벤트가 해지되는 현상이 있음
            // 그래서 임시조치로 reload를 해줌
        });

	</script>
	
	
	
	<script>
      // 공유하기
      const currentUrl = window.location.href;
      // 자바스크립트 코드
      function showShareOptions() {
        $('#shareModal').modal('show');
      }
      
      function shareKakao() {
          Kakao.Share.sendDefault({
            objectType: 'feed',
            content: {
               title: '[WhoU] ${BaseInfo.job_nm}를 공유했습니다',
               description: '더 자세한 직업 정보를 알고 싶다면?',
               imageUrl:
                 'https://blog.kakaocdn.net/dn/Teu4S/btspTKEQoFi/0ta7ZUvXjCXcLSDicGKQKK/img.png',
               link: {
                 // [내 애플리케이션] > [플랫폼] 에서 등록한 사이트 도메인과 일치해야 함
                 mobileWebUrl: currentUrl,
                 webUrl: currentUrl,
               },
            },
            buttons: [
              {
                title: '자세히 보러가기',
                link: {
                  mobileWebUrl: currentUrl,
                  webUrl: currentUrl,
                },
              },
            ],
          });
      }
      
      function copyUrl() {
           navigator.clipboard.writeText(currentUrl)
             .then(function() {
               alert("URL이 복사되었습니다.");
             })
             .catch(function(err) {
               // 복사 작업이 실패한 경우, 사용자에게 안내합니다.
               console.error('URL 복사 실패:', err);
               alert("URL 복사에 실패했습니다. 수동으로 복사해주세요.");
             });
      }
   </script>
		
</body>
    
</html>


