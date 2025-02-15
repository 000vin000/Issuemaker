<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<jsp:include page="myPageHeader.jsp" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>이력서 작성</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 20px;
            background-color: #f4f4f4;
        }
        h2 {
        	text-align: center; /* 제목 중앙 정렬 */
            color: #333;
        }
        form {
            background-color: #fff;
            max-width: 600px; /* 최대 너비 설정 */
           	margin: 0 auto; /* 중앙 정렬 */
            padding: 20px;
            border-radius: 8px;
            margin: 0 auto; /* 중앙 정렬 */
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }
        div {
            margin-bottom: 15px;
        }
        label {
            display: block;
            margin-bottom: 5px;
            font-weight: bold;
        }
        input[type="text"],
        input[type="date"],
        input[type="file"],
        select {
            width: 100%;
            padding: 8px;
            border: 1px solid #ccc;
            border-radius: 4px;
            box-sizing: border-box;
        }
        input[type="submit"] {
            background-color: #6482B9;
            color: white;
            padding: 10px 15px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            transition: background-color 0.3s;
            margin: 5px;
        }
        input[type="submit"]:hover {
            background-color: #4a6a9a;
        }
        .licenseEntry {
            background-color: #f9f9f9;
            padding: 15px;
            border: 1px solid #ddd;
            border-radius: 4px;
            margin-top: 10px;
        }
        .scoreLabel {
            display: none;
        }
    </style>
<script>
	function toggleSchoolLevel() {
    	const typeRadios = document.getElementsByName('type');
    	const schoolLevelDiv = document.getElementById('schoolLevelDiv');
   	 	const majorLabel = document.getElementById('majorLabel');
   		const majorInput = document.getElementById('major');

   		// "대학교"가 선택되었는지 확인
   	    if (typeRadios[2].checked) {
   	        schoolLevelDiv.style.display = 'block'; // 보여주기
   	        majorLabel.style.display = 'block'; // 전공 레이블 보여주기
   	        majorInput.style.display = 'block'; // 전공 입력 필드 보여주기
   	    } 
   	    // "고등학교"가 선택되었는지 확인
   	    else if (typeRadios[1].checked) {
   	        schoolLevelDiv.style.display = 'none'; // 숨기기
   	        majorLabel.style.display = 'block'; // 전공 레이블 보여주기
   	        majorInput.style.display = 'block'; // 전공 입력 필드 보여주기
   	    } 
   	    // "초/중학교"가 선택되었을 때
   	    else {
   	        schoolLevelDiv.style.display = 'none'; // 숨기기
   	        majorLabel.style.display = 'none'; // 전공 레이블 숨기기
   	        majorInput.style.display = 'none'; // 전공 입력 필드 숨기기
   	    }
   	}
		
        function toggleScoreInput(radio) {
        	const licenseEntry = radio.closest('.licenseEntry');
            const scoreLabel = licenseEntry.querySelector('.scoreLabel');
            const scoreInput = licenseEntry.querySelector('.scoreInput');
            
            if (radio.value === "1") { // 어학시험 선택 시
                scoreLabel.style.display = 'block';
                scoreInput.style.display = 'block';
            } else { // 자격증/면허증 선택 시
                scoreLabel.style.display = 'none';
                scoreInput.style.display = 'none';
            }
        }
         
        function addLicenseEntry() {
            const licenseCount = document.getElementById("licenseCount");
            const count = parseInt(licenseCount.value);
                  
            const newEntry = document.createElement("div");
            newEntry.className = "licenseEntry";
            newEntry.innerHTML = `
                <label>자격 구분</label><br>
                <input type="radio" name="licenseType${count+1}" value="0" onclick="toggleScoreInput(this)">
                <label>자격증/면허증</label>
                <input type="radio" name="licenseType${count+1}" value="1" onclick="toggleScoreInput(this)">
                <label>어학시험</label><br>
                
                <label>자격증 이름</label><br>
                <input type="text" name="license${count+1}" placeholder="자격증 이름"><br>
                
                <label>취득일</label><br>
                <input type="date" name="acuisition${count+1}" placeholder="취득일"><br>
                
                <label class="scoreLabel" style="display: none;">점수</label>
                <input type="text" class="scoreInput" name="score${count+1}" style="display: none;"><br>
            `;
            
            document.getElementById("licenseContainer").appendChild(newEntry);
            licenseCount.value = count + 1; // licenseCount 업데이트
        }

    </script>
