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
		<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
		<script src="https://code.jquery.com/jquery-3.7.0.min.js" ></script>
		<script src="/whou/resources/js/ai.js"></script>
    </head>
 
    <body>
        <!-- Responsive navbar-->
       <%@ include file="../header.jsp" %>        
        <form action="/whou/job/dic" name="form" method="post">
        <!-- Header-->
        <header class="py-5">
            <div class="container px-5">
                <h2 class="page-title">직업백과</h2>
                <div class="row gx-5 justify-content-center">
                    <div class="col-lg-9">
                        <div class="text-center my-4 d-flex">
                            <div class="select-form">
                                <select class="desc-select">
                                    <option value="">전체</option>
                                    <!-- 
	                                    <option value="">직업명</option>
	                                    <option value="">하는일</option>
                                     -->
                                </select>
                            </div>
                            <div class="input-group search-form">
                                <span class="search-btn"><i class="fa-solid fa-magnifying-glass fa-xl" style="color: #5a3fff;"></i></span>
	                                <input type="text" name="jobNM" class="" value="${jobNm}">
                            </div>
                        </div>
                    </div>
                </div>
                <section class="py-5 disc-section" >
                    <div class="card search-card">
                        <div class="card-body">
                            <ul class="nav nav-underline tab" id="pills-tab" role="tablist">
                                <li class="nav-item" role="presentation">
                                  <button class="nav-link active" id="pills-home-tab" data-bs-toggle="pill" data-bs-target="#pills-home" type="button" role="tab" aria-controls="pills-home" aria-selected="true" ><span>테마</span>별 검색</button>
                                </li>
                                <li class="nav-item" role="presentation">
                                  <button class="nav-link" id="pills-profile-tab" data-bs-toggle="pill" data-bs-target="#pills-profile" type="button" role="tab" aria-controls="pills-profile" aria-selected="false" ><span>적성유형</span>별 검색</button>
                                </li>
                                <li class="nav-item" role="presentation">
                                  <button class="nav-link" id="pills-disabled-tab" data-bs-toggle="pill" data-bs-target="#pills-disabled" type="button" role="tab" aria-controls="pills-disabled" aria-selected="false" ><span>직업분류</span>별 검색</button>
                                </li>
                              </ul>
                              <div class="tab-content" id="pills-tabContent">
								<div class="tab-pane fade show active" id="pills-home" role="tabpanel" aria-labelledby="pills-home-tab" tabindex="0">
                                    <h5>최근 대두되는 관심과 흥미를 반영한 작업별 테마를 선택하여 작업을 검색할 수 있습니다.</h5>
                                    <ul class="button-wrap mb-3">
                                    <c:forEach var="tvl" items="${temaValueList1}">
                                        <li <c:if test="${fn:contains(checked, tvl.sort_value)}">class="active"</c:if>> 
                                            <button class="circle-btn" type="button" onclick="toSub(${tvl.sort_value})"><i class="${tvl.sort_icon} fa-2xl" style="color: #5a3fff;"></i></button>
                                            <p>${tvl.sort_name}</p>
                                        </li>
                                    </c:forEach>
                                    </ul>
                                    <ul class="button-wrap">
                                    <c:forEach var="tvl" items="${temaValueList2}">
                                        <li <c:if test="${fn:contains(checked, tvl.sort_value)}">class="active"</c:if>> 
                                            <button class="circle-btn" type="button" onclick="toSub(${tvl.sort_value})"><i class="${tvl.sort_icon } fa-2xl" style="color: #5a3fff;"></i></button>
                                            <p>${tvl.sort_name}</p>
                                        </li>
                                    </c:forEach>
                                    </ul>
                                </div>
                                <div class="tab-pane fade" id="pills-profile" role="tabpanel" aria-labelledby="pills-profile-tab" tabindex="0">
                                <h5>신체·운동과 같은 핵심능력 선택을 통해 직업군을 선택하거나 직업군을 직접 선택하여 직업을 검색할 수 있습니다.</h5>
                                	<ul class="button-wrap mb-3">
                                    <c:forEach var="al" items="${aptdList}">
                                        <li id="${al.aptd_num}" > 
                                            <button class="circle-btn" type="button" onclick="setAptd(${al.aptd_num});setAptds([${al.sort_values}]);"><i class="${al.sort_icon} fa-2xl" style="color: #5a3fff;"></i></button>
                                            <p style="width : 80px; height : 40px; font-size:0.87rem;">${al.sort_name}</p>
                                        </li>
                                    </c:forEach>
                                    </ul>
                                    <ul class="button-wrap">
                                    <c:forEach var="avl" items="${aptdValueList}">
                                    <%--
                                     	onclick="setElementsActive([${avl.sort_icon}])" 
                                     --%>
                                        <li class="InpBox" style="width:249px; font-size:13px; text-align:left;">
                                        	<input type="checkbox" name="aptdCheck" id = "${avl.sort_value}" value="${avl.sort_value}" <c:if test="${fn:contains(check,avl.sort_value)}">checked</c:if>>
                                            <label class="Lbl" for="${avl.sort_value}">${avl.sort_name}</label>
                                            <input type="hidden" value="${avl.sort_icon}" id="al${avl.sort_value}">
                                        </li>
                                    </c:forEach>
                                    </ul>
								</div>
                                	
                                <div class="tab-pane fade" id="pills-disabled" role="tabpanel" aria-labelledby="pills-disabled-tab" tabindex="0">
                                <h5>직업에 필요한 지식, 능력, 기질 등을 중심으로 구분한 직업분류(국가수준 분류체계)를 선택하여 직업을 검색할 수 있습니다.</h5>
                                	<ul class="button-wrap mb-3">
                                    <c:forEach var="jcl" items="${jobCdList}">
                                        <li <c:if test="${fn:contains(checked, jcl.sort_value)}">class="active"</c:if>> 
                                            <button class="circle-btn" onclick="jobCd(${jcl.sort_value})" type="button"><i class="${jcl.sort_icon } fa-2xl" style="color: #5a3fff;"></i></button>
                                            <p style="width : 80px; height : 40px; font-size:0.87rem;">${jcl.sort_name}</p>
                                        </li>
                                    </c:forEach>
                                    </ul>
                                </div>
                              </div>
                        </div>
                    </div>
                </section>
            </div>
        </header>
        <!-- Features section-->
    
        <!-- Pricing section-->
        <section class="py-2 result-section">
            <div class="container px-5 my-5">
                <div class="result-top">
                    <p class="result-top-txt">총 <span>${count}</span>건이 검색되었습니다</p>
                    <div class="result-top-right">
                        <input type ="submit" class="square-btn" value="적용" onclick="getTabName('${clickTabId}')"  style="visibility: hidden;">
                        <!-- 
	                        <div><i class="fa-solid fa-table-cells fa-lg"></i></div>
	                        <div><i class="fa-solid fa-bars fa-lg"></i></div>
                         -->
                    </div>
                </div>
                
                <div class="row gx-5 gy-5 justify-content-center">
                  	<c:forEach var="job" items="${jobs}">
                    <div class="col-lg-6 col-xl-4">
                        <div class="card mb-5 mb-xl-0 jobName" data-name="${job.job_nm}" onclick="location='/whou/job/info?job_cd=${job.job_cd}'">
                            <div class="result-img" style="background-color: #${job.backColor}">
	                            <div>
	                            	<img src="/whou/resources/img/${job.img}" />
	                            </div>
                            </div>
                            <div class="result-cont">
                                <h4>${job.job_nm} <i class="fa-solid fa-chevron-right fa-xs" style="color: #111111;"></i></h4>
                                <p>${job.work}</p>
                            </div>
                        </div>
                    </div>
                  	</c:forEach>
                </div>

                <div class="pagination">
                    <nav aria-label="Page navigation">
                        <ul class="pagination">
						<c:if test="${endPage > pageBlock}">
                          <li class="page-item">
                            <a class="page-link" onclick="sub(${startPage-pageBlock})" aria-label="Previous">
                              <span aria-hidden="true">&laquo;</span>
                            </a>
                          </li>
                          </c:if>
                          <c:forEach var="pageNum" begin="${startPage}" end="${endPage}">
	                          <li class="page-item <c:if test="${currentPage==pageNum}">active</c:if>"><a class="page-link" onclick="sub(${pageNum})" >${pageNum}</a></li>
                          </c:forEach>
							<c:if test="${endPage < pageCount}">
							<li class="page-item">
								<a class="page-link" onclick="sub(${startPage+pageBlock})" aria-label="Next">
									<span aria-hidden="true">&raquo;</span>
								</a>
							</li>
							</c:if>
						</ul>
					</nav>
                </div>
                
            </div>
            <%@ include file="../aiChatBot.jsp" %>
        </section>
		</form>
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
        <script>
            const triggerTabList = document.querySelectorAll('#myTab button')
				triggerTabList.forEach(triggerEl => {
					const tabTrigger = new bootstrap.Tab(triggerEl)
					triggerEl.addEventListener('click', event => {
				    event.preventDefault()
				    tabTrigger.show()
				})
			})
            var checkedValues = ${checked}; // 서버에서 전달된 checked 배열의 값
            console.log(checkedValues);
            var tabId = "${clickTabId}";
            console.log(tabId);
            setElementsActive("${aptd}");
            
            if(tabId!=""){
				var element = document.getElementById(tabId);
				//alert(tabId);
				//getTabName(tabId);
				element.click();
            }
            
            if(checkedValues!=null){
	            for (var i = 0; i < checkedValues.length; i++) {
	                madeInput(checkedValues[i]);
	            }
            }
            
			function checked(id) {
				var strId = id+'';
				if(checkedValues==null){
					madeInput(id);
				}else if(!checkedValues.includes(strId)){
					madeInput(id);
				}else if(checkedValues.includes(strId)){
					delete checkedValues[checkedValues.indexOf(strId)];
					removeInput(id);
				}
				return document.forms['form'];
			}
            
            function madeInput(id){
            	var input = document.createElement('input');
    			input.type = 'hidden';
			    input.name = 'id';
    			input.value = id;
			    var form = document.forms['form'];
    			return form.appendChild(input);
            }
            
            
            function removeInput(id) {
                var form = document.forms['form'];
                var input = form.querySelector('input[name="id"][value="' + id + '"]');
                if (input) {
                    form.removeChild(input);
                }
            }

			function toSub(id) {
    			var form = checked(id);
	    		form.submit();
			}
			
			function sub(pageIndex){
				var input = document.createElement('input');
    			input.type = 'hidden';
			    input.name = 'pageIndex';
    			input.value = pageIndex;
    			form.appendChild(input);
				getTabName(tabId);
				form.submit();
			}
			
			function reset(){
				if(checkedValues!=null){
					for (var i = 0; i < checkedValues.length; i++) {
						removeInput(checkedValues[i]+'');
		            }
				}
				form.submit();
			}
			
		    var checkboxes = document.querySelectorAll('input[type="checkbox"]');
			function resetCheckBox() {
				    checkboxes.forEach(function(Checkbox) {
				        Checkbox.checked = false;
				});
			}
			function otherBoxFalse(checkbox) {
				if (checkbox.checked) {
				// 체크박스가 선택된 경우 다른 체크박스를 모두 해제합니다
					var checkboxes = document.querySelectorAll('input[type="checkbox"]');
				    checkboxes.forEach(function(otherCheckbox) {
				    	if (otherCheckbox !== checkbox) {
							otherCheckbox.checked = false;
						}
					});
				}
			}

			document.addEventListener('DOMContentLoaded', function() {
				  var buttons = document.querySelectorAll('button[data-bs-toggle="pill"]');
				  buttons.forEach(function(button) {
				    button.addEventListener('shown.bs.tab', function(event) {
					    var clickTab = event.target;
						var clickTabId = clickTab.id+'';
						getTabName(clickTabId);
					    reset();
				    });
				});
			});
			
			function getTabName(tabId){
				var input = document.createElement('input');
	    		input.type = 'hidden';
				input.name = 'clickTabId';
	    		input.value = tabId;
	    		form.appendChild(input);
            }
            
			document.addEventListener('DOMContentLoaded', function() {
				var checkBoxes = document.querySelectorAll('input[type="checkbox"]');
				checkBoxes.forEach(function(checkBox) {
					checkBox.addEventListener('change', function() {
						if (checkBox.checked) {
							otherBoxFalse(checkBox);
							var checkId = checkBox.id;
							var al = document.getElementById('al'+checkId);
							setAptd(al.value);
						}
						getTabName(tabId);
						fsubmit();
					});
				});
			});
			
			function fsubmit(){
    			form.submit();
            }
			function jobCd(id){
				getTabName(tabId);
				toSub(id);
			}
			function setElementsActive(idstr) {
				idstr = idstr+'';
				var ids = idstr.split(",");
				ids.forEach(function(id) {
				    var element = document.getElementById(id);
				    if (element) {
						element.classList.add("active");
					}
				});
			}
			function setAptds(idstr){
				resetCheckBox();
				idstr = idstr+'';
				var ids = idstr.split(",");
				ids.forEach(function(id) {
				    var element = document.getElementById(id);
				    if (element) {
				    	setAptd(element.id);
					}
				});
				getTabName(tabId);
				form.submit();
			}
			function setAptd(id){
	        	var input = document.createElement('input');
	    		input.type = 'hidden';
				input.name = 'aptd';
	    		input.value = id;
				var form = document.forms['form'];
	    		return form.appendChild(input);
			}
			$(".jobName").click(function(){
				var jobName = $(this).data('name');
				console.log(jobName);
				console.log('${jobNm}');
				 
				$.ajax({
					url: "/whou/job/insertSearchLog",
					data: {job: jobName, keyword: '${jobNm}'},
					success: function(result){
						
					}
				});
			});
        </script>
    </body>
</html>
