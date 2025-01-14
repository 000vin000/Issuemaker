<%@page import="member.Company"%>
<%@ page import="matching.Notice" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공고 상세보기</title>
</head>
<body>

<div class="notice-details">
    <div class="notice-header">
        ${company.comName} / ${notice.title}
    </div>
    <div class="notice-info">
        공고시작기간: ${notice.postDate} ~ 공고마감기간: ${notice.deadLine} <br>

    </div>
    <div class="notice-info">
        경력: ${notice.exTerm} <br>
        급여: ${notice.salary} <br>
        학력:  ${notice.schoolLevel}<br>
        전공: ${notice.major} <br>
        
    </div>
     <form action="/noticeSetting">
        <input type="submit" value="수정">
        <button type="button" onclick="window.location.href='noticeSetting.jsp'">취소</button>
    </form>
    <div class="notice-info">
        근무요일: ${notice.workday} <br>
        근무형태: ${notice.jobType} <br>
        근무지역: ${company.comAddress} <br>
        자격증: ${comLicense.comLicense}
    </div>
</div>

<div class="notice-content">
    <h3>공고내용</h3>
    <p>${notice.context} </p>
</div>
<form method="post">
	<input type="hidden" name="no" value="${ notice.no }">
</form>
</body>
</html>