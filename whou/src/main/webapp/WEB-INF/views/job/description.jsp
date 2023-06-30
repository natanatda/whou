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
                                    <option value="">직업명</option>
                                    <option value="">하는일</option>
                                </select>
                            </div>
                            <div class="input-group search-form">
                                <span class="search-btn"><i class="fa-solid fa-magnifying-glass fa-xl" style="color: #5a3fff;"></i></span>
                                <input type="text" class="">
                            </div>
                        </div>
                    </div>
                </div>
                <section class="py-5 disc-section" >
                    <div class="card search-card">
                        <div class="card-body">
                            <ul class="nav nav-underline tab" id="pills-tab" role="tablist">
                                <li class="nav-item" role="presentation">
                                  <button class="nav-link active" id="pills-home-tab" data-bs-toggle="pill" data-bs-target="#pills-home" type="button" role="tab" aria-controls="pills-home" aria-selected="true"><span>테마</span>별 검색</button>
                                </li>
                                <li class="nav-item" role="presentation">
                                  <button class="nav-link" id="pills-profile-tab" data-bs-toggle="pill" data-bs-target="#pills-profile" type="button" role="tab" aria-controls="pills-profile" aria-selected="false"><span>직업유형</span>별 검색</button>
                                </li>
                                <li class="nav-item" role="presentation">
                                  <button class="nav-link" id="pills-contact-tab" data-bs-toggle="pill" data-bs-target="#pills-contact" type="button" role="tab" aria-controls="pills-contact" aria-selected="false"><span>조건</span>별 검색</button>
                                </li>
                                <li class="nav-item" role="presentation">
                                  <button class="nav-link" id="pills-disabled-tab" data-bs-toggle="pill" data-bs-target="#pills-disabled" type="button" role="tab" aria-controls="pills-disabled" aria-selected="false"><span>직업분류</span>별 검색</button>
                                </li>
                              </ul>
                              <div class="tab-content" id="pills-tabContent">
                                <div class="tab-pane fade show active" id="theme" role="tabpanel" aria-labelledby="pills-home-tab" tabindex="0">
                                    <h5>최근 대두되는 관심과 흥미를 반영한 작업별 테마를 선택하여 작업을 검색할 수 있습니다.</h5>
                                    <ul class="button-wrap mb-3">
                                        <li class="active">
                                            <button class="circle-btn"><i class="fa-solid fa-robot fa-2xl" style="color: #5a3fff;"></i></button>
                                            <p>AI / 로봇</p>
                                        </li>
                                        <li>
                                            <button class="circle-btn"><i class="fa-solid fa-robot fa-2xl" style="color: #5a3fff;"></i></button>
                                            <p>AI / 로봇</p>
                                        </li>
                                        <li>
                                            <button class="circle-btn"><i class="fa-solid fa-robot fa-2xl" style="color: #5a3fff;"></i></button>
                                            <p>AI / 로봇</p>
                                        </li>
                                        <li>
                                            <button class="circle-btn"><i class="fa-solid fa-robot fa-2xl" style="color: #5a3fff;"></i></button>
                                            <p>AI / 로봇</p>
                                        </li>
                                        <li>
                                            <button class="circle-btn"><i class="fa-solid fa-robot fa-2xl" style="color: #5a3fff;"></i></button>
                                            <p>AI / 로봇</p>
                                        </li>
                                        <li>
                                            <button class="circle-btn"><i class="fa-solid fa-robot fa-2xl" style="color: #5a3fff;"></i></button>
                                            <p>AI / 로봇</p>
                                        </li>
                                        <li>
                                            <button class="circle-btn"><i class="fa-solid fa-robot fa-2xl" style="color: #5a3fff;"></i></button>
                                            <p>AI / 로봇</p>
                                        </li>
                                        <li>
                                            <button class="circle-btn"><i class="fa-solid fa-robot fa-2xl" style="color: #5a3fff;"></i></button>
                                            <p>AI / 로봇</p>
                                        </li>
                                        <li>
                                            <button class="circle-btn"><i class="fa-solid fa-robot fa-2xl" style="color: #5a3fff;"></i></button>
                                            <p>AI / 로봇</p>
                                        </li>
                                        <li>
                                            <button class="circle-btn"><i class="fa-solid fa-robot fa-2xl" style="color: #5a3fff;"></i></button>
                                            <p>AI / 로봇</p>
                                        </li>  
                                                                              
                                    </ul>
                                    <ul class="button-wrap">
                                        <li>
                                            <button class="circle-btn"><i class="fa-solid fa-robot fa-2xl" style="color: #5a3fff;"></i></button>
                                            <p>AI / 로봇</p>
                                        </li>
                                        <li>
                                            <button class="circle-btn"><i class="fa-solid fa-robot fa-2xl" style="color: #5a3fff;"></i></button>
                                            <p>AI / 로봇</p>
                                        </li>
                                        <li>
                                            <button class="circle-btn"><i class="fa-solid fa-robot fa-2xl" style="color: #5a3fff;"></i></button>
                                            <p>AI / 로봇</p>
                                        </li>
                                        <li>
                                            <button class="circle-btn"><i class="fa-solid fa-robot fa-2xl" style="color: #5a3fff;"></i></button>
                                            <p>AI / 로봇</p>
                                        </li>
                                        <li>
                                            <button class="circle-btn"><i class="fa-solid fa-robot fa-2xl" style="color: #5a3fff;"></i></button>
                                            <p>AI / 로봇</p>
                                        </li>
                                        <li>
                                            <button class="circle-btn"><i class="fa-solid fa-robot fa-2xl" style="color: #5a3fff;"></i></button>
                                            <p>AI / 로봇</p>
                                        </li>
                                        <li>
                                            <button class="circle-btn"><i class="fa-solid fa-robot fa-2xl" style="color: #5a3fff;"></i></button>
                                            <p>AI / 로봇</p>
                                        </li>
                                        <li>
                                            <button class="circle-btn"><i class="fa-solid fa-robot fa-2xl" style="color: #5a3fff;"></i></button>
                                            <p>AI / 로봇</p>
                                        </li>
                                        <li>
                                            <button class="circle-btn"><i class="fa-solid fa-robot fa-2xl" style="color: #5a3fff;"></i></button>
                                            <p>AI / 로봇</p>
                                        </li>
                                        <li>
                                            <button class="circle-btn"><i class="fa-solid fa-robot fa-2xl" style="color: #5a3fff;"></i></button>
                                            <p>AI / 로봇</p>
                                        </li>
                                        
                                    </ul>
                                </div>
                                <div class="tab-pane fade" id="pills-profile" role="tabpanel" aria-labelledby="pills-profile-tab" tabindex="0">...</div>
                                <div class="tab-pane fade" id="pills-contact" role="tabpanel" aria-labelledby="pills-contact-tab" tabindex="0">...</div>
                                <div class="tab-pane fade" id="pills-disabled" role="tabpanel" aria-labelledby="pills-disabled-tab" tabindex="0">...</div>
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
                    <p class="result-top-txt">총 <span>534</span>건이 검색되었습니다</p>
                    <div class="result-top-right">
                        <select name="" id="">
                            <option value="">정렬순서</option>
                        </select>
                        <select name="" id="">
                            <option value="">9개씩보기</option>
                        </select>
                        <button class="square-btn">적용</button>
                        <div><i class="fa-solid fa-table-cells fa-lg"></i></div>
                        <div><i class="fa-solid fa-bars fa-lg"></i></div>
                    </div>
                </div>
                
                <div class="row gx-5 gy-5 justify-content-center">
                  
                    <div class="col-lg-6 col-xl-4">
                        <div class="card mb-5 mb-xl-0">
                            <div class="result-img">img</div>
                            <div class="result-cont">
                                <h4>시작디자이너 <i class="fa-solid fa-chevron-right fa-xs" style="color: #111111;"></i></h4>
                                <p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Tenetur blanditiis explicabo consequuntur corporis est vel . </p>
                            </div>
                        </div>
                    </div>
                
                    <div class="col-lg-6 col-xl-4">
                        <div class="card mb-5 mb-xl-0">
                            <div class="result-img">img</div>
                            <div class="result-cont">
                                <h4>시작디자이너 <i class="fa-solid fa-chevron-right fa-xs" style="color: #111111;"></i></h4>
                                <p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Tenetur blanditiis explicabo consequuntur corporis est vel . </p>
                            </div>
                        </div>
                    </div>
           
                    <div class="col-lg-6 col-xl-4">
                        <div class="card mb-5 mb-xl-0">
                            <div class="result-img">img</div>
                            <div class="result-cont">
                                <h4>시작디자이너 <i class="fa-solid fa-chevron-right fa-xs" style="color: #111111;"></i></h4>
                                <p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Tenetur blanditiis explicabo consequuntur corporis est vel . </p>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-6 col-xl-4">
                        <div class="card mb-5 mb-xl-0">
                            <div class="result-img">img</div>
                            <div class="result-cont">
                                <h4>시작디자이너 <i class="fa-solid fa-chevron-right fa-xs" style="color: #111111;"></i></h4>
                                <p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Tenetur blanditiis explicabo consequuntur corporis est vel . </p>
                            </div>
                        </div>
                    </div>
                
                    <div class="col-lg-6 col-xl-4">
                        <div class="card mb-5 mb-xl-0">
                            <div class="result-img">img</div>
                            <div class="result-cont">
                                <h4>시작디자이너 <i class="fa-solid fa-chevron-right fa-xs" style="color: #111111;"></i></h4>
                                <p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Tenetur blanditiis explicabo consequuntur corporis est vel . </p>
                            </div>
                        </div>
                    </div>
           
                    <div class="col-lg-6 col-xl-4">
                        <div class="card mb-5 mb-xl-0">
                            <div class="result-img">img</div>
                            <div class="result-cont">
                                <h4>시작디자이너 <i class="fa-solid fa-chevron-right fa-xs" style="color: #111111;"></i></h4>
                                <p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Tenetur blanditiis explicabo consequuntur corporis est vel . </p>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-6 col-xl-4">
                        <div class="card mb-5 mb-xl-0">
                            <div class="result-img">img</div>
                            <div class="result-cont">
                                <h4>시작디자이너 <i class="fa-solid fa-chevron-right fa-xs" style="color: #111111;"></i></h4>
                                <p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Tenetur blanditiis explicabo consequuntur corporis est vel . </p>
                            </div>
                        </div>
                    </div>
                
                    <div class="col-lg-6 col-xl-4">
                        <div class="card mb-5 mb-xl-0">
                            <div class="result-img">img</div>
                            <div class="result-cont">
                                <h4>시작디자이너 <i class="fa-solid fa-chevron-right fa-xs" style="color: #111111;"></i></h4>
                                <p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Tenetur blanditiis explicabo consequuntur corporis est vel . </p>
                            </div>
                        </div>
                    </div>
           
                    <div class="col-lg-6 col-xl-4">
                        <div class="card mb-5 mb-xl-0">
                            <div class="result-img">img</div>
                            <div class="result-cont">
                                <h4>시작디자이너 <i class="fa-solid fa-chevron-right fa-xs" style="color: #111111;"></i></h4>
                                <p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Tenetur blanditiis explicabo consequuntur corporis est vel . </p>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="pagination">
                    <nav aria-label="Page navigation">
                        <ul class="pagination">
                          <li class="page-item">
                            <a class="page-link" href="#!" aria-label="Previous">
                              <span aria-hidden="true">&laquo;</span>
                            </a>
                          </li>
                          <li class="page-item"><a class="page-link" href="#!">1</a></li>
                          <li class="page-item"><a class="page-link" href="#!">2</a></li>
                          <li class="page-item"><a class="page-link" href="#!">3</a></li>
                          <li class="page-item">
                            <a class="page-link" href="#!" aria-label="Next">
                              <span aria-hidden="true">&raquo;</span>
                            </a>
                          </li>
                        </ul>
                      </nav>
                </div>
                
            </div>
        </section>
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
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
        <script>
            const triggerTabList = document.querySelectorAll('#myTab button')
				triggerTabList.forEach(triggerEl => {
				  const tabTrigger = new bootstrap.Tab(triggerEl)
				
				  triggerEl.addEventListener('click', event => {
				    event.preventDefault()
				    tabTrigger.show()
				  })
				})
        </script>
    </body>
    
</html>
