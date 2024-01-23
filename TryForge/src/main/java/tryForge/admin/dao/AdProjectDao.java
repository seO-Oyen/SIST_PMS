package tryForge.admin.dao;
// tryForge.admin.dao.AdProjectDao
import java.util.List;

import org.apache.ibatis.annotations.Param;

import tryForge.vo.Member;
import tryForge.vo.Project;
import tryForge.vo.Team;
import tryForge.vo.Team_Member;

public interface AdProjectDao {
	List<Project> projList();
	List<Member> PJMemList(String project_key);
	List<Member> schMem(@Param("member_name")String member_name);
	int insertPJ(Project insProject);
	int insertTeam(Team insTeam);
	int insertTm(int member_key);
	int uptCnt();
}
