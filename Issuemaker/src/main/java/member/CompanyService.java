package member;

import org.apache.ibatis.session.SqlSession;
import util.DBUtil;

public class CompanyService {
    private static final CompanyService instance = new CompanyService();
    
    private CompanyService() {}
    
    public static CompanyService getInstance() {
        return instance;
    }
    
    public int insert(Company company) {
        try (SqlSession session = DBUtil.getSqlSession()) {
            CompanyMapper mapper = session.getMapper(CompanyMapper.class);
            int row = mapper.insert(company);
            session.commit();
            return row;
        }
    }

    public int update(Company company) {
        try (SqlSession session = DBUtil.getSqlSession()) {
            CompanyMapper mapper = session.getMapper(CompanyMapper.class);
            int row = mapper.update(company); 
            session.commit();
            return row;
        }
    }
    
    public Company getCompanyBycomId(String comId) {
        try (SqlSession session = DBUtil.getSqlSession()) {
            CompanyMapper mapper = session.getMapper(CompanyMapper.class);
            return mapper.getCompanyBycomId(comId);
        }
    }



    
}
