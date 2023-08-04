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
<form action="/whou/whouModel/modelMain">
		<select name="name">
			<c:forEach var="custom" items="${dto2}">
				<option value="${custom.num}">${custom.name}</option>
			</c:forEach>
		</select>
		<input type="submit" value="변경" />
	</form>

 <canvas class="webgl"></canvas>

 <script>
 	var modelCamera_x = ${model.camera};
 	var modelCamera_y = 5;
 	var modelCamera_z = 10;
 	var modelPath = '../resources/whouModel/${model.path_folder}/${model.path_gltf}';
 	
 	var isColor = 'no';
 	if('${model.color}' != isColor){
 		var modelColor = ${model.color};
 	}
 	
 	var modelScale_x = ${model.scale_x};
 	var modelScale_y = ${model.scale_y};
 	var modelScale_z = ${model.scale_z};
 	
 	var modelPosition_x = ${model.position_x};
 	var modelPosition_y = ${model.position_y};
 	var modelPosition_z = ${model.position_z};
 	
 	var modelRotation_x = ${model.rotation_x};
 	var modelRotation_y = ${model.rotation_y};
 	var modelRotation_z = ${model.rotation_z};
 	
 	var modelMotion = ${model.motion};
 	
 	if('${model2.headColor}' === ''){
		var headColor = '#F781F3';
	}else{
		headColor = '${model2.headColor}';
	}
	if('${model2.armColor}' === ''){
		var armColor = '#F781F3';
	}else{
		armColor = '${model2.armColor}';
	}
	if('${model2.cheekColor}' === ''){
		var cheekColor = '#DF0101';
	}else{
		cheekColor = '${model2.cheekColor}';
	}
	if('${model2.legColor}' === ''){
		var legColor = '#585858';
	}else{
		legColor = '${model2.legColor}';
	}
 	
 </script>
 
<script type="module" src="../resources/js/whouModel.js?ver=2"></script>
</body>
</html>