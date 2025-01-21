<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>회원 정보 수정</title>
    <style>
        body {
            font-family: 'Arial', sans-serif;
            background-color: #f9f9f9;
            margin: 0;
            padding: 20px;
        }
        h2 {
            text-align: center;
            color: #333;
            margin-bottom: 20px;
        }
        .container {
            max-width: 600px;
            margin: auto;
            background: #fff;
            border-radius: 10px;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
            padding: 20px;
        }
        p.error {
            color: red;
            text-align: center;
        }
        label {
            display: block;
            margin: 10px 0 5px;
            font-weight: bold;
        }
        input[type="text"],
        input[type="password"],
        input[type="date"],
        input[type="tel"],
        input[type="email"] {
            width: 100%;
            padding: 10px;
            margin-bottom: 15px;
            border: 1px solid #ddd;
            border-radius: 5px;
            box-sizing: border-box;
        }
        input[type="submit"] {
            background-color: #6482B9;
            color: white;
            border: none;
            padding: 10px 15px;
            border-radius: 5px;
            cursor: pointer;
            width: 100%;
            transition: background-color 0.3s;
        }
        input[type="submit"]:hover {
            background-color: #4a6a9a;
        }
        .btn {
        	background-color: #fffff;
        	margin-top: 10px;
            color: #6482B9;
            border: none;
            padding: 10px 15px;
            border-radius: 5px;
            cursor: pointer;
            width: 100%;
            transition: background-color 0.3s;
        }
        .btn:hover {
 			 border: 2px solid #6482B9;
        }
    </style>
</head>
<body>
    <div class="container">
        <h2>회원 정보 수정</h2>
        <p class="error">${ errorMessage }</p>
        <form method="post">    
            <label for="userPw">비밀번호:</label>
            <input type="password" id="userPw" name="userPw" required>
        
            <label for="userPwOK">비밀번호 확인:</label>
            <input type="password" id="userPwOK" name="userPwOK" required>
        
            <label for="userName">이름:</label>
            <input type="text" id="userName" name="userName" value="${ userInfo.getUserName() }" required>
        
            <label for="userBirth">생년월일:</label>
            <input type="date" id="userBirth" name="userBirth" value="${ userInfo.getUserBirth() }" required>
        
            <label for="userPhone">전화번호:</label>
            <input type="tel" id="userPhone" name="userPhone" value="${ userInfo.getUserPhone() }" required>
        
            <label for="userEmail">이메일:</label>
            <input type="email" id="userEmail" name="userEmail" value="${ userInfo.getUserEmail() }" required>
        
            <label for="userAddress">주소:</label>
            <input type="text" id="userAddress" name="userAddress" value="${ userInfo.getUserAddress() }" required>
        	<br>
            <input type="submit" value="수정하기">
            <button type="button" class="btn" onclick="history.back()">뒤로가기</button>
        </form>
    </div>
</body>
</html>
