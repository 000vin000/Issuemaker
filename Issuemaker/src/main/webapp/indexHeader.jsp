<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!-- header.jsp -->
<html>
<head>
    <title>시작페이지</title>
    <style>
    	.link {
    		margin-right: 8em;  /* 오른쪽 여백 8em */
    	}
    	.logout-button {
    		padding: 10px 0;
    		display: flex;
    		justify-content: center;
    		align-items: center;
    	}
    	.title {
    		flex-grow: 1;
    		text-align: center;
    	}
    	.logout {
    		background-color: #ffd677;
    		border: none;
    		padding: 10px 20px;
    		cursor: pointer;
    		transition: background-color 0.3s;
    	}
    </style>
</head>
<body>
	<header>
	<a href="/">
		<img src="${pageContext.request.contextPath}/images/logo.png" alt="로고" />
	</a>
	<%
		// 쿠키 확인
		boolean isLogIn = false;
		Cookie[] cookies = request.getCookies();
		if (cookies != null) {
			for (Cookie c : cookies) {
				if ("user".equals(c.getName())) {
					isLogIn = true;
					break;
				} 
			}
		} 
		request.setAttribute("isLogIn", isLogIn);
	%>
		<c:if test="${ !isLogIn }">
			<form class="login-button" action="/login">
				<label>로그인</label>
	    		<input type="submit" name="type" value="개인회원" class="login"> <%-- 메인 화면으로- --%>
	    		<input type="submit" name="type" value="기업회원" class="login" > <%-- 메인 화면으로- --%>
	    	</form>
    	</c:if>
		<c:if test="${isLogIn}">
            <form class="logout-button" action="/logout">
                <input type="submit" value="로그아웃" class="logout">
            </form>
            <form action="/userPage">
            	<input type="submit" value="마이페이지">
            </form>
        </c:if>
        <nav>
            <a href="/index" class="link">채용정보</a>
            <a href="/area" class="link">지역별</a>
            <a href="/job" class="link">직업별</a>
        </nav>
    </header>
