<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>개인 회원가입</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            display: flex;
            justify-content: center;
            align-items: top;
            margin: 0;
            padding: 20px;
        }
        .container {
            background-color: #fff;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
            width: 400px;
            text-align: left;
            overflow-y: auto; /* 세로 스크롤 가능 */
        }
        h2 {
            color: #333;
            margin-bottom: 20px;
            text-align: center;
        }
        label {
            display: block;
            margin: 10px 0 5px;
        }
        input[type="text"],
        input[type="password"],
        input[type="date"],
        input[type="tel"],
        input[type="email"] {
            width: 100%;
            padding: 10px;
            margin-bottom: 15px;
            border: 1px solid #ccc;
            border-radius: 4px;
            box-sizing: border-box;
        }
        input[type="submit"], .btn {
            background-color: #007bff;
            color: white;
            border: none;
            padding: 10px;
            border-radius: 4px;
            cursor: pointer;
            width: 100%;
            margin-top: 10px;
            transition: background-color 0.3s;
        }
        input[type="submit"]:hover, .btn:hover {
            background-color: #0056b3;
        }
        .error-message {
            color: red;
            text-align: center;
            margin-bottom: 15px;
        }
    </style>
</head>
<body>
    <div class="container">
        <h2>개인 회원가입</h2>
        <p class="error-message">${errorMessage}</p>
        <form method="post">
            <label for="userId">아이디:</label>
            <input type="text" id="userId" name="userId" required>
            
            <label for="userPw">비밀번호:</label>
            <input type="password" id="userPw" name="userPw" required>
        
            <label for="userPwOK">비밀번호 확인:</label>
            <input type="password" id="userPwOK" name="userPwOK" required>
        
            <label for="userName">이름:</label>
            <input type="text" id="userName" name="userName" required>
        
            <label for="userBirth">생년월일:</label>
            <input type="date" id="userBirth" name="userBirth" required>
        
            <label for="userPhone">전화번호:</label>
            <input type="tel" id="userPhone" name="userPhone" required>
        
            <label for="userEmail">이메일:</label>
            <input type="email" id="userEmail" name="userEmail" required>
        
            <label for="userAddress">주소:</label>
            <input type="text" id="userAddress" name="userAddress" required>
        
            <input type="submit" value="가입하기">
            <button onclick="history.back()" class="btn">취소</button>
        </form>
    </div>
</body>
</html>
