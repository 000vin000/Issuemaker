<%@page import="matching.NoticeService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!-- header.jsp -->
<html>
<head>
    <title>시작페이지</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f4f4f4;
        }
        header {
            background-color: #FFFFFF;
            color: black; /* 텍스트 색상 수정 */
            padding: 20px;
            display: flex;
            align-items: center;
            justify-content: space-between;
        }
        .logo {
            height: 50px; /* 로고 크기 조정 */
        }
        .logout-button, .login-button {
            display: flex;
            align-items: center;
        }
        .logout, .login {
            background-color: #4CAF50; /* 로그인 버튼 색상 변경 */
            border: none;
            padding: 10px 20px;
            cursor: pointer;
            transition: background-color 0.3s;
            margin-left: 10px;
        }
        .logout:hover, .login:hover {
            background-color: #45a049; /* 호버 시 배경색 변경 */
        }
        .search {
            display: flex;
            justify-content: center; /* 중앙 정렬 */
            align-items: center;
            margin: 0 auto; /* 중앙 정렬을 위한 마진 */
            flex-grow: 1; /* 남은 공간을 차지하게 */
        }
        .search select, .search input[type="search"] {
            padding: 10px;
            margin-right: 10px;
            border: 1px solid #ccc;
            border-radius: 4px;
        }
        .search input[type="submit"] {
            background-color: #28a745;
            color: white;
            border: none;
            padding: 10px 15px;
            cursor: pointer;
            border-radius: 4px;
            transition: background-color 0.3s;
        }
        .search input[type="submit"]:hover {
            background-color: #218838; /* 호버 시 배경색 변경 */
        }
        nav {
            display: flex; /* 가로로 정렬 */
            margin-left: 20px; /* 링크와 버튼 사이의 간격 */
        }
        .link {
            margin-right: 20px; /* 링크 간격 조정 */
            color: black; /* 링크 색상 */
            text-decoration: none;
            padding: 10px;
            transition: background-color 0.3s;
        }
        .link:hover {
            background-color: rgba(0, 0, 0, 0.1); /* 호버 시 배경색 변경 */
        }
    </style>
</head>
<body>
    <header>
        <a href="/index">
            <img src="${pageContext.request.contextPath}/images/logo.png" class="logo" alt="로고" />
        </a>
        <form class="search" action="search">
            <select name="findType">
                <option value="">검색유형</option>
                <option value="1">직업별</option> 
                <option value="2">지역별</option> 
            </select>
            <input type="search" id="keyword" name="keyword" placeholder="검색어 입력">
            <input type="submit" value="검색">
        </form>
        <nav>
            <a href="/index" class="link">채용정보</a>
            <a href="/area" class="link">지역별</a>
            <a href="/job" class="link">직업별</a>
        </nav>
        <%
            // 쿠키 확인
            NoticeService ser = NoticeService.getInstance();
            int check = 0;
            boolean isLogIn = false;
            Cookie[] cookies = request.getCookies();
            if (cookies != null) {
                for (Cookie c : cookies) {
                    if ("user".equals(c.getName())) {
                        isLogIn = true;
                        check = ser.getType(c.getValue());
                        break;
                    } 
                }
            } 
            request.setAttribute("check", check);
            request.setAttribute("isLogIn", isLogIn);
        %>
        <c:if test="${ !isLogIn }">
            <form class="login-button" action="/login">
                <input type="submit" value="로그인" class="login"> 
            </form>
        </c:if>
        <c:if test="${isLogIn}">
            <form class="logout-button" action="/logout">
                <input type="submit" value="로그아웃" class="logout">
            </form>
            <form action="${check == 0 ? '/userPage' : '/companyPage'}">
                <input type="submit" value="마이페이지" class="logout">
            </form>
        </c:if>
    </header>
</body>
</html>
