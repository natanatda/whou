<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>

<link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
<!-- Bootstrap icons-->
<link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css" rel="stylesheet" />
<!-- Core theme CSS (includes Bootstrap)-->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-9ndCyUaIbzAi2FUVXJi0CjmCapSmO7SnpJef0486qhLnuZ2cdeRhO02iuK6FUUVM" crossorigin="anonymous">
<link rel="stylesheet" href="/whou/resources/css/style.css">
		
<!-- One of the following themes -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/@simonwep/pickr/dist/themes/classic.min.css"/> <!-- 'classic' theme -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/@simonwep/pickr/dist/themes/monolith.min.css"/> <!-- 'monolith' theme -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/@simonwep/pickr/dist/themes/nano.min.css"/> <!-- 'nano' theme -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/three.js/r128/three.min.js" integrity="sha512-dLxUelApnYxpLt6K2iomGngnHO83iUvZytA3YjDUCjT0HDOHKXnVYdf3hU4JjM8uEhxf9nD1/ey98U3t2vZ0qQ==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>

<script src="../resources/js/unpkg.com_gsap@3.12.1_dist_gsap.min.js"></script>
<script src="../resources/js/ThreeCSG.js"></script>
<script src="https://unpkg.com/three@0.128.0/examples/js/controls/OrbitControls.js"></script>
<!-- Modern or es5 bundle -->
<script src="https://cdn.jsdelivr.net/npm/@simonwep/pickr/dist/pickr.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@jaames/iro@5"></script>
<script src="https://kit.fontawesome.com/dbaea98925.js" crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-3.7.0.min.js"></script>
<meta charset="UTF-8">
<title>whou</title>
</head>
<body>
<%@ include file="../header.jsp" %>        
	        <!-- Header-->
	<header class="py-5">
		<div class="container px-5">
			<h2 class="page-title">custom</h2>
		</div>
	</header>
<script type="module" src="../resources/js/whouModel.js?ver=3"></script>
<div>
	<div style="display: flex; justify-content: center;">
		<div id="picker"> </div>
	</div>
	
	<div style="display: flex; justify-content: center;">
	
	<form action="/whou/whouModel/modelCustomInsert">
		<input type="text" id="head" name="headColor" value="${model.headColor}" />
		<input type="button" id="headColor"  value="얼굴 색 변경"/> 
		
		<input type="hidden" id="arm" name="armColor" value="${model.armColor}" />
		<input type="button" id="armColor"  value="팔 색 변경"/> 
		
		<input type="hidden" id="cheek" name="cheekColor" value="${model.cheekColor}" />
		<input type="button" id="cheekColor"  value="볼 색 변경"/> 
		
		<input type="hidden" id="leg" name="legColor" value="${model.legColor}" />
		<input type="button" id="legColor"  value="다리 색 변경"/> <br/>
		<div style="display: flex; justify-content: center;">
		<input type="submit" value="저장"/>
		<input type="button" value="초기화" onclick="location='/whou/whouModel/modelCustomDelete'"/> <br/>
		</div>
	</form>
	</div>
</div>
<hr/>
<div style="display: flex; justify-content: center;">
	<canvas class="webgl"></canvas>
</div>
<script>
var modelCamera = '0';
var modelPath = '';

// default 색상
if('${model.headColor}' === ''){
	var headColor = '#FF0080';
}else{
	headColor = '${model.headColor}';
}
if('${model.armColor}' === ''){
	var armColor = '#FF0080';
}else{
	armColor = '${model.armColor}';
}
if('${model.cheekColor}' === ''){
	var cheekColor = '#FF0080';
}else{
	cheekColor = '${model.cheekColor}';
}
if('${model.legColor}' === ''){
	var legColor = '#FF0080';
}else{
	legColor = '${model.legColor}';
}

	var colorPicker = new iro.ColorPicker("#picker", {
		    // Set the size of the color picker
		    width: 200,
		    // Set the initial color to pure red
		    color: "#f00"
		});
	 	//listen to a color picker's color:change event
		//color:change callbacks receive the current color
	 	var selectedColor = null;
		colorPicker.on('color:change', function(color) {
			 selectedColor = color.hexString; // 변경한 색상 저장하는 변수
		});
		
		 // log the current color as a HEX string
			 $("#headColor").click(function(){ 
			    $.ajax({
			      url: "/whou/whouModel/inputText",
			      method: "POST",
			      data: { selectedColor: selectedColor },
			      success: function(response) {
			        $("#head").val(response);
			      },
			      error: function(error) {
			        console.error("오류:", error); // 오류 처리
			      }
			    });
			    
			});
			 $("#armColor").click(function(){
			    $.ajax({
			      url: "/whou/whouModel/inputText",
			      method: "POST",
			      data: { selectedColor: selectedColor },
			      success: function(response) {
			    	armColor = response;
			        $("#arm").val(response);
			      },
			      error: function(error) {
			        console.error("오류:", error); // 오류 처리
			      }
			    });
			});
			 $("#cheekColor").click(function(){
			    $.ajax({
			      url: "/whou/whouModel/inputText",
			      method: "POST",
			      data: { selectedColor: selectedColor },
			      success: function(response) {
			        $("#cheek").val(response);
			      },
			      error: function(error) {
			        console.error("오류:", error); // 오류 처리
			      }
			    });
			});
			 $("#legColor").click(function(){
			    $.ajax({
			      url: "/whou/whouModel/inputText",
			      method: "POST",
			      data: { selectedColor: selectedColor },
			      success: function(response) {
			        $("#leg").val(response);
			      },
			      error: function(error) {
			        console.error("오류:", error); // 오류 처리
			      }
			    });
			});

</script>
		<footer class="container py-5">
			<div class="border-top border-bottom py-3">
				<ul class="footer-content">
					<li><a href="#!">개인정보처리방침</a></li>
					<li><a href="#!">이메일주소무단수집거부</a></li>
					<li><a href="#!">이용안내</a></li>
					<li><a href="#!">이용문의 및 오류제보</a></li>
					<li><a href="#!">English</a></li>
					<li><a href="#!">오픈API</a></li>
				</ul>
			</div>
			<div class="footer-address py-3">
				<p class="m-0">주소 : 서울특별시 관악구 봉천동 에그옐로우 14층</p>
				<p class="m-0">운영 : 한국직업능력연구원 국가진로교육연구센터</p>
				<p class="m-0">Copyright &copy; Your Website 2023</p>
			</div>
		</footer>

</body>
</html>