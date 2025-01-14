package matching;

import org.apache.ibatis.session.SqlSession;

import member.Company;
import member.CompanyMapper;
import util.DBUtil;

public class NoticeService {
	private static final NoticeService instance = new NoticeService();
	private NoticeService() {}
	
	public static NoticeService getInstance() {
		return instance;
	}
	
	public int insert(NoticeForInsert notice) {
		try (SqlSession session = DBUtil.getSqlSession()) {
			NoticeMapper mapper = session.getMapper(NoticeMapper.class);
			
			int row = mapper.insert(notice);
			
			session.commit();
			
			return row;
		}
	}
	
	 public int update(Notice notice) {
	        try (SqlSession session = DBUtil.getSqlSession()) {
	            NoticeMapper mapper = session.getMapper(NoticeMapper.class);
	            int row = mapper.update(notice); 
	            session.commit();
	            return row;
	        }
	    }
	    
	    public Notice getNoticeByNo(String no) {
	        try (SqlSession session = DBUtil.getSqlSession()) {
	            NoticeMapper mapper = session.getMapper(NoticeMapper.class);
	            return mapper.getNoticeByNo(no);
	        }
	    }
}
