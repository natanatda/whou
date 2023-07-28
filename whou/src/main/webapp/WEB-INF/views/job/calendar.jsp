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

       <%@ include file="../header.jsp" %>            
        <!-- Pricing section-->
        <section class="py-2 calendar-section">
        	<h3>공채달력</h3>
            <div class="container px-5 my-5">
				<iframe id="pageFrame" name="pageFrame" src="http://www.jobkorea.co.kr/Starter/calendar/sub/month" frameborder="0"
				scrolling="auto"></iframe>
            </div>
        </section>
 
    </body>
</html>
