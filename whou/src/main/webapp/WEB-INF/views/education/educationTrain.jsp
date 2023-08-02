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
        <script src="https://kit.fontawesome.com/dbaea98925.js" crossorigin="anonymous"></script>
        <script src="https://code.jquery.com/jquery-latest.min.js"></script>
        <script src="/whou/resources/js/ai.js"></script>
        <link rel="stylesheet" href="/whou/resources/css/style.css?ver=1">
    </head>
    
    
 
<body>
        <!-- Responsive navbar-->
       <%@ include file="../header.jsp" %>     
    
              <header class="pt-5">
            <div class="container px-5">
                <h2 class="page-title">학과정보</h2>
                <section class="py-5" >
                	<form method="post" action="training" id="trainingForm" onsubmit="return trainSubmit();">
                		<input type="hidden" name="sort" id="sortInput">
                		<input type="hidden" name="pageNum" value="${currentPage}" />
	                    <div class="card edu-search-card">
	                        <div class="card-body">
	                        	<!-- 
		                        <div class="edu-train-search-form">
									<div class="input-group mb-3">
										<div>
											<span class="input-group-text" id="basic-addon3">훈련기관명</span>
											<input type="text" class="form-control" id="basic-url" name="srchTraOrganNm"
												aria-describedby="basic-addon3" value ="${hrdParam.getSrchTraOrganNm()}" placeholder="훈련기관명을 입력하세요">
										</div>
										<div>
											<span class="input-group-text" id="basic-addon3">훈련과정명</span>
											<input type="text" class="form-control" id="basic-url" name="srchTraProcessNm"
												aria-describedby="basic-addon3" value="${hrdParam.getSrchTraProcessNm()}" placeholder="훈련과정명을 입력하세요">
										</div>
									</div>
								</div>
								 -->
								<div class="search-cont">
									<div class="input-group mb-3">
										<label class="input-group-text" id="train-select-label" style="background:#5A3FFF; color:#fff " for="inputGroupSelect01">훈련유형</label>
										<select name="trainGb" class="form-select" id="inputGroupSelect01" autofocus>
											<option>선택 필수 입니다.</option>
											<option value="11" ${hrdParam.getTrainGb()=='11'? 'selected':''}>국민내일배움카드 훈련</option>
											<option value="12" ${hrdParam.getTrainGb()=='12'? 'selected':''}>사업주훈련 훈련</option>
											<option value="13" ${hrdParam.getTrainGb()=='13'? 'selected':''}>국가인적자원개발 컨소시엄 훈련</option>
											<option value="14" ${hrdParam.getTrainGb()=='14'? 'selected':''}>일학습병행 훈련</option>
										</select>
									</div>
									<div class="input-group mb-3">
										<label class="input-group-text" for="inputGroupSelect01">지역</label>
										<select name="srchTraArea1" class="form-select" id="inputGroupSelect01">
											<option value="">지역을 선택하세요</option>
											<option value="43" ${hrdParam.getSrchTraArea1()=='43'? 'selected':''}>경기</option>
											<option value="50" ${hrdParam.getSrchTraArea1()=='50'? 'selected':''}>경남</option>
											<option value="48" ${hrdParam.getSrchTraArea1()=='48'? 'selected':''}>경북</option>
											<option value="30" ${hrdParam.getSrchTraArea1()=='30'? 'selected':''}>광주</option>
											<option value="28" ${hrdParam.getSrchTraArea1()=='28'? 'selected':''}>대구</option>
											<option value="31" ${hrdParam.getSrchTraArea1()=='31'? 'selected':''}>대전</option>
											<option value="26" ${hrdParam.getSrchTraArea1()=='26'? 'selected':''}>부산</option>
											<option value="11" ${hrdParam.getSrchTraArea1()=='11'? 'selected':''}>서울</option>
											<option value="41" ${hrdParam.getSrchTraArea1()=='41'? 'selected':''}>세종</option>
											<option value="36" ${hrdParam.getSrchTraArea1()=='36'? 'selected':''}>울산</option>
											<option value="29" ${hrdParam.getSrchTraArea1()=='29'? 'selected':''}>인천</option>
											<option value="47" ${hrdParam.getSrchTraArea1()=='47'? 'selected':''}>전남</option>
											<option value="46" ${hrdParam.getSrchTraArea1()=='46'? 'selected':''}>전북</option>
											<option value="51" ${hrdParam.getSrchTraArea1()=='51'? 'selected':''}>제주</option>
											<option value="45" ${hrdParam.getSrchTraArea1()=='45'? 'selected':''}>충남</option>
											<option value="44" ${hrdParam.getSrchTraArea1()=='44'? 'selected':''}>충북</option>
										</select>
										
										<label class="input-group-text" for="inputGroupSelect01">직종</label>
										<select name="setSrchNcs1" class="form-select" id="inputGroupSelect01">
											<option value="">직종을 선택하세요</option>
											<option value="01" ${hrdParam.getSrchNcs1()=='01' || hrdParam.getSrchKeco1()=='01' ? 'selected':''}>사업관리</option>
											<option value="02" ${hrdParam.getSrchNcs1()=='02' || hrdParam.getSrchKeco1()=='02' ? 'selected':''}>경영/회계/사무</option>
											<option value="03" ${hrdParam.getSrchNcs1()=='03' || hrdParam.getSrchKeco1()=='03' ? 'selected':''}>금융/보험</option>
											<option value="04" ${hrdParam.getSrchNcs1()=='04' || hrdParam.getSrchKeco1()=='04' ? 'selected':''}>교육/자연/사회과학</option>
											<option value="05" ${hrdParam.getSrchNcs1()=='05' || hrdParam.getSrchKeco1()=='05' ? 'selected':''}>법률/경찰/소방/교도/국방</option>
											<option value="06" ${hrdParam.getSrchNcs1()=='06' || hrdParam.getSrchKeco1()=='06' ? 'selected':''}>보건/의료</option>
											<option value="07" ${hrdParam.getSrchNcs1()=='07' || hrdParam.getSrchKeco1()=='07' ? 'selected':''}>사회복지/종교</option>
											<option value="08" ${hrdParam.getSrchNcs1()=='08' || hrdParam.getSrchKeco1()=='08' ? 'selected':''}>문화/예술/디자인/방송</option>
											<option value="09" ${hrdParam.getSrchNcs1()=='09' || hrdParam.getSrchKeco1()=='09' ? 'selected':''}>운전/운송</option>
											<option value="10" ${hrdParam.getSrchNcs1()=='10' || hrdParam.getSrchKeco1()=='10' ? 'selected':''}>영업판매</option>
											<option value="11" ${hrdParam.getSrchNcs1()=='11' || hrdParam.getSrchKeco1()=='11' ? 'selected':''}>경비/청소</option>
											<option value="12" ${hrdParam.getSrchNcs1()=='12' || hrdParam.getSrchKeco1()=='12' ? 'selected':''}>이용/숙박/여행/오락/스포츠</option>
											<option value="13" ${hrdParam.getSrchNcs1()=='13' || hrdParam.getSrchKeco1()=='13' ? 'selected':''}>음식서비스</option>
											<option value="14" ${hrdParam.getSrchNcs1()=='14' || hrdParam.getSrchKeco1()=='14' ? 'selected':''}>건설</option>
											<option value="15" ${hrdParam.getSrchNcs1()=='15' || hrdParam.getSrchKeco1()=='15' ? 'selected':''}>기계</option>
											<option value="16" ${hrdParam.getSrchNcs1()=='16' || hrdParam.getSrchKeco1()=='16' ? 'selected':''}>재료</option>
											<option value="17" ${hrdParam.getSrchNcs1()=='17' || hrdParam.getSrchKeco1()=='17' ? 'selected':''}>화학</option>
											<option value="18" ${hrdParam.getSrchNcs1()=='18' || hrdParam.getSrchKeco1()=='18' ? 'selected':''}>섬유/의복</option>
											<option value="19" ${hrdParam.getSrchNcs1()=='19' || hrdParam.getSrchKeco1()=='19' ? 'selected':''}>전기/전자</option>
											<option value="20" ${hrdParam.getSrchNcs1()=='20' || hrdParam.getSrchKeco1()=='20' ? 'selected':''}>정보통신</option>
											<option value="21" ${hrdParam.getSrchNcs1()=='21' || hrdParam.getSrchKeco1()=='21' ? 'selected':''}>식품가공</option>
											<option value="22" ${hrdParam.getSrchNcs1()=='22' || hrdParam.getSrchKeco1()=='22' ? 'selected':''}>인쇄/목재/가구/공예</option>
											<option value="23" ${hrdParam.getSrchNcs1()=='23' || hrdParam.getSrchKeco1()=='23' ? 'selected':''}>환경/에너지/안전</option>
											<option value="24" ${hrdParam.getSrchNcs1()=='24' || hrdParam.getSrchKeco1()=='24' ? 'selected':''}>농림어업</option>
										</select>
									</div>
									<div class="edu-train-date-input">
									
										개강 일자 <input type="date" name="srchTraStDt" id="start-date" required>
										<span class="d-inline-block" tabindex="0"
											data-bs-toggle="popover" data-bs-trigger="hover focus"
											data-bs-content="Disabled popover" id="example" data-bs-placement="top" >
											~ <input type="date" name="srchTraEndDt" id="end-date" readonly required>
										</span>
										<button type="button" class="btn btn-outline-secondary" id="btn-one-week">일주일</button>
										<button type="button" class="btn btn-outline-secondary" id="btn-one-month">한달</button>
										<button type="button" class="btn btn-outline-secondary" id="btn-three-months">3개월</button>
										<%-- 제출 시 디폴트 --%>
					                    <input type="hidden" id="startDateInput" value="${hrdParam.getSrchTraStDt()}">
					                    <input type="hidden" id="endDateInput" value="${hrdParam.getSrchTraEndDt()}">
									</div>
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
                    <p class="result-top-txt">
                    	총 <span>${hrdCount}</span>건이 검색되었습니다.
                    	(최대 100건까지만 검색 가능합니다.)
                    </p>
                    <div class="result-top-right">
                        <select name="" id="sortSelect" onchange="updateSortInput()">
                            <option value="ASC" ${hrdParam.getSort() eq 'ASC' ? 'selected' : ''}>오름차순(마감일)</option>
                            <option value="DESC" ${hrdParam.getSort() eq 'DESC' ? 'selected' : ''}>내림차순(마감일)</option>
                        </select>
                        <button class="square-btn" onclick="submitForm()">적용</button>
                    </div>
                </div>

			<!-- 페이징 -->
						
			<c:if test="${responseDTO != null}">
				<c:if test="${hrdCount==0}">
					<h5 style="text-align: center">검색 결과가 없습니다.</h5>
				</c:if>
				
				<c:if test="${hrdCount>0}">
	                <div class="row justify-content-center">
						<div class="container text-center edu-train-cart-subject">
							<div class="row">
								<div class="col">기관명</div>
								<div class="col-6 edu-train-detail">강의 내용</div>
								<div class="col"></div>
							</div>
						</div>
		                <c:forEach items="${responseDTO}"  var="eachResponseDTO" varStatus="status">
							<div class="container text-center edu-train-cart">
								<div class="row">
									<div class="col"><h5>${eachResponseDTO.getSubTitle()}</h5></div>
									<div class="col-6 edu-train-detail">
										<div><h6>강의명 ${eachResponseDTO.getTitle()}</h6></div>
										<div><span>지역</span> ${eachResponseDTO.getAddress()}</div>
										<div><span>기간</span> ${eachResponseDTO.getTraStartDate()} ~ ${eachResponseDTO.getTraEndDate()}</div>
									</div>
									<div class="col"><a class="btn btn-primary" href="${eachResponseDTO.getTitleLink()}" target="_blank" role="button">자세히 보기</a></div>
								</div>
							</div>
						</c:forEach>
				
					    <c:set var="totalCount" value="${hrdCount}" />
						<c:set var="pageSize" value="20" />
						<c:set var="totalPages" value="${Math.ceil(totalCount / pageSize)}" />
						<c:set var="currentPage" value="${hrdParam.getPageNum() != null && !hrdParam.getPageNum().isEmpty() ? Integer.parseInt(hrdParam.getPageNum()) : '1'}" />
		                <div class="pagination">
						    <nav aria-label="Page navigation">
							    <ul class="pagination">
							        <c:if test="${totalPages > 1 && currentPage!=1}">
							            <li class="page-item">
							                <a class="page-link" href="#" onclick="handlePageLinkClick(${currentPage - 1})" aria-label="Previous">
							                    <span aria-hidden="true">&laquo;</span>
							                </a>
							            </li>
							        </c:if>
			                        <c:forEach begin="1" end="${totalPages}" varStatus="page">
			                            <li class="page-item ${page.index == currentPage ? 'active' : ''}" onclick="handlePageLinkClick(${page.index})">
			                                <a class="page-link" href="#">${page.index}</a>
			                            </li>
			                        </c:forEach>
							        <c:if test="${totalPages > 1 && currentPage!=totalPages}">
							            <li class="page-item">
							                <a class="page-link" href="#" onclick="handlePageLinkClick(${currentPage + 1})" aria-label="Next">
							                    <span aria-hidden="true">&raquo;</span>
							                </a>
							            </li>
							        </c:if>
							    </ul>
							</nav>
						</div>
					</c:if>
				</c:if>
            </div>
            <%@ include file="../aiChatBot.jsp" %>
        </section>
    <%@ include file="../footer.jsp" %> 
    
        <!-- Bootstrap core JS-->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
    </body>
	
	
	<!-- Modal -->
	<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
	  <div class="modal-dialog">
	    <div class="modal-content">
	      <div class="modal-header">
	        <h1 class="modal-title fs-5" id="exampleModalLabel">잘못된 검색입니다.</h1>
	        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
	      </div>
	      <div class="modal-body">
	        훈련유형을 선택해주세요.
	      </div>
	      <div class="modal-footer">
	        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal" >닫기</button>
	      </div>
	    </div>
	  </div>
	</div>
