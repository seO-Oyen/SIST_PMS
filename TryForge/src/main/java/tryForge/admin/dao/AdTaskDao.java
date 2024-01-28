package tryForge.admin.dao;

import java.util.List;

import org.apache.ibatis.annotations.Select;

import tryForge.vo.MemberSch;

public interface AdTaskDao {
	List<MemberSch> schTaskMem(MemberSch sch);
	
	@Select("select DISTINCT title from project order by title")
	List<String> getTitle();
}
