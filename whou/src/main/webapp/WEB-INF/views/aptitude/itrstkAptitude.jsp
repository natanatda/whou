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
		<script src="https://unpkg.com/three@0.128.0/build/three.min.js"></script>
		<script src="https://unpkg.com/three@0.128.0/examples/js/controls/OrbitControls.js"></script>
		<script src="/whou/resources/js/unpkg.com_gsap@3.12.1_dist_gsap.min.js"></script>
		<script src="/whou/resources/js/ThreeCSG.js"></script>
        <script type="module" src="/whou/resources/js/whouModel2.js"></script>
		<script src="/whou/resources/js/ai.js"></script>	
    </head>
     <style>
		.loading-wrap{width:100%;
		    height: 100vh;
		position: fixed;	
    z-index:999999;
    background:#fff;
    display:none;
    }
    .loading-wrap .webgl{
    position: absolute;
    top: 50%;
    left: 50%;
    transform: translate(-50%, -50%);
    }
	</style>
    

<body>
   <div class="loading-wrap">
        <canvas class="webgl" ></canvas> <%-- ai --%>
    </div>
       <!-- Responsive navbar-->
       <%@ include file="../header.jsp" %>

	<!-- Pricing section-->
	<section class="py-2 aptitude aptitude-section">
		<div class="container px-5 my-5">
		<c:if test="${qnum eq '21' || qnum == '21'}">
			<h2 class="page-title">직업적성검사</h2>
		</c:if>
		<c:if test="${qnum eq '31' || qnum == '31'}">
			<h2 class="page-title">직업흥미검사</h2>
		</c:if>
		<c:if test="${qnum eq '25' || qnum == '25'}">
			<h2 class="page-title">직업가치관검사</h2>
		</c:if>
		<c:if test="${qnum eq '27' || qnum == '27'}">
			<h2 class="page-title">직업역량검사</h2>
		</c:if>

			<div class="row aptitude-content">
				<div class="col-lg-12 col-xl-12">
				<form action="report" method="post" id = "reportForm" onsubmit="return nonBt()">
				<div class="top-nav">
					<h3 class="page-count">
						<span>0</span> / <span>${fn:length(RESULT)}</span>
					</h3>
					<div class="progress">
						<div class="progress-bar" role="progressbar" aria-label="Example with label" style="width: 0%;" aria-valuenow="25" aria-valuemin="0" aria-valuemax="100"></div>
						<div><span>0</span>%</div>
					</div>
					<button type="submit" class="white-btn" formaction="temporarySave" onclick="submitForm()">임시저장</button>
				</div>
					
						<input type="hidden" name="qnum" value="${qnum}">
						<input type="hidden" name="countQ" value="${fn:length(RESULT)}">
						<input type="hidden" name="tempSave" value="${param.tempSave != null ? param.tempSave : ''}">
						
						
						<c:if test="${qnum eq '27' || qnum == '27'}" >
							<div class="top-question">
								<span class="top-num"></span>
								<p class="top-q">
									다음 문항들은 여러가지 종류의 직업에서 이루어지는 활동들을 나타내고 있습니다.<br>
									장래의 직업으로서 다음 활동들을 얼마나 좋아하는지를 생각해보고 답하십시오.
								</p>
							</div>
							<ul class="question-wrap">
								<c:forEach items="${RESULT}" var="item" varStatus="status">
									<li>
										<div class="question-item">
											<span class="ic-question">${item.qitemNo}</span>${item.question}
										</div>
										
										<div class="btn-group radio-group" role="group" aria-label="Basic radio toggle button group">
											<input type="radio" class="btn-check" name="btnradio${status.index+1}" id="btnradio${status.index * 5 + 1}" value="1" ${arrList[status.index]=='1' ? 'checked' : ''} autocomplete="off" >
											<label class="btn btn-outline-primary" for="btnradio${status.index * 5 + 1}">${item.answer01}</label>
	
											<input type="radio" class="btn-check" name="btnradio${status.index+1}" id="btnradio${status.index * 5 + 2}" value="2" ${arrList[status.index]=='2' ? 'checked' : ''} autocomplete="off" >
											<label class="btn btn-outline-primary" for="btnradio${status.index * 5 + 2}">${item.answer02}</label>
	
											<input type="radio" class="btn-check" name="btnradio${status.index+1}" id="btnradio${status.index * 5 + 3}" value="3" ${arrList[status.index]=='3' ? 'checked' : ''} autocomplete="off" >
											<label class="btn btn-outline-primary" for="btnradio${status.index * 5 + 3}">${item.answer03}</label>
	
											<input type="radio" class="btn-check" name="btnradio${status.index+1}" id="btnradio${status.index * 5 + 4}" value="4" ${arrList[status.index]=='4' ? 'checked' : ''} autocomplete="off" checked >
											<label class="btn btn-outline-primary" for="btnradio${status.index * 5 + 4}">${item.answer04}</label>
	
											<input type="radio" class="btn-check" name="btnradio${status.index+1}" id="btnradio${status.index * 5 + 5}" value="5" ${arrList[status.index]=='5' ? 'checked' : ''} autocomplete="off">
											<label class="btn btn-outline-primary" for="btnradio${status.index * 5 + 5}">${item.answer05}</label>
										</div>
									</li>
								</c:forEach>
							</ul>
						</c:if>
						
						<c:if test="${qnum eq '21' || qnum == '21'}" >
							<div class="top-question">
								<span class="top-num"></span>
								<p class="top-q">
									다음 문항들은 여러가지 종류의 직업에서 이루어지는 활동들을 나타내고 있습니다.<br>
									장래의 직업으로서 다음 활동들을 얼마나 좋아하는지를 생각해보고 답하십시오.
									  
								</p>
							</div>
							<ul class="question-wrap num">
								<c:forEach var="item" items="${RESULT}" varStatus="status">
		                            <li>
		                                <div class="question-item"><span class="ic-question">${item.qitemNo}</span><div>${item.question}</div></div>
		                                <c:if test="${item.qitemNo == 51}"><div style="margin-left: 420px;"><img src="/whou/resources/img/img_q51.png"/></div></c:if>
		                                <c:if test="${item.qitemNo == 53}"><div><img src="/whou/resources/img/img_q53.png"/></div></c:if>
		                                
		                                <div class="question-dt">
		                                    <div class="question-dt-info">${item.tip1Desc}</div>
		                                    <div class="question-dt-info">${item.tip2Desc}</div>
		                                  
		                                </div>
		                                <div class="btn-group radio-group" role="group" aria-label="Basic radio toggle button group">
		                                    <input type="radio" class="btn-check" name="btnradio${status.index + 1}" id="btnradio${status.index * 7 + 1}" value="1" ${arrList[status.index]=='1' ? 'checked' : ''} autocomplete="off" >
		                                    <label class="btn btn-outline-primary" for="btnradio${status.index * 7 + 1}">1</label>
		                                  
		                                    <input type="radio" class="btn-check" name="btnradio${status.index + 1}" id="btnradio${status.index * 7 + 2}" value="2" ${arrList[status.index]=='2' ? 'checked' : ''} autocomplete="off">
		                                    <label class="btn btn-outline-primary" for="btnradio${status.index * 7 + 2}">2</label>
		                                  
		                                    <input type="radio" class="btn-check" name="btnradio${status.index + 1}" id="btnradio${status.index * 7 + 3}" value="3" ${arrList[status.index]=='3' ? 'checked' : ''} autocomplete="off" >
		                                    <label class="btn btn-outline-primary" for="btnradio${status.index * 7 + 3}">3</label>
		
		                                    <input type="radio" class="btn-check" name="btnradio${status.index + 1}" id="btnradio${status.index * 7 + 4}" value="4" ${arrList[status.index]=='4' ? 'checked' : ''} autocomplete="off" >
		                                    <label class="btn btn-outline-primary" for="btnradio${status.index * 7 + 4}">4</label>
		                                    
		                                    <input type="radio" class="btn-check" name="btnradio${status.index + 1}" id="btnradio${status.index * 7 + 5}" value="5" ${arrList[status.index]=='5' ? 'checked' : ''} autocomplete="off" >
		                                    <label class="btn btn-outline-primary" for="btnradio${status.index * 7 + 5}">5</label>
		
		                                    <input type="radio" class="btn-check" name="btnradio${status.index + 1}" id="btnradio${status.index * 7 + 6}" value="6" ${arrList[status.index]=='6' ? 'checked' : ''} autocomplete="off" che>
		                                    <label class="btn btn-outline-primary" for="btnradio${status.index * 7 + 6}">6</label>
		
		                                    <input type="radio" class="btn-check" name="btnradio${status.index + 1}" id="btnradio${status.index * 7 + 7}" value="7" ${arrList[status.index]=='7' ? 'checked' : ''} autocomplete="off">
		                                    <label class="btn btn-outline-primary" for="btnradio${status.index * 7 + 7}">7</label>
		                                  </div>
		                            </li>
								</c:forEach>
	                       </ul>
						</c:if>
						
						<c:if test="${qnum eq '31' || qnum == '31'}" >
							<div class="top-question">
								<span class="top-num"></span>
								<p class="top-q">
									다음 문항들은 여러가지 종류의 직업에서 이루어지는 활동들을 나타내고 있습니다.<br>
									장래의 직업으로서 다음 활동들을 얼마나 좋아하는지를 생각해보고 답하십시오.
								</p>
							</div>
							<ul class="question-wrap">
								<c:forEach items="${RESULT}" var="item" varStatus="status">
									<li>
										<div class="question-item">
											<span class="ic-question">${item.qitemNo}</span>${item.question}
										</div>
										
										<div class="btn-group radio-group" role="group" aria-label="Basic radio toggle button group">
											<input type="radio" class="btn-check" name="btnradio${status.index+1}" id="btnradio${status.index * 4 + 1}" value="1" ${arrList[status.index]=='1' ? 'checked' : ''} autocomplete="off">
											<label class="btn btn-outline-primary" for="btnradio${status.index * 4 + 1}">${item.answer01}</label>
	
											<input type="radio" class="btn-check" name="btnradio${status.index+1}" id="btnradio${status.index * 4 + 2}" value="2" ${arrList[status.index]=='2' ? 'checked' : ''} autocomplete="off">
											<label class="btn btn-outline-primary" for="btnradio${status.index * 4 + 2}">${item.answer02}</label>
	
											<input type="radio" class="btn-check" name="btnradio${status.index+1}" id="btnradio${status.index * 4 + 3}" value="3" ${arrList[status.index]=='3' ? 'checked' : ''} autocomplete="off">
											<label class="btn btn-outline-primary" for="btnradio${status.index * 4 + 3}">${item.answer03}</label>
	
											<input type="radio" class="btn-check" name="btnradio${status.index+1}" id="btnradio${status.index * 4 + 4}" value="4" ${arrList[status.index]=='4' ? 'checked' : ''} autocomplete="off">
											<label class="btn btn-outline-primary" for="btnradio${status.index * 4 + 4}">${item.answer04}</label>
										</div>
									</li>
								</c:forEach>
							</ul>
						</c:if>
						
						<c:if test="${qnum eq '25' || qnum == '25'}" >
							<div class="top-question">
								<span class="top-num"></span>
								<p class="top-q">
									다음 문항들은 여러가지 종류의 직업에서 이루어지는 활동들을 나타내고 있습니다.<br>
									장래의 직업으로서 다음 활동들을 얼마나 좋아하는지를 생각해보고 답하십시오.
								</p>
							</div>
							<ul class="question-wrap">
								<c:forEach items="${RESULT}" var="item" varStatus="status">
									<c:if test="${status.index+1 != 49}" >
										<li>
											<div class="question-item">
												<span class="ic-question">${item.qitemNo}</span>${item.question}
											</div>
											
											<div class="btn-group radio-group" role="group" aria-label="Basic radio toggle button group">
												<input type="radio" class="btn-check" name="btnradio${status.index+1}" id="btnradio${status.index * 5 + 1}" value="1" ${arrList[status.index]=='1' ? 'checked' : ''} autocomplete="off">
												<label class="btn btn-outline-primary" for="btnradio${status.index * 5 + 1}">${item.answer01}</label>
		
												<input type="radio" class="btn-check" name="btnradio${status.index+1}" id="btnradio${status.index * 5 + 2}" value="2" ${arrList[status.index]=='2' ? 'checked' : ''} autocomplete="off" >
												<label class="btn btn-outline-primary" for="btnradio${status.index * 5 + 2}">${item.answer02}</label>
		
												<input type="radio" class="btn-check" name="btnradio${status.index+1}" id="btnradio${status.index * 5 + 3}" value="3" ${arrList[status.index]=='3' ? 'checked' : ''} autocomplete="off" >
												<label class="btn btn-outline-primary" for="btnradio${status.index * 5 + 3}">${item.answer03}</label>
		
												<input type="radio" class="btn-check" name="btnradio${status.index+1}" id="btnradio${status.index * 5 + 4}" value="4" ${arrList[status.index]=='4' ? 'checked' : ''} autocomplete="off">
												<label class="btn btn-outline-primary" for="btnradio${status.index * 5 + 4}">${item.answer04}</label>
		
												<input type="radio" class="btn-check" name="btnradio${status.index+1}" id="btnradio${status.index * 5 + 5}" value="5" ${arrList[status.index]=='5' ? 'checked' : ''} autocomplete="off" >
												<label class="btn btn-outline-primary" for="btnradio${status.index * 5 + 5}">${item.answer05}</label>
											</div>
										</li>
									</c:if>
									
									<c:if test="${status.index+1 == 49}" >
										<input type="hidden" name="selectedValues" id="selectedValues" value="">
										<li>
											<div class="question-item values-btn-item">
												<span class="ic-question">${item.qitemNo}</span>${item.question}
											</div>
											
											<div class="btn-group radio-group values-btn-group" role="group" aria-label="Basic radio toggle button group">
												<input type="checkbox" class="chk49" name="btnradio${status.index+1}" id="btnradio${status.index * 5 + 1}" value="1" autocomplete="off">
												<label class="btn btn-outline-primary" for="btnradio${status.index * 5 + 1}">안정성</label>
		
												<input type="checkbox" class="chk49" name="btnradio${status.index+1}" id="btnradio${status.index * 5 + 2}" value="2" autocomplete="off">
												<label class="btn btn-outline-primary" for="btnradio${status.index * 5 + 2}">보수</label>
		
												<input type="checkbox" class="chk49" name="btnradio${status.index+1}" id="btnradio${status.index * 5 + 3}" value="3" autocomplete="off">
												<label class="btn btn-outline-primary" for="btnradio${status.index * 5 + 3}">일과 삶의<br /> 균형</label>
		
												<input type="checkbox" class="chk49" name="btnradio${status.index+1}" id="btnradio${status.index * 5 + 4}" value="4" autocomplete="off">
												<label class="btn btn-outline-primary" for="btnradio${status.index * 5 + 4}">즐거움</label>
		
												<input type="checkbox" class="chk49" name="btnradio${status.index+1}" id="btnradio${status.index * 5 + 5}" value="5" autocomplete="off">
												<label class="btn btn-outline-primary" for="btnradio${status.index * 5 + 5}">소속감</label>
												
												<input type="checkbox" class="chk49" name="btnradio${status.index+1}" id="btnradio${status.index * 5 + 6}" value="6" autocomplete="off">
												<label class="btn btn-outline-primary" for="btnradio${status.index * 5 + 6}">자기계발</label>
												
												<input type="checkbox" class="chk49" name="btnradio${status.index+1}" id="btnradio${status.index * 5 + 7}" value="7" autocomplete="off">
												<label class="btn btn-outline-primary" for="btnradio${status.index * 5 + 7}">도전성</label>
												
												<input type="checkbox" class="chk49" name="btnradio${status.index+1}" id="btnradio${status.index * 5 + 8}" value="8" autocomplete="off">
												<label class="btn btn-outline-primary" for="btnradio${status.index * 5 + 8}">영향력</label>
												
												<input type="checkbox" class="chk49" name="btnradio${status.index+1}" id="btnradio${status.index * 5 + 9}" value="9" autocomplete="off">
												<label class="btn btn-outline-primary" for="btnradio${status.index * 5 + 9}">사회적<br />기여</label>
												
												<input type="checkbox" class="chk49" name="btnradio${status.index+1}" id="btnradio${status.index * 5 + 10}" value="10" autocomplete="off">
												<label class="btn btn-outline-primary" for="btnradio${status.index * 5 + 10}">성취</label>
												
												<input type="checkbox" class="chk49" name="btnradio${status.index+1}" id="btnradio${status.index * 5 + 11}" value="11" autocomplete="off">
												<label class="btn btn-outline-primary" for="btnradio${status.index * 5 + 11}">사회적<br />인정</label>
												
												<input type="checkbox" class="chk49" name="btnradio${status.index+1}" id="btnradio${status.index * 5 + 12}" value="12" autocomplete="off">
												<label class="btn btn-outline-primary" for="btnradio${status.index * 5 + 12}">자율성</label>
											</div>
										</li>
									</c:if>
								</c:forEach>
							</ul>
						</c:if>
						
						<div class="button-wrap">
						<!-- 
							<button class="white-btn" onclick="previousPage()">이전</button>
							<button class="white-btn" onclick="nextPage()">다음</button>
							 -->
							<button type="button" class="white-btn" onclick="location='/whou/aptitude/aptitudeMain'">취소</button>
							<button type="submit" class="purple-btn">제출</button>
						</div>
					</form>
				</div>
			</div>
		</div>
		<%@ include file="../aiChatBot.jsp" %>
	</section>

	<script>
	
		let lastChk = 0;
		let count = 0;
	 	// 최대 3개의 체크박스만 선택 가능하도록 제한
	    var checkboxes = document.querySelectorAll('input[name="btnradio49"]');
		var maxLimit = 3;
		
		var selectedOrder = []; // 선택된 순서를 저장할 배열
		
		checkboxes.forEach(function(checkbox, index) {
			checkbox.addEventListener('change', function() {
				var checkedCount = 0;
		
				checkboxes.forEach(function(checkbox) {
				if (checkbox.checked) {
					checkedCount++;
				}

			});
		
		    if (checkedCount > maxLimit) {
				alert("3개 선택하세요");
				this.checked = false;
				return;
		    }
		
			if (this.checked) {
				selectedOrder.push({ value: this.value, index: index });
			} else {
				selectedOrder = selectedOrder.filter(function(item) {
					return item.value !== this.value; // 선택 해제된 checkbox의 value를 배열에서 제거
				}, this);
			}
		
		    if (selectedOrder.length > maxLimit) {
		      checkboxes.forEach(function(checkbox) {
		        if (!checkbox.checked) {
		          checkbox.disabled = true; // 선택된 checkbox 이외의 checkbox를 비활성화
		        }
		      });
		    } else {
		      checkboxes.forEach(function(checkbox) {
		        checkbox.disabled = false; // 모든 checkbox 활성화
		      });
		    }
		
		    var selectedValuesInput = document.getElementById('selectedValues');
		    selectedValuesInput.value = selectedOrder.map(function(item) {
		      return item.value;
		    }).join(',');
		
			
		    if (selectedOrder.length === maxLimit) {
		      lastChk=1;
		      updateProgress();
		    }else{
		    	lastChk=0;
		    }
		
		
		    //alert(selectedValuesInput.value);
		  });
		});
		// 진척률
 		const percent = ${100/fn:length(RESULT)};
 		const progressBar = document.querySelector('.progress-bar');
 	    const progressPercent = document.querySelector('.progress div > span');
 	   	let percentCount=0;
 	    

		// 답한 문항 개수
	    const radioButtons = document.querySelectorAll('.btn-check');
	    const countSpan = document.querySelector('.page-count span:first-child');
	    
 	   	function getCount(){
 	   		let tempNum = document.querySelectorAll('.btn-check:checked').length;
	        return tempNum;
 	   	}
 	   	count = getCount();
        countSpan.textContent = count;
		percentCount = count * percent;
		percentCountDown = Math.floor(percentCount);
		progressPercent.textContent = percentCountDown;
		progressBar.style.width = percentCount + '%';
	    
		// 라디오 버튼
		radioButtons.forEach(radioButton => {
		    radioButton.addEventListener('click', updateProgress);
		});

		// 체크박스
		checkboxes.forEach(checkbox => {
		    checkbox.addEventListener('click', updateProgress);
		});
		
	   function updateProgress(){
        	// 답한 문항 개수
            count = document.querySelectorAll('.btn-check:checked').length + lastChk;
            countSpan.textContent = count;
   
         	// 진척률
            percentCount = count * percent;
         	percentCountDown = Math.floor(percentCount);
            progressPercent.textContent = percentCountDown;
            progressBar.style.width = percentCount + '%';
	  };
	  
		// 퍼센트 정보 추가하기
		function getPercent(){
			count = document.querySelectorAll('.btn-check:checked').length;
            countSpan.textContent = count;
            percentCount = count * percent;
         	percentCountDown = Math.floor(percentCount);
            progressPercent.textContent = percentCountDown;
		    var form = document.getElementById("reportForm");
			var input = document.createElement('input');
    		input.type = 'hidden';
			input.name = 'percent';
    		input.value = percentCountDown;
    		form.appendChild(input);
		}
		
		function nonBt(){
			if(${fn:length(RESULT)} > count){
				alert('모든 문항에 답변하지 않으면 제출하실 수 없습니다.');
				return false;
			}
		}
		
		
		//임시저장 제출하기
	    function submitForm() {
	        const form = document.getElementById('reportForm'); // <form> 요소를 가져옵니다.
	        form.removeAttribute('onsubmit');
	        getPercent();
	        form.submit(); // <form> 요소를 제출합니다.
	    }


    </script>
	
		<!-- Bootstrap core JS-->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
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
	    window.onbeforeunload = function () { $('.loading-wrap').show(); }
	    $(window).load(function () {          //페이지가 로드 되면 로딩 화면을 없애주는 것
            $('.loading-wrap').hide();
        });
        </script>
    </body>
    
</html>
		