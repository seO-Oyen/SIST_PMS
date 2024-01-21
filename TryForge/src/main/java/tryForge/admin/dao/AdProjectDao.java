package tryForge.admin.dao;
// tryForge.admin.dao.AdProjectDao
import java.util.List;

import org.apache.ibatis.annotations.Param;

import tryForge.vo.Member;
import tryForge.vo.Project;

public interface AdProjectDao {
	List<Project> projList();
	List<Member> PJMemList(String project_key);
	List<Member> schMem(Member sch);
	
}
