package matching;

import java.io.IOException;
import java.time.LocalDate;
import java.util.List;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import member.Company;
import member.CompanyService;

@WebServlet("/noticeDetail")
public class NoticeDetailServlet extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String noticeNo = req.getParameter("noticeNo");
	    NoticeService noticeService = NoticeService.getInstance();
	    Notice notice = noticeService.getNoticeByNo(noticeNo); 
	    System.out.println(notice.getComId());
	    String comId = notice.getComId();
	    CompanyService companyService = CompanyService.getInstance();
	    Company company = companyService.getCompanyBycomId(comId);
	    
	    ComLicenseService ser = ComLicenseService.getInstance();
	    List<String> list = ser.getComLicenseById(comId);
	    System.out.println(list);

	    req.setAttribute("notice", notice); 
	    req.setAttribute("company", company);
	    req.setAttribute("liList", list);
	    
		req.getRequestDispatcher("/WEB-INF/views/company/noticeDetail.jsp")
		.forward(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		//resp.sendRedirect("/noticeSetting");
	}
}
