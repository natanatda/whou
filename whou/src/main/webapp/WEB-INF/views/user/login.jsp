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
        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    </head>
 
<body>
   
  <div class="login-container">
        <div class="login-wrap">
       
          <div class="logo"><a class="navbar-brand"  href="/whou/main"><img src="/whou/resources/img/logo.svg"></a></div>
          <p>회원이 아니신가요? <a href="/whou/member/joinForm">회원가입하기</a></p>
         
          <form class="input-wrap" onsubmit="performLogin(); return false;">
		        <div class="input-form-box"><input type="text" name="email" id="email" class="form-control" placeholder="이메일"></div>
		        <div class="input-form-box"><input type="password" name="pw" id="pw" class="form-control" placeholder="비밀번호"></div>
		        <button type="submit" class="btn login-btn btn-xs" id="btn1">로그인 하기</button>
		  </form>
          <div class="simple-login">
            <p>SNS 간편 로그인</p>
            <ul>
              <li><a href="https://kauth.kakao.com/oauth/authorize?response_type=code&client_id=7411fb12b3136c342fa5bfeca89cc0d2&redirect_uri=http://localhost:8080/whou/member/kakao&prompt=login"><i class="fa-solid fa-comment" style="color: #ffffff;"></a></i></li>
              <li><a href="/whou/member/naver"><img src="/whou/resources/img/btnG_아이콘원형.png" width="100%"></a></i></li>
              <li><a href="/whou/member/google"><i class="fa-brands fa-google" style="color: #ffffff;"></a></i></li>
            </ul>
          </div>
          <div class="find-wrap">
            <a href="/whou/member/findEmail">이메일/비밀번호 찾기</a>
          </div>
        </div>
      </div>
        <!-- Bootstrap core JS-->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
    	<script>
    	let warn = ${warn};
    	if(warn === 1){
    		alert("다른 방식으로 가입하셨습니다.");
    	}
    	
    	
    	//email과 pw가 일치하는지 확인
   		$(function() {
		    $("#btn1").click(function() {
		    	var email = $("#email").val();
		    	var pw = $("#pw").val();
		        
		        if (email === '' || pw == '') {
		            alert("모든 항목을 입력해주세요.");
		            return false;
		        }

		        $.ajax({
		            url: "/whou/member/loginPro",
		            contentType: "application/x-www-form-urlencoded; charset=UTF-8",
		            method: "POST",
		            data:{email:email, pw:pw},
		            error: function(xhr, status, error) {
		                var errorMessage = "오류: " + xhr.status + " " + xhr.statusText;
		                alert(errorMessage);
		                //window.location.href = "/whou/main";
		            },
		            success: function(dpw) {
		                if(dpw == '') {
		                	alert("이메일을 다시 확인해주세요.");
		                }else if(dpw == pw) {
		                	window.location.href = "/whou/main";
		                }else if(dpw != pw ){
		                	alert("비밀번호가 일치하지 않습니다.\n다시 입력해주세요.");
		                }
		            }
		        });
		    });
		});
    	</script>
    	<script>
        function performLogin() {
            var email = $("#email").val();
            var pw = $("#pw").val();

            if (email === '' || pw == '') {
                alert("모든 항목을 입력해주세요.");
                return false;
            }

            $.ajax({
                url: "/whou/member/loginPro",
                contentType: "application/x-www-form-urlencoded; charset=UTF-8",
                method: "POST",
                data: { email: email, pw: pw },
                error: function(xhr, status, error) {
                    var errorMessage = "오류: " + xhr.status + " " + xhr.statusText;
                    alert(errorMessage);
                },
                success: function(dpw) {
                    if (dpw == '') {
                        alert("이메일을 다시 확인해주세요.");
                    } else if (dpw == pw) {
                        window.location.href = "/whou/main";
                    } else if (dpw != pw) {
                        alert("비밀번호가 일치하지 않습니다.\n다시 입력해주세요.");
                    }
                }
            });
        }
	    </script> 
    </body>
    
</html>