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
    </head>
    
    
 
<body>
        <!-- Responsive navbar-->
       <%@ include file="../header.jsp" %>     
    
              <header class="pt-5">
            <div class="container px-5">
                <h2 class="page-title">학과정보</h2>
                <section class="py-5" >
                	<form method="post" action="majorListSubmit" id="majorListForm">
                		<input type="hidden" name="perPage" id="perPageInput" >
                		<input type="hidden" name="thisPage" id="thisPageInput" >
	                    <div class="card edu-search-card">
	                        <div class="card-body">
	                            <div class="input-group search-form">
	                                <span class="search-btn"><i class="fa-solid fa-magnifying-glass fa-xl" style="color: #5a3fff;"></i></span>
	                                <input type="text" class="" name="searchTitle" placeholder="학과명을 입력하세요">
	                            </div>
	                            <div class="search-cont" >
	                                <h5>전공계열<span class="info"><i class="fa-solid fa-circle-info" style="color: #707070;"></i></span></h5>
	                                <ul class="check-group">
	                                    <li>
	                                        <div class="InpBox">
	                                            <input type="checkbox" id="agree_rule1" ${paramDTO.getSubject().length()>45 ? 'checked' : ''}>
	                                            <label class="Lbl check-fil check_off" for="agree_rule1">
	                                            전체
	                                            </label>                                                  
	                                        </div>
	                                    </li>
	                                    <li>
	                                        <div class="InpBox">
	                                            <input type="checkbox" id="agree_rule2" name="subject" value="100391" ${paramDTO.getSubject().contains('100391') ? 'checked' : ''}>
	                                            <label class="Lbl check-fil check_off" for="agree_rule2">
	                                            인문계열
	                                            </label>                                                  
	                                        </div>
	                                    </li>
	                                    <li>
	                                        <div class="InpBox">
	                                            <input type="checkbox" id="agree_rule3" name="subject" value="100392" ${paramDTO.getSubject().contains('100392') ? 'checked' : ''}>
	                                            <label class="Lbl check-fil check_off" for="agree_rule3">
	                                            사회계열
	                                            </label>                                                  
	                                        </div>
	                                    </li>
	                                    <li>
	                                        <div class="InpBox">
	                                            <input type="checkbox" id="agree_rule4" name="subject" value="100393" ${paramDTO.getSubject().contains('100393') ? 'checked' : ''}>
	                                            <label class="Lbl check-fil check_off" for="agree_rule4">
	                                            교육계열
	                                            </label>                                                  
	                                        </div>
	                                    </li>
	                                    <li>
	                                        <div class="InpBox">
	                                            <input type="checkbox" id="agree_rule5" name="subject" value="100394" ${paramDTO.getSubject().contains('100394') ? 'checked' : ''}>
	                                            <label class="Lbl check-fil check_off" for="agree_rule5">
	                                            공학계열
	                                            </label>                                                  
	                                        </div>
	                                    </li>
	                                    <li>
	                                        <div class="InpBox">
	                                            <input type="checkbox" id="agree_rule6" name="subject" value="100395" ${paramDTO.getSubject().contains('100395') ? 'checked' : ''}>
	                                            <label class="Lbl check-fil check_off" for="agree_rule6">
	                                            자연계열
	                                            </label>                                                  
	                                        </div>
	                                    </li>
	                                    <li>
	                                        <div class="InpBox">
	                                            <input type="checkbox" id="agree_rule7" name="subject" value="100396" ${paramDTO.getSubject().contains('100396') ? 'checked' : ''}>
	                                            <label class="Lbl check-fil check_off" for="agree_rule7">
	                                            의약계열
	                                            </label>                                                  
	                                        </div>
	                                    </li>
	                                    <li>
	                                        <div class="InpBox">
	                                            <input type="checkbox" id="agree_rule8" name="subject" value="100397" ${paramDTO.getSubject().contains('100397') ? 'checked' : ''}>
	                                            <label class="Lbl check-fil check_off" for="agree_rule8">
	                                            예체능계열
	                                            </label>                                                  
	                                        </div>
	                                    </li>
	                                </ul>
	                                <h5>학교유형</h5>
	                                <ul class="check-group">
	                                    <li>
	                                        <div class="InpBox">
	                                            <input type="checkbox" id="ok_rule1" ${paramDTO.getUnivSe().length()>10 ? 'checked' : ''}>
	                                            <label class="Lbl check-fil check_off" for="ok_rule1">
	                                            전체
	                                            </label>                                                  
	                                        </div>
	                                    </li>
	                                    <li>
	                                        <div class="InpBox">
	                                            <input type="checkbox" id="ok_rule2" name="univSe" value="univ" ${paramDTO.getUnivSe().contains('univ') ? 'checked' : ''}>
	                                            <label class="Lbl check-fil check_off" for="ok_rule2">
	                                            대학
	                                            </label>                                                  
	                                        </div>
	                                    </li>
	                                    <li>
	                                        <div class="InpBox">
	                                            <input type="checkbox" id="ok_rule3" name="univSe" value="college" ${paramDTO.getUnivSe().contains('college') ? 'checked' : ''}>
	                                            <label class="Lbl check-fil check_off" for="ok_rule3">
	                                            전문대학
	                                            </label>                                                  
	                                        </div>
	                                    </li>
	                                </ul>
	                            </div>
	                            <div class="search-bottom">
	                                <button class="purple-btn">조건검색</button>
	                            </div>
	                        </div>
	                    </div>
                    </form>
                </section>
            </div>
        </header>
        <!-- Features section-->
    
        <!-- Pricing section-->
        <section class="py-2 education-section">
            <div class="container px-5 my-5">
                <div class="result-top">
                    <p class="result-top-txt">총 <span>${univCount}</span>건이 검색되었습니다</p>
                    <div class="result-top-right">
                    	<!-- 
                        <select name="" id="">
                            <option value="">정렬순서</option>
                        </select>
                         -->
                        
                        <select name="perPage" id="perPageSelect">
                            <option value="10" ${paramDTO.getPerPage() ne '20' ? 'selected' : ''}>10개씩보기</option>
                            <option value="20" ${paramDTO.getPerPage() eq '20' ? 'selected' : ''}>20개씩보기</option>
                        </select>
                        <button class="square-btn" onclick="submitForm()">적용</button>
                        
                    </div>
                </div>
                
                <c:if test="${univCount==0}">
					<h5 style="text-align: center">검색 결과가 없습니다.</h5>
				</c:if>
                <c:if test="${RESULT != null}">
	                <div class="row justify-content-center">
		                <c:forEach items="${RESULT}"  var="eachRESULT" varStatus="status">
		                    <div class="edu-card">
		                        <div class="edu-item-tit">
		                            <div>
		                            	<a href="majorDetail?seq=${eachRESULT.getMajorSeq()}">${eachRESULT.getMClass()}</a> 
		                            	<span>${eachRESULT.getLClass()}</span>
		                            </div>
		                            <!-- <div><span>${eachRESULT.getLClass()}</span></div> -->
		                        </div>
		                        <div class="edu-item-cont">
		                        	<!-- 
		                            <div class="content">Lorem ipsum dolor sit amet consectetur adipisicing elit. Modi magnam, alias ipsa dolor animi corrupti laborum fuga. Incidunt, illo aperiam aut, perspiciatis facere, quisquam at quis omnis sit officia consequuntur.Lorem ipsum dolor sit amet consectetur adipisicing elit. Modi magnam, alias ipsa dolor animi corrupti laborum fuga. Incidunt, illo aperiam aut, perspiciatis facere, quisquam at quis omnis sit officia consequuntur.</div>
		                             -->
		                            <div class="disc">관련학과 : ${eachRESULT.getFacilName()}</div>
		                        </div>
		                        <!-- 
		                        <div class="edu-item-bottom">
		                            <div><i class="fa-solid fa-magnifying-glass" style="color: #707070;"></i> 조회수 : <span>33,042</span></div>
		                            <div><i class="fa-regular fa-thumbs-up" style="color: #707070;"></i> 추천수 : <span>2</span></div>
		                        </div>
		                         -->
		                    </div>
	                    </c:forEach>
		
	                <div class="pagination">
					    <nav aria-label="Page navigation">
						    <c:set var="totalCount" value="${univCount}" />
						    <c:set var="pageSize" value="${paramDTO.getPerPage()!=null && !paramDTO.getPerPage().isEmpty() ? Integer.parseInt(paramDTO.getPerPage()) : 10 }" />
						    <c:set var="totalPages" value="${Math.ceil(totalCount / pageSize)}" />
						    <c:set var="currentPage" value="${paramDTO.getThisPage()!=null && !paramDTO.getThisPage().isEmpty() ? Integer.parseInt(paramDTO.getThisPage()) : 1}" />
						    <ul class="pagination">
						        <c:if test="${totalPages > 1 && currentPage!=1}">
						            <li class="page-item" onclick="handlePageLinkClick(${currentPage - 1})">
						                <a class="page-link"  href="javascript:void(0)" aria-label="Previous">
						                    <span aria-hidden="true">&laquo;</span>
						                </a>
						            </li>
						        </c:if>
						        <c:choose>
						            <c:when test="${totalPages <= 10}">
						                <c:forEach begin="1" end="${totalPages}" varStatus="page">
						                    <li class="page-item ${page.index == currentPage ? 'active' : ''}" onclick="handlePageLinkClick(${page.index})">
						                        <a class="page-link" href="javascript:void(0)">${page.index}</a>
						                    </li>
						                </c:forEach>
						            </c:when>
						            <c:otherwise>
						                <c:choose>
						                    <c:when test="${currentPage <= 5}">
						                        <c:forEach begin="1" end="10" varStatus="page">
						                            <li class="page-item ${page.index == currentPage ? 'active' : ''}" onclick="handlePageLinkClick(${page.index})">
						                                <a class="page-link" href="javascript:void(0)">${page.index}</a>
						                            </li>
						                        </c:forEach>
						                    </c:when>
						                    <c:when test="${currentPage >= totalPages - 4}">
						                        <c:forEach begin="${totalPages - 9}" end="${totalPages}" varStatus="page">
						                            <li class="page-item ${page.index == currentPage ? 'active' : ''}" onclick="handlePageLinkClick(${page.index})">
						                                <a class="page-link" href="javascript:void(0)">${page.index}</a>
						                            </li>
						                        </c:forEach>
						                    </c:when>
						                    <c:otherwise>
						                        <c:forEach begin="${currentPage - 4}" end="${currentPage + 5}" varStatus="page">
						                            <li class="page-item ${page.index == currentPage ? 'active' : ''}" onclick="handlePageLinkClick(${page.index})">
						                                <a class="page-link" href="javascript:void(0)">${page.index}</a>
						                            </li>
						                        </c:forEach>
						                    </c:otherwise>
						                </c:choose>
						            </c:otherwise>
						        </c:choose>
						        <c:if test="${totalPages > 1 && currentPage!=totalPages}">
						            <li class="page-item" onclick="handlePageLinkClick(${currentPage + 1})" >
						                <a class="page-link"  href="javascript:void(0)" aria-label="Next">
						                    <span aria-hidden="true">&raquo;</span>
						                </a>
						            </li>
						        </c:if>
						    </ul>
						</nav>
					</div>
				</c:if>
            </div>
            <%@ include file="../aiChatBot.jsp" %>
        </section>
    <%@ include file="../footer.jsp" %> 
    
        <!-- Bootstrap core JS-->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
    </body>
    
    
    <script>

    	//10개씩 보기, 20개씩 보기 때문에 만든 스크립트
	    // HTML 코드에서 <select> 요소와 <input> 요소를 가져옵니다.
	    const selectElement = document.querySelector('#perPageSelect');
	    const inputPerPageElement = document.querySelector('input[name="perPage"]');
	    const inputThisPageElement = document.querySelector('input[name="thisPage"]');
	    const perPageInputElement = document.querySelector('#perPageInput');
	
	    // <select> 요소의 값이 변경될 때마다 호출되는 이벤트 핸들러를 설정합니다.
	    selectElement.addEventListener('change', function() {
	        // 선택된 <select> 요소의 값으로 <input> 요소의 값을 업데이트합니다.
	        inputPerPageElement.value = this.value;
	    });
	
	    // 초기에 <select> 요소의 값으로 <input> 요소의 값을 설정
	    inputPerPageElement.value = selectElement.value;
	    function submitForm() {
	        const form = document.getElementById('majorListForm'); // <form> 요소를 가져옵니다.
	        form.submit(); // <form> 요소를 제출합니다.
	    }
	</script>
	
	<script>
	    // 페이지 링크 클릭 시 폼 제출 이벤트 핸들러
	    function handlePageLinkClick(thisPage) {
	        // 폼 선택
	        const form = document.getElementById('majorListForm');
	        inputThisPageElement.value = thisPage;
	        form.submit();
	    }
	</script>
	
	<script>
		// 학과 상세 클릭하면 상세페이지로 이동
	    const resultInfoElements = document.querySelectorAll('.result-info');
	    resultInfoElements.forEach((element) => {
	        element.addEventListener('click', () => {
	            const majorSeq = element.dataset.majorseq;
	            // majorSeq 값을 사용하여 원하는 작업 수행
	            console.log(majorSeq); // 예시: 콘솔에 값을 로그로 출력
	            // majorSeq 값을 처리하기 위한 원하는 코드 추가
	        });
	    });
	</script>
	
	<script>
	
		// 체크박스 전체 선택 및 해제 처리 함수
		function handleCheckboxToggle(allCheckbox, checkboxes) {
		    // 전체 체크박스의 변경 이벤트 리스너 추가
		    allCheckbox.addEventListener('change', function() {
		        checkboxes.forEach(function(checkbox) {
		            checkbox.checked = allCheckbox.checked;
		        });
		    });
	
		    // 개별 체크박스의 변경 이벤트 리스너 추가
		    checkboxes.forEach(function(checkbox) {
		        checkbox.addEventListener('change', function() {
		            if (!checkbox.checked) {
		                allCheckbox.checked = false;
		            } else {
		                // 모든 체크박스가 선택되었는지 확인
		                const areAllChecked = Array.from(checkboxes).every(function(checkbox) {
		                    return checkbox.checked;
		                });
		                allCheckbox.checked = areAllChecked;
		            }
		        });
		    });
		}
	
		// 학교 유형 체크박스 처리
		const univAllCheckbox = document.getElementById('ok_rule1');
		const univCheckboxes = document.querySelectorAll('input[name="univSe"]');
		handleCheckboxToggle(univAllCheckbox, univCheckboxes);
	
		// 전공 유형 체크박스 처리
		const subjectAllCheckbox = document.getElementById('agree_rule1');
		const subjectCheckboxes = document.querySelectorAll('input[name="subject"]');
		handleCheckboxToggle(subjectAllCheckbox, subjectCheckboxes);
		
	</script>
	
	
    
    
    
</html>
