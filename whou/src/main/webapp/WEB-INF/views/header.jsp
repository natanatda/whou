<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
 <nav class="navbar navbar-expand-lg ">
            <div class="container px-5">
               
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation"><span class="navbar-toggler-icon"></span></button>
                <div class="collapse navbar-collapse" id="navbarSupportedContent">
                    <ul class="navbar-nav mb-2 mb-lg-0">
                        <a class="navbar-brand main-logo" href="/whou/main"><img src="/whou/resources/img/logo.svg"></a>
                        <li class="nav-item"><a class="nav-link" href="#!">직업정보</a></li>
                        <li class="nav-item"><a class="nav-link" href="/whou/aptitude/aptitudeMain">진로검사</a></li>
                        <li class="nav-item"><a class="nav-link" href="#!">고객지원</a></li>
                        <li class="nav-item"><a class="nav-link" href="#!">알림</a></li>
                    </ul>
                </div>
                <div class="collapse navbar-collapse" id="navbarSupportedContent">
                    <ul class="navbar-nav ms-auto mb-2 mb-lg-0">
                        <li class="nav-item"><a class="nav-link" href="#!">My 비서</a></li>
                        <li class="nav-item"><a class="nav-link" href="#!">진로컨설팅</a></li>
                        <c:if test="${memId != null}">
                        	<li class="nav-item"><a class="nav-link" href="#!">${memId}마이페이지</a></li>
                        	<li class="nav-item"><a class="nav-link" href="/whou/member/logout">로그아웃</a></li>
                        </c:if>
                        <c:if test="${memId == null}">
                        	<c:if test="${warn != null}">
								<h2>!!!! 다른걸로 가입했습니다 !!!!</h2>
							</c:if>
                        	<li class="nav-item"><a class="nav-link" href="/whou/member/login">로그인/회원가입</a></li>
						</c:if>
                    </ul>
                </div>
            </div>
        </nav>
</body>
</html>