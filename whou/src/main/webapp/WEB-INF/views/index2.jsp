<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>whoU</title>
    <script src="https://code.jquery.com/jquery-3.7.0.min.js" ></script>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f0f0f0;
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }
        .container {
            background-color: white;
            border-radius: 10px;
            padding: 20px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            text-align: center;
        }
        .title {
            font-size: 24px;
            font-weight: bold;
            margin-bottom: 10px;
        }
        .button-group {
            display: flex;
            justify-content: space-between;
            margin-top: 20px;
        }
        .button {
            background-color: #5a3fff;
            color: white;
            border: none;
            border-radius: 5px;
            padding: 10px 20px;
            cursor: pointer;
        }
        .input{
            border: 0;
    	font-size: 24px;
	    font-weight: bold;
	    margin-bottom: 10px;
	    text-align: center;
    }
    input:focus {outline: none;}
    input:active {
    outline: none;
}
#realBtn{display:none;}

.bar{width:10px;height:500px;border-bottom:3px solid red;margin:0 auto;transform: rotate(180deg);}
.innerBar{width:10px;background: pink;}
.clickBar{width:500px; height:40px;background: red;position:relative;}
.pointDiv{width:40px; height:40px;background: green;margin:0 auto;}
.point{border-radius: 50%;width:20px;height:20px;background:#ddd;position:absolute;top: 10px;left: 0;}
    </style>
</head>
<body>
    <div class="container">
    <p>선에 도달하시면 페이지가 이동됩니다.</p>
        <div class="bar">
         	<div class="innerBar"></div>
        </div>
    	<div class="clickBar">
    		<div class="pointDiv"></div>
    		<div class="point"></div>
    	</div>
    	    <button class="stopBtn">클릭</button>
    </div>

    <script>
    const pointDiv = document.querySelector('.pointDiv');
    const point = document.querySelector('.point');
    const clickBar = document.querySelector('.clickBar');
    const stopButton = document.querySelector('.stopBtn');
    
    const pointDivWidth = pointDiv.offsetWidth;
    const clickBarWidth = clickBar.offsetWidth;
    document.addEventListener('DOMContentLoaded', () => {
        pointDiv.style.left = '0px';
        point.style.left = '0px';
        
        let direction = 10;
        
        setInterval(() => {
            let currentLeft = parseFloat(point.style.left);
            currentLeft += direction;
            
            if (currentLeft >= clickBarWidth - pointDivWidth) {
                direction = -10;
            } else if (currentLeft <= 0) {
                direction = 10;
            }
            
            point.style.left = currentLeft + 'px';
            
        }, 20);      
    });
    
    stopButton.addEventListener('click', () => {
        const pointDivLeft = "230";
        const pointDivRight = "270"
        
        const pointLeft = parseFloat(point.style.left)-10;
        
        console.log(pointDivLeft);
        console.log(pointDivRight);
        console.log(pointLeft);
        
        const innerBar = document.querySelector('.innerBar');
        if (pointDivLeft <= pointLeft && pointLeft <= pointDivRight) {
           
            const currentHeight = parseFloat(innerBar.style.height) || 0; // Get the current height
            
            const newHeight = currentHeight + 16.6667; // Increase the height by 20%
            innerBar.style.height = newHeight +"%"; // Set the new height with units
           
            if(newHeight >= 100){
            	location="/whou/main";
            }
            console.log("야호");
        } else {
        	 innerBar.style.height = 0;
        	 console.log("메롱");
        }
   });

    </script>
</body>
</html>
