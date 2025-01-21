<%@page import="matching.NoticeService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>검색</title>
<style>
    body {
        font-family: Arial, sans-serif;
        background-color: #f4f4f4;
        margin: 0;
        padding: 0;
    }
    header {
        background-color: #FFFFFF;
        color: black; /* 텍스트 색상 수정 */
        padding: 20px;
        display: flex;
        align-items: center;
        justify-content: center; /* 중앙 정렬 */
    }
    .logo {
        height: 50px; /* 로고 크기 조정 */
        display: block;
    }
    .container {
        max-width: 800px;
        margin: auto;
        background: white;
        padding: 20px;
        border-radius: 8px;
        box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
    }
    .header-content {
        display: flex;
        justify-content: space-between;
        align-items: center;
        width: 100%;
    }
    .search-form {
        display: flex;
        justify-content: space-between;
        margin-bottom: 20px;
    }
    .search-form select {
        padding: 8px; /* 검색유형의 패딩을 줄임 */
        border: 1px solid #ccc;
        border-radius: 4px;
        width: 20%; /* 검색유형의 너비를 줄임 */
    }
    .search-form input[type="search"] {
        padding: 10px;
        border: 1px solid #ccc;
        border-radius: 4px;
        width: 75%; /* 검색어 입력 칸을 넓게 설정 */
    }
    .search-form input[type="submit"] {
        padding: 10px 20px;
        background-color: #007bff;
        color: white;
        border: none;
        border-radius: 4px;
        cursor: pointer;
        transition: background-color 0.3s;
    }
    .search-form input[type="submit"]:hover {
        background-color: #0056b3;
    }
    h2 {
        text-align: center;
        color: #333;
    }
    h3 {
        color: #007bff;
    }
    ul {
        list-style-type: none;
        padding: 0;
    }
    li {
        background: #f9f9f9;
        margin: 10px 0;
        padding: 10px;
        border-radius: 4px;
        transition: background-color 0.3s;
    }
    li:hover {
        background: #e9ecef;
    }
    .logout-button, .class {
        display: flex;
        justify-content: center;
        align-items: center;
        margin: 10px 0;
    }
    .logout {
        background-color: #ffd677;
        border: none;
        padding: 10px 20px;
        cursor: pointer;
        transition: background-color 0.3s;
    }
    .logout:hover {
        background-color: #ffcc00;
    }
    .login-button {
        margin-left: auto; /* 오른쪽 끝으로 이동 */
    }
</style>
</head>
<body>
<div class="container">
    <header>
        <a href="/">
            <img src="${pageContext.request.contextPath}/images/logo.png" class="logo" alt="로고" />
        </a>
        <c:if test="${ !isLogIn }">
            <form class="login-button" action="/login">
                <input type="submit" value="로그인" class="login">
            </form>
        </c:if>
        <c:if test="${isLogIn}">
            <div class="logout-button">
                <form action="/logout">
                    <input type="submit" value="로그아웃" class="logout">
                </form>
                <form action="${check == 0 ? '/userPage' : '/companyPage'}">
                    <input type="submit" value="마이페이지">
                </form>
            </div>
        </c:if>
    </header>
    
    <form class="search-form" action="search" method="get">
        <select name="findType">
            <option value="">검색유형</option>
            <option value="1">직업별</option>
            <option value="2">지역별</option> 
        </select>
        <input type="search" id="keyword" name="keyword" placeholder="검색어를 입력하세요">
        <input type="submit" value="검색">
    </form>

    <div>
        <h2>검색 결과</h2>

        <!-- 직업별 검색 결과 출력 -->
        <c:if test="${not empty jobNotices}">
            <h3>직업별 검색 결과</h3>
            <ul>
                <c:forEach var="notice" items="${jobNotices}">
                    <li>${notice.jobType}<br>
                    <a href="/noticeDetail?noticeNo=${ notice.no }">${notice.getComName()} ${ notice.title } ${ notice.postDate }~${ notice.deadLine }</a> 
                    </li> 
                </c:forEach>
            </ul>
        </c:if>

        <!-- 지역별 검색 결과 출력 -->
        <c:if test="${not empty areaNotices}">
            <h3>지역별 검색 결과</h3>
            <ul>
                <c:forEach var="notice" items="${areaNotices}">
                    <li>
                    <a href="/noticeDetail?noticeNo=${ notice.no }">${ notice.jobType } ${notice.getComName()} ${ notice.title } ${notice.postDate} ~ ${notice.deadLine}</a>
                    </li> 
                </c:forEach>
            </ul>
        </c:if>

        <!-- 검색 결과가 없는 경우 출력 -->
        <c:if test="${empty jobNotices and empty areaNotices}">
            <p>검색 결과가 없습니다.</p>
        </c:if>
    </div>
</div>
</body>
</html>
