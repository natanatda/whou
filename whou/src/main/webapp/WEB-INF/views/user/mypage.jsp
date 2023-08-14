<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>


<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<title>whou</title>
<!-- Favicon-->
<link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
<!-- Bootstrap icons-->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css"
	rel="stylesheet" />
<!-- Core theme CSS (includes Bootstrap)-->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-9ndCyUaIbzAi2FUVXJi0CjmCapSmO7SnpJef0486qhLnuZ2cdeRhO02iuK6FUUVM"
	crossorigin="anonymous">
<link rel="stylesheet" href="/whou/resources/css/style.css">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://kit.fontawesome.com/dbaea98925.js"
	crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>

<script
	src="https://cdnjs.cloudflare.com/ajax/libs/three.js/r128/three.min.js"
	integrity="sha512-dLxUelApnYxpLt6K2iomGngnHO83iUvZytA3YjDUCjT0HDOHKXnVYdf3hU4JjM8uEhxf9nD1/ey98U3t2vZ0qQ=="
	crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<script src="/whou/resources/js/unpkg.com_gsap@3.12.1_dist_gsap.min.js"></script>
<script src="/whou/resources/js/ThreeCSG.js"></script>
<script
	src="https://unpkg.com/three@0.128.0/examples/js/controls/OrbitControls.js"></script>
<script type="module" src="/whou/resources/js/whouModel.js"></script>


</head>
<style>
.jobMadeCard {
	position: absolute;
	left: 105%;
	top: -200%;
	width: 100%;
	background-color: white;
	border: 1px solid #cfcfcf;
	padding: 20px;
}

.JcardP1 {
	font-size: 18px;
	font-weight: 700;
	margin-bottom: 10px;
}

.JcardP2 {
	font-size: 16px;
	margin-bottom: 20px;
}
</style>
<style>
#btnM:disabled {
	background-color: #ddd; /* 비활성화 배경색 */
	color: #888; /* 비활성화 글자색 */
	cursor: not-allowed; /* 비활성화된 버튼에는 커서를 변경하여 마우스 클릭을 방지 */
}
</style>
<style>
#btnPw:disabled {
	background-color: #ddd; /* 비활성화 배경색 */
	color: #888; /* 비활성화 글자색 */
	cursor: not-allowed; /* 비활성화된 버튼에는 커서를 변경하여 마우스 클릭을 방지 */
}
</style>
<style>
#btnDelete:disabled {
	background-color: #ddd; /* 비활성화 배경색 */
	color: #888; /* 비활성화 글자색 */
	cursor: not-allowed; /* 비활성화된 버튼에는 커서를 변경하여 마우스 클릭을 방지 */
}
</style>