</head>
<body>
    <div><h2>이력서 작성</h2></div>
    <form method="post" enctype="multipart/form-data" class="result">
        <div>
            <label for="title">제목</label>
            <input type="text" name="title" id="title" required>
        </div>
        <br>
        <div>
            <label for="userPhoto">사진</label>
            <input type="file" name="userPhoto" id="userPhoto">
        </div>
        <br>
        <label for="workHistory">경력</label>
        <div class="licenseEntry">
            <label>경력회사</label>
            <input type="text" name="exCom" id="exCom" value="${workHistory.exCom}">
            
            <label>경력 시작일</label>
            <input type="date" name="startDate1" id="startDate" value="${workHistory.startDate}">
            
            <label>경력 종료일</label>
            <input type="date" name="endDate1" id="endDate" value="${workHistory.endDate}">
            
            <label for="jobType">직무</label>
            <select id="jobType" name="jobType1">
                <c:forEach var="job" items="${jobList}">
                    <option value="${job}" <c:if test="${job == workHistory.jobType}">selected</c:if>>${job}</option>
                </c:forEach>
            </select>
        </div>
        <br>
        <div>
            <label for="coverLetter">자기소개서</label>
            <input type="file" name="coverLetter" id="coverLetter" accept=".pdf">
        </div>
        <br>
        <label>학교구분</label>
        <div class="licenseEntry"> 
            <label for="type0"><input type="radio" id="type0" name="type" value="0" <c:if test="${school != null && school.type == 0}">checked</c:if> onclick="toggleSchoolLevel()">
            	초/중학교</label>
            <label for="type1"><input type="radio" id="type1" name="type" value="1" <c:if test="${school != null && school.type == 1}">checked</c:if> onclick="toggleSchoolLevel()">
            	고등학교</label>
            <label for="type2"><input type="radio" id="type2" name="type" value="2" <c:if test="${school != null && school.type == 2}">checked</c:if> onclick="toggleSchoolLevel()">
          		대학교</label>
            
            <label>상태</label>
            <input type="text" name="level" id="level" value="${school != null ? school.level : ''}" placeholder="졸업/중퇴/휴학/재학">
            
            <label>학교이름</label>
            <input type="text" name="schoolName" id="schoolName" value="${school != null ? school.schoolName : ''}">
            
            <div id="schoolLevelDiv" style="display: ${school != null && school.level == '대학교' ? 'block' : 'none'};">
                <label>대학구분</label>
                <input type="radio" id="schoolLevel0" name="schoolLevel" value="0"><c:if test="${school != null && school.schoolLevel == 0}">checked</c:if>
                <label for="schoolLevel0">석사</label>
                <input type="radio" id="schoolLevel1" name="schoolLevel" value="1"><c:if test="${school != null && school.schoolLevel == 1}">checked</c:if>
                <label for="schoolLevel1">박사</label>
                <input type="radio" id="schoolLevel2" name="schoolLevel" value="2"><c:if test="${school != null && school.schoolLevel == 2}">checked</c:if>
                <label for="schoolLevel2">2, 3년제</label>
                <input type="radio" id="schoolLevel3" name="schoolLevel" value="3"><c:if test="${school != null && school.schoolLevel == 3}">checked</c:if>
                <label for="schoolLevel3">4년제</label>
            </div>

            <label id="majorLabel" style="display: ${school != null ? 'block' : 'none'};">전공</label>
            <input type="text" id="major" name="major" style="display: ${school != null ? 'block' : 'none'};" value="${school != null ? school.major : ''}">
            
            <label>학력시작일</label>
            <input type="date" id="startDate" name="startDate" value="${school != null ? school.startDate : ''}">
            
            <label>학력종료일</label>
            <input type="date" id="endDate" name="endDate" value="${school != null ? school.endDate : ''}">
        </div>
        <br>
        <div>
            <label for="portfolio">포트폴리오</label>
            <input type="file" name="portfolio" id="portfolio">
        </div>
        <br>
        <div id="licenseContainer">  
            <input type="hidden" id="licenseCount" name="licenseCount" value="1">   
        <br>  
            <label for="license">자격증</label>    
            <div class="licenseEntry">

                <label>자격 구분</label>
                <label><input type="radio" name="licenseType0" value="0" onclick="toggleScoreInput(this)">
                자격증/면허증</label>
                <label><input type="radio" name="licenseType0" value="1" onclick="toggleScoreInput(this)">
                어학시험</label>
                
                <label>자격증 이름</label>
                <input type="text" name="license0" placeholder="자격증 이름">
                
                <label>취득일</label>
                <input type="date" name="acquisition0" placeholder="취득일">
                
                <label class="scoreLabel" style="display: none;">점수</label>
                <input type="text" class="scoreInput" name="score0" style="display: none;">
            </div>
            <button type="button" onclick="addLicenseEntry()">+ 자격증 추가</button>
        </div>
		<br>
        <div>
            <label for="salary">희망 연봉</label>
            <input type="text" name="salary">
        </div>
        <br>
	<div>
	 <input type="submit" value="이력서 등록">
	</div>
		
	</form>
</body>
</html>