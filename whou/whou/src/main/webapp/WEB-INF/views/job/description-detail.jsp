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
    </head>
 
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
        <section class="py-2 desc-dtl-section">
            <div class="desc-container">
                <h2 class="page-title">직업백과</h2>
                <div class="desc-wrap">
                    <div class="left-wrap">
                        <h5>${BaseInfo.job_nm}</h5>
                        <ul class="desc-icon-box">
                            <li><i class="fa-regular fa-star" style="color: #5c5c5c;"></i></li>
                            <li><i class="fa-regular fa-thumbs-up" style="color: #5c5c5c;"></i></li>
                            <li><i class="fa-solid fa-print" style="color: #5c5c5c;"></i></li>
                        </ul>
                        <div class="d-flex">
                            <div class="desc-item">
                                <i class="fa-regular fa-credit-card" style="color: #4d4d4d;"></i>
                                <span>평균연봉</span>
                            </div>
                            <div>${BaseInfo.wage} 만원</div>
                        </div>
                        <div class="d-flex">
                            <div class="desc-item">
                                <i class="fa-solid fa-house" style="color: #4d4d4d;"></i>
                                <span>일&middot;가정균형</span>
                            </div>
                            <div>${BaseInfo.wlb}</div>
                        </div>
                        <div class="d-flex">
                            <div class="desc-item">
                                <i class="fa-solid fa-users" style="color: #4d4d4d;"></i>
                                <span>사회공헌</span>
                            </div>
                            <div>${BaseInfo.social}</div>
                        </div>
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
                                <div class="content-item">
                                    <p class="icon-title">관련 직업명</p>
                                    <div class="content-box">${BaseInfo.job_nm}</div>
                                </div>
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
                                 <div style="margin-bottom: 4px;">- ${work.work}</div>
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
                                  - ${Aptitude.aptitude}</br>
                              </c:forEach>
                                    </div>
                                    <p class="semi-title">﻿ο 흥미</p>
                                    <div class="content-box">
                              <c:forEach var="Interest" items="${interestList}">
                                  - ${Interest.interest}</br>
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
                                  <div style="margin-bottom: 4px;">- ${Research.research}</div>
                              </c:forEach>
                                    </div>
                                    <p>관련 자료</p>
                                    <div class="content-box">
                              <c:forEach var="RelJinSol" items="${relJinSol}">
                                  - ${RelJinSol.subject}</br>
                              </c:forEach>
                                    </div>
                                </div>
                                <div class="content-item">
                                    <p class="icon-title">준비방법</p>
                                    <p class="semi-title">﻿﻿﻿﻿ο 정규교육과정</p>
                                    <div class="content-box">
                              <c:forEach var="Curriculum" items="${JobReady.curriculum}">
                                  <div style="margin-bottom: 4px;">- ${Curriculum.curriculum}</div>
                              </c:forEach>
                                    </div>
                                    <p class="semi-title">﻿﻿﻿﻿ο 직업훈련</p>
                                    <div class="content-box">
                              <c:forEach var="Training" items="${JobReady.training}">
                                  <div style="margin-bottom: 4px;">- ${Training.training}</div>
                              </c:forEach>
                                    </div>
                                    <p class="semi-title">﻿﻿﻿﻿ο 관련 자격증</p>
                                    <div class="content-box">
                              <c:forEach var="Certificate" items="${JobReady.certificate}">
                                  <div style="margin-bottom: 4px;">- ${Certificate.certificate}</div>
                              </c:forEach>
                                    </div>
                                    <p class="semi-title">﻿﻿﻿﻿ο 입직 및 취업방법</p>
                                    <div class="content-box">
                              <c:forEach var="Recruit" items="${JobReady.recruit}">
                                  <div style="margin-bottom: 4px;">- ${Recruit.recruit}</div>
                              </c:forEach>
                                    </div>
                                </div>
                                <div class="content-item">
                                    <p class="icon-title">관련기관</p>
                                    <div class="content-box">
                              <c:forEach var="JobRelOrg" items="${jobRelOrg}">
                                  - ${JobRelOrg.rel_org} <a href="${JobRelOrg.rel_org_url}">${JobRelOrg.rel_org_url}</a></br>
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
                                    <div class="flex-box">
                                       <div class="content-box" style="width:150px">
                                          <p style="font-weight: 600;">직업 만족도</p>
                                 <p style="font-weight: 600; color:green;">${BaseInfo.satisfication} %</p>
                              </div>
                                      <div>   
                                 ${BaseInfo.satisfi_source}
                                       </div>
                                    </div>
                                    <p class="semi-title">﻿﻿﻿﻿ο 학력분포 및 전공계열</p>
                                      <div class="flex-box">                                      
                                       <div class="content-box">
                                          <p style="text-align:center; font-weight: 400;">학력분포</p>
                                 <c:forEach var="EduChart" items="${eduChart}">
                                    <c:set var="chart_name" value="${EduChart.chart_name.split(',')}"/>
                                    <c:set var="chart_data" value="${EduChart.chart_data.split(',')}"/>
                                       <c:forEach var="name" items="${chart_name}" varStatus="status">
                                        </c:forEach>
                                        <div>
                                           <canvas id="EduChart" width="400" height="400"></canvas>
                                        </div>
                                        ${EduChart.source}
                                 </c:forEach>
                                       </div>
                                       <div class="content-box">
                                          <p style="text-align:center; font-weight: 400;">전공계열</p>
                                 <c:forEach var="MajorChart" items="${majorChart}">
                                    <c:set var="major" value="${MajorChart.major.split(',')}"/>
                                    <c:set var="major_data" value="${MajorChart.major_data.split(',')}"/>
                                       <c:forEach var="major" items="${major}" varStatus="status">
                                        </c:forEach>
                                        <div>
                                           <canvas id="MajorChart" width="400" height="400"></canvas>
                                        </div>
                                        ${MajorChart.source}
                                 </c:forEach>
                                       </div>
                                    </div>
                                </div>
                                <div class="content-item">
                                    <p class="icon-title">한국의 직업지표</p>
                                    <c:forEach var="IndicatorChart" items="${indicatorChart}">
                               <canvas id="IndicatorChart" width="400" height="200"></canvas>
                               ${IndicatorChart.source}
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
    </body>
    
</html>