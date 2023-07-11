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
                            <button class="purple-btn">정보입력하기</button>
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
                                    		<a href="/whou/aptitude/itrstkAptitude?qnum=${templist.test_num}&tempSave=tempSave">${templist.test_name}</a> <br>
                                    	</c:forEach>
                                    </c:if>
                                </div>
                           </div>
                           <div>
                                <p class="status-title">OO님의 심리검사 현황</p>
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
                                                <th>직업흥미검사</th>
                                                <th>진로개발역량검사</th>
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
                                                    ${valueList[3].getCount()}
                                                </td>
                                                <td>
                                                    ${valueList[2].getCount()}
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
                                    <button class="black-btn">검사소개</button>
                                    <button class="black-btn">검사결과 예시</button>
                                </div>
                                <button class="purple-btn">검사시작</button>
                            </div>
                        </div>
                    </div>
                    <!-- 직업성숙도검사 -->
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
                                    <button class="black-btn">검사소개</button>
                                    <button class="black-btn">검사결과 예시</button>
                                </div>
                                <button class="purple-btn">검사시작</button>
                            </div>
                        </div>
                    </div>
                    <!-- 직업흥미검사 -->
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
                                    <button class="black-btn">검사소개</button>
                                    <button class="black-btn">검사결과 예시</button>
                                </div>
                                <button class="purple-btn">검사시작</button>
                            </div>
                        </div>
                    </div>
                    <!-- 직업가치관검사 -->
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
                                    <button class="black-btn">검사소개</button>
                                    <button class="black-btn">검사결과 예시</button>
                                </div>
                                <button class="purple-btn">검사시작</button>
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
    
</html>
