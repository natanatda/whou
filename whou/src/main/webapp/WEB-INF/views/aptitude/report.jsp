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
    
		<script src="https://code.jquery.com/jquery-3.7.0.min.js" ></script>
		<script src="https://unpkg.com/three@0.128.0/build/three.min.js"></script>
		<script src="https://unpkg.com/three@0.128.0/examples/js/controls/OrbitControls.js"></script>
		<script src="/whou/resources/js/unpkg.com_gsap@3.12.1_dist_gsap.min.js"></script>
		<script src="/whou/resources/js/ThreeCSG.js"></script>
        <script type="module" src="/whou/resources/js/whouModel2.js"></script>
		<script src="/whou/resources/js/ai.js"></script>	
	
    </head>
	
<body>
   <div class="loading-wrap">
        <canvas class="webgl" ></canvas> <%-- ai --%>
    </div>



        <!-- Responsive navbar-->
       <%@ include file="../header.jsp" %>     
    
        <section class="py-5 report-section">
            <div class="container">
	            <c:if test="${qnum eq '21' || qnum == '21' || qnum eq '31' || qnum == '31'}">
	            <div class="card">
	                    <div class="card-body">
	                        <h3 class="num-title"><span>01</span> 검사결과 요약</h3>	                        
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
	                        <h3 class="num-title"><span>02</span> 검사결과 세부사항</h3>
	                        <div style="width:600px;margin: 0 auto;">
	                            <!-- 다각형 -->
	                            <canvas id="myChart21"></canvas>
	                        </div>   
	                         <c:if test="${qnum eq '21' || qnum == '21'}">
		                        <div class="table-wrap desc-table">
		                            <table>
		                                <colgroup>
		                                    <col style="width:20%;">
		                                    <col style="width:80%;">
		                                </colgroup>
		                                <thead>
		                                    <tr>
		                                        <th>영역</th>
		                                        <th>설명</th>
		                                    </tr>
		                                </thead>
		                                <tbody>
		                                    <tr>
		                                    	<td>수리·논리력</td>
		                                        <td>논리적으로 사고하여 문제를 해결하는 능력</td>                       
		                                    </tr>
		                                    <tr>
		                                        <td>음악능력</td>  
		                                        <td>노래부르고, 악기를 연주하며, 감상할 수 있는 능력</td>                            
		                                    </tr>
		                                    <tr>
		                                        <td>창의력</td>  
		                                        <td>새롭고 독특한 방식으로 문제를 해결하고, 아이디어를 내는 능력</td>                            
		                                    </tr>
		                                    <tr>
		                                        <td>자연친화력</td>  
		                                        <td>인간과 자연이 서로 연관되어 있음을 이해하며, 자연에 대하여 관심을 가지고 탐구ㆍ보호할 수 있는 능력</td>                            
		                                    </tr>
		                                    <tr>
		                                        <td>예술시각능력</td>  
		                                        <td>선, 색, 공간, 영상 등에 민감하게 반응하고 조화롭게 재구성할 수 있는 능력	</td>                            
		                                    </tr>
		                                    <tr>
		                                        <td>신체·운동능력	</td>  
		                                        <td>기초체력을 바탕으로 효율적으로 몸을 움직이고 동작을 학습할 수 있는 능력</td>                            
		                                    </tr>
		                                    <tr>
		                                        <td>대인관계능력</td>  
		                                        <td>조직 속에서 구성원들과 협조적이며 원만한 관계를 유지하는 능력</td>                            
		                                    </tr>
		                                </tbody>
		                            </table>
		                        </div>      
	                        </c:if>  
	                        <c:if test="${qnum eq '31' || qnum == '31'}">
		                        <div class="table-wrap desc-table">
		                            <table>
		                                <colgroup>
		                                    <col style="width:20%;">
		                                    <col style="width:80%;">
		                                </colgroup>
		                                <thead>
		                                    <tr>
		                                        <th>직업흥미군</th>
		                                        <th>하는 일</th>
		                                    </tr>
		                                </thead>
		                                <tbody>
		                                    <tr>
		                                    	<td>자연과학</td>
		                                        <td>물리학, 화학, 지구과학, 천문학, 생명과학 등 자연계에서 일어나는 현상을 연구하거나 관련 지식을 활용하는 일을 한다.</td>                       
		                                    </tr>
		                                    <tr>
		                                        <td>AI·소프트웨어</td>  
		                                        <td>인공지능을 갖춘 컴퓨터 시스템이나 컴퓨터를 사용하기 위한 프로그램을 연구하고 활용하는 일을 한다.</td>                            
		                                    </tr>
		                                    <tr>
		                                        <td>공학</td>  
		                                        <td>기계공학, 에너지공학, 전기전자공학 등의 분야에서 응용할 수 있는 과학적 지식과 기술을 연구하거나 활용하는 일을 한다.</td>                            
		                                    </tr>
		                                    <tr>
		                                        <td>법률·행정</td>  
		                                        <td>국가와 사회 운영에 필요한 법이나 제도를 만들고 적용하며, 국내 및 국제 관계를 유지·발전시키는 일을 한다.</td>                            
		                                    </tr>
		                                    <tr>
		                                        <td>복지</td>  
		                                        <td>사회 구성원들의 행복과 삶의 질을 개선하고, 신체적, 정신적으로 어려움에 처한 사람들을 돕기 위한 사회적, 제도적 일을 한다.</td>                            
		                                    </tr>
		                                    <tr>
		                                        <td>교육</td>  
		                                        <td>사람들에게 필요한 지식이나 기술을 가르치고 바람직한 인성을 길러주기 위해 교육, 교육상담, 교육환경 조성 등의 일을 한다.</td>                            
		                                    </tr>
		                                    <tr>
		                                        <td>예술·미디어</td>  
		                                        <td>음악, 미술, 디자인, 영화, 방송, 문학 등의 예술·미디어 분야에서 개인적 재능을 발휘하고, 해당 분야와 관련된 일을 한다.</td>                            
		                                    </tr>
		                                    <tr>
		                                        <td>스포츠</td>  
		                                        <td>운동선수로 활약하거나 경기 진행, 선수 지도 및 기타 서비스 제공 등 스포츠와 관련된 일을 한다.</td>                            
		                                    </tr>
		                                    <tr>
		                                        <td>마케팅</td>  
		                                        <td>소비자에게 상품이나 서비스를 효율적으로 제공하기 위한 홍보 활동을 하며, 고객을 유치하고 유지·관리하는 일을 한다.</td>                            
		                                    </tr>
		                                    <tr>
		                                        <td>금융·경영</td>  
		                                        <td>기업, 조직 및 개인의 자산을 관리하거나 운용하며, 재무, 회계관리, 인사관리 등 회사 경영과 관련된 일을 한다.</td>                            
		                                    </tr>
		                                    <tr>
		                                        <td>여가·관광</td>  
		                                        <td>여행, 관광, 행사 등의 분야에서 상품의 기획, 개발 및 진행 등과 관련된 일을 한다.</td>                            
		                                    </tr>
		                                    <tr>
		                                        <td>보건의료</td>  
		                                        <td>국민의 건강을 보호하고 증진하는 활동을 하며, 환자를 진단, 치료, 간호하거나 의료 시스템을 지원하는 일을 한다.</td>                            
		                                    </tr>
		                                    <tr>
		                                        <td>농생명</td>  
		                                        <td>농·축·수산물 등 식량 자원을 생산·가공·관리하거나 산림, 반려 동식물 관리 등과 관련된 일을 한다.</td>                            
		                                    </tr>
		                                    <tr>
		                                        <td>환경</td>  
		                                        <td>공기나 수질, 날씨, 바다 등 지구 환경을 조사·분석하고, 보전하거나 개선하는 일을 한다.</td>                            
		                                    </tr>
		                                    <tr>
		                                        <td>제조</td>  
		                                        <td>자동차, 가전제품, 가구 등 완제품 및 부품을 생산하거나 관리 또는 수리하는 분야에서 일을 한다.</td>                            
		                                    </tr>
		                                    <tr>
		                                        <td>물류·운송·유통</td>  
		                                        <td>사람의 이동 또는 상품의 배송을 위한 자동차, 비행기, 선박 등의 운행 및 통제에 관련된 일을 한다.</td>                            
		                                    </tr>
		                                    <tr>
		                                        <td>설계·건축·토목</td>  
		                                        <td>건물이나 구조물, 도로, 철도, 항만 등을 설계하고 만들며, 그 과정을 관리하거나 보수하는 일을 한다.</td>                            
		                                    </tr>
		                                </tbody>
		                            </table>
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
				                                        <td><div>관련 직업</div></td>
				                                        <td><div>관련 직업</div></td>
				                                        <td><div>관련 직업</div></td>
				                                    </tr>
				                                    <tr>
				                                        <td>
				                                            <ul>
																<c:forEach var="jobList" items="${reportResultArr.get(0)}" >
					                                                <li>${jobList}</li>
					                                            </c:forEach>
				                                            </ul>
				                                        </td>
				                                        <td>
				                                            <ul>
				                                                <c:forEach var="jobList" items="${reportResultArr.get(1)}" >
					                                                <li>${jobList}</li>
					                                            </c:forEach>
				                                            </ul>
				                                        </td>
				                                        <td>
				                                            <ul>
				                                                <c:forEach var="jobList" items="${reportResultArr.get(2)}" >
					                                                <li>${jobList}</li>
					                                            </c:forEach>
				                                            </ul>
				                                        </td>
				                                    </tr>
				                                </tbody>
				                            </table>
				                        </div>
				                    </div>
				                </div>   
	                        </c:if>                      
	                    </div>
	                </div>
	               
	            </c:if>
	    
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
		                        	 <div style="width:600px;margin: 0 auto;">
		                        		<canvas id="myChart3"></canvas>
		                        	</div>
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
                        	 <div style="width:600px;margin: 0 auto;">
                            	<canvas id="myChart"></canvas>
                            </div>
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
	                             <div style="width:600px;margin: 0 auto;">
	                            	<canvas id="myChart2"></canvas>
	                            </div>
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
	                                       <td>${reportResult[32]}${reportResult[33]}</td>                            
	                                    </tr>
	                                </tbody>
	                            </table>
                       		</div>     
                        </div>   
                       
                    </div>
                </div>
			    </c:if>
			    <div style="display:flex;justify-content:flex-end;">			    
	             	<button onclick="location='/whou/member/mypage'" class="purple-btn" style="padding: 20px;border-radius: 8px;font-size: 18px;">진로컨설팅 받으러가기 >></button>
			    </div>
             </div>
        </section>
   
        <!-- Footer-->
        <%@ include file="../footer.jsp" %>
        
        <!-- Bootstrap core JS-->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
        <script>
            const ctx = document.getElementById('myChart');
            const ctx2 = document.getElementById('myChart2');
            const ctx3 = document.getElementById('myChart3');
            const ctx21 = document.getElementById('myChart21');

            data1 = ${updatedList1}
            data2 = ${updatedList2}
            data3 = ${updatedList3}        
         
            qnum= ${qnum}
            aptitudeName =['자연과학','AI·소프트웨어','공학','법률·행정','복지','교육','예술·미디어','스포츠','마케팅','금융·경영','여가·관광']
            if(qnum === 21){
	            aptitudeName =['${aptitudeName[0]}','${aptitudeName[1]}','${aptitudeName[2]}','${aptitudeName[3]}','${aptitudeName[4]}','${aptitudeName[5]}','${aptitudeName[6]}','${aptitudeName[7]}','${aptitudeName[8]}','${aptitudeName[9]}','${aptitudeName[10]}']            	
            }
            
            if(qnum === 21 || qnum === 31){
            	 let data1 = ${percent};
                 let labels = aptitudeName;

                 if (data1.length === 17) {
                     labels.push('보건의료', '농생명', '환경', '제조', '물류·운송·유통', '설계·건축·토목');
                 }
                 var myChart21 = new Chart(ctx21, {
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
            }
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
	                    labels:['안정성', '보수', '일과 삶의 균형', '즐거움','소속감','자기계발', '도전성', '영향력', '사회적 기여','성취','사회적 인정','자율성'],
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
          
            <script>
        	var modelCamera_x = ${brush.camera};
        	var modelCamera_y = 1;
        	var modelCamera_z = 3;
		 	var modelPath = '/whou/resources/whouModel/${brush.path_folder}/${brush.path_gltf}';
		 	
		 	var modelWidth = 200;
        	var modelHeight = 200;

        	
        	if('${model.headColor}' === ''){
        		var headColor = '#F781F3';
        	}else{
        		headColor = '${model.headColor}';
        	}
        	if('${model.armColor}' === ''){
        		var armColor = '#F781F3';
        	}else{
        		armColor = '${model.armColor}';
        	}
        	if('${model.cheekColor}' === ''){
        		var cheekColor = '#DF0101';
        	}else{
        		cheekColor = '${model.cheekColor}';
        	}
        	if('${model.legColor}' === ''){
        		var legColor = '#585858';
        	}else{
        		legColor = '${model.legColor}';
        	}
        	$(document).ready(function(){
     			$(".loading-wrap").hide();
     		})
     	
        </script>
    </body>
    
</html>
