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
    </style>
</head>
<body>
    <div class="container">
        <div class="title">
            <p>teamName = "whoU"</p>
            <p>subject = "자동추천"</p>
            <p>Name = [박승훈, 심은영, 정소진, 차상윤, 황윤지]</p>
        </div>
        <button class="button" onclick="location='/whou/main'">Home</button>
    </div>
   
</body>
</html>
