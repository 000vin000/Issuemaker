<%@page import="myPage.Resume"%>
<%@page import="java.io.OutputStream"%>
<%@page import="javax.sql.DataSource"%>
<%@page import="javax.naming.InitialContext"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<jsp:include page="myPageHeader.jsp" />
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>${ resume.title }</title>
    <style>
        /* 전체적인 스타일 */
        body {
            font-family: 'Arial', sans-serif;
            line-height: 1.6;
            margin: 0;
            padding: 20px;
            background-color: #f9f9f9;
        }
        .main {
            max-width: 600px;
            margin: 0 auto;
            padding: 20px;
            background: #ffffff;
            border-radius: 10px;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
        }
        /* 헤더 스타일 */
        h1 {
            color: #4a4a4a;
            text-align: center;
            margin-bottom: 20px;
        }
        
        /* 이미지 스타일 */
        img {
            max-width: 150px;
            height: auto;
            border-radius: 8px;
            display: block;
            margin: 0 auto 20px;
        }
        
        /* 테이블 스타일 */
        table {
            width: 100%;
            border-collapse: collapse;
            margin: 20px 0;
            background: #fff;
        }
        
        td {
            padding: 15px;
            border: 1px solid #ddd;
        }
        
        table tr:nth-child(even) {
            background-color: #f9f9f9;
        }
        
        table tr:hover {
            background-color: #f1f1f1;
        }
        
        /* 버튼 스타일 */
        input[type="submit"], button {
            background-color: #6482B9;
            color: white;
            padding: 10px 15px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            transition: background-color 0.3s;
            margin: 5px;
        }
        
        input[type="submit"]:hover, button:hover {
            background-color: #4a6a9a;
        }
        
        /* 삭제 버튼 스타일 */
        .delete {
            background-color: #ff4d4d; /* 빨간색 배경 */
            color: white; /* 흰색 텍스트 */
        }
        
        .delete:hover {
            background-color: #ff1a1a; /* 호버 시 색상 */
        }
        
        /* 라벨 스타일 */
        label {
            font-weight: bold;
        }
        
        /* 폼 스타일 */
        form {
            margin: 20px 0;
            text-align: center;
        }
    </style>
</head>
<body>
    <div class="main">
        <h1>${ resume.title }</h1>
        <div>
            <c:if test="${not empty photo}">
                <img src="data:image/png;base64,${photo}" alt="이력서 사진"/>
            </c:if>
            <c:if test="${empty photo}">
                <label>사진이 없습니다.</label>
            </c:if>
        </div>

        <table>
            <tr>
                <td>이름</td>
                <td>${ userName }</td>
            </tr>
            <tr>
                <td>생년월일</td>
                <td>${ user.userBirth }</td>
            </tr>
            <tr>
                <td>전화번호</td>
                <td>${ user.userPhone }</td>
            </tr>
            <tr>
                <td>이메일</td>
                <td>${ user.userEmail }</td>
            </tr>
            <tr>
                <td>주소</td>
                <td>${ user.userAddress }</td>
            </tr>
        </table>

        <form action="/cover" method="GET">
            <label>자기소개서 </label>
            <input type="hidden" name="resumeNo" value="${ resume.no }">
            <input type="submit" value="다운로드">
            <p>${ errorcover }</p>
            <% session.removeAttribute("errorcover"); %>
        </form>

        <form action="/port" method="GET">
            <label>포트폴리오 </label>
            <input type="hidden" name="resumeNo" value="${ resume.no }">
            <input type="submit" value="다운로드">
            <p>${ errorport }</p>
            <% session.removeAttribute("errorport"); %>
        </form>

        <table>
            <tr>
                <td>희망 직무</td>
                <td>${ type }</td>
            </tr>
            <tr>
                <td>경력</td>
                <td>
                    <c:forEach var="his" items="${ history }">
                        <p>${ his }년</p>
                    </c:forEach>
                </td>
            </tr>
            <tr>
                <td>최종 학력</td>
                <td>${ school }</td>
            </tr>
            <tr>
                <td>자격증</td>
                <td>
                    <c:forEach var="li" items="${ listLi }">
                        <p>${ li }</p>
                    </c:forEach>
                </td>
            </tr>
        </table>

        <form method="post">
            <c:if test="${ currentUserId == resume.userId }">
                <input class="delete" type="submit" name="action" value="삭제">
                <input type="hidden" name="no" value="${ resume.no }">
                <button onclick="window.location.href='/userPage'">뒤로가기</button>
            </c:if>
        </form>
        
        
    </div>
</body>
</html>
