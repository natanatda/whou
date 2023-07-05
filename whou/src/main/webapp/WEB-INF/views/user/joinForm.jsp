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
   
  <div class="join-container">
        <div class="join-wrap">
          <div class="logo"><a class="navbar-brand"><img src="/img/logo.svg"></a></div>
          <div class="input-group">
            <div class="input-item">
              <label for="joinInput" class="form-label">아이디</label>
              <input type="text" class="form-control" id="joinInput" placeholder="name@example.com">
            </div>
            <div class="input-item">
              <label for="joinInput" class="form-label">비밀번호</label>
              <input type="password" class="form-control" id="joinInput" placeholder="name@example.com">
            </div>
            <div class="input-item">
              <label for="joinInput" class="form-label">이름</label>
              <input type="text" class="form-control" id="joinInput" placeholder="name@example.com">
            </div>
            <div class="input-item">
              <label for="joinInput" class="form-label">생년월일</label>
              <input type="text" class="form-control" id="joinInput" placeholder="name@example.com">
            </div>
            <div class="input-item">
              <label for="joinInput" class="form-label">휴대폰</label>
              <input type="text" class="form-control" id="joinInput" placeholder="name@example.com">
            </div>
            <div class="input-item">
              <label for="joinInput" class="form-label">이메일</label>
              <input type="email" class="form-control" id="joinInput" placeholder="name@example.com">
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
                                <input type="checkbox" id="agree_take1" checked="checked">
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
                                <input type="checkbox" id="locationBased" name="locationBased" value="y" checked="checked">
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
                                <input type="checkbox" class="check_mail" id="termsAgree" name="termsAgree" value="y" checked="checked">
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
                                <input type="checkbox" id="sms_receive_fl" name="sms_receive_fl" value="y" checked="checked">
                                <label class="Lbl  check_off" for="sms_receive_fl">
                                   (선택) 마케팅 정보 수신 동의 - SMS/MMS
                                </label>                            
                            </div>
                        </div>
                    </li>
                </ul>
            </div>
            </div>
          </div>
          
         
          <div class="input-wrap">
            <button type="button" class="purple-btn btn-xs">회원가입</button>
          </div>
       
        </div>
      </div>
        <!-- Bootstrap core JS-->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
    </body>
    
</html>
