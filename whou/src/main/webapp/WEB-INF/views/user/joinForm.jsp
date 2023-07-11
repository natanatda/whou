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
 
<body>
   
  <div class="join-container">
        <div class="join-wrap">
          <div class="logo"><a class="navbar-brand" href="/whou/main"><img src="/whou/resources/img/logo.svg"></a></div>
          <div class="input-group">
            <form name="joinForm" method="post">
              	<div class="input-item">
	              <label for="joinInput" class="form-label">이메일</label>
	              	<c:if test="${email != null}">
	              		<input type="text" class="form-control" name = "email" value = "${email}">
	            	</c:if>
	            	<c:if test="${email == null}">
	            		<input type="text" class="form-control" name = "email" placeholder="name@example.com">
	           		</c:if>
	            </div>
	            <div class="input-item">
	            	<c:if test="${email == null}">
		              	<label for="joinInput" class="form-label">비밀번호</label>
		              	<input type="password" class="form-control" name = "pw" placeholder="4자리 이상">
	            	</c:if>
	            </div>
	            <div class="input-item">
	              <label for="joinInput" class="form-label">이름</label>
	              <input type="text" class="form-control" name = "name" placeholder="이름(실명) 입력">
	              <input type="hidden" class="form-control" name = "join_type" value ="${join_type}">
	            </div>
	            <div class="input-item">
	              <label for="joinInput" class="form-label">연도</label>
	              <input type="text" class="form-control" name = "birth_year" placeholder="YYYY">
	            </div>
	            <div class="input-item">
	              <label for="joinInput" class="form-label">휴대폰</label>
	              <input type="text" class="form-control" id="tel" name = "tel" placeholder="'-' 빼고 숫자만 입력">
	              <button type="button" class="btn btn-outline-secondary" name="phoneChk" id="phoneChk">인증요청</button>
	              <input type="text" class="form-control" id="tel2" name = "tel2" placeholder="인증번호 입력">
	              <button type="button" class="btn btn-outline-secondary" name="phoneChk2" id="phoneChk2">인증확인</button>
	            </div>
	            <div class="input-item">
				  	<input type="radio" class="" id="gender_F" name="gender" value="F">
					<label for="gender_F" class="form-label">
					    여성
					</label>
					<input type="radio" class="" id="gender_M" name="gender" value="M">
					<label for="gender_M" class="form-label">
					    남성
					</label>
				</div>
				
	            <div class="input-item">
	              <label for="joinInput" class="form-label">약관</label>
	              <div class="agree_box">
	                <ul class="agree_article">
	                    <li>
	                      <div class="InpBox">
	                          <span class="Chk">
	                            <input type="checkbox" class="check_mail" id="agreeAllPersonal">
	                            <label class="check-all check-fil Lbl" for="agreeAllPersonal">
	                                전체 동의
	                            </label>
	                            <input type="hidden" name="hidden_check_all" value="1" id="hidden_check_all">
	                        </span>
	                      </div>
	                    </li>
	                </ul>
	                <ul class="agree_article depth2">
	                    <li>
	                        <div class="agree_desc">
	                            <div class="InpBox">
	                                <span class="Chk">
	                                  <input type="checkbox" id="agree_rule1" >
	                                  <label class="Lbl check-fil check_off" for="agree_rule1">
	                                    (필수) 개인회원 약관에 동의
	                                  </label>
	                                </span>
	                            </div>
	                        </div>
	                    </li>
	                    <li>
	                        <div class="agree_desc">
	                            <div class="InpBox">
	                                <span class="Chk">
	                                <input type="checkbox" id="agree_take1">
	                                <label class="Lbl check-fil check_off" for="agree_take1">
	                                  (필수) 개인정보 수집 및 이용에 동의
	                                </label>
	                            </span>
	                            </div>
	                        </div>
	
	                    </li>
	                    <li>
	                        <div class="agree_desc">
	                            <div class="InpBox">
	                                <span class="Chk">
	                                <input type="checkbox" id="locationBased" name="locationBased" value="y">
	                                <label class="Lbl check_off" for="locationBased">
	                                  (선택) 위치기반서비스 이용약관에 동의
	                                </label>
	                            </span>
	
	                            </div>
	                        </div>
	                 
	                    </li>
	                    <li>
	                        <div class="agree_desc">
	                            <div class="InpBox">
	                                <span class="Chk">
	                                <input type="checkbox" class="check_mail" id="termsAgree" name="termsAgree" value="y">
	                                <label class="Lbl  check_off" for="termsAgree">
	                                   (선택) 마케팅 정보 수신 동의 - 이메일
	                                </label>
	                            </span>
	                            </div>
	                        </div>
	                 
	                    </li>
	                    <li>
	                        <div class="agree_desc">
	                            <div class="InpBox">
	                                <input type="checkbox" id="sms_receive_fl" name="sms_receive_fl" value="y">
	                                <label class="Lbl  check_off" for="sms_receive_fl">
	                                   (선택) 마케팅 정보 수신 동의 - SMS/MMS
	                                </label>                            
	                            </div>
	                        </div>
	                    </li>
	                </ul>
	            </div>
	            </div>
	            <div class="input-wrap">
	            	<button type="button" class="purple-btn btn-xs" id="btn1" onclick="checkAgreement()">회원가입</button>
	          	</div>
          	</form>
          </div>
        </div>
      </div>
        <!-- Bootstrap core JS-->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
   		<script>
   		//휴대폰 번호 인증
   		var code2 = null;
   		var telchk = null;
   		$(function(){
	   		$("#phoneChk").click(function(){
	   		    //alert('인증번호 발송이 완료되었습니다.\n휴대폰에서 인증번호 확인을 해주십시오.');
	   		    var tel = $("#tel").val();
	   		    $.ajax({
	   		        type:"POST",
	   		        url:"/whou/member/telChk",
	   		        data: {tel:tel},
	   		        cache : false,
	   		        success:function(numStr){
	   		            if(numStr == "error"){ //실패시 
	   		                alert("휴대폰 번호가 올바르지 않습니다.")
	   		            }else{            //성공시        
	   		                alert("인증번호 발송이 완료되었습니다.\n휴대폰에서 인증번호 확인을 해주십시오.")
	   		                code2 = numStr; // 성공하면 데이터저장
	   		            }
	   		        }
	   		        
	   		    });
	   		});
   		});
	 
   		//휴대폰 인증번호 대조
		$("#phoneChk2").click(function(){
		    if($("#tel2").val() == code2){ // 위에서 저장한값을 ㅣ교함
		         alert("인증에 성공하셨습니다.")
		         telchk = "성공";
		    }else{
		        alert("인증에 실패하셨습니다.\n인증번호를 다시 입력해주세요.")
		    }
		});
   		
   		//전체 동의
   		document.getElementById("agreeAllPersonal").addEventListener("click", function() {
   		  var checkboxes = document.querySelectorAll(".agree_article input[type='checkbox']");
   		  var checkAll = this.checked;

   		  for (var i = 0; i < checkboxes.length; i++) {
   		    checkboxes[i].checked = checkAll;
   		  }
   		});

   		//값을 컨트롤러로 넘겨주면서 db에 있는 전화번호랑 비교
   		$(function() {
		    $("#btn1").click(function() {
	
		        var emailValue = $("form[name='joinForm'] input[name='email']").val();
		        var pwValue = $("form[name='joinForm'] input[name='pw']").val();
		        var nameValue = $("form[name='joinForm'] input[name='name']").val();
		        var birthYearValue = $("form[name='joinForm'] input[name='birth_year']").val();
		        var telValue = $("form[name='joinForm'] input[name='tel']").val();
		        var genderValue = $("form[name='joinForm'] input[name='gender']:checked").val();
		        var joinValue = $("form[name='joinForm'] input[name='join_type']").val();
		        
		        if (emailValue === '' || pwValue == '' || nameValue === '' || birthYearValue === '' || telValue === '' || genderValue === '') {
		            alert("모든 항목을 입력해주세요.");
		            return false; // Prevent form submission
		        }
		        
		        if (telchk == null){
		        	alert("번호 인증을 완료해주세요.")
		        	return false;
		        }
		        var requiredAgreements = document.querySelectorAll('.agree_article.depth2 input[type="checkbox"]:not(#locationBased):not(.check_mail)');
		        var isAllChecked = true;
		
		        for (var i = 0; i < 2; i++) {
		            if (!requiredAgreements[i].checked) {
		                isAllChecked = false;
		                alert("필수 동의사항을 체크해주세요.");
		                break;
		            }
		        }
		
		        if (!isAllChecked) {
		            return false; // 필수 동의 사항이 체크되지 않았으므로 함수 종료
		        }
	        
		        var data = {
		            email: emailValue,
		            pw: pwValue,
		            name: nameValue,
		            birth_year: birthYearValue,
		            tel: telValue,
		            gender: genderValue,
		            join_type: joinValue
		        };
		        $.ajax({
		            url: "/whou/member/check",
		            contentType: "application/x-www-form-urlencoded; charset=UTF-8",
		            method: "POST",
		            data: data,
		            error: function() {
		                alert("오류");
		                //window.location.href = "/whou/main";
		            },
		            success: function(result) {
		                if (result == 0) {
		                    alert("가입이 완료되었습니다.");
		                } else if (result == 1) {
		                    alert("이미 가입하셨습니다");
		                }
		                window.location.href = "/whou/main";
		            }
		        });
		    });
		});
		</script>
    </body>
    
</html>
