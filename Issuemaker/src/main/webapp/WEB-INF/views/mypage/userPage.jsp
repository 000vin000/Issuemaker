<%@page import="myPage.Resume"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<jsp:include page="myPageHeader.jsp" />
<!DOCTYPE html>
<html>
<head>
    <title>나의 이력서</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 20px;
            background-color: #f9f9f9; /* 배경색 */
        }
        h2 {
            text-align: center; /* 제목 중앙 정렬 */
            color: #333; /* 제목 색상 */
        }
        .resume-list {
            max-width: 600px; /* 최대 너비 설정 */
            margin: 0 auto; /* 중앙 정렬 */
            padding: 20px; /* 패딩 */
            background-color: white; /* 배경색 */
            border-radius: 8px; /* 모서리 둥글게 */
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1); /* 그림자 효과 */
        }
        .resume-item {
            margin: 10px 0; /* 항목 간격 */
            padding: 10px;
            border: 1px solid #ddd; /* 테두리 */
            border-radius: 5px; /* 모서리 둥글게 */
            transition: background-color 0.3s; /* 호버 애니메이션 */
        }
        .resume-item:hover {
            background-color: #f0f0f0; /* 호버 시 배경색 변경 */
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
    <h2>나의 이력서</h2>
    <div class="resume-list">
        <table style="width: 100%; border-collapse: collapse;">
            <thead>
                <tr>
                    <th style="border: 1px solid #ddd; padding: 10px; text-align: center;">번호</th>
                    <th style="border: 1px solid #ddd; padding: 10px; text-align: center;">제목</th>
                    <th style="border: 1px solid #ddd; padding: 10px; text-align: center;">등록일</th>
                </tr>
            </thead>
            <tbody>
                <c:set var="count" value="0"/>
                <c:forEach var="resume" items="${resume}">
                    <c:set var="count" value="${count + 1}"/>
                    <tr>
                        <td style="border: 1px solid #ddd; padding: 10px;">${count}</td>
                        <td style="border: 1px solid #ddd; padding: 10px;">
                            <a href="/resume?resumeNo=${resume.no}" style="text-decoration: none; color: black;">
                                ${resume.title}
                            </a>
                        </td>
                        <td style="border: 1px solid #ddd; padding: 10px;">${resume.postDate}</td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </div>
</form>
    <form action="/writeResume">
        <input type="submit" value="이력서 작성" class="submit-button">
    </form>
</body>
</html>
