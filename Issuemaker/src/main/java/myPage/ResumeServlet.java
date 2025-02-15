package myPage;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.time.temporal.ChronoUnit;
import java.util.ArrayList;
import java.util.Base64;
import java.util.List;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import member.User;
import util.GetCookie;

@WebServlet("/resume")
public class ResumeServlet extends HttpServlet {
	ResumeService ser = ResumeService.getInstance();
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String no = req.getParameter("resumeNo");
		int resumeNo = Integer.parseInt(no);
		
		GetCookie co = GetCookie.getInstance();
        String currentUserId = co.getCookieUserId(req);
        req.setAttribute("currentUserId", currentUserId); 
        
		Resume resume = ser.selectResume(resumeNo);
		req.setAttribute("resume", resume);
		// 유저 정보
		req.setAttribute("user", ser.selectUser(resume.getUserId()));
		
		// 이력서 사진
		byte[] userPhoto = resume.getUserPhoto();
		String Photo;
		if (userPhoto != null) {
			Photo = Base64.getEncoder().encodeToString(userPhoto);
		} else {
			Photo = null;
		}
		req.setAttribute("photo", Photo);
		
		// 유저 이름
		String id = resume.getUserId();
		String userName = ser.selectUserName(id);
		req.setAttribute("userName", userName);
		
		// 희망 직무
		String type = resume.getJobType();
		req.setAttribute("type", type);
		
		// 경력
		List<WorkHistory> list = ser.selectWork(id);
		List<String> history = new ArrayList<>();
		for (WorkHistory l : list) {
			String exCom = l.getExCom();
			long yearsBetween = ChronoUnit.YEARS.between(l.getStartDate(), l.getEndDate());
			history.add(exCom + " " + yearsBetween);
		}
		req.setAttribute("history", history);
		
		// 최종학력
		School school = ser.selectSchool(id);
		req.setAttribute("school", school);
		
		// 자격증
		List<License> listLi = ser.selectLicense(id);
		req.setAttribute("listLi", listLi);

		req.getRequestDispatcher("/WEB-INF/views/mypage/resume.jsp").forward(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String action = req.getParameter("action");
		String num = req.getParameter("resumeNo");
		req.setAttribute("resumeNo", num);
		if (action.equals("수정")) {
			resp.sendRedirect("/resumesetting"); // 이력서 수정
		} else if (action.equals("삭제")) {
			Integer no = Integer.parseInt(req.getParameter("no"));
			ser.deleteResume(no);
			resp.sendRedirect("/userPage");
		}
	}
	
}
