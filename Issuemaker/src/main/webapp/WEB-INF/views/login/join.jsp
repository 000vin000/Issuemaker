<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>회원 가입</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
        }
        .container {
            background-color: #fff;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
            width: 300px;
            text-align: center;
        }
        h2 {
            color: #333;
            margin-bottom: 20px;
        }
        input[type="submit"], .btn {
            background-color: #007bff;
            color: white;
            border: none;
            padding: 10px;
            border-radius: 4px;
            cursor: pointer;
            width: 100%;
            margin: 10px 0;
            transition: background-color 0.3s;
        }
        input[type="submit"]:hover, .btn:hover {
            background-color: #0056b3;
        }
    </style>
</head>
<body>
    <div class="container">
        <h2>회원 가입</h2>
        <form action="/userJoin">
            <input type="submit" value="개인">
        </form>
        <form action="/companyJoin">
            <input type="submit" value="기업">
        </form>
        <hr>
        <button onclick="location.href='/index'" class="btn">홈으로 돌아가기</button>

    </div>
</body>
</html>
