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
        <link rel="stylesheet" href="/whou/resources/css/style.css?ver=1">
        <script src="https://kit.fontawesome.com/dbaea98925.js" crossorigin="anonymous"></script>
        <link rel="stylesheet" href="/whou/resources/css/eduDetailStyle.css?ver=2">
        <script src="https://code.jquery.com/jquery-latest.min.js"></script>
    </head>
    
    
 
<body>
        <!-- Responsive navbar-->
       <%@ include file="../header.jsp" %>     
    
              <header class="pt-5">
            <div class="container px-5">
                <h2 class="page-title">학과정보</h2>
                <section class="py-5" >
                	<form method="post" action="training" id="majorListForm" onsubmit="return trainSubmit();">
                		<input type="hidden" name="perPage" id="perPageInput" >
                		<input type="hidden" name="thisPage" id="thisPageInput" >
	                    <div class="card edu-search-card">
	                        <div class="card-body">
		                        <div class="edu-train-search-form">
									<div class="input-group mb-3">
										<div>
											<span class="input-group-text" id="basic-addon3">훈련기관명</span>
											<input type="text" class="form-control" id="basic-url"
												aria-describedby="basic-addon3" placeholder="훈련기관명을 입력하세요">
										</div>
										<div>
											<span class="input-group-text" id="basic-addon3">훈련과정명</span>
											<input type="text" class="form-control" id="basic-url"
												aria-describedby="basic-addon3" placeholder="훈련과정명을 입력하세요">
										</div>
									</div>
								</div>
									<div class="search-cont">
										<div class="input-group mb-3">
											<label class="input-group-text" for="inputGroupSelect01">훈련유형</label>
											<select name="trainGb" class="form-select" id="inputGroupSelect01">
												<option>선택 필수 입니다.</option>
												<option value="11">국민내일배움카드 훈련</option>
												<option value="12">사업주훈련 훈련</option>
												<option value="13">국가인적자원개발 컨소시엄 훈련</option>
												<option value="14">일학습병행 훈련</option>
											</select>
										</div>
										<div class="input-group mb-3">
											<label class="input-group-text" for="inputGroupSelect01">지역</label>
											<select name="srchTraArea1" class="form-select" id="inputGroupSelect01">
												<option></option>
												<option value="43">경기</option>
												<option value="50">경남</option>
												<option value="48">경북</option>
												<option value="30">광주</option>
												<option value="28">대구</option>
												<option value="31">대전</option>
												<option value="26">부산</option>
												<option value="11">서울</option>
												<option value="41">세종</option>
												<option value="36">울산</option>
												<option value="29">인천</option>
												<option value="47">전남</option>
												<option value="46">전북</option>
												<option value="51">제주</option>
												<option value="45">충남</option>
												<option value="44">충북</option>
											</select>
											
											<label class="input-group-text" for="inputGroupSelect01">직종</label>
											<select name="setSrchNcs1" class="form-select" id="inputGroupSelect01">
												<option></option>
												<option value="01">사업관리</option>
												<option value="02">경영/회계/사무</option>
												<option value="03">금융/보험</option>
												<option value="04">교육/자연/사회과학</option>
												<option value="05">법률/경찰/소방/교도/국방</option>
												<option value="06">보건/의료</option>
												<option value="07">사회복지/종교</option>
												<option value="08">문화/예술/디자인/방송</option>
												<option value="09">운전/운송</option>
												<option value="10">영업판매</option>
												<option value="11">경비/청소</option>
												<option value="12">이용/숙박/여행/오락/스포츠</option>
												<option value="13">음식서비스</option>
												<option value="14">건설</option>
												<option value="15">기계</option>
												<option value="16">재료</option>
												<option value="17">화학</option>
												<option value="18">섬유/의복</option>
												<option value="19">전기/전자</option>
												<option value="20">정보통신</option>
												<option value="21">식품가공</option>
												<option value="22">인쇄/목재/가구/공예</option>
												<option value="23">환경/에너지/안전</option>
												<option value="24">농림어업</option>
											</select>
										</div>
										<div class="edu-train-date-input">
											개강 일자 <input type="date" name="srchTraStDt" id="start-date" onchange="setEndDateSameAsStartDate()">
											<span class="d-inline-block" tabindex="0"
												data-bs-toggle="popover" data-bs-trigger="hover focus"
												data-bs-content="Disabled popover" id="example" data-bs-placement="top" >
												종강 일자 <input type="date" name="srchTraEndDt" id="end-date" readonly>
											</span>
											<button type="button" class="btn btn-outline-secondary" id="btn-one-week">일주일</button>
											<button type="button" class="btn btn-outline-secondary" id="btn-one-month">한달</button>
											<button type="button" class="btn btn-outline-secondary" id="btn-three-months">3개월</button>
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
                        <select name="" id="">
                            <option value="ASC" ${hrdParam.getSort() eq 'ASC' ? 'selected' : ''}>오름차순(마감일)</option>
                            <option value="DESC" ${hrdParam.getSort() eq 'DESC' ? 'selected' : ''}>내림차순(마감일)</option>
                        </select>
                        <button class="square-btn" onclick="submitForm()">적용</button>
                    </div>
                </div>

			

			<c:if test="${responseDTO != null}">
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
			
	                <div class="pagination">
					    <nav aria-label="Page navigation">
						    <c:set var="totalCount" value="${hrdCount}" />
							<c:set var="pageSize" value="20" /> <!-- Set page size to 20 -->
							<c:set var="totalPages" value="${Math.ceil(totalCount / pageSize)}" />
							<c:set var="currentPage" value="${hrdParam.getPageNum()!=null && !hrdParam.getPageNum().isEmpty() ? Integer.parseInt(hrdParam.getPageNum()) : 1}" />
						    <ul class="pagination">
						        <c:if test="${totalPages > 1 && currentPage!=1}">
						            <li class="page-item">
						                <a class="page-link" href="majorListSubmit?thisPage=${currentPage - 1}" onclick="handlePageLinkClick(${currentPage - 1})" aria-label="Previous">
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
						            <li class="page-item">
						                <a class="page-link" href="majorListSubmit?thisPage=${currentPage + 1}" onclick="handlePageLinkClick(${currentPage + 1})" aria-label="Next">
						                    <span aria-hidden="true">&raquo;</span>
						                </a>
						            </li>
						        </c:if>
						    </ul>
						</nav>
					</div>
				</c:if>
            </div>
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
	        <h1 class="modal-title fs-5" id="exampleModalLabel">Modal title</h1>
	        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
	      </div>
	      <div class="modal-body">
	        훈련유형을 선택해주세요.
	      </div>
	      <div class="modal-footer">
	        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
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
	
	//종강일자 선택불가 안내 팝오버
	document.addEventListener('DOMContentLoaded', function() {
	    const exampleEl = document.getElementById('example');
	    const popover = new bootstrap.Popover(exampleEl, {
	      content: "종강 일자는 일주일, 한달, 3개월 버튼으로만 설정 가능합니다.",
	      trigger: "hover focus"
	    });
	  });

	//오늘 날짜를 가져오기 위한 함수
	document.getElementById('start-date').value = new Date().toISOString().substring(0, 10);
	document.getElementById('end-date').value = new Date().toISOString().substring(0, 10);
	
	// 종강 일자를 개강 일자와 동일하게 설정
	function setEndDateSameAsStartDate() {
	      const startDateInput = document.getElementById('start-date');
	      const endDateInput = document.getElementById('end-date');
	      endDateInput.value = startDateInput.value;
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
