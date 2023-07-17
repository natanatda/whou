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
        <!-- Responsive navbar-->
       <%@ include file="../header.jsp" %>     
    
        <section class="py-5 report-section">
            <div class="container">
                <div class="card">
                    <div class="card-body">
                        <h3 class="num-title"><span>01</span> 높은 흥미를 나타내는 직업</h3>
                        <div class="top-interest">
                            <ul>
                            	<c:forEach var="item" items="${rank}" varStatus="status">
                               		<li>${item}</li>                             
                            	</c:forEach>                             
                            </ul>
                        </div>
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
	                                    <c:forEach var="job" items="${job}" >
	                               		     <th>${job}</th>                    
	                            		</c:forEach> 
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
            let data1 = ${percent};
            let labels = ['Label 1', 'Label 2', 'Label 3', 'Label 4', 'Label 5', 'Label 6', 'Label 7', 'Label 8', 'Label 9', 'Label 10', 'Label 11'];

            if (data1.length === 17) {
                labels.push('Label 12', 'Label 13', 'Label 14', 'Label 15', 'Label 16', 'Label 17');
            }
            var myChart2 = new Chart(ctx2, {
                type: 'radar',
                data: {
                	labels: labels,
                    datasets: [
                        {
                            label: 'Dataset 1',
                            data: data1,
                            backgroundColor: 'rgba(255, 99, 132, 0.5)',
                            borderColor: 'rgba(255, 99, 132, 1)',
                            borderWidth: 1
                       },             
                    ],
                },
                options: {
                    scale: {                                          
                            min: 0,
                            max: 100,
                            ticks: {
                              stepSize:10
                            }
                        
                    }
                }
            });


          </script>
    </body>
    
</html>
