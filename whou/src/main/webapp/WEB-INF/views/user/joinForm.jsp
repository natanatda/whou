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
	              <input type="hidden" class="form-control" id = "join_type" value ="${join_type}">
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
		              <span class="tel_ok" style="color:green; display:none;">인증번호 발송이 완료되었습니다.</br> 휴대폰에서 인증번호를 확인해주십시오.</span>
	              <div class="input-box">
		              <input type="text" style="display:none;" class="form-control" id="tel2" name = "tel2" placeholder="인증번호 입력">
		              <button type="button" style="display:none;" class="purple-btn" name="phoneChk2" id="phoneChk2">인증 확인</button>
				  </div>
				  	  <span class="tel2_ok" style="color:green; display:none;">인증에 성공하셨습니다.</span>
		              <span class="tel2_error" style="color:red; display:none;">인증에 실패하셨습니다</br>인증번호를 다시 확인해주십시오.</span>
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
		                    <div class="accordion" id="accordionExample">
							  <div class="accordion-item">
							    <h2 class="accordion-header" id="headingOne">
							      <button class="accordion-button" type="button" data-bs-toggle="collapse" data-bs-target="#collapseOne" aria-expanded="true" aria-controls="collapseOne">
								     <div class="InpBox">
		                                <span class="Chk">
		                                  <input type="checkbox" id="agree_rule1" />
		                                  <label class="Lbl check-fil check_off" for="agree_rule1">
		                                    (필수) 개인회원 약관에 동의
		                                  </label>
		                                </span>
		                            </div>
							      </button>
							    </h2>
							    <div id="collapseOne" class="accordion-collapse collapse show" aria-labelledby="headingOne" data-bs-parent="#accordionExample">
							      <div class="accordion-body terms-box">
							        <div>
                                	제1조 (목적)
									본 약관은 ㈜whoU(이하 "회사"라 합니다)이 운영하는 웹사이트(이하 “사이트”라 합니다) 및 모바일 애플리케이션(이하 “애플리케이션”이라 하며, 사이트와 애플리케이션을 총칭하여 “사이트 등”이라 합니다)을 통해 서비스를 제공함에 있어 회사와 이용자의 이용조건 및 제반 절차, 기타 필요한 사항의 규정을 목적으로 합니다.
									
									제2조 (용어의 정의)
									본 약관에서 사용하는 용어의 정의는 아래와 같습니다.
									
									① “사이트”라 함은 회사가 서비스를 이용자에게 제공하기 위하여 제작, 운영하는 사이트를 말합니다. 현재 회사가 운영하는 사이트의 접속 주소는 아래와 같습니다.
									- www.whoU.co.kr
									- m.whoU.co.kr
									② "애플리케이션"이라 함은 회사와 계열사가 이용자에게 서비스를 제공하기 위하여IOS, 안드로이드 등 운영체제와 관계없이 스마트폰 또는 기타 휴대용 단말기에서 이용할 수 있도록 제작, 운영하는 프로그램을 말합니다. 현재 회사가 운영하는 애플리케이션의 이름은 아래와 같습니다.
									③ "서비스"라 함은 채용정보, 이력서 및 기업정보 제공 기타의 서비스를 통하여 구직•채용시장에서 구직자와 기업의 연결을 돕는 플랫폼 서비스입니다. 구체적으로는 회사가 기업 또는 구직자가 구인, 구직과 교육을 목적으로 등록하는 각종 자료를 DB화하여 각각의 목적에 맞게 분류 가공, 집계하여 정보를 제공하는 서비스 및 기타 구인 및 구직이 원활히 이루어지도록 하기 위하여 사이트 등에서 제공하는 모든 서비스를 말합니다. 회사가 제공하는 서비스는 유형에 따라 무료 또는 유료로 제공됩니다. 서비스의 자세한 내용은 제8조에서 정하는 바에 따릅니다.
									④ "이용자"라 함은 사이트 등에 접속하여 본 약관에 따라 회사가 제공하는 서비스를 이용하는 회원(기업회원 및 개인회원을 포함) 및 비회원을 말합니다.
									⑤ "개인회원"이라 함은 본 서비스를 이용하기 위하여 본 약관에 동의하고 회사와 서비스 이용계약을 체결하여 개인회원ID를 부여받은 이용자를 말합니다.
									⑥ “비회원”이라 함은 회사와 서비스 이용계약을 체결하지 않은 채 사이트 등을 통하여 회사가 제공하는 서비스를 이용하는 이용자를 말합니다.
									⑦ "서비스 이용계약"이라 함은 회사가 개인회원을 위해 제공하는 서비스를 계속적으로 이용하기 위하여 회사와 이용자 사이에 체결되는 계약을 말합니다.
									⑧ "이용자ID" 또는 "개인회원ID"라 함은 개인회원의 식별 및 서비스 이용을 위하여 개인회원이 선정하거나 회사가 부여하는 문자와 숫자의 조합을 말합니다.
									⑨ "비밀번호"라 함은 회사의 서비스를 이용하려는 사람이 개인회원ID를 부여 받은 자와 동일인임을 확인하고 개인회원의 권익을 보호하기 위하여 개인회원이 선정하거나 회사가 부여하는 문자와 숫자의 조합을 말합니다.
									⑩ “계정”이라 함은 개인회원의 개인정보, 이력서 등을 등록, 관리할 수 있도록 회사가 개인회원에게 제공하는 공간을 말합니다.
									제3조 (약관의 명시와 개정)
									① 회사는 본 약관의 내용과 상호, 영업소 소재지, 사업자등록번호, 연락처 등을 이용자가 알 수 있도록 초기 화면에 게시하거나 기타의 방법으로 이용자에게 공지합니다. 약관의 내용은 이용자가 사이트 등의 링크를 통한 연결화면을 통하여 볼 수 있도록 할 수 있습니다.
									② 회사는 약관의 규제 등에 관한 법률, 전기통신기본법, 전기통신사업법, 정보통신망 이용 촉진 및 정보보호 등에 관한 법률 등 관련법을 위배하지 않는 범위에서 본 약관을 개정할 수 있습니다.
									③ 회사가 약관을 개정할 경우에는 개정 약관 적용일 최소 7일전(약관의 변경이 개인회원에게 불리하거나 기업회원의 권리•의무의 중요한 변경의 경우에는 30일전)부터 웹사이트 초기화면 공지사항 또는 이메일을 통해 사전 공지합니다.
									④ 개인회원은 변경된 약관에 대해 거부할 권리가 있으며, 개인회원은 변경된 약관이 공지된 지 15일 이내에 변경 약관에 대한 거부 의사를 표시할 수 있습니다. 만약, 개인회원이 거부 의사를 표시하지 않고 서비스를 계속 이용하는 경우, 회사는 개인회원이 변경 약관 적용에 동의하는 것으로 봅니다.
									⑤ 개인회원이 제4항에 따라 변경 약관 적용을 거부할 의사를 표시한 경우, 회사는 개인회원에게 15일의 기간을 정하여 사전 통지 후 해당 개인회원과의 서비스 이용계약 또는/및 별도로 체결된 계약을 해지할 수 있습니다.
									제4조 (약관 외 준칙)
									① 약관에서 규정하지 않은 사항에 관해서는 약관의 규제 등에 관한 법률, 정보통신망 이용 촉진 및 정보보호 등에 관한 법률, 개인정보 보호법, 전기통신기본법, 전기통신사업법 등의 관계법령에 따라 규율됩니다.
									② 개인회원이 유료 서비스를 구입함에 있어 유료 서비스 이용조건에 관하여 별도로 약정하는 경우, 본 약관에 우선하여 해당 약정이 적용됩니다. 그 밖에 회사가 운영하는 개별 서비스 이용약관이 별도로 있는 경우 해당 서비스 이용약관이 본 약관에 우선하여 적용됩니다.
									③ 회원이 회사와 개별 계약을 체결하여 서비스를 이용하는 경우, 개인회원의 서비스 이용과 관련된 권리 의무는 순차적으로 개별 계약, 개별 서비스 이용약관, 본 약관에서 정한 내용에 따라 규율됩니다.
									제5조 (개인회원에 대한 고지, 통지 및 공지)
									회사는 개인회원에게 서비스 정책, 이용약관, 판매약관, 개인정보 처리방침 등 일체의 약관, 서비스 이용 관련 일정한 사항이나 정보를 알리거나 안내할 목적으로 개인회원에게 각종 고지나 통지를 이행할 수 있으며, 사이트 등의 게시판이나 화면에 일정한 사항을 게시하여 공지함으로써 각 개인회원에 대한 각종 고지나 통지를 갈음할 수 있습니다. 이와 관련하여 고지∙통지 수단, 공지 방법, 공지 기간 등의 상세한 내용은 개인정보 처리방침을 확인 바랍니다.
                                </div>
							      </div>
							    </div>
							  </div>
							  <div class="accordion-item">
							    <h2 class="accordion-header" id="headingTwo">
							      <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseTwo" aria-expanded="false" aria-controls="collapseTwo">
							        <div class="InpBox">
		                                <span class="Chk">
			                                <input type="checkbox" id="agree_take1">
			                                <label class="Lbl check-fil check_off" for="agree_take1">
			                                  (필수) 개인정보 수집 및 이용에 동의
			                                </label>
			                            </span>
		                            </div>
							      </button>
							    </h2>
							    <div id="collapseTwo" class="accordion-collapse collapse" aria-labelledby="headingTwo" data-bs-parent="#accordionExample">
							      <div class="accordion-body terms-box">
								     <div>
	                                	1. 수집하는 개인정보 항목 및 이용 목적
										가. <개인회원>
										1) 수집항목
										(필수) 이메일, 비밀번호, 이름, 휴대폰번호, 생년, 성별
	                                	2) 수집 및 이용목적
	                                	본인 확인 및 가입의사 확인, 신규 서비스 안내, 설문, 상담 및 문의처리, 회원 맞춤형 채용정보 제공
	                                	2. 개인정보 보유 및 이용기간
										회사는 이용자의 개인정보를 고지 및 동의 받은 사항에 따라 수집∙이용 목적이 달성되기 전 또는 이용자의 탈퇴 요청이 있기 전까지 해당 정보를 보유합니다. 다만, 아래의 사유로 인하여 보관이 필요한 경우 외부와 차단된 별도 DB 또는 테이블에 분리 보관 됩니다.
										가. 온라인/모바일 서비스 제공을 위해 수집한 회원가입 정보 : 회원탈퇴 시까지
										나. 관련 법령에 의한 개인정보 보유
										1) 통신비밀보호법
										서비스 이용기록, 접속로그, 접속IP정보 : 3개월
										2) 전자상거래 등에서의 소비자보호에 관한 법률
										표시∙광고에 관한 기록 : 6개월
										계약 또는 청약철회 등에 관한 기록 : 5년
										대금결제 및 재화등의 공급에 관한 기록 : 5년
										소비자의 불만 또는 분쟁처리에 관한 기록 : 3년
										3) 부가가치세법
										세금계산서, 영수증 등 거래내역 관련 정보 : 5년
	                                 </div>
							      </div>
							    </div>
							  </div>
							  <div class="accordion-item">
							    <h2 class="accordion-header" id="headingThree">
							      <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseThree" aria-expanded="false" aria-controls="collapseThree">
							        <div class="InpBox">
		                                <span class="Chk">
			                                <input type="checkbox" id="locationBased" name="locationBased" value="y">
			                                <label class="Lbl check_off" for="locationBased">
			                                  (선택) 위치기반서비스 이용약관에 동의
			                                </label>
		                            	</span>
		                            </div>
							      </button>
							    </h2>
							    <div id="collapseThree" class="accordion-collapse collapse" aria-labelledby="headingThree" data-bs-parent="#accordionExample">
							      <div class="accordion-body terms-box">
							      	<div>
										제1조(목적)
										본 약관은 (주)whoU(이하 “회사”라고 합니다.)이 제공하는 위치기반서비스(이하 “서비스”라고 합니다.)와 관련하여, 회사와 회원(서비스 약관에 동의한 자, 이하 “회원”)의 권리·의무 및 책임사항을 규정함을 목적으로 합니다.
										
										제2조 (용어의 정의)
										본 약관에서 사용하는 용어의 정의는 다음 각호와 같으며, 정의되지 않은 용어에 대한 해석은 관계법령 및 서비스 안내에서 정하는 바에 따릅니다.
										
										① "회원"은 본 약관에 동의하여 서비스를 이용하는 자를 말합니다.
										② "위치정보"라 함은 이동성이 있는 물건 또는 개인이 특정한 시간에 존재하거나 존재하였던 장소에 관한 정보로서 전기통신기본법 제2조 제2호 및 제3호의 규정에 따른 전기통신설비 및 전기통신회선설비를 이용하여 수집된 것을 말합니다.
										③ "개인위치정보주체"라 함은 특정 개인의 위치정보(위치정보만으로는 특정 개인의 위치를 알 수 없는 경우에도 다른 정보와 용이하게 결합하여 특정 개인의 위치를 알 수 있는 것을 포함합니다)를 말합니다.
										④ "위치정보 수집사실 확인자료"라 함은 위치정보의 수집요청인, 수집일시 및 수집방법에 관한 자료(위치정보 제외)를 말합니다.
										⑤ "위치정보 이용·제공사실 확인자료"라 함은 위치정보를 제공받는 자, 취득경로, 이용·제공일시 및 이용·제공방법에 관한 자료(위치정보 제외)를 말합니다.
										⑥ "위치정보시스템"이라 함은 위치정보사업 및 위치기반서비스 사업을 위하여 정보통신망 이용촉진 및 정보보호 등에 관한 법률 제2조 제1항 제1호의 규정에 의한 정보통신망을 통하여 위치정보를 수집·저장·분석·이용 및 제공할 수 있도록 서로 유기적으로 연계된 컴퓨터의 하드웨어, 소프트웨어, 데이터베이스 및 인적자원의 결합체를 말합니다.
										제3조 (이용약관의 효력 및 변경)
										① 본 약관은 서비스를 신청한 고객 또는 개인위치정보주체가 본 약관에 동의하고 회사가 정한 소정의 절차에 따라 서비스의 이용자로 등록함으로써 효력이 발생합니다.
										② 회원이 온라인에서 본 약관의 "동의하기" 버튼을 클릭하였을 경우 본 약관의 내용을 모두 읽고 이를 충분히 이해하였으며, 그 적용에 동의한 것으로 봅니다.
										③ 회사는 위치정보의 보호 및 이용 등에 관한 법률(이하, 위치정보법), 콘텐츠산업 진흥법, 전자상거래 등에서의 소비자보호에 관한 법률, 소비자기본법 약관의 규제에 관한 법률 등 관련법령을 위배하지 않는 범위에서 본 약관을 개정할 수 있습니다.
										④ 회사가 약관을 개정할 경우에는 적용일자 및 개정사유를 명시하여 현행약관과 함께 그 개정약관의 적용일자 7일 전부터 적용일까지 상당한 기간 동안 공지 하고, 개정 내용이 회원의 권리와 의무에 중대한 영향을 주는 경우에는 적용일자 30일 전부터 적용일까지 상당한 기간 동안 공지하도록 합니다.
										⑤ 회원이 개정약관 시행일까지 거부의사를 표시하지 않거나 시행일 이후 서비스를 이용하는 경우 이용약관을 승인한 것으로 봅니다. 회원이 개정약관에 동의하지 않을 경우 회원은 이용계약을 해지할 수 있습니다.
										제4조 (약관 외 준칙)
										본 약관은 신의성실의 원칙에 따라 공정하게 적용하며, 본 약관에 명시되지 아니한 사항에 대하여는 위치정보법 등의 관계법령과 회사의 이용약관, 개인정보처리방침 및 회사가 별도로 정한 지침 등을 따릅니다
										
										제5조 (서비스의 내용)
										회사가 제공하는 서비스는 아래와 같습니다.
										
										1. 서비스 명
										취업플랫폼 서비스
										2. 서비스 내용
										현재위치 근방 채용정보 표시
										제6조 (서비스 이용요금)
										① 회사가 제공하는 서비스는 기본적으로 무료입니다. 단, 별도의 유료 서비스의 경우 해당서비스에 명시된 요금을 지불하여야 사용 가능합니다.
										② 회사는 유료 서비스 이용요금을 회사와 계약한 전자지불업체에서 정한 방법에 의하거나 회사가 정한 청구서에 합산하여 청구할 수 있습니다.
										③ 유료서비스 이용을 통하여 결제된 대금에 대한 취소 및 환불은 회사의 결제 이용약관 등 관계법에 따릅니다.
										④ 회원의 개인정보도용 및 결제사기로 인한 환불요청 또는 결제자의 개인정보 요구는 법률이 정한 경우 외에는 거절될 수 있습니다.
										⑤ 무선 서비스 이용 시 발생하는 데이터 통신료는 별도이며 가입한 각 이동통신사의 정책에 따릅니다.
										⑥ MMS(Multimedia Messaging Service) 등으로 게시물을 등록할 경우 발생하는 요금은 이동통신사의 정책에 따릅니다.
										제7조 (서비스내용변경 통지 등)
										① 회사가 서비스 내용을 변경하거나 종료하는 경우 회사는 회원의 등록된 전자우편 주소로 이메일을 통하여 서비스 내용의 변경 사항 또는 종료를 통지할 수 있습니다.
										② ①항의 경우 불특정 다수인을 상대로 통지를 함에 있어서는 웹사이트 등 기타 회사의 공지사항을 통하여 회원들에게 통지할 수 있습니다.
										제8조 (서비스이용의 제한 및 중지)
										① 회사는 아래 각 호의 1에 해당하는 사유가 발생한 경우에는 회원의 서비스 이용을 제한하거나 중지시킬 수 있습니다.
										1. 회원이 회사 서비스의 운영을 고의 또는 중과실로 방해하는 경우
										2. 서비스용 설비 점검, 보수 또는 공사로 인하여 부득이한 경우
										3. 전기통신사업법에 규정된 기간통신사업자가 전기통신 서비스를 중지했을 경우
										4. 국가비상사태, 서비스 설비의 장애 또는 서비스 이용의 폭주 등으로 서비스 이용에 지장이 있는 때
										5. 기타 중대한 사유로 인하여 회사가 서비스 제공을 지속하는 것이 부적당하다고 인정하는 경우
										② 회사는 전항의 규정에 의하여 서비스의 이용을 제한하거나 중지한 때에는 그 사유 및 제한기간 등을 회원에게 알려야 합니다.
										제9조 (개인위치정보의 이용 제공 및 확인자료의 보유근거와 보유기간)
										① 회사는 개인위치정보를 이용하여 서비스를 제공하고자 하는 경우에는 미리 이용약관에 명시한 후 개인위치정보주체의 동의를 얻어야 합니다.
										② 회원 및 법정대리인의 권리와 그 행사방법은 제소 당시의 이용자의 주소에 의하며, 주소가 없는 경우에는 거소를 관할하는 지방법원의 전속관할로 합니다. 다만, 제소 당시 이용자의 주소 또는 거소가 분명하지 않거나 외국 거주자의 경우에는 민사소송법상의 관할법원에 제기합니다.
										③ 회사는 타사업자 또는 이용 고객과의 요금정산 및 민원처리를 위해 「위치정보의 보호 및 이용 등에 관한 법률」 제16조 제2항에 따라 위치정보 이용·제공 사실 확인자료를 자동 기록·보존하며, 해당 자료는 6개월간 보관합니다.
										④ 회사는 개인위치정보를 회원이 지정하는 제3자에게 제공하는 경우에는 개인위치정보를 수집한 당해 통신 단말장치로 매회 회원에게 제공받는 자, 제공일시 및 제공목적을 즉시 통보합니다. 단, 아래 각 호의 1에 해당하는 경우에는 회원이 미리 특정하여 지정한 통신 단말장치 또는 전자우편주소로 통보할 수 있습니다.
										1. 개인위치정보를 수집한 당해 통신단말장치가 문자, 음성 또는 영상의 수신기능을 갖추지 아니한 경우
										2. 회원이 개인위치정보를 수집한 당해 통신단말장치 외의 통신단말장치 또는 전자우편주소 등으로 통보할 것을 미리 요청한 경우
										제10조 (개인위치정보의 보유 목적 및 보유기간)
										① 회사는 위치기반서비스에서 개인위치정보를 일회성 또는 임시로 이용하며, 저장하거나 보유하지 않습니다.
										② 위 ①항에도 불구하고 다른 법령 또는 위치정보법에 따라 보유하여야 하는 정당한 사유가 있는 경우에는 그법령 또는 위치정보법에 따라 관리합니다.
										제11조 (개인위치정보주체의 권리)
										① 회원은 회사에 대하여 언제든지 개인위치정보를 이용한 위치기반서비스 제공 및 개인위치정보의 제3자 제공에 대한 동의의 전부 또는 일부를 철회할 수 있습니다. 이 경우 회사는 수집한 개인위치정보 및 위치정보 이용, 제공사실 확인자료를 파기합니다.
										② 회원은 회사에 대하여 언제든지 개인위치정보의 수집, 이용 또는 제공의 일시적인 중지를요구할 수 있으며, 회사는 요구를 거절하지 아니하며, 이를 위한 기술적 수단을 갖추고 있어야합니다.
										③ 회원은 회사에 대하여 아래 각 호의 자료에 대한 열람 또는 고지를 요구할 수 있고, 당해 자료에 오류가 있는 경우에는 그 정정을 요구할 수 있습니다. 이 경우 회사는 정당한 사유 없이 회원의 요구를 거절할 수 없습니다.
										1. 본인에 대한 위치정보 수집, 이용, 제공사실 확인자료
										2. 본인의 개인위치정보가 위치정보법 또는 다른 법률 규정에 의하여 제3자에게 제공된 이유 및 내용
										④ 회원은 제1항 내지 제3항의 권리행사를 위해 회사에 소정의 절차를 통해 필요한 자료의 열람이나 고지등을 요구할 수 있습니다.
										제12조(아동의 위치정보 보호)
										① 회사는 채용 정보제공 등 제공하는 서비스 특성상 「근로기준법」에 따라 만 15세 미만의 아동의 개인 위치정보를 수집하지 않습니다.
										제13조 (위치정보관리책임자의 지정)
										① 회사는 위치정보를 적절히 관리보호하고 개인위치정보주체의 불만을 원활히 처리할 수 있도록 실질적인 책임을 질 수 있는 지위에 있는 자를 위치정보관리책임자로 지정해 운영합니다.
										② 위치정보관리책임자는 위치기반서비스를 제공하는 부서의 부서장으로서 구체적인 사항은 본 약관의 부칙에 따릅니다.
										제14조 (손해배상)
										① 회사가 위치정보법 제15조 내지 제26조의 규정을 위반한 행위로 회원에게 손해가 발생한 경우 회원은 회사에 대하여 손해배상 청구를 할 수 있습니다. 이 경우 회사는 고의, 과실이 없음을 입증하지 못하는 경우 책임을 면할 수 없습니다.
										제15조 (면책)
										① 회사는 다음 각 호의 경우로 서비스를 제공할 수 없는 경우 이로 인하여 회원에게 발생한 손해에 대해서는 책임을 부담하지 않습니다.
										1. 천재지변 또는 이에 준하는 불가항력으로 인하여 서비스를 제공할 수 없는 경우
										2. 서비스 제공을 위하여 회사와 서비스 제휴계약을 체결한 제3자의 고의적인 서비스 방해가 있는 경우
										3. 회원의 귀책사유로 서비스 이용에 장애가 있는 경우
										4. 제1호 내지 제3호를 제외한 기타 회사의 고의·과실이 없는 사유로 인한 경우
										② 회사는 서비스 및 서비스에 게재된 정보, 자료, 사실의 신뢰도, 정확성 등에 대해서는 보증을 하지 않으며 이로 인해 발생한 회원의 손해에 대하여는 책임을 부담하지 아니합니다.
										제16조 (규정의 준용)
										① 본 약관은 대한민국법령에 의하여 규정되고 이행됩니다.
										② 본 약관에 규정되지 않은 사항에 대해서는 관련법령 및 상관습에 의합니다.
										제17조 (분쟁의 조정 및 기타)
										① 회사는 위치정보와 관련된 분쟁에 대해 당사자간 협의가 이루어지지 아니하거나 협의를 할 수 없는 경우에는 위치정보법 28조의 규정에 의해 방송통신위원회에 재정을 신청할 수 있습니다.
										② 회사 또는 고객은 위치정보와 관련된 분쟁에 대해 당사자간 협의가 이루어지지 아니하거나 협의를 할 수 없는 경우에는 개인정보보호법 제43조의 규정에 의해 개인정보 분쟁조정위원회에 조정을 신청할 수 있습니다.
	                                </div>
							      </div>
							    </div>
							  </div>
							  <div class="accordion-item">
							    <h2 class="accordion-header" id="headingFour">
							      <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseFour" aria-expanded="false" aria-controls="collapseFour">
							        <div class="InpBox">
		                                <span class="Chk">
			                                <input type="checkbox" class="check_mail" id="termsAgree" name="termsAgree" value="y">
			                                <label class="Lbl  check_off" for="termsAgree">
			                                   (선택) 마케팅 정보 수신 동의</br>  - 이메일
			                                </label>
			                            </span>
		                            </div>
							      </button>
							    </h2>
							    <div id="collapseFour" class="accordion-collapse collapse" aria-labelledby="headingFour" data-bs-parent="#accordionExample">
							      <div class="accordion-body terms-box">
								      <div>
	                                	1. 수집하는 개인정보 항목 및 이용 목적
										가. <개인회원>
										
										수집방법	수집항목	수집 및 이용목적
										회원가입	(선택)
										마케팅 정보 수신 동의(이메일)	회사가 제공하는 상품 및 서비스의 안내, 설문, 이벤트 관련 정보 및 참여 기회 제공, (제휴)광고 및 마케팅 정보 제공
										
										귀하께서는 회사가 위와 같이 수집하는 개인정보에 대해 동의하지 않거나 개인정보를 기재하지 않음으로써 거부할 수 있습니다. 다만, 동의하지 아니한 경우에도 서비스는 이용하실 수 있습니다.
										
										
										2. 개인정보 보유 및 이용기간
										회사는 이용자의 개인정보를 고지 및 동의 받은 사항에 따라 수집∙이용 목적이 달성되기 전 또는 이용자의 탈퇴 요청이 있기 전까지 해당 정보를 보유합니다. 다만, 아래의 사유로 인하여 보관이 필요한 경우 외부와 차단된 별도 DB 또는 테이블에 분리 보관 됩니다.
										
										가. 온라인/모바일 서비스 제공을 위해 수집한 회원가입 정보 : 회원탈퇴 시까지
										나. 관련 법령에 의한 개인정보 보유
										1) 통신비밀보호법
										서비스 이용기록, 접속로그, 접속IP정보 : 3개월
										2) 전자상거래 등에서의 소비자보호에 관한 법률
										표시∙광고에 관한 기록 : 6개월
										계약 또는 청약철회 등에 관한 기록 : 5년
										대금결제 및 재화등의 공급에 관한 기록 : 5년
										소비자의 불만 또는 분쟁처리에 관한 기록 : 3년
										3) 부가가치세법
										세금계산서, 영수증 등 거래내역 관련 정보 : 5년
	                                </div>
							      </div>
							    </div>
							  </div>
							  <div class="accordion-item">
							    <h2 class="accordion-header" id="headingFive">
							      <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseFive" aria-expanded="false" aria-controls="collapseFive">
							        <div class="InpBox">
		                                <input type="checkbox" id="sms_receive_fl" name="sms_receive_fl" value="y">
		                                <label class="Lbl  check_off" for="sms_receive_fl">
		                                   (선택) 마케팅 정보 수신 동의</br> - SMS/MMS
		                                </label>                            
		                            </div>
							      </button>
							    </h2>
							    <div id="collapseFive" class="accordion-collapse collapse" aria-labelledby="headingFive" data-bs-parent="#accordionExample">
							      <div class="accordion-body terms-box">
								      <div style="overflow-y: scroll; height: 130px; font-size: 14px;" >
	                                	1. 수집하는 개인정보 항목 및 이용 목적
										가. <개인회원>
										
										수집방법	수집항목	수집 및 이용목적
										회원가입	(선택)
										마케팅 정보 수신 동의(SMS/MMS, push)	회사가 제공하는 상품 및 서비스의 안내, 설문, 이벤트 관련 정보 및 참여 기회 제공, (제휴)광고 및 마케팅 정보 제공
										
										귀하께서는 회사가 위와 같이 수집하는 개인정보에 대해 동의하지 않거나 개인정보를 기재하지 않음으로써 거부할 수 있습니다. 다만, 동의하지 아니한 경우에도 서비스는 이용하실 수 있습니다.
										
										
										2. 개인정보 보유 및 이용기간
										회사는 이용자의 개인정보를 고지 및 동의 받은 사항에 따라 수집∙이용 목적이 달성되기 전 또는 이용자의 탈퇴 요청이 있기 전까지 해당 정보를 보유합니다. 다만, 아래의 사유로 인하여 보관이 필요한 경우 외부와 차단된 별도 DB 또는 테이블에 분리 보관 됩니다.
										
										가. 온라인/모바일 서비스 제공을 위해 수집한 회원가입 정보 : 회원탈퇴 시까지
										나. 관련 법령에 의한 개인정보 보유
										1) 통신비밀보호법
										서비스 이용기록, 접속로그, 접속IP정보 : 3개월
										2) 전자상거래 등에서의 소비자보호에 관한 법률
										표시∙광고에 관한 기록 : 6개월
										계약 또는 청약철회 등에 관한 기록 : 5년
										대금결제 및 재화등의 공급에 관한 기록 : 5년
										소비자의 불만 또는 분쟁처리에 관한 기록 : 3년
										3) 부가가치세법
										세금계산서, 영수증 등 거래내역 관련 정보 : 5년
	                                </div>
							      </div>
							    </div>
							  </div>
							</div>
	                </ul>
	            </div>
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
   		
   		/*//이메일 중복 체크
   		$(function(){
	   		$("#emailChk").click(function(){
	   		    //alert('이메일 체크');
	   		 	var email = $("#email").val();
		   		if (email == "") {
		             alert("이메일을 입력하세요");
		             return; 
		   		}
	   		    $.ajax({
	   		        type:"POST",
	   		        url:"/whou/member/emailChk",
	   		        data: {email:email},
	   		        success:function(result){
	   		            if(result == 0){
	   		                alert("사용가능한 이메일입니다.")
	   		            }else{    
	   		                alert("이미 가입된 이메일입니다.")
	   		            }
	   		        }
	   		    });
	   		});
   		}); */
   		
   		/* //휴대폰 번호 유효성 검사
   		function checkTel() {
   			var tel = $("#tel").val();
   			if(tel.length === 10){
   				$("#tel_ok").css("display", "inline-block");
   				$("#tel_error").css("display", "none");
   				
   			}else{
   				$("#tel_ok").css("display", "none");
   				$("#tel_error").css("display", "inline-block");
   			}
   		} */
   		
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
		   		                //alert("휴대폰 번호가 올바르지 않습니다.")
		   		            }else{            //성공시        
		   		                //alert("인증번호 발송이 완료되었습니다.\n휴대폰에서 인증번호 확인을 해주십시오.")
		   		                code2 = numStr; // 성공하면 데이터저장
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
   		 	var checkAll = false;
   		 	document.getElementById("agreeAllPersonal").addEventListener("click", function() {
      		  var checkboxes = document.querySelectorAll(".agree_article input[type='checkbox']");
      		  checkAll = this.checked;
      		  
      		  for (var i = 0; i < checkboxes.length; i++) {
      		    checkboxes[i].checked = checkAll;
      		  }
      		//
      		});

   		    function updateButtonStatus() {
   		    	//alert(checkAll);
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

   		        // 필수 동의사항 체크
   		        var requiredAgreements = document.querySelectorAll('#agree_rule1, #agree_take1');
		        var isAllChecked = true;
		        
		        
		        for (var i = 0; i < requiredAgreements.length; i++) {
		            if (!requiredAgreements[i].checked) {
		                isAllChecked = false;
		                break;
		            }
		        }
   		        //alert(isAllChecked);
   		        
   		        // 모든 조건이 만족할 때 버튼 활성화
   		        if(join_type != null){
   		        	if (email !== '' && name !== '' && birth_year !== '' && tel !== '' &&
   		   		        yearValid && telValid && isAllChecked) {
   		   		            $("#btn1").prop("disabled", false);
   		   		        }else if (email !== '' && name !== '' && birth_year !== '' && tel !== '' &&
   		   		            	  yearValid && telValid && checkAll && isAllChecked) {
   		   		            $("#btn1").prop("disabled", false);
   		   		        }else {
   		   		            $("#btn1").prop("disabled", true);
   		   		        }
   		        }else{
   		        	if (email !== '' && pw !== '' && name !== '' && birth_year !== '' && tel !== '' &&
   		   		        pwValid && yearValid && telValid && isAllChecked) {
   		   		            $("#btn1").prop("disabled", false);
		   		        }else if (email !== '' && pw !== '' && name !== '' && birth_year !== '' && tel !== '' &&
		   		            pwValid && yearValid && telValid && checkAll && isAllChecked) {
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

   		    // 필수 동의사항 체크박스의 상태가 변경될 때마다 버튼 상태 업데이트
   		    $("#agreeAllPersonal, #agree_rule1, #agree_take1, #locationBased, #termsAgree, #sms_receive_fl").on("input", function() {
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
	   		  }
	   	   });
   		}); 

   		/* $(function() {
		    $("#btn1").click(function() {
		    	var email = $("#email").val().replace(/ /g, '');
		        var pw = $("#pw").val().replace(/ /g, '');
		        var name = $("#name").val().replace(/ /g, '');
		        var birth_year = $("#birth_year").val().replace(/ /g, '');
		        var tel = $("#tel").val().replace(/ /g, '');
		        var join_type = $("#join_type").val().replace(/ /g, '');
		        
		        if (email == '' || pw == '' || name == '' || birth_year == '' || tel == '') {
		            alert("모든 항목을 입력해주세요.");
		            return false; // Prevent form submission
		        }
		        if ($('.pw_x').css("display") == "inline-block" || $('.pw_error').css("display") == "inline-block") {
		            alert("비밀번호를 다시 확인해주세요.");
		            return false;
		        }
		        
		        if ($('.year_error').css("display") == "inline-block") {
		            alert("연도를 다시 확인해주세요.");
		            return false;
		        }
		        
		        if (telchk == null){
		        	alert("번호 인증을 완료해주세요.")
		        	return false;
		        }
		        
		        var requiredAgreements = document.querySelectorAll('#agree_rule1, #agree_take1');
		        var isAllChecked = true;
		
		        for (var i = 0; i < requiredAgreements.length; i++) {
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
		        		email: email,
		                pw: pw,
		                name: name,
		                birth_year: birth_year,
		                tel: tel,
		                join_type: join_type
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
		}); */
		</script>
    </body>
    
</html>
