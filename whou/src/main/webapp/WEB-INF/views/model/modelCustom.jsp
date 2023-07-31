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
<script type="module" src="/whou/resources/js/whouModel.js?ver=2"></script>
<meta charset="UTF-8">
<title>whou</title>
</head>
<body>
<%@ include file="../header.jsp" %>  
    <section class="py-2 custom-main">      
		<div class="container custom-wrap">
			<div class="canvas-wrap">
				<canvas class="webgl"></canvas>
			</div>
			<div class="picker-wrap">
				<div>
					<div id="picker"></div>
				</div>
				
				<ul class="picker-btns">
					<li id="headColor">얼굴 색 변경</li>
					<li id="cheekColor">볼 색 변경</li>
					<li id="armColor">팔 색 변경</li>
					<li id="legColor">다리 색 변경</li>
					<li onclick="location='/whou/whouModel/modelCustomDelete'">초기화</li>
				</ul>
			
				<div class="back-btn" onclick="location='/whou/member/mypage'">돌아가기</div>
			</div>		
		</div>
	</section>

<script>
			var modelCamera_x = '0';
			var modelCamera_y = '0';
			var modelCamera_z = '10';
			
			var modelPath = '';
			
			var modelWidth = 700;
			var modelHeight = 700;
			// default 색상
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
			      url: "/whou/whouModel/modelCustomInsert",
			      method: "POST",
			      data: { head: selectedColor, arm: '${model.armColor}', cheek: '${model.cheekColor}', leg: '${model.legColor}' },
			      success: function(response) {
			    	  window.location.reload();
			      },
			      error: function(error) {
			        console.error("오류:", error); // 오류 처리
			      }
			    });
			    
			});
			 $("#armColor").click(function(){
			    $.ajax({
			      url: "/whou/whouModel/modelCustomInsert",
			      method: "POST",
			      data: { head: '${model.headColor}', arm: selectedColor, cheek: '${model.cheekColor}', leg: '${model.legColor}' },
			      success: function(response) {
			    	  window.location.reload();
			      },
			      error: function(error) {
			        console.error("오류:", error); // 오류 처리
			      }
			    });
			});
			 $("#cheekColor").click(function(){
			    $.ajax({
			      url: "/whou/whouModel/modelCustomInsert",
			      method: "POST",
			      data: { head: '${model.headColor}', arm: '${model.armColor}', cheek: selectedColor, leg: '${model.legColor}' },
			      success: function(response) {
			    	  window.location.reload();
			      },
			      error: function(error) {
			        console.error("오류:", error); // 오류 처리
			      }
			    });
			});
			 $("#legColor").click(function(){
			    $.ajax({
			      url: "/whou/whouModel/modelCustomInsert",
			      method: "POST",
			      data: { head: '${model.headColor}', arm: '${model.armColor}', cheek: '${model.cheekColor}', leg: selectedColor },
			      success: function(response) {
			    	  location.reload();
			      },
			      error: function(error) {
			        console.error("오류:", error); // 오류 처리
			      }
			    });
			});

</script>
		<%@ include file="../footer.jsp" %>
		<!-- Bootstrap core JS-->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>