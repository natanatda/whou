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
    
        <section class="py-5 report-section">
            <div class="container">
                <div class="card">
                    <div class="card-body">
                    	<c:if test="${qnum eq '25' || qnum == '25'}">
	                        <h3 class="num-title"><span>01</span> 높은 흥미를 나타내는 직업</h3>
	                        <div class="top-interest">
	                            <ul>
	                                <li>${reportResult[0]}</li>
	                                <li>${reportResult[1]}</li>
	                                <li>${reportResult[2]}</li>
	                            </ul>
	                        </div>
            			</c:if>
                    </div>
                </div>
                <div class="card">
                    <div class="card-body">
                        <h3 class="num-title"><span>02</span> 그래프</h3>
                        <div>
                            <!-- 막대형 -->
                            <canvas id="myChart"></canvas>
                            <!-- 다각형 -->
                            <canvas id="myChart2"></canvas>
                        </div>   
                        <div class="table-wrap desc-table">
                            <table>
                                <colgroup>
                                    <col style="width:20%;">
                                    <col style="width:90%;">
                                </colgroup>
                                <thead>
                                    <tr>
                                        <th>attr</th>
                                        <th>attr</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        <td>
                                            ㅁㄴㅇㄹ
                                        </td>
                                        <td>
                                            ㅁㄴㅇㄹ
                                        </td>                                    
                                    </tr>
                                    <tr>
                                        <td>
                                            ㅁㄴㅇㄹ
                                        </td>
                                        <td>
                                            ㅁㄴㅇㄹ
                                        </td>                                    
                                    </tr>
                                </tbody>
                            </table>

                        </div>                  
                    </div>
                </div>
                <div class="card">
                    <div class="card-body">
                        <h3 class="num-title"><span>03</span> 직업추천</h3>
                        <div class="table-wrap rcd-table">
                            <table>
                                <thead>
                                    <tr>
                                        <th>attr</th>
                                        <th>attr</th>
                                        <th>attr</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        <td>
                                            <div>desc</div>
                                        </td>
                                        <td>
                                            <div>desc</div>
                                        </td>
                                        <td>
                                            <div>desc</div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td><div>관련 직업</div></td>
                                        <td><div>관련 직업</div></td>
                                        <td><div>관련 직업</div></td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <ul>
                                                <li>list</li>
                                                <li>list</li>
                                                <li>list</li>
                                                <li>list</li>
                                                <li>list</li>
                                                <li>list</li>
                                            </ul>
                                        </td>
                                        <td>
                                            <ul>
                                                <li>list</li>
                                                <li>list</li>
                                                <li>list</li>
                                                <li>list</li>
                                                <li>list</li>
                                                <li>list</li>
                                            </ul>
                                        </td>
                                        <td>
                                            <ul>
                                                <li>list</li>
                                                <li>list</li>
                                                <li>list</li>
                                                <li>list</li>
                                                <li>list</li>
                                                <li>list</li>
                                            </ul>
                                        </td>
                                    </tr>
                                </tbody>
                            </table>

                        </div>
                    </div>
                </div>
            </div>
            <c:if test="${qnum eq '27' || qnum == '27'}" >
            	<p>
            		<table>
            			<tr>
            				<th>유형</th>
            				<th>내용</th>
            			</tr>
            			<tr>
            				<td>실천하는<br>진로개발자</td>
            				<td>실천하는 진로개발자는 현재 진로나 직업, 진학에 대한 결정을 효과적으로 할 수 있는 능력을 가지고 있습니다. 이들은 자신의 성격, 흥미, 가치 등 자신의 특성에 대해서 잘 이해하고, 관심 있는 직업이나 진학 정보에 대해 알고 있습니다. 이들은 자신의 특성과 직업에 대한 정보를 가지고 현재 가장 자신에게 잘 맞는 진로 목표를 세우고, 목표에 따라 계획을 세워서 실천해 갑니다. 다만 실천하는 진로개발자는 현재 진로나 직업, 진학 관련 의사결정에 신중한 나머지 미래 변화 가능성을 고려하지 않는 경향이 있습니다. 현재 결정한 진로나 직업이 있어도 미래 직업 세계에 호기심을 갖고 다른 직업이나 진로 선택을 할 수 있다는 유연한 자세를 갖는 것이 도움이 될 수 있습니다.</td>
            			</tr>
            			<tr>
            				<td>실천하는<br>진로개발자</td>
            				<td>실천하는 진로개발자는 현재 진로나 직업, 진학에 대한 결정을 효과적으로 할 수 있는 능력을 가지고 있습니다. 이들은 자신의 성격, 흥미, 가치 등 자신의 특성에 대해서 잘 이해하고, 관심 있는 직업이나 진학 정보에 대해 알고 있습니다. 이들은 자신의 특성과 직업에 대한 정보를 가지고 현재 가장 자신에게 잘 맞는 진로 목표를 세우고, 목표에 따라 계획을 세워서 실천해 갑니다. 다만 실천하는 진로개발자는 현재 진로나 직업, 진학 관련 의사결정에 신중한 나머지 미래 변화 가능성을 고려하지 않는 경향이 있습니다. 현재 결정한 진로나 직업이 있어도 미래 직업 세계에 호기심을 갖고 다른 직업이나 진로 선택을 할 수 있다는 유연한 자세를 갖는 것이 도움이 될 수 있습니다.</td>
            			</tr>
            			<tr>
            				<td>실천하는<br>진로개발자</td>
            				<td>실천하는 진로개발자는 현재 진로나 직업, 진학에 대한 결정을 효과적으로 할 수 있는 능력을 가지고 있습니다. 이들은 자신의 성격, 흥미, 가치 등 자신의 특성에 대해서 잘 이해하고, 관심 있는 직업이나 진학 정보에 대해 알고 있습니다. 이들은 자신의 특성과 직업에 대한 정보를 가지고 현재 가장 자신에게 잘 맞는 진로 목표를 세우고, 목표에 따라 계획을 세워서 실천해 갑니다. 다만 실천하는 진로개발자는 현재 진로나 직업, 진학 관련 의사결정에 신중한 나머지 미래 변화 가능성을 고려하지 않는 경향이 있습니다. 현재 결정한 진로나 직업이 있어도 미래 직업 세계에 호기심을 갖고 다른 직업이나 진로 선택을 할 수 있다는 유연한 자세를 갖는 것이 도움이 될 수 있습니다.</td>
            			</tr>
            		</table>
            	</p>
            </c:if>
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
            const ctx = document.getElementById('myChart');
            const ctx2 = document.getElementById('myChart2');
          
            // 막대형
            var myChart = new Chart(ctx, {
                type: 'bar',
                data: {
                labels: ['Red', 'Blue', 'Yellow', 'Green', 'Purple', 'Orange'],
                datasets: [{
                    label: '# of Votes',
                    data: [12, 19, 3, 5, 2, 3],
                    borderWidth: 1
                }]
                },
                options: {
                scales: {
                    y: {
                    beginAtZero: true
                    }
                }
                }
            });
          
            // 다각형
            var myChart2 = new Chart(ctx2, {
            type: 'radar',
            data: {
                labels: ['Label 1', 'Label 2', 'Label 3', 'Label 4', 'Label 5'],
                datasets: [
                {
                    label: 'Dataset 1',
                    data: [10, 20, 30, 40, 50],
                    backgroundColor: 'rgba(255, 99, 132, 0.5)',
                    borderColor: 'rgba(255, 99, 132, 1)',
                    borderWidth: 1
                },
                {
                    label: 'Dataset 2',
                    data: [20, 30, 40, 50, 60],
                    backgroundColor: 'rgba(54, 162, 235, 0.5)',
                    borderColor: 'rgba(54, 162, 235, 1)',
                    borderWidth: 1
                }
                ]
            },
            options: {}
            });
          </script>
    </body>
    
</html>
