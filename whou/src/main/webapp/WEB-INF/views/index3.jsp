<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>whoU</title>
    <script src="https://code.jquery.com/jquery-3.7.0.min.js" ></script>
    <script src="https://kit.fontawesome.com/dbaea98925.js" crossorigin="anonymous"></script>
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
            position:relative;
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


.target{position: absolute;
    top: 30px;
    right: 81px;transform: rotate3d(1, 1, 1, 57deg);
    width: 70px;
    height: 70px;}
    img{width:100%;}
    </style>
</head>
<body>
    <div class="container">
		<canvas id="canvas1" width="800" height="480"></canvas>
   	    <div class="target"><img src="/whou/resources/img/noun-target-308281.png" /></div>
    </div>
    <script>

    var canvas = document.getElementById("canvas1");
    var context = canvas.getContext("2d");
    var ballRadius = 15; // 공의 반지름 설정
    var g = 0.8;             // 중력 가속도
    var vx = 0, vy = 0;    // 속도
    var posX = 30, posY = canvas.height - 30; // 초기 위치를 캔버스 왼쪽 하단으로 변경

    var isRunning = false; // 실행 여부를 나타내는 플래그 변수
    var clickStartTime = 0; // 클릭 시작 시간
    var clickDuration = 0;  // 클릭 지속 시간

    // 초기에 공을 그려주는 함수
    function drawBall() {
        context.clearRect(0, 0, canvas.width, canvas.height);
        context.strokeRect(0, 0, canvas.width, canvas.height);

        context.beginPath();
        context.arc(posX, posY, ballRadius, 0, 2*Math.PI, true);
        context.stroke();
        context.closePath();
    }

    canvas.addEventListener('mousedown', function() {
        clickStartTime = new Date().getTime();
    });

    canvas.addEventListener('mouseup', function() {
        if (!isRunning) {
            isRunning = true;
            clickDuration = (new Date().getTime()) - clickStartTime;
            vx = 8 + clickDuration / 300; // 클릭 지속 시간에 따라 속도 증가
            vy = -10 - clickDuration / 150; // 초기 속도값 지정

            // 코드 실행되는 부분
              var intervalId = setInterval(function() {
                drawBall(); // 공 그리기 함수 호출

                vy = vy + g;     // 중력 가속도 계산

                posX = posX + vx;
                posY = posY + vy;
                
//                 if (posY >= canvas.height - 30) {
//                     vy = -vy * 0.8; // 바닥에 도달했을 때 반발력을 줌
//                 }
                
                // 충돌 감지 로직 추가
                var targetRect = target.getBoundingClientRect();
                var ballRect = canvas.getBoundingClientRect();
                
                if (posY + ballRect.top >= targetRect.top && posY + ballRect.top <= targetRect.bottom &&
                    posX + ballRect.left >= targetRect.left && posX + ballRect.left <= targetRect.right) {
                    location="/whou/main";
                }
                
                if (
                        posY >= canvas.height - ballRadius ||
                        posX >= canvas.width + ballRadius ||
                        posX <= -ballRadius
                      ) {
                        clearInterval(intervalId); // 공이 캔버스 밖으로 나가면 인터벌 종료
                        location.reload(); // 새로고침
                      }
                
            }, 1000/60);
        }
    });

    // 초기에 공을 그려줌
    drawBall();
    
    
    var target = document.querySelector(".target");
    var canvas = document.getElementById("canvas1");
    
    var currentPositionX = canvas.width- target.offsetWidth; // 좌우 위치 초기화
    var currentPositionY = 0; // 상하 위치 초기화
    var movingRight = true; // 초기에 오른쪽으로 움직이도록 설정
    var zigzagCounter = 0; // 지그재그 동작을 위한 카운터
    var zigzagStep = 2; // 좌우로 움직이는 거리 설정
    var zigzagDirection = 1; // 좌우로 움직이는 방향 설정

    function moveTarget() {
        target.style.left = currentPositionX + "px";
        target.style.top = currentPositionY + "px";

        // 지그재그 동작 추가
        if (zigzagCounter <= 0) {
            zigzagDirection = -zigzagDirection; // 방향 전환
            zigzagCounter = Math.random() * 100 + 50; // 랜덤한 카운터 설정
        }
        
        // 좌우로 움직임
        currentPositionX += zigzagStep * zigzagDirection;
        zigzagCounter--;

        // 위아래로 움직임
        if (movingRight) {
            currentPositionY += 2; // 아래로 움직임
            if (currentPositionY >= 440) {
                movingRight = false; // 아래 끝 도착 시 위로 변경
            }
        } else {
            currentPositionY -= 2; // 위로 움직임
            if (currentPositionY <= 0) {
                movingRight = true; // 위 끝 도착 시 아래로 변경
            }
        }
    }

    // 10밀리초마다 moveTarget() 함수 호출하여 target을 좌우로 움직이기
    setInterval(moveTarget, 5);



    </script>
</body>
</html>
