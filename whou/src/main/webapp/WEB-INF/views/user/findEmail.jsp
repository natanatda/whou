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
          <p><a href="/whou/member/findEmail">이메일 찾기</a> / <a href="/whou/member/findPw">비밀번호 찾기</a></p>
         
          <div class="input-wrap">
            <div class="input-form-box"><input type="text" name="name" id="name" class="form-control" placeholder="이름"></div>
            <div class="input-box">
            	<input type="text" name="tel" id="tel" class="form-control" placeholder="휴대폰 ( ' - ' 빼고 숫자만 입력 )">
            	<button type="button" class="purple-btn" name="phoneChk" id="phoneChk">인증 요청</button>
            </div>
            <div class="input-box">
	            <input type="text" style="display:none;" class="form-control" id="tel2" name = "tel2" placeholder="인증번호">
	            <button type="button"  style="display:none;" class="purple-btn" name="phoneChk2" id="phoneChk2">인증 확인</button>
            </div>
            <button type="button" class="btn login-btn btn-xs" id="btn1">이메일 찾기</button>
			<span class="find_1" style="color:red; text-align:left; display:none">일치하는 회원정보가 없습니다.</br> 입력하신 이름과 휴대폰 번호가 정확한지 확인해주세요.</span>
	        <span class="find_2" style="color:blue; text-align:left; display:none">간편가입으로 가입하셨습니다.</span>          
          </div>
        </div>
      </div>
        <!-- Bootstrap core JS-->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
    	<script>
    	var code2 = null;
   		var telchk = null;
    	//휴대폰 번호 인증
   		$(function(){
	   		$("#phoneChk").click(function(){
	   		    //alert('인증번호 발송이 완료되었습니다.\n휴대폰에서 인증번호 확인을 해주십시오.');
	   		    var tel = $("#tel").val();
	   			$("#tel2").css("display", "inline-block");
                $("#phoneChk2").css("display", "inline-block");
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
		    if($("#tel2").val() == code2){ // 위에서 저장한값을 비교
		         alert("인증에 성공하셨습니다.")
		         telchk = "성공";
		    }else{
		        alert("인증에 실패하셨습니다.\n인증번호를 다시 입력해주세요.")
		    }
		});
   		
    	//이메일 찾기
   		$(function() {
		    $("#btn1").click(function() {
		    	var name = $("#name").val();
		    	var tel = $("#tel").val();
		        
		        if (name === '' || tel == '') {
		            alert("모든 항목을 입력해주세요.");
		            return false;
		        }
		        
		        if (telchk == null){
		        	alert("번호 인증을 완료해주세요.")
		        	return false;
		        }

		        $.ajax({
		            url: "/whou/member/findEmailPro",
		            contentType: "application/x-www-form-urlencoded; charset=UTF-8",
		            method: "POST",
		            data:{name:name, tel:tel},
		            error: function(xhr, status, error) {
		                var errorMessage = "오류: " + xhr.status + " " + xhr.statusText;
		                alert(errorMessage);
		            },
		            success: function(result) {
		            	if(result == 0) {
		            		$('.find_1').css("display", "inline-block");
	   		                $('.find_2').css("display", "none");
		                }else if(result == 1){
		                	$('.find_1').css("display", "none");
	   		                $('.find_2').css("display", "inline-block");
		                }else{
		                	window.location.href = "/whou/member/findEmailPro2?result=" + result;
		                } 
		            }
		        });
		    });
		});
    	</script> 
    </body>
    
</html>