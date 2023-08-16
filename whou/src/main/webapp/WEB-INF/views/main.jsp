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
                                	 	무엇을 해야할지 고민이 큰 분들에게 추천드려요.
                                	 	검사를 통해 자신의 강점과 흥미를 파악할 수 있습니다.
                                	 	결과를 확인하시어 다양한 진로를 항해하고 적합한 직업을 whoU와 함께 찾아보세요.
                                	</p>
                                </c:if>
                                <c:if test="${recoLi3 != null}">
                                	<div class="feature mb-3"><i class="${recoLi3[0].talents[1].SORT_ICON}"></i></div>
                                	<h2 class="h5">${recoLi3[0].J_NM}</h2>
                                	<p>${recoLi3[0].work}</p>
                                </c:if>
                            </div>
                            
                            <div class="col-lg-4 mb-5 mb-lg-0">
                                <c:if test="${recoLi3 == null}">
	                                <div class="feature mb-3"><i class="fa-solid fa-leaf"></i></div>
                                	<h2 class="h5">직업 컨설팅</h2>
                                	 <p>
	                                    whoU는 적합한 직업을 추천해드린 후 이력 사항을 기초로 컨설팅해드려요.
	                                   	해당 직업에 대한 연봉 정보부터 취업방법, 그 직업을 갖기 위한 사용자의 강점과 보완점을 분석해서 알려드려요. 
	                                   	
                                	</p>
                                </c:if>
                                <c:if test="${recoLi3 != null}">
                                	<div class="feature mb-3"><i class="${recoLi3[1].talents[1].SORT_ICON}"></i></div>
                                	<h2 class="h5">${recoLi3[1].J_NM}</h2>
                                	<p>${recoLi3[1].work}</p>
                                </c:if>

                            </div>
                            
                            <div class="col-lg-4">
                                <c:if test="${recoLi3 == null}">
	                                <div class="feature mb-3"><i class="bi bi-toggles2"></i></div>
                                	<h2 class="h5">직업 관련정보</h2>
                                	 <p>
	                                    여러 직업에 대한 자세한 정보를 제공해요.
	                                    하는 일 뿐만아니라 해당 직업과 관련된 통계 자료도 제공해요.
	                                    자세한 직업 정보가 궁금하시다면 [직업정보] 메뉴를 이용해보세요.
                                	</p>
                                </c:if>
                                <c:if test="${recoLi3 != null}">
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
        <section class="py-2 test-section ex-section">
            <div class="container px-5 my-5">
                <div>
                    <p class="fw-bolder">처음 이용해보시나요? 차근차근 함께 해요.</p>
                    <p class="main-text">whoU 이용 방법</p>
                </div>
                <p class="add-btn mb-5"></p>
                <div>
                    <!-- 직업적성검사 -->
                    <div class="col-lg-6 col-xl-12 mb-5">
                        <div class="card mb-5 mb-xl-0 test-cont-wrap" style="min-height: 330px;">
                             <div class="card-body p-4" style="min-height: 330px;display: flex; flex-direction: column;justify-content: space-between;">
                               <div>
	                                <h4>STEP.01</h4>
	                                <h3>검사를 하세요.</h3>
	                                <span>검사를 진행하면 직업 추천을 받을 수 있어요.</span>
                               </div>
                                <div>
	                                <video controls>
	                                	<source src="/whou/resources/video/test.mp4">
	                                </video>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- 직업성숙도검사 -->
                    <div class="col-lg-6 col-xl-12 mb-5">
                         <div class="card mb-5 mb-xl-0 test-cont-wrap" >
                            <div class="card-body p-4" style="min-height: 330px;display: flex; flex-direction: column;justify-content: space-between;">
	                            <div>
	                                <h4>STEP.02</h4>
	                                <h3>개인정보를 입력하세요.</h3>
	                                <span>추가정보를 입력하면 직업 추천이 더 정확해져요.</span>
	                            </div>
                                <div>
	                                <video controls>
	                                	<source src="/whou/resources/video/mypage.mp4">
	                                </video>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- 직업흥미검사 -->
                    <div class="col-lg-6 col-xl-12 mb-5">
                        <div class="card mb-5 mb-xl-0 test-cont-wrap" >
                            <div class="card-body p-4" style="min-height: 330px;display: flex; flex-direction: column;justify-content: space-between;">
	                            <div>
	                                <h4>STEP.03</h4>
	                                <h3>추천 및 컨설팅을 받으세요.</h3>
	                                <span>원하는 직업을 선택하여 컨설팅 받아보세요</span>
	                            </div>
                                <div class="video-wrap">
	                                <video controls>
	                                	<source src="/whou/resources/video/consulting.mp4">
	                                </video>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- 직업가치관검사 -->
                    <div class="col-lg-6 col-xl-12">
                        <div class="card mb-5 mb-xl-0 test-cont-wrap" style="min-height: 330px;">
                              <div class="card-body p-4" style="min-height: 330px;display: flex; flex-direction: column;justify-content: space-between;">
                              <div>
	                               <h4>STEP.04</h4>
	                                <h3>자세한 정보를 탐색 하세요.</h3>
	                                <span>직업에 대한 정보와 각종 교육, 채용 정보를 살펴보세요</span>
                              </div>
                                <div>
	                                <video controls>
	                                	<source src="/whou/resources/video/job.mp4">
	                                </video>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <!-- Testimonials section-->
       <section class="py-2 test-section" style="background:#fff;">
            <div class="container px-5 my-5">
                <div style="color:#111">
                    <p class="fw-bolder">당신만을 위한 검사가 기다리고 있어요.</p>
                    <p class="main-text">직업 검사를 받아보세요.</p>
                </div>
                <p class="add-btn mb-5"></p>
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
                                
                                <button class="purple-btn" onclick="location='/whou/aptitude/aptitudeMain'">자세히 보러가기</button>
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
                             
                                <button class="purple-btn" onclick="location='/whou/aptitude/aptitudeMain'">자세히 보러가기</button>
                            </div>
                        </div>
                    </div>
                    <!-- 직업흥미검사 -->
                    <div class="col-lg-6 col-xl-3">
                        <div class="card mb-5 mb-xl-0 test-cont-wrap">
                            <div class="card-body p-4">
                                <h4>진로개발역량검사</h4>
                                <p class="test-cont-desc">직업과 관련된 다양한 능력을 어느 정도로 갖추고 있는지 알아 볼 수 있습니다.</p>
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
                       
                                <button class="purple-btn" onclick="location='/whou/aptitude/aptitudeMain'">자세히 보러가기</button>
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

                                <button class="purple-btn" onclick="location='/whou/aptitude/aptitudeMain'">자세히 보러가기</button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
            <%@ include file="aiChatBot.jsp" %>

        <!-- Footer-->
        <%@ include file="footer.jsp" %> 
        <!-- Bootstrap core JS-->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
        <%-- 모델 --%>
        <script>
        	var modelCamera_x = ${modelItem.camera};
        	var modelCamera_y = 1;
        	var modelCamera_z = 5;
		 	var modelPath = '/whou/resources/whouModel/${modelItem.path_folder}/${modelItem.path_gltf}';
		 	if(${modelItem.path_gltf == "medicine_scene.gltf"}){
		 		modelCamera_y = -0.2;
	        	modelCamera_z = 6;
		 	}
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
