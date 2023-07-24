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
      <script>
         <c:if test="${param.temporaryResult eq 'okSave' || param.temporaryResult=='okSave'}">
            alert('검사지가 임시저장 되었습니다.');
         </c:if>
 
      </script>
        <!-- Responsive navbar-->
       <%@ include file="../header.jsp" %>     
             <section class="py-2 aptitude aptitude-main">
            <div class="container px-5 my-5">
                <h2 class="page-title">심리검사</h2>
                <!-- <div class="card aptitude-main-top">
                    <div class="card-body">
                        <div class="info-box">
                            <p>검사 시작 전에 정보를 입력해주세요!</p>
                        
                        </div>
                    </div>
                </div> -->
               
                <div class="card aptitude-main-top">
                    <div class="card-body">
                        <div class="status-box">
                           <div>
                                <p class="status-title">진행(임시저장) 중 인 검사</p>
                                <div>
	                               
	                                   <c:if test="${fn:length(tempList) == 0}">
	                                       <i class="fa-regular fa-circle-xmark fa-2xl" style="color: #363636;"></i>
	                                       <p>진행중인 검사가 없습니다.</p>
	                                    </c:if>
	                                    <c:if test="${fn:length(tempList) > 0}">
	                                       <c:forEach items="${tempList}" var="templist">
	                                       <div>
	                                          <a href="/whou/aptitude/itrstkAptitude?qnum=${templist.test_num}&tempSave=tempSave">${templist.test_name}</a>
	                                       </div>
	                                       </c:forEach>
	                                    </c:if>
	                                
                                </div>
                           </div>
                           <div>
	                           <c:if test="${name != null}">
                                	<p class="status-title">${name}님의 심리검사 현황</p>
	                                <div class="table-wrap status-table">
	                                    <table>
	                                        <colgroup>
	                                            <!-- <col style="width:20%;">
	                                            <col style="width:90%;"> -->
	                                        </colgroup>
	                                        <thead>
	                                            <tr>
	                                                <th></th>
	                                                <th>직업적성검사</th>
	                                                <th>직업가치관검사</th>
	                                                <th>진로개발역량검사</th>
	                                                <th>직업흥미검사</th>
	                                            </tr>
	                                        </thead>
	                                        <tbody>
	                                            <tr>
	                                                <td>
	                                                    검사횟수
	                                                </td>
	                                                <td>
	                                                    ${valueList[0].getCount()}
	                                                </td>
	                                                <td>
	                                                    ${valueList[1].getCount()}
	                                                </td>
	                                                <td>
	                                                    ${valueList[2].getCount()}
	                                                </td>
	                                                <td>
	                                                    ${valueList[3].getCount()}
	                                                </td>                                    
	                                            </tr>
	                                            <tr>
	                                                <td>
	                                                    최근검사일
	                                                </td>
	                                                <td>
	                                                    ${valueList[0].getMax_test_date()}
	                                                </td>
	                                                <td>
	                                                    ${valueList[1].getMax_test_date()}
	                                                </td>
	                                                <td>
	                                                    ${valueList[2].getMax_test_date()}
	                                                </td>
	                                                <td>
	                                                    ${valueList[3].getMax_test_date()}
	                                                </td>                                    
	                                            </tr>
	                                        </tbody>
	                                    </table>
	                                </div>  
			                  </c:if>
								<c:if test="${name == null}">
								   <div class="info-box">
	                            		<p>로그인 후 이용 가능합니다.</p>	
	                        		</div>                                	
			                  </c:if>
                           </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>

        <section class="test-section">
            <div class="container px-5 my-5">
                <div class="row gx-3 justify-content-center">
                    <!-- 직업적성검사 -->
                    <div class="col-lg-6 col-xl-3">
                        <div class="card mb-5 mb-xl-0 test-cont-wrap">
                            <div class="card-body p-4">
                                <h4>직업적성검사</h4>
                                <p class="test-cont-desc">직업과 관련된 다양한 능력을 어느 정도로 갖추고 있는지 알아 볼 수 있습니다.</p>
                                <div class="d-flex test-cont-info">
                                    <div>
                                        <ul>
                                            <li>중</li>
                                            <li>20분</li>
                                            <li>66문항</li>
                                        </ul>
                                    </div>
                                    <div>
                                        <ul>
                                            <li>고</li>
                                            <li>30분</li>
                                            <li>88문항</li>
                                        </ul>
                                    </div>
                                    <div>
                                        <ul> 
                                            <li><i class="fa-regular fa-clock" style="color: #262a31;"></i></li>
                                            <li><i class="fa-solid fa-file-pen" style="color: #292a31;"></i></li>
                                        </ul>
                                    </div>
                                </div>
                                <div class="button-wrap">
                                    <button class="black-btn" data-bs-toggle="modal" data-bs-target="#aptitudeModal">검사소개</button>
                                     <!-- Modal -->
									<div class="modal fade" id="aptitudeModal" tabindex="-1" aria-labelledby="#aptitudeModal" aria-hidden="true">
									  <div class="modal-dialog">
									    <div class="modal-content">
									      <div class="modal-header">
									        <h1 class="modal-title fs-5" id="exampleModalLabel">Modal title</h1>
									        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
									      </div>
									      <div class="modal-body">
									        직업가치관검사 소개
												예상소요시간15~20분(시간제한없음) 총 문항수49
												검사개발자서미, 김동일, 이동혁, 차주환, 양미진, 소수연, 유준호, 김지혜, 이지은, 이태영(한국청소년상담복지개발원)
												가. 검사 개요
												직업가치관 검사는 여러분이 직업을 선택할 때 어떤 가치를 중요하게 여기는지 알아보기 위한 것입니다. 직업가치관은 여러분의 직업선택에 중요한 기준이 되며, 자신의 가치와 일치하는 직업을 가졌을 때 더 큰 만족감과 성취감을 느끼게 됩니다. 직업가치관 검사 결과를 통해 직업에 있어 나에게 어떤 가치가 중요한지 이해하는 데 도움이 될 것입니다.
												
												나. 검사 항목
												안정성보수일과 삶의 균형즐거움소속감자기 계발도전성영향력사회적 기여성취사회적 인정자율성
												다. 검사 결과
												각 개인별로 12가지 직업가치관 점수가 그래프로 제시됩니다.
												4가지 가치지향 유형 결과가 그림과 그래프로 제시되며, 선호하는 직업가치관 3가지가 제시됩니다.
												
												라. 검사 실시요령
												각 문항에 대해 자신의 생각과 가장 일치한다고 생각하는 항목에 응답해주십시오.
												
												마. 목적 및 필요성
												진로상담의 핵심은 개인의 성격특성이나 가치관, 흥미 등과 관련성이 높은 직업을 선택했을 때 높은 만족과 성취를 가져온다는 것입니다. 그 중에서도 개인의 가치가 직업 또는 조직의 가치와 얼마나 잘 맞느냐가 직업에 대한 만족도를 결정한다는 연구결과들이 있습니다(De Clercq, Fontaine, & Anseel, 2008; Kristof, 1996). Kalleberg(1977)는 직업가치관을 ‘개인이 자신의 직업에 관하여 가지는 생각, 즉 무엇을 원하는가에 대한 관점으로 한 직업에 대한 일반화된 개념’으로 정의하고 있습니다. 그러나 청소년 시기는 직장 경험이 없으므로, 직업과 관련된 가치를 명료하게 형성하기가 어렵습니다(Gay, Weiss, Hendel, Dawis & Lofquist, 1971; Yao-Ting Sung, Yun-Tim Yvonne Chang, Tzu-Ying Cheng, & Hsiu-Lan Shelly Tine, 2017).
												 따라서 직업가치관 검사에서는 직업가치관을 ‘개인의 가치가 일이나 조직생활에 적용된 것으로, 개인이 일이나 조직생활에 대하여 지니고 있는 가치관’이라고 정의하여 검사를 개발하였습니다. 직업가치관 검사는 직업과 관련된 다양한 가치들에 대해 각 개인이 무엇을 더 중요하게 여기는가에 대한 정보를 제공함으로써 진로선택 및 진로상담 과정에서 매우 중요한 의미를 갖습니다.
												
												바. 검사의 하위요소
												가치	내용
												안정성	“안정성” 가치가 높을수록 내가 하고 싶은 일을 계속해서 안정적으로 하는 것을 중요하게 여긴다는 것을 나타냅니다.
												보수	“보수” 가치가 높을수록 일을 통해 돈과 같은 경제적 보상을 얻는 것을 중요하게 여긴다는 것을 나타냅니다.
												일과 삶의 균형	“일과 삶의 균형” 가치가 높을수록 일과 개인생활의 균형을 이루는 것을 중요하게 여긴다는 것을 나타냅니다
												즐거움	“즐거움” 가치가 높을수록 일에서 흥미와 보람을 느끼고 즐거움을 얻는 것을 중요하게 여긴다는 것을 나타냅니다.
												소속감	“소속감” 가치가 높을수록 조직 또는 단체의 구성원이 되어 다른 사람들과 함께 일하는 것을 중요하게 여긴다는 것을 나타냅니다.
												자기 계발	“자기 계발” 가치가 높을수록 일을 통해서 자신의 능력을 발전시키고 성장해 나가는 것을 중요하게 여긴다는 것을 나타냅니다.
												도전성	“도전성” 가치가 높을수록 실패를 두려워하지 않고 새로운 일에 도전하는 것을 중요하게 여긴다는 것을 나타냅니다.
												영향력	“영향력” 가치가 높을수록 다른 사람에게 영향을 미치고 사람들을 이끄는 것을 중요하게 여긴다는 것을 나타냅니다.
												사회적 기여	“사회적 기여” 가치가 높을수록 다른 사람들의 행복과 복지에 기여하는 것을 중요하게 여긴다는 것을 나타냅니다.
												성취	“성취” 가치가 높을수록 목표의식이 뚜렷하고, 자신의 능력을 발휘하여 목표한 바를 달성하는 것을 나타냅니다.
												사회적 인정	“사회적 인정” 가치가 높을수록 다른 사람들에게 인정받고 존경받는 것을 중요하게 여긴다는 것을 나타냅니다.
												자율성	“자율성” 가치가 높을수록 일의 내용과 환경을 스스로 결정하고 선택하는 것을 중요하게 여긴다는 것을 나타냅니다.
												사. 표본
												전국의 중학교 1~3학년과 고등학교 1~3학년을 대표할 수 있도록 전국의 61개 중학교와 121개 고등학교에서 각 학년 한 학급씩 참여하였습니다. 모집단의 학교 성별 비율을 고려한 비율 유층 표집을 한 결과 중학생 3,755명, 고등학생 7,037명이 참여하여, 총10,792명의 데이터를 최종 분석에 사용하였습니다.
												
												아. 신뢰도
												직업가치관 검사 신뢰도 검사 결과 중학생의 경우 Cronbach’s 0.930, 고등학생의 경우 Cronbach’s 0.931로 분석되어 문항 내적일관성이 높은 수준으로 나타났습니다. 검사-재검사 신뢰도 분석 결과에서도 중학생의 경우 모든 영역에서 0.30이상의 상관을 보였고, 고등학생의 경우 모든 영역에서 0.40이상의 상관을 보여 검사 결과가 안정적으로 나타났습니다.
												
												자. 타당도
												직업가치관 검사의 타당성을 검토하기 위해 중학생용과 고등학생용 각각 집중 타당성 검사 결과, 모든 문항에서 Estimates와 AVE가 0.5를 상회하였으며, 개념 신뢰도의 경우 0.7을 상회하였으므로, 모든 문항에서 타당성이 확보된 것으로 나타났습니다. 또한, 재검사에 응답한 학생들을 대상으로 직업에 대한 가치기준 검사와 직업능력개발원의 직업가치관 검사에 대해 분석을 진행한 결과 타당성이 확보된 것으로 나타났습니다.
												
												차. 검사활용안내
												검사대상 :중학교 1학년 – 고등학교 3학년에 해당하는 청소년
												기본적으로 중·고등학생에 적용될 수 있는 가치들을 중심으로 구성되었으나, 대학생 이상의 성인들도 사용할 수 있습니다.
												- 교사 및 상담자 : 학생 및 내담자가 중요하게 생각하는 가치가 무엇이며, 어떤 가치지향 유형에 해당되는지에 대한 정보를 얻음으로써 적성검사 및 흥미검사와 함께 종합적으로 자기이해를 할 수 있도록 안내하는데 활용할 수 있습니다.
												
												검사시간 : 15~20분(시간제한 없음)
												검사결과 활용 방법
												첫째, 12가지 가치관 중 개인이 중요시하는 가치를 확인합니다.
												둘째, 4가지 가치지향 유형 중 어떤 유형에 속하는 지 확인합니다.
												셋째, 자신의 가치지향 유형이 직업선택 시 어떻게 적용될 수 있는지 생각해봅니다.
									      </div>
									      <div class="modal-footer">
									        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
									      </div>
									    </div>
									  </div>
									</div>
                                    <button class="black-btn">검사결과 예시</button>
                                </div>
                                <button class="purple-btn" onclick="aptitudeStart()">검사시작</button>
                            </div>
                        </div>
                    </div>
                   
                    <!-- 직업성숙도검사 -->
                    <div class="col-lg-6 col-xl-3">
                        <div class="card mb-5 mb-xl-0 test-cont-wrap">
                            <div class="card-body p-4">
                                <h4>직업가치관검사</h4>
                                <p class="test-cont-desc">직업과 관련된 다양한 능력을 어느 정도로 갖추고 있는지 알아 볼 수 있습니다.</p>
                                <div class="d-flex test-cont-info">
                                    <div>
                                        <ul>
                                            <li>중</li>
                                            <li>20분</li>
                                            <li>66문항</li>
                                        </ul>
                                    </div>
                                    <div>
                                        <ul>
                                            <li>고</li>
                                            <li>30분</li>
                                            <li>88문항</li>
                                        </ul>
                                    </div>
                                    <div>
                                        <ul> 
                                            <li><i class="fa-regular fa-clock" style="color: #262a31;"></i></li>
                                            <li><i class="fa-solid fa-file-pen" style="color: #292a31;"></i></li>
                                        </ul>
                                    </div>
                                </div>
                                <div class="button-wrap">
                                    <button class="black-btn">검사소개</button>
                                    <button class="black-btn">검사결과 예시</button>
                                </div>
                                <button class="purple-btn" onclick="valuesStart()">검사시작</button>
                            </div>
                        </div>
                    </div>
                    <!-- 직업흥미검사 -->
                    <div class="col-lg-6 col-xl-3">
                        <div class="card mb-5 mb-xl-0 test-cont-wrap">
                            <div class="card-body p-4">
                                <h4>직업역량검사</h4>
                                <p class="test-cont-desc">직업과 관련된 다양한 능력을 어느 정도로 갖추고 있는지 알아 볼 수 있습니다.</p>
                                <div class="d-flex test-cont-info">
                                    <div>
                                        <ul>
                                            <li>중</li>
                                            <li>20분</li>
                                            <li>66문항</li>
                                        </ul>
                                    </div>
                                    <div>
                                        <ul>
                                            <li>고</li>
                                            <li>30분</li>
                                            <li>88문항</li>
                                        </ul>
                                    </div>
                                    <div>
                                        <ul> 
                                            <li><i class="fa-regular fa-clock" style="color: #262a31;"></i></li>
                                            <li><i class="fa-solid fa-file-pen" style="color: #292a31;"></i></li>
                                        </ul>
                                    </div>
                                </div>
                                <div class="button-wrap">
                                    <button class="black-btn">검사소개</button>
                                    <button class="black-btn">검사결과 예시</button>
                                </div>
                                <button class="purple-btn" onclick="abilityStart()">검사시작</button>
                            </div>
                        </div>
                    </div>
                    <!-- 직업가치관검사 -->
                    <div class="col-lg-6 col-xl-3">
                        <div class="card mb-5 mb-xl-0 test-cont-wrap">
                            <div class="card-body p-4">
                                <h4>직업흥미검사</h4>
                                <p class="test-cont-desc">직업과 관련된 다양한 능력을 어느 정도로 갖추고 있는지 알아 볼 수 있습니다.</p>
                                <div class="d-flex test-cont-info">
                                    <div>
                                        <ul>
                                            <li>중</li>
                                            <li>20분</li>
                                            <li>66문항</li>
                                        </ul>
                                    </div>
                                    <div>
                                        <ul>
                                            <li>고</li>
                                            <li>30분</li>
                                            <li>88문항</li>
                                        </ul>
                                    </div>
                                    <div>
                                        <ul> 
                                            <li><i class="fa-regular fa-clock" style="color: #262a31;"></i></li>
                                            <li><i class="fa-solid fa-file-pen" style="color: #292a31;"></i></li>
                                        </ul>
                                    </div>
                                </div>
                                <div class="button-wrap">
                                    <button class="black-btn">검사소개</button>
                                    <button class="black-btn">검사결과 예시</button>
                                </div>
                                <button class="purple-btn" onclick="interestStart()">검사시작</button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
    <%@ include file="../footer.jsp" %> 
    
        <!-- Bootstrap core JS-->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
    </body>
    <script>
    function sessionChk(){
    	  // `${name}`이 존재하지 않는 경우
        if (!"${name}") {
            alert("로그인 후 이용해주세요!");
            location.href = '/whou/aptitude/aptitudeMain';
        }
    }
    
    function aptitudeStart() {
	  	 location.href = '/whou/aptitude/itrstkAptitude?qnum=21';
	  	 sessionChk();      
    }
    function valuesStart() {
	  	 location.href = '/whou/aptitude/itrstkAptitude?qnum=25';
	  	 sessionChk();      
   }
    function abilityStart() {
	  	 location.href = '/whou/aptitude/itrstkAptitude?qnum=27';
	  	 sessionChk();      
   }
    function interestStart() {
	  	 location.href = '/whou/aptitude/itrstkAptitude?qnum=31';
	  	 sessionChk();      
   }
    </script>
    
</html>