<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>404 Error</title>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" />
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
  <style>
    @font-face {
      font-family: 'Pretendard';
      font-style: normal;
      src: url('/whou/resources/font/Pretendard-Thin.woff2') format('woff2');
    }

    #error-home-bt {
      border: 1px solid #6F61C0;
      background-color: #6F61C0;
      font-weight: bold;
    }
  </style>
</head>
<body>
  <div class="d-flex align-items-center justify-content-center vh-100">
    <div class="text-center">
      <h1 class="display-1 fw-bold">404</h1>
      <p class="fs-3"> (error) 요청하신 페이지가 없습니다.</p>
      <p class="lead">
        사라졌거나 존재하지 않는 페이지입니다.
      </p>
      <a href="/whou/main" class="btn btn-primary" id="error-home-bt">WhoU 홈으로 돌아가기</a>
    </div>
  </div>
</body>
</html>