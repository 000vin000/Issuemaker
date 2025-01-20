package matching;

import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import member.Company;
import myPage.Resume;



public interface NoticeMapper {
	@Insert("INSERT INTO notice (comId, title, context, postDate, deadLine, salary, jobType, exTerm, workday, type, schoolLevel, major, comLicense) " +
            "VALUES (#{comId}, #{title}, #{context}, #{postDate}, #{deadLine}, #{salary}, #{jobType}, #{exTerm}, #{workday}, #{type}, #{schoolLevel}, #{major}, #{comLicense})")
	int insert(NoticeForInsert notice);

	 @Update("UPDATE notice SET context = #{context}, deadLine = #{deadLine}" +
				"WHERE no = #{no}")
	 int update(Notice notice);

	 @Select("SELECT * FROM notice WHERE no = #{no}")
	 Notice getNoticeByNo(String no);
	 
	 @Select("SELECT type FROM guest WHERE id = #{id}")
	 int getType(String id);
	 
	 @Select("SELECT * FROM company WHERE comId = #{comId}")
	 Company selectCom(String comId);

	 @Select("SELECT * FROM notice WHERE comId = #{comId}")
	 Notice getNoticeById(String comId);


	 // 기업 이름 받아오기
	 @Select("SELECT comName FROM company WHERE comId = #{comId}")
	 String selectComName(@Param("comId") String comId);
	 
	 // 기업 지역 받아오기
	 @Select("SELECT comAddress FROM company WHERE comId = #{comId}")
	 String selectComAddress(@Param("comId") String comId);
	 
	 @Select("SELECT comLicense FROM notice WHERE comId = #{comId}")
	 List<String> getComLicenseByNoticeComId(String comId);


}
