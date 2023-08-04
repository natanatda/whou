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
        <script src="https://cdnjs.cloudflare.com/ajax/libs/three.js/r128/three.min.js" integrity="sha512-dLxUelApnYxpLt6K2iomGngnHO83iUvZytA3YjDUCjT0HDOHKXnVYdf3hU4JjM8uEhxf9nD1/ey98U3t2vZ0qQ==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
		<script src="https://code.jquery.com/jquery-3.7.0.min.js" ></script>
        <script src="https://kit.fontawesome.com/dbaea98925.js" crossorigin="anonymous"></script>
		
		<script src="resources/js/unpkg.com_gsap@3.12.1_dist_gsap.min.js"></script>
		<script src="resources/js/ThreeCSG.js"></script>
		<script src="https://unpkg.com/three@0.128.0/examples/js/controls/OrbitControls.js"></script>
        <script type="module" src="/whou/resources/js/whouModel2.js?ver=3"></script>
		<script src="/whou/resources/js/ai.js"></script>		
    </head>

<style>
.loading-wrap{width: 100%;
    height: 100vh;
    display: flex;
    align-items: center;
    justify-content: center;}
</style>
    <body>

     
 
    <div class="loading-wrap">
        <canvas class="webgl" ></canvas> <%-- ai --%>
    </div>
        

      
        <!-- Bootstrap core JS-->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
        <%-- 모델 --%>
        <script>
        	var modelCamera_x = ${brush.camera};
        	var modelCamera_y = 1;
        	var modelCamera_z = 3;
		 	var modelPath = '/whou/resources/whouModel/${brush.path_folder}/${brush.path_gltf}';
		 	
		 	var modelWidth = 200;
        	var modelHeight = 200;
		 	
// 		 	if('${brush.color}' != 'noColor'){
// 		 		var modelColor = '${brush.color}';
// 		 	}
// 		 	var modelScale_x = ${brush.scale_x};
// 		 	var modelScale_y = ${brush.scale_y};
// 		 	var modelScale_z = ${brush.scale_z};
		 	
// 		 	var modelPosition_x = ${brush.position_x};
// 		 	var modelPosition_y = ${brush.position_y};
// 		 	var modelPosition_z = ${brush.position_z};
		 	
// 		 	var modelRotation_x = ${brush.rotation_x};
// 		 	var modelRotation_y = ${brush.rotation_y};
// 		 	var modelRotation_z = ${brush.rotation_z};
		 	
// 		 	var modelMotion = ${brush.motion};
        	
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

     







        	
  
    </body>
</html>
