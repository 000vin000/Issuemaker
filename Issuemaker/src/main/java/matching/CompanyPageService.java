package matching;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.session.SqlSession;

import util.DBUtil;

public class CompanyPageService {
	private static final CompanyPageService instance = new CompanyPageService();
	private CompanyPageService() {}
	public static CompanyPageService getInstance() {
		return instance;
	}
	
	public List<Notice> noticeByComId(String comId){
		try (SqlSession session = DBUtil.getSqlSession()) {
			CompanyPageMapper mapper = session.getMapper(CompanyPageMapper.class);
			
			List<Notice> list = mapper.noticeByComId(comId);
			
			return list;
		}
	}
	
	public int deleteNotice(int no) {
		try (SqlSession session = DBUtil.getSqlSession()) {
			CompanyPageMapper mapper = session.getMapper(CompanyPageMapper.class);
			
			int row = mapper.deleteNotice(no);
			session.commit();
			return row;
		}
	}
}
