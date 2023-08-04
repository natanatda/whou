<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
        <script src="https://cdnjs.cloudflare.com/ajax/libs/three.js/r128/three.min.js" integrity="sha512-dLxUelApnYxpLt6K2iomGngnHO83iUvZytA3YjDUCjT0HDOHKXnVYdf3hU4JjM8uEhxf9nD1/ey98U3t2vZ0qQ==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
		<script src="https://code.jquery.com/jquery-3.7.0.min.js" ></script>
        <script src="https://kit.fontawesome.com/dbaea98925.js" crossorigin="anonymous"></script>
		
		<script src="resources/js/unpkg.com_gsap@3.12.1_dist_gsap.min.js"></script>
		<script src="resources/js/ThreeCSG.js"></script>
		<script src="https://unpkg.com/three@0.128.0/examples/js/controls/OrbitControls.js"></script>
        <script type="module" src="/whou/resources/js/whouModel.js?ver=3"></script>
		<script src="/whou/resources/js/ai.js"></script>		
    </head>

    <body>
    <div class="chat-box-container"></div>
        <!-- Responsive navbar-->
       <%@ include file="header.jsp" %> 
        <!-- Header-->
        <header class="py-5">
            <div class="container px-5">
	       
                <div class="row gx-5 justify-content-center">
                    <div class="col-lg-6">
                        <div class="text-center my-5">
                            <h1 class="display-5 mb-4 main-color weight900">어떤 직업을 찾고 있나요?</h1>
                              <form action="/whou/job/dic" name="form" method="post">
	                            <div class="input-group search-form">
	                                <span class="search-btn"><i class="fa-solid fa-magnifying-glass fa-xl" style="color: #5a3fff;"></i></span>
	                                <input type="text" name="jobNM">
	                            </div>
                            </form>
                            <div class="d-grid gap-3 d-sm-flex justify-content-sm-start mt-5">
                              <div class="row" >
                                <div class="col main-ai-wrap" style="position: relative;">
                                    <div class="main-ai" style="width: 120px;">
                                 	   <canvas class="webgl" style="position: absolute; top: -83px; left: -15px;" ></canvas> <%-- ai --%>
                                    </div>
                                    <div class="icon-box">
                                        <span class="icon-box-ic"><i class="${icon} fa-2xl"></i></span>
                                    </div>
                                </div>
                                <div class="col auto-text">${message }</div>
                              </div>
                            </div>
                        </div>
                    </div>
                </div>
                <section class="py-5" id="features">
                   
                    <div class="main-text-wrap">
                        <p>단 하나의 간편 컨설팅</p>
                        <h1 class="main-text">당신만을 위한 <span>직업 추천</span></h1>                     
                    </div>
                    <div class="container px-5 my-5">
                    
                        <div class="row gx-5 main-content">
                        
                            <div class="col-lg-4 mb-5 mb-lg-0">
                                <c:if test="${recoLi3 == null}">
	                                <div class="feature mb-3"><i class="bi bi-collection"></i></div>
                                	<h2 class="h5">직업 검사받기</h2>
                                	 <p>
                                    직업 검사를 했을 시에는 저희가 기분이 좋아요!
                                    직업 검사를 해야만 저희가 직업 컨설팅을 해드릴 수 있어요!
                                    직업 검사를 실행 시에는 저희가 정보를 전부 가져갈 수 있다는점 인지해주세요!
                                	</p>
                                </c:if>
                                <c:if test="${recoLi3 != null}">
                                	<div class="feature mb-3"><i class="${recoLi3[0].talents[1].SORT_ICON}"></i></div>
                                	<h2 class="h5">${recoLi3[0].J_NM}</h2>
                                	<p>${recoLi3[0].work}</p>
                                </c:if>
                            </div>
                            
                            <div class="col-lg-4 mb-5 mb-lg-0">
                                <c:if test="${memId == null}">
	                                <div class="feature mb-3"><i class="fa-solid fa-leaf"></i></div>
                                	<h2 class="h5">직업 컨설팅</h2>
                                	 <p>
                                    직업 검사를 했을 시에는 저희가 기분이 좋아요!
                                    직업 검사를 해야만 저희가 직업 컨설팅을 해드릴 수 있어요!
                                    직업 검사를 실행 시에는 저희가 정보를 전부 가져갈 수 있다는점 인지해주세요!
                                	</p>
                                </c:if>
                                <c:if test="${memId != null}">
                                	<div class="feature mb-3"><i class="${recoLi3[1].talents[1].SORT_ICON}"></i></div>
                                	<h2 class="h5">${recoLi3[1].J_NM}</h2>
                                	<p>${recoLi3[1].work}</p>
                                </c:if>

                            </div>
                            
                            <div class="col-lg-4">
                                <c:if test="${memId == null}">
	                                <div class="feature mb-3"><i class="bi bi-toggles2"></i></div>
                                	<h2 class="h5">직업 관련정보</h2>
                                	 <p>
                                    직업 검사를 했을 시에는 저희가 기분이 좋아요!
                                    직업 검사를 해야만 저희가 직업 컨설팅을 해드릴 수 있어요!
                                    직업 검사를 실행 시에는 저희가 정보를 전부 가져갈 수 있다는점 인지해주세요!
                                	</p>
                                </c:if>
                                <c:if test="${memId != null}">
                                	<div class="feature mb-3"><i class="${recoLi3[2].talents[1].SORT_ICON}"></i></div>
                                	<h2 class="h5">${recoLi3[2].J_NM}</h2>
                                	<p>${recoLi3[2].work}</p>
                                </c:if>
                            </div>
                            
                        </div>
                        
                    </div>
                </section>
            </div>
        </header>
        <!-- Features section-->
    
        <!-- Pricing section-->
        <section class="py-2 test-section">
            <div class="container px-5 my-5">
                <div>
                    <p class="fw-bolder">당신만을 위한 검사가 기다리고 있어요.</p>
                    <p class="main-text">직업 검사를 받아보세요.</p>
                </div>
                <p class="add-btn mb-5"><a href="/whou/aptitude/aptitudeMain">추가 검사 보기 </a><i class="fa-solid fa-chevron-right fa-xs" style="color: #f9fafa;"></i></p>
                <div class="row gx-4 justify-content-center">
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
        <!-- Testimonials section-->
        <section class="py-5 consult-section">
            <div class="container px-5 my-5 px-5">
                <div class="mb-5">
                    <p class="fw-bolder">당신만을 위한 컨설팅이 기다리고 있어요.</p>
                    <p class="main-text">직업 컨설팅을 받아보세요.</p>
                </div>
                <div class="row gx-5 justify-content-center">
                    <div class="col-lg-12">
                        <div class="card mb-4 consult-box">
                            <div class="card-body p-4">
                                <div class="d-flex">
                                   <div class="col-lg-3">ai</div>
                                   <div class="col-lg-6">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Nemo deleniti facilis commodi maiores laborum, nam officiis voluptatum perferendis blanditiis neque obcaecati, autem distinctio illum fugiat laudantium eaque. Nostrum, dolorem aliquid!</div>
                                   <div class="col-lg-3">img</div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <%@ include file="aiChatBot.jsp" %>
        </section>

        <!-- Footer-->
        <%@ include file="footer.jsp" %> 
        <!-- Bootstrap core JS-->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
        <%-- 모델 --%>
        <script>
        	var modelCamera_x = ${modelItem.camera};
        	var modelCamera_y = 1;
        	var modelCamera_z = 3;
		 	var modelPath = '/whou/resources/whouModel/${modelItem.path_folder}/${modelItem.path_gltf}';
		 	
		 	var modelWidth = 350;
        	var modelHeight = 200;
		 	
		 	if('${modelItem.color}' != 'noColor'){
		 		var modelColor = ${modelItem.color};
		 	}
		 	var modelScale_x = ${modelItem.scale_x};
		 	var modelScale_y = ${modelItem.scale_y};
		 	var modelScale_z = ${modelItem.scale_z};
		 	
		 	var modelPosition_x = ${modelItem.position_x};
		 	var modelPosition_y = ${modelItem.position_y};
		 	var modelPosition_z = ${modelItem.position_z};
		 	
		 	var modelRotation_x = ${modelItem.rotation_x};
		 	var modelRotation_y = ${modelItem.rotation_y};
		 	var modelRotation_z = ${modelItem.rotation_z};
		 	
		 	var modelMotion = ${modelItem.motion};
        	
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
        </script>
    </body>
</html>
