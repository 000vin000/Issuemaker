<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>기업 정보 수정</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 20px;
        }
        h1 {
            text-align: center;
            color: #333;
        }
        form {
            background-color: white;
            max-width: 600px; /* 최대 너비 설정 */
            margin: 20px auto; /* 중앙 정렬 */
            padding: 20px;
            border-radius: 8px; /* 모서리 둥글게 */
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1); /* 그림자 효과 */
        }
        div {
            margin-bottom: 15px; /* 각 입력 필드 간격 */
        }
        label {
            display: block; /* 레이블을 블록으로 설정 */
            margin-bottom: 5px; /* 레이블과 입력 필드 간격 */
            color: #555; /* 레이블 색상 */
        }
        input[type="text"],
        input[type="password"],
        input[type="tel"],
        input[type="email"] {
            width: 100%; /* 전체 너비 사용 */
            padding: 10px; /* 패딩 추가 */
            border: 1px solid #ddd; /* 테두리 색상 */
            border-radius: 4px; /* 모서리 둥글게 */
            box-sizing: border-box; /* 패딩과 테두리를 포함한 너비 계산 */
        }
        input[type="submit"],
        button.cancel-button {
            background-color: #007bff; /* 버튼 배경색 */
            color: white; /* 버튼 글자색 */
            border: none; /* 테두리 제거 */
            padding: 10px 15px; /* 패딩 추가 */
            border-radius: 4px; /* 모서리 둥글게 */
            cursor: pointer; /* 커서 포인터로 변경 */
            font-size: 16px; /* 글자 크기 */
            width: 100%; /* 전체 너비 사용 */
        }
        input[type="submit"]:hover,
        button.cancel-button:hover {
            background-color: #0056b3; /* 마우스 오버 시 배경색 변경 */
        }
        .error-message {
            color: red; /* 오류 메시지 색상 */
            text-align: center; /* 중앙 정렬 */
            margin-bottom: 20px; /* 아래 여백 */
        }
    </style>
</head>
<body>
    <p class="error-message">${ errorMessage }</p>
    <form method="post">
        <h1>기업 정보 수정</h1>
        <div>
            <label for="pw">비밀번호</label>
            <input type="password" name="pw" id="pw" required>
        </div>
        
        <div>
            <label for="pwAgain">비밀번호 확인:</label>
            <input type="password" name="pwAgain" id="pwAgain" required>
        </div>

        <div>
            <label for="comPhone">전화번호</label>
            <input type="tel" name="comPhone" id="comPhone" value="${ comInfo.getComPhone() }" required>
        </div>
        
        <div>
            <label for="comCeo">대표자 이름</label>
            <input type="text" name="comCeo" id="comCeo" value="${ comInfo.getComCeo() }" required>
        </div>
        
        <div>
            <label for="managerEmail">담당자 이메일</label>
            <input type="email" name="managerEmail" id="managerEmail" value="${ comInfo.getManagerEmail() }" required>
        </div>
        
        <div>
            <label for="comAddress">주소</label>
            <input type="text" name="comAddress" id="comAddress" value="${ comInfo.getComAddress() }" required>
        </div>
        
        <div>
            <label for="otherAddress">상세주소</label>
            <input type="text" name="otherAddress" id="otherAddress" value="${ comInfo.getComAddress() }" required>
        </div>
        
        <div>
            <label for="comSize">사원수</label>
            <input type="text" name="comSize" id="comSize" value="${ comInfo.getComSize() }">
        </div>
        
        <div>
            <label for="comWeb">홈페이지</label>
            <input type="text" name="comWeb" id="comWeb" value="${ comInfo.getComWeb() }">
        </div>
        
        <div>
            <input type="submit" value="수정하기">
        </div>
        <div>
            <button type="button" class="cancel-button" onclick="window.history.back()">취소하기</button>
        </div>
    </form>
</body>
</html>
