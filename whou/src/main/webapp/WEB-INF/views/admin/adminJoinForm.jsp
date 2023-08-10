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
 </head>
 <style>
 #btn1:disabled {
  background-color: #ddd; /* 비활성화 배경색 */
  color: #888; /* 비활성화 글자색 */
  cursor: not-allowed; /* 비활성화된 버튼에는 커서를 변경하여 마우스 클릭을 방지 */
}
 
 </style>
 
<body>
   
  <div class="join-container">
        <div class="join-wrap">
          <div class="logo"><a class="navbar-brand" href="/whou/main"><img src="/whou/resources/img/logo.svg"></a></div>
          <div class="input-group">
            <form name="joinForm" method="post">
              	<div class="input-item">
	              <label for="joinInput" class="form-label">이메일</label>
	              	<c:if test="${email != null}">
	              		<input type="text" class="form-control" name = "email" id="email" value = "${email}">
	            	</c:if>
	            	<c:if test="${email == null}">
	            		<input type="text" class="form-control" name = "email" id="email" placeholder="name@example.com" required oninput = "checkEmail()">
	            		<span class="email_ok" style="color:green; display:none;">사용 가능한 이메일입니다.</span>
	            		<span class="email_already" style="color:red; display:none;">중복된 이메일입니다.</span>
	            		<span class="email_error" style="color:red; display:none;">이메일 형식에 맞게 입력해주세요.</span>
	            		<!--
	            		<button type="button" class="btn btn-outline-secondary" name="emailChk" id="emailChk">중복 확인</button>
	            		-->
	           		</c:if>
	            </div>
	            <div class="input-item">
	            	<c:if test="${email == null}">
		              	<label for="joinInput" class="form-label">비밀번호</label>
		              	<input type="password" class="form-control" name = "pw" id="pw" placeholder="4자리 이상">
		              	<span class="pw_error" style="color:red; display:none;">형식에 맞게 입력해주세요.</span>
	            	</c:if>
	            </div>
	            <div class="input-item">
	            	<c:if test="${email == null}">
		              	<label for="joinInput" class="form-label">비밀번호 확인</label>
		              	<input type="password" class="form-control" name = "pw" id="pw2" placeholder="4자리 이상" required oninput = "checkPw2()">
		              	<span class="pw_ok" style="color:green; display:none;">비밀번호가 일치합니다.</span>
		              	<span class="pw_x" style="color:red; display:none;">비밀번호가 일치하지 않습니다.</span>
	            	</c:if>
	            </div>
	            <div class="input-item">
	              <label for="joinInput" class="form-label">이름</label>
	              <input type="text" class="form-control" name = "name" id="name" placeholder="이름(실명) 입력">
	              <input type="hidden" class="form-control" id = "join_type" value ="whoU">
	            </div>
	            <div class="input-item">
	              <label for="joinInput" class="form-label">연도</label>
	              <input type="text" class="form-control" name = "birth_year" id="birth_year" placeholder="YYYY" required oninput = "checkYear()">
	              <span class="year_error" style="color:red; display:none;">형식에 맞게 4자리로 입력해주세요.</span>
	            </div>
	            <div class="input-item">
	              <label for="joinInput" class="form-label">휴대폰</label>
	              <div class="input-box">
		              <input type="text" class="form-control" id="tel" name = "tel" placeholder="'-' 빼고 숫자만 입력">
		              <button type="button" class="purple-btn" name="phoneChk" id="phoneChk">인증 요청</button>
	              </div>
		              <span class="tel_error" style="color:red; display:none;">형식에 맞게 휴대폰번호를 정확히 입력해주세요.</span>
		              <span class="tel_ok" style="color:green; display:none;">인증번호 발송이 완료되었습니다.<br/> </span><div id="telCheck" style="color:green;"></div>
	              <div class="input-box">
		              <input type="text" style="display:none;" class="form-control" id="tel2" name = "tel2" placeholder="인증번호 입력">
		              <button type="button" style="display:none;" class="purple-btn" name="phoneChk2" id="phoneChk2">인증 확인</button>
				  </div>
				  	  <span class="tel2_ok" style="color:green; display:none;">인증에 성공하셨습니다.</span>
		              <span class="tel2_error" style="color:red; display:none;">인증에 실패하셨습니다<br/>인증번호를 다시 확인해주십시오.</span>
	            </div>
	            <div class="input-wrap">
	            	<button type="button" class="purple-btn btn-xs" id="btn1">회원가입</button>
	          	</div>
          	</form>
          </div>
        </div>
      </div>
        <!-- Bootstrap core JS-->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
   		<script>
   		var code2 = null;
   		var telchk = null;
   		var check = /^[0-9]+$/; 
   		
   		//이메일 유효성 검사
   		function checkEmail() {
   		    var email = $("#email").val();
   		    $.ajax({
   		        url: "/whou/member/emailChk",
   		        data: { email: email },
   		        success: function (result) {
   		            if (email.length > 0 && result == 0 && email.includes('@') && email.includes('.com')) {
   		                $('.email_ok').css("display", "inline-block");
   		                $('.email_already').css("display", "none");
   		                $('.email_error').css("display", "none");
   		            } else if (email.length > 0 && result != 0 && email.includes('@') && email.includes('.com')) {
   		                $('.email_ok').css("display", "none");
   		                $('.email_already').css("display", "inline-block");
   		             	$('.email_error').css("display", "none");
   		            } else if (email.length == 0 && !email.includes('@') && !email.includes('.com')) {
   		                $('.email_ok').css("display", "none");
   		                $('.email_already').css("display", "none");
   		             	$('.email_error').css("display", "none");	
   		            } else if (!email.includes('@') && !email.includes('.com')) {
   		                $('.email_ok').css("display", "none");
   		                $('.email_already').css("display", "none");
   		             	$('.email_error').css("display", "inline-block");
   		            }
   		        }
   		    });
   		}
   		
   		//비밀번호 확인
   		function checkPw2() {
   		    var pw = $("#pw").val();
   		    var pw2 = $("#pw2").val();
   		    if(pw == pw2){
   		       $('.pw_ok').css("display", "inline-block");
   		       $('.pw_x').css("display", "none");
   		    }else{
   		       $('.pw_ok').css("display", "none");
   		       $('.pw_x').css("display", "inline-block");
   		    }
   		}
   		
   		//연도 유효성 검사
   		function checkYear() {
   			var birth_year = $("#birth_year").val();
   			if (birth_year.length === 4 && check.test(birth_year)) {
   		        $('.year_error').css("display", "none");
   		    } else if (birth_year.length > 0 && check.test(birth_year)) {
   		        $('.year_error').css("display", "inline-block");
   		    } else if (birth_year.length > 0 && !check.test(birth_year)) {
   		        $('.year_error').css("display", "inline-block");
   		    } else if (birth_year.length === 0) {
   		        $('.year_error').css("display", "none");
   		    }
   		}
   		
   		//휴대폰 번호 인증
   		$(function(){
	   		$("#phoneChk").click(function(){
	   		    var tel = $("#tel").val();
	   		    
	   		    //유효성검사
	   			if(tel.length === 11 && check.test(tel)){
	   				$('.tel_ok').css("display", "inline-block");
	   				$('.tel_error').css("display", "none");
	   				
	   				
	   				$("#tel2").css("display", "inline-block");
	                $("#phoneChk2").css("display", "inline-block");
		   		    $.ajax({
		   		        type:"POST",
		   		        url:"/whou/member/telChk",
		   		        data: {tel:tel},
		   		        cache : false,
		   		        success:function(numStr){
		   		            if(numStr == "error"){ //실패시 
		   		            }else{            //성공시        
		   		                code2 = numStr; // 성공하면 데이터저장
			   		            $("#telCheck").html("인증번호:"+numStr);            
		   		            }
		   		        }
		   		        
		   		    });
	   			}else{
	   				$('.tel_ok').css("display", "none");
	   				$('.tel_error').css("display", "inline-block");
	   			}
	   		    
	   		});
   		});
	 
   		//휴대폰 인증번호 대조
		$("#phoneChk2").click(function(){
		    if($("#tel2").val() == code2){ // 위에서 저장한값을 비교
		         //alert("인증에 성공하셨습니다.")
		         $('.tel2_ok').css("display", "inline-block");
	   			 $('.tel2_error').css("display", "none");
		         telchk = "성공";
		    }else{
		        //alert("인증에 실패하셨습니다.\n인증번호를 다시 입력해주세요.")
		        $('.tel2_ok').css("display", "none");
   				$('.tel2_error').css("display", "inline-block");
		    }
		});
   		
   		//전체 동의
   		

   		
   		$(function() {
   		    // 초기에 버튼 비활성화
   		    $("#btn1").prop("disabled", true);
   		    function updateButtonStatus() {
   		        var email = $("#email").val().replace(/ /g, '');
		        var name = $("#name").val().replace(/ /g, '');
		        var pw = $("#pw").val()
		        var birth_year = $("#birth_year").val().replace(/ /g, '');
		        var tel = $("#tel").val().replace(/ /g, '');
		        var join_type = $("#join_type").val().replace(/ /g, '');

   		        var emailValid = $('.email_already').css("display") === "none" && $('.email_error').css("display") === "none" && $('.email_ok').css("display") === "inline-block";
   		        var pwValid = $('.pw_x').css("display") === "none" && $('.pw_error').css("display") === "none" && $('.pw_ok').css("display") === "inline-block";
   		        var yearValid = $('.year_error').css("display") === "none";
   		        var telValid = $('.tel2_error').css("display") === "none" && $('.tel_error').css("display") === "none" && $('.tel2_ok').css("display") === "inline-block" && $('.tel_ok').css("display") === "inline-block";

   		        // 모든 조건이 만족할 때 버튼 활성화
   		        if(join_type != null){
   		        	if (email !== '' && name !== '' && birth_year !== '' && tel !== '' &&
   		   		        yearValid && telValid) {
   		   		            $("#btn1").prop("disabled", false);
   		   		        }else {
   		   		            $("#btn1").prop("disabled", true);
   		   		        }
   		        }else{
   		        	if (email !== '' && pw !== '' && name !== '' && birth_year !== '' && tel !== '' &&
   		   		        pwValid && yearValid && telValid) {
   		   		            $("#btn1").prop("disabled", false);
		   		        }else {
		   		            $("#btn1").prop("disabled", true);
		   		        }
   		        }
   		        
   		    }

   		    // 인풋 필드들의 입력값 변경 시에 이벤트 핸들러 할당
   		    $("#email, #pw, #name, #birth_year, #tel").on("input", function() {
   		        updateButtonStatus();
   		    });

   		    
   			// 핸드폰 인증 버튼 클릭될 때마다 버튼 상태 업데이트
   		    $("#phoneChk2").on("click", function() {
   		        updateButtonStatus();
   		    });
   		    
   		    
   		    //회원가입 버튼 클릭시 컨트롤러로
	   		$("#btn1").click(function() {
	   		  if (!$(this).prop("disabled")) {
	   			var email = $("#email").val().replace(/ /g, '');
		        var name = $("#name").val().replace(/ /g, '');
		        if(join_type != null){
		        	var pw = "0000";
		        }else{
		        	var pw = $("#pw").val()
		        }
		        var birth_year = $("#birth_year").val().replace(/ /g, '');
		        var tel = $("#tel").val().replace(/ /g, '');
		        var join_type = $("#join_type").val().replace(/ /g, '');
  
	   			//컨트롤러로 보낼 데이터
     		 	var data = {
  	        		email: email,
  	                pw: pw,
  	                name: name,
  	                birth_year: birth_year,
  	                tel: tel,
  	                join_type: join_type
	  	        };

	   			$.ajax({
	   		      url: "/whou/admin/adminPro",
	   		      contentType: "application/x-www-form-urlencoded; charset=UTF-8",
	   		      method: "POST",
	   		      data: data,
	   		      error: function() {
	   		        alert("오류");
	   		      },
	   		      success: function(result) {
	   		        if (result == 0) {
	   		          alert("가입이 완료되었습니다.");
	   		        } else if (result == 1) {
	   		          alert("이미 가입하셨습니다");
	   		        }
	   		        window.location.href = "/whou/admin/adminList";
	   		      }
	   		    });
	   		  }
	   	   });
   		}); 
		</script>
    </body>
    
</html>
