<%@page import="matching.Notice"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<jsp:include page="companyPageHeader.jsp" />
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>나의 공고</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 0;
        }

        h2 {
            text-align: center;
            color: black;
            margin-bottom: 20px;
        }

        .notice-table {
            max-width: 600px; /* 최대 너비 설정 */
            margin: 0 auto; /* 중앙 정렬 */
            padding: 20px; /* 패딩 */
            background-color: white; /* 배경색 */
            border-radius: 8px; /* 모서리 둥글게 */
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1); /* 그림자 효과 */
        }

        .notice-table th, .notice-table td {
            padding: 10px;
            text-align: center; 
        }

        .notice-table th {
            background-color: #f0f0f0; /* 헤더 배경색 */
        }

        .notice-table tr:hover {
            background-color: #f0f8ff; /* 호버 시 배경색 변경 */
        }

        .notice-link {
            text-decoration: none;
            color: #333;
            font-size: 16px;
        }

        .notice-link:hover {
            color: #007BFF;
        }

        .submit-button {
            display: block; /* 블록 요소로 설정 */
            width: 200px; /* 버튼 너비 설정 */
            margin: 20px auto; /* 중앙 정렬 */
            padding: 10px; /* 패딩 */
            background-color: #6482B9; /* 버튼 배경색 */
            color: white; /* 버튼 텍스트 색상 */
            border: none; /* 테두리 제거 */
            border-radius: 5px; /* 모서리 둥글게 */
            cursor: pointer; /* 마우스 커서 변경 */
            text-align: center; /* 텍스트 중앙 정렬 */
            transition: background-color 0.3s; /* 호버 애니메이션 */
        }
        .submit-button:hover {
            background-color: #4a6a9a; /* 호버 시 색상 변경 */
        }

    </style>
</head>
<body>
    <form>
        <h2>나의 공고</h2>
        <table class="notice-table">
            <thead>
                <tr>
                    <th style="border: 1px solid #ddd; padding: 10px; text-align: left;">번호</th>
                    <th style="border: 1px solid #ddd; padding: 10px; text-align: left;">제목</th>
                    <th style="border: 1px solid #ddd; padding: 10px; text-align: left;">게시일</th>
                    <th style="border: 1px solid #ddd; padding: 10px; text-align: left;">마감일</th>
                </tr>
            </thead>
            <tbody>
                <c:set var="count" value="0"/>
                <c:forEach var="notice" items="${notice}">
                    <c:set var="count" value="${count + 1}"/>
                    <tr>
                        <td style="border: 1px solid #ddd; padding: 10px;">${count}</td>
                        <td style="border: 1px solid #ddd; padding: 10px;">
                        	<a class="notice-link" href="/noticeDetail?noticeNo=${notice.no}" style="text-decoration: none; color: black;">
                        		${notice.title}</a></td>
                        <td style="border: 1px solid #ddd; padding: 10px;">${notice.postDate}</td>
                        <td style="border: 1px solid #ddd; padding: 10px;">${notice.deadLine}</td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </form>
        <form action="/noticeNew">
            <input type="submit" value="공고등록" class="submit-button">
        </form>
</body>
</html>
