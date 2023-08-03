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
        <script src="https://code.jquery.com/jquery-3.7.0.min.js" ></script>
        <script src="/whou/resources/js/ai.js"></script>
        
        <script>
        function introOpen(load, qnum){
        	url = "/whou/aptitude/intro?load="+load+"&qnum="+qnum;
        	open(url,"size","toolbar=no, location=no,status=no,member=no,scrollbars=yes,resizable=no,width=1200, height=775");
    	}
        </script>
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
                                   <div class="empty-box">
                                       <i class="fa-regular fa-circle-xmark fa-2xl" style="color: #363636;"></i>
                                       <p>진행중인 검사가 없습니다.</p>
                                   </div>
                                    </c:if>
                                    <c:if test="${fn:length(tempList) > 0}">
                                       <ul>
	                                       <c:forEach items="${tempList}" var="templist">
			                                 	<li>
			                                    	<i class="fa-solid fa-caret-right" style="color: #5d5e5f;"></i> <a href="/whou/aptitude/itrstkAptitude?qnum=${templist.test_num}&tempSave=tempSave">${templist.test_name}</a>
			                                 	</li>
	                                       </c:forEach>
                                       </ul>
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
	                                                    ${valueCountArr[0]}
	                                                </td>
	                                                <td>
	                                                    ${valueCountArr[1]}
	                                                </td>
	                                                <td>
	                                                    ${valueCountArr[2]}
	                                                </td>
	                                                <td>
	                                                    ${valueCountArr[3]}
	                                                </td>                                    
	                                            </tr>
	                                            <tr>
	                                                <td>
	                                                    최근검사일
	                                                </td>
	                                                <td>
	                                                    ${valueDateArr[0]}
	                                                </td>
	                                                <td>
	                                                    ${valueDateArr[1]}
	                                                </td>
	                                                <td>
	                                                    ${valueDateArr[2]}
	                                                </td>
	                                                <td>
	                                                    ${valueDateArr[3]}
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
                                    <button class="black-btn" onclick = "introOpen(1, 21)">검사소개</button>
                                    <button class="black-btn" onclick = "introOpen(2, 21)">검사결과 예시</button>
                                </div>
                                <button class="purple-btn" onclick="aptitudeStart()">검사시작</button>
                            </div>
                        </div>
                    </div>
                   
                    <!-- 직업가치관검사 -->
                    <div class="col-lg-6 col-xl-3">
                        <div class="card mb-5 mb-xl-0 test-cont-wrap">
                            <div class="card-body p-4">
                                <h4>직업가치관검사</h4>
                                <p class="test-cont-desc">직업과 관련된 다양한 가치 중, 어떤 가치를 중요하게 여기는지 알아볼 수 있습니다.</p>
                                <div class="d-flex test-cont-info">
                                    <div>
                                        <ul>
                                            <li>15~20분</li>
                                            <li>49문항</li>
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
                                    <button class="black-btn" onclick = "introOpen(1, 25)">검사소개</button>
                                    <button class="black-btn" onclick = "introOpen(2, 25)">검사결과 예시</button>
                                </div>
                                <button class="purple-btn" onclick="valuesStart()">검사시작</button>
                            </div>
                        </div>
                    </div>
                    <!-- 진로개발역량검사 -->
                    <div class="col-lg-6 col-xl-3">
                        <div class="card mb-5 mb-xl-0 test-cont-wrap">
                            <div class="card-body p-4">
                                <h4>진로개발역량검사</h4>
                                <p class="test-cont-desc">진로를 설계하고 준비하는데 요구되는 역량을 어느 정도 갖추고 있는지 알아볼 수 있습니다.</p>
                                <div class="d-flex test-cont-info">
                                    <div>
                                        <ul>
                                            <li>20분</li>
                                            <li>53문항</li>
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
                                    <button class="black-btn" onclick = "introOpen(1, 27)">검사소개</button>
                                    <button class="black-btn" onclick = "introOpen(2, 27)">검사결과 예시</button>
                                </div>
                                <button class="purple-btn" onclick="abilityStart()">검사시작</button>
                            </div>
                        </div>
                    </div>
                    <!-- 직업흥미검사 -->
                    <div class="col-lg-6 col-xl-3">
                        <div class="card mb-5 mb-xl-0 test-cont-wrap">
                            <div class="card-body p-4">
                                <h4>직업흥미검사</h4>
                                <p class="test-cont-desc">직업과 관련하여 어떤 흥미가 있는지 알아볼 수 있습니다.</p>
                                <div class="d-flex test-cont-info">
                                    <div>
                                        <ul>
                                            <li>15~20분</li>
                                            <li>153문항</li>
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
                                    <button class="black-btn" onclick = "introOpen(1, 31)">검사소개</button>
                                    <button class="black-btn" onclick = "introOpen(2, 31)">검사결과 예시</button>
                                </div>
                                <button class="purple-btn" onclick="interestStart()">검사시작</button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <%@ include file="../aiChatBot.jsp" %>
        </section>
    <%@ include file="../footer.jsp" %> 
    
        <!-- Bootstrap core JS-->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
    </body>
    <script>
    function sessionChk(){
    	  // `${name}`이 존재하지 않는 경우
        if (!"${name}") {
        	if (confirm("로그인 후 검사할 수 있습니다.\n로그인 화면으로 이동하시겠습니까?")== true) {
				location.href ='/whou/member/login';
		    } else {
		    	location.href = '/whou/aptitude/aptitudeMain';
		    }
        }else{
        	return true;
        }
    }
    
    function aptitudeStart() {
    	if(sessionChk()){
	  		location.href = '/whou/aptitude/itrstkAptitude?qnum=21';
    	}
    }
    function valuesStart() {
    	if(sessionChk()){
    		location.href = '/whou/aptitude/itrstkAptitude?qnum=25';
    	}
   }
    function abilityStart() {
    	if(sessionChk()){
    		location.href = '/whou/aptitude/itrstkAptitude?qnum=27';
    	}
   }
    function interestStart() {
    	if(sessionChk()){
    		location.href = '/whou/aptitude/itrstkAptitude?qnum=31';
    	}     
   }
    </script>
    
</html>