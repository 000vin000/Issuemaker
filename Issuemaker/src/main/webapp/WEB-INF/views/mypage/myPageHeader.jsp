<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- header.jsp -->
<html>
<head>
    <title>마이페이지</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f4f4f4;
        }
        header {
            background-color: #ffffff;
            color: #333;
            padding: 20px;
            display: flex;
            align-items: center;
            justify-content: space-between;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
        }
        .logo {
            height: 40px; /* 로고 크기 조정 */
            margin: 0 10px; /* 좌우 여백 */
        }
        .link {
            color: #333;
            text-decoration: none;
            padding: 10px 15px;
            border-radius: 5px;
            transition: background-color 0.3s, color 0.3s;
        }
        .link:hover {
            background-color: rgba(255, 255, 255, 0.2); /* 호버 시 배경색 변경 */
            color: #007BFF; /* 호버 시 글자색 변경 */
        }
        .title {
            flex-grow: 1;
            text-align: center;
            font-size: 35px;
            font-weight: bold;
            color: black; /* 제목 색상 */
        }
        .logout-button {
            display: flex;
            align-items: center;
            margin-left: auto; /* 오른쪽으로 이동 */
        }
        .logout {
            margin-left: 20px; /* 로그아웃 버튼과의 간격 */
            background-color: #ffd677;
            border: none;
            padding: 10px 20px;
            cursor: pointer;
            transition: background-color 0.3s;
            border-radius: 5px;
            font-weight: bold;
        }
        .logout:hover {
            background-color: #ffcc00; /* 호버 시 배경색 변경 */
        }
    </style>
</head>
<body>
    <header>
        <a href="/index">
            <img src="${pageContext.request.contextPath}/images/logo.png" alt="로고" class="logo" />
        </a>
        <nav>
            <a href="/userPage" class="link">이력서 관리</a>
            <a href="/noticeList" class="link">지원 내역</a>
        </nav>
       	<h1 class="title">마이페이지</h1>
        <form class="logout-button" action="/logout">
            <a href="/changeUserInfo" class="link">회원정보 수정</a>
            <input type="submit" value="로그아웃" class="logout"> 
        </form>
    </header>
</body>
</html>
