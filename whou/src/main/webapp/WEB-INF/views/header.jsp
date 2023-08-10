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
                        <a class="navbar-brand main-logo" href="/whou/main"><img src="/whou/resources/img/logo.svg" /></a>
                        <li class="nav-item"><a class="nav-link" href="/whou/job/dic">직업정보</a></li>
                        <li class="nav-item"><a class="nav-link" href="/whou/aptitude/aptitudeMain">진로검사</a></li>
                        <li class="nav-item dropdown">
				          <a class="nav-link dropdown-toggle" href="/whou/cs/notice" role="button" data-bs-toggle="dropdown" aria-expanded="false">
				            진로탐색
				          </a>
				          <ul class="dropdown-menu">
				            <li><a class="dropdown-item" href="/whou/education/majorList">학과정보</a></li>
				            <li><a class="dropdown-item" href="/whou/education/training">교육정보</a></li>
				          </ul>
				        </li>
                        <li class="nav-item dropdown">
				          <a class="nav-link dropdown-toggle" role="button" data-bs-toggle="dropdown" aria-expanded="false">
				            고객지원
				          </a>
				          <ul class="dropdown-menu">
				            <li><a class="dropdown-item" href="/whou/cs/notice">공지사항</a></li>
				            <li><a class="dropdown-item" href="/whou/cs/faq">FAQ</a></li>
				          </ul>
				        </li>
				        <li class="nav-item">
				          <a class="nav-link" href="/whou/job/calendar" >
				            채용달력
				          </a>
				        </li>
                    </ul>
                </div>
                <div class="collapse navbar-collapse" id="navbarSupportedContent">
                    <ul class="navbar-nav ms-auto mb-2 mb-lg-0">
                        <c:if test="${memId != null}">
                        		<c:if test="${level == '1'}">
                        			<li class="nav-item"><a class="nav-link" href="/whou/member/mypage?load=6">진로컨설팅</a></li>
                        			<li class="nav-item"><a class="nav-link" href="/whou/member/mypage">마이페이지</a></li>
                        		</c:if>
	                        	<c:if test="${level == '2'}">
                        			<li class="nav-item"><a class="nav-link" href="/whou/cs/admin">관리자페이지</a></li>
                        		</c:if>
	                        	<li class="nav-item"><a class="nav-link" href="/whou/member/logout">로그아웃</a></li>
                        </c:if>
                        <c:if test="${memId == null}">
                        	<li class="nav-item"><a class="nav-link" href="/whou/member/login">로그인/회원가입</a></li>
						</c:if>
                    </ul>
                </div>
            </div>
        </nav>
</body>
</html>