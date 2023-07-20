<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
     <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
     
 </head>
 <style>
       #nav-addInfo .add-wrap{display:flex;gap:20px;}
       #nav-addInfo .add-wrap .left-box{width:50%}
       #nav-addInfo .add-wrap .right-box{width:50%}
        #qualificationContainer div {
            position: relative;
        }

        .qualificationList {
            position: absolute;
            left: 0;
            top: 100%;
            background-color: #f9f9f9;
            border: 1px solid #ccc;
            padding: 5px;
            list-style: none;
            margin: 0;
            display: none;
            z-index:1;
        }
        
        #majorContainer div {
            position: relative;
        }

        .majorList {
            position: absolute;
            left: 0;
            top: 100%;
            background-color: #f9f9f9;
            border: 1px solid #ccc;
            padding: 5px;
            list-style: none;
            margin: 0;
            display: none;
            z-index:1;
        }
    </style>
 
 
<body>
    <%@ include file="../header.jsp" %> 
    <section class="py-2 mypage-section">
            <div class="container">
                <h2 class="page-title">마이페이지</h2>
                <div class="desc-wrap">
                    <div class="left-wrap">
                        <div>
                            <nav>
                                <div class="nav nav-tabs" id="nav-tab" role="tablist">
                                  <button class="nav-link active" id="nav-home-tab" data-bs-toggle="tab" data-bs-target="#nav-home" type="button" role="tab" aria-controls="nav-home" aria-selected="true">검사결과보기</button>
                                  <button class="nav-link" id="nav-add-tab" data-bs-toggle="tab" data-bs-target="#nav-addInfo" type="button" role="tab" aria-controls="nav-addInfo" aria-selected="false">추가정보입력</button>
                                  <button class="nav-link" id="nav-contact-tab" data-bs-toggle="tab" data-bs-target="#nav-contact" type="button" role="tab" aria-controls="nav-contact" aria-selected="false">개인정보수정</button>
                                  <button class="nav-link" id="nav-contact-tab" data-bs-toggle="tab" data-bs-target="#nav-contact" type="button" role="tab" aria-controls="nav-contact" aria-selected="false">나의 북마크</button>
                                  <button class="nav-link" id="nav-contact-tab" data-bs-toggle="tab" data-bs-target="#nav-contact" type="button" role="tab" aria-controls="nav-contact" aria-selected="false">컨설팅하러가기</button>
                                </div>
                              </nav>
                        </div>                        
                        <div class="custom-box">내 비서 커스텀하기</div>
                    </div>
                    <div class="right-wrap">
                          <div class="tab-content" id="nav-tabContent">
                            <div class="tab-pane fade show active" id="nav-home" role="tabpanel" aria-labelledby="nav-home-tab" tabindex="0">
                         		<canvas id="aptitudeChart"></canvas>
                         		<canvas id="interestChart"></canvas>
                         		<canvas id="valuesChart"></canvas>
                            </div>
                            <div class="tab-pane fade" id="nav-addInfo" role="tabpanel" aria-labelledby="nav-add-tab" tabindex="0">
								<form action="/spring/test/updateInfo" method="post">
									<div class="add-wrap">
										<div class="left-box">
											<h4>자격증</h4>
											<div id="qualificationContainer">
									           <div>
									               <input type="text" name="certi" required oninput="checkCerti(this)" /> <i class="fa-solid fa-circle-minus"></i>
									               <ul class="qualificationList"></ul>
									           </div>
									       </div>
									       <div>
										       <i class="fa-solid fa-circle-plus"></i>
										       <input type="button" value="자격증 추가" onclick="addQualification()"/>							       
									       </div>
										</div>
										<div class="right-box">
											<div id="majorContainer">
									           <div>
									               <input type="text" name="major" required oninput="checkMajor(this)" />
									               <ul class="majorList"></ul>
									           </div>
									     	</div>
							       
									     	<input type="button" value="학과 추가" onclick="addMajor()"/>
									     	<input type="submit" value="저장"/>
										</div>
									</div>
									
							      
							       

							   </form>								
							</div>
                            <div class="tab-pane fade" id="nav-contact" role="tabpanel" aria-labelledby="nav-contact-tab" tabindex="0">...</div>
                            
                          </div>
                    </div>
                </div>    
            </div>
        </section>
        <%@ include file="../footer.jsp" %> 
        <!-- Bootstrap core JS-->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
        <script>
         
        	// 적성 차트
			var aptitudeScoreArr = ${aptitudeScoreArr};
			aptitudeNameArr = ${aptitudeNameArr};
            const ctx21 = document.getElementById('aptitudeChart');
           	var myChart21 = new Chart(ctx21, {
                   type: 'radar',
                   data: {
                       labels:aptitudeNameArr,
                       datasets: [
                       {
                           data: aptitudeScoreArr,
                           backgroundColor: 'rgba(255, 99, 132, 0.5)',
                           borderColor: 'rgba(255, 99, 132, 1)',
                           borderWidth: 1,
                          
                       },              
                       ]
                   },
                   options: {
                       scale: {                                          
                               min: 0,
                               max: 100,
                               ticks: {
                                 stepSize:5
                               }
                           
                       }
                   }
                   });
           	
           	// 흥미차트 
           	var interestScoreArr = ${interestScoreArr};
            const ctx31 = document.getElementById('interestChart');
           	var myChart31 = new Chart(ctx31, {
                   type: 'radar',
                   data: {
                       labels:['자연과학','AI·소프트웨어','공학','법률·행정','복지','교육','예술·미디어','스포츠','마케팅','금융·경영','여가·관광','보건의료', '농생명', '환경', '제조', '물류·운송·유통', '설계·건축·토목'],
                       datasets: [
                       {
                           data: interestScoreArr,
                           backgroundColor: 'rgba(255, 99, 132, 0.5)',
                           borderColor: 'rgba(255, 99, 132, 1)',
                           borderWidth: 1,
                          
                       },              
                       ]
                   },
                   options: {
                       scale: {                                          
                               min: 0,
                               max: 100,
                               ticks: {
                                 stepSize:5
                               }
                           
                       }
                   }
                   });
           	
        	// 가치관 
           	var valuesScoreArr = ${valuesScoreArr};
            const ctx25 = document.getElementById('valuesChart');
           	var myChart25 = new Chart(ctx25, {
                   type: 'radar',
                   data: {
                       labels:['안정성', '보수', '일과 삶의 균형', '즐거움','소속감','자기계발', '도전성', '영향력', '사회적 기여','성취','사회적 인정','자율성'],
                       datasets: [
                       {
                           data: valuesScoreArr,
                           backgroundColor: 'rgba(255, 99, 132, 0.5)',
                           borderColor: 'rgba(255, 99, 132, 1)',
                           borderWidth: 1,
                          
                       },              
                       ]
                   },
                   options: {
                       scale: {                                          
                               min: 0,
                               max: 100,
                               ticks: {
                                 stepSize:5
                               }
                           
                       }
                   }
                   });
           	
           	// tab
            const triggerTabList = document.querySelectorAll('#myTab button')
			triggerTabList.forEach(triggerEl => {
			  const tabTrigger = new bootstrap.Tab(triggerEl)
			
			  triggerEl.addEventListener('click', event => {
			    event.preventDefault()
			    tabTrigger.show()
			  })
			})
			
			// 추가 정보 입력
			function checkCerti(inputElement) {
            var certi = $(inputElement).val();
            var qualificationList = $(inputElement).next(".qualificationList");

            $.ajax({
                url: "/spring/test/check",
                data: { certi: certi },
                success: function (result) {
                    qualificationList.empty();

                    for (var i = 0; i < result.length; i++) {
                        var qualification = result[i];
                        var button = $("<button>").text(qualification);
                        button.on("click", function () {
                           event.preventDefault();
                            var selectedQualification = $(this).text();
                            $(inputElement).val(selectedQualification);
                            qualificationList.hide();
                        });
                        qualificationList.append($("<li>").append(button));
                    }

                    qualificationList.show();
                }
            });
        }
        
        function checkMajor(inputElement) {
            var major = $(inputElement).val();
            var majorList = $(inputElement).next(".majorList");

            $.ajax({
                url: "/spring/test/check2",
                data: { major: major },
                success: function (result) {
                   majorList.empty();

                    for (var i = 0; i < result.length; i++) {
                        var major2 = result[i];
                        var button = $("<button>").text(major2);
                        button.on("click", function () {
                           event.preventDefault();
                            var selectedMajor = $(this).text();
                            $(inputElement).val(selectedMajor);
                            majorList.hide();
                        });
                        majorList.append($("<li>").append(button));
                    }

                    majorList.show();
                }
            });
        }

        function addQualification() {
            var newDiv = $("<div>");
            var newInput = $("<input>").attr({
                type: "text",
                name: "certi",
                required: true,
                oninput: "checkCerti(this)",
                placeholder: "새로운 자격증 입력",
            });
            var newUl = $("<ul>").addClass("qualificationList");

            newDiv.append(newInput).append(newUl);

            $("#qualificationContainer").append(newDiv);
            newUl.hide();
        }
        
        function addMajor() {
            var newDiv = $("<div>");
            var newInput = $("<input>").attr({
                type: "text",
                name: "major",
                required: true,
                oninput: "checkMajor(this)",
            });
            var newUl = $("<ul>").addClass("majorList");

            newDiv.append(newInput).append(newUl);

            $("#majorContainer").append(newDiv);
            newUl.hide();
        }

        </script>
    
    </body>
    
</html>
