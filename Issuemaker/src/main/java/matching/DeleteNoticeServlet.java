package matching;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import member.CompanyService;

@WebServlet("/deleteNotice")
public class DeleteNoticeServlet extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		Integer noticeNo = Integer.parseInt(req.getParameter("no"));
		
		CompanyPageService ser = CompanyPageService.getInstance();
		int row = ser.deleteNotice(noticeNo);
		resp.sendRedirect("/companyPage");
	}
}
