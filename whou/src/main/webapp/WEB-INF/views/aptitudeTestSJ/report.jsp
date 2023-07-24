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
        <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
    </head>
 
<body>
        <!-- Responsive navbar-->
       <%@ include file="../header.jsp" %>     
    
        <section class="py-5 report-section">
            <div class="container">
              <c:if test="${qnum eq '25' || qnum == '25'}">
	                <div class="card">
	                    <div class="card-body">
		                        <h3 class="num-title"><span>01</span> 높은 흥미를 나타내는 직업</h3>
		                        <div class="top-interest">
		                            <ul>
		                                <li>${reportResult[0]}</li>
		                                <li>${reportResult[1]}</li>
		                                <li>${reportResult[2]}</li>
		                            </ul>
		                        </div>
		                         <h3 class="num-title"><span>02</span> 그래프</h3>
		                        <div>
		                        	<canvas id="myChart3"></canvas>
		                        	<div class="table-wrap desc-table">
			                            <table>
			                                <colgroup>
			                                    <col style="width:20%;">
			                                    <col style="width:90%;">
			                                </colgroup>
			                                <thead>
			                                    <tr>
			                                        <th>가치관</th>
			                                        <th>설명</th>
			                                    </tr>
			                                </thead>
			                                <tbody>
			                                    <tr>
			                                        <td>안정성</td>
			                                        <td>“안정성” 가치가 높을수록 내가 하고 싶은 일을 계속해서 안정적으로 하는 것을 중요하게 여긴다는 것을 나타냅니다.</td>
			                                    </tr>
			                                  	<tr>
			                                        <td>보수</td>
			                                        <td>“보수” 가치가 높을수록 일을 통해 돈과 같은 경제적 보상을 얻는 것을 중요하게 여긴다는 것을 나타냅니다.</td>
			                                    </tr>
			                                    <tr>
			                                        <td>일과 삶의 균형</td>
			                                        <td>“일과 삶의 균형” 가치가 높을수록 일과 개인생활의 균형을 이루는 것을 중요하게 여긴다는 것을 나타냅니다.</td>
			                                    </tr>
			                                    <tr>
			                                        <td>즐거움</td>
			                                        <td>“즐거움” 가치가 높을수록 일에서 흥미와 보람을 느끼고 즐거움을 얻는 것을 중요하게 여긴다는 것을 나타냅니다.</td>
			                                    </tr>
			                                    <tr>
			                                        <td>소속감</td>
			                                        <td>“소속감” 가치가 높을수록 사람들과 함께 일하면서 구성원이 되는 것을 중요하게 여긴다는 것을 나타냅니다.</td>
			                                    </tr>
			                                    <tr>
			                                        <td>자기계발</td>
			                                        <td>“자기 계발” 가치가 높을수록 일을 통해서 자신의 능력을 발전시키고 성장해 나가는 것을 중요하게 여긴다는 것을 나타냅니다.</td>
			                                    </tr>
			                                    <tr>
			                                        <td>도전성</td>
			                                        <td>“도전성” 가치가 높을수록 실패를 두려워하지 않고 새로운 일에 도전하는 것을 중요하게 여긴다는 것을 나타냅니다.</td>
			                                    </tr>
			                                    <tr>
			                                        <td>영향력</td>
			                                        <td>“영향력” 가치가 높을수록 다른 사람에게 영향을 미치고 사람들을 이끄는 것을 중요하게 여긴다는 것을 나타냅니다.</td>
			                                    </tr>
			                                    <tr>
			                                        <td>사회적 기여</td>
			                                        <td>“사회적 기여” 가치가 높을수록 다른 사람들의 행복과 복지에 기여하는 것을 중요하게 여긴다는 것을 나타냅니다.</td>
			                                    </tr>
			                                    <tr>
			                                        <td>성취</td>
			                                        <td>“성취” 가치가 높을수록 목표의식이 뚜렷하고, 자신의 능력을 발휘하여 목표한 바를 달성하는 것을 나타냅니다.</td>
			                                    </tr>
			                                    <tr>
			                                        <td>사회적 인정</td>
			                                        <td>“사회적 인정” 가치가 높을수록 다른 사람들에게 인정받고 존경받는 것을 중요하게 여긴다는 것을 나타냅니다.</td>
			                                    </tr>
			                                    <tr>
			                                        <td>자율성</td>
			                                        <td>“자율성” 가치가 높을수록 일의 내용과 환경을 스스로 결정하고 선택하는 것을 중요하게 여긴다는 것을 나타냅니다.</td>
			                                    </tr>
			                                </tbody>
			                            </table>
			                        </div>                  
		                        </div>
		                        <div>
		                        <h3>홍길동님은 "${reportResult[15]}" 유형입니다. </h3>
			                         <div class="table-wrap rcd-table">
			                            <table>
			                            <colgroup>
			                            	<col style="width:15%">
			                            	<col style="width:15%">
			                            	<col style="width:70%">
			                            </colgroup>
			                                <thead>
			                                    <tr>
				                                    <th>유형</th>
				                                    <th>주요 가치</th>
				                                    <th>내용</th>
			                                    </tr>
			                                </thead>
			                                <tbody>
			                                    <tr>
			                                        <td>안정지향</td>
			                                        <td>
			                                        	안정성<br>
														보수<br>
														일과 삶의 균형
													</td>
			                                        <td>안정지향형은 직업활동을 통하여 안정적인 생활을 얻고자 하는 유형입니다. 이 유형의 학생들은 안정적인 생활을 위해 충분한 보수를 얻고자 할 수 있으며, 한 직장에서 오랫동안 일할 수 있는 환경을 추구할 수 있고, 자신의 삶과 일의 균형을 유지함으로써 잘 정리된 삶을 누리고자 할 수 있습니다.</td>
			                                    </tr>
			                                    <tr>
			                                        <td>의미지향</td>
			                                        <td>
			                                        	즐거움<br>
														소속감<br>
														자기계발
													</td>
			                                        <td>의미지향형은 직업을 통해서 자신의 삶의 의미를 확인하고자 하는 유형입니다. 미래의 직업에서 소속감을 가짐으로써 자신의 존재감을 확인할 수 있으며, 일에서의 즐거움을 느낌으로써 자신이 일하는 의미를 확인하고자 할 수 있습니다. 그리고 자기계발을 통해 발전과 성장을 지속함으로써 변화하고자 할 수 있습니다.</td>
			                                    </tr>
			                                    <tr>
			                                        <td>변화지향</td>
			                                        <td>
			                                        	도전성<br>
														영향력<br>
														사회적 기여
													</td>
			                                        <td>변화지향형은 안정적인 생활보다는 자신의 일을 통해서 변화를 추구하고자 하는 유형입니다. 이 유형의 학생들은 직업을 통해서 끊임없이 새로운 일에 도전하고자 할 수 있으며, 자신의 일을 통해 자신 뿐 아니라 다른 사람에게도 영향을 끼침으로써 환경적 변화를 만들고자 할 수 있습니다.</td>
			                                    </tr>
			                                    <tr>
			                                        <td>성취지향</td>
			                                        <td>
			                                        	성취<br>
														사회적 인정<br>
														자율성
													</td>
			                                        <td>직업을 통해서 무엇인가를 이루어내고자 하는 유형입니다. 그러나 이러한 성취는 개인 내적인 성취를 말합니다. 이 유형의 학생들은 자신의 일을 통해 개인적인 성취를 이루고자 할 뿐 아니라, 성취를 통해 사회적인 인정을 얻고자 할 수 있습니다. 그리고 자신 스스로 삶을 통제해 나갈 수 있는 자율성을 추구할 수 있습니다.</td>
			                                    </tr>
			                                    
			                                </tbody>
			                            </table>
			                        </div>
			                        
		                        </div>
		                 </div>
		            </div>
            	</c:if>
            	<c:if test="${qnum eq '27' || qnum == '27'}" >
            				
	               <div class="card">
                    <div class="card-body">
                    	<h3 class="num-title"><span>01</span> 높은 흥미를 나타내는 직업</h3>
           				<div class="top-interest">
                            <ul>
                                <li>${reportResult[0]}</li>
                            </ul>
                        </div>
                        <h3 class="num-title"><span>02</span> 그래프</h3>
                        <div>
                            <canvas id="myChart"></canvas>
                             <div class="table-wrap desc-table">
	                            <table>
	                                <colgroup>
	                                    <col style="width:10%;">
	                                    <col style="width:10%;">
	                                    <col style="width:80%;">
	                                </colgroup>
	                                <thead>
	                                    <tr>
	                                        <th>유형</th>
	                                        <th>하위역량</th>
	                                        <th>검사결과</th>
	                                    </tr>
	                                </thead>
	                                <tbody>
	                                    <tr>
	                                        <td rowspan="4">진로설계역량</td>
	                                        <td>자기이해</td>
	                                        <td>${reportResult[23]}</td>                                    
	                                    </tr>
	                                    <tr>
	                                       <td>직업이해</td>
	                                       <td>${reportResult[24]}</td>                            
	                                    </tr>
	                                    <tr>
	                                       <td>진로탐색</td>
	                                       <td>${reportResult[25]}</td>                            
	                                    </tr>
	                                    <tr>
	                                       <td>진로계획</td>
	                                       <td>${reportResult[26]}</td>                            
	                                    </tr>
	                                </tbody>
	                            </table>
                       		</div>                  
                            <!-- 다각형 -->
                            <canvas id="myChart2"></canvas>
                               <div class="table-wrap desc-table">
	                            <table>
	                                <colgroup>
	                                    <col style="width:10%;">
	                                    <col style="width:10%;">
	                                    <col style="width:80%;">
	                                </colgroup>
	                                <thead>
	                                    <tr>
	                                        <th>유형</th>
	                                        <th>하위역량</th>
	                                        <th>검사결과</th>
	                                    </tr>
	                                </thead>
	                                <tbody>
	                                    <tr>
	                                        <td rowspan="6">진로준비역량</td>
	                                        <td>낙관성</td>
	                                        <td>${reportResult[27]}</td>                                    
	                                    </tr>
	                                    <tr>
	                                       <td>지속성</td>
	                                       <td>${reportResult[28]}</td>                            
	                                    </tr>
	                                    <tr>
	                                       <td>호기심</td>
	                                       <td>${reportResult[29]}</td>                            
	                                    </tr>
	                                    <tr>
	                                       <td>유연성</td>
	                                       <td>${reportResult[30]}</td>                            
	                                    </tr>
	                                    <tr>
	                                       <td>도전성</td>
	                                       <td>${reportResult[31]}</td>                            
	                                    </tr>
	                                    <tr>
	                                       <td>의사소통</td>
	                                       <td>${reportResult[32]}</td>                            
	                                    </tr>
	                                </tbody>
	                            </table>
                       		</div>     
                        </div>   
                       
                    </div>
                </div>
			    </c:if>
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
            const ctx3 = document.getElementById('myChart3');

            data1 = ${updatedList1}
            data2 = ${updatedList2}
            data3 = ${updatedList3}        
         
            qnum= ${qnum}
            if(qnum === 27){
            	var myChart = new Chart(ctx, {
                    type: 'radar',
                    data: {
                        labels:['자기이해', '직업이해', '진로탐색', '진로계획'],
                        datasets: [
                        {
                            data: data1,
                            backgroundColor: 'rgba(255, 99, 132, 0.5)',
                            borderColor: 'rgba(255, 99, 132, 1)',
                            borderWidth: 1,
                           
                        },              
                        ]
                    },
                    options: {
                        scale: {                                          
                                min: 0,
                                max: 70,
                                ticks: {
                                  stepSize:10
                                }
                            
                        }
                    }
                    });
                    
                    var myChart2 = new Chart(ctx2, {
                        type: 'radar',
                        data: {
                            labels:['낙관성', '지속성', '호기심', '유연성','도전성','의사소통'],
                            datasets: [
                            {
                                data: data2,
                                backgroundColor: 'rgba(255, 99, 132, 0.5)',
                                borderColor: 'rgba(255, 99, 132, 1)',
                                borderWidth: 1,
                               
                            },              
                            ]
                        },
                        options: {
                            scale: {                                          
                                    min: 0,
                                    max: 70,
                                    ticks: {
                                      stepSize:10
                                    }
                                
                            }
                        }
                        });
            }
           
            if(qnum === 25){
	            var myChart3 = new Chart(ctx3, {
	                type: 'radar',
	                data: {
	                    labels:['낙관성', '지속성', '호기심', '유연성','도전성','의사소통', '지속성', '호기심', '유연성','도전성','의사소통','의사소통'],
	                    datasets: [
	                    {
	                        data: data3,
	                        backgroundColor: 'rgba(255, 99, 132, 0.5)',
	                        borderColor: 'rgba(255, 99, 132, 1)',
	                        borderWidth: 1,
	                       
	                    },              
	                    ]
	                },
	                options: {
	                    scale: {                                          
	                            min: 0,
	                            max: 70,
	                            ticks: {
	                              stepSize:10
	                            }
	                        
	                    }
	                }
	                });
            }
          </script>
    </body>
    
</html>
