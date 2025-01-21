package matching;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

public interface CompanyPageMapper {
	@Select("SELECT * FROM notice where comId = #{comId}")
	List<Notice> noticeByComId(@Param("comId") String comId);
	
	@Delete("DELETE FROM notice WHERE no = #{no}")
	int deleteNotice(@Param("no") int no);
}