</html>
<script>
	// 필수값 누락 시 모달창
	function trainSubmit() {
		var inputValue = $('select[name=trainGb]').val();
		if(isNaN(inputValue)){
			$('#exampleModal').modal('show');
			return false;
		}
   }
    
	// 페이지 로딩 시 실행되는 함수
	document.addEventListener('DOMContentLoaded', function() {
		//종강일자 선택불가 안내 팝오버
	    const exampleEl = document.getElementById('example');
	    const popover = new bootstrap.Popover(exampleEl, {
	      content: "종강 일자는 일주일, 한달, 3개월 버튼으로만 설정 가능합니다.",
	      trigger: "hover focus"
	    });
	  });
	
    
	const startDateString = document.getElementById('startDateInput');
	const endDateString = document.getElementById('endDateInput');
	if (startDateString != null && endDateString != null && startDateString.value.trim() != "" && endDateString.value.trim() != "") {
	    // 제출한 date 유지하기
		document.getElementById('start-date').value = startDateString.value;
	    document.getElementById('end-date').value = endDateString.value;
	}else{
	    // 오늘 날짜를 가져오기 위한 함수
	    document.getElementById('start-date').value = new Date().toISOString().substring(0, 10);
	    document.getElementById('end-date').value = new Date().toISOString().substring(0, 10);
	}
	
	//jquery 1주일, 1달, 3달 증가 버튼
	$(document).ready(function() {
	    $("#btn-one-week").click(function() { updateEndDate(7, "day"); });
	    $("#btn-one-month").click(function() { updateEndDate(1, "month"); });
	    $("#btn-three-months").click(function() { updateEndDate(3, "month"); });
	    
	 	// 종강 일자를 업데이트
	    function updateEndDate(interval, unit) {
	 		//HTML 요소의 값을 가져와서 JavaScript의 Date 객체를 생성
	        var startDate = new Date($("#start-date").val());
	        if (!isNaN(startDate.getTime())) {
	        	// 종강 일자를 일 또는 월 단위로 증가시킴
	            var endDate = new Date(startDate);
	            switch (unit) {
	                case "day":
	                    endDate.setDate(endDate.getDate() + interval); // 일 단위로 증가
	                    break;
	                case "month":
	                    endDate.setMonth(endDate.getMonth() + interval); // 월 단위로 증가
	                    break;
	                default:
	                    break;
	            }
	         	// 종강 일자를 YYYY-MM-DD 형식으로 변환
	            var endDateFormatted = endDate.toISOString().split("T")[0];
	            $("#end-date").val(endDateFormatted);
	        }
	    }
	});
	
	
	
	
</script>

<script>
	// 정렬 값을 보내기
	function updateSortInput() {
        var sortSelect = document.getElementById("sortSelect");
        var sortInput = document.getElementById("sortInput");
        sortInput.value = sortSelect.value;
    }
	
	
     const form = document.getElementById('trainingForm'); // <form> 요소를 가져옵니다.
	// 초기에 <select> 요소의 값으로 <input> 요소의 값을 설정
    function submitForm() {
        form.submit(); // <form> 요소를 제출합니다.
    }

	// 페이지 링크 클릭 시 폼 제출 이벤트 핸들러
    function handlePageLinkClick(pageNumber) {
        var pageNumInput = document.querySelector('input[name="pageNum"]');
        pageNumInput.value= pageNumber;
        form.submit();
    }
</script>