<body>
	<%@ include file="../header.jsp"%>
	<section class="py-2 mypage-section">
		<div class="container px-5">
			<h2 class="page-title">마이페이지</h2>
			<div class="desc-wrap">
				<div class="left-wrap">
					<div class="left-top-wrap">
						<div class="profile-cont">
							<div>${memId}님<br />환영합니다!
							</div>
						</div>
						<c:if
							test="${percent[0] != '0' || percent[1] != '0' || percent[2] != '0' || percent[3] != '0'}">
							<div class="test-cont">
								<div id="carouselExampleControls"
									class="carousel slide carousel-dark" data-bs-ride="carousel">
									<div class="carousel-inner">
										<c:if test="${percent[0] != '0'}">
											<div class="carousel-item">
												<div>
													<div>
														<i class="fa-solid fa-circle-info" style="color: #5A3FFF"></i>
														적성 검사 <span>${percent[0]}% 진행중</span>
													</div>
													<div class="progress">
														<div class="progress-bar" role="progressbar"
															aria-label="Basic example" style="width: ${percent[0]}%"
															aria-valuenow="25" aria-valuemin="0" aria-valuemax="100"></div>
													</div>
												</div>
												<button class="purple-btn"
													onclick="location='/whou/aptitude/itrstkAptitude?qnum=21&tempSave=tempSave'">적성검사
													이어하기</button>
											</div>
										</c:if>
										<c:if test="${percent[1] != '0'}">
											<div class="carousel-item">
												<div>
													<div>
														<i class="fa-solid fa-circle-info" style="color: #5A3FFF"></i>
														가치관 검사 <span>${percent[1]}% 진행중</span>
													</div>
													<div class="progress">
														<div class="progress-bar" role="progressbar"
															aria-label="Basic example" style="width: ${percent[1]}%"
															aria-valuenow="25" aria-valuemin="0" aria-valuemax="100"></div>
													</div>
												</div>
												<button class="purple-btn"
													onclick="location='/whou/aptitude/itrstkAptitude?qnum=25&tempSave=tempSave'">가치관검사
													이어하기</button>
											</div>
										</c:if>
										<c:if test="${percent[2] != '0'}">
											<div class="carousel-item">
												<div>
													<div>
														<i class="fa-solid fa-circle-info" style="color: #5A3FFF"></i>
														역량 검사 <span>${percent[2]}% 진행중</span>
													</div>
													<div class="progress">
														<div class="progress-bar" role="progressbar"
															aria-label="Basic example" style="width: ${percent[2]}%"
															aria-valuenow="25" aria-valuemin="0" aria-valuemax="100"></div>
													</div>
												</div>
												<button class="purple-btn"
													onclick="location='/whou/aptitude/itrstkAptitude?qnum=27&tempSave=tempSave'">역량검사
													이어하기</button>
											</div>
										</c:if>
										<c:if test="${percent[3] != '0'}">
											<div class="carousel-item">
												<div>
													<div>
														<i class="fa-solid fa-circle-info" style="color: #5A3FFF"></i>
														흥미 검사 <span>${percent[3]}% 진행중</span>
													</div>
													<div class="progress">
														<div class="progress-bar" role="progressbar"
															aria-label="Basic example" style="width: ${percent[3]}%"
															aria-valuenow="25" aria-valuemin="0" aria-valuemax="100"></div>
													</div>
												</div>
												<button class="purple-btn"
													onclick="location='/whou/aptitude/itrstkAptitude?qnum=31&tempSave=tempSave'">흥미검사
													이어하기</button>
											</div>
										</c:if>
									</div>
									<button class="carousel-control-prev" type="button"
										data-bs-target="#carouselExampleControls" data-bs-slide="prev">
										<span class="carousel-control-prev-icon" aria-hidden="true"></span>
										<span class="visually-hidden">Previous</span>
									</button>
									<button class="carousel-control-next" type="button"
										data-bs-target="#carouselExampleControls" data-bs-slide="next">
										<span class="carousel-control-next-icon" aria-hidden="true"></span>
										<span class="visually-hidden">Next</span>
									</button>
								</div>
							</div>
						</c:if>
						<div style="margin-bottom: 20px">
							<nav>
								<div class="nav nav-tabs nav-left" id="nav-tab" role="tablist">
									<button class="nav-link active" id="nav-home-tab"
										data-bs-toggle="tab" data-bs-target="#nav-home" type="button"
										role="tab" aria-controls="nav-home" aria-selected="true">검사결과보기</button>
									<button class="nav-link" id="nav-reco-tab" data-bs-toggle="tab"
										data-bs-target="#nav-reco" type="button" role="tab"
										aria-controls="nav-reco" aria-selected="false">추천 받기</button>
									<button class="nav-link" id="nav-contact-tab"
										data-bs-toggle="tab" data-bs-target="#nav-contact"
										type="button" role="tab" aria-controls="nav-contact"
										aria-selected="false">진로컨설팅</button>
								</div>
							</nav>
						</div>
						<div class="info-cont">
							<h6>직업 보기</h6>
							<ul>
								<li class="book-button">
									<div>
										<i class="fa-solid fa-book"></i> 북마크
									</div>
									<div>
										확인하기 <i class="fa-solid fa-chevron-right" style="color: #333"></i>
									</div>
								</li>
							</ul>
						</div>


						<div class="info-cont">
							<h6>정보 수정</h6>
							<ul>
								<li class="add-info-button">
									<div>추가 정보 입력</div>
									<div>
										입력하기 <i class="fa-solid fa-chevron-right" style="color: #333"></i>
									</div>
								</li>
								<li class="chg-info-button">
									<div>개인 정보 수정</div>
									<div>
										수정하기 <i class="fa-solid fa-chevron-right" style="color: #333"></i>
									</div>
								</li>
							</ul>
						</div>

					</div>

					<div class="custom-box">
						<div>
							<canvas class="webgl"></canvas>
							<%-- ai --%>
						</div>
						<div>
							<a href="/whou/whouModel/modelCustom">커스텀하기 >></a>
						</div>
					</div>
				</div>

				<div class="right-wrap">
					<div>
						<!-- 북마크 -->
						<div class="book-bg">
							<div class="book-wrap">
								<c:if test="${books != null }">
									<c:forEach var="job" items="${jobs}" varStatus="status">
										<div class="card mb-5 mb-xl-0">
											<a href="/whou/member/deleteBook?job_cd=${job.job_cd}"><i
												class="position-absolute top-0 start-100 translate-middle fa-solid fa-circle-minus fa-lg"></i></a>
											<div class="result-cont">
												<div
													onclick="location='/whou/job/info?job_cd=${job.job_cd}'">
													<h4>${job.job_nm }<i
															class="fa-solid fa-chevron-right fa-xs"
															style="color: #111111;"></i>
													</h4>
													<p>${job.works}</p>
												</div>
											</div>
										</div>
									</c:forEach>
								</c:if>
								<c:if test="${books == null }">
									<div class="empty-box">
										<div>북마크한 관심직업이 없습니다.</div>
										<div>직업정보 탐색 후, 나의 관심직업을 등록해 주세요.</div>
										<a href="/whou/job/dic">직업정보 >></a>
									</div>
								</c:if>
							</div>
						</div>

						<!-- 개인정보수정 -->
						<div class="chg-info-bg">
							<nav>
								<div class="nav nav-tabs" id="nav-tab" role="tablist">
									<button class="nav-link active" id="info-tab"
										data-bs-toggle="tab" data-bs-target="#nav-info" type="button"
										role="tab" aria-controls="nav-info" aria-selected="true">기본정보</button>
									<c:if test="${mem.join_type == 'whoU'}">
										<button class="nav-link" id="nav-pw-tab" data-bs-toggle="tab"
											data-bs-target="#nav-pw" type="button" role="tab"
											aria-controls="nav-pw" aria-selected="false">비밀번호 변경</button>
									</c:if>
									<button class="nav-link" id="nav-delete-tab"
										data-bs-toggle="tab" data-bs-target="#nav-delete"
										type="button" role="tab" aria-controls="nav-delete"
										aria-selected="false">회원탈퇴</button>
								</div>
							</nav>
							<div class="tab-content" id="nav-tabContent2">
								<div class="tab-pane fade show active" id="nav-info"
									role="tabpanel" aria-labelledby="nav-info-tab" tabindex="0">
									<div class="chg-info">
										<h3>
											기본 정보 <span>정보를 변경하려면 휴대폰 본인인증을 완료하셔야합니다.</span>
										</h3>
										<form name="joinForm" method="post">
											<div class="input-item">
												<label for="joinInput" class="form-label">이메일</label> <span
													class="form-control" id="email">${mem.email}</span>
											</div>
											<div class="input-item">
												<label for="joinInput" class="form-label">이름</label> <input
													type="text" class="form-control" name="name" id="name"
													placeholder="이름(실명) 입력" value="${mem.name}"> <input
													type="hidden" class="form-control" id="join_type"
													value="${mem.join_type}">
											</div>
											<div class="input-item">
												<label for="joinInput" class="form-label">연도</label> <input
													type="text" class="form-control" name="birth_year"
													id="birth_year" placeholder="YYYY"
													value="${mem.birth_year}" required oninput="checkYear()">
												<span class="year_error" style="color: red; display: none;">형식에
													맞게 4자리로 입력해주세요.</span>
											</div>
											<div class="input-item">
												<label for="joinInput" class="form-label">휴대폰</label>
												<div class="input-box">
													<input type="text" class="form-control" id="phone"
														name="phone" placeholder="'-' 빼고 숫자만 입력"
														value="${mem.tel}">
													<button type="button" style="border-radius: 8px"
														class="purple-btn" name="phoneChk" id="phoneChk">인증
														요청</button>
												</div>
												<span class="phone_error" style="color: red; display: none;">형식에
													맞게 휴대폰번호를 정확히 입력해주세요.</span> <span class="phone_ok"
													style="color: green; display: none;">인증번호 발송이
													완료되었습니다.</br> 휴대폰에서 인증번호를 확인해주십시오.
												</span>
												<div class="input-box">
													<input type="text" style="display: none;"
														class="form-control" id="phone2" name="phone2"
														placeholder="인증번호 입력">
													<button type="button"
														style="display: none; border-radius: 8px"
														class="purple-btn" name="phoneChk2" id="phoneChk2">인증
														확인</button>
												</div>
												<span class="phone2_ok" style="color: green; display: none;">인증에
													성공하셨습니다.</span> <span class="phone2_error"
													style="color: red; display: none;">인증에 실패하셨습니다</br>인증번호를
													다시 확인해주십시오.
												</span>
											</div>
											<div class="input-wrap">
												<button type="submit" style="border-radius: 8px"
													class="purple-btn btn-xs" id="btnM" disabled>수정</button>
											</div>
										</form>
										<div class="chg-addinfo">
											<div>
												<h3>학과 정보</h3>
												<c:if test="${arrM != null }">
													<c:forEach var="major" items="${arrM}" varStatus="status">

														<div class="input-wrap">
															<span class="form-control" id="major">${major}</span> <i
																onclick="location='/whou/member/deleteMajor?major=${major}'"
																class="fa-solid fa-circle-minus fa-lg"></i>
														</div>

													</c:forEach>
												</c:if>
												<c:if test="${arrM == null }">
													<div class="empty-box">
														<div>학과 정보가 없습니다.</div>
														<div>추가정보입력에서 학과를 등록해 주세요.</div>
														<a href="/whou/member/mypage?load=2">추가정보입력 >></a>
													</div>
												</c:if>
											</div>
											<div>
												<h3>자격증 정보</h3>
												<c:if test="${arrC != null }">
													<c:forEach var="certi" items="${arrC}" varStatus="status">

														<div class="input-wrap">
															<span class="form-control" id="major">${certi}</span> <i
																onclick="location='/whou/member/deleteCerti?certi=${certi}'"
																class="fa-solid fa-circle-minus fa-lg"></i>
														</div>

													</c:forEach>
												</c:if>
												<c:if test="${arrC == null }">
													<div class="empty-box">
														<div>자격증 정보가 없습니다.</div>
														<div>추가정보입력에서 자격증을 등록해 주세요.</div>
														<a href="/whou/member/mypage?load=2">추가정보입력 >></a>
													</div>
												</c:if>
											</div>
										</div>
									</div>
								</div>
								<div class="tab-pane fade" id="nav-pw" role="tabpanel"
									aria-labelledby="nav-pw-tab" tabindex="0">
									<div class="chg-info">
										<form method="post">
											<div class="input-item">
												<label for="joinInput" class="form-label">현재 비밀번호</label> <input
													type="password" class="form-control" name="pw" id="pw"
													placeholder="4자리 이상" required oninput="checkPw()">
												<span class="pw_xx" style="color: red; display: none;">비밀번호가
													일치하지 않습니다.</span>
											</div>
											<div class="input-item">
												<label for="joinInput" class="form-label">새 비밀번호</label> <input
													type="password" class="form-control" name="newPw"
													id="newPw" placeholder="4자리 이상" required
													oninput="checkNewPw()" disabled> <span
													class="pw_error" style="color: red; display: none;">형식에
													맞게 입력해주세요.</span>
											</div>
											<div class="input-item">
												<label for="joinInput" class="form-label">새 비밀번호 확인</label>
												<input type="password" class="form-control" name="newPw2"
													id="newPw2" placeholder="4자리 이상" required
													oninput="checkNewPw2()" disabled> <span
													class="pw_ok" style="color: green; display: none;">비밀번호가
													일치합니다.</span> <span class="pw_x"
													style="color: red; display: none;">비밀번호가 일치하지 않습니다.</span>
											</div>
											<div class="input-wrap">
												<button type="submit" style="border-radius: 8px"
													class="purple-btn btn-xs" id="btnPw" disabled>변경</button>
											</div>
										</form>
									</div>
								</div>
								<!-- 회원탈퇴 -->
								<div class="tab-pane fade" id="nav-delete" role="tabpanel"
									aria-labelledby="nav-delete-tab" tabindex="0">
									<div class="chg-info">
										<form action="/whou/member/deleteUser" method="post">
											<div class="input-item">
												<label for="joinInput" class="form-label">휴대폰 본인인증</label>
												<div class="input-box">
													<input type="text" class="form-control" id="tel" name="tel"
														placeholder="'-' 빼고 숫자만 입력" value="${mem.tel}">
													<button type="button" style="border-radius: 8px"
														class="purple-btn" name="telChk" id="telChk">인증
														요청</button>
												</div>
												<span class="tel_error" style="color: red; display: none;">형식에
													맞게 휴대폰번호를 정확히 입력해주세요.</span> <span class="tel_ok"
													style="color: green; display: none;">인증번호 발송이
													완료되었습니다.</br> 휴대폰에서 인증번호를 확인해주십시오.
												</span>
												<div class="input-box">
													<input type="text" style="display: none;"
														class="form-control" id="tel2" name="tel2"
														placeholder="인증번호 입력">
													<button type="button"
														style="display: none; border-radius: 8px"
														class="purple-btn" name="telChk2" id="telChk2">인증
														확인</button>
												</div>
												<span class="tel2_ok" style="color: green; display: none;">인증에
													성공하셨습니다.</span> <span class="tel2_error"
													style="color: red; display: none;">인증에 실패하셨습니다</br>인증번호를
													다시 확인해주십시오.
												</span>
											</div>
											<div class="input-wrap">
												<button type="submit" style="border-radius: 8px"
													class="purple-btn btn-xs" id="btnDelete"
													onclick="deleteUser()" disabled>회원 탈퇴</button>
											</div>
										</form>
									</div>
								</div>
							</div>
						</div>

						<!-- 추가정보 입력 -->
						<div id="nav-addInfo">
							<form action="/whou/member/updateInfo" method="post">
								<div>
									<div class="add-wrap">
										<div class="left-box">
											<h4>자격증</h4>
											<div id="qualificationContainer">

												<div class="input-wrap">
													<input type="text" name="certi" autocomplete="off"
														placeholder="자격증 명" oninput="checkCerti(this)" /> <i
														class="fa-solid fa-circle-minus fa-lg"></i>
													<ul class="qualificationList"></ul>
												</div>

											</div>
											<div class="add-certi-wrap">
												<div class="add-certi-btn" onclick="addQualification()">
													<i class="fa-solid fa-circle-plus fa-lg"></i>
													<p>자격증 추가</p>
												</div>
											</div>
										</div>
										<div class="right-box">
											<h4>학과정보</h4>
											<div id="majorContainer">
												<div class="input-wrap">
													<select class="depart-select" name="depart" id="depart">
														<option value="대학">대학</option>
														<option value="전문대학">전문대학</option>
													</select> <input type="text" name="major" autocomplete="off"
														placeholder="전공명" oninput="checkMajor(this)" />
													<ul class="majorList"></ul>
												</div>
												<div class="input-wrap gong2">
													<input type="text" name="major" autocomplete="off"
														placeholder="부전공명/복수전공명" oninput="checkMajor(this)" />
													<ul class="majorList"></ul>
												</div>
											</div>
										</div>
									</div>
									<div class="button-wrap">
										<button type="submit" class="purple-btn" onclick="load()">저장</button>
									</div>
								</div>
							</form>
						</div>
						<div class="tab-content" id="nav-tabContent">
							<div class="tab-pane fade show active" id="nav-home"
								role="tabpanel" aria-labelledby="nav-home-tab" tabindex="0">
								<select id="testResultSelect">
									<option value="21">적성</option>
									<option value="25">가치관</option>
									<option value="27">역량</option>
									<option value="31">흥미</option>
								</select>
								<div class="button-wrap">
									<button class="purple-btn" onclick="reco()">추천받기</button>
								</div>
								<div id="item-aptitude" class="chart-wrap">
									<c:if test="${!scoreTrue1}">
										<div class="empty-box">
											<div>검사결과가 없습니다.</div>
											<a href="/whou/aptitude/aptitudeMain">검사하러가기 >></a>
										</div>
										<div class="card" style="display: none;">
											<canvas id="aptitudeChart" style="display: none;"></canvas>
											<canvas id="aptiChart1" style="display: none;"></canvas>
											<canvas id="aptiChart2" style="display: none;"></canvas>
											<canvas id="aptiChart3" style="display: none;"></canvas>
											<canvas id="inteChart1" style="display: none;"></canvas>
											<canvas id="inteChart2" style="display: none;"></canvas>
											<canvas id="inteChart3" style="display: none;"></canvas>
											<canvas id="valueChart1" style="display: none;"></canvas>
											<canvas id="valueChart2" style="display: none;"></canvas>
											<canvas id="valueChart3" style="display: none;"></canvas>
											<canvas id="valueChart4" style="display: none;"></canvas>
										</div>
									</c:if>
									<c:if test="${scoreTrue1}">

										<div class="test-result-top">
											<div class="chart-inner card">
												<canvas id="aptitudeChart"></canvas>
											</div>
											<ul class="chart-ranks card">
												<li>적성 TOP 5</li>
												<c:forEach var="entry" items="${aptiRank.entrySet()}"
													varStatus="loop">
													<li>
														<div class="ic-rank">${loop.index+1 }</div>
														<div>${entry.key}</div> <span>상위 ${entry.value}%</span>
													</li>
												</c:forEach>
											</ul>
										</div>
										<div class="card">
											<div id="carouselExampleControls1"
												class="carousel slide carousel-dark" data-bs-ride="carousel">
												<div class="carousel-inner">
													<div class="carousel-item active">
														<div class="carousel-title">
															<div class="ic-rank">1</div>
															<div>${aptitudeRank.aptitude_name1}</div>
														</div>
														<div class="chart-inner card">
															<canvas id="aptiChart1" width="500px"></canvas>
														</div>
													</div>
													<div class="carousel-item">
														<div class="carousel-title">
															<div class="ic-rank">2</div>
															<div>${aptitudeRank.aptitude_name2}</div>
														</div>
														<div class="chart-inner card">
															<canvas id="aptiChart2"></canvas>
														</div>
													</div>
													<div class="carousel-item">
														<div class="carousel-title">
															<div class="ic-rank">3</div>
															<div>${aptitudeRank.aptitude_name3}</div>
														</div>
														<div class="chart-inner card">
															<canvas id="aptiChart3"></canvas>
														</div>
													</div>
												</div>
												<button class="carousel-control-prev" type="button"
													data-bs-target="#carouselExampleControls1"
													data-bs-slide="prev">
													<span class="carousel-control-prev-icon" aria-hidden="true"></span>
													<span class="visually-hidden">Previous</span>
												</button>
												<button class="carousel-control-next" type="button"
													data-bs-target="#carouselExampleControls1"
													data-bs-slide="next">
													<span class="carousel-control-next-icon" aria-hidden="true"></span>
													<span class="visually-hidden">Next</span>
												</button>
											</div>
										</div>
									
									</c:if>
								</div>
								<div id="item-values" class="chart-wrap">
									<c:if test="${!scoreTrue3}">
										<canvas id="valuesChart" style="display: none;"></canvas>
										<div class="empty-box">
											<div>검사결과가 없습니다.</div>
											<a href="/whou/aptitude/aptitudeMain">검사하러가기 >></a>
										</div>
									</c:if>
									<c:if test="${scoreTrue3}">
										<div class="test-result-top">
											<div class="chart-inner card">
												<canvas id="valuesChart"></canvas>
											</div>
											<ul class="chart-ranks card">
												<li>가치관 TOP 5</li>
												<c:forEach var="entry" items="${valueRank.entrySet()}"
													varStatus="loop">
													<li>
														<div class="ic-rank">${loop.index+1 }</div>
														<div>${entry.key}</div> <span>${entry.value}점</span>
													</li>
												</c:forEach>
											</ul>
										</div>
										<div class="card">
											<div id="carouselExampleControls2"
												class="carousel slide carousel-dark" data-bs-ride="carousel">
												<div class="carousel-inner">
													<div class="carousel-item active">
														<div class="carousel-title">
															<div class="ic-rank">1</div>
															<div>안전지향</div>
														</div>
														<div class="chart-inner card">
															<canvas id="valueChart1" width="500px"></canvas>
														</div>
													</div>
													<div class="carousel-item">
														<div class="carousel-title">
															<div class="ic-rank">2</div>
															<div>의미지향</div>
														</div>
														<div class="chart-inner card">
															<canvas id="valueChart2"></canvas>
														</div>
													</div>
													<div class="carousel-item">
														<div class="carousel-title">
															<div class="ic-rank">3</div>
															<div>변화지향</div>
														</div>
														<div class="chart-inner card">
															<canvas id="valueChart3"></canvas>
														</div>
													</div>
													<div class="carousel-item">
														<div class="carousel-title">
															<div class="ic-rank">4</div>
															<div>성취지향</div>
														</div>
														<div class="chart-inner card">
															<canvas id="valueChart4"></canvas>
														</div>
													</div>
												</div>
												<button class="carousel-control-prev" type="button"
													data-bs-target="#carouselExampleControls2"
													data-bs-slide="prev">
													<span class="carousel-control-prev-icon" aria-hidden="true"></span>
													<span class="visually-hidden">Previous</span>
												</button>
												<button class="carousel-control-next" type="button"
													data-bs-target="#carouselExampleControls2"
													data-bs-slide="next">
													<span class="carousel-control-next-icon" aria-hidden="true"></span>
													<span class="visually-hidden">Next</span>
												</button>
											</div>
										</div>
									
									</c:if>
								</div>
								<div id="item-interest" class="chart-wrap">
									<c:if test="${!scoreTrue2}">
										<canvas id="interestChart" style="display: none;"></canvas>
										<div class="empty-box">
											<div>검사결과가 없습니다.</div>
											<a href="/whou/aptitude/aptitudeMain">검사하러가기 >></a>
										</div>
									</c:if>
									<c:if test="${scoreTrue2}">
										<div class="test-result-top">
											<div class="chart-inner card">
												<canvas id="interestChart"></canvas>
											</div>
											<ul class="chart-ranks card">
												<li>흥미 TOP 5</li>
												<c:forEach var="entry" items="${inteRank.entrySet()}"
													varStatus="loop">
													<li>
														<div class="ic-rank">${loop.index+1 }</div>
														<div>${entry.key}</div> <span>상위 ${entry.value}%</span>
													</li>
												</c:forEach>
												<%-- 
												<li>
													<div class="ic-rank">1</div>
													<div>${aptitudeRank.interest_name1}</div> <span>상위
														몇%</span>
												</li>
												<li>
													<div class="ic-rank">2</div>
													<div>${aptitudeRank.interest_name2}</div> <span>상위
														몇%</span>
												</li>
												<li>
													<div class="ic-rank">3</div>
													<div>${aptitudeRank.interest_name3}</div> <span>상위
														몇%</span>
												</li>
												<li>
													<div class="ic-rank out">4</div>
													<div>${aptitudeRank.interest_name3}</div> <span>상위
														몇%</span>
												</li>
												<li>
													<div class="ic-rank out">5</div>
													<div>${aptitudeRank.interest_name3}</div> <span>상위
														몇%</span>
												</li>
												 --%>
											</ul>
										</div>
										<div class="card">
											<div id="carouselExampleControls4"
												class="carousel slide carousel-dark" data-bs-ride="carousel">
												<div class="carousel-inner">
													<div class="carousel-item active">
														<div class="carousel-title">
															<div class="ic-rank">1</div>
															<div>${aptitudeRank.interest_name1}</div>
														</div>
														<div class="chart-inner card">
															<canvas id="inteChart1" width="500px"></canvas>
														</div>
													</div>
													<div class="carousel-item">
														<div class="carousel-title">
															<div class="ic-rank">2</div>
															<div>${aptitudeRank.interest_name2}</div>
														</div>
														<div class="chart-inner card">
															<canvas id="inteChart2"></canvas>
														</div>
													</div>
													<div class="carousel-item">
														<div class="carousel-title">
															<div class="ic-rank">3</div>
															<div>${aptitudeRank.interest_name3}</div>
														</div>
														<div class="chart-inner card">
															<canvas id="inteChart3"></canvas>
														</div>
													</div>
												</div>
												<button class="carousel-control-prev" type="button"
													data-bs-target="carouselExampleControls4"
													data-bs-slide="prev">
													<span class="carousel-control-prev-icon" aria-hidden="true"></span>
													<span class="visually-hidden">Previous</span>
												</button>
												<button class="carousel-control-next" type="button"
													data-bs-target="carouselExampleControls4"
													data-bs-slide="next">
													<span class="carousel-control-next-icon" aria-hidden="true"></span>
													<span class="visually-hidden">Next</span>
												</button>
											</div>
										</div>
									</c:if>
								</div>
								<div id="item-ability" class="chart-wrap">
									<c:if test="${!scoreTrue4}">
										<canvas id="abilityChart1" style="display: none;"></canvas>
										<canvas id="abilityChart2" style="display: none;"></canvas>
										<div class="empty-box">
											<div>검사결과가 없습니다.</div>
											<a href="/whou/aptitude/aptitudeMain">검사하러가기 >></a>
										</div>
									</c:if>
									<c:if test="${scoreTrue4}">
										<div class="chart-inner card ability">
											<canvas id="abilityChart1"></canvas>
											<canvas id="abilityChart2"></canvas>
										</div>
									</c:if>
								</div>
							</div>

							<!-- 추천 -->
							<div class="tab-pane fade" id="nav-reco" role="tabpanel"
								aria-labelledby="nav-reco-tab" tabindex="0">
								<div id="reco-container">
									<div class="card" style="border:0;margin-bottom:20px;padding:20px;background:#5a3fff;color:#fff;">
										<h3>활용Tip!</h3>
										<strong>[추천 받기]</strong>에서 선택한 직업으로 진로컨설팅을 진행합니다.<br>
										<strong>[정보 수정]-[추가 정보 입력]</strong>에 작성된 자격증 및 학력 정보와 <strong>[추천 받기]-[우선순위 선택하기], [진로검사]</strong>가 컨설팅에 영향을 미칩니다.<br>
										보다 정확한 진로 컨설팅을 희망하신다면 <strong>[진로 검사]와 [정보 수정]-[추가 정보 입력], [우선순위 선택하기]</strong>를 반드시 기입 바랍니다.
									</div>
									<div class="reco-wrap">
										<div class="reco-item-container"
											style="display: flex; justify-content: flex-start; gap: 20px;">
											<div class="reco-tag" style="width: 370px; height: 170px">
												<span
													style="font-weight: 600; font-size: 18px; margin-left: 5px;">컨설팅
													직업 선택</span> <a style="font-size: 12px; margin-left: 10px;">마우스를
													올릴 시 직업의 정보가 나옵니다</a>
												<div id="jobContainer">
													<div class="input-wrap" style="margin-top: 10px;">
														<input class="jobSearch" type="text" name="job"
															placeholder="직업 이름" oninput="checkJob(this)" />
														<ul class="jobSearchLi">
															<li>
																<%-- 
                                                <div class="jobMadeCard">
                                                   <p class="JcardP1">정밀기기제품제조원</p>
                                                   <p class="JcardP2">정밀기기제품제조원은 각종 센서, 제어장치 등의 부품을 제작 및 조립하여 현미경, 시계, 카메라 등, 모양은 작지만 다양한 기능을 갖춘 기기들을 제조하는 일을 담당합니다</p>
                                                   <p class="JcardP1">핵심능력</h3>
                                                   <div style="display:flex; gap:20px;">
                                                      <div>
                                                         <i class="fa-solid fa-hand" style="color:#5A3FFF;"></i><span style="margin-left:10px;">손재능</span>
                                                      </div>
                                                      <div>
                                                         <i class="fa-solid fa-hand" style="color:#5A3FFF;"></i><span style="margin-left:10px;">손재능</span>
                                                      </div>
                                                   </div>
                                                </div>
                                                 --%>
															</li>
														</ul>
													</div>
												</div>
												<div
													style="font-weight: 600; font-size: 18px; margin-left: 5px; margin-top: 20px;">
													<c:if
														test="${jobDetailCunsuling.getBaseInfo().getJob_nm()!=null}">
                                          나의 현재 직업 : ${jobDetailCunsuling.getBaseInfo().getJob_nm()} 
                                       </c:if>
													<c:if
														test="${jobDetailCunsuling.getBaseInfo().getJob_nm()==null}">
                                          나의 현재 직업 : 없음 
                                       </c:if>
												</div>
											</div>
											<div class="reco-tag" style="width: 510px; height: 170px;">
												<span
													style="font-weight: 600; font-size: 18px; margin-left: 5px;">우선순위
													선택하기</span> <a style="font-size: 12px; margin-left: 10px;">선택하지
													않을시에는 모두 동일한 중요도로 적용됩니다.</a>
												<form action="/whou/member/mypage?load=5" method="post">
													<div
														style="display: flex; flex-wrap: wrap; align-content: flex-start;">
														<c:if test="${testTrue !=null}">
															<c:forEach var="trueByTest" items="${testTrue}"
																varStatus="loop">
																<div
																	style="font-weight: 600; font-size: 18px; margin-left: 5px; margin-top: 20px; width: 230px;">
																	<c:if test="${loop.index eq 0}">적성</c:if>
																	<c:if test="${loop.index eq 1}">흥미</c:if>
																	<c:if test="${loop.index eq 2}">가치관</c:if>
																	<select name="importance"
																		style="min-width: 50px; margin-left: 25px; margin-right: 15px;">
																		<option value="3"
																			<c:if test="${impt.get(loop.index)==3}">selected</c:if>>1</option>
																		<option value="2"
																			<c:if test="${impt.get(loop.index)==2}">selected</c:if>>2</option>
																		<option value="1"
																			<c:if test="${impt.get(loop.index)==1}">selected</c:if>>3</option>
																	</select>
																	<c:if test="${trueByTest}">응시함</c:if>
																	<c:if test="${!trueByTest}">응시 안함</c:if>
																</div>
															</c:forEach>
														</c:if>
														<c:if test="${testTrue==null}">
															<div
																style="font-weight: 600; font-size: 18px; margin-left: 5px; margin-top: 20px; width: 230px;">
																적성 <select name="importance"
																	style="min-width: 50px; margin-left: 25px; margin-right: 15px;">
																	<option value="3">1</option>
																	<option value="2">2</option>
																	<option value="1">3</option>
																</select> 응시 안함
															</div>
															<div
																style="font-weight: 600; font-size: 18px; margin-left: 5px; margin-top: 20px; width: 230px;">
																흥미 <select name="importance"
																	style="min-width: 50px; margin-left: 25px; margin-right: 15px;">
																	<option value="3">1</option>
																	<option value="2">2</option>
																	<option value="1">3</option>
																</select> 응시 안함
															</div>
															<div
																style="font-weight: 600; font-size: 18px; margin-left: 5px; margin-top: 20px; width: 230px;">
																가치관 <select name="importance"
																	style="min-width: 50px; margin-left: 11px; margin-right: 15px;">
																	<option value="3">1</option>
																	<option value="2">2</option>
																	<option value="1">3</option>
																</select> 응시 안함
															</div>
														</c:if>
														<div class="button-wrap"
															style="margin-top: 20px; text-align: right; width: 230px;">
															<button type="submit" class="purple-btn"
																style="margin-left: 10px; width: 80px; display: block; margin-left: auto; margin-right: 20px;">적용</button>
														</div>
													</div>
												</form>
											</div>
										</div>
									</div>
									<c:if test="${!none}">
										<div id="reco-li-container">
											<p
												style="margin-bottom: 20px; margin-left: 10px; font-size: 18px;">
												직업 정보를 보고싶으면 <strong>직업 이름</strong>을, 컨설팅을 받고 싶으면 <strong>컨설팅받기</strong>를
												클릭해주세요<br> <span style="font-size: 16px;">적합도는
													가장 높은 직업 적합도 총 점수를 기준으로 계산합니다</span>
											</p>
											<c:forEach var="rere" items="${reres}">
												<div class="reco-wrap">
													<div class="reco-item">
														<div
															onclick="location='/whou/job/info?job_cd=${rere.job_cd}'">
															${rere.job_nm}
															<p style="font-size: 16px;">적합도 :
																${Math.round((rere.total/highValueOfTest)*100000)/1000}%</p>
														</div>
														<div>${rere.descriptions}</div>
														<div
															onclick="confirm('선택하신 직업으로 컨설팅 받으시겠습니까?')?location='/whou/member/insertConsult?job_cd=${rere.job_cd}':false;"
															style="font-size: 16px; color: #5a3fff">컨설팅받기</div>
													</div>
												</div>
											</c:forEach>
										</div>
										<div class="add-btn" id="add-reco" onclick="getRecoLi()">
											<i class="fa-solid fa-circle-plus fa-lg"></i>
										</div>
									</c:if>
									<c:if test="${none}">
										<div class="empty-box">
											<div>추천이 불가능합니다.</div>
											<div>검사를 보거나, 자격증 및 학과 정보를 기입해주세요.</div>
											<a href="/whou/aptitude/aptitudeMain">검사하러가기 >></a>
										</div>
									</c:if>
								</div>
							</div>


							<!-- 컨설팅  -->
							<div class="tab-pane fade" id="nav-contact" role="tabpanel"
								aria-labelledby="nav-contact-tab" tabindex="0">
								<%-- <c:if test="${avilReinforce eq '' || avilReinforce==null || cunsultingNum == 0}">--%>
								<c:if test="${cunsultingNum==0 }">
									<div class="empty-box">
										<div>컨설팅을 원한다면 직업적성검사를 받으세요.</div>
										<a href="/whou/aptitude/aptitudeMain">검사하러가기 >></a>
									</div>
								</c:if>
								<c:if test="${!(avilReinforce eq '') || avilReinforce!=null }">
									<div style="padding: 0px 10xp;">
										<c:if test="${cunsultingNum > 0}">
											<div style="margin: 0px 10xp;">
												<h4>${memId}님의컨설팅이완료되었습니다.</h4>
											</div>
											<div class="card">
												<div class="card-header">직업 이름</div>
												<div class="card-body">
													${jobDetailCunsuling.getBaseInfo().getJob_nm()}</div>
											</div>
											<div class="card">
												<div class="card-header">직업 설명</div>
												<div class="card-body">
													<c:forEach var="getWorkList"
														items="${jobDetailCunsuling.getWorkList()}">
														<p class="card-text">
														<div style="display: flex;">
															<div style="padding-right: 10px;">
																<i class="fa-solid fa-chevron-right"></i>
															</div>
															<div>${getWorkList.work}</div>
															</p>
														</div>
													</c:forEach>
												</div>
											</div>
											<div class="card">
												<div class="card-header">취업 방법</div>
												<div class="card-body">
													<c:forEach var="getRecruit"
														items="${jobDetailCunsuling.getJobReady().getRecruit()}">
														<p class="card-text">${getRecruit.recruit}</p>
													</c:forEach>
												</div>
											</div>
											<div class="card">
												<div class="card-header">관련 교육</div>
												<div class="card-body">
													<c:forEach var="getCurriculum"
														items="${jobDetailCunsuling.getJobReady().getCurriculum()}">
														<p class="card-text">${getCurriculum.curriculum}</p>
													</c:forEach>
												</div>
											</div>
											<div class="card">
												<div class="card-header">연봉 정보</div>
												<div class="card-body">
													평균 연봉 : ${jobDetailCunsuling.getBaseInfo().getWage()}만 원<br>
													<br>
													${jobDetailCunsuling.getBaseInfo().getWage_source()}<br>
													<br>
												</div>
											</div>
											<c:if
												test="${jobDetailCunsuling.getDepartList().get(0).getDepart_id() != null}">
												<div class="card">
													<div class="card-header">관련학과</div>
													<div class="card-body">
														<c:forEach var="getDepartList"
															items="${jobDetailCunsuling.getDepartList()}">
															<c:if
																test="${!getDepartList.depart_name.equals(jobDetailCunsuling.getDepartList().get(0).getDepart_name())}">
		                                                ,
		                                             </c:if>
		                                                        ${getDepartList.depart_name}
		                                                  </c:forEach>
														<div style="display: flex;">
															<div style="height: 280px; width: 400px;" class="mb-4">
																<canvas id="chartCanvas"></canvas>
																<script>
		                                                     function getSpecificColor(index) {
		                                                         const colors = [
		                                                            '#FF6D60', '#F7D060', '#F3E99F', '#98D8AA',
		                                                            '#3AA6B9', '#F0F0F0', '#F9D949', '#F45050',
		                                                            '#F7C8E0', '#DFFFD8', '#B4E4FF', '#95BDFF',
		                                                            '#6F69AC', '#95DAC1', '#C56183',
		                                                         ];
		                                                         return colors[index % colors.length]; // 인덱스에 따라서 색상을 반복해서 사용합니다.
		                                                   }
		                                                     var charLabel = [
		                                                        <c:forEach items="${majorChartMajor}" var="chartMajorLabel" varStatus="status">
		                                                            '${chartMajorLabel}'<c:if test="${not status.last}">,</c:if>
		                                                        </c:forEach>
		                                                    ];
		                                                     var chartData = [
		                                                        <c:forEach items="${majorChartMajorData}" var="chartMajorData" varStatus="status">
		                                                            '${chartMajorData}'<c:if test="${not status.last}">,</c:if>
		                                                        </c:forEach>
		                                                    ];
		                                                     const canvas3 = document.getElementById("chartCanvas");
		                                                    const data3 = {
		                                                             labels: charLabel,
		                                                             datasets: [
		                                                               {
		                                                                 label: "종사자의 전공 계열",
		                                                                 data: chartData,
		                                                                 backgroundColor: Array.from({ length: charLabel.length }, (_, index) => getSpecificColor(index)), // 무작위 색상을 5000개 생성하여 배열로 설정,
		                                                                 hoverOffset: 4,
		                                                               },
		                                                             ],
		                                                           };
		                                                    const options3 = {
		                                                          plugins: {
		                                                             responsive: false,
		                                                             title: {
		                                                                display: true,
		                                                                position: 'bottom',
		                                                                text: '종사자의 전공 계열',
		                                                                font: { size: 20, weight: 'bold' },
		                                                                },
		                                                              legend: {
		                                                                 position: 'right',
		                                                                 },
		                                                         },
		                                                   };
		               
		                                                   new Chart(canvas3, {
		                                                      type: "doughnut",
		                                                      data: data3,
		                                                      options: options3,
		                                                   });
		                                                  </script>
																<div>
																	${jobDetailCunsuling.getMajorChart().get(0).getSource()}</div>
															</div>

															<div style="height: 280px; width: 400px;" class="mb-4">
																<canvas id="chartCanvas2"></canvas>
																<script>
		                                                     var charLabel2 = ['중졸이하','고졸','전문대졸','대졸','대학원졸','박사졸'];
		                                                     var chartData2 = [${jobDetailCunsuling.getEduChart().get(0).getChart_data()} ];
		                                                     const canvas4 = document.getElementById("chartCanvas2");
		                                                    const data4 = {
		                                                             labels: charLabel2,
		                                                             datasets: [
		                                                               {
		                                                                 label: "종사자 학력 수준",
		                                                                 data: chartData2,
		                                                                 backgroundColor: Array.from({ length: charLabel.length }, (_, index) => getSpecificColor(index)), // 무작위 색상을 5000개 생성하여 배열로 설정,
		                                                                 hoverOffset: 4,
		                                                               },
		                                                             ],
		                                                           };
		                                                    const options4 = {
		                                                          plugins: {
		                                                             responsive: false,
		                                                             title: {
		                                                                display: true,
		                                                                position: 'bottom',
		                                                                text: '종사자 학력 수준',
		                                                                font: { size: 20, weight: 'bold' },
		                                                                },
		                                                              legend: {
		                                                                 position: 'right',
		                                                                 },
		                                                         },
		                                                   };
		               
		                                                   new Chart(canvas4, {
		                                                      type: "doughnut",
		                                                      data: data4,
		                                                      options: options4,
		                                                   });
		                                                  </script>
																<div>
																	${jobDetailCunsuling.getEduChart().get(0).getSource()}</div>
															</div>
														</div>
													</div>
												</div>
												<%-- 
                                            <div>
                                               종사자 전공 계열 분포 : 
                                               <c:forEach var="majorChartMajor" items="${majorChartMajor}">
                                                  ${majorChartMajor}
                                               </c:forEach>
                                               <c:forEach var="majorChartMajorData" items="${majorChartMajorData}">
                                                  ${majorChartMajorData}%
                                               </c:forEach>
                                               ${jobDetailCunsuling.getMajorChart().get(0).getSource()}
                                            </div>
                                             --%>
											</c:if>
											<c:if
												test="${jobDetailCunsuling.getJobReady().getCertificate().get(0) != null }">
												<div class="card">
													<div class="card-header">자격증</div>
													<div class="card-body">
														<c:forEach var="getCertificate"
															items="${jobDetailCunsuling.getJobReady().getCertificate()}">
															<p class="card-text">${getCertificate.certificate}</p>
														</c:forEach>
													</div>
												</div>
											</c:if>

											<div class="card">
												<div class="card-header">요구 능력</div>
												<div class="card-body">
													<c:forEach var="getAbilityList"
														items="${jobDetailCunsuling.getAbilityList()}">
                                                  ${getAbilityList.ability_name}
                                               </c:forEach>
												</div>
											</div>
											<div>
												<div class="card">
													<div class="card-header">직업적성검사 결과</div>
													<div class="card-body">
														<c:forEach var="i" begin="0" end="${fn:length(needAvil)}">
															<c:set var="currentNeedAvil" value="${needAvil[i]}" />
															<c:set var="currentAvilArrValue"
																value="${avilArrValue[i]}" />
															<c:set var="currentReinDTO" value="${reinDTO[i]}" />
															<c:if
																test="${currentNeedAvil != null && currentAvilArrValue < 55}">
                                                  ${currentNeedAvil}영역이 ${currentAvilArrValue}점으로 보완이 필요합니다.
                                                  아래와 같은 방법을 통해 보완할 수 있습니다.
                                                
                                                <ol>
																	<li><i class="fa-solid fa-chevron-right"></i> ${currentReinDTO.getMethod01()}</li>
																	<li><i class="fa-solid fa-chevron-right"></i> ${currentReinDTO.getMethod02()}</li>
																	<li><i class="fa-solid fa-chevron-right"></i> ${currentReinDTO.getMethod03()}</li>
																	<li><i class="fa-solid fa-chevron-right"></i> ${currentReinDTO.getMethod04()}</li>
																	<li><i class="fa-solid fa-chevron-right"></i> ${currentReinDTO.getMethod05()}</li>
																	<li><i class="fa-solid fa-chevron-right"></i> ${currentReinDTO.getMethod06()}</li>
																	<li><i class="fa-solid fa-chevron-right"></i> ${currentReinDTO.getMethod07()}</li>
																	<li><i class="fa-solid fa-chevron-right"></i> ${currentReinDTO.getMethod08()}</li>
																	<li><i class="fa-solid fa-chevron-right"></i> ${currentReinDTO.getMethod09()}</li>
																	<li><i class="fa-solid fa-chevron-right"></i> ${currentReinDTO.getMethod10()}</li>
																</ol>
															</c:if>

															<c:if
																test="${currentNeedAvil != null && currentAvilArrValue > 55 && currentAvilArrValue < 101}">
                                                  ${currentNeedAvil}영역이 ${currentAvilArrValue}점으로 준수합니다. 
                                                  자격증과 기타 활동을 위주로 수행하시는 것을 추천드립니다.
                                              </c:if>
														</c:forEach>
													</div>
												</div>
											</div>
										</c:if>

									</div>
								</c:if>
							</div>


						</div>
					</div>
					<div class="right-bottom-box">
						<div class="notice-box">
							<div>공지사항</div>
							<div>
								<a href="/whou/cs/noticeDetail?num=${notice.num}">${notice.subject}</a>
							</div>
						</div>
						<ul class="test-list">
							<c:if test="${!scoreTrue1}">
								<li onclick="location='/whou/aptitude/intro?load=1&qnum=21'">적성검사
									하러가기</li>
							</c:if>
							<c:if test="${!scoreTrue2}">
								<li onclick="location='/whou/aptitude/intro?load=1&qnum=31'">흥미검사
									하러가기</li>
							</c:if>
							<c:if test="${!scoreTrue3}">
								<li onclick="location='/whou/aptitude/intro?load=1&qnum=25'">가치관검사
									하러가기</li>
							</c:if>
							<c:if test="${!scoreTrue4}">
								<li onclick="location='/whou/aptitude/intro?load=1&qnum=27'">역량검사
									하러가기</li>
							</c:if>
						</ul>
					</div>
				</div>
			</div>
		</div>
	</section>
	<%@ include file="../footer.jsp"%>
	<!-- Bootstrap core JS-->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
	<script>
	   function addQualification() {
           var newDiv = $("<div>").addClass("input-wrap");
           var newInput = $("<input>").attr({
               type: "text",
               name: "certi",
               required: true,
               oninput: "checkCerti(this)",
               placeholder: "자격증 명",
               autocomplete: "off",
           });
           var newIcon = $("<i>").addClass("fa-solid fa-circle-minus fa-lg");
           var newUl = $("<ul>").addClass("qualificationList");
  
           newDiv.append(newInput).append(newIcon).append(newUl);

           $("#qualificationContainer").append(newDiv);
           newUl.hide();
       }
       
        
        let load = "${load}";
        
        if(load === "2"){
        	$("#nav-addInfo").show();
        	$("#nav-tabContent").hide();

        }else if(load === "3"){
        	$(".chg-info-bg").show();
        	 $(".info-tab").addClass("active");
          	 $("#nav-info").addClass("active show");
          	$("#nav-tabContent").hide();
        }else if(load === "4"){
        	 $(".nav-link").removeClass("active");
       	 	 $(".tab-pane").removeClass("active show");
       	 	 
       	 	$("#nav-tabContent").hide();
         	 $(".book-bg").show();
         	 
       }else if(load === "5"){
        	$(".nav-link").removeClass("active");
       		$(".tab-pane").removeClass("active show");
         	$("#nav-reco-tab").addClass("active");
         	$("#nav-reco").addClass("active show");
		}else if(load === "6"){
            $(".nav-link").removeClass("active");
            $(".tab-pane").removeClass("active show");
               
            $("#nav-contact-tab").addClass("active");
            $("#nav-contact").addClass("active show");
       }
        function reco(){
        	$(".nav-link").removeClass("active");
       		$(".tab-pane").removeClass("active show");
         	$("#nav-reco-tab").addClass("active");
         	$("#nav-reco").addClass("active show");
        }
         // 적성 차트
      		const aptitudeTop3 = ${aptitudeTop3};
         	let aptitudeScoreArr = [0];
         	const backColor = aptitudeScoreArr.map(score => score >= aptitudeTop3 ? 'rgba(90, 63, 255, 0.8)' : 'rgba(255, 99, 132, 0.5)');
         	const edgeColor = aptitudeScoreArr.map(score => score >= aptitudeTop3 ? 'rgba(57, 37, 189, 1)' : 'rgba(255, 99, 132, 1)');
         	let aptitudeNameArr = ["음악능력","수리·논리력","창의력","자연친화력","예술시각능력","공간지각력","대인관계능력","손재능","언어능력","자기성찰능력","신체·운동능력"];
        	if (typeof aptitudeScoreArr !== 'undefined' && aptitudeScoreArr !== null && aptitudeScoreArr !== '') {
        		aptitudeScoreArr = ${aptitudeScoreArr};
        		aptitudeNameArr =${aptitudeNameArr};
			}
        	
            const ctx21 = document.getElementById('aptitudeChart');
              var myChart21 = new Chart(ctx21, {
                   type: 'bar',
                   data: {
                       labels:aptitudeNameArr,
                       datasets: [
                       {
                           data: aptitudeScoreArr,
                           backgroundColor: backColor,
                           borderColor: edgeColor,
                           borderWidth: 1,
                          
                       },              
                       ]
                   },
                   options: {
                       scale: {                                          
                               min: 0,
                               max: 100,
                               ticks: {
                                 stepSize:10
                               }
                           
                       }
                   }
                   });
              
              // 흥미차트 
	           let  interestScoreArr = 0;
				if (typeof interestScoreArr !== 'undefined' && interestScoreArr !== null && interestScoreArr !== '') {
					interestScoreArr = ${interestScoreArr};
				} 
             
            const ctx31 = document.getElementById('interestChart');
              var myChart31 = new Chart(ctx31, {
                   type: 'bar',
                   data: {
                       labels:['자연과학','AI·소프트웨어','공학','법률·행정','복지','교육','예술·미디어','스포츠','마케팅','금융·경영','여가·관광','보건의료', '농생명', '환경', '제조', '물류·운송·유통', '설계·건축·토목'],
                       datasets: [
                       {
                           data: interestScoreArr,
                           backgroundColor: 'rgba(255, 99, 132, 0.5)',
                           borderColor: 'rgba(255, 99, 132, 1)',
                           borderWidth: 1,
                          
                       },              
                       ]
                   },
                   options: {
                       scale: {                                          
                               min: 0,
                               max: 100,
                               ticks: {
                                 stepSize:10
                               }
                           
                       }
                   }
                   });
              
           // 가치관 
           let valuesScoreArr=0;
			if (typeof valuesScoreArr !== 'undefined' && valuesScoreArr !== null && valuesScoreArr !== '') {
				valuesScoreArr = ${valuesScoreArr};
			}
          
            const ctx25 = document.getElementById('valuesChart');
              var myChart25 = new Chart(ctx25, {
                   type: 'bar',
                   data: {
                       labels:['안정성', '보수', '일과 삶의 균형', '즐거움','소속감','자기계발', '도전성', '영향력', '사회적 기여','성취','사회적 인정','자율성'],
                       datasets: [
                       {
                           data: valuesScoreArr,
                           backgroundColor: 'rgba(255, 99, 132, 0.5)',
                           borderColor: 'rgba(255, 99, 132, 1)',
                           borderWidth: 1,
                          
                       },              
                       ]
                   },
                   options: {
                       scale: {                                          
                               min: 0,
                               max: 20,
                               ticks: {
                                 stepSize:10
                               }
                           
                       }
                   }
                   });
           // 역량 
             let abilityScoreArr1=0;
             let abilityScoreArr2=0;
			if (typeof abilityScoreArr1 !== 'undefined' && abilityScoreArr1 !== null && abilityScoreArr1 !== '') {
				abilityScoreArr1 = [${firstThree}];
				abilityScoreArr2 = [${lastSix}];
			}
            
            const ctx271 = document.getElementById('abilityChart1');
              var myChart271 = new Chart(ctx271, {
                   type: 'bar',
                   data: {
                       labels:['자기이해', '직업이해', '진로탐색', '진로계획'],
                       datasets: [
                       {
                           data: abilityScoreArr1,
                           backgroundColor: 'rgba(255, 99, 132, 0.5)',
                           borderColor: 'rgba(255, 99, 132, 1)',
                           borderWidth: 1,
                          
                       },              
                       ]
                   },
                   options: {
                       scale: {                                          
                               min: 0,
                               max: 100,
                               ticks: {
                                 stepSize:10
                               }
                           
                       }
                   }
                   });
              
              
            
              const ctx272 = document.getElementById('abilityChart2');
                var myChart272 = new Chart(ctx272, {
                     type: 'bar',
                     data: {
                         labels:['낙관성', '지속성', '호기심', '유연성', '도전성', '의사소통'],
                         datasets: [
                         {
                             data: abilityScoreArr2,
                             backgroundColor: 'rgba(255, 99, 132, 0.5)',
                             borderColor: 'rgba(255, 99, 132, 1)',
                             borderWidth: 1,
                            
                         },              
                         ]
                     },
                     options: {
                         scale: {                                          
                                 min: 0,
                                 max: 100,
                                 ticks: {
                                   stepSize:10
                                 }
                             
                         }
                     }
                     });

              
              // tab
            const triggerTabList = document.querySelectorAll('#myTab button')
         triggerTabList.forEach(triggerEl => {
           const tabTrigger = new bootstrap.Tab(triggerEl)
         
           triggerEl.addEventListener('click', event => {
             event.preventDefault()
             tabTrigger.show()
           })
         })
  
         // 추가 정보 입력
            function checkCerti(inputElement) {
               var certi = $(inputElement).val();
               var qualificationList = $(inputElement).siblings(".qualificationList");
               $.ajax({
                   url: "/whou/member/getCerti",
                   data: { certi: certi },
                   success: function (result) {
                       qualificationList.empty();
                       qualificationList.hide();
                       if(certi.length > 0){
                          if(result && result.length > 0){
                              for (var i = 0; i < result.length; i++) {
                                  var qualification = result[i];
                                  var button = $("<button>").text(qualification);
                               
                                  button.on("click", function () {
                                     event.preventDefault();
                                      var selectedQualification = $(this).text();
                                      $(inputElement).val(selectedQualification);
                                      qualificationList.hide();
                                  });
                                  qualificationList.append($("<li>").append(button));
                              }
                           }else{
                               var message = "' " + certi + " '을(를) 찾을 수 없습니다.";
                               var messageElement = $("<li>").text(message);
                               messageElement.on("click", function () {
                                   // 메시지 클릭 시 qualificationList를 숨기고 인풋 값을 비웁니다.
                                   $(inputElement).val("");
                                   qualificationList.hide();
                               });
                               qualificationList.append(messageElement);
                           }    

                           qualificationList.show();
                       }
                   }
               });
           }
           
           function checkMajor(inputElement) {
               var major = $(inputElement).val();
               var univSe = $("#depart").val();
               //var univSe2 = $("#depart2").val();
               var majorList = $(inputElement).next(".majorList");

               $.ajax({
                   url: "/whou/member/getMajor",
                   data: { major: major, univSe:univSe},
                   success: function (result) {
                      majorList.empty();
                      majorList.hide();
                      
                      if(major.length > 0){
                         if(result && result.length > 0){
                             for (var i = 0; i < result.length; i++) {
                                 var major2 = result[i];
                                 var button = $("<button>").text(major2);
                                 button.on("click", function () {
                                    event.preventDefault();
                                     var selectedMajor = $(this).text();
                                     $(inputElement).val(selectedMajor);
                                     majorList.hide();
                                 });
                                 majorList.append($("<li>").append(button));
                             }
                         }else{
                             var message = "' " + major + " '을(를) 찾을 수 없습니다.";
                             var messageElement = $("<li>").text(message);
                             messageElement.on("click", function () {
                                 // 메시지 클릭 시 qualificationList를 숨기고 인풋 값을 비웁니다.
                                 $(inputElement).val("");
                                 majorList.hide();
                             });
                             majorList.append(messageElement);
                         }
                         majorList.show();
                      }
                   }
               });
           }

     
        function addMajor() {
            var newDiv = $("<div>");
            var newInput = $("<input>").attr({
                type: "text",
                name: "major",
                required: true,
                oninput: "checkMajor(this)",
                autocomplete: "off",
            });
            var newUl = $("<ul>").addClass("majorList");

            newDiv.append(newInput).append(newUl);

            $("#majorContainer").append(newDiv);
            newUl.hide();
        }
        $(document).on('click', '.fa-solid.fa-circle-minus', function(){
            $(this).parent(".input-wrap").remove();
        });

        $(document).on("click", function(event) {
            var clickedElement = event.target;
            var majorLists = $(".majorList");
            var isMajorListVisible = majorLists.is(":visible");

            // majorList가 보일 때만 작동
            if (isMajorListVisible) {
                // 클릭된 요소가 majorList 또는 majorList 하위 요소인 경우 아무 동작 없이 리턴
                if ($(clickedElement).closest(".majorList").length) {
                    return;
                }

                // 인풋 요소들의 값을 비웁니다. 단, majorList 보이고 있던 인풋창만 비우고 나머지는 그대로 유지
                $("input[name='major']").each(function() {
                    if ($(this).siblings(".majorList").is(":visible")) {
                        $(this).val("");
                    }
                });

                // majorList를 숨깁니다.
                majorLists.empty().hide();
            }
        });

        // majorList가 보일 때 이벤트를 등록하고, 숨겨질 때 이벤트를 제거합니다.
        $(".majorList").on("show", function() {
            $(document).on("click", hideMajorListOnClickOutside);
        }).on("hide", function() {
            $(document).off("click", hideMajorListOnClickOutside);
        });

        // 전공 입력창 외부를 클릭했을 때 majorList를 숨기는 함수
        function hideMajorListOnClickOutside(event) {
            var clickedElement = event.target;
            var majorLists = $(".majorList");

            // 클릭된 요소가 majorList 또는 majorList 하위 요소인 경우 아무 동작 없이 리턴
            if ($(clickedElement).closest(".majorList").length) {
                return;
            }

            // 인풋 요소들의 값을 비웁니다. 단, majorList 보이고 있던 인풋창만 비우고 나머지는 그대로 유지
            $("input[name='major']").each(function() {
                if ($(this).siblings(".majorList").is(":visible")) {
                    $(this).val("");
                }
            });

            // majorList를 숨깁니다.
            majorLists.empty().hide();
        }

        $(document).on("click", function(event) {
            var clickedElement = event.target;
            var qualificationLists = $(".qualificationList");
            var isQualificationListVisible = qualificationLists.is(":visible");

            // qualificationList가 보일 때만 작동
            if (isQualificationListVisible) {
                // 클릭된 요소가 qualificationList 또는 qualificationList 하위 요소인 경우 아무 동작 없이 리턴
                if ($(clickedElement).closest(".qualificationList").length) {
                    return;
                }

                // qualificationList가 보이고 있는 인풋 요소의 값을 비웁니다.
                $("input[name='certi']").each(function() {
                    if ($(this).siblings(".qualificationList").is(":visible")) {
                        $(this).val("");
                    }
                });

                // qualificationList를 숨깁니다.
                qualificationLists.empty().hide();
            }
        });

        // qualificationList가 보일 때 이벤트를 등록하고, 숨겨질 때 이벤트를 제거합니다.
        $(".qualificationList").on("show", function() {
            $(document).on("click", hideQualificationListOnClickOutside);
        }).on("hide", function() {
            $(document).off("click", hideQualificationListOnClickOutside);
        });

        // 인증서 입력창 외부를 클릭했을 때 qualificationList를 숨기고 인증서 입력창의 값이 비워지는 함수
        function hideQualificationListOnClickOutside(event) {
            var clickedElement = event.target;
            var qualificationLists = $(".qualificationList");

            // 클릭된 요소가 qualificationList 또는 qualificationList 하위 요소인 경우 아무 동작 없이 리턴
            if ($(clickedElement).closest(".qualificationList").length) {
                return;
            }

            // qualificationList가 보이고 있는 인풋 요소의 값을 비웁니다.
            $("input[name='certi']").each(function() {
                if ($(this).siblings(".qualificationList").is(":visible")) {
                    $(this).val("");
                }
            });

            // qualificationList를 숨깁니다.
            qualificationLists.empty().hide();
        }

        // select 요소의 값 변경 감지
        $('#testResultSelect').change(function() {
            var selectedValue = $(this).val();
            
            // 모든 아이템을 숨김 처리
            $('#item-aptitude').hide();
            $('#item-interest').hide();
            $('#item-values').hide();
            $('#item-ability').hide();

            // 선택된 값에 따라 해당 아이템을 보여줌
            if (selectedValue === '21') {
                $('#item-aptitude').css("display","block");
            } else if (selectedValue === '31') {
                $('#item-interest').css("display","block");
            } else if (selectedValue === '25') {
                $('#item-values').css("display","block");
            }else if (selectedValue === '27') {
                $('#item-ability').css("display","block");
            }
        });
        
        
        



     // 추천
             function addReco() {
                 var newDiv = $("<div>").addClass("input-wrap");
                 var newInput = $("<input>").attr({
                     type: "text",
                     name: "certi",
                     required: true,
                     oninput: "checkCerti(this)",
                     placeholder: "자격증 명",
                     autocomplete: "off",
                 });
                 var newIcon = $("<i>").addClass("fa-solid fa-circle-minus fa-lg");
                 var newUl = $("<ul>").addClass("qualificationList");
        
                 newDiv.append(newInput).append(newIcon).append(newUl);

                 $("#qualificationContainer").append(newDiv);
                 newUl.hide();
             }
             
             
             var recoPlus = 1;
             function getRecoLi(){
                var size=5;
                 $.ajax({
                     url: "/whou/member/getRecoLi",
                     type: "GET",
                     dataType: "json",
                     data: { page : recoPlus++, size:size},
                     success: function(result) {
                        for(var i = 0 ; i < result.length; i++){
                            generateDynamicHTML(result[i]);
                        }
                        if(result.length<5){
                           addRecoDiv = document.getElementById('add-reco');
                           if (addRecoDiv) {
                             addRecoDiv.style.display = 'none';
                           }
                        }
                     },
                     error: function(xhr, status, error) {
                         console.error("Error fetching joke:", error);
                     }
                 });
             }; 

             // Function to generate the dynamic HTML content

             function generateDynamicHTML(data) {
                 const recoWrapDiv = document.createElement('div');
                 recoWrapDiv.className = 'reco-wrap';

                 const recoItemDiv = document.createElement('div');
                 recoItemDiv.className = 'reco-item';

                 const jobNameDiv = document.createElement('div');
                 jobNameDiv.innerHTML=  data.job_nm+'<p style="font-size:16px;">'
                 + '적합도 : '+(Math.round((data.total/${highValueOfTest}) * 100000) / 1000)+'%'+'</p>';
                 const getRecoDiv = document.createElement('div');
                 getRecoDiv.innerText = '컨설팅받기';
                 getRecoDiv.onclick = function () {
                 confirm("선택하신 직업으로 컨설팅 받으시겠습니까?");
                     location = '/whou/member/insertConsult?job_cd='+data.job_cd;
                 };
                 getRecoDiv.style.fontSize = "16px";
                 getRecoDiv.style.color = "#5a3fff";
                 
                 const jobDescriptionDiv = document.createElement('div');
                 jobDescriptionDiv.innerText = data.descriptions;
                 jobNameDiv.onclick = function () {
                     location = '/whou/job/info?job_cd='+data.job_cd;
                 };
                 recoItemDiv.appendChild(jobNameDiv);
                 recoItemDiv.appendChild(jobDescriptionDiv);
                 recoItemDiv.appendChild(getRecoDiv);
                 recoWrapDiv.appendChild(recoItemDiv);
              
                 const dynamicContentDiv = document.getElementById('reco-li-container');
                 dynamicContentDiv.appendChild(recoWrapDiv);
             }
             
             function checkJob(inputElement) {
                 var job= $(inputElement).val();
                 var jobSearchLi= $(inputElement).siblings(".jobSearchLi");
                 $.ajax({
                     url: "/whou/member/searchJobs",
                     data: {job_nm: job},
                     success: function (result) {
                        
                        jobSearchLi.empty();
                        jobSearchLi.hide();
                        
                         if(job.length > 0){
                            if(result && result.length > 0){
                                for (var i = 0; i < result.length; i++) {
                                   
                                    var jobDTO = result[i];
                                    let job_cd = jobDTO.JOB_CD;
                                    var job_nm = jobDTO.JOB_NM;
                                    var button = $("<button>").text(job_nm);
                                    var li = $("<li>");
                                    (function (job_nm, li) {
                                li.on("mouseover", function () {
                                   event.preventDefault();
                                   $.ajax({
                                      url: "/whou/member/searchJDetail",
                                      data : {job_cd:job_cd},
                                      success : function(result){
                                              var divsWithClass = li.find('.jobMadeCard');
                                         if(divsWithClass.length==0){
                                                    updateJobCard(job_nm, result.work, result.talents, li);
                                         }else{
                                            divsWithClass.show();
                                         }
                                      }
                                   })
                                       });
                             })(job_nm, li);

                             button.on("click", function () {
                                event.preventDefault();
                                var selectedJob = $(this).text();
                                $(inputElement).val(selectedJob);
                                alert("직업선택이 완료 되었습니다.");
                                location = '/whou/member/insertConsult?job_cd='+job_cd;
                                jobSearchLi.hide();
                             });
                             li.append(button);
                                  jobSearchLi.append(li);
                          }
                             }else{
                                 var message = "' " + job + " '을(를) 찾을 수 없습니다.";
                                 var messageElement = $("<li>").text(message);
                                 messageElement.on("click", function () {
                                     // 메시지 클릭 시 jobSearchLi를 숨기고 인풋 값을 비웁니다.
                                     $(inputElement).val("");
                                     jobSearchLi.hide();
                                 });
                                 jobSearchLi.append(messageElement);
                             }    
                       jobSearchLi.show();
                         }
                     }
                 });
             }
           function updateJobCard(job_nm, work, talents, li) {
               var jobMadeCard = $("<div>").addClass("jobMadeCard");
               var title = $("<p>").addClass("JcardP1").text(job_nm);
               var description = $("<p>").addClass("JcardP2").text(work);
               var coreAbilitiesDiv = $("<div>").css("display", "flex").css("gap", "10px");
        
               talents.forEach(function (talent) {
                   var capabilityDiv = $("<div>");
                   var icon = $("<i>").addClass(talent.SORT_ICON).css("color", "#5A3FFF");
                   var text = $("<span>").text(talent.DETAIL_VALUE);
                   capabilityDiv.append(icon, text);
                   coreAbilitiesDiv.append(capabilityDiv);
               });
        
               jobMadeCard.append(title, description, coreAbilitiesDiv);
               li.append(jobMadeCard);
           }
           
           $(".jobSearchLi").on("mouseout", function () {
               var jobMadeCard = $(".jobMadeCard");
               jobMadeCard.hide();
           });
      
		function createChart(chartId,j_nm_labels,dataTest,dataTotal,label1){
	        const ctx21_1 = document.getElementById(chartId);
			var myChart21_1 = new Chart(ctx21_1, {
				type: 'bar',
				data: {
					labels:j_nm_labels,
					datasets: [
				          {
				            label: label1,
				            data: dataTest,
				            backgroundColor: 'rgba(90, 63, 255, 1)', // Customize the color
				            borderColor: 'rgba(90, 63, 255, 1)', // Customize the border color
				            borderWidth: 1, // Border width of bars
				          },
				          {
				            label: "직업 적합도 총점",
				            data: dataTotal,
				            backgroundColor: 'rgba(90, 63, 255, 0.5)', // Customize the color
				            borderColor: 'rgba(90, 63, 255, 1)', // Customize the border color
				            borderWidth: 1, // Border width of bars
				          },
				        ],
					},
				options: {
			      
					scale: {                                          
						min: 0,
						max: maxPoint,
						ticks: {
							stepSize:maxPoint/5
						}
					}
				}
			});
	    	
	    }

		var recoAptis = ${recoAptis};
		var recoIntes = ${recoIntes};
		var recoValues= ${recoValues};
		if(recoAptis!=null){
			recoApti1 = recoAptis[0];
			const labels = Object.keys(recoApti1[0]); // ['TOTAL', 'APTITUDE1']
		    const recoAptis_apti1 = recoApti1.map((item) => item["APTITUDE1"]*10);
		    const recoAptis_total1 = recoApti1.map((item) => item['TOTAL']*10);
		    const recoAptis_job_nm1 = recoApti1.map((item) => item[labels[2]]);
		    
			recoApti2 = recoAptis[1];
		    const recoAptis_apti2 = recoApti2.map((item) => item["APTITUDE2"]*10);
		    const recoAptis_total2 = recoApti2.map((item) => item['TOTAL']*10);
		    const recoAptis_job_nm2 = recoApti2.map((item) => item[labels[2]]);
		    
			recoApti3 = recoAptis[2];
		    const recoAptis_apti3 = recoApti3.map((item) => item["APTITUDE3"]*10);
		    const recoAptis_total3 = recoApti3.map((item) => item['TOTAL']*10);
		    const recoAptis_job_nm3 = recoApti3.map((item) => item[labels[2]]);
		    
		    createChart("aptiChart1",recoAptis_job_nm1,recoAptis_apti1,recoAptis_total1,"${aptitudeRank.aptitude_name1}");
		    createChart("aptiChart2",recoAptis_job_nm2,recoAptis_apti2,recoAptis_total2,"${aptitudeRank.aptitude_name2}");
		    createChart("aptiChart3",recoAptis_job_nm3,recoAptis_apti3,recoAptis_total3,"${aptitudeRank.aptitude_name3}");
		}	
		
		
		if(recoAptis!=null){
		    recoInte1 = recoIntes[0];
			const labels1 = Object.keys(recoInte1[0]); // ['TOTAL', 'APTITUDE1']
		    const recoIntes_apti1 = recoInte1.map((item) => item["INTEREST1"]*10);
		    const recoIntes_total1 = recoInte1.map((item) => item['TOTAL']*10);
		    const recoIntes_job_nm1 = recoInte1.map((item) => item[labels1[2]]);
		    
		    recoInte2 = recoIntes[1];
		    const recoIntes_apti2 = recoInte2.map((item) => item["INTEREST2"]*10);
		    const recoIntes_total2 = recoInte2.map((item) => item['TOTAL']*10);
		    const recoIntes_job_nm2 = recoInte2.map((item) => item[labels1[2]]);
		    
		    recoInte3 = recoIntes[2];
		    const recoIntes_apti3 = recoInte3.map((item) => item['INTEREST3']*10);
		    const recoIntes_total3 = recoInte3.map((item) => item['TOTAL']*10);
		    const recoIntes_job_nm3 = recoInte3.map((item) => item[labels1[2]]);
		    
		    createChart("inteChart1",recoIntes_job_nm1,recoIntes_apti1,recoIntes_total1,"${aptitudeRank.interest_name1}");
		    createChart("inteChart2",recoIntes_job_nm2,recoIntes_apti2,recoIntes_total2,"${aptitudeRank.interest_name2}");
		    createChart("inteChart3",recoIntes_job_nm3,recoIntes_apti3,recoIntes_total3,"${aptitudeRank.interest_name3}");
		}	
		

	    
		if(recoValues!=null){
		    recoValue1= recoValues[0];
		    console.log(recoValues);
			const labels1 = Object.keys(recoInte1[0]); // ['TOTAL', 'APTITUDE1']
		    const recoValues_apti1 = recoValue1.map((item) => item["VALUE1"]*10);
		    const recoValues_total1 = recoValue1.map((item) => item['TOTAL']*10);
		    const recoValues_job_nm1 = recoValue1.map((item) => item[labels1[2]]);
		    
		    recoValue2 = recoValues[1];
		    const recoValues_apti2 = recoValue2.map((item) => item["VALUE2"]*10);
		    const recoValues_total2 = recoValue2.map((item) => item['TOTAL']*10);
		    const recoValues_job_nm2 = recoValue2.map((item) => item[labels1[2]]);
		    
		    recoValue3 = recoValues[2];
		    const recoValues_apti3 = recoValue3.map((item) => item['VALUE3']*10);
		    const recoValues_total3 = recoValue3.map((item) => item['TOTAL']*10);
		    const recoValues_job_nm3 = recoValue3.map((item) => item[labels1[2]]);
		    
		    recoValue4 = recoValues[3];
		    const recoValues_apti4 = recoValue4.map((item) => item['VALUE4']*10);
		    const recoValues_total4 = recoValue4.map((item) => item['TOTAL']*10);
		    const recoValues_job_nm4 = recoValue4.map((item) => item[labels1[2]]);
		    
		    createChart("valueChart1",recoValues_job_nm1,recoValues_apti1,recoValues_total1,"안전지향");
		    createChart("valueChart2",recoValues_job_nm2,recoValues_apti2,recoValues_total2,"의미지향");
		    createChart("valueChart3",recoValues_job_nm3,recoValues_apti3,recoValues_total3,"변화지향");
		    createChart("valueChart4",recoValues_job_nm4,recoValues_apti4,recoValues_total4,"성취지향");
		}	
		
	    
	    var maxPoint=${highValueOfTest}*10;
	    

		
        </script>
	<script>
	       var modelCamera_x = 0;
		   	var modelCamera_y = 1;
		   	var modelCamera_z = 3;
        	var modelPath= '';
        	var modelWidth = 200;
        	var modelHeight = 200;
        	if('${model.headColor}' === ''){
        		var headColor = '#F781F3';
        	}else{
        		headColor = '${model.headColor}';
        	}
        	if('${model.armColor}' === ''){
        		var armColor = '#F781F3';
        	}else{
        		armColor = '${model.armColor}';
        	}
        	if('${model.cheekColor}' === ''){
        		var cheekColor = '#DF0101';
        	}else{
        		cheekColor = '${model.cheekColor}';
        	}
        	if('${model.legColor}' === ''){
        		var legColor = '#585858';
        	}else{
        		legColor = '${model.legColor}';
        	}
        	
        	
        	
            
          
        </script>
	<script>
      	//회원정보 수정 스크립트
      	var check = /^[0-9]+$/;
      	var code2 = "";
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
	   		    var phone = $("#phone").val();
	   		    
	   		    //유효성검사
	   			if(phone.length === 11 && check.test(phone)){
	   				$('.phone_ok').css("display", "inline-block");
	   				$('.phone_error').css("display", "none");
	   				
	   				$("#phone2").css("display", "inline-block");
	                $("#phoneChk2").css("display", "inline-block");
		   		    $.ajax({
		   		        type:"POST",
		   		        url:"/whou/member/telChk",
		   		        data: {tel:phone},
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
	   				$('.phone_ok').css("display", "none");
	   				$('.phone_error').css("display", "inline-block");
	   			}
	   		    
	   		});
   		});
	 
   		//휴대폰 인증번호 대조
		$("#phoneChk2").click(function(){
		    if($("#phone2").val() == code2){ // 위에서 저장한값을 비교
		         //alert("인증에 성공하셨습니다.")
		         $('.phone2_ok').css("display", "inline-block");
	   			 $('.phone2_error').css("display", "none");
		         telchk = "성공";
		    }else{
		        //alert("인증에 실패하셨습니다.\n인증번호를 다시 입력해주세요.")
		        $('.phone2_ok').css("display", "none");
   				$('.phone2_error').css("display", "inline-block");
		    }
		});
   		
		$(function() {
   		    function updateButtonStatus() {
		        var name = $("#name").val().replace(/ /g, '');
		        var birth_year = $("#birth_year").val().replace(/ /g, '');
		        var phone = $("#phone").val().replace(/ /g, '');

   		        var yearValid = $('.year_error').css("display") === "none";
   		        var phoneValid = $('.phone2_error').css("display") === "none" && $('.phone_error').css("display") === "none" && $('.phone2_ok').css("display") === "inline-block" && $('.phone_ok').css("display") === "inline-block";

   		        // 모든 조건이 만족할 때 버튼 활성화
	        	if (email !== '' && name !== '' && birth_year !== '' && phone !== '' &&
	   		        yearValid && phoneValid) {
	   		        $("#btnM").prop("disabled", false);
   		        }else {
   		            $("#btnM").prop("disabled", true);
   		        }
   		        
   		    }

   		    // 인풋 필드들의 입력값 변경 시에 이벤트 핸들러 할당
   		    $("#name, #birth_year, #phone").on("input", function() {
   		        updateButtonStatus();
   		    });
   			// 핸드폰 인증 버튼 클릭될 때마다 버튼 상태 업데이트
   		    $("#phoneChk2").on("click", function() {
   		        updateButtonStatus();
   		    });
   		    
   		    
   		    // 회원정보 수정
	   		$("#btnM").click(function() {
	   		
	   		  if (!$(this).prop("disabled")) {
	   			  
	   			var email = $("#email").text().replace(/ /g, '');
		        var name = $("#name").val().replace(/ /g, '');
		        var birth_year = $("#birth_year").val().replace(/ /g, '');
		        var phone = $("#phone").val().replace(/ /g, '');
  
	   			//컨트롤러로 보낼 데이터
     		 	var data = {
  	        		email: email,
  	                name: name,
  	                birth_year: birth_year,
  	              	tel: phone,
	  	        };

	   			$.ajax({
	   		      url: "/whou/member/updateUser",
	   		      contentType: "application/x-www-form-urlencoded; charset=UTF-8",
	   		      method: "POST",
	   		      data: data,
		   		  error: function() {
		   		        alert("오류가 발생했습니다.\n다시 시도해주세요.");
		   		  },
	  		      success:function(result){
	  		    	  console.log(result)
  		        	if(result === "1"){
		                	alert("회원정보가 성공적으로 변경되었습니다.")
		                	location.href = '/whou/member/mypage?load=3';
  		        	}else{
  		        		alert("오류가 발생했습니다.\n다시 시도해주세요.");
  		        	}
	  		      }
	   		    });
	   		  }
	   	   });
   		});
		
	    //현재 비밀번호 확인
   		function checkPw() {
   		     var pw = $("#pw").val();
   		     var email = "${memId}";
	   		 $.ajax({
	             url: "/whou/member/findPwPro",
	             data: { email: email},
	             success: function (result) {
	            	 if(pw.length > 0 && pw == result){
	         		      $('.pw_xx').css("display", "none");
	         		      $("#newPw").prop("disabled", false); // 활성화
	                      $("#newPw2").prop("disabled", false); // 활성화
	         		    }else if(pw.length > 0 && pw != result){
	         		       $('.pw_xx').css("display", "inline-block");
	         		       $("#newPw").prop("disabled", true); // 비활성화
	                       $("#newPw2").prop("disabled", true); // 비활성화
	         		    }else if(pw.length === 0){
         		    	   $('.pw_xx').css("display", "none");
	         		       $("#newPw").prop("disabled", true); // 비활성화
	                       $("#newPw2").prop("disabled", true); // 비활성화
		         		}
	             }
	         });
   		    
   		}
	    
   		//새비밀번호 유효성
   		function checkNewPw() {
   		     var newPw = $("#newPw").val();
	   		 
           	 if(newPw.length >= 4){
	   		      $('.pw_error').css("display", "none");
   		     }else if(newPw.length < 4 && newPw.length >0){
	   		        $('.pw_error').css("display", "inline-block");
	   		 }else if(newPw.length === 0){
	  		        $('.pw_error').css("display", "none");
         	}
   		}
   	
   		//새 비밀번호 확인
   		function checkNewPw2() {
   		     var newPw = $("#newPw").val();
   		     var newPw2 = $("#newPw2").val();
	   		 
           	 if(newPw === newPw2){
     		      	$('.pw_ok').css("display", "inline-block");
     		      	$('.pw_x').css("display", "none");
     		     	$("#btnPw").prop("disabled", false); // 활성화
     		 }else{
     				$('.pw_ok').css("display", "none");
     		        $('.pw_x').css("display", "inline-block");
     		       	$("#btnPw").prop("disabled", true); // 비활성화
     		       
     		 }
   		    
   		}
   		
   		//비밀번호 변경
   		$(function(){
	   		$("#btnPw").click(function(){
	   		 	var newPw2 = $("#newPw2").val();
	   		    $.ajax({
	   		        type:"POST",
	   		        url:"/whou/member/updatePw",
	   		        data: {pw:newPw2},
	   		     	error: function() {
		   		        alert("오류가 발생했습니다.\n다시 시도해주세요.");
		   		    },
	   		        success:function(result){
	   		        	if(result === "1"){
   		                	alert("비밀번호가 성공적으로 변경되었습니다.")
   		                	location.href = '/whou/member/mypage?load=3';
	   		        	}else{
	   		        		alert("오류가 발생했습니다.\n다시 시도해주세요.");
	   		        	}
	   		        }
	   		    });
	   		});
   		});
   		
   		var code3 = "";
   		//휴대폰 번호 인증
   		$(function(){
	   		$("#telChk").click(function(){
	   		    var tel = $("#tel").val();
	   		    
	   		    //유효성검사
	   			if(tel.length === 11 && check.test(tel)){
	   				$('.tel_ok').css("display", "inline-block");
	   				$('.tel_error').css("display", "none");
	   				
	   				$("#tel2").css("display", "inline-block");
	                $("#telChk2").css("display", "inline-block");
		   		    $.ajax({
		   		        type:"POST",
		   		        url:"/whou/member/telChk",
		   		        data: {tel:tel},
		   		        cache : false,
		   		        success:function(numStr){
		   		            if(numStr == "error"){ //실패시 
		   		            }else{//성공시        
		   		                code3 = numStr; // 성공하면 데이터저장
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
		$("#telChk2").click(function(){
			
		    if($("#tel2").val() == code3){ // 위에서 저장한값을 비교
		         $('.tel2_ok').css("display", "inline-block");
	   			 $('.tel2_error').css("display", "none");
	   			$("#btnDelete").prop("disabled", false); // 활성화
		         telchk = "성공";
		    }else{
		        $('.tel2_ok').css("display", "none");
   				$('.tel2_error').css("display", "inline-block");
   				$("#btnDelete").prop("disabled", true); // 비활성화
		    }
		});
   		
   		//회원탈퇴 버튼 클릭시
   		function deleteUser(){
   			if (confirm("정말 탈퇴하시겠습니까?")== true) {
   				//submit 제출하기
		    } else {
		    	//submit 제출 막기
		    	event.preventDefault();
		    }
   		}
   		
   		$(".book-button").click(function(){
   		  const book = $(".book-bg");
   		  const tabContent = $("#nav-tabContent");
   			const info = $(".chg-info-bg");
   		  const add = $("#nav-addInfo");

   		  if(book.is(":visible")){
   		    book.hide();
   		    tabContent.show();
   		  } else {
   			book.show();
   		    tabContent.hide();
   		 	info.hide();
   		 	add.hide();
   		  }
   		});
   		
   		$(".chg-info-button").click(function(){
   			
     		  const info = $(".chg-info-bg");
     		  const tabContent = $("#nav-tabContent");
     		  const book = $(".book-bg");
     		  const add = $("#nav-addInfo");
     		  
     		  if(info.is(":visible")){
     			info.hide();
     			book.hide();
     			add.hide();
     		    tabContent.show();
     		  } else {
     			info.show();
     		    tabContent.hide();
     		   book.hide();
     		  add.hide();
     		  }
     		});
   		
   		$(".add-info-button").click(function(){
   		  const add = $("#nav-addInfo");
   		  const tabContent = $("#nav-tabContent");
   		  const book = $(".book-bg");
   		  const info = $(".chg-info-bg");
   		  
   		  
   		  if(add.is(":visible")){
   			add.hide();
   			book.hide();
   			info.hide();
   		    tabContent.show();
   		  } else {
   			add.show();
   		    tabContent.hide();
   			book.hide();
			info.hide();
   		  }
   		});

   		$(".nav-left .nav-link").click(function() {
   		  const tab = $(this).data("tab");
   		  $(".book-bg").hide();
   		  $(".chg-info-bg").hide();
   		  $("#nav-addInfo").hide();
   		  $("#nav-tabContent").show();
   	
   		});
        </script>
	<script>
        $(document).on("click", function(event) {
            var clickedElement = event.target;
            var jobSearchLi = $(".jobSearchLi");
            var isJobListVisible = jobSearchLi.is(":visible");

            // majorList가 보일 때만 작동
            if (isJobListVisible) {
                // 클릭된 요소가 majorList 또는 majorList 하위 요소인 경우 아무 동작 없이 리턴
                if ($(clickedElement).closest(".jobSearchLi").length) {
                    return;
                }

                // 인풋 요소들의 값을 비웁니다. 단, majorList 보이고 있던 인풋창만 비우고 나머지는 그대로 유지
                $("input[name='job']").each(function() {
                    if ($(this).siblings(".jobSearchLi").is(":visible")) {
                        $(this).val("");
                    }
                });

                // majorList를 숨깁니다.
                jobSearchLi.empty().hide();
            }
        });

        // majorList가 보일 때 이벤트를 등록하고, 숨겨질 때 이벤트를 제거합니다.
        $(".jobSearchLi").on("show", function() {
            $(document).on("click", hideJobListOnClickOutside);
        }).on("hide", function() {
            $(document).off("click", hideJobListOnClickOutside);
        });

        // 전공 입력창 외부를 클릭했을 때 majorList를 숨기는 함수
        function hideJobListOnClickOutside(event) {
            var clickedElement = event.target;
            var jobSearchLi = $(".jobSearchLi");

            // 클릭된 요소가 majorList 또는 majorList 하위 요소인 경우 아무 동작 없이 리턴
            if ($(clickedElement).closest(".jobSearchLi").length) {
                return;
            }

            // 인풋 요소들의 값을 비웁니다. 단, majorList 보이고 있던 인풋창만 비우고 나머지는 그대로 유지
            $("input[name='job']").each(function() {
                if ($(this).siblings(".jobSearchLi").is(":visible")) {
                    $(this).val("");
                }
            });

            // majorList를 숨깁니다.
            jobSearchLi.empty().hide();
        }
     
        </script>
	<script>
	        // 페이지 로드 시점에 실행되는 함수
	        document.addEventListener('DOMContentLoaded', function() {
	        	item = document.querySelector('.carousel-item:first-child')
	          // 첫 번째 .carousel-item 요소에 'active' 클래스 추가
	          if(item !== null){	        	  
	        	  item.classList.add('active');
	          }
	        });
        </script>

</body>

</html>