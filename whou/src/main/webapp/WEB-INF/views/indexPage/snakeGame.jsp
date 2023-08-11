<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm" crossorigin="anonymous"></script>
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">
	<style>
		h1{
			font-weight: bold;
			padding:20px 5px;
		}
		.game{
			margin:20px;
		}
		.gamepage {
			background-color: black;
			width: 600px;
			height: 400px;
		}
		.btnGroup{
			display:felx;
			width:100%;
			justify-content: space-between;
		}
		#startBtn, #restartBtn{
			padding:10px 20px;
			magin:0px;
		}
		#startBtn:disabled {
			background-color: grey;
			border:0px;
			cursor: default;
		}
</style>
</head>
<body>
	<div class="game">
		<h1> 10점 이상 달성하여 프로젝트 구경해보세요 </h1>
		<div class="gamepage">
		    <canvas id="display" width="600" height="400"></canvas>
		</div>
		<div class="btnGroup">
			<button type="button" class="btn btn-danger" id="startBtn">Start</button>
			<button type="button" class="btn btn-danger" id="restartBtn">Restart</button>
		</div>
	 </div>

</body>
	<script>
		//세팅
		var display = document.getElementById('display');
		var context = display.getContext('2d');
		var width = 600;
		var height = 400;
		var pixelSize = 10;
		var snakeBody = [{x:10, y:10}, {x:10, y:11}, {x:10, y:12}, {x:10, y:13}, {x:10, y:14}, {x:10, y:15}, {x:10, y:16}, {x:10, y:17}, {x:10, y:18}, {x:10, y:19}];
		var snakeLength = 10;
		var directionX = 0;
		var directionY = 1;
		var mandu = {x:30, y:15};
		var notMandu1 = {x:30, y:30};
		var notMandu2 = {x:15, y:10};
		var notMandu3 = {x:5, y:20};
		var startBbtn = document.getElementById('startBtn');
		var restartBtn = document.getElementById('restartBtn');
		var score = 0;
		var snakeSpeed = 15;
	</script>
	
	<script>
		//게임
		function createSnake(){
		    context.fillStyle = "#7bed9f";
		    context.strokeStyle = "#2ed573";
		    for (var i = 0; i < snakeLength; i++){
		        context.fillRect(snakeBody[i].x*pixelSize, snakeBody[i].y*pixelSize, pixelSize, pixelSize);
		        context.strokeRect(snakeBody[i].x*pixelSize, snakeBody[i].y*pixelSize, pixelSize, pixelSize);
		    }
		}
		
		function createMandu(){
		    context.fillStyle = "#ffffff";
		    context.fillRect(mandu.x*pixelSize, mandu.y*pixelSize, pixelSize, pixelSize);
		}
		
		function createNotMandu(){
		    context.fillStyle = "#FF5C62";
		    context.fillRect(notMandu1.x*pixelSize, notMandu1.y*pixelSize, pixelSize, pixelSize);
		    context.fillStyle = "#FF5C62";
		    context.fillRect(notMandu2.x*pixelSize, notMandu2.y*pixelSize, pixelSize, pixelSize);
		    context.fillStyle = "#FF5C62";
		    context.fillRect(notMandu3.x*pixelSize, notMandu3.y*pixelSize, pixelSize, pixelSize);
		}
		
		function showScore(){
		    context.fillStyle = "#ced6e0";
		    context.font = '20px Arial';
		    context.fillText(`Score : `+score, 240, 25);
		}
		
		function showResult(){
		    context.fillStyle = "#FF2155";
		    context.font = '110px Arial';
		    context.fillText('YOU DIE',90,220);
		}
		
		function endGame(){
		    clearInterval(gameLoop);
		    showResult();
		}
		
		function game(){
		    
		    context.fillStyle = 'black';
		    context.fillRect(0, 0, width, height);
		    var xSize = (width/pixelSize);
		    var ySize = (height/pixelSize);
		    createSnake();
		    createMandu();
		    createNotMandu();
		    showScore();
		    
		    if(score > 9){
				alert('점수 달성! 축하합니다. 프로젝트 구경에 당청되셨습니다.');
				location='main';
		    }
		
		    // calculate snake's head location
		    snakeHeadX = snakeBody[snakeLength - 1].x + directionX;
		    snakeHeadY = snakeBody[snakeLength - 1].y + directionY;
		
		    if(snakeHeadX == -1 || snakeHeadX == xSize|| snakeHeadY == -1 || snakeHeadY == ySize){
		        endGame();
		    }
		    snakeBody.push({x:snakeHeadX, y:snakeHeadY});
		    
		    
		    // eat notMandu
		    if ((snakeHeadX === notMandu1.x && snakeHeadY === notMandu1.y) || (snakeHeadX === notMandu2.x && snakeHeadY === notMandu2.y) || (snakeHeadX === notMandu3.x && snakeHeadY === notMandu3.y)){
		    	endGame();
		    }
		    // when snake eat mandu
		    if (snakeHeadX === mandu.x && snakeHeadY === mandu.y){
		        mandu = {x: Math.floor(Math.random() * (xSize - 1) + 1), y: Math.floor(Math.random() * (ySize - 1) + 1)};
		        notMandu1 = {x: Math.floor(Math.random() * (xSize - 1) + 1), y: Math.floor(Math.random() * (ySize - 1) + 1)};
		        notMandu2 = {x: Math.floor(Math.random() * (xSize - 1) + 1), y: Math.floor(Math.random() * (ySize - 1) + 1)};
		        notMandu3 = {x: Math.floor(Math.random() * (xSize - 1) + 1), y: Math.floor(Math.random() * (ySize - 1) + 1)};
	            
		        snakeLength += 1;
		        score += 1;
		        increaseSpeed();
		    } else{
		        snakeBody.shift();
		    }
		    
		
		    // when snake eat itself
		    for(var i=0; i<snakeLength-1; i++){
		        if(snakeHeadX === snakeBody[i].x && snakeHeadY === snakeBody[i].y){
		            for(var j=0; j<i; j++){
		                snakeBody.shift();
		                snakeLength-=1;
		                score--;
		            }
		        }
		    }
		}
		
		function keyPush(evt) {
		    switch(evt.keyCode){
		        case 37: //왼쪽
		            if (!(directionX === 1 && directionY === 0)){
		                directionX = -1; directionY = 0;
		            }
		            break;
		        
		        case 38: //위쪽
		            if (!(directionX === 0 && directionY === 1)){
		                directionX = 0; directionY = -1;
		            }
		            break;
		
		        case 39: //오른쪽
		            if (!(directionX === -1 && directionY ===0)){
		                directionX = 1; directionY = 0;
		            }
		            break;
		        
		        case 40: //아래쪽
		            if (!(directionX === 0 && directionY === -1)){
		                directionX = 0; directionY = 1;
		            }
		            break;  
		    }
		}
		
		
		// 게임 초기화
		function gameinit(){
		    snakeBody = [{x:10, y:10}, {x:10, y:11}, {x:10, y:12}, {x:10, y:13}, {x:10, y:14}, {x:10, y:15}, {x:10, y:16}, {x:10, y:17}, {x:10, y:18}, {x:10, y:19}];
		    snakeLength = 10;
		    directionX = 0;
		    directionY = 1;
		    mandu = {x:30, y:15};
		    score = 0;
		    snakeSpeed = 15;
		}
		
		function startGame(){
		    gameinit();
		    startBtn.setAttribute('disabled', true);
		    gameLoop = setInterval(game, 1000/15);
		}
		
		function init(){
		    document.addEventListener('keydown', keyPush);
		    startBtn.addEventListener('click', startGame);
		    restartBtn.addEventListener('click', startGame);
		}
		
		init();
		
		
		
		// 속도 조절
		function increaseSpeed() {
			snakeSpeed +=(score%3); // 이동 속도를 increase
		    clearInterval(gameLoop); // 기존의 gameLoop를 멈춤
		    gameLoop = setInterval(game, 1000 /snakeSpeed); // 새로운 속도로 gameLoop를 실행
		}

		
	</script>
</html>