package myPage;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.session.SqlSession;

import util.DBUtil;

public class ResumeService {
	private static final ResumeService instance = new ResumeService();
	private ResumeService() {}
	public static ResumeService getInstance() {
		return instance;
	}
	
	public Resume selectResume(int resumeNo) {
		try (SqlSession session = DBUtil.getSqlSession()) {
			ResumeMapper mapper = session.getMapper(ResumeMapper.class);
			
			Resume resume = mapper.selectResume(resumeNo);
			
			return resume;
		}
	}
	
	public String selectUserName(String userId) {
		try (SqlSession session = DBUtil.getSqlSession()) {
			ResumeMapper mapper = session.getMapper(ResumeMapper.class);
		
			return mapper.selectUserName(userId);
		}
	}
	
	public List<WorkHistory> selectWork(String userId) {
		try (SqlSession session = DBUtil.getSqlSession()) {
			ResumeMapper mapper = session.getMapper(ResumeMapper.class);
		
			List<WorkHistory> list = mapper.selectWork(userId);
			return list;
		}
	}
	
	public School selectSchool(String userId) {
		try (SqlSession session = DBUtil.getSqlSession()) {
			ResumeMapper mapper = session.getMapper(ResumeMapper.class);
		
			return mapper.selectSchool(userId);
		}
	}
	
	public List<License> selectLicense(String userId) {
		try (SqlSession session = DBUtil.getSqlSession()) {
			ResumeMapper mapper = session.getMapper(ResumeMapper.class);
		
			List<License> list = mapper.selectLicense(userId);
			return list;
		}
	}
}