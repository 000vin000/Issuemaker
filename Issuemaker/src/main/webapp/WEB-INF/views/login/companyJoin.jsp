<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>기업 회원가입</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 20px;
            display: flex;
            justify-content: center;
            align-items: top;
        }

        .container {
            background: #fff;
            padding: 30px;
            border-radius: 8px;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
            width: 400px;
        }

        h2 {
            text-align: center;
            color: #333;
        }

        label {
            display: block;
            margin: 10px 0 5px;
            color: #555;
        }

        input[type="text"],
        input[type="password"],
        input[type="tel"],
        input[type="email"],
        input[type="date"],
        select {
            width: 100%;
            padding: 10px;
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
        }

        input[type="submit"]:hover, .btn:hover {
            background-color: #0056b3;
        }

        .error-message {
            color: red;
            text-align: center;
            margin-bottom: 10px;
        }
    </style>
</head>
<body>
    <div class="container">
        <h2>기업 회원가입</h2>
        <p class="error-message">${errorMessage}</p>
        <form method="post">
            <label for="comId">아이디</label>
            <input type="text" name="comId" id="comId" required>

            <label for="pw">비밀번호</label>
            <input type="password" name="pw" id="pw" required>

            <label for="pwAgain">비밀번호 확인</label>
            <input type="password" name="pwAgain" id="pwAgain" required>

            <label for="comName">기업명</label>
            <input type="text" name="comName" id="comName" required>

            <label for="comNo">사업자 등록번호</label>
            <input type="text" name="comNo" id="comNo" required>

            <label for="comPhone">전화번호</label>
            <input type="tel" name="comPhone" id="comPhone" required>

            <label for="comCeo">대표자 이름</label>
            <input type="text" name="comCeo" id="comCeo" required>

            <label for="managerEmail">담당자 이메일</label>
            <input type="email" name="managerEmail" id="managerEmail" required>

            <label for="comAddress">주소</label>
            <select name="comAddress" id="comAddress" required onchange="toggleOtherAddress()">
                <option value="">선택하세요</option>
                <c:if test="${not empty areas}">
                    <c:forEach var="area" items="${areas}">
                        <option value="${area}">${area}</option>
                    </c:forEach>
                </c:if>
            </select>

            <input type="text" name="otherAddress" id="otherAddress" placeholder="상세주소" <c:if test="${not empty areas}">required</c:if>><br>

            <label for="comBirth">설립일</label>
            <input type="date" name="comBirth" id="comBirth" required>

            <label for="comSize">사원수</label>
            <input type="text" name="comSize" id="comSize">

            <label for="comWeb">홈페이지</label>
            <input type="text" name="comWeb" id="comWeb">

            <input type="submit" value="가입">
            <button onclick="history.back()" class="btn">취소</button>
        </form>
    </div>
</body>
</html>
