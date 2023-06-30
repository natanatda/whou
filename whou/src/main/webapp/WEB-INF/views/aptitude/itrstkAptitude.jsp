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
        <script src="https://kit.fontawesome.com/dbaea98925.js" crossorigin="anonymous"></script>
    </head>
 
<body>
        <!-- Responsive navbar-->
       <%@ include file="../header.jsp" %>     
    
       <!-- Pricing section-->
        <section class="py-2 aptitude aptitude-section">
            <div class="container px-5 my-5">
                <h2 class="page-title">진로검사</h2>
               
                <div class="row aptitude-content">
                    <div class="col-lg-12 col-xl-12">
                       <h3 class="page-count"><span>29</span> / <span>153</span></h3>
                       <div class="top-question">
                            <span class="top-num">1</span>
                            <p class="top-q">다음 문항들은 여러가지 종류의 직업에서 이루어지는 활동들을 나타내고 있습니다.<br>
                                장래의 직업으로서 다음 활동들을 얼마나 좋아하는지를 생각해보고 답하십시오.</p>
                       </div>
                       <ul class="question-wrap">
                            <li>
                                <div class="question-item"><span class="ic-question">1</span>생명체의 기원, 발달 및 원리 등을 연구한다.</div>
                                <div class="btn-group radio-group" role="group" aria-label="Basic radio toggle button group">
                                    <input type="radio" class="btn-check" name="btnradio" id="btnradio1" autocomplete="off" checked>
                                    <label class="btn btn-outline-primary" for="btnradio1">매우 싫다</label>
                                  
                                    <input type="radio" class="btn-check" name="btnradio" id="btnradio2" autocomplete="off">
                                    <label class="btn btn-outline-primary" for="btnradio2">약간 싫다</label>
                                  
                                    <input type="radio" class="btn-check" name="btnradio" id="btnradio3" autocomplete="off">
                                    <label class="btn btn-outline-primary" for="btnradio3">약간 좋다</label>

                                    <input type="radio" class="btn-check" name="btnradio" id="btnradio4" autocomplete="off">
                                    <label class="btn btn-outline-primary" for="btnradio4">매우 좋다</label>
                                  </div>
                            </li>
                       </ul>
                       <div class="button-wrap">
                            <button class="white-btn">이전</button>
                            <button class="white-btn">다음</button>
                       </div>
                    </div>
                </div>

                
            </div>
        </section>
    
        <!-- Bootstrap core JS-->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
    </body>
    
</html>
