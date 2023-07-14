<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://cdnjs.cloudflare.com/ajax/libs/three.js/r128/three.min.js" integrity="sha512-dLxUelApnYxpLt6K2iomGngnHO83iUvZytA3YjDUCjT0HDOHKXnVYdf3hU4JjM8uEhxf9nD1/ey98U3t2vZ0qQ==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>

<script src="../resources/js/unpkg.com_gsap@3.12.1_dist_gsap.min.js"></script>
<script src="../resources/js/ThreeCSG.js"></script>
<script src="https://unpkg.com/three@0.128.0/examples/js/controls/OrbitControls.js"></script>

</head>
<body>
<form action="/whou/kirby/main">
		<select name="name">
			<c:forEach var="custom" items="${dto2}">
				<option value="${custom.num}">${custom.name}</option>
			</c:forEach>
		</select>
		<input type="submit" value="변경" />
	</form>

 <canvas class="webgl"></canvas>

 <script>
 	var kirbyCamera = ${kirby.camera};
 	var kirbyPath = '../resources/kirby/${kirby.path_folder}/${kirby.path_gltf}';
 	
 	var isColor = 'no';
 	if('${kirby.color}' != isColor){
 		var kirbyColor = ${kirby.color};
 	}
 	
 	var kirbyScale_x = ${kirby.scale_x};
 	var kirbyScale_y = ${kirby.scale_y};
 	var kirbyScale_z = ${kirby.scale_z};
 	
 	var kirbyPosition_x = ${kirby.position_x};
 	var kirbyPosition_y = ${kirby.position_y};
 	var kirbyPosition_z = ${kirby.position_z};
 	
 	var kirbyRotation_x = ${kirby.rotation_x};
 	var kirbyRotation_y = ${kirby.rotation_y};
 	var kirbyRotation_z = ${kirby.rotation_z};
 	
 	var kirbyMotion = ${kirby.motion};
 </script>
 
<script type="module" src="../resources/js/kirby.js?ver=1"></script>
</body>
</html>