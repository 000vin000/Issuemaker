<%@page import="matching.ApplyService"%>
<%@page import="util.GetCookie"%>
<%@page import="matching.NoticeService"%>
<%@page import="member.Company"%>
<%@page import="matching.Notice" %>
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>공고 상세보기</title>
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            margin: 0;
            padding: 20px;
            background-color: #f4f4f4;
        }
        .container {
            max-width: 800px;
            margin: 0 auto;
            padding: 20px;
            background: #fff;
            border-radius: 8px;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
        }
        h2 {
            text-align: center;
            color: #333;
        }
        .card {
            background: #f9f9f9;
            border-radius: 5px;
            padding: 15px;
            margin-bottom: 20px;
            box-shadow: 0 1px 5px rgba(0, 0, 0, 0.1);
        }
        table {
            width: 100%;
            border-collapse: collapse;
            margin: 10px 0;
        }
        th, td {
            border: 1px solid #ddd;
            padding: 12px;
            text-align: left;
        }
        th {
            background-color: #e2e2e2;
        }
        a.button, button.button {
            background-color: #007BFF;
            color: white;
            padding: 10px 15px;
            text-decoration: none;
            border-radius: 5px;
            margin: 5px;
            border: none;
            cursor: pointer;
            transition: background-color 0.3s;
        }
        a.button:hover, button.button:hover {
            background-color: #0056b3;
        }
        hr {
            margin: 20px 0;
        }
        .notice-content {
            background: #fff;
            padding: 15px;
            border-radius: 5px;
            box-shadow: 0 1px 5px rgba(0, 0, 0, 0.1);
        }
        .footer {
            text-align: center;
            margin-top: 20px;
        }
    </style>
</head>
<body>

<div class="container">
    <h2>${ notice.title }</h2>
    <div class="card notice-details">
        <form method="post">
            <c:set var="noticeNo" value="${notice.no}" scope="session" />
            <table>
                <thead>
                    <tr>
                        <th colspan="2">${company.comName}</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td>연락처</td>
                        <td>${company.comPhone}</td>
                    </tr>
                    <tr>
                        <td>담당자</td>
                        <td>${company.managerEmail}</td>
                    </tr>
                    <tr>
                        <td>위치</td>
                        <td>${company.comAddress} ${' '} ${company.otherAddress}</td>
                    </tr>
                    <tr>
                        <td>사원수</td>
                        <td>${company.comSize}</td>
                    </tr>
                    <tr>
                        <td>사이트</td>
                        <td><a href="${company.comWeb}" target="_blank">${company.comWeb}</a></td>
                    </tr>
                    <tr>
                        <td>공고 기간</td>
                        <td>${notice.postDate} ~ ${notice.deadLine}</td>
                    </tr>
                </tbody>
            </table>
        </form>
    </div>
    <div class="card">
        <table>
            <thead>
                <tr>
                    <th>경력</th>
                    <th>급여</th>
                    <th>학력</th>
                    <th>전공</th>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <td>${notice.getExTermStr()}</td>
                    <td>${notice.getSalaryStr()}</td>
                    <td>${notice.getSchoolLevelStr()}</td>
                    <td>${notice.major}</td>
                </tr>
            </tbody>
        </table>
        <table>
            <thead>
                <tr>
                    <th>근무요일</th>
                    <th>직무</th>
                    <th>근무지역</th>
                    <th>자격증</th>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <td>${notice.workday}</td>
                    <td>${notice.jobType}</td>
                    <td>${company.comAddress}</td>
                    <td>
                        <c:forEach var="license" items="${licenses}">
                            <p>${license}</p>
                        </c:forEach>
                    </td>
                </tr>
            </tbody>
        </table>
    </div>
    <div class="card notice-content">
        <p>${notice.context}</p>
        <hr>
        <p>사업자등록번호 : ${company.comNo} <br> 대표자 : ${company.comCeo} <br>
        설립일 : ${company.comBirth}</p>
    </div>

	<div class="card">
		<% GetCookie co = GetCookie.getInstance();
			request.setAttribute("currentComId", co.getCookieUserId(request)); %>
   		<c:if test="${ currentComId == notice.comId }">
            <a href="/noticeSetting?no=${notice.no}" class="button">수정</a>
            <a href="/deleteNotice?no=${ notice.no }" class="button">삭제</a>
            <a href="/companyPage" class="button">목록으로 돌아가기</a>
    	</c:if>
    	
    </div>
	
    <div class="footer">
        <%
            // 사용자 아이디 종류 확인
            request.setAttribute("type", co.getCookieUserType(request));
            request.setAttribute("user", co.getCookieUserId(request));
        %>
        <c:if test="${ type == 0 || empty user }">
            <a href="/selectResume?noticeNo=${notice.no}" class="button">지원하기</a>
        </c:if>
        <c:if test="${ check }">
            <a href="/cancelApply?noticeNo=${notice.no}" class="button">지원 취소</a>
        </c:if>
    </div>
</div>

</body>
</html>
