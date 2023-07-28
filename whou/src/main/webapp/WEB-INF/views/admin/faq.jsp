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
        <script src="https://code.jquery.com/jquery-3.7.0.min.js"></script>
        <script src="../resources/js/ai.js"></script>
        <script>
			$(document).ready(function(){
				// menu 클래스 바로 하위에 있는 a 태그를 클릭했을때
				$(".whomenu>a").click(function(){
					var submenu = $(this).next("ul");
		   
					// submenu 가 화면상에 보일때는 위로 부드럽게 접고 아니면 아래로 부드럽게 펼치기
					if( submenu.is(":visible") ){
						submenu.slideUp();
					}else{
						submenu.slideDown();
					}
				});
			});
			$(function(){
				$(".num").click(function(){ 
					var scrollPosition = $(window).scrollTop(); // 현재 스크롤 위치 저장
					$.ajax({
						url: "/whou/cs/faqReadCount",
						data: {num: $(this).data('value')}, // 제목 누른 faq 조회수 증가
						success: function(result) {
							$(window).scrollTop(scrollPosition); // ajax동작 후 저장해놓은 위치로 이동
						}
					});
				});
			});
		</script>
		<style>
			.whomenu .hide {
				display: none;
			}
		</style>
    </head>
 
    <body>
    
        <!-- Responsive navbar-->
       <%@ include file="../header.jsp" %>        
        <!-- Header-->
		<header class="py-5">
			<div class="container px-5">
				<h2 class="page-title">FAQ</h2>
				<div style="float: right;">
					<c:if test="${lv == 2}"> <%-- 관리자면 버튼 출력 --%>
						<button type="button" class="btn btn-light" onclick="location='/whou/cs/faqWriteForm'">글작성</button>
					</c:if>
				</div>
					<section class="py-5 disc-section" >
						<ul class="nav nav-underline tab" id="pills-tab" role="tablist">
							<li class="nav-item" role="presentation">						
								<button onclick="location='/whou/cs/faq'" class="nav-link" id="pills-home-tab" data-bs-toggle="pill" data-bs-target="#pills-home" type="button" role="tab" aria-controls="pills-home" aria-selected="false"><span>전체</span>보기</button>
							</li>
							<li class="nav-item" role="presentation">
								<button onclick="location='/whou/cs/faq?category=자주묻는질문'" class="nav-link" id="pills-profile-tab" data-bs-toggle="pill" data-bs-target="#pills-profile" type="button" role="tab" aria-controls="pills-profile" aria-selected="false"><span>자주</span>묻는 질문</button>
							</li>
							<li class="nav-item" role="presentation">
								<button onclick="location='/whou/cs/faq?category=회원가입/탈퇴관련'" class="nav-link" id="pills-contact-tab" data-bs-toggle="pill" data-bs-target="#pills-contact" type="button" role="tab" aria-controls="pills-contact" aria-selected="false"><span>회원</span>관련</button>
							</li>
							<li class="nav-item" role="presentation">
								<button onclick="location='/whou/cs/faq?category=진로검사및상담'" class="nav-link" id="pills-disabled-tab" data-bs-toggle="pill" data-bs-target="#pills-disabled" type="button" role="tab" aria-controls="pills-disabled" aria-selected="false"><span>진로</span>검사</button>
							</li>
							<li class="nav-item" role="presentation">
								<button onclick="location='/whou/cs/faq?category=직업정보'" class="nav-link" id="pills-disabled-tab" data-bs-toggle="pill" data-bs-target="#pills-disabled" type="button" role="tab" aria-controls="pills-disabled" aria-selected="false"><span>직업</span>정보</button>
							</li>
							<li class="nav-item" role="presentation">
								<button onclick="location='/whou/cs/faq?category=활용TIP'" class="nav-link" id="pills-disabled-tab" data-bs-toggle="pill" data-bs-target="#pills-disabled" type="button" role="tab" aria-controls="pills-disabled" aria-selected="false">활용<span>TIP</span></button>
							</li>
							<li class="nav-item" role="presentation">
								<button onclick="location='/whou/cs/faq?category=기타'" class="nav-link" id="pills-disabled-tab" data-bs-toggle="pill" data-bs-target="#pills-disabled" type="button" role="tab" aria-controls="pills-disabled" aria-selected="false">기타</button>
							</li>
						</ul>
						<c:forEach items="${faqList}" var="faq">
							<div class="list-group">
								<ul>
									<li class="list-group-item list-group-item-light whomenu">
										<a href="#" id="num" class="num" data-value="${faq.num}">${faq.subject}</a>
									<ul class="hide">
										<li class="list-group-item list-group-item-light">${faq.content} <br/>
											<c:if test="${lv == 2}"> 
												<input type="button" value="삭제" class="btn btn-light deleteFaq" data-value="${faq.num}" />
											</c:if>
										</li>
									</ul>
									</li>
								</ul>
							</div>
						</c:forEach>
					<div class="tab-pane fade" id="pills-profile" role="tabpanel" aria-labelledby="pills-profile-tab" tabindex="0">...</div>
					<div class="tab-pane fade" id="pills-contact" role="tabpanel" aria-labelledby="pills-contact-tab" tabindex="0">...</div>
					<div class="tab-pane fade" id="pills-disabled" role="tabpanel" aria-labelledby="pills-disabled-tab" tabindex="0">...</div>
					</section>
				</div>
				
			</header>
			<%@ include file="../aiChatBot.jsp" %>
           <%@ include file="../footer.jsp" %>
           <!-- Bootstrap core JS-->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
           <%-- location='/whou/cs/faqDelete?num=${faq.num}' --%>
           <script>
		$(".deleteFaq").click(function(){
			var deleteNum = $(this).data('value');
			if(confirm("삭제 하시겠습니까?") == true){
				location='/whou/cs/faqDelete?num='+deleteNum;	
			}
		});
	</script>
	</body>
</html>